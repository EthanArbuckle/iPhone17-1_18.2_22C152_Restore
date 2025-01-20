@interface PHMomentShareDeleteRequest
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (PHMomentShareDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (int64_t)operation;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
- (void)encodeToXPCDict:(id)a3;
- (void)setOperation:(int64_t)a3;
@end

@implementation PHMomentShareDeleteRequest

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int64_t v7 = [(PHMomentShareDeleteRequest *)self operation];
  if (v7 == 1)
  {
    v8 = [v6 managedObjectContext];
    [v8 deleteObject:v9];
  }
  else if (!v7)
  {
    [v9 trash];
  }
}

- (void)encodeToXPCDict:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHMomentShareDeleteRequest;
  id v4 = a3;
  [(PHObjectDeleteRequest *)&v5 encodeToXPCDict:v4];
  xpc_dictionary_set_int64(v4, "deleteOperation", self->_operation);
}

- (PHMomentShareDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHMomentShareDeleteRequest;
  id v9 = [(PHObjectDeleteRequest *)&v11 initWithXPCDict:v8 request:a4 clientAuthorization:a5];
  if (v9) {
    v9->_operation = xpc_dictionary_get_int64(v8, "deleteOperation");
  }

  return v9;
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHMomentShareDeleteRequest;
  id v16 = 0;
  unsigned int v7 = [(PHObjectDeleteRequest *)&v15 validateForDeleteManagedObject:v6 error:&v16];
  id v8 = v16;
  if (v7)
  {
    if ([(PHMomentShareDeleteRequest *)self operation]
      || [v6 trashedState] != 1)
    {
      BOOL v13 = 1;
      goto LABEL_9;
    }
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v10 = [NSString stringWithFormat:@"Moment share is already in trash state"];
    v18[0] = v10;
    objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v12 = objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v11);

    id v8 = (id)v12;
  }
  if (a4)
  {
    id v8 = v8;
    BOOL v13 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_9:

  return v13;
}

@end