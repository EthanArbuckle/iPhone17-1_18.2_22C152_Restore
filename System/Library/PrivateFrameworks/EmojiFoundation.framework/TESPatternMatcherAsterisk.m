@interface TESPatternMatcherAsterisk
- (TESPatternMatcherAsterisk)init;
@end

@implementation TESPatternMatcherAsterisk

- (TESPatternMatcherAsterisk)init
{
  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherAsterisk;
  v3 = [(TESPatternMatcherBase *)&v5 init];
  if (v3 == self)
  {
    [(TESPatternMatcherBase *)self setEffectType:9];
    [(TESPatternMatcherBase *)self setPattern:@"\\*\\w([\\w\\s]*\\w)?\\*"];
    [(TESPatternMatcherBase *)self configurePrecompiledRegularExpression];
  }
  return v3;
}

@end