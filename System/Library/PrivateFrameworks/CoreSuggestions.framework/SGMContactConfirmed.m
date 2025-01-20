@interface SGMContactConfirmed
- (PETScalarEventTracker)tracker;
- (SGMContactConfirmed)init;
- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 firstNameAdj:(SGMTypeSafeBool_)a5 lastNameAdj:(SGMTypeSafeBool_)a6 middleNameAdj:(SGMTypeSafeBool_)a7 isUpdate:(SGMTypeSafeBool_)a8 extracted:(SGMBannerExtractionType_)a9 extractionModelVersion:(unint64_t)a10 selfId:(SGMTypeSafeBool_)a11 contactDetail:(SGMContactDetailType_)a12;
@end

@implementation SGMContactConfirmed

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 firstNameAdj:(SGMTypeSafeBool_)a5 lastNameAdj:(SGMTypeSafeBool_)a6 middleNameAdj:(SGMTypeSafeBool_)a7 isUpdate:(SGMTypeSafeBool_)a8 extracted:(SGMBannerExtractionType_)a9 extractionModelVersion:(unint64_t)a10 selfId:(SGMTypeSafeBool_)a11 contactDetail:(SGMContactDetailType_)a12
{
  v54[9] = *MEMORY[0x1E4F143B8];
  unint64_t v19 = 0x1E4F28000uLL;
  if (a4.var0 >= 3)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMBannerDisplayApp_toString(SGMBannerDisplayApp)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"SGMetricsDefines.h", 61, @"unrecognized tag %lu on SGMBannerDisplayApp", a4.var0);

    unint64_t v19 = 0x1E4F28000;
    v20 = @"ERR_UNMATCHED_TAG";
    if (a5.var0)
    {
LABEL_3:
      if (a5.var0 == 1)
      {
        v21 = @"1";
      }
      else
      {
        v24 = [*(id *)(v19 + 2816) currentHandler];
        v25 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a5.var0);

        v21 = @"ERR_UNMATCHED_TAG";
      }
      goto LABEL_8;
    }
  }
  else
  {
    v20 = off_1E5B8F2B0[a4.var0];
    if (a5.var0) {
      goto LABEL_3;
    }
  }
  v21 = @"0";
LABEL_8:
  v52 = v21;
  if (a6.var0)
  {
    if (a6.var0 == 1)
    {
      v26 = @"1";
    }
    else
    {
      v27 = [*(id *)(v19 + 2816) currentHandler];
      v28 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a6.var0);

      v26 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v26 = @"0";
  }
  v51 = v26;
  unint64_t v53 = a3;
  v29 = self;
  if (a7.var0)
  {
    if (a7.var0 == 1)
    {
      v30 = @"1";
    }
    else
    {
      v31 = [*(id *)(v19 + 2816) currentHandler];
      v32 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a7.var0);

      v30 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v30 = @"0";
  }
  v50 = v30;
  if (a8.var0)
  {
    if (a8.var0 == 1)
    {
      v33 = @"1";
    }
    else
    {
      v34 = [*(id *)(v19 + 2816) currentHandler];
      v35 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a8.var0);

      v33 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v33 = @"0";
  }
  if (a9.var0 >= 4)
  {
    v37 = [*(id *)(v19 + 2816) currentHandler];
    v38 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMBannerExtractionType_toString(SGMBannerExtractionType)"];
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"SGMetricsDefines.h", 111, @"unrecognized tag %lu on SGMBannerExtractionType", a9.var0);

    v36 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v36 = off_1E5B8F278[a9.var0];
  }
  if (a11.var0)
  {
    if (a11.var0 == 1)
    {
      v39 = @"1";
    }
    else
    {
      v40 = [*(id *)(v19 + 2816) currentHandler];
      [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      v42 = v41 = v33;
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v42, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a11.var0);

      v33 = v41;
      v39 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v39 = @"0";
  }
  if (a12.var0 >= 5)
  {
    v44 = [*(id *)(v19 + 2816) currentHandler];
    [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)"];
    v46 = v45 = v33;
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v46, @"SGMetricsDefines.h", 159, @"unrecognized tag %lu on SGMContactDetailType", a12.var0);

    v33 = v45;
    v43 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v43 = off_1E5B8F6C8[a12.var0];
  }
  tracker = v29->_tracker;
  v54[0] = v20;
  v54[1] = v52;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v33;
  v54[5] = v36;
  v48 = [NSNumber numberWithUnsignedInteger:a10];
  v54[6] = v48;
  v54[7] = v39;
  v54[8] = v43;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:9];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v49 value:v53];
}

- (SGMContactConfirmed)init
{
  v19[9] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)SGMContactConfirmed;
  v2 = [(SGMContactConfirmed *)&v18 init];
  if (v2)
  {
    v17 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"App"];
    v16 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"FirstNameAdj"];
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"LastNameAdj"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"MiddleNameAdj"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"IsUpdate"];
    uint64_t v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Extracted"];
    v7 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"ExtractionModelVersion", 0, 1000, 1);
    v8 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"SelfId"];
    v9 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"ContactDetail"];
    id v10 = objc_alloc(MEMORY[0x1E4F93738]);
    v19[0] = v17;
    v19[1] = v16;
    v19[2] = v3;
    v19[3] = v4;
    v19[4] = v5;
    v19[5] = v6;
    v11 = (void *)v6;
    v19[6] = v7;
    v19[7] = v8;
    v19[8] = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:9];
    uint64_t v13 = [v10 initWithFeatureId:@"Found" event:@"ContactConfirmed" registerProperties:v12 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v13;
  }
  return v2;
}

@end