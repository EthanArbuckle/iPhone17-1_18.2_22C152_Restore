@interface BWSensorConfiguration
- (BWSensorConfiguration)initWithPortType:(id)a3 sensorIDString:(id)a4 sensorIDDictionary:(id)a5 cameraInfo:(id)a6;
- (BWSensorConfiguration)initWithPortType:(id)a3 sensorIDString:(id)a4 sensorIDDictionary:(id)a5 cameraInfo:(id)a6 moduleCalibration:(id)a7;
- (CMIModuleCalibration)moduleCalibration;
- (NSDictionary)cameraInfo;
- (NSDictionary)sensorIDDictionary;
- (NSString)portType;
- (NSString)sensorIDString;
- (id)description;
- (void)dealloc;
@end

@implementation BWSensorConfiguration

- (BWSensorConfiguration)initWithPortType:(id)a3 sensorIDString:(id)a4 sensorIDDictionary:(id)a5 cameraInfo:(id)a6 moduleCalibration:(id)a7
{
  if (a3 && a4 && a5 && a6)
  {
    v14.receiver = self;
    v14.super_class = (Class)BWSensorConfiguration;
    v12 = [(BWSensorConfiguration *)&v14 init];
    if (v12)
    {
      v12->_portType = (NSString *)a3;
      v12->_sensorIDString = (NSString *)a4;
      v12->_sensorIDDictionary = (NSDictionary *)a5;
      v12->_cameraInfo = (NSDictionary *)a6;
      v12->_moduleCalibration = (CMIModuleCalibration *)a7;
    }
  }
  else
  {

    return 0;
  }
  return v12;
}

- (BWSensorConfiguration)initWithPortType:(id)a3 sensorIDString:(id)a4 sensorIDDictionary:(id)a5 cameraInfo:(id)a6
{
  return [(BWSensorConfiguration *)self initWithPortType:a3 sensorIDString:a4 sensorIDDictionary:a5 cameraInfo:a6 moduleCalibration:0];
}

- (NSString)portType
{
  return self->_portType;
}

- (NSString)sensorIDString
{
  return self->_sensorIDString;
}

- (NSDictionary)sensorIDDictionary
{
  return self->_sensorIDDictionary;
}

- (CMIModuleCalibration)moduleCalibration
{
  return self->_moduleCalibration;
}

- (NSDictionary)cameraInfo
{
  return self->_cameraInfo;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSensorConfiguration;
  [(BWSensorConfiguration *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: port type: %@, sensor ID: %@, sensorIDDictionary: %p, cameraInfo: %@, moduleCalibration: %@", objc_opt_class(), self, self->_portType, self->_sensorIDString, self->_sensorIDDictionary, self->_cameraInfo, self->_moduleCalibration];
}

@end