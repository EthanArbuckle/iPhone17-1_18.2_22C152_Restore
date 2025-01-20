@interface AVVCDuckFadeDuration
- (AVVCDuckFadeDuration)initWithFadeIn:(id)a3 fadeOut:(id)a4;
- (NSNumber)fadeIn;
- (NSNumber)fadeOut;
- (id)description;
- (void)setFadeIn:(id)a3;
- (void)setFadeOut:(id)a3;
@end

@implementation AVVCDuckFadeDuration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOut, 0);

  objc_storeStrong((id *)&self->_fadeIn, 0);
}

- (void)setFadeOut:(id)a3
{
}

- (NSNumber)fadeOut
{
  return self->_fadeOut;
}

- (void)setFadeIn:(id)a3
{
}

- (NSNumber)fadeIn
{
  return self->_fadeIn;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<fadeIn(%@), fadeOut(%@)>", self->_fadeIn, self->_fadeOut];
}

- (AVVCDuckFadeDuration)initWithFadeIn:(id)a3 fadeOut:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVVCDuckFadeDuration;
  v9 = [(AVVCDuckFadeDuration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fadeIn, a3);
    objc_storeStrong((id *)&v10->_fadeOut, a4);
  }

  return v10;
}

@end