@interface NSUserActivity(AppClip_Private)
- (id)appClipActivationPayload;
- (void)appClipActivationPayload;
- (void)setAppClipActivationPayload:()AppClip_Private;
@end

@implementation NSUserActivity(AppClip_Private)

- (id)appClipActivationPayload
{
  v1 = [a1 _payloadForIdentifier:@"com.apple.AppClip.useractivity.appClipActivationPayload"];
  id v6 = 0;
  v2 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[NSUserActivity(AppClip_Private) appClipActivationPayload]((uint64_t)v3);
    }
    id v4 = 0;
  }
  else
  {
    id v4 = v2;
  }

  return v4;
}

- (void)setAppClipActivationPayload:()AppClip_Private
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = 0;
    v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v7];
    id v6 = v7;
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[NSUserActivity(AppClip_Private) setAppClipActivationPayload:]((uint64_t)v6);
      }
    }
    else
    {
      [a1 _setPayload:v5 object:0 identifier:@"com.apple.AppClip.useractivity.appClipActivationPayload" dirty:0];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NSUserActivity(AppClip_Private) setAppClipActivationPayload:]();
  }
}

- (void)appClipActivationPayload
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_237D7B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "An error occurred when unarchiving activation payload, %@", (uint8_t *)&v1, 0xCu);
}

- (void)setAppClipActivationPayload:()AppClip_Private .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_237D7B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "An error occurred when archiving activation payload, %@", (uint8_t *)&v1, 0xCu);
}

- (void)setAppClipActivationPayload:()AppClip_Private .cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_237D7B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "The payload is not an instance of APActivationPayload.", v0, 2u);
}

@end