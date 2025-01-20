@interface SGMSerializedContactsCacheHit
- (PETScalarEventTracker)tracker;
- (SGMSerializedContactsCacheHit)init;
- (void)trackEventWithScalar:(unint64_t)a3 cacheHit:(SGMTypeSafeBool_)a4;
@end

@implementation SGMSerializedContactsCacheHit

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 cacheHit:(SGMTypeSafeBool_)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v7 = @"1";
    }
    else
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"SGMetricsDefines.h", 12, @"unrecognized tag %lu on SGMTypeSafeBool", a4.var0);

      v7 = @"ERR_UNMATCHED_TAG";
    }
  }
  else
  {
    v7 = @"0";
  }
  tracker = self->_tracker;
  v12[0] = v7;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v11 value:a3];
}

- (SGMSerializedContactsCacheHit)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SGMSerializedContactsCacheHit;
  v2 = [(SGMSerializedContactsCacheHit *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"CacheHit"];
    id v4 = objc_alloc(MEMORY[0x1E4F93738]);
    v10[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v6 = [v4 initWithFeatureId:@"Found" event:@"SerializedContactsCacheHit" registerProperties:v5 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v6;
  }
  return v2;
}

@end