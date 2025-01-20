@interface ATVHighSecurityAccountDeviceListResponse
- (NSArray)devices;
- (NSDictionary)userDisplayStrings;
- (NSString)errorMessage;
- (NSString)errorTitle;
- (int64_t)errorCode;
@end

@implementation ATVHighSecurityAccountDeviceListResponse

- (NSArray)devices
{
  return (NSArray *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"devices"];
}

- (NSDictionary)userDisplayStrings
{
  return (NSDictionary *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"localization"];
}

- (NSString)errorTitle
{
  return (NSString *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"errorTitle"];
}

- (NSString)errorMessage
{
  return (NSString *)[(NSDictionary *)self->super._responseDictionary objectForKey:@"errorMessage"];
}

- (int64_t)errorCode
{
  v2 = [(NSDictionary *)self->super._responseDictionary objectForKey:@"errorCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

@end