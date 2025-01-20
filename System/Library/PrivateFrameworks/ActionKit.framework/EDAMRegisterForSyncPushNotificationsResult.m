@interface EDAMRegisterForSyncPushNotificationsResult
+ (id)structFields;
+ (id)structName;
- (NSData)sharedSecret;
- (void)setSharedSecret:(id)a3;
@end

@implementation EDAMRegisterForSyncPushNotificationsResult

+ (id)structFields
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_404;
  if (!structFields_structFields_404)
  {
    v3 = +[FATField fieldWithIndex:1 type:16 optional:1 name:@"sharedSecret"];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    v5 = (void *)structFields_structFields_404;
    structFields_structFields_404 = v4;

    v2 = (void *)structFields_structFields_404;
  }
  return v2;
}

+ (id)structName
{
  return @"RegisterForSyncPushNotificationsResult";
}

- (void).cxx_destruct
{
}

- (void)setSharedSecret:(id)a3
{
}

- (NSData)sharedSecret
{
  return self->_sharedSecret;
}

@end