@interface ACCPowerManager
- (ACCPowerManager)init;
- (BOOL)connectionPowerModeChangedForFeaturePowerModeUpdate:(int)a3 withObject:(BOOL)a4;
- (BOOL)getCurrentConnectionIsHighPowerMode;
- (NSMutableArray)featurePowerMode;
- (void)dealloc;
@end

@implementation ACCPowerManager

- (ACCPowerManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACCPowerManager;
  v2 = [(ACCPowerManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    featurePowerMode = v2->_featurePowerMode;
    v2->_featurePowerMode = (NSMutableArray *)v3;

    v5 = v2->_featurePowerMode;
    v6 = +[NSNumber numberWithBool:0];
    [(NSMutableArray *)v5 addObject:v6];

    v7 = v2->_featurePowerMode;
    v8 = +[NSNumber numberWithBool:0];
    [(NSMutableArray *)v7 addObject:v8];
  }
  return v2;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_featurePowerMode removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)ACCPowerManager;
  [(ACCPowerManager *)&v3 dealloc];
}

- (BOOL)connectionPowerModeChangedForFeaturePowerModeUpdate:(int)a3 withObject:(BOOL)a4
{
  if (a3 > 1)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    BOOL v4 = a4;
    uint64_t v6 = a3;
    v7 = [(NSMutableArray *)self->_featurePowerMode objectAtIndex:a3];
    BOOL v8 = [v7 BOOLValue] ^ v4;

    featurePowerMode = self->_featurePowerMode;
    objc_super v10 = +[NSNumber numberWithBool:v4];
    [(NSMutableArray *)featurePowerMode setObject:v10 atIndexedSubscript:v6];
  }
  return v8;
}

- (BOOL)getCurrentConnectionIsHighPowerMode
{
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    v5 = [(ACCPowerManager *)self featurePowerMode];
    uint64_t v6 = [v5 objectAtIndex:v3];
    unsigned int v7 = [v6 BOOLValue];

    if ((v4 & 1) == 0) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while (!v7);
  return v7;
}

- (NSMutableArray)featurePowerMode
{
  return self->_featurePowerMode;
}

- (void).cxx_destruct
{
}

@end