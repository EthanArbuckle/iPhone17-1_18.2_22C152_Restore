@interface ILMessageCommunication
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessageCommunication:(ILMessageCommunication *)communication;
- (ILMessageCommunication)init;
- (ILMessageCommunication)initWithCoder:(id)a3;
- (ILMessageCommunication)initWithSender:(id)a3 dateReceived:(id)a4 messageBody:(id)a5;
- (NSString)messageBody;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ILMessageCommunication

- (ILMessageCommunication)initWithSender:(id)a3 dateReceived:(id)a4 messageBody:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ILMessageCommunication;
  v10 = [(ILCommunication *)&v13 initWithSender:a3 dateReceived:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_messageBody, a5);
  }

  return v11;
}

- (ILMessageCommunication)init
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILMessageCommunication *)self isEqualToMessageCommunication:v4];

  return v5;
}

- (BOOL)isEqualToMessageCommunication:(ILMessageCommunication *)communication
{
  id v4 = communication;
  if ([(ILCommunication *)self isEqualToCommunication:v4])
  {
    uint64_t v5 = [(ILMessageCommunication *)self messageBody];
    uint64_t v6 = [(ILMessageCommunication *)v4 messageBody];
    char v7 = (v5 | v6) == 0;
    if (v6) {
      char v7 = [(id)v5 isEqualToString:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)ILMessageCommunication;
  unint64_t v3 = [(ILCommunication *)&v7 hash];
  id v4 = [(ILMessageCommunication *)self messageBody];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageCommunication)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ILMessageCommunication;
  unint64_t v5 = [(ILCommunication *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_messageBody);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ILMessageCommunication;
  id v4 = a3;
  [(ILCommunication *)&v7 encodeWithCoder:v4];
  unint64_t v5 = [(ILMessageCommunication *)self messageBody];
  uint64_t v6 = NSStringFromSelector(sel_messageBody);
  [v4 encodeObject:v5 forKey:v6];
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void).cxx_destruct
{
}

@end