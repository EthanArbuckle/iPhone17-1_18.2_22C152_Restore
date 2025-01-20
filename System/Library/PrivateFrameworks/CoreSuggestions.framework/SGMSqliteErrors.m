@interface SGMSqliteErrors
- (PETScalarEventTracker)tracker;
- (SGMSqliteErrors)init;
- (void)trackEventWithScalar:(unint64_t)a3 errorCode:(unint64_t)a4;
@end

@implementation SGMSqliteErrors

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 errorCode:(unint64_t)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  tracker = self->_tracker;
  v6 = [NSNumber numberWithUnsignedInteger:a4];
  v8[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v7 value:a3];
}

- (SGMSqliteErrors)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SGMSqliteErrors;
  v2 = [(SGMSqliteErrors *)&v9 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"ErrorCode", 0, 7000, 1);
    id v4 = objc_alloc(MEMORY[0x1E4F93738]);
    v10[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v6 = [v4 initWithFeatureId:@"Found" event:@"SqliteErrors" registerProperties:v5 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v6;
  }
  return v2;
}

@end