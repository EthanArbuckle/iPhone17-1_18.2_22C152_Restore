@interface SGMAutocompleteUserSelectedContact
- (PETScalarEventTracker)tracker;
- (SGMAutocompleteUserSelectedContact)init;
- (void)trackEventWithScalar:(unint64_t)a3 wasSuggestedContact:(SGMTypeSafeBool_)a4 wasKnownContact:(SGMTypeSafeBool_)a5 app:(SGMContactDetailUsedApp_)a6;
@end

@implementation SGMAutocompleteUserSelectedContact

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 wasSuggestedContact:(SGMTypeSafeBool_)a4 wasKnownContact:(SGMTypeSafeBool_)a5 app:(SGMContactDetailUsedApp_)a6
{
  v22[3] = *MEMORY[0x1E4F143B8];
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v11 = @"1";
      if (!a5.var0) {
        goto LABEL_9;
      }
LABEL_6:
      if (a5.var0 == 1)
      {
        v12 = @"1";
      }
      else
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        v16 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a5.var0);

        v12 = @"ERR_UNMATCHED_TAG";
      }
      goto LABEL_11;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a4.var0);

    v11 = @"ERR_UNMATCHED_TAG";
    if (a5.var0) {
      goto LABEL_6;
    }
  }
  else
  {
    v11 = @"0";
    if (a5.var0) {
      goto LABEL_6;
    }
  }
LABEL_9:
  v12 = @"0";
LABEL_11:
  if (a6.var0 >= 0xC)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMContactDetailUsedApp_toString(SGMContactDetailUsedApp)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"SGMetricsDefines.h", 94, @"unrecognized tag %lu on SGMContactDetailUsedApp", a6.var0);

    v17 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v17 = off_1E5B8F648[a6.var0];
  }
  tracker = self->_tracker;
  v22[0] = v11;
  v22[1] = v12;
  v22[2] = v17;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v21 value:a3];
}

- (SGMAutocompleteUserSelectedContact)init
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SGMAutocompleteUserSelectedContact;
  v2 = [(SGMAutocompleteUserSelectedContact *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"WasSuggestedContact"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"WasKnownContact"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"App"];
    id v6 = objc_alloc(MEMORY[0x1E4F93738]);
    v12[0] = v3;
    v12[1] = v4;
    v12[2] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    uint64_t v8 = [v6 initWithFeatureId:@"Found" event:@"AutocompleteUserSelectedContact" registerProperties:v7 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v8;
  }
  return v2;
}

@end