@interface BCSStringData
+ (BOOL)supportsSecureCoding;
- (BCSStringData)initWithCoder:(id)a3;
- (BCSStringData)initWithString:(id)a3;
- (NSString)extraPreviewText;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSStringData

- (BCSStringData)initWithString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSStringData;
  v5 = [(BCSStringData *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    extraPreviewText = v5->_extraPreviewText;
    v5->_extraPreviewText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)type
{
  return 10;
}

- (BCSStringData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"extraPreviewText");

  uint64_t v6 = [(BCSStringData *)self initWithString:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)extraPreviewText
{
  return self->_extraPreviewText;
}

- (void).cxx_destruct
{
}

@end