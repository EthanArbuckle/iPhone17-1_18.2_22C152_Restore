@interface SGMContactDetailSent
- (PETScalarEventTracker)tracker;
- (SGMContactDetailSent)init;
- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMDocumentType_)a4 detail:(SGMContactDetailType_)a5 foundIn:(SGMContactDetailFoundIn_)a6 hasName:(SGMTypeSafeBool_)a7 tokens:(SGMLowCount_)a8;
@end

@implementation SGMContactDetailSent

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMDocumentType_)a4 detail:(SGMContactDetailType_)a5 foundIn:(SGMContactDetailFoundIn_)a6 hasName:(SGMTypeSafeBool_)a7 tokens:(SGMLowCount_)a8
{
  v32[5] = *MEMORY[0x1E4F143B8];
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v15 = @"Message";
    }
    else
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMDocumentType_toString(SGMDocumentType)"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"SGMetricsDefines.h", 588, @"unrecognized tag %lu on SGMDocumentType", a4.var0);

      v15 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v15 = @"Email";
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
  if (a6.var0 >= 4)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailFoundIn_toString(SGMContactDetailFoundIn)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"SGMetricsDefines.h", 191, @"unrecognized tag %lu on SGMContactDetailFoundIn", a6.var0);

    v21 = @"ERR_UNMATCHED_TAG";
    if (a7.var0)
    {
LABEL_11:
      if (a7.var0 == 1)
      {
        v22 = @"1";
      }
      else
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        v26 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a7.var0);

        v22 = @"ERR_UNMATCHED_TAG";
      }
      goto LABEL_16;
    }
  }
  else
  {
    v21 = off_1E5B8F600[a6.var0];
    if (a7.var0) {
      goto LABEL_11;
    }
  }
  v22 = @"0";
LABEL_16:
  if (a8.var0 >= 5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMLowCount_toString(SGMLowCount)"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"SGMetricsDefines.h", 46, @"unrecognized tag %lu on SGMLowCount", a8.var0);

    v27 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v27 = off_1E5B8F620[a8.var0];
  }
  tracker = self->_tracker;
  v32[0] = v15;
  v32[1] = v18;
  v32[2] = v21;
  v32[3] = v22;
  v32[4] = v27;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v31 value:a3];
}

- (SGMContactDetailSent)init
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SGMContactDetailSent;
  v2 = [(SGMContactDetailSent *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Source"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Detail"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"FoundIn"];
    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"HasName"];
    v7 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Tokens"];
    id v8 = objc_alloc(MEMORY[0x1E4F93738]);
    v14[0] = v3;
    v14[1] = v4;
    v14[2] = v5;
    v14[3] = v6;
    v14[4] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
    uint64_t v10 = [v8 initWithFeatureId:@"Found" event:@"ContactDetailSent" registerProperties:v9 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v10;
  }
  return v2;
}

@end