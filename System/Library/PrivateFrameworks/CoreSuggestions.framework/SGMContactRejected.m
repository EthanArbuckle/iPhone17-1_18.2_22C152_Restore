@interface SGMContactRejected
- (PETScalarEventTracker)tracker;
- (SGMContactRejected)init;
- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 extracted:(SGMBannerExtractionType_)a5 selfId:(SGMTypeSafeBool_)a6 extractionModelVersion:(unint64_t)a7 contactDetail:(SGMContactDetailType_)a8;
@end

@implementation SGMContactRejected

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 extracted:(SGMBannerExtractionType_)a5 selfId:(SGMTypeSafeBool_)a6 extractionModelVersion:(unint64_t)a7 contactDetail:(SGMContactDetailType_)a8
{
  v30[5] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 3)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMBannerDisplayApp_toString(SGMBannerDisplayApp)"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"SGMetricsDefines.h", 61, @"unrecognized tag %lu on SGMBannerDisplayApp", a4.var0);

    v14 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v14 = off_1E5B8F2B0[a4.var0];
  }
  if (a5.var0 >= 4)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMBannerExtractionType_toString(SGMBannerExtractionType)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"SGMetricsDefines.h", 111, @"unrecognized tag %lu on SGMBannerExtractionType", a5.var0);

    v17 = @"ERR_UNMATCHED_TAG";
    if (a6.var0)
    {
LABEL_6:
      if (a6.var0 == 1)
      {
        v18 = @"1";
      }
      else
      {
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        v22 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a6.var0);

        v18 = @"ERR_UNMATCHED_TAG";
      }
      goto LABEL_11;
    }
  }
  else
  {
    v17 = off_1E5B8F278[a5.var0];
    if (a6.var0) {
      goto LABEL_6;
    }
  }
  v18 = @"0";
LABEL_11:
  if (a8.var0 >= 5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"SGMetricsDefines.h", 159, @"unrecognized tag %lu on SGMContactDetailType", a8.var0);

    v23 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v23 = off_1E5B8F6C8[a8.var0];
  }
  tracker = self->_tracker;
  v30[0] = v14;
  v30[1] = v17;
  v30[2] = v18;
  v27 = [NSNumber numberWithUnsignedInteger:a7];
  v30[3] = v27;
  v30[4] = v23;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v28 value:a3];
}

- (SGMContactRejected)init
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SGMContactRejected;
  v2 = [(SGMContactRejected *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"App"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Extracted"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"SelfId"];
    v6 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"ExtractionModelVersion", 0, 1000, 1);
    v7 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"ContactDetail"];
    id v8 = objc_alloc(MEMORY[0x1E4F93738]);
    v14[0] = v3;
    v14[1] = v4;
    v14[2] = v5;
    v14[3] = v6;
    v14[4] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
    uint64_t v10 = [v8 initWithFeatureId:@"Found" event:@"ContactRejected" registerProperties:v9 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v10;
  }
  return v2;
}

@end