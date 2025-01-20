@interface MFContactsSearchOperation
+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5;
- (MFContactsSearchManager)owner;
- (NSNumber)taskID;
- (NSString)sendingAddress;
- (NSString)text;
- (unint64_t)type;
@end

@implementation MFContactsSearchOperation

+ (id)operationWithOwner:(id)a3 text:(id)a4 taskID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (id *)objc_alloc_init((Class)a1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 31, a3);
    objc_storeStrong(v13 + 32, a5);
    uint64_t v14 = [v10 copy];
    id v15 = v13[33];
    v13[33] = (id)v14;

    uint64_t v16 = [v9 sendingAddress];
    id v17 = v13[34];
    v13[34] = (id)v16;
  }

  return v13;
}

- (unint64_t)type
{
  return 2;
}

- (MFContactsSearchManager)owner
{
  return self->_owner;
}

- (NSNumber)taskID
{
  return self->_taskID;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)sendingAddress
{
  return self->_sendingAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_taskID, 0);

  objc_storeStrong((id *)&self->_owner, 0);
}

@end