@interface MIOMiscStreamOutputSettings
+ (BOOL)supportsEncoderType:(int)a3;
+ (id)audioSettingsFromConfig:(id)a3;
+ (id)customEncoderSettingsFromConfig:(id)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5;
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
@end

@implementation MIOMiscStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return (a3 < 0x21) & (0x100070000uLL >> a3);
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a7;
  id v9 = a3;
  v10 = [v9 objectForKey:@"StreamEncoderType"];
  int v11 = [v10 intValue];

  if (v11 <= 17)
  {
    if (v11 != 16)
    {
      if (v11 == 17)
      {
        v12 = 0;
        goto LABEL_11;
      }
LABEL_14:
      id v16 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Invalid encoder type." userInfo:0];
      objc_exception_throw(v16);
    }
    uint64_t v14 = [(id)objc_opt_class() audioSettingsFromConfig:v9];
    goto LABEL_10;
  }
  if (v11 == 18)
  {
    uint64_t v14 = [(id)objc_opt_class() customEncoderSettingsFromConfig:v9 frameRate:v7 enableAVEHighPerformanceProfile:a5];
LABEL_10:
    v12 = (MOVStreamOutputSettings *)v14;
    goto LABEL_11;
  }
  if (v11 != 32) {
    goto LABEL_14;
  }
  v13 = [v9 objectForKey:@"CustomOutputSettings"];
  v12 = [[MOVStreamOutputSettings alloc] initWithSettings:v13];
  [(MOVStreamOutputSettings *)v12 applyAdditionalCompressionPropertiesFromRecordingConfig:v9];

LABEL_11:

  return v12;
}

+ (id)customEncoderSettingsFromConfig:(id)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  v6 = objc_msgSend(a3, "objectForKey:", @"CustomEncoderConfig", a5);
  if (v6) {
    BOOL v7 = [[MOVStreamOutputSettings alloc] initWithConfig:v6];
  }
  else {
    BOOL v7 = [[MOVStreamOutputSettings alloc] initWithFrameRate:1 useCustomEncoderConfig:a4];
  }
  v8 = v7;

  return v8;
}

+ (id)audioSettingsFromConfig:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 objectForKey:@"AudioFormatObject"];
  v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 settings];
    [v4 addEntriesFromDictionary:v7];
  }
  v8 = [v3 objectForKey:@"AdditionalAudioSettings"];
  if ([v8 count]) {
    [v4 addEntriesFromDictionary:v8];
  }
  if ([v4 count])
  {
    id v9 = [MOVStreamOutputSettings alloc];
    v10 = (void *)[v4 copy];
    int v11 = [(MOVStreamOutputSettings *)v9 initWithSettings:v10];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

@end