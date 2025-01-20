@interface ILMessageClassificationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (ILMessageClassificationRequest)init;
- (ILMessageClassificationRequest)initWithCoder:(id)a3;
- (ILMessageClassificationRequest)initWithMessageCommunications:(id)a3;
- (NSArray)messageCommunications;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ILMessageClassificationRequest

- (ILMessageClassificationRequest)initWithMessageCommunications:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILMessageClassificationRequest;
  v6 = [(ILMessageClassificationRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageCommunications, a3);
  }

  return v7;
}

- (ILMessageClassificationRequest)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ILMessageClassificationRequest;
  v4 = [(ILClassificationRequest *)&v8 description];
  id v5 = [(ILMessageClassificationRequest *)self messageCommunications];
  v6 = [v3 stringWithFormat:@"<%@ messageCommunications=%@>", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILMessageClassificationRequest *)self isEqualToRequest:v4];

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ILMessageClassificationRequest *)self messageCommunications];
  v6 = [v4 messageCommunications];
  if ([v5 isEqualToArray:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_super v8 = [(ILMessageClassificationRequest *)self messageCommunications];
    if (v8)
    {
      BOOL v7 = 0;
    }
    else
    {
      objc_super v9 = [v4 messageCommunications];
      BOOL v7 = v9 == 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(ILMessageClassificationRequest *)self messageCommunications];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageClassificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ILMessageClassificationRequest;
  BOOL v5 = [(ILClassificationRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    objc_super v9 = NSStringFromSelector(sel_messageCommunications);
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    messageCommunications = v5->_messageCommunications;
    v5->_messageCommunications = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ILMessageClassificationRequest;
  id v4 = a3;
  [(ILClassificationRequest *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(ILMessageClassificationRequest *)self messageCommunications];
  v6 = NSStringFromSelector(sel_messageCommunications);
  [v4 encodeObject:v5 forKey:v6];
}

- (NSArray)messageCommunications
{
  return self->_messageCommunications;
}

- (void).cxx_destruct
{
}

@end