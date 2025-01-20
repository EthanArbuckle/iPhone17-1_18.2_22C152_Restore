@interface SGPatternGlobalData
@end

@implementation SGPatternGlobalData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->regexesImmuneToDeath, 0);
  objc_storeStrong((id *)&self->patternInstances, 0);
  objc_storeStrong((id *)&self->currentLanguages, 0);
  objc_storeStrong((id *)&self->patternData, 0);
  objc_storeStrong((id *)&self->patternDict, 0);
}

@end