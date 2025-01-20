@interface CHSFontSpecificationFontFeature
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSFontSpecificationFontFeature)initWithBSXPCCoder:(id)a3;
- (CHSFontSpecificationFontFeature)initWithType:(int64_t)a3 selector:(int64_t)a4;
- (int64_t)selector;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CHSFontSpecificationFontFeature

- (CHSFontSpecificationFontFeature)initWithType:(int64_t)a3 selector:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHSFontSpecificationFontFeature;
  result = [(CHSFontSpecificationFontFeature *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_selector = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSFontSpecificationFontFeature *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4->_type && self->_selector == v4->_selector;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_type];
  id v5 = (id)[v3 appendInteger:self->_selector];
  unint64_t v6 = [v3 hash];

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_type forKey:@"type"];
  [v4 encodeInt64:self->_selector forKey:@"selector"];
}

- (CHSFontSpecificationFontFeature)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSFontSpecificationFontFeature *)self init];
  if (v5)
  {
    v5->_type = [v4 decodeInt64ForKey:@"type"];
    v5->_selector = [v4 decodeInt64ForKey:@"selector"];
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)selector
{
  return self->_selector;
}

@end