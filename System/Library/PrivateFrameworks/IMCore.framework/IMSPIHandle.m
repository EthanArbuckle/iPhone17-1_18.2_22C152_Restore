@interface IMSPIHandle
- (BOOL)isBusiness;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (IMSPIHandle)initWithAddress:(id)a3 countryCode:(id)a4 isMe:(BOOL)a5;
- (NSString)address;
- (NSString)businessName;
- (NSString)cnContactID;
- (NSString)countryCode;
- (NSString)displayName;
- (id)description;
- (id)handle;
- (unint64_t)hash;
- (void)setAddress:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setIsMe:(BOOL)a3;
@end

@implementation IMSPIHandle

- (IMSPIHandle)initWithAddress:(id)a3 countryCode:(id)a4 isMe:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMSPIHandle;
  v11 = [(IMSPIHandle *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_address, a3);
    objc_storeStrong((id *)&v12->_countryCode, a4);
    v12->_isMe = a5;
  }

  return v12;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_address(self, a2, v2, v3);
  id v10 = objc_msgSend_businessName(self, v7, v8, v9);
  v13 = objc_msgSend_stringWithFormat_(v5, v11, @"IMSPIHandle: %p [Address: %@  Business Name: %@]", v12, self, v6, v10);

  return v13;
}

- (BOOL)isBusiness
{
  v4 = objc_msgSend_address(self, a2, v2, v3);
  char v5 = MEMORY[0x1A6263990]();

  return v5;
}

- (NSString)businessName
{
  v4 = objc_msgSend_address(self, a2, v2, v3);
  if (MEMORY[0x1A6263990]())
  {
    v7 = objc_msgSend_placeholderNameForBrandURI_(MEMORY[0x1E4F6E628], v5, (uint64_t)v4, v6);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = sub_1A4B3461C;
    v37 = sub_1A4B343F4;
    id v38 = 0;
    uint64_t v12 = objc_msgSend_sharedInstance(IMHandleRegistrar, v9, v10, v11);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1A4C6F658;
    v30[3] = &unk_1E5B7F3A8;
    v32 = &v33;
    v13 = v8;
    v31 = v13;
    v15 = objc_msgSend_businessNameForUID_updateHandler_(v12, v14, (uint64_t)v4, (uint64_t)v30);

    uint64_t v19 = objc_msgSend_length(v15, v16, v17, v18);
    v20 = v15;
    if (!v19)
    {
      dispatch_time_t v21 = dispatch_time(0, 3000000000);
      if (dispatch_semaphore_wait(v13, v21) && IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Business name lookup timed out", v29, 2u);
        }
      }
      if (!objc_msgSend_length((void *)v34[5], v22, v23, v24)) {
        goto LABEL_11;
      }
      v20 = (void *)v34[5];
    }
    id v26 = v20;

    v7 = v26;
LABEL_11:
    id v27 = v7;

    _Block_object_dispose(&v33, 8);
    goto LABEL_13;
  }
  id v27 = 0;
LABEL_13:

  return (NSString *)v27;
}

- (id)handle
{
  if (!self->_haveFetchedIMHandle)
  {
    char v5 = objc_msgSend_iMessageService(IMServiceImpl, a2, v2, v3);
    uint64_t v6 = IMPreferredAccountForService(v5);

    if (v6)
    {
      v7 = IMStripFormattingFromAddress();
      objc_msgSend_existingIMHandleWithID_(v6, v8, (uint64_t)v7, v9);
      uint64_t v10 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      imHandle = self->_imHandle;
      self->_imHandle = v10;

      self->_haveFetchedIMHandle = 1;
    }
  }
  uint64_t v12 = self->_imHandle;

  return v12;
}

- (NSString)displayName
{
  char v5 = objc_msgSend_businessName(self, a2, v2, v3);
  if (!objc_msgSend_length(v5, v6, v7, v8))
  {
    uint64_t v11 = objc_msgSend_displayNameForChat_(self->_imHandle, v9, 0, v10);

    char v5 = (void *)v11;
  }

  return (NSString *)v5;
}

- (NSString)cnContactID
{
  v4 = objc_msgSend_handle(self, a2, v2, v3);
  uint64_t v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_msgSend_cnContactWithKeys_(v4, v5, MEMORY[0x1E4F1CBF0], v6);
    uint64_t v12 = objc_msgSend_identifier(v8, v9, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IMSPIHandle *)a3;
  if (v4 == self)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = v4;
      address = self->_address;
      uint64_t v10 = objc_msgSend_address(v5, v7, v8, v9);
      LODWORD(address) = objc_msgSend_isEqualToString_(address, v11, (uint64_t)v10, v12);

      if (address)
      {
        BOOL v16 = !self->_isMe;
        int v17 = v16 ^ objc_msgSend_isMe(v5, v13, v14, v15);
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_address, a2, v2, v3);
  uint64_t v8 = objc_msgSend_numberWithBool_(NSNumber, v6, self->_isMe, v7);
  unint64_t v12 = objc_msgSend_hash(v8, v9, v10, v11) ^ v5;

  return v12;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAddress:(id)a3
{
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_imHandle, 0);
}

@end