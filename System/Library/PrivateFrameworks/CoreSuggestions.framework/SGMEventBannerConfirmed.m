@interface SGMEventBannerConfirmed
- (PETScalarEventTracker)tracker;
- (SGMEventBannerConfirmed)init;
- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 category:(SGMEventCategory_)a5 extracted:(SGMEventExtractionType_)a6 state:(SGMEventState_)a7 titleAdj:(SGMEventStringAdj_)a8 dateAdj:(SGMEventDateAdj_)a9 duraAdj:(SGMEventDurationAdj_)a10;
@end

@implementation SGMEventBannerConfirmed

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 category:(SGMEventCategory_)a5 extracted:(SGMEventExtractionType_)a6 state:(SGMEventState_)a7 titleAdj:(SGMEventStringAdj_)a8 dateAdj:(SGMEventDateAdj_)a9 duraAdj:(SGMEventDurationAdj_)a10
{
  v42[7] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 3)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMBannerDisplayApp_toString(SGMBannerDisplayApp)"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"SGMetricsDefines.h", 61, @"unrecognized tag %lu on SGMBannerDisplayApp", a4.var0);

    v15 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v15 = off_1E5B8F2B0[a4.var0];
  }
  v39 = v15;
  if (a5.var0 >= 0xC)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventCategory_toString(SGMEventCategory)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"SGMetricsDefines.h", 224, @"unrecognized tag %lu on SGMEventCategory", a5.var0);

    v18 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v18 = off_1E5B8F2C8[a5.var0];
  }
  v38 = v18;
  if (a6.var0)
  {
    if (a6.var0 == 1)
    {
      v21 = @"Template";
    }
    else
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventExtractionType_toString(SGMEventExtractionType)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"SGMetricsDefines.h", 271, @"unrecognized tag %lu on SGMEventExtractionType", a6.var0);

      v21 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v21 = @"iCal";
  }
  if (a7.var0 >= 3)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventState_toString(SGMEventState)"];
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"SGMetricsDefines.h", 258, @"unrecognized tag %lu on SGMEventState", a7.var0);

    v24 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v24 = off_1E5B8F298[a7.var0];
  }
  if (a8.var0 >= 5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventStringAdj_toString(SGMEventStringAdj)"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"SGMetricsDefines.h", 290, @"unrecognized tag %lu on SGMEventStringAdj", a8.var0);

    v27 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v27 = off_1E5B8F3F0[a8.var0];
  }
  if (a9.var0 >= 0xA)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventDateAdj_toString(SGMEventDateAdj)"];
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"SGMetricsDefines.h", 319, @"unrecognized tag %lu on SGMEventDateAdj", a9.var0);

    v30 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v30 = off_1E5B8F418[a9.var0];
  }
  if (a10.var0 >= 6)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    v35 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventDurationAdj_toString(SGMEventDurationAdj)"];
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"SGMetricsDefines.h", 340, @"unrecognized tag %lu on SGMEventDurationAdj", a10.var0);

    v33 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v33 = off_1E5B8F468[a10.var0];
  }
  tracker = self->_tracker;
  v42[0] = v39;
  v42[1] = v38;
  v42[2] = v21;
  v42[3] = v24;
  v42[4] = v27;
  v42[5] = v30;
  v42[6] = v33;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:7];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v37 value:a3];
}

- (SGMEventBannerConfirmed)init
{
  v16[7] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SGMEventBannerConfirmed;
  v2 = [(SGMEventBannerConfirmed *)&v15 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"App"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Category"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Extracted"];
    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"State"];
    v7 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"TiA"];
    v8 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"DaA"];
    v9 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"DuA"];
    id v10 = objc_alloc(MEMORY[0x1E4F93738]);
    v16[0] = v3;
    v16[1] = v4;
    v16[2] = v5;
    v16[3] = v6;
    v16[4] = v7;
    v16[5] = v8;
    v16[6] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:7];
    uint64_t v12 = [v10 initWithFeatureId:@"Found" event:@"EventBannerConfirmed" registerProperties:v11 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v12;
  }
  return v2;
}

@end