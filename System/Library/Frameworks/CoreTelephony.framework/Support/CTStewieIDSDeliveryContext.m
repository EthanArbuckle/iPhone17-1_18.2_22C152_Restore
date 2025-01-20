@interface CTStewieIDSDeliveryContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIDSDeliveryContext:(id)a3;
- (CTStewieIDSDeliveryContext)initWithCoder:(id)a3;
- (CTStewieIDSDeliveryContext)initWithService:(unsigned __int16)a3 deliveryContext:(id)a4;
- (CTStewieIDSDeliveryContext)initWithVectorRepresentation:(const void *)a3 error:(id *)a4;
- (IDSCertifiedDeliveryContext)deliveryContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)service;
- (vector<unsigned)toVectorRepresentation:(CTStewieIDSDeliveryContext *)self;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryContext:(id)a3;
- (void)setService:(unsigned __int16)a3;
@end

@implementation CTStewieIDSDeliveryContext

- (CTStewieIDSDeliveryContext)initWithService:(unsigned __int16)a3 deliveryContext:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTStewieIDSDeliveryContext;
  v8 = [(CTStewieIDSDeliveryContext *)&v12 init];
  v9 = 0;
  v10 = v8;
  if (v8 && (a3 & 0x3F) != 0 && v7)
  {
    v8->_service = a3;
    objc_storeStrong((id *)&v8->_deliveryContext, a4);
    v9 = v10;
  }

  return v9;
}

- (CTStewieIDSDeliveryContext)initWithVectorRepresentation:(const void *)a3 error:(id *)a4
{
  v6 = +[NSData dataWithBytes:*(void *)a3 length:*((void *)a3 + 1) - *(void *)a3];
  if (v6)
  {
    id v11 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v11];
    id v8 = v11;
    v9 = v8;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (vector<unsigned)toVectorRepresentation:(CTStewieIDSDeliveryContext *)self
{
  id v15 = 0;
  v6 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v15];
  id v7 = v15;
  id v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  if (v6)
  {
    id v9 = v6;
    id v10 = [v9 bytes];
    id v11 = v9;
    id v12 = [v11 bytes];
    v13 = (char *)[v11 length];
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    sub_1001E7940(retstr, v10, (uint64_t)&v13[(void)v12], &v13[(void)v12] - (char *)v10);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }

  return result;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", service=%s", sub_100BC87FC(-[CTStewieIDSDeliveryContext service](self, "service"))];
  v4 = [(CTStewieIDSDeliveryContext *)self deliveryContext];
  [v3 appendFormat:@", deliveryContext=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToIDSDeliveryContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CTStewieIDSDeliveryContext *)self service];
  if (v5 == [v4 service])
  {
    v6 = [(CTStewieIDSDeliveryContext *)self deliveryContext];
    id v7 = [v4 deliveryContext];
    if (v6 == v7)
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      id v8 = [(CTStewieIDSDeliveryContext *)self deliveryContext];
      id v9 = [v4 deliveryContext];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieIDSDeliveryContext *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(CTStewieIDSDeliveryContext *)self isEqualToIDSDeliveryContext:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setService:", -[CTStewieIDSDeliveryContext service](self, "service"));
  BOOL v5 = [(CTStewieIDSDeliveryContext *)self deliveryContext];
  id v6 = [v5 copy];
  [v4 setDeliveryContext:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", -[CTStewieIDSDeliveryContext service](self, "service"), @"service");
  id v4 = [(CTStewieIDSDeliveryContext *)self deliveryContext];
  [v5 encodeObject:v4 forKey:@"deliveryContext"];
}

- (CTStewieIDSDeliveryContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTStewieIDSDeliveryContext;
  id v5 = [(CTStewieIDSDeliveryContext *)&v10 init];
  if (v5
    && (v5->_service = (unsigned __int16)[v4 decodeInt64ForKey:@"service"],
        [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deliveryContext"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        deliveryContext = v5->_deliveryContext,
        v5->_deliveryContext = (IDSCertifiedDeliveryContext *)v6,
        deliveryContext,
        v5->_deliveryContext))
  {
    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned __int16)a3
{
  self->_service = a3;
}

- (IDSCertifiedDeliveryContext)deliveryContext
{
  return self->_deliveryContext;
}

- (void)setDeliveryContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end