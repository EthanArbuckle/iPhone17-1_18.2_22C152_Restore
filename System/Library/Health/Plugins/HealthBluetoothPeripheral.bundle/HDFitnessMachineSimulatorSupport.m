@interface HDFitnessMachineSimulatorSupport
- (HDFitnessMachineSimulatorSupport)initWithFitnessMachineType:(unint64_t)a3;
- (NSData)btIdentifierData;
- (NSString)btIdentifier;
- (NSUUID)uuid;
- (unint64_t)fitnessMachineType;
- (void)updateAdvertisementDataForSimulation:(id)a3;
@end

@implementation HDFitnessMachineSimulatorSupport

- (HDFitnessMachineSimulatorSupport)initWithFitnessMachineType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HDFitnessMachineSimulatorSupport;
  v4 = [(HDFitnessMachineSimulatorSupport *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_fitnessMachineType = a3;
    uint64_t v6 = +[NSUUID UUID];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }
  return v5;
}

- (NSData)btIdentifierData
{
  uint64_t v4 = 0;
  v2 = +[NSData dataWithBytes:&v4 length:8];

  return (NSData *)v2;
}

- (NSString)btIdentifier
{
  v2 = [(HDFitnessMachineSimulatorSupport *)self btIdentifierData];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return (NSString *)v3;
}

- (void)updateAdvertisementDataForSimulation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableData);
  uint64_t v6 = v5;
  char v9 = 1;
  __int16 v8 = 0;
  switch(self->_fitnessMachineType)
  {
    case 1uLL:
      __int16 v7 = 1;
      goto LABEL_8;
    case 2uLL:
      __int16 v7 = 2;
      goto LABEL_8;
    case 3uLL:
      __int16 v7 = 4;
      goto LABEL_8;
    case 4uLL:
      __int16 v7 = 8;
      goto LABEL_8;
    case 5uLL:
      __int16 v7 = 16;
      goto LABEL_8;
    case 6uLL:
      __int16 v7 = 32;
LABEL_8:
      __int16 v8 = v7;
      break;
    default:
      break;
  }
  [v5 appendBytes:&v9 length:1];
  [v6 appendBytes:&v8 length:2];
  [v4 setAdvertisementData:v6];
}

- (unint64_t)fitnessMachineType
{
  return self->_fitnessMachineType;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end