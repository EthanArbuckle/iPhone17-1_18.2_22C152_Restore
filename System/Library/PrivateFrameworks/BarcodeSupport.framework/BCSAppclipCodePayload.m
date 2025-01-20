@interface BCSAppclipCodePayload
+ (BOOL)supportsSecureCoding;
- (BCSAppclipCodePayload)initWithCoder:(id)a3;
- (BCSAppclipCodePayload)initWithData:(id)a3 version:(unint64_t)a4;
- (int64_t)codeType;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSAppclipCodePayload

- (BCSAppclipCodePayload)initWithData:(id)a3 version:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSAppclipCodePayload;
  v8 = [(BCSAppclipCodePayload *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_payload, a3);
    v9->_version = a4;
    v10 = v9;
  }

  return v9;
}

- (int64_t)codeType
{
  return 3;
}

- (BCSAppclipCodePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"payloadData");
  v6 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"version");

  id v7 = -[BCSAppclipCodePayload initWithData:version:](self, "initWithData:version:", v5, [v6 unsignedIntegerValue]);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  payload = self->_payload;
  id v5 = a3;
  [v5 encodeObject:payload forKey:@"payloadData"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_version];
  [v5 encodeObject:v6 forKey:@"version"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end