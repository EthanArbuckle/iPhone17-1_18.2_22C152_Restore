@interface BCSInvalidParsedData
+ (BOOL)supportsSecureCoding;
- (BCSInvalidParsedData)initWithCoder:(id)a3;
- (BCSInvalidParsedData)initWithInvalidDataType:(int64_t)a3 invalidContents:(id)a4;
- (NSString)extraPreviewText;
- (NSString)invalidContents;
- (NSString)invalidURLScheme;
- (int64_t)invalidDataType;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setInvalidContents:(id)a3;
- (void)setInvalidURLScheme:(id)a3;
@end

@implementation BCSInvalidParsedData

- (BCSInvalidParsedData)initWithInvalidDataType:(int64_t)a3 invalidContents:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCSInvalidParsedData;
  v7 = [(BCSInvalidParsedData *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_invalidDataType = a3;
    uint64_t v9 = [v6 copy];
    invalidContents = v8->_invalidContents;
    v8->_invalidContents = (NSString *)v9;

    v11 = v8;
  }

  return v8;
}

- (int64_t)type
{
  return 0;
}

- (NSString)extraPreviewText
{
  return 0;
}

- (BCSInvalidParsedData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"invalidDataType");
  id v6 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"invalidContents");
  v7 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:](self, "initWithInvalidDataType:invalidContents:", [v5 integerValue], v6);
  v8 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"invalidURLScheme");

  if ([v8 length]) {
    [(BCSInvalidParsedData *)v7 setInvalidURLScheme:v8];
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t invalidDataType = self->_invalidDataType;
  id v5 = a3;
  [v5 encodeInteger:invalidDataType forKey:@"invalidDataType"];
  [v5 encodeObject:self->_invalidContents forKey:@"invalidContents"];
  [v5 encodeObject:self->_invalidURLScheme forKey:@"invalidURLScheme"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)invalidDataType
{
  return self->_invalidDataType;
}

- (NSString)invalidContents
{
  return self->_invalidContents;
}

- (void)setInvalidContents:(id)a3
{
}

- (NSString)invalidURLScheme
{
  return self->_invalidURLScheme;
}

- (void)setInvalidURLScheme:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidURLScheme, 0);
  objc_storeStrong((id *)&self->_invalidContents, 0);
}

@end