@interface SGMEventInBanner
- (PETScalarEventTracker)tracker;
- (SGMEventInBanner)init;
- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 category:(SGMEventCategory_)a5 extracted:(SGMEventExtractionType_)a6 state:(SGMEventState_)a7;
@end

@implementation SGMEventInBanner

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 category:(SGMEventCategory_)a5 extracted:(SGMEventExtractionType_)a6 state:(SGMEventState_)a7
{
  v27[4] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMBannerDisplayApp_toString(SGMBannerDisplayApp)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"SGMetricsDefines.h", 61, @"unrecognized tag %lu on SGMBannerDisplayApp", a4.var0);

    v13 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v13 = off_1E5B8F2B0[a4.var0];
  }
  if (a5.var0 >= 0xC)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventCategory_toString(SGMEventCategory)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"SGMetricsDefines.h", 224, @"unrecognized tag %lu on SGMEventCategory", a5.var0);

    v16 = @"ERR_UNMATCHED_TAG";
    if (a6.var0)
    {
LABEL_6:
      if (a6.var0 == 1)
      {
        v17 = @"Template";
      }
      else
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        v21 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventExtractionType_toString(SGMEventExtractionType)"];
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"SGMetricsDefines.h", 271, @"unrecognized tag %lu on SGMEventExtractionType", a6.var0);

        v17 = @"ERR_UNMATCHED_TAG";
      }
      goto LABEL_11;
    }
  }
  else
  {
    v16 = off_1E5B8F2C8[a5.var0];
    if (a6.var0) {
      goto LABEL_6;
    }
  }
  v17 = @"iCal";
LABEL_11:
  if (a7.var0 >= 3)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventState_toString(SGMEventState)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"SGMetricsDefines.h", 258, @"unrecognized tag %lu on SGMEventState", a7.var0);

    v22 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v22 = off_1E5B8F298[a7.var0];
  }
  tracker = self->_tracker;
  v27[0] = v13;
  v27[1] = v16;
  v27[2] = v17;
  v27[3] = v22;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v26 value:a3];
}

- (SGMEventInBanner)init
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SGMEventInBanner;
  v2 = [(SGMEventInBanner *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"App"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Category"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Extracted"];
    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"State"];
    id v7 = objc_alloc(MEMORY[0x1E4F93738]);
    v13[0] = v3;
    v13[1] = v4;
    v13[2] = v5;
    v13[3] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
    uint64_t v9 = [v7 initWithFeatureId:@"Found" event:@"EventInBanner" registerProperties:v8 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v9;
  }
  return v2;
}

@end