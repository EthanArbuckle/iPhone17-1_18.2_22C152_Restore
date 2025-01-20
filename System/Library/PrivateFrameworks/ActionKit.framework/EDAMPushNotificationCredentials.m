@interface EDAMPushNotificationCredentials
+ (id)structFields;
+ (id)structName;
- (NSData)iosDeviceToken;
- (NSString)gcmRegistrationId;
- (void)setGcmRegistrationId:(id)a3;
- (void)setIosDeviceToken:(id)a3;
@end

@implementation EDAMPushNotificationCredentials

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_378;
  if (!structFields_structFields_378)
  {
    v3 = +[FATField fieldWithIndex:1 type:16 optional:0 name:@"iosDeviceToken"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"gcmRegistrationId"];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_378;
    structFields_structFields_378 = v5;

    v2 = (void *)structFields_structFields_378;
  }
  return v2;
}

+ (id)structName
{
  return @"PushNotificationCredentials";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gcmRegistrationId, 0);
  objc_storeStrong((id *)&self->_iosDeviceToken, 0);
}

- (void)setGcmRegistrationId:(id)a3
{
}

- (NSString)gcmRegistrationId
{
  return self->_gcmRegistrationId;
}

- (void)setIosDeviceToken:(id)a3
{
}

- (NSData)iosDeviceToken
{
  return self->_iosDeviceToken;
}

@end