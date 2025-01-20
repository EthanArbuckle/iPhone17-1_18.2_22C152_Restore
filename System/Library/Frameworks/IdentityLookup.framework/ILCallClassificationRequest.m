@interface ILCallClassificationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (ILCallClassificationRequest)init;
- (ILCallClassificationRequest)initWithCallCommunications:(id)a3;
- (ILCallClassificationRequest)initWithCoder:(id)a3;
- (NSArray)callCommunications;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ILCallClassificationRequest

- (ILCallClassificationRequest)initWithCallCommunications:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILCallClassificationRequest;
  v6 = [(ILCallClassificationRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_callCommunications, a3);
  }

  return v7;
}

- (ILCallClassificationRequest)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ILCallClassificationRequest;
  v4 = [(ILClassificationRequest *)&v8 description];
  id v5 = [(ILCallClassificationRequest *)self callCommunications];
  v6 = [v3 stringWithFormat:@"<%@ callCommunications=%@>", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILCallClassificationRequest *)self isEqualToRequest:v4];

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ILCallClassificationRequest *)self callCommunications];
  v6 = [v4 callCommunications];
  if ([v5 isEqualToArray:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_super v8 = [(ILCallClassificationRequest *)self callCommunications];
    if (v8)
    {
      BOOL v7 = 0;
    }
    else
    {
      objc_super v9 = [v4 callCommunications];
      BOOL v7 = v9 == 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(ILCallClassificationRequest *)self callCommunications];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILCallClassificationRequest)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  BOOL v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  objc_super v8 = NSStringFromSelector(sel_callCommunications);
  objc_super v9 = [v5 decodeObjectOfClasses:v7 forKey:v8];

  v10 = [(ILCallClassificationRequest *)self initWithCallCommunications:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ILCallClassificationRequest;
  id v4 = a3;
  [(ILClassificationRequest *)&v7 encodeWithCoder:v4];
  id v5 = [(ILCallClassificationRequest *)self callCommunications];
  uint64_t v6 = NSStringFromSelector(sel_callCommunications);
  [v4 encodeObject:v5 forKey:v6];
}

- (NSArray)callCommunications
{
  return self->_callCommunications;
}

- (void).cxx_destruct
{
}

@end