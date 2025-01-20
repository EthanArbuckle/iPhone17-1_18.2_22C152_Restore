@interface CCDatabaseDeviceClockValues
- (CCDatabaseDeviceClockValues)init;
- (CCDatabaseDeviceClockValues)initWithDeviceRowId:(id)a3 missingAtomsImplied:(BOOL)a4;
- (NSMutableIndexSet)missing;
- (NSMutableIndexSet)present;
- (NSMutableIndexSet)tombstoned;
- (NSNumber)deviceRowId;
- (id)description;
- (unint64_t)max;
- (void)updateMax:(unint64_t)a3;
@end

@implementation CCDatabaseDeviceClockValues

- (CCDatabaseDeviceClockValues)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCDatabaseDeviceClockValues)initWithDeviceRowId:(id)a3 missingAtomsImplied:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CCDatabaseDeviceClockValues;
  v8 = [(CCDatabaseDeviceClockValues *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deviceRowId, a3);
    v9->_max = 0;
    v10 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    present = v9->_present;
    v9->_present = v10;

    v12 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    tombstoned = v9->_tombstoned;
    v9->_tombstoned = v12;

    if (!a4)
    {
      v14 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
      missing = v9->_missing;
      v9->_missing = v14;
    }
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = [NSNumber numberWithUnsignedInteger:self->_max];
  v5 = [v3 stringWithFormat:@"max: %@, present: %@, tombstoned: %@, missing: %@", v4, self->_present, self->_tombstoned, self->_missing];

  return v5;
}

- (void)updateMax:(unint64_t)a3
{
  if (self->_max < a3) {
    self->_max = a3;
  }
}

- (NSNumber)deviceRowId
{
  return self->_deviceRowId;
}

- (unint64_t)max
{
  return self->_max;
}

- (NSMutableIndexSet)present
{
  return self->_present;
}

- (NSMutableIndexSet)tombstoned
{
  return self->_tombstoned;
}

- (NSMutableIndexSet)missing
{
  return self->_missing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missing, 0);
  objc_storeStrong((id *)&self->_tombstoned, 0);
  objc_storeStrong((id *)&self->_present, 0);

  objc_storeStrong((id *)&self->_deviceRowId, 0);
}

@end