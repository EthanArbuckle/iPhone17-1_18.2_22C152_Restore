@interface BLSHEnvironmentUpdateData
- (BLSHEnvironmentUpdateData)initWithEnvironmentIdentifier:(id)a3 newBacklightState:(int64_t)a4 pendingTransitionStateCount:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)environmentIdentifier;
- (id)description;
- (int64_t)newBacklightState;
- (unint64_t)pendingTransitionStateCount;
- (unint64_t)timeStamp;
@end

@implementation BLSHEnvironmentUpdateData

- (BLSHEnvironmentUpdateData)initWithEnvironmentIdentifier:(id)a3 newBacklightState:(int64_t)a4 pendingTransitionStateCount:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHEnvironmentUpdateData;
  v9 = [(BLSHEnvironmentUpdateData *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    environmentIdentifier = v9->_environmentIdentifier;
    v9->_environmentIdentifier = (NSString *)v10;

    v9->_newBacklightState = a4;
    v9->_pendingTransitionStateCount = a5;
    v9->_timeStamp = mach_continuous_time();
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  environmentIdentifier = self->_environmentIdentifier;
  v5 = NSStringFromBLSBacklightState();
  unint64_t pendingTransitionStateCount = self->_pendingTransitionStateCount;
  id v7 = objc_alloc(MEMORY[0x263EFF910]);
  id v8 = objc_msgSend(v7, "bls_initWithMachContinuousTime:", self->_timeStamp);
  v9 = objc_msgSend(v8, "bls_shortLoggingString");
  uint64_t v10 = [v3 stringWithFormat:@"update %@ %@ %lu %@", environmentIdentifier, v5, pendingTransitionStateCount, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  environmentIdentifier = self->_environmentIdentifier;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __37__BLSHEnvironmentUpdateData_isEqual___block_invoke;
  v20[3] = &unk_264533278;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:environmentIdentifier counterpart:v20];
  int64_t newBacklightState = self->_newBacklightState;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __37__BLSHEnvironmentUpdateData_isEqual___block_invoke_2;
  v18[3] = &unk_2645327E8;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendInteger:newBacklightState counterpart:v18];
  unint64_t pendingTransitionStateCount = self->_pendingTransitionStateCount;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __37__BLSHEnvironmentUpdateData_isEqual___block_invoke_3;
  v16[3] = &unk_2645327E8;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendInteger:pendingTransitionStateCount counterpart:v16];
  LOBYTE(pendingTransitionStateCount) = [v5 isEqual];

  return pendingTransitionStateCount;
}

id __37__BLSHEnvironmentUpdateData_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

uint64_t __37__BLSHEnvironmentUpdateData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) newBacklightState];
}

uint64_t __37__BLSHEnvironmentUpdateData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) pendingTransitionStateCount];
}

- (NSString)environmentIdentifier
{
  return self->_environmentIdentifier;
}

- (int64_t)newBacklightState
{
  return self->_newBacklightState;
}

- (unint64_t)pendingTransitionStateCount
{
  return self->_pendingTransitionStateCount;
}

- (unint64_t)timeStamp
{
  return self->_timeStamp;
}

- (void).cxx_destruct
{
}

@end