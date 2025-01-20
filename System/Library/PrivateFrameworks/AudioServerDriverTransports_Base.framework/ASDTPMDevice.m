@interface ASDTPMDevice
+ (id)pmDeviceWithConfig:(id)a3 forSequencer:(id)a4;
- (ASDTPMDevice)initWithConfig:(id)a3 forSequencer:(id)a4;
- (ASDTPMSequencer)parentSequencer;
- (BOOL)pmNoStateChangeOnFailure;
- (NSString)name;
- (id)deviceName;
- (int)performPowerStateIdle:(int)a3;
- (int)performPowerStateOn;
- (int)performPowerStatePrepare:(int)a3;
- (int)performPowerStatePrewarm:(int)a3;
- (int)performPowerStateSleep;
- (int)powerState;
- (unsigned)pmOrderPowerDown;
- (unsigned)pmOrderPowerUp;
- (void)setName:(id)a3;
- (void)setParentSequencer:(id)a3;
- (void)setPmNoStateChangeOnFailure:(BOOL)a3;
- (void)setPmOrderPowerDown:(unsigned int)a3;
- (void)setPmOrderPowerUp:(unsigned int)a3;
- (void)setPowerState:(int)a3;
@end

@implementation ASDTPMDevice

+ (id)pmDeviceWithConfig:(id)a3 forSequencer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (objc_class *)[v5 asdtSubclass];
  if ([(objc_class *)v7 isSubclassOfClass:objc_opt_class()])
  {
    v8 = (void *)[[v7 alloc] initWithConfig:v5 forSequencer:v6];
  }
  else
  {
    v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ASDTPMDevice pmDeviceWithConfig:forSequencer:](v5);
    }

    v8 = 0;
  }

  return v8;
}

- (ASDTPMDevice)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDTPMDevice;
  v8 = [(ASDTPMDevice *)&v14 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  [(ASDTPMDevice *)v8 setParentSequencer:v7];
  [(ASDTPMDevice *)v9 setPowerState:0];
  -[ASDTPMDevice setPmNoStateChangeOnFailure:](v9, "setPmNoStateChangeOnFailure:", [v6 asdtPMNoStateChangeOnFailure]);
  v10 = [v6 asdtName];
  [(ASDTPMDevice *)v9 setName:v10];

  if (([v6 asdtPMOrder:&v9->_pmOrderPowerUp forPowerUp:1] & 1) == 0)
  {
    v12 = ASDTBaseLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMDevice initWithConfig:forSequencer:](v9);
    }
    goto LABEL_9;
  }
  if (([v6 asdtPMOrder:&v9->_pmOrderPowerDown forPowerUp:0] & 1) == 0)
  {
    v12 = ASDTBaseLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMDevice initWithConfig:forSequencer:](v9);
    }
LABEL_9:

    v11 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v11 = v9;
LABEL_10:

  return v11;
}

- (id)deviceName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    v4 = [(ASDTPMDevice *)self deviceName];
    [(ASDTPMDevice *)self setName:v4];

    name = self->_name;
  }
  return name;
}

- (int)performPowerStateSleep
{
  return 0;
}

- (int)performPowerStateIdle:(int)a3
{
  return 0;
}

- (int)performPowerStatePrepare:(int)a3
{
  return 0;
}

- (int)performPowerStatePrewarm:(int)a3
{
  return 0;
}

- (int)performPowerStateOn
{
  return 0;
}

- (int)powerState
{
  return self->powerState;
}

- (void)setPowerState:(int)a3
{
  self->powerState = a3;
}

- (ASDTPMSequencer)parentSequencer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSequencer);
  return (ASDTPMSequencer *)WeakRetained;
}

- (void)setParentSequencer:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (unsigned)pmOrderPowerUp
{
  return self->_pmOrderPowerUp;
}

- (void)setPmOrderPowerUp:(unsigned int)a3
{
  self->_pmOrderPowerUp = a3;
}

- (unsigned)pmOrderPowerDown
{
  return self->_pmOrderPowerDown;
}

- (void)setPmOrderPowerDown:(unsigned int)a3
{
  self->_pmOrderPowerDown = a3;
}

- (BOOL)pmNoStateChangeOnFailure
{
  return self->_pmNoStateChangeOnFailure;
}

- (void)setPmNoStateChangeOnFailure:(BOOL)a3
{
  self->_pmNoStateChangeOnFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_parentSequencer);
}

+ (void)pmDeviceWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"Subclass"];
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "Invalid subclass name: %@", v4, v5, v6, v7, 2u);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Invalid or missing PMOrder (power down) property.", v4, v5, v6, v7, 2u);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Invalid or missing PMOrder (power up) property.", v4, v5, v6, v7, 2u);
}

@end