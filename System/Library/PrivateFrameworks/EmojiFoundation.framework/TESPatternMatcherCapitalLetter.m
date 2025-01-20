@interface TESPatternMatcherCapitalLetter
- (TESPatternMatcherCapitalLetter)init;
@end

@implementation TESPatternMatcherCapitalLetter

- (TESPatternMatcherCapitalLetter)init
{
  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherCapitalLetter;
  v3 = [(TESPatternMatcherBase *)&v5 init];
  if (v3 == self)
  {
    [(TESPatternMatcherBase *)self setEffectType:1];
    [(TESPatternMatcherBase *)self setPattern:@"[[:upper:]]{5,}"];
    [(TESPatternMatcherBase *)self configurePrecompiledRegularExpression];
  }
  return v3;
}

@end