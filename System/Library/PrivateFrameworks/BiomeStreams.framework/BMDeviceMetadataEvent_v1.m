@interface BMDeviceMetadataEvent_v1
- (BMDeviceMetadataEvent_v1)initWithProto:(id)a3;
@end

@implementation BMDeviceMetadataEvent_v1

- (BMDeviceMetadataEvent_v1)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [v5 name];
      v7 = [v5 build];
      v8 = [v5 supplementalBuild];
      uint64_t v9 = [v5 platform];
      uint64_t v10 = v9;
      if (v9 >= 9)
      {
        v13 = __biome_log_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[BMDeviceMetadataEvent_v1 initWithProto:](v10, v13);
        }

        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = v9;
      }
      self = [(BMDeviceMetadataEvent *)self initWithName:v6 build:v7 supplementalBuild:v8 platform:v11 rapidSecurityResponsePreReboot:[v5 rapidSecurityResponsePreReboot]];

      v12 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMDeviceMetadataEvent initWithProto:]();
      }
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithInt:a1];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMDeviceMetadataEvent: unable to convert BMDevicePlatform v1 enum value: %@", (uint8_t *)&v4, 0xCu);
}

@end