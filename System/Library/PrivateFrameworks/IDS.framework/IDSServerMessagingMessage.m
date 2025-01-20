@interface IDSServerMessagingMessage
- (BOOL)wantsResponse;
- (NSData)messageData;
- (NSDate)expirationDate;
- (NSDictionary)userDefinedTopLevelFields;
- (NSNumber)userSpecifiedCommand;
- (NSString)messageID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (int64_t)command;
- (void)setExpirationDate:(id)a3;
- (void)setMessageData:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setUserDefinedTopLevelFields:(id)a3;
- (void)setUserSpecifiedCommand:(id)a3;
@end

@implementation IDSServerMessagingMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IDSServerMessagingMessage;
  id v4 = [(IDSMessage *)&v9 copyWithZone:a3];
  v5 = [(IDSServerMessagingMessage *)self expirationDate];
  [v4 setExpirationDate:v5];

  v6 = [(IDSServerMessagingMessage *)self messageID];
  [v4 setMessageID:v6];

  v7 = [(IDSServerMessagingMessage *)self messageData];
  [v4 setMessageData:v7];

  return v4;
}

- (int64_t)command
{
  v3 = [(IDSServerMessagingMessage *)self userSpecifiedCommand];

  if (!v3) {
    return 100;
  }
  id v4 = [(IDSServerMessagingMessage *)self userSpecifiedCommand];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (BOOL)wantsResponse
{
  return 1;
}

- (id)messageBody
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)IDSServerMessagingMessage;
  v3 = [(IDSMessage *)&v22 messageBody];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  uint64_t v5 = [(IDSServerMessagingMessage *)self messageID];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [(IDSServerMessagingMessage *)self messageID];
    v8 = (const char *)[v7 UTF8String];

    if (v8)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v8, uu);
      uint64_t v21 = 0;
      jw_uuid_to_data();
      id v9 = 0;
      if (v9)
      {
        CFDictionarySetValue(v4, @"U", v9);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_191A45984();
      }
    }
  }
  v10 = [(IDSServerMessagingMessage *)self messageData];
  if (v10)
  {
    CFDictionarySetValue(v4, @"P", v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_191A458FC();
  }

  v11 = [(IDSBaseMessage *)self pushToken];
  if (v11)
  {
    CFDictionarySetValue(v4, @"t", v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_191A45874();
  }

  v12 = [(IDSServerMessagingMessage *)self expirationDate];

  if (v12)
  {
    v13 = NSNumber;
    v14 = [(IDSServerMessagingMessage *)self expirationDate];
    [v14 timeIntervalSince1970];
    v16 = [v13 numberWithUnsignedLong:(unint64_t)v15];

    if (v16) {
      CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E4F6AEE0], v16);
    }
  }
  v17 = [(IDSServerMessagingMessage *)self userDefinedTopLevelFields];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = [(IDSServerMessagingMessage *)self userDefinedTopLevelFields];
    [(__CFDictionary *)v4 addEntriesFromDictionary:v19];
  }

  return v4;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (NSNumber)userSpecifiedCommand
{
  return self->_userSpecifiedCommand;
}

- (void)setUserSpecifiedCommand:(id)a3
{
}

- (NSDictionary)userDefinedTopLevelFields
{
  return self->_userDefinedTopLevelFields;
}

- (void)setUserDefinedTopLevelFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefinedTopLevelFields, 0);
  objc_storeStrong((id *)&self->_userSpecifiedCommand, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_messageData, 0);
}

@end