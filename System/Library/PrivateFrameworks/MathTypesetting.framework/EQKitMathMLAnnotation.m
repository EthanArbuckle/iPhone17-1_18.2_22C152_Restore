@interface EQKitMathMLAnnotation
- (EQKitSourceAttribution)sourceAttribution;
- (const)mathMLAttributes;
- (void)dealloc;
- (void)setSourceAttribution:(id)a3;
@end

@implementation EQKitMathMLAnnotation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLAnnotation;
  [(EQKitMathMLAnnotation *)&v3 dealloc];
}

- (const)mathMLAttributes
{
  return 0;
}

- (EQKitSourceAttribution)sourceAttribution
{
  return self->mSourceAttribution;
}

- (void)setSourceAttribution:(id)a3
{
}

@end