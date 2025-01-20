@interface BRCDeviceConfiguration
- (BOOL)_isIsSycBubble;
- (BOOL)_isSharedIPad:(id)a3;
- (BOOL)_isTesting;
- (NSDictionary)getConfiguration;
- (id)getDeviceConfigurationString;
@end

@implementation BRCDeviceConfiguration

- (NSDictionary)getConfiguration
{
  v21[5] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  configuration = v2->_configuration;
  if (!configuration)
  {
    v4 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v5 = [(BRCDeviceConfiguration *)v2 _isFPFS];
    uint64_t v6 = [(BRCDeviceConfiguration *)v2 _isSharedIPad:v4];
    uint64_t v7 = [(BRCDeviceConfiguration *)v2 _isIsSycBubble];
    uint64_t v8 = [(BRCDeviceConfiguration *)v2 _isTesting];
    v9 = [v4 currentPersona];
    uint64_t v10 = [v9 isDataSeparatedPersona];

    v20[0] = @"FPFS";
    v11 = [NSNumber numberWithBool:v5];
    v21[0] = v11;
    v20[1] = @"TESTING";
    v12 = [NSNumber numberWithBool:v8];
    v21[1] = v12;
    v20[2] = @"EDS";
    v13 = [NSNumber numberWithBool:v10];
    v21[2] = v13;
    v20[3] = @"SHARED_IPAD";
    v14 = [NSNumber numberWithBool:v6];
    v21[3] = v14;
    v20[4] = @"SYNC_BUBBLE";
    v15 = [NSNumber numberWithBool:v7];
    v21[4] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
    v17 = v2->_configuration;
    v2->_configuration = (NSDictionary *)v16;

    configuration = v2->_configuration;
  }
  v18 = configuration;
  objc_sync_exit(v2);

  return v18;
}

- (BOOL)_isSharedIPad:(id)a3
{
  return [a3 isSharedIPad];
}

- (BOOL)_isIsSycBubble
{
  return objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble");
}

- (BOOL)_isTesting
{
  v2 = +[BRCUserDefaults defaultsForMangledID:0];
  char v3 = [v2 testDevice];

  return v3;
}

- (id)getDeviceConfigurationString
{
  char v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@::", @"1.1"];
  v4 = [(BRCDeviceConfiguration *)self getConfiguration];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__BRCDeviceConfiguration_getDeviceConfigurationString__block_invoke;
  v7[3] = &unk_1E69974A0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

uint64_t __54__BRCDeviceConfiguration_getDeviceConfigurationString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@:%@;", a2, a3];
}

- (void).cxx_destruct
{
}

@end