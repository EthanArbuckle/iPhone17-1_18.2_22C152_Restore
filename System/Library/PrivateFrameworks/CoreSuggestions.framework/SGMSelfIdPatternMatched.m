@interface SGMSelfIdPatternMatched
- (PETScalarEventTracker)tracker;
- (SGMSelfIdPatternMatched)init;
- (void)trackEventWithScalar:(unint64_t)a3 patternType:(SGMSIPatternType_)a4 patternHash:(id)a5 nameTokens:(unint64_t)a6 nameClass:(SGMSINameClassification_)a7 messageIndex:(unint64_t)a8;
@end

@implementation SGMSelfIdPatternMatched

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 patternType:(SGMSIPatternType_)a4 patternHash:(id)a5 nameTokens:(unint64_t)a6 nameClass:(SGMSINameClassification_)a7 messageIndex:(unint64_t)a8
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v15 = @"SelfIdRequest";
    }
    else
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMSIPatternType_toString(SGMSIPatternType)"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"SGMetricsDefines.h", 524, @"unrecognized tag %lu on SGMSIPatternType", a4.var0);

      v15 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v15 = @"SelfId";
  }
  id v18 = v14;
  if (a7.var0 >= 3)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMSINameClassification_toString(SGMSINameClassification)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"SGMetricsDefines.h", 511, @"unrecognized tag %lu on SGMSINameClassification", a7.var0);

    v19 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v19 = off_1E5B8F580[a7.var0];
  }
  tracker = self->_tracker;
  v26[0] = v15;
  v26[1] = v18;
  v23 = [NSNumber numberWithUnsignedInteger:a6];
  v26[2] = v23;
  v26[3] = v19;
  v24 = [NSNumber numberWithUnsignedInteger:a8];
  v26[4] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v25 value:a3];
}

- (SGMSelfIdPatternMatched)init
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SGMSelfIdPatternMatched;
  v2 = [(SGMSelfIdPatternMatched *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"PatternType"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"PatternHash"];
    v5 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"NameTokens", 1, 2, 1);
    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"NameClass"];
    v7 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"MessageIndex", 0, 5, 1);
    id v8 = objc_alloc(MEMORY[0x1E4F93738]);
    v14[0] = v3;
    v14[1] = v4;
    v14[2] = v5;
    v14[3] = v6;
    v14[4] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
    uint64_t v10 = [v8 initWithFeatureId:@"Found" event:@"SelfIdPatternMatched" registerProperties:v9 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v10;
  }
  return v2;
}

@end