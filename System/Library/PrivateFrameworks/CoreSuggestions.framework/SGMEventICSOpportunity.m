@interface SGMEventICSOpportunity
- (PETScalarEventTracker)tracker;
- (SGMEventICSOpportunity)init;
- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMEventICSSourceType_)a4 recipient:(SGMEventICSSourceType_)a5 accountSetup:(SGMTypeSafeBool_)a6;
@end

@implementation SGMEventICSOpportunity

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMEventICSSourceType_)a4 recipient:(SGMEventICSSourceType_)a5 accountSetup:(SGMTypeSafeBool_)a6
{
  v22[3] = *MEMORY[0x1E4F143B8];
  if (a4.var0 >= 5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventICSSourceType_toString(SGMEventICSSourceType)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"SGMetricsDefines.h", 243, @"unrecognized tag %lu on SGMEventICSSourceType", a4.var0);

    v11 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v11 = off_1E5B8F778[a4.var0];
  }
  if (a5.var0 < 5)
  {
    v14 = off_1E5B8F778[a5.var0];
    if (a6.var0) {
      goto LABEL_6;
    }
LABEL_9:
    v15 = @"0";
    goto LABEL_11;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  v17 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMEventICSSourceType_toString(SGMEventICSSourceType)"];
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"SGMetricsDefines.h", 243, @"unrecognized tag %lu on SGMEventICSSourceType", a5.var0);

  v14 = @"ERR_UNMATCHED_TAG";
  if (!a6.var0) {
    goto LABEL_9;
  }
LABEL_6:
  if (a6.var0 == 1)
  {
    v15 = @"1";
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a6.var0);

    v15 = @"ERR_UNMATCHED_TAG";
  }
LABEL_11:
  tracker = self->_tracker;
  v22[0] = v11;
  v22[1] = v14;
  v22[2] = v15;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v21 value:a3];
}

- (SGMEventICSOpportunity)init
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SGMEventICSOpportunity;
  v2 = [(SGMEventICSOpportunity *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Source"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Recipient"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"AccountSetup"];
    id v6 = objc_alloc(MEMORY[0x1E4F93738]);
    v12[0] = v3;
    v12[1] = v4;
    v12[2] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    uint64_t v8 = [v6 initWithFeatureId:@"Found" event:@"ICSOpportunity" registerProperties:v7 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v8;
  }
  return v2;
}

@end