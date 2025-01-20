@interface SGMFoundInMailModelScore
- (PETScalarEventTracker)tracker;
- (SGMFoundInMailModelScore)init;
- (void)trackEventWithScalar:(unint64_t)a3 model:(SGMFoundInMailModelType_)a4 contactDetail:(SGMContactDetailType_)a5 result:(SGMTypeSafeBool_)a6 correct:(SGMTypeSafeBool_)a7 mode:(SGFoundInMailModelMode_)a8 supervision:(SGMFoundInMailSupervisionType_)a9;
@end

@implementation SGMFoundInMailModelScore

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 model:(SGMFoundInMailModelType_)a4 contactDetail:(SGMContactDetailType_)a5 result:(SGMTypeSafeBool_)a6 correct:(SGMTypeSafeBool_)a7 mode:(SGFoundInMailModelMode_)a8 supervision:(SGMFoundInMailSupervisionType_)a9
{
  v39[6] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 4)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMFoundInMailModelType_toString(SGMFoundInMailModelType)"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"SGMetricsDefines.h", 605, @"unrecognized tag %lu on SGMFoundInMailModelType", a4.var0);

    v15 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v15 = off_1E5B8F6A8[a4.var0];
  }
  if (a5.var0 >= 5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"SGMetricsDefines.h", 159, @"unrecognized tag %lu on SGMContactDetailType", a5.var0);

    v18 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v18 = off_1E5B8F6C8[a5.var0];
  }
  v38 = v18;
  if (a6.var0)
  {
    if (a6.var0 == 1)
    {
      v21 = @"1";
    }
    else
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a6.var0);

      v21 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v21 = @"0";
  }
  v37 = v21;
  if (a7.var0)
  {
    unint64_t v24 = a3;
    if (a7.var0 == 1)
    {
      v25 = @"1";
    }
    else
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a7.var0);

      v25 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    unint64_t v24 = a3;
    v25 = @"0";
  }
  if (a8.var0 >= 3)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = [NSString stringWithUTF8String:"NSString * _Nonnull SGFoundInMailModelMode_toString(SGFoundInMailModelMode)"];
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"SGMetricsDefines.h", 637, @"unrecognized tag %lu on SGFoundInMailModelMode", a8.var0);

    v28 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v28 = off_1E5B8F6F0[a8.var0];
  }
  if (a9.var0 >= 4)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    v33 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMFoundInMailSupervisionType_toString(SGMFoundInMailSupervisionType)"];
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"SGMetricsDefines.h", 622, @"unrecognized tag %lu on SGMFoundInMailSupervisionType", a9.var0);

    v31 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v31 = off_1E5B8F708[a9.var0];
  }
  tracker = self->_tracker;
  v39[0] = v15;
  v39[1] = v38;
  v39[2] = v37;
  v39[3] = v25;
  v39[4] = v28;
  v39[5] = v31;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:6];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v35 value:v24];
}

- (SGMFoundInMailModelScore)init
{
  v15[6] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SGMFoundInMailModelScore;
  v2 = [(SGMFoundInMailModelScore *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Model"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"ContactDetail"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Result"];
    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Correct"];
    v7 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Mode"];
    v8 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Supervision"];
    id v9 = objc_alloc(MEMORY[0x1E4F93738]);
    v15[0] = v3;
    v15[1] = v4;
    v15[2] = v5;
    v15[3] = v6;
    v15[4] = v7;
    v15[5] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:6];
    uint64_t v11 = [v9 initWithFeatureId:@"Found" event:@"FoundInMailModelScore" registerProperties:v10 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v11;
  }
  return v2;
}

@end