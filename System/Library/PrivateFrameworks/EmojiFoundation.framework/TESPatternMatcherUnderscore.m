@interface TESPatternMatcherUnderscore
- (TESPatternMatcherUnderscore)init;
@end

@implementation TESPatternMatcherUnderscore

- (TESPatternMatcherUnderscore)init
{
  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherUnderscore;
  v3 = [(TESPatternMatcherBase *)&v5 init];
  if (v3 == self)
  {
    [(TESPatternMatcherBase *)self setEffectType:10];
    [(TESPatternMatcherBase *)self setPattern:@"_.+?_"];
    [(TESPatternMatcherBase *)self configurePrecompiledRegularExpression];
  }
  return v3;
}

@end