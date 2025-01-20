@interface UNNotificationAttributedMessageContext
+ (id)contextWithSendMessageIntent:(id)a3 attributedContent:(id)a4;
- (INSendMessageIntent)sendMessageIntent;
- (NSAttributedString)attributedContent;
- (id)_initWithSendMessageIntent:(id)a3 attributedContent:(id)a4;
- (void)setAttributedContent:(id)a3;
- (void)setSendMessageIntent:(id)a3;
@end

@implementation UNNotificationAttributedMessageContext

- (id)_initWithSendMessageIntent:(id)a3 attributedContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNNotificationAttributedMessageContext;
  v8 = [(UNNotificationAttributedMessageContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sendMessageIntent = v8->_sendMessageIntent;
    v8->_sendMessageIntent = (INSendMessageIntent *)v9;

    uint64_t v11 = [v7 copy];
    attributedContent = v8->_attributedContent;
    v8->_attributedContent = (NSAttributedString *)v11;
  }
  return v8;
}

+ (id)contextWithSendMessageIntent:(id)a3 attributedContent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithSendMessageIntent:v6 attributedContent:v5];

  return v7;
}

- (INSendMessageIntent)sendMessageIntent
{
  return self->_sendMessageIntent;
}

- (void)setSendMessageIntent:(id)a3
{
}

- (NSAttributedString)attributedContent
{
  return self->_attributedContent;
}

- (void)setAttributedContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedContent, 0);

  objc_storeStrong((id *)&self->_sendMessageIntent, 0);
}

@end