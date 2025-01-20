@interface GroupMessageContext
- (BOOL)isGroupChat;
- (GroupMessageContext)initWithGroupPayload:(id)a3 additionalPayload:(id)a4 isGroupChat:(BOOL)a5;
- (NSDictionary)additionalPayload;
- (NSDictionary)groupPayload;
@end

@implementation GroupMessageContext

- (GroupMessageContext)initWithGroupPayload:(id)a3 additionalPayload:(id)a4 isGroupChat:(BOOL)a5
{
  v8 = (NSDictionary *)a3;
  v9 = (NSDictionary *)a4;
  v15.receiver = self;
  v15.super_class = (Class)GroupMessageContext;
  v10 = [(GroupMessageContext *)&v15 init];
  groupPayload = v10->_groupPayload;
  v10->_groupPayload = v8;
  v12 = v8;

  additionalPayload = v10->_additionalPayload;
  v10->_additionalPayload = v9;

  v10->_groupChat = a5;
  return v10;
}

- (NSDictionary)groupPayload
{
  return self->_groupPayload;
}

- (NSDictionary)additionalPayload
{
  return self->_additionalPayload;
}

- (BOOL)isGroupChat
{
  return self->_groupChat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPayload, 0);

  objc_storeStrong((id *)&self->_groupPayload, 0);
}

@end