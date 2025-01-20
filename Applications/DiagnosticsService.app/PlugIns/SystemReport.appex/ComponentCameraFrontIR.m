@interface ComponentCameraFrontIR
- (BOOL)isPresent;
- (id)savageChipID;
- (id)savageSerialNumber;
- (id)savageUID;
- (id)sensorSerialNumber;
- (id)serialNumberComponentPropertyKey;
- (id)yonkersSerialNumber;
- (int64_t)cameraModuleType;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentCameraFrontIR

- (void)populateAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ComponentCameraFrontIR;
  id v4 = a3;
  [(ComponentCameraBase *)&v8 populateAttributes:v4];
  v5 = [(ComponentCameraFrontIR *)self sensorSerialNumber];
  [v4 setObject:v5 forKeyedSubscript:@"sensorSerialNumber"];

  v6 = [(ComponentCameraFrontIR *)self savageChipID];
  [v4 setObject:v6 forKeyedSubscript:@"sensorChipID"];

  v7 = [(ComponentCameraFrontIR *)self savageUID];
  [v4 setObject:v7 forKeyedSubscript:@"sensorUID"];
}

- (BOOL)isPresent
{
  v2 = [(ComponentCameraBase *)self IORegClassName];

  BOOL result = MGGetBoolAnswer();
  if (!v2) {
    return 0;
  }
  return result;
}

- (id)serialNumberComponentPropertyKey
{
  return @"FrontIRCameraModuleSerialNumString";
}

- (int64_t)cameraModuleType
{
  return 3;
}

- (id)sensorSerialNumber
{
  v3 = [(ComponentCameraFrontIR *)self savageSerialNumber];
  if (!v3)
  {
    id v4 = [(ComponentCameraFrontIR *)self yonkersSerialNumber];
    v3 = v4;
    if (v4) {
      id v5 = v4;
    }
  }
  if (isValidSerialNumber(v3)) {
    v6 = v3;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)savageSerialNumber
{
  id v2 = [(ComponentCameraBase *)self IORegClassName];
  v3 = +[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", [v2 UTF8String], @"SavageSNUM", 20, 0);

  if (v3)
  {
    id v4 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v4 = 0;
  }
  if (isValidSerialNumber(v4)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)savageChipID
{
  id v2 = [(ComponentCameraBase *)self IORegClassName];
  v3 = +[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", [v2 UTF8String], @"SavageChipID", 4, 0);

  if (v3)
  {
    id v4 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = stringOrNull(v4);

  return v5;
}

- (id)savageUID
{
  id v2 = [(ComponentCameraBase *)self IORegClassName];
  v3 = +[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", [v2 UTF8String], @"SavageUID", 16, 0);

  if (v3)
  {
    id v4 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = stringOrNull(v4);

  return v5;
}

- (id)yonkersSerialNumber
{
  id v2 = [(ComponentCameraBase *)self IORegClassName];
  v3 = +[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", [v2 UTF8String], @"YonkersSNUM", 20, 0);

  if (v3)
  {
    id v4 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v4 = 0;
  }
  if (isValidSerialNumber(v4)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end