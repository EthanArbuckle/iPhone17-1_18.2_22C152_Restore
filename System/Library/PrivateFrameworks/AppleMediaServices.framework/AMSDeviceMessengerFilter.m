@interface AMSDeviceMessengerFilter
- (ACAccount)account;
- (BOOL)matchesMessage:(id)a3;
- (int64_t)deviceType;
- (int64_t)messageType;
- (void)setAccount:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setMessageType:(int64_t)a3;
@end

@implementation AMSDeviceMessengerFilter

- (BOOL)matchesMessage:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  if ([(AMSDeviceMessengerFilter *)self messageType])
  {
    if ([(AMSDeviceMessengerFilter *)self messageType] != 1) {
      goto LABEL_8;
    }
    v5 = [v4 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
  }
  if (![(AMSDeviceMessengerFilter *)self deviceType])
  {
    LODWORD(v8) = 1;
    goto LABEL_9;
  }
  if ([(AMSDeviceMessengerFilter *)self deviceType] == 1)
  {
    v7 = [v4 origin];
    LODWORD(v8) = [v7 type] == 1;
  }
  else
  {
LABEL_8:
    LODWORD(v8) = 0;
  }
LABEL_9:
  v9 = [(AMSDeviceMessengerFilter *)self account];
  v10 = objc_msgSend(v9, "ams_DSID");

  if (v8 && v10)
  {
    v11 = [v4 object];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    if (v12)
    {
      v13 = [v4 object];
      v14 = [v13 userInfo];
      uint64_t v15 = [v14 objectForKeyedSubscript:0x1EDCB1AE8];
      v16 = (void *)v15;
      v17 = &unk_1EDD01180;
      if (v15) {
        v17 = (void *)v15;
      }
      id v18 = v17;

      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = [v18 longLongValue];
        LOBYTE(v8) = v8 == [v10 longLongValue];
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
}

@end