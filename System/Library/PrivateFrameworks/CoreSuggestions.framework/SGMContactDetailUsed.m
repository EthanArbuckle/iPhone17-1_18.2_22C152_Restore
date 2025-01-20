@interface SGMContactDetailUsed
- (PETScalarEventTracker)tracker;
- (SGMContactDetailUsed)init;
- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMContactDetailUsedApp_)a4 type:(SGMContactDetailType_)a5;
@end

@implementation SGMContactDetailUsed

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMContactDetailUsedApp_)a4 type:(SGMContactDetailType_)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 0xC)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailUsedApp_toString(SGMContactDetailUsedApp)"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"SGMetricsDefines.h", 94, @"unrecognized tag %lu on SGMContactDetailUsedApp", a4.var0);

    v9 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v9 = off_1E5B8F648[a4.var0];
  }
  if (a5.var0 >= 5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"SGMetricsDefines.h", 159, @"unrecognized tag %lu on SGMContactDetailType", a5.var0);

    v12 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v12 = off_1E5B8F6C8[a5.var0];
  }
  tracker = self->_tracker;
  v17[0] = v9;
  v17[1] = v12;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v16 value:a3];
}

- (SGMContactDetailUsed)init
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SGMContactDetailUsed;
  v2 = [(SGMContactDetailUsed *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"App"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Type"];
    id v5 = objc_alloc(MEMORY[0x1E4F93738]);
    v11[0] = v3;
    v11[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v7 = [v5 initWithFeatureId:@"Found" event:@"ContactDetailUsed" registerProperties:v6 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v7;
  }
  return v2;
}

@end