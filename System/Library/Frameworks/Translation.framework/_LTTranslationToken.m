@interface _LTTranslationToken
+ (BOOL)supportsSecureCoding;
- (NSString)text;
- (_LTTranslationToken)initWithCoder:(id)a3;
- (_LTTranslationToken)initWithText:(id)a3 confidence:(double)a4;
- (double)confidence;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setText:(id)a3;
@end

@implementation _LTTranslationToken

- (_LTTranslationToken)initWithText:(id)a3 confidence:(double)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTTranslationToken;
  v7 = [(_LTTranslationToken *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    text = v7->_text;
    v7->_text = (NSString *)v8;

    v7->_confidence = a4;
    v10 = v7;
  }

  return v7;
}

- (_LTTranslationToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LTTranslationToken;
  v5 = [(_LTTranslationToken *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v8;
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
}

@end