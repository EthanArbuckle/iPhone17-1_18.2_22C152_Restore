@interface PHTrashableObjectDeleteRequest
+ (id)deleteRequestForObject:(id)a3;
+ (id)deleteRequestForObject:(id)a3 operation:(int64_t)a4;
- (BOOL)isClientEntitledToExpunge;
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (PHTrashableObjectDeleteRequest)initWithUUID:(id)a3 objectID:(id)a4 operation:(int64_t)a5;
- (PHTrashableObjectDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (int64_t)operation;
- (void)encodeToXPCDict:(id)a3;
@end

@implementation PHTrashableObjectDeleteRequest

- (BOOL)isClientEntitledToExpunge
{
  return self->_clientEntitledToExpunge;
}

- (int64_t)operation
{
  return self->_operation;
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHTrashableObjectDeleteRequest;
  id v15 = 0;
  LODWORD(v7) = [(PHObjectDeleteRequest *)&v14 validateForDeleteManagedObject:v6 error:&v15];
  id v8 = v15;
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 canPerformDeleteOperation] & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v9 = [NSString stringWithFormat:@"Invalid delete"];
      v17[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      uint64_t v11 = objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v10);

      LOBYTE(v7) = 0;
      id v8 = (id)v11;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  if ([(PHTrashableObjectDeleteRequest *)self operation] == 1 && !self->_clientEntitledToExpunge)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericEntitlementError");

    LOBYTE(v7) = 0;
    id v8 = (id)v12;
  }
  if (a4 && (v7 & 1) == 0) {
    *a4 = v8;
  }

  return (char)v7;
}

- (void)encodeToXPCDict:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHTrashableObjectDeleteRequest;
  id v4 = a3;
  [(PHObjectDeleteRequest *)&v5 encodeToXPCDict:v4];
  xpc_dictionary_set_int64(v4, "deleteOperation", self->_operation);
}

- (PHTrashableObjectDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PHTrashableObjectDeleteRequest;
  v10 = [(PHObjectDeleteRequest *)&v13 initWithXPCDict:v8 request:a4 clientAuthorization:v9];
  if (v10)
  {
    v10->_clientEntitledToExpunge = [v9 photoKitEntitledFor:*MEMORY[0x1E4F8C5A8]];
    v10->_operation = xpc_dictionary_get_int64(v8, "deleteOperation");
    uint64_t v11 = v10;
  }

  return v10;
}

- (PHTrashableObjectDeleteRequest)initWithUUID:(id)a3 objectID:(id)a4 operation:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PHTrashableObjectDeleteRequest;
  id v6 = [(PHObjectDeleteRequest *)&v10 initWithUUID:a3 objectID:a4];
  v7 = v6;
  if (v6)
  {
    v6->_operation = a5;
    id v8 = v6;
  }

  return v7;
}

+ (id)deleteRequestForObject:(id)a3 operation:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  id v8 = [v6 uuid];
  id v9 = [v6 objectID];

  objc_super v10 = (void *)[v7 initWithUUID:v8 objectID:v9 operation:a4];

  return v10;
}

+ (id)deleteRequestForObject:(id)a3
{
  return (id)[a1 deleteRequestForObject:a3 operation:0];
}

@end