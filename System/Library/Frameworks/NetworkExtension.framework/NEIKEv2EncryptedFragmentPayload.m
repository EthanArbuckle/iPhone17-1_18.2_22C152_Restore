@interface NEIKEv2EncryptedFragmentPayload
+ (id)copyTypeDescription;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (unint64_t)type;
@end

@implementation NEIKEv2EncryptedFragmentPayload

- (BOOL)parsePayloadData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") > 3)
    {
      int v13 = 0;
      id v7 = objc_getProperty(self, v4, 16, 1);
      v8 = objc_msgSend(v7, "subdataWithRange:", 0, 4);
      [v8 getBytes:&v13 length:4];
      objc_setProperty_atomic(self, v9, v8, 24);
      v10 = objc_msgSend(v7, "subdataWithRange:", 4, objc_msgSend(v7, "length") - 4);

      objc_setProperty_atomic(self, v11, v10, 16);
      self->_fragmentNumber = bswap32((unsigned __int16)v13) >> 16;
      self->_totalFragments = bswap32(HIWORD(v13)) >> 16;
      BOOL v6 = [(NEIKEv2EncryptedFragmentPayload *)self hasRequiredFields];

      return v6;
    }
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      v14 = "-[NEIKEv2EncryptedFragmentPayload parsePayloadData]";
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "BACKTRACE %s called with null (self.payloadData.length >= sizeof(ikev2_fragment_hdr_t))", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      v14 = "-[NEIKEv2EncryptedFragmentPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)&v13, 0xCu);
    }
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  v2 = self;
  if (self)
  {
    self = (NEIKEv2EncryptedFragmentPayload *)objc_getProperty(self, a2, 16, 1);
    LOBYTE(v2) = self && v2->_fragmentNumber && v2->_totalFragments != 0;
  }

  return (char)v2;
}

- (unint64_t)type
{
  return 53;
}

+ (id)copyTypeDescription
{
  return @"Encrypted Fragment";
}

@end