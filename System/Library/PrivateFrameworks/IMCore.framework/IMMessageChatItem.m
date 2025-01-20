@interface IMMessageChatItem
- (BOOL)canReply;
- (BOOL)failed;
- (BOOL)isFromMe;
- (IMHandle)sender;
- (IMMessage)message;
- (NSDate)time;
@end

@implementation IMMessageChatItem

- (IMMessage)message
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (BOOL)isFromMe
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (BOOL)failed
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_errorCode(v4, v5, v6, v7) != 0;

  return v8;
}

- (NSDate)time
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_time(v4, v5, v6, v7);

  return (NSDate *)v8;
}

- (IMHandle)sender
{
  v4 = objc_msgSend_message(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_sender(v4, v5, v6, v7);

  return (IMHandle *)v8;
}

- (BOOL)canReply
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_service(v4, v5, v6, v7);
  v11 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v9, (uint64_t)v8, v10);

  v12 = (uint64_t *)MEMORY[0x1E4F6E060];
  if (objc_msgSend_supportsCapability_(v11, v13, *MEMORY[0x1E4F6E060], v14)) {
    char v17 = 1;
  }
  else {
    char v17 = objc_msgSend_supportsReplicationCapability_(v11, v15, *v12, v16);
  }

  return v17;
}

@end