@interface IMFindMyLocation
+ (id)locationWithFMFLocation:(id)a3;
+ (id)locationWithFMFLocation:(id)a3 fmlLocation:(id)a4;
+ (id)locationWithFMLLocation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FMFLocation)fmfLocation;
- (FMLLocation)fmlLocation;
- (IMFindMyLocation)initWithFMFLocation:(id)a3 fmlLocation:(id)a4;
- (NSString)shortAddress;
- (unint64_t)hash;
@end

@implementation IMFindMyLocation

+ (id)locationWithFMFLocation:(id)a3 fmlLocation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [IMFindMyLocation alloc];
  v9 = objc_msgSend_initWithFMFLocation_fmlLocation_(v7, v8, (uint64_t)v6, (uint64_t)v5);

  return v9;
}

+ (id)locationWithFMFLocation:(id)a3
{
  id v3 = a3;
  v4 = [IMFindMyLocation alloc];
  id v6 = objc_msgSend_initWithFMFLocation_fmlLocation_(v4, v5, (uint64_t)v3, 0);

  return v6;
}

+ (id)locationWithFMLLocation:(id)a3
{
  id v3 = a3;
  v4 = [IMFindMyLocation alloc];
  id v6 = objc_msgSend_initWithFMFLocation_fmlLocation_(v4, v5, 0, (uint64_t)v3);

  return v6;
}

- (IMFindMyLocation)initWithFMFLocation:(id)a3 fmlLocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMFindMyLocation;
  v9 = [(IMFindMyLocation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fmfLocation, a3);
    objc_storeStrong((id *)&v10->_fmlLocation, a4);
  }

  return v10;
}

- (NSString)shortAddress
{
  uint64_t v5 = objc_msgSend_fmlLocation(self, a2, v2, v3);
  if (v5)
  {
    v9 = (void *)v5;
    v10 = objc_msgSend_fmlLocation(self, v6, v7, v8);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      objc_super v12 = objc_msgSend_fmlLocation(self, v6, v7, v8);
      uint64_t v16 = objc_msgSend_coarseAddressLabel(v12, v13, v14, v15);
LABEL_6:
      v25 = (void *)v16;

      goto LABEL_8;
    }
  }
  v17 = objc_msgSend_fmfLocation(self, v6, v7, v8);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    objc_super v12 = objc_msgSend_fmfLocation(self, v19, v20, v21);
    uint64_t v16 = objc_msgSend_shortAddress(v12, v22, v23, v24);
    goto LABEL_6;
  }
  v25 = 0;
LABEL_8:

  return (NSString *)v25;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (IMFindMyLocation *)a3;
  if (v5 == self)
  {
    char v33 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v13 = objc_msgSend_fmfLocation(self, v7, v8, v9);
      if (v13
        || (objc_msgSend_fmfLocation(v6, v10, v11, v12), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v14 = objc_msgSend_fmfLocation(self, v10, v11, v12);
        char v18 = objc_msgSend_fmfLocation(v6, v15, v16, v17);
        int isEqual = objc_msgSend_isEqual_(v14, v19, (uint64_t)v18, v20);

        if (v13)
        {

          if (isEqual) {
            goto LABEL_7;
          }
        }
        else
        {

          if (isEqual) {
            goto LABEL_7;
          }
        }
        char v33 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_7:
      v25 = objc_msgSend_fmlLocation(self, v10, v11, v12);
      if (v25
        || (objc_msgSend_fmlLocation(v6, v22, v23, v24), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v26 = objc_msgSend_fmlLocation(self, v22, v23, v24);
        v30 = objc_msgSend_fmlLocation(v6, v27, v28, v29);
        char v33 = objc_msgSend_isEqual_(v26, v31, (uint64_t)v30, v32);

        if (v25)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        char v33 = 1;
      }

      goto LABEL_17;
    }
    char v33 = 0;
  }
LABEL_19:

  return v33;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_fmfLocation(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  v13 = objc_msgSend_fmlLocation(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (FMFLocation)fmfLocation
{
  return self->_fmfLocation;
}

- (FMLLocation)fmlLocation
{
  return self->_fmlLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmlLocation, 0);

  objc_storeStrong((id *)&self->_fmfLocation, 0);
}

@end