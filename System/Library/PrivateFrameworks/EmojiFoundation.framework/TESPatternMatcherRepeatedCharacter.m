@interface TESPatternMatcherRepeatedCharacter
- (TESPatternMatcherRepeatedCharacter)init;
@end

@implementation TESPatternMatcherRepeatedCharacter

- (TESPatternMatcherRepeatedCharacter)init
{
  v6.receiver = self;
  v6.super_class = (Class)TESPatternMatcherRepeatedCharacter;
  v3 = [(TESPatternMatcherBase *)&v6 init];
  if (v3 == self)
  {
    [(TESPatternMatcherBase *)self setEffectType:7];
    v4 = [NSString stringWithFormat:@"\\b(%@*(%@)\\2{2,}%@*)\\b", @"[\\p{Alphabetic}\\p{Mark}\\p{Connector_Punctuation}\\u200c\\u200d]", @"[\\p{Alphabetic}\\p{Mark}\\p{Connector_Punctuation}\\u200c\\u200d]", @"[\\p{Alphabetic}\\p{Mark}\\p{Connector_Punctuation}\\u200c\\u200d]"];
    [(TESPatternMatcherBase *)self setPattern:v4];

    [(TESPatternMatcherBase *)self configurePrecompiledRegularExpression];
  }
  return v3;
}

@end