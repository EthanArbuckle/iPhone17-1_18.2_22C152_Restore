@interface SGMContactDetailConversationTurn
- (PETScalarEventTracker)tracker;
- (SGMContactDetailConversationTurn)init;
- (void)trackEventWithScalar:(unint64_t)a3 detailExtraction:(SGMDetailExtractionType_)a4 selfIdName:(SGMTypeSafeBool_)a5 extractionModelVersion:(unint64_t)a6 receivedConverstationTurn:(SGMTypeSafeBool_)a7 knownSuggestedContactDetail:(SGMTypeSafeBool_)a8 curatedContactDetail:(SGMTypeSafeBool_)a9 throughApp:(SGMContactDetailUsedApp_)a10 contactDetailUsed:(SGMContactDetailType_)a11;
@end

@implementation SGMContactDetailConversationTurn

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 detailExtraction:(SGMDetailExtractionType_)a4 selfIdName:(SGMTypeSafeBool_)a5 extractionModelVersion:(unint64_t)a6 receivedConverstationTurn:(SGMTypeSafeBool_)a7 knownSuggestedContactDetail:(SGMTypeSafeBool_)a8 curatedContactDetail:(SGMTypeSafeBool_)a9 throughApp:(SGMContactDetailUsedApp_)a10 contactDetailUsed:(SGMContactDetailType_)a11
{
  v45[8] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 0xA)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMDetailExtractionType_toString(SGMDetailExtractionType)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"SGMetricsDefines.h", 140, @"unrecognized tag %lu on SGMDetailExtractionType", a4.var0);

    v18 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v18 = off_1E5B8F228[a4.var0];
  }
  unint64_t v44 = a3;
  if (a5.var0)
  {
    if (a5.var0 == 1)
    {
      v21 = @"1";
    }
    else
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a5.var0);

      v21 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v21 = @"0";
  }
  v43 = v21;
  if (a7.var0)
  {
    if (a7.var0 == 1)
    {
      v24 = @"1";
    }
    else
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a7.var0);

      v24 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v24 = @"0";
  }
  v42 = v24;
  if (a8.var0)
  {
    if (a8.var0 == 1)
    {
      v27 = @"1";
    }
    else
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a8.var0);

      v27 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v27 = @"0";
  }
  if (a9.var0)
  {
    if (a9.var0 == 1)
    {
      v30 = @"1";
    }
    else
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      v32 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a9.var0);

      v30 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v30 = @"0";
  }
  if (a10.var0 >= 0xC)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    v35 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailUsedApp_toString(SGMContactDetailUsedApp)"];
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"SGMetricsDefines.h", 94, @"unrecognized tag %lu on SGMContactDetailUsedApp", a10.var0);

    v33 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v33 = off_1E5B8F648[a10.var0];
  }
  if (a11.var0 >= 5)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v38 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)"];
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"SGMetricsDefines.h", 159, @"unrecognized tag %lu on SGMContactDetailType", a11.var0);

    v36 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v36 = off_1E5B8F6C8[a11.var0];
  }
  tracker = self->_tracker;
  v45[0] = v18;
  v45[1] = v43;
  v40 = [NSNumber numberWithUnsignedInteger:a6];
  v45[2] = v40;
  v45[3] = v42;
  v45[4] = v27;
  v45[5] = v30;
  v45[6] = v33;
  v45[7] = v36;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:8];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v41 value:v44];
}

- (SGMContactDetailConversationTurn)init
{
  v17[8] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SGMContactDetailConversationTurn;
  v2 = [(SGMContactDetailConversationTurn *)&v16 init];
  if (v2)
  {
    v15 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"DetailExtraction"];
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"SelfIdName"];
    v4 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"ExtractionModelVersion", 0, 1000, 1);
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"ReceivedConverstationTurn"];
    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"KnownSuggestedContactDetail"];
    v7 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"CuratedContactDetail"];
    v8 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"ThroughApp"];
    v9 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"ContactDetailUsed"];
    id v10 = objc_alloc(MEMORY[0x1E4F93738]);
    v17[0] = v15;
    v17[1] = v3;
    v17[2] = v4;
    v17[3] = v5;
    v17[4] = v6;
    v17[5] = v7;
    v17[6] = v8;
    v17[7] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];
    uint64_t v12 = [v10 initWithFeatureId:@"Found" event:@"ContactDetailConversationTurn" registerProperties:v11 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v12;
  }
  return v2;
}

@end