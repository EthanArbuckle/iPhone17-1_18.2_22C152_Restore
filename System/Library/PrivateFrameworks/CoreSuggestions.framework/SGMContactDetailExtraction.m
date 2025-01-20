@interface SGMContactDetailExtraction
- (PETScalarEventTracker)tracker;
- (SGMContactDetailExtraction)init;
- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMDocumentType_)a4 signature:(SGMTypeSafeBool_)a5 detail:(SGMContactDetailType_)a6 outcome:(SGMContactDetailExtractionOutcome_)a7 foundInSenderCNContact:(SGMContactDetailOwner_)a8 extractionModelVersion:(unint64_t)a9 isUnlikelyPhone:(SGMTypeSafeBool_)a10 signatureExtractionSource:(SGMContactDetailExtractionSignatureSource_)a11;
@end

@implementation SGMContactDetailExtraction

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMDocumentType_)a4 signature:(SGMTypeSafeBool_)a5 detail:(SGMContactDetailType_)a6 outcome:(SGMContactDetailExtractionOutcome_)a7 foundInSenderCNContact:(SGMContactDetailOwner_)a8 extractionModelVersion:(unint64_t)a9 isUnlikelyPhone:(SGMTypeSafeBool_)a10 signatureExtractionSource:(SGMContactDetailExtractionSignatureSource_)a11
{
  v42[8] = *MEMORY[0x1E4F143B8];
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v16 = @"Message";
      if (!a5.var0) {
        goto LABEL_9;
      }
LABEL_6:
      if (a5.var0 == 1)
      {
        v17 = @"1";
      }
      else
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        v21 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a5.var0);

        v17 = @"ERR_UNMATCHED_TAG";
      }
      goto LABEL_11;
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMDocumentType_toString(SGMDocumentType)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"SGMetricsDefines.h", 588, @"unrecognized tag %lu on SGMDocumentType", a4.var0);

    v16 = @"ERR_UNMATCHED_TAG";
    if (a5.var0) {
      goto LABEL_6;
    }
  }
  else
  {
    v16 = @"Email";
    if (a5.var0) {
      goto LABEL_6;
    }
  }
LABEL_9:
  v17 = @"0";
LABEL_11:
  if (a6.var0 >= 5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"SGMetricsDefines.h", 159, @"unrecognized tag %lu on SGMContactDetailType", a6.var0);

    v22 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v22 = off_1E5B8F6C8[a6.var0];
  }
  if (a7.var0 >= 7)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailExtractionOutcome_toString(SGMContactDetailExtractionOutcome)"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"SGMetricsDefines.h", 560, @"unrecognized tag %lu on SGMContactDetailExtractionOutcome", a7.var0);

    v25 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v25 = off_1E5B8F598[a7.var0];
  }
  if (a8.var0 >= 3)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailOwner_toString(SGMContactDetailOwner)"];
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"SGMetricsDefines.h", 174, @"unrecognized tag %lu on SGMContactDetailOwner", a8.var0);

    v28 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v28 = off_1E5B8F5D0[a8.var0];
  }
  if (a10.var0)
  {
    if (a10.var0 == 1)
    {
      v31 = @"1";
    }
    else
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      v33 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a10.var0);

      v31 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v31 = @"0";
  }
  if (a11.var0 >= 3)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailExtractionSignatureSource_toString(SGMContactDetailExtractionSignatureSource)"];
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"SGMetricsDefines.h", 575, @"unrecognized tag %lu on SGMContactDetailExtractionSignatureSource", a11.var0);

    v34 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v34 = off_1E5B8F5E8[a11.var0];
  }
  tracker = self->_tracker;
  v42[0] = v16;
  v42[1] = v17;
  v42[2] = v22;
  v42[3] = v25;
  v42[4] = v28;
  v38 = [NSNumber numberWithUnsignedInteger:a9];
  v42[5] = v38;
  v42[6] = v31;
  v42[7] = v34;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v39 value:a3];
}

- (SGMContactDetailExtraction)init
{
  v17[8] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SGMContactDetailExtraction;
  v2 = [(SGMContactDetailExtraction *)&v16 init];
  if (v2)
  {
    v15 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Source"];
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Signature"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Detail"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Outcome"];
    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"FoundInSenderCNContact"];
    v7 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"ExtractionModelVersion", 0, 1000, 1);
    v8 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"IsUnlikelyPhone"];
    v9 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"SignatureExtractionSource"];
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
    uint64_t v12 = [v10 initWithFeatureId:@"Found" event:@"ContactDetailExtraction" registerProperties:v11 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v12;
  }
  return v2;
}

@end