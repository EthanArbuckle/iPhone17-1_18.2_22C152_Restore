@interface IMFindMyHandle
+ (id)handleWithFMFHandle:(id)a3;
+ (id)handleWithFMLHandle:(id)a3;
+ (id)handleWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FMFHandle)fmfHandle;
- (FMLHandle)fmlHandle;
- (IMFindMyHandle)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
@end

@implementation IMFindMyHandle

+ (id)handleWithFMFHandle:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend_identifier(v3, v4, v5, v6), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v7;
    v11 = objc_msgSend_handleWithIdentifier_(IMFindMyHandle, v8, v7, v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)handleWithFMLHandle:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend_identifier(v3, v4, v5, v6), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v7;
    v11 = objc_msgSend_handleWithIdentifier_(IMFindMyHandle, v8, v7, v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)handleWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [IMFindMyHandle alloc];
  uint64_t v7 = objc_msgSend_initWithIdentifier_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

- (IMFindMyHandle)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IMFindMyHandle;
  uint64_t v6 = [(IMFindMyHandle *)&v28 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v11 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v8, v9, v10);
    int SessionEnabled = objc_msgSend_isFindMyLocateSessionEnabled(v11, v12, v13, v14);

    if (SessionEnabled)
    {
      uint64_t v16 = MEMORY[0x1A6263B40](@"FMLHandle", @"FindMyLocateObjCWrapper");
      if (v16)
      {
        v17 = (void *)v16;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v20 = objc_msgSend_handleWithIdentifier_(v17, v18, (uint64_t)v5, v19);
          fmlHandle = v7->_fmlHandle;
          v7->_fmlHandle = (FMLHandle *)v20;
LABEL_9:
        }
      }
    }
    else
    {
      uint64_t v22 = MEMORY[0x1A6263B40](@"FMFHandle", @"FMF");
      if (v22)
      {
        v23 = (void *)v22;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v26 = objc_msgSend_handleWithId_(v23, v24, (uint64_t)v5, v25);
          fmlHandle = v7->_fmfHandle;
          v7->_fmfHandle = (FMFHandle *)v26;
          goto LABEL_9;
        }
      }
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (IMFindMyHandle *)a3;
  if (v5 == self)
  {
    char isEqualToString = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      uint64_t v13 = objc_msgSend_identifier(self, v7, v8, v9);
      if (v13
        || (objc_msgSend_identifier(v6, v10, v11, v12), (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v14 = objc_msgSend_identifier(self, v10, v11, v12);
        v18 = objc_msgSend_identifier(v6, v15, v16, v17);
        char isEqualToString = objc_msgSend_isEqualToString_(v14, v19, (uint64_t)v18, v20);

        if (v13)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        char isEqualToString = 1;
      }

      goto LABEL_11;
    }
    char isEqualToString = 0;
  }
LABEL_12:

  return isEqualToString;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_fmfHandle(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_fmlHandle(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_identifier(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@ %p [%@]>", v10, v4, self, v8);

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (FMFHandle)fmfHandle
{
  return self->_fmfHandle;
}

- (FMLHandle)fmlHandle
{
  return self->_fmlHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmlHandle, 0);
  objc_storeStrong((id *)&self->_fmfHandle, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end