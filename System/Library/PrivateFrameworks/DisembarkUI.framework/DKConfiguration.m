@interface DKConfiguration
+ (id)defaultConfiguration;
+ (id)setupAssistantConfiguration;
- (BOOL)allowNonInteractiveCloudUpload;
- (BOOL)postFollowUp;
- (BOOL)presentsNetworkSettingsModally;
- (BOOL)preventOpeningSafari;
- (BOOL)skipBackup;
- (BOOL)upsellTradeIn;
- (DKConfiguration)init;
- (void)setAllowNonInteractiveCloudUpload:(BOOL)a3;
- (void)setPostFollowUp:(BOOL)a3;
- (void)setPresentsNetworkSettingsModally:(BOOL)a3;
- (void)setPreventOpeningSafari:(BOOL)a3;
- (void)setSkipBackup:(BOOL)a3;
- (void)setUpsellTradeIn:(BOOL)a3;
@end

@implementation DKConfiguration

- (DKConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)DKConfiguration;
  result = [(DKConfiguration *)&v3 init];
  if (result) {
    result->_allowNonInteractiveCloudUpload = 1;
  }
  return result;
}

+ (id)defaultConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)setupAssistantConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setPostFollowUp:1];
  [v2 setSkipBackup:1];
  [v2 setPreventOpeningSafari:1];
  [v2 setPresentsNetworkSettingsModally:1];
  return v2;
}

- (BOOL)upsellTradeIn
{
  return self->_upsellTradeIn;
}

- (void)setUpsellTradeIn:(BOOL)a3
{
  self->_upsellTradeIn = a3;
}

- (BOOL)postFollowUp
{
  return self->_postFollowUp;
}

- (void)setPostFollowUp:(BOOL)a3
{
  self->_postFollowUp = a3;
}

- (BOOL)skipBackup
{
  return self->_skipBackup;
}

- (void)setSkipBackup:(BOOL)a3
{
  self->_skipBackup = a3;
}

- (BOOL)preventOpeningSafari
{
  return self->_preventOpeningSafari;
}

- (void)setPreventOpeningSafari:(BOOL)a3
{
  self->_preventOpeningSafari = a3;
}

- (BOOL)presentsNetworkSettingsModally
{
  return self->_presentsNetworkSettingsModally;
}

- (void)setPresentsNetworkSettingsModally:(BOOL)a3
{
  self->_presentsNetworkSettingsModally = a3;
}

- (BOOL)allowNonInteractiveCloudUpload
{
  return self->_allowNonInteractiveCloudUpload;
}

- (void)setAllowNonInteractiveCloudUpload:(BOOL)a3
{
  self->_allowNonInteractiveCloudUpload = a3;
}

@end