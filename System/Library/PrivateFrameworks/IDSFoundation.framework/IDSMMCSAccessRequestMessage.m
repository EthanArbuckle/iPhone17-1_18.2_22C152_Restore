@interface IDSMMCSAccessRequestMessage
- (IDSMMCSAccessRequestMessage)init;
- (NSArray)downloadAuths;
- (NSData)downloadingDeviceToken;
- (NSData)sessionToken;
- (NSString)downloadingDeviceID;
- (NSString)senderID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)setDownloadAuths:(id)a3;
- (void)setDownloadingDeviceID:(id)a3;
- (void)setDownloadingDeviceToken:(id)a3;
- (void)setSenderID:(id)a3;
- (void)setSessionToken:(id)a3;
@end

@implementation IDSMMCSAccessRequestMessage

- (IDSMMCSAccessRequestMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSMMCSAccessRequestMessage;
  v2 = [(IDSMessage *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_setWantsResponse_(v2, v3, 1, v4);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v36.receiver = self;
  v36.super_class = (Class)IDSMMCSAccessRequestMessage;
  id v4 = [(IDSMessage *)&v36 copyWithZone:a3];
  v8 = objc_msgSend_copy(self->_downloadAuths, v5, v6, v7);
  objc_msgSend_setDownloadAuths_(v4, v9, (uint64_t)v8, v10);

  v14 = objc_msgSend_copy(self->_downloadingDeviceToken, v11, v12, v13);
  objc_msgSend_setDownloadingDeviceToken_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_copy(self->_sessionToken, v17, v18, v19);
  objc_msgSend_setSessionToken_(v4, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_copy(self->_downloadingDeviceID, v23, v24, v25);
  objc_msgSend_setDownloadingDeviceID_(v4, v27, (uint64_t)v26, v28);

  v32 = objc_msgSend_copy(self->_senderID, v29, v30, v31);
  objc_msgSend_setSenderID_(v4, v33, (uint64_t)v32, v34);

  return v4;
}

- (int64_t)command
{
  return 154;
}

- (int64_t)responseCommand
{
  return 154;
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend_addObject_(v2, v3, @"dal", v4);
  objc_msgSend_addObject_(v2, v5, @"t", v6);
  objc_msgSend_addObject_(v2, v7, @"sT", v8);
  objc_msgSend_addObject_(v2, v9, @"tP", v10);
  objc_msgSend_addObject_(v2, v11, @"sP", v12);
  return v2;
}

- (id)messageBody
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)IDSMMCSAccessRequestMessage;
  v3 = [(IDSMessage *)&v32 messageBody];
  double v7 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v9 = self->_downloadAuths;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v28, v11, v33, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v9);
        }
        double v19 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v28 + 1) + 8 * i), v13, v14, v15, (void)v28);
        objc_msgSend_addObject_(v8, v20, (uint64_t)v19, v21);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v13, (uint64_t)&v28, v15, v33, 16);
    }
    while (v16);
  }

  id v22 = v8;
  if (v22)
  {
    CFDictionarySetValue(v7, @"dal", v22);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB787BC();
  }

  v23 = self->_downloadingDeviceToken;
  if (v23)
  {
    CFDictionarySetValue(v7, @"t", v23);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB78734();
  }

  uint64_t v24 = self->_sessionToken;
  if (v24)
  {
    CFDictionarySetValue(v7, @"sT", v24);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB786AC();
  }

  double v25 = self->_downloadingDeviceID;
  if (v25)
  {
    CFDictionarySetValue(v7, @"tP", v25);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB78624();
  }

  v26 = self->_senderID;
  if (v26)
  {
    CFDictionarySetValue(v7, @"sP", v26);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB7859C();
  }

  return v7;
}

- (NSArray)downloadAuths
{
  return self->_downloadAuths;
}

- (void)setDownloadAuths:(id)a3
{
}

- (NSData)downloadingDeviceToken
{
  return self->_downloadingDeviceToken;
}

- (void)setDownloadingDeviceToken:(id)a3
{
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSString)downloadingDeviceID
{
  return self->_downloadingDeviceID;
}

- (void)setDownloadingDeviceID:(id)a3
{
}

- (NSString)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_downloadingDeviceID, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_downloadingDeviceToken, 0);
  objc_storeStrong((id *)&self->_downloadAuths, 0);
}

@end