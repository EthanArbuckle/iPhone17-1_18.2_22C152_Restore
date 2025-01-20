@interface HKScoredAssessmentType
+ (id)gad7Type;
+ (id)phq9Type;
- (HKScoredAssessmentType)initWithIdentifier:(id)a3;
@end

@implementation HKScoredAssessmentType

- (HKScoredAssessmentType)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[HKObjectType scoredAssessmentTypeForIdentifier:v4];

  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid %@ identifier \"%@\"", objc_opt_class(), v4 format];
  }

  return v5;
}

+ (id)gad7Type
{
  v2 = [[HKScoredAssessmentType alloc] initWithIdentifier:@"HKScoredAssessmentTypeIdentifierGAD7"];

  return v2;
}

+ (id)phq9Type
{
  v2 = [[HKScoredAssessmentType alloc] initWithIdentifier:@"HKScoredAssessmentTypeIdentifierPHQ9"];

  return v2;
}

@end