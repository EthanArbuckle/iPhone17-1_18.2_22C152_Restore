@interface ExternalPurchaseLinkResponse
+ (BOOL)supportsSecureCoding;
- (ExternalPurchaseLinkResponse)initWithCoder:(id)a3;
- (ExternalPurchaseLinkResponse)initWithSingle:(id)a3 multi:(id)a4;
- (NSArray)multi;
- (NSURL)single;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ExternalPurchaseLinkResponse

- (ExternalPurchaseLinkResponse)initWithSingle:(id)a3 multi:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(ExternalPurchaseLinkResponse *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_single, a3);
    objc_storeStrong((id *)&v10->_multi, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ExternalPurchaseLinkResponse *)self single];
  [v4 encodeObject:v5 forKey:@"single"];

  id v6 = [(ExternalPurchaseLinkResponse *)self multi];
  [v4 encodeObject:v6 forKey:@"multi"];
}

- (ExternalPurchaseLinkResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"single"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"multi"];

  v10 = [(ExternalPurchaseLinkResponse *)self initWithSingle:v5 multi:v9];
  return v10;
}

- (NSURL)single
{
  return self->_single;
}

- (NSArray)multi
{
  return self->_multi;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multi, 0);

  objc_storeStrong((id *)&self->_single, 0);
}

@end