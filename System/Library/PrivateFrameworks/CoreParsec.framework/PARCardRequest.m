@interface PARCardRequest
+ (BOOL)supportsSecureCoding;
- (NSURL)cardURL;
- (PARCardRequest)initWithCoder:(id)a3;
- (unsigned)nwActivityLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setCardURL:(id)a3;
@end

@implementation PARCardRequest

- (void).cxx_destruct
{
}

- (void)setCardURL:(id)a3
{
}

- (NSURL)cardURL
{
  return self->_cardURL;
}

- (unsigned)nwActivityLabel
{
  return 8;
}

- (PARCardRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PARCardRequest;
  v5 = [(PARRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    cardURL = v5->_cardURL;
    v5->_cardURL = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARCardRequest;
  id v4 = a3;
  [(PARRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardURL, @"url", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end