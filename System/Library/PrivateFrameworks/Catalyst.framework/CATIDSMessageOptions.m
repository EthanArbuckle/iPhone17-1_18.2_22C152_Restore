@interface CATIDSMessageOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldFireAndForget;
- (CATIDSMessageOptions)initWithCoder:(id)a3;
- (NSNumber)deliveryTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryTimeout:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
@end

@implementation CATIDSMessageOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithBool:", -[CATIDSMessageOptions shouldFireAndForget](self, "shouldFireAndForget"));
  [v5 encodeObject:v6 forKey:@"fireAndForget"];

  id v7 = [(CATIDSMessageOptions *)self deliveryTimeout];
  [v5 encodeObject:v7 forKey:@"deliveryTimeout"];
}

- (CATIDSMessageOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CATIDSMessageOptions;
  id v5 = [(CATIDSMessageOptions *)&v11 init];
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
  objc_msgSend(v4, "setFireAndForget:", -[CATIDSMessageOptions shouldFireAndForget](self, "shouldFireAndForget"));
  id v5 = [(CATIDSMessageOptions *)self deliveryTimeout];
  [v4 setDeliveryTimeout:v5];

  return v4;
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