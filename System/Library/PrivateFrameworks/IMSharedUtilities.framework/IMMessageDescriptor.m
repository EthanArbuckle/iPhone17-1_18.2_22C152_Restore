@interface IMMessageDescriptor
- (IMMessageDescriptor)initWithMessageBody:(id)a3 messageGUID:(id)a4;
- (NSArray)messageParts;
- (NSAttributedString)messageBody;
- (NSString)messageGUID;
@end

@implementation IMMessageDescriptor

- (IMMessageDescriptor)initWithMessageBody:(id)a3 messageGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMMessageDescriptor;
  v8 = [(IMMessageDescriptor *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    messageBody = v8->_messageBody;
    v8->_messageBody = (NSAttributedString *)v9;

    uint64_t v11 = [v7 copy];
    messageGUID = v8->_messageGUID;
    v8->_messageGUID = (NSString *)v11;
  }
  return v8;
}

- (NSArray)messageParts
{
  messageParts = self->_messageParts;
  if (!messageParts)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    messageBody = self->_messageBody;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1A08367C4;
    v10[3] = &unk_1E5A106F0;
    id v11 = v4;
    id v6 = v4;
    [(NSAttributedString *)messageBody __im_visitMessageParts:v10];
    id v7 = (NSArray *)[v6 copy];
    v8 = self->_messageParts;
    self->_messageParts = v7;

    messageParts = self->_messageParts;
  }

  return messageParts;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (NSAttributedString)messageBody
{
  return self->_messageBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);

  objc_storeStrong((id *)&self->_messageParts, 0);
}

@end