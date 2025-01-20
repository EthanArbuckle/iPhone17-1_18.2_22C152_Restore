@interface CSVoiceTriggerRTModelRequestOptionsMutable
- (BOOL)mAllowMph;
- (CSCoreSpeechServicesAccessoryInfo)mAccessoryInfo;
- (NSNumber)mAccessoryModelType;
- (NSNumber)mEngineMajorVersion;
- (NSNumber)mEngineMinorVersion;
- (NSNumber)mUserSelectedPhrasetype;
- (NSString)mFallbackPhraseType;
- (NSString)mSiriLocale;
- (NSUUID)mEndpointId;
- (void)setAccessoryModelType:(id)a3;
- (void)setAllowMph:(BOOL)a3;
- (void)setCSCoreSpeechServicesAccessoryInfo:(id)a3;
- (void)setEndpointId:(id)a3;
- (void)setEngineMajorVersion:(id)a3;
- (void)setEngineMinorVersion:(id)a3;
- (void)setMAccessoryInfo:(id)a3;
- (void)setMAllowMph:(BOOL)a3;
- (void)setMFallbackPhraseType:(id)a3;
- (void)setMSiriLocale:(id)a3;
- (void)setMUserSelectedPhrasetype:(id)a3;
- (void)setSiriLocale:(id)a3;
- (void)setUserSelectedPhraseType:(id)a3;
@end

@implementation CSVoiceTriggerRTModelRequestOptionsMutable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_mSiriLocale, 0);
  objc_storeStrong((id *)&self->_mAccessoryModelType, 0);
  objc_storeStrong((id *)&self->_mEngineMinorVersion, 0);
  objc_storeStrong((id *)&self->_mEngineMajorVersion, 0);
  objc_storeStrong((id *)&self->_mEndpointId, 0);
  objc_storeStrong((id *)&self->_mFallbackPhraseType, 0);
  objc_storeStrong((id *)&self->_mUserSelectedPhrasetype, 0);
}

- (void)setMAccessoryInfo:(id)a3
{
}

- (CSCoreSpeechServicesAccessoryInfo)mAccessoryInfo
{
  return self->_mAccessoryInfo;
}

- (void)setMSiriLocale:(id)a3
{
}

- (NSString)mSiriLocale
{
  return self->_mSiriLocale;
}

- (NSNumber)mAccessoryModelType
{
  return self->_mAccessoryModelType;
}

- (NSNumber)mEngineMinorVersion
{
  return self->_mEngineMinorVersion;
}

- (NSNumber)mEngineMajorVersion
{
  return self->_mEngineMajorVersion;
}

- (NSUUID)mEndpointId
{
  return self->_mEndpointId;
}

- (void)setMFallbackPhraseType:(id)a3
{
}

- (NSString)mFallbackPhraseType
{
  return self->_mFallbackPhraseType;
}

- (void)setMUserSelectedPhrasetype:(id)a3
{
}

- (NSNumber)mUserSelectedPhrasetype
{
  return self->_mUserSelectedPhrasetype;
}

- (void)setMAllowMph:(BOOL)a3
{
  self->_mAllowMph = a3;
}

- (BOOL)mAllowMph
{
  return self->_mAllowMph;
}

- (void)setUserSelectedPhraseType:(id)a3
{
}

- (void)setCSCoreSpeechServicesAccessoryInfo:(id)a3
{
  v4 = (CSCoreSpeechServicesAccessoryInfo *)[a3 copy];
  mAccessoryInfo = self->_mAccessoryInfo;
  self->_mAccessoryInfo = v4;
}

- (void)setSiriLocale:(id)a3
{
}

- (void)setAccessoryModelType:(id)a3
{
}

- (void)setEngineMinorVersion:(id)a3
{
}

- (void)setEngineMajorVersion:(id)a3
{
}

- (void)setEndpointId:(id)a3
{
}

- (void)setAllowMph:(BOOL)a3
{
  self->_mAllowMph = a3;
}

@end