@interface ECRawMessageHeader
- (ECRawMessageHeader)initWithHeaderFieldName:(id)a3 body:(id)a4;
- (NSString)body;
- (NSString)name;
- (NSString)transmittedName;
- (id)description;
@end

@implementation ECRawMessageHeader

- (ECRawMessageHeader)initWithHeaderFieldName:(id)a3 body:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ECRawMessageHeader;
  v8 = [(ECRawMessageHeader *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    transmittedName = v8->_transmittedName;
    v8->_transmittedName = (NSString *)v9;

    uint64_t v11 = [(NSString *)v8->_transmittedName lowercaseString];
    name = v8->_name;
    v8->_name = (NSString *)v11;

    uint64_t v13 = [v7 copy];
    body = v8->_body;
    v8->_body = (NSString *)v13;
  }
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@:%@", self->_transmittedName, self->_body];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)transmittedName
{
  return self->_transmittedName;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_transmittedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end