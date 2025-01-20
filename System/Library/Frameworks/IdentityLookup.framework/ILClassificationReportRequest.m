@interface ILClassificationReportRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (ILClassificationReportRequest)initWithCoder:(id)a3;
- (ILClassificationReportRequest)initWithExtensionIdentifier:(id)a3 jsonDictionary:(id)a4;
- (NSDictionary)jsonDictionary;
- (NSString)extensionIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setJsonDictionary:(id)a3;
@end

@implementation ILClassificationReportRequest

- (ILClassificationReportRequest)initWithExtensionIdentifier:(id)a3 jsonDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ILClassificationReportRequest;
  v8 = [(ILClassificationReportRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    extensionIdentifier = v8->_extensionIdentifier;
    v8->_extensionIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    jsonDictionary = v8->_jsonDictionary;
    v8->_jsonDictionary = (NSDictionary *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ILClassificationReportRequest *)self extensionIdentifier];
  id v6 = [(ILClassificationReportRequest *)self jsonDictionary];
  id v7 = [v3 stringWithFormat:@"<%@ %p extensionIdentifier=%@ jsonDict=%@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(ILClassificationReportRequest *)self isEqualToRequest:v4];

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ILClassificationReportRequest *)self extensionIdentifier];
  id v6 = [v4 extensionIdentifier];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [(ILClassificationReportRequest *)self jsonDictionary];
    uint64_t v8 = [v4 jsonDictionary];
    if (v7 | v8) {
      char v9 = [(id)v7 isEqual:v8];
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(ILClassificationReportRequest *)self extensionIdentifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(ILClassificationReportRequest *)self jsonDictionary];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILClassificationReportRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = NSStringFromSelector(sel_extensionIdentifier);
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
  objc_super v14 = NSStringFromSelector(sel_jsonDictionary);
  v15 = [v4 decodeObjectOfClasses:v13 forKey:v14];

  v16 = [(ILClassificationReportRequest *)self initWithExtensionIdentifier:v7 jsonDictionary:v15];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ILClassificationReportRequest *)self extensionIdentifier];
  unint64_t v6 = NSStringFromSelector(sel_extensionIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(ILClassificationReportRequest *)self jsonDictionary];
  uint64_t v7 = NSStringFromSelector(sel_jsonDictionary);
  [v4 encodeObject:v8 forKey:v7];
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (void)setJsonDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDictionary, 0);

  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end