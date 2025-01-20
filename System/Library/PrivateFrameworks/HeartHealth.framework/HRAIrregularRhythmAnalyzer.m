@interface HRAIrregularRhythmAnalyzer
- (HRAIrregularRhythmAnalyzer)initWithIrregularRhythmVersion:(int64_t)a3;
- (id)processTachograms:(id)a3;
@end

@implementation HRAIrregularRhythmAnalyzer

- (HRAIrregularRhythmAnalyzer)initWithIrregularRhythmVersion:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HRAIrregularRhythmAnalyzer;
  return [(HRAIrregularRhythmAnalyzer *)&v4 init];
}

- (id)processTachograms:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"HKHRMockHeartRhythmAlgorithms.m" lineNumber:25 description:@"This stub implementation should never be called"];

  return 0;
}

@end