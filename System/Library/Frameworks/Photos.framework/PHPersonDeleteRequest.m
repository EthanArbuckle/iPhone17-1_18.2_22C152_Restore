@interface PHPersonDeleteRequest
- (BOOL)force;
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (PHPersonDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
- (void)encodeToXPCDict:(id)a3;
- (void)setForce:(BOOL)a3;
@end

@implementation PHPersonDeleteRequest

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)encodeToXPCDict:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHPersonDeleteRequest;
  id v4 = a3;
  [(PHObjectDeleteRequest *)&v5 encodeToXPCDict:v4];
  xpc_dictionary_set_BOOL(v4, "force", self->_force);
}

- (PHPersonDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHPersonDeleteRequest;
  v9 = [(PHObjectDeleteRequest *)&v11 initWithXPCDict:v8 request:a4 clientAuthorization:a5];
  if (v9) {
    v9->_force = xpc_dictionary_get_BOOL(v8, "force");
  }

  return v9;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHPersonDeleteRequest;
  id v16 = 0;
  unsigned int v7 = [(PHObjectDeleteRequest *)&v15 validateForDeleteManagedObject:v6 error:&v16];
  id v8 = v16;
  if (!v7)
  {
    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v9 = v6;
  if (-[PHPersonDeleteRequest force](self, "force") || [v9 verifiedType])
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = [v9 personUUID];
    uint64_t v13 = objc_msgSend(v11, "ph_errorWithCode:localizedDescription:", 3300, @"Deleting an unverified person (uuid = %@) is not permitted", v12);

    BOOL v10 = 0;
    id v8 = (id)v13;
  }

  if (a4)
  {
LABEL_9:
    if (!v10) {
      *a4 = v8;
    }
  }
LABEL_11:

  return v10;
}

@end