@interface HMDAnalyticsMultiUserSettingsValueByKeyPath
- (NSData)multiUserSettingsValueData;
- (NSString)multiUserSettingsValueString;
- (int)type;
- (int64_t)multiUserSettingsValueInteger;
- (void)setMultiUserSettingsValueData:(id)a3;
- (void)setMultiUserSettingsValueInteger:(int64_t)a3;
- (void)setMultiUserSettingsValueString:(id)a3;
- (void)setType:(int)a3;
@end

@implementation HMDAnalyticsMultiUserSettingsValueByKeyPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserSettingsValueString, 0);
  objc_storeStrong((id *)&self->_multiUserSettingsValueData, 0);
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setMultiUserSettingsValueString:(id)a3
{
}

- (NSString)multiUserSettingsValueString
{
  return self->_multiUserSettingsValueString;
}

- (void)setMultiUserSettingsValueData:(id)a3
{
}

- (NSData)multiUserSettingsValueData
{
  return self->_multiUserSettingsValueData;
}

- (void)setMultiUserSettingsValueInteger:(int64_t)a3
{
  self->_multiUserSettingsValueInteger = a3;
}

- (int64_t)multiUserSettingsValueInteger
{
  return self->_multiUserSettingsValueInteger;
}

@end