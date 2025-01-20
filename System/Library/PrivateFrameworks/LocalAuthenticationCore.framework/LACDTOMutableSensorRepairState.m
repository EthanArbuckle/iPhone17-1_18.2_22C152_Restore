@interface LACDTOMutableSensorRepairState
+ (id)nullInstance;
- (BOOL)isEqual:(id)a3;
- (LACDTOMutableSensorRepairState)initWithFlag:(int64_t)a3;
- (NSString)description;
- (int64_t)repairFlag;
- (void)setRepairFlag:(int64_t)a3;
@end

@implementation LACDTOMutableSensorRepairState

- (LACDTOMutableSensorRepairState)initWithFlag:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LACDTOMutableSensorRepairState;
  result = [(LACDTOMutableSensorRepairState *)&v5 init];
  if (result) {
    result->_repairFlag = a3;
  }
  return result;
}

+ (id)nullInstance
{
  v2 = objc_alloc_init(LACDTOMutableSensorRepairState);
  [(LACDTOMutableSensorRepairState *)v2 setRepairFlag:0];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_27043D0C8])
  {
    id v5 = v4;
    int64_t v6 = [(LACDTOMutableSensorRepairState *)self repairFlag];
    uint64_t v7 = [v5 repairFlag];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v13[1] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = NSString;
  int64_t v6 = [(LACDTOMutableSensorRepairState *)self repairFlag];
  if ((unint64_t)(v6 - 1) > 2) {
    uint64_t v7 = @"Unknown";
  }
  else {
    uint64_t v7 = off_2653B6C68[v6 - 1];
  }
  BOOL v8 = [v5 stringWithFormat:@"repairFlag: %@", v7];
  v13[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v10 = [v9 componentsJoinedByString:@"; "];
  v11 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v10];

  return (NSString *)v11;
}

- (int64_t)repairFlag
{
  return self->_repairFlag;
}

- (void)setRepairFlag:(int64_t)a3
{
  self->_repairFlag = a3;
}

@end