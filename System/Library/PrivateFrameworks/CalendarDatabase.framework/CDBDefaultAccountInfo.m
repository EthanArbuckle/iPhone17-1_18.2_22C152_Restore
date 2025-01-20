@interface CDBDefaultAccountInfo
- (BOOL)addressIsAccountOwner:(id)a3;
- (BOOL)addressURLIsAccountOwner:(id)a3;
- (CDBDefaultAccountInfo)initWithStore:(void *)a3;
@end

@implementation CDBDefaultAccountInfo

- (CDBDefaultAccountInfo)initWithStore:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CDBDefaultAccountInfo;
  v4 = [(CDBDefaultAccountInfo *)&v10 init];
  v5 = v4;
  if (a3 && v4)
  {
    id v6 = CalStoreCopyCachedExternalInfo((uint64_t)a3);
    uint64_t v7 = [v6 objectForKeyedSubscript:@"ownerAddresses"];
    accountUserAddresses = v5->_accountUserAddresses;
    v5->_accountUserAddresses = (NSArray *)v7;
  }
  return v5;
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  if ([(CDBDefaultAccountInfo *)self addressURLIsAccountOwner:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = [NSString stringWithFormat:@"mailto:%@", v4];
    v9 = [v7 URLWithString:v8];

    BOOL v6 = [(CDBDefaultAccountInfo *)self addressURLIsAccountOwner:v9];
  }

  return v6;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = self->_accountUserAddresses;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(MEMORY[0x1E4F56800], "compareAddressURL:localString:", v4, *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end