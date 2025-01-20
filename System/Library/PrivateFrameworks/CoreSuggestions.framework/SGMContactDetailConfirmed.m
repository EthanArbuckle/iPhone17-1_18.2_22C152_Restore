@interface SGMContactDetailConfirmed
- (PETScalarEventTracker)tracker;
- (SGMContactDetailConfirmed)init;
- (void)trackEventWithScalar:(unint64_t)a3 type:(SGMContactDetailType_)a4 extracted:(SGMDetailExtractionType_)a5 extractionModelVersion:(unint64_t)a6;
@end

@implementation SGMContactDetailConfirmed

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 type:(SGMContactDetailType_)a4 extracted:(SGMDetailExtractionType_)a5 extractionModelVersion:(unint64_t)a6
{
  v20[3] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"SGMetricsDefines.h", 159, @"unrecognized tag %lu on SGMContactDetailType", a4.var0);

    v11 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v11 = off_1E5B8F6C8[a4.var0];
  }
  if (a5.var0 >= 0xA)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMDetailExtractionType_toString(SGMDetailExtractionType)"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"SGMetricsDefines.h", 140, @"unrecognized tag %lu on SGMDetailExtractionType", a5.var0);

    v14 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v14 = off_1E5B8F228[a5.var0];
  }
  tracker = self->_tracker;
  v20[0] = v11;
  v20[1] = v14;
  v18 = [NSNumber numberWithUnsignedInteger:a6];
  v20[2] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v19 value:a3];
}

- (SGMContactDetailConfirmed)init
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SGMContactDetailConfirmed;
  v2 = [(SGMContactDetailConfirmed *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Type"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Extracted"];
    v5 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"ExtractionModelVersion", 0, 1000, 1);
    id v6 = objc_alloc(MEMORY[0x1E4F93738]);
    v12[0] = v3;
    v12[1] = v4;
    v12[2] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    uint64_t v8 = [v6 initWithFeatureId:@"Found" event:@"ContactDetailConfirmed" registerProperties:v7 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v8;
  }
  return v2;
}

@end