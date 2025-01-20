@interface TIKeyboardInputManager
+ (void)swizzleTestingParameters;
- (id)mockTestingParameters;
@end

@implementation TIKeyboardInputManager

- (id)mockTestingParameters
{
  v4[0] = @"trialExperimentId";
  v4[1] = @"trialTreatmentId";
  v5[0] = @"mockMockTrialExperimentIdValue";
  v5[1] = @"mockMockTrialTreatmentIdValue";
  v4[2] = @"trialSubjectId";
  v4[3] = @"trialTrackingId";
  v5[2] = @"mockTtrialSubjectIdValue";
  v5[3] = @"mockMockTrialTrackingIdValue";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];

  return v2;
}

+ (void)swizzleTestingParameters
{
  if (qword_AE3F8 != -1) {
    dispatch_once(&qword_AE3F8, &stru_8CF70);
  }
}

@end