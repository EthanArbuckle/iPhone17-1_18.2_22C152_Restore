@interface PHMemoryDeleteRequest
- (BOOL)clientEntitledToMemoryMutation;
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (PHMemoryDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4;
@end

@implementation PHMemoryDeleteRequest

- (BOOL)clientEntitledToMemoryMutation
{
  return self->_clientEntitledToMemoryMutation;
}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = [a4 managedObjectContext];
  [v6 deleteObject:v5];
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PHMemoryDeleteRequest *)self clientEntitledToMemoryMutation])
  {
    v10.receiver = self;
    v10.super_class = (Class)PHMemoryDeleteRequest;
    id v11 = 0;
    BOOL v7 = [(PHObjectDeleteRequest *)&v10 validateForDeleteManagedObject:v6 error:&v11];
    id v8 = v11;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericEntitlementError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v7 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v7) {
    *a4 = v8;
  }
LABEL_7:

  return v7;
}

- (PHMemoryDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a5;
  v11.receiver = self;
  v11.super_class = (Class)PHMemoryDeleteRequest;
  v9 = [(PHObjectDeleteRequest *)&v11 initWithXPCDict:a3 request:a4 clientAuthorization:v8];
  if (v9) {
    v9->_clientEntitledToMemoryMutation = [v8 photoKitEntitledFor:*MEMORY[0x1E4F8C5C0]];
  }

  return v9;
}

@end