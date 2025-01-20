@interface SGMessagePair
- (NSDate)sentAt;
- (NSString)handle;
- (NSString)prompt;
- (NSString)reply;
- (SGMessagePair)initWithReply:(id)a3 prompt:(id)a4 handle:(id)a5 sentAt:(id)a6;
- (void)setHandle:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setReply:(id)a3;
- (void)setSentAt:(id)a3;
@end

@implementation SGMessagePair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentAt, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_reply, 0);
}

- (void)setSentAt:(id)a3
{
}

- (NSDate)sentAt
{
  return self->_sentAt;
}

- (void)setHandle:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setReply:(id)a3
{
}

- (NSString)reply
{
  return self->_reply;
}

- (SGMessagePair)initWithReply:(id)a3 prompt:(id)a4 handle:(id)a5 sentAt:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SGMessagePair;
  v15 = [(SGMessagePair *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_reply, a3);
    objc_storeStrong((id *)&v16->_prompt, a4);
    objc_storeStrong((id *)&v16->_handle, a5);
    objc_storeStrong((id *)&v16->_sentAt, a6);
  }

  return v16;
}

@end