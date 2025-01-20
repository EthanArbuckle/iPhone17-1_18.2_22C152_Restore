@interface EMTTranslationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)enableDisambiguationAlternatives;
- (EMTTranslationOptions)init;
- (EMTTranslationOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEnableDisambiguationAlternatives:(BOOL)a3;
@end

@implementation EMTTranslationOptions

- (EMTTranslationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)EMTTranslationOptions;
  result = [(EMTTranslationOptions *)&v3 init];
  if (result) {
    result->_enableDisambiguationAlternatives = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setEnableDisambiguationAlternatives:", -[EMTTranslationOptions enableDisambiguationAlternatives](self, "enableDisambiguationAlternatives"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (EMTTranslationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMTTranslationOptions;
  v5 = [(EMTTranslationOptions *)&v7 init];
  if (v5) {
    v5->_enableDisambiguationAlternatives = [v4 decodeBoolForKey:@"enableDisambiguationAlternatives"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)enableDisambiguationAlternatives
{
  return self->_enableDisambiguationAlternatives;
}

- (void)setEnableDisambiguationAlternatives:(BOOL)a3
{
  self->_enableDisambiguationAlternatives = a3;
}

@end