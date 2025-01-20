@interface SGMSelfIdModelScore
- (PETScalarEventTracker)tracker;
- (SGMSelfIdModelScore)init;
- (void)trackEventWithScalar:(unint64_t)a3 model:(SGMSelfIdModelType_)a4 result:(SGMTypeSafeBool_)a5 supervision:(SGMSelfIdSupervisionType_)a6 extractionModelVersion:(unint64_t)a7;
@end

@implementation SGMSelfIdModelScore

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 model:(SGMSelfIdModelType_)a4 result:(SGMTypeSafeBool_)a5 supervision:(SGMSelfIdSupervisionType_)a6 extractionModelVersion:(unint64_t)a7
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 4)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMSelfIdModelType_toString(SGMSelfIdModelType)"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"SGMetricsDefines.h", 654, @"unrecognized tag %lu on SGMSelfIdModelType", a4.var0);

    v13 = @"ERR_UNMATCHED_TAG";
    if (a5.var0)
    {
LABEL_3:
      if (a5.var0 == 1)
      {
        v14 = @"1";
      }
      else
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        v18 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a5.var0);

        v14 = @"ERR_UNMATCHED_TAG";
      }
      goto LABEL_8;
    }
  }
  else
  {
    v13 = off_1E5B8F728[a4.var0];
    if (a5.var0) {
      goto LABEL_3;
    }
  }
  v14 = @"0";
LABEL_8:
  if (a6.var0 >= 6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMSelfIdSupervisionType_toString(SGMSelfIdSupervisionType)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"SGMetricsDefines.h", 675, @"unrecognized tag %lu on SGMSelfIdSupervisionType", a6.var0);

    v19 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v19 = off_1E5B8F748[a6.var0];
  }
  tracker = self->_tracker;
  v25[0] = v13;
  v25[1] = v14;
  v25[2] = v19;
  v23 = [NSNumber numberWithUnsignedInteger:a7];
  v25[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v24 value:a3];
}

- (SGMSelfIdModelScore)init
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SGMSelfIdModelScore;
  v2 = [(SGMSelfIdModelScore *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Model"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Result"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Supervision"];
    v6 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"ExtractionModelVersion", 0, 1000, 1);
    id v7 = objc_alloc(MEMORY[0x1E4F93738]);
    v13[0] = v3;
    v13[1] = v4;
    v13[2] = v5;
    v13[3] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
    uint64_t v9 = [v7 initWithFeatureId:@"Found" event:@"SelfIdModelScore" registerProperties:v8 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v9;
  }
  return v2;
}

@end