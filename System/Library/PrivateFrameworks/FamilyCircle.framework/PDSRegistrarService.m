@interface PDSRegistrarService
+ (PDSRegistrarService)sharedInstance;
- (PDSRegistrarService)init;
- (void)registerToPDS:(char)a3;
- (void)removeRegistrationFromPDS;
@end

@implementation PDSRegistrarService

+ (PDSRegistrarService)sharedInstance
{
  if (qword_10005E510 != -1) {
    swift_once();
  }
  v2 = (void *)static PDSRegistrarService.sharedInstance;
  return (PDSRegistrarService *)v2;
}

- (PDSRegistrarService)init
{
  return (PDSRegistrarService *)sub_10002B32C();
}

- (void)registerToPDS:(char)a3
{
  v4 = self;
  PDSRegistrarService.registerToPDS(_:)(a3);
}

- (void)removeRegistrationFromPDS
{
  v2 = self;
  PDSRegistrarService.removeRegistrationFromPDS()();
}

- (void).cxx_destruct
{
}

@end