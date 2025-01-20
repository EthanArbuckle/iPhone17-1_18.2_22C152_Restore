@interface purgeOP
+ (id)purgeOpAtUrgency:(int)a3 info:(id)a4 reply:(id)a5;
- (NSDictionary)info;
- (id)reply;
- (int)urgency;
- (purgeOP)initWithUrgency:(int)a3 info:(id)a4 reply:(id)a5;
- (void)setInfo:(id)a3;
- (void)setReply:(id)a3;
@end

@implementation purgeOP

- (purgeOP)initWithUrgency:(int)a3 info:(id)a4 reply:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)purgeOP;
  v11 = [(purgeOP *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_urgency = a3;
    objc_storeStrong((id *)&v11->_info, a4);
    id v13 = objc_retainBlock(v10);
    id reply = v12->_reply;
    v12->_id reply = v13;
  }
  return v12;
}

+ (id)purgeOpAtUrgency:(int)a3 info:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = [[purgeOP alloc] initWithUrgency:v6 info:v8 reply:v7];

  return v9;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (int)urgency
{
  return self->_urgency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong(&self->_reply, 0);
}

@end