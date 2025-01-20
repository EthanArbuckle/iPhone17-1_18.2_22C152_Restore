@interface HDFakeDataCollectorConfiguration
+ (id)configurationForWorkoutActivityType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HKQuantity)speed;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)activityType;
- (unint64_t)hash;
- (void)setActivityType:(int64_t)a3;
- (void)setSpeed:(id)a3;
@end

@implementation HDFakeDataCollectorConfiguration

+ (id)configurationForWorkoutActivityType:(unint64_t)a3
{
  v4 = objc_alloc_init(HDFakeDataCollectorConfiguration);
  v5 = v4;
  if ((uint64_t)a3 > 45)
  {
    switch(a3)
    {
      case '.':
        v25 = (void *)MEMORY[0x1E4F2B370];
        v26 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        v27 = [v25 quantityWithUnit:v26 doubleValue:7.0];
        [(HDFakeDataCollectorConfiguration *)v5 setSpeed:v27];

        uint64_t v9 = 6;
        break;
      case '4':
        v28 = (void *)MEMORY[0x1E4F2B370];
        v29 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        v30 = [v28 quantityWithUnit:v29 doubleValue:2.0];
        [(HDFakeDataCollectorConfiguration *)v5 setSpeed:v30];

        uint64_t v9 = 1;
        break;
      case '<':
        v10 = (void *)MEMORY[0x1E4F2B370];
        v11 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        v12 = [v10 quantityWithUnit:v11 doubleValue:2.0];
        [(HDFakeDataCollectorConfiguration *)v5 setSpeed:v12];

        uint64_t v9 = 11;
        break;
      default:
LABEL_10:
        [(HDFakeDataCollectorConfiguration *)v4 setSpeed:0];
        uint64_t v9 = 4;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x1FuLL:
        v6 = (void *)MEMORY[0x1E4F2B370];
        v7 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        v8 = [v6 quantityWithUnit:v7 doubleValue:2.0];
        [(HDFakeDataCollectorConfiguration *)v5 setSpeed:v8];

        uint64_t v9 = 8;
        break;
      case 0x20uLL:
      case 0x21uLL:
      case 0x22uLL:
      case 0x24uLL:
      case 0x26uLL:
        goto LABEL_10;
      case 0x23uLL:
        v16 = (void *)MEMORY[0x1E4F2B370];
        v17 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        v18 = [v16 quantityWithUnit:v17 doubleValue:4.0];
        [(HDFakeDataCollectorConfiguration *)v5 setSpeed:v18];

        uint64_t v9 = 10;
        break;
      case 0x25uLL:
        v19 = (void *)MEMORY[0x1E4F2B370];
        v20 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        v21 = [v19 quantityWithUnit:v20 doubleValue:4.0];
        [(HDFakeDataCollectorConfiguration *)v5 setSpeed:v21];

        uint64_t v9 = 2;
        break;
      case 0x27uLL:
        v22 = (void *)MEMORY[0x1E4F2B370];
        v23 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        v24 = [v22 quantityWithUnit:v23 doubleValue:4.0];
        [(HDFakeDataCollectorConfiguration *)v5 setSpeed:v24];

        uint64_t v9 = 9;
        break;
      default:
        if (a3 != 13) {
          goto LABEL_10;
        }
        v13 = (void *)MEMORY[0x1E4F2B370];
        v14 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
        v15 = [v13 quantityWithUnit:v14 doubleValue:10.0];
        [(HDFakeDataCollectorConfiguration *)v5 setSpeed:v15];

        uint64_t v9 = 3;
        break;
    }
  }
  [(HDFakeDataCollectorConfiguration *)v5 setActivityType:v9];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_speed == (HKQuantity *)v4[2] && self->_activityType == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_activityType ^ (int64_t)self->_speed;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HDFakeDataCollectorConfiguration);
  [(HDFakeDataCollectorConfiguration *)v4 setSpeed:self->_speed];
  [(HDFakeDataCollectorConfiguration *)v4 setActivityType:self->_activityType];
  return v4;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (HKQuantity)speed
{
  return self->_speed;
}

- (void)setSpeed:(id)a3
{
}

- (void).cxx_destruct
{
}

@end