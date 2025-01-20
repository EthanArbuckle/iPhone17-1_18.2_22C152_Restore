@interface ACXIDSMessage
- (ACXIDSMessage)initWithMessage:(id)a3 idsContext:(id)a4 fromID:(id)a5;
- (IDSMessageContext)idsContext;
- (NSDictionary)message;
- (NSString)fromID;
@end

@implementation ACXIDSMessage

- (ACXIDSMessage)initWithMessage:(id)a3 idsContext:(id)a4 fromID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACXIDSMessage;
  v12 = [(ACXIDSMessage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_message, a3);
    objc_storeStrong((id *)&v13->_idsContext, a4);
    objc_storeStrong((id *)&v13->_fromID, a5);
  }

  return v13;
}

- (NSDictionary)message
{
  return self->_message;
}

- (IDSMessageContext)idsContext
{
  return self->_idsContext;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_idsContext, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end