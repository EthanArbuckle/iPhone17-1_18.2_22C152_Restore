@interface TESPatternMatcherSlash
- (TESPatternMatcherSlash)init;
@end

@implementation TESPatternMatcherSlash

- (TESPatternMatcherSlash)init
{
  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherSlash;
  v3 = [(TESPatternMatcherBase *)&v5 init];
  if (v3 == self)
  {
    [(TESPatternMatcherBase *)self setEffectType:11];
    [(TESPatternMatcherBase *)self setPattern:@"/.+?/"];
    [(TESPatternMatcherBase *)self configurePrecompiledRegularExpression];
  }
  return v3;
}

@end