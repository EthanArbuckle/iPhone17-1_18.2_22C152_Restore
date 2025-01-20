@interface AVVCDuckLevel
- (AVVCDuckLevel)init;
- (BOOL)isBlur;
- (NSNumber)value;
- (id)description;
- (void)setIsBlur:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation AVVCDuckLevel

- (void).cxx_destruct
{
}

- (void)setIsBlur:(BOOL)a3
{
  self->_isBlur = a3;
}

- (BOOL)isBlur
{
  return self->_isBlur;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<duckToLevel(%@), isBlur(%d)>", self->_value, self->_isBlur];
}

- (AVVCDuckLevel)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVVCDuckLevel;
  v2 = [(AVVCDuckLevel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    value = v2->_value;
    v2->_value = 0;

    v3->_isBlur = 0;
  }
  return v3;
}

@end