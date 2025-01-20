@interface JavaLangStringToReal_StringExponentPair
+ (const)__metadata;
- (float)specialValue;
- (void)dealloc;
@end

@implementation JavaLangStringToReal_StringExponentPair

- (float)specialValue
{
  float result = -INFINITY;
  if (!self->negative_) {
    float result = INFINITY;
  }
  float v3 = -0.0;
  if (!self->negative_) {
    float v3 = 0.0;
  }
  if (!self->infinity_) {
    return v3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangStringToReal_StringExponentPair;
  [(JavaLangStringToReal_StringExponentPair *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100417C80;
}

@end