@interface SGMUnknownContactInformationShown
- (PETScalarEventTracker)tracker;
- (SGMUnknownContactInformationShown)init;
- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMContactDetailUsedApp_)a4 wasSuggestedContact:(SGMTypeSafeBool_)a5;
@end

@implementation SGMUnknownContactInformationShown

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMContactDetailUsedApp_)a4 wasSuggestedContact:(SGMTypeSafeBool_)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (a4.var0 < 0xC)
  {
    v9 = off_1E5B8F648[a4.var0];
    if (a5.var0) {
      goto LABEL_3;
    }
LABEL_6:
    v10 = @"0";
    goto LABEL_8;
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  v12 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailUsedApp_toString(SGMContactDetailUsedApp)"];
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"SGMetricsDefines.h", 94, @"unrecognized tag %lu on SGMContactDetailUsedApp", a4.var0);

  v9 = @"ERR_UNMATCHED_TAG";
  if (!a5.var0) {
    goto LABEL_6;
  }
LABEL_3:
  if (a5.var0 == 1)
  {
    v10 = @"1";
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a5.var0);

    v10 = @"ERR_UNMATCHED_TAG";
  }
LABEL_8:
  tracker = self->_tracker;
  v17[0] = v9;
  v17[1] = v10;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v16 value:a3];
}

- (SGMUnknownContactInformationShown)init
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SGMUnknownContactInformationShown;
  v2 = [(SGMUnknownContactInformationShown *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"App"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"WasSuggestedContact"];
    id v5 = objc_alloc(MEMORY[0x1E4F93738]);
    v11[0] = v3;
    v11[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v7 = [v5 initWithFeatureId:@"Found" event:@"UnknownShown" registerProperties:v6 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v7;
  }
  return v2;
}

@end