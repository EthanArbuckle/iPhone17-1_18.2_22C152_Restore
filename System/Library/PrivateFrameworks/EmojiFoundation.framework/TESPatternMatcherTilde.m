@interface TESPatternMatcherTilde
- (TESPatternMatcherTilde)init;
@end

@implementation TESPatternMatcherTilde

- (TESPatternMatcherTilde)init
{
  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherTilde;
  v3 = [(TESPatternMatcherBase *)&v5 init];
  if (v3 == self)
  {
    [(TESPatternMatcherBase *)self setEffectType:8];
    [(TESPatternMatcherBase *)self setPattern:@"\\b\\w+~+$"];
    [(TESPatternMatcherBase *)self configurePrecompiledRegularExpression];
  }
  return v3;
}

@end