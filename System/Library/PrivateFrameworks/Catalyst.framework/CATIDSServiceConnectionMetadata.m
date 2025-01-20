@interface CATIDSServiceConnectionMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMetadata:(id)a3;
- (CATIDSServiceConnectionMetadata)initWithConnectionIdentifier:(id)a3 destinationAppleID:(id)a4 userInfo:(id)a5;
- (NSDictionary)userInfo;
- (NSString)destinationAppleID;
- (NSUUID)connectionIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation CATIDSServiceConnectionMetadata

- (CATIDSServiceConnectionMetadata)initWithConnectionIdentifier:(id)a3 destinationAppleID:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CATIDSServiceConnectionMetadata;
  v12 = [(CATIDSServiceConnectionMetadata *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connectionIdentifier, a3);
    uint64_t v14 = [v10 copy];
    destinationAppleID = v13->_destinationAppleID;
    v13->_destinationAppleID = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)v16;
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CATIDSServiceConnectionMetadata *)self connectionIdentifier];
  v6 = [(CATIDSServiceConnectionMetadata *)self destinationAppleID];
  v7 = [(CATIDSServiceConnectionMetadata *)self userInfo];
  v8 = [v3 stringWithFormat:@"<%@: %p { connectionIdentifier = %@, destinationAppleID = %@, userInfo = %@ }>", v4, self, v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(CATIDSServiceConnectionMetadata *)self connectionIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(CATIDSServiceConnectionMetadata *)self destinationAppleID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CATIDSServiceConnectionMetadata *)self userInfo];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CATIDSServiceConnectionMetadata *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    BOOL v7 = 1;
    goto LABEL_9;
  }
  if ([(CATIDSServiceConnectionMetadata *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = [MEMORY[0x263F08690] currentHandler];
      id v10 = [NSString stringWithUTF8String:"-[CATIDSServiceConnectionMetadata isEqual:]"];
      id v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      [v9 handleFailureInFunction:v10, @"CATIDSServiceConnectionMetadata.m", 71, @"expected %@, got %@", v12, v14 file lineNumber description];
    }
    BOOL v7 = [(CATIDSServiceConnectionMetadata *)self isEqualToMetadata:v6];
  }
  else
  {
LABEL_7:
    BOOL v7 = 0;
  }
LABEL_9:

  return v7;
}

- (BOOL)isEqualToMetadata:(id)a3
{
  id v4 = a3;
  v5 = [(CATIDSServiceConnectionMetadata *)self connectionIdentifier];
  uint64_t v6 = [v4 connectionIdentifier];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  if (v7 | v8 && (int v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
  {
    char v17 = 0;
  }
  else
  {
    id v10 = [(CATIDSServiceConnectionMetadata *)self destinationAppleID];
    id v11 = [v4 destinationAppleID];
    unint64_t v12 = v10;
    unint64_t v13 = v11;
    if (v12 | v13 && (int v14 = [(id)v12 isEqual:v13], (id)v13, (id)v12, !v14))
    {
      char v17 = 0;
    }
    else
    {
      uint64_t v15 = [(CATIDSServiceConnectionMetadata *)self userInfo];
      uint64_t v16 = [v4 userInfo];
      if (v15 | v16) {
        char v17 = [(id)v15 isEqual:v16];
      }
      else {
        char v17 = 1;
      }
    }
  }

  return v17;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (NSString)destinationAppleID
{
  return self->_destinationAppleID;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_destinationAppleID, 0);

  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end