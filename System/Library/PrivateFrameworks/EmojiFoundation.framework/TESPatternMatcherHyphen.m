@interface TESPatternMatcherHyphen
- (TESPatternMatcherHyphen)init;
@end

@implementation TESPatternMatcherHyphen

- (TESPatternMatcherHyphen)init
{
  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherHyphen;
  v3 = [(TESPatternMatcherBase *)&v5 init];
  if (v3 == self)
  {
    [(TESPatternMatcherBase *)self setEffectType:12];
    [(TESPatternMatcherBase *)self setPattern:@"-\\w([\\w\\s]*\\w)?-"];
    [(TESPatternMatcherBase *)self configurePrecompiledRegularExpression];
  }
  return v3;
}

@end