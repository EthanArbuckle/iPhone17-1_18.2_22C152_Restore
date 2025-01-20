@interface CRKIDSMessageOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldFireAndForget;
- (CRKIDSMessageOptions)initWithCoder:(id)a3;
- (NSNumber)deliveryTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryTimeout:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
@end

@implementation CRKIDSMessageOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithBool:", -[CRKIDSMessageOptions shouldFireAndForget](self, "shouldFireAndForget"));
  [v5 encodeObject:v6 forKey:@"fireAndForget"];

  id v7 = [(CRKIDSMessageOptions *)self deliveryTimeout];
  [v5 encodeObject:v7 forKey:@"deliveryTimeout"];
}

- (CRKIDSMessageOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKIDSMessageOptions;
  id v5 = [(CRKIDSMessageOptions *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fireAndForget"];
    v5->_fireAndForget = [v6 BOOLValue];

    id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"deliveryTimeout"];
    deliveryTimeout = v5->_deliveryTimeout;
    v5->_deliveryTimeout = (NSNumber *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFireAndForget:", -[CRKIDSMessageOptions shouldFireAndForget](self, "shouldFireAndForget"));
  id v5 = [(CRKIDSMessageOptions *)self deliveryTimeout];
  [v4 setDeliveryTimeout:v5];

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CRKIDSMessageOptions *)self shouldFireAndForget];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  id v7 = v6;
  uint64_t v8 = [(CRKIDSMessageOptions *)self deliveryTimeout];
  v9 = [v3 stringWithFormat:@"<%@: %p { fireAndForget = %@, deliveryTimeout = %@ }>", v4, self, v7, v8];

  return v9;
}

- (BOOL)shouldFireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
}

- (NSNumber)deliveryTimeout
{
  return self->_deliveryTimeout;
}

- (void)setDeliveryTimeout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end