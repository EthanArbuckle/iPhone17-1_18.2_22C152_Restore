@interface IDSOffGridContactInfo
+ (BOOL)supportsSecureCoding;
- (IDSOffGridContactInfo)initWithCoder:(id)a3;
- (IDSOffGridContactInfo)initWithURI:(id)a3 type:(int64_t)a4;
- (IDSURI)uri;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSOffGridContactInfo

- (IDSOffGridContactInfo)initWithURI:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSOffGridContactInfo;
  v8 = [(IDSOffGridContactInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uri, a3);
    v9->_type = a4;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IDSOffGridContactInfo *)self uri];
  v5 = [v3 stringWithFormat:@"<IDSOffGridContactInfo %p>: uri %@ type %ld", self, v4, -[IDSOffGridContactInfo type](self, "type")];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uri = self->_uri;
  id v5 = a3;
  [v5 encodeObject:uri forKey:@"uri"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (IDSOffGridContactInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"type"];

  id v7 = [[IDSOffGridContactInfo alloc] initWithURI:v5 type:v6];
  return v7;
}

- (IDSURI)uri
{
  return self->_uri;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end