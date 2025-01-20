@interface ComponentStrobeFrontSLP
- (BOOL)flexDisconnected;
- (BOOL)isPresent;
- (BOOL)serialNumberMismatch;
- (id)authenticityStatus;
- (id)serialNumber;
- (int64_t)cameraModuleType;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentStrobeFrontSLP

- (BOOL)isPresent
{
  v2 = [(ComponentCameraBase *)self IORegClassName];

  BOOL result = MGGetBoolAnswer();
  if (!v2) {
    return 0;
  }
  return result;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ComponentStrobeFrontSLP;
  [(ComponentCameraBase *)&v8 populateAttributes:v4];
  v5 = +[NSNumber numberWithBool:[(ComponentStrobeFrontSLP *)self flexDisconnected]];
  [v4 setObject:v5 forKeyedSubscript:@"flexDisconnected"];

  v6 = +[NSNumber numberWithBool:[(ComponentStrobeFrontSLP *)self serialNumberMismatch]];
  [v4 setObject:v6 forKeyedSubscript:@"serialNumberMismatch"];

  v7 = [(ComponentStrobeFrontSLP *)self authenticityStatus];
  if (v7) {
    [v4 setObject:v7 forKeyedSubscript:@"authenticityStatus"];
  }
}

- (id)serialNumber
{
  id v2 = [(ComponentCameraBase *)self IORegClassName];
  v3 = +[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", [v2 UTF8String], @"FrontIRStructuredLightProjectorSerialNumString", 17, 0);

  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];

  return v4;
}

- (int64_t)cameraModuleType
{
  return 3;
}

- (BOOL)flexDisconnected
{
  char v6 = 0;
  id v2 = +[DAComponentUtil getIORegistryName:@"romeo" property:@"romeo-b2b-unplug-detected" optionalKey:0];
  v3 = v2;
  if (v2)
  {
    [v2 getBytes:&v6 length:1];
    BOOL v4 = v6 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)serialNumberMismatch
{
  id v2 = +[NSFileManager defaultManager];
  unsigned __int8 v3 = [v2 fileExistsAtPath:@"/private/var/tmp/biokit_hw_issue_notification"];

  return v3;
}

- (id)authenticityStatus
{
  id v2 = [(ComponentCameraBase *)self IORegClassName];
  unsigned __int8 v3 = +[DAComponentUtil getIOregData:property:length:optionalKey:](DAComponentUtil, "getIOregData:property:length:optionalKey:", [v2 UTF8String], @"RomeoStatus", 8, 0);

  if (v3) {
    id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end