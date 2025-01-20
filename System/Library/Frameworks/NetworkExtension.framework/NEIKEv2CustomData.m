@interface NEIKEv2CustomData
- (NSData)customData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)customType;
- (void)setCustomData:(id)a3;
- (void)setCustomType:(unint64_t)a3;
@end

@implementation NEIKEv2CustomData

- (void).cxx_destruct
{
}

- (void)setCustomData:(id)a3
{
}

- (NSData)customData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCustomType:(unint64_t)a3
{
  self->_customType = a3;
}

- (unint64_t)customType
{
  return self->_customType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCustomType:", -[NEIKEv2CustomData customType](self, "customType"));
  v5 = [(NEIKEv2CustomData *)self customData];
  v6 = (void *)[v5 copy];
  [v4 setCustomData:v6];

  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  unint64_t v4 = [(NEIKEv2CustomData *)self customType];
  v5 = [(NEIKEv2CustomData *)self customData];
  v6 = (void *)[v3 initWithFormat:@"Custom Payload %lld: %@", v4, v5];

  return v6;
}

@end