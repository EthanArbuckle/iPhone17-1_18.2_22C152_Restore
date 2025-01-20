@interface IDSCloudKitTransportLogMessage
- (ENGroupID)groupID;
- (IDSDestinationPushToken)destination;
- (NSData)encryptedPayload;
- (NSDictionary)payload;
- (NSString)cypherIdentifier;
- (NSString)deviceID;
- (NSString)encryptionType;
- (NSString)recipientAlias;
- (NSString)secondaryID;
- (NSString)senderAlias;
- (void)setDeviceID:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSecondaryID:(id)a3;
@end

@implementation IDSCloudKitTransportLogMessage

- (ENGroupID)groupID
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_payload(self, a2, v2, v3);
  v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"gI", v7);

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F61158]);
    v14 = objc_msgSend_initWithDataRepresentation_(v9, v10, (uint64_t)v8, v11);
    if (v14) {
      goto LABEL_7;
    }
    v16 = objc_msgSend_cloudKit(IDSFoundationLog, v12, v13, v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138478083;
      v19 = self;
      __int16 v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "Failed to create groupID from transportMessage {groupMessage: %{private}@, groupIDString: %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
  v14 = 0;
LABEL_7:

  return (ENGroupID *)v14;
}

- (NSString)recipientAlias
{
  v5 = objc_msgSend_payload(self, a2, v2, v3);
  v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"tP", v7);

  if (!v8)
  {
    objc_msgSend_cloudKit(IDSFoundationLog, v9, v10, v11);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_19DB7EF0C(self, v12, v13, v14);
    }
  }
  return (NSString *)v8;
}

- (NSString)senderAlias
{
  v5 = objc_msgSend_payload(self, a2, v2, v3);
  v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"sP", v7);

  if (!v8)
  {
    objc_msgSend_cloudKit(IDSFoundationLog, v9, v10, v11);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_19DB7EF98(self, v12, v13, v14);
    }
  }
  return (NSString *)v8;
}

- (IDSDestinationPushToken)destination
{
  v5 = objc_msgSend_payload(self, a2, v2, v3);
  v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"t", v7);

  if (v8)
  {
    v12 = objc_msgSend_payload(self, v9, v10, v11);
    double v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"sP", v14);

    if (v15)
    {
      v19 = objc_msgSend_destinationWithAlias_pushToken_(IDSDestination, v16, (uint64_t)v15, v18, v8);
      goto LABEL_10;
    }
    __int16 v20 = objc_msgSend_cloudKit(IDSFoundationLog, v16, v17, v18);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_19DB7F090();
    }
  }
  else
  {
    double v15 = objc_msgSend_cloudKit(IDSFoundationLog, v9, v10, v11);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_19DB7F024();
    }
  }
  v19 = 0;
LABEL_10:

  return (IDSDestinationPushToken *)v19;
}

- (NSData)encryptedPayload
{
  v4 = objc_msgSend_payload(self, a2, v2, v3);
  double v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"P", v6);

  return (NSData *)v7;
}

- (NSString)cypherIdentifier
{
  v4 = objc_msgSend_payload(self, a2, v2, v3);
  double v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"E", v6);

  return (NSString *)v7;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)secondaryID
{
  return self->_secondaryID;
}

- (void)setSecondaryID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)encryptionType
{
  return self->_encryptionType;
}

- (void)setEncryptionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionType, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_secondaryID, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end