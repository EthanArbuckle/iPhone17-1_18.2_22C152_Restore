@interface IMSMSFallbackStatusChatItem
- (BOOL)canSMSReply;
- (IMHandle)handle;
- (NSString)previousServiceName;
- (id)_initWithItem:(id)a3 handle:(id)a4 previousServiceName:(id)a5 canSMSReply:(BOOL)a6;
@end

@implementation IMSMSFallbackStatusChatItem

- (id)_initWithItem:(id)a3 handle:(id)a4 previousServiceName:(id)a5 canSMSReply:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IMSMSFallbackStatusChatItem;
  v13 = [(IMChatItem *)&v16 _initWithItem:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 8, a4);
    objc_storeStrong(v14 + 9, a5);
    *((unsigned char *)v14 + 56) = a6;
  }

  return v14;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (NSString)previousServiceName
{
  return self->_previousServiceName;
}

- (BOOL)canSMSReply
{
  return self->_canSMSReply;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousServiceName, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end