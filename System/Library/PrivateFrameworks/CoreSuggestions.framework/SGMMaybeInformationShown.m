@interface SGMMaybeInformationShown
- (PETScalarEventTracker)tracker;
- (SGMMaybeInformationShown)init;
- (void)trackEventWithScalar:(unint64_t)a3 extracted:(SGMBannerExtractionType_)a4 extractionModelVersion:(unint64_t)a5;
@end

@implementation SGMMaybeInformationShown

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 extracted:(SGMBannerExtractionType_)a4 extractionModelVersion:(unint64_t)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMBannerExtractionType_toString(SGMBannerExtractionType)"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"SGMetricsDefines.h", 111, @"unrecognized tag %lu on SGMBannerExtractionType", a4.var0);

    v9 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v9 = off_1E5B8F278[a4.var0];
  }
  tracker = self->_tracker;
  v15[0] = v9;
  v13 = [NSNumber numberWithUnsignedInteger:a5];
  v15[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v14 value:a3];
}

- (SGMMaybeInformationShown)init
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SGMMaybeInformationShown;
  v2 = [(SGMMaybeInformationShown *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Extracted"];
    v4 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"ExtractionModelVersion", 0, 1000, 1);
    id v5 = objc_alloc(MEMORY[0x1E4F93738]);
    v11[0] = v3;
    v11[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v7 = [v5 initWithFeatureId:@"Found" event:@"MaybeShown" registerProperties:v6 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v7;
  }
  return v2;
}

@end