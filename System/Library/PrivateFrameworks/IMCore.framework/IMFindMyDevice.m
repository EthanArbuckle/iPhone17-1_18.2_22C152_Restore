@interface IMFindMyDevice
+ (id)deviceWithFMFDevice:(id)a3;
+ (id)deviceWithFMLDevice:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isThisDevice;
- (FMFDevice)fmfDevice;
- (FMLDevice)fmlDevice;
- (IMFindMyDevice)initWithFMFDevice:(id)a3 fmlDevice:(id)a4;
- (NSString)deviceName;
- (unint64_t)hash;
@end

@implementation IMFindMyDevice

+ (id)deviceWithFMFDevice:(id)a3
{
  id v3 = a3;
  v4 = [IMFindMyDevice alloc];
  v6 = objc_msgSend_initWithFMFDevice_fmlDevice_(v4, v5, (uint64_t)v3, 0);

  return v6;
}

+ (id)deviceWithFMLDevice:(id)a3
{
  id v3 = a3;
  v4 = [IMFindMyDevice alloc];
  v6 = objc_msgSend_initWithFMFDevice_fmlDevice_(v4, v5, 0, (uint64_t)v3);

  return v6;
}

- (IMFindMyDevice)initWithFMFDevice:(id)a3 fmlDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMFindMyDevice;
  v9 = [(IMFindMyDevice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fmfDevice, a3);
    objc_storeStrong((id *)&v10->_fmlDevice, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (IMFindMyDevice *)a3;
  if (v5 == self)
  {
    char v33 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v13 = objc_msgSend_fmfDevice(self, v7, v8, v9);
      if (v13 || (objc_msgSend_fmfDevice(v6, v10, v11, v12), (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v14 = objc_msgSend_fmfDevice(self, v10, v11, v12);
        v18 = objc_msgSend_fmfDevice(v6, v15, v16, v17);
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
      v25 = objc_msgSend_fmlDevice(self, v10, v11, v12);
      if (v25 || (objc_msgSend_fmlDevice(v6, v22, v23, v24), (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v26 = objc_msgSend_fmlDevice(self, v22, v23, v24);
        v30 = objc_msgSend_fmlDevice(v6, v27, v28, v29);
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

- (BOOL)isThisDevice
{
  v5 = objc_msgSend_fmlDevice(self, a2, v2, v3);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v10 = objc_msgSend_fmlDevice(self, v7, v8, v9);
LABEL_5:
    v19 = v10;
    char isThisDevice = objc_msgSend_isThisDevice(v10, v11, v12, v13);

    return isThisDevice;
  }
  v14 = objc_msgSend_fmfDevice(self, v7, v8, v9);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v10 = objc_msgSend_fmfDevice(self, v16, v17, v18);
    goto LABEL_5;
  }
  return 0;
}

- (NSString)deviceName
{
  v5 = objc_msgSend_fmlDevice(self, a2, v2, v3);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v10 = objc_msgSend_fmlDevice(self, v7, v8, v9);
LABEL_5:
    v19 = v10;
    objc_msgSend_deviceName(v10, v11, v12, v13);
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v14 = objc_msgSend_fmfDevice(self, v7, v8, v9);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v10 = objc_msgSend_fmfDevice(self, v16, v17, v18);
    goto LABEL_5;
  }
  uint64_t v20 = 0;
LABEL_7:
  if (v20) {
    v21 = v20;
  }
  else {
    v21 = &stru_1EF8E78C8;
  }
  v22 = v21;

  return v22;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_fmlDevice(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_fmfDevice(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (FMFDevice)fmfDevice
{
  return self->_fmfDevice;
}

- (FMLDevice)fmlDevice
{
  return self->_fmlDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmlDevice, 0);

  objc_storeStrong((id *)&self->_fmfDevice, 0);
}

@end