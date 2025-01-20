@interface CSVoiceTriggerRTModelRequestOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowMph;
- (CSCoreSpeechServicesAccessoryInfo)accessoryInfo;
- (CSVoiceTriggerRTModelRequestOptions)initWithCSRTModelRequestOptions:(id)a3 builder:(id)a4;
- (CSVoiceTriggerRTModelRequestOptions)initWithCoder:(id)a3;
- (CSVoiceTriggerRTModelRequestOptions)initWithMutableBuilder:(id)a3;
- (NSNumber)accessoryModelType;
- (NSNumber)engineMajorVersion;
- (NSNumber)engineMinorVersion;
- (NSNumber)userSelectedPhraseType;
- (NSString)siriLocale;
- (NSUUID)endpointId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSVoiceTriggerRTModelRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_siriLocale, 0);
  objc_storeStrong((id *)&self->_accessoryModelType, 0);
  objc_storeStrong((id *)&self->_engineMinorVersion, 0);
  objc_storeStrong((id *)&self->_engineMajorVersion, 0);
  objc_storeStrong((id *)&self->_endpointId, 0);
}

- (CSCoreSpeechServicesAccessoryInfo)accessoryInfo
{
  return self->_accessoryInfo;
}

- (NSString)siriLocale
{
  return self->_siriLocale;
}

- (NSNumber)accessoryModelType
{
  return self->_accessoryModelType;
}

- (NSNumber)engineMinorVersion
{
  return self->_engineMinorVersion;
}

- (NSNumber)engineMajorVersion
{
  return self->_engineMajorVersion;
}

- (NSUUID)endpointId
{
  return self->_endpointId;
}

- (NSNumber)userSelectedPhraseType
{
  return self->_userSelectedPhraseType;
}

- (BOOL)allowMph
{
  return self->_allowMph;
}

- (id)description
{
  return +[NSString stringWithFormat:@"siriLocale: %@, allowMph: %d, phraseType: %@, endpointId: %@, engineMajorVersion: %@, engineMinorVersion: %@, accessoryModelType:%@, accessoryInfo: %@", self->_siriLocale, self->_allowMph, self->_userSelectedPhraseType, self->_endpointId, self->_engineMajorVersion, self->_engineMinorVersion, self->_accessoryModelType, self->_accessoryInfo];
}

- (void)encodeWithCoder:(id)a3
{
  siriLocale = self->_siriLocale;
  id v5 = a3;
  [v5 encodeObject:siriLocale forKey:@"CSRTModelRequestOptionsSiriLocale"];
  [v5 encodeBool:self->_allowMph forKey:@"CSRTModelRequestOptionsAllowMph"];
  [v5 encodeObject:self->_userSelectedPhraseType forKey:@"CSRTModelRequestOptionsUserSelectedPhraseType"];
  [v5 encodeObject:self->_endpointId forKey:@"CSRTModelRequestOptionsEndpointId"];
  [v5 encodeObject:self->_engineMajorVersion forKey:@"CSRTModelRequestOptionsngineMajorVersion"];
  [v5 encodeObject:self->_engineMinorVersion forKey:@"CSRTModelRequestOptionsEngineMinorVersion"];
  [v5 encodeObject:self->_accessoryModelType forKey:@"CSRTModelRequestOptionsAccessoryModelType"];
  [v5 encodeObject:self->_accessoryInfo forKey:@"CSRTModelRequestOptionsAccessoryInfo"];
}

- (CSVoiceTriggerRTModelRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSRTModelRequestOptionsSiriLocale"];
  unsigned __int8 v6 = [v4 decodeBoolForKey:@"CSRTModelRequestOptionsAllowMph"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSRTModelRequestOptionsUserSelectedPhraseType"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSRTModelRequestOptionsEndpointId"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSRTModelRequestOptionsngineMajorVersion"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSRTModelRequestOptionsEngineMinorVersion"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSRTModelRequestOptionsAccessoryModelType"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSRTModelRequestOptionsAccessoryInfo"];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100008C54;
  v22[3] = &unk_10001C708;
  unsigned __int8 v30 = v6;
  id v23 = v5;
  id v24 = v7;
  id v25 = v8;
  id v26 = v9;
  id v27 = v10;
  id v28 = v11;
  id v29 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  id v18 = v7;
  id v19 = v5;
  v20 = [(CSVoiceTriggerRTModelRequestOptions *)self initWithMutableBuilder:v22];

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_initWeak(&location, self);
  id v4 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008DC8;
  v7[3] = &unk_10001C6E0;
  objc_copyWeak(&v8, &location);
  id v5 = [(CSVoiceTriggerRTModelRequestOptions *)v4 initWithMutableBuilder:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (CSVoiceTriggerRTModelRequestOptions)initWithCSRTModelRequestOptions:(id)a3 builder:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009034;
  v10[3] = &unk_10001C6B8;
  id v11 = a3;
  id v12 = a4;
  id v6 = v12;
  id v7 = v11;
  id v8 = [(CSVoiceTriggerRTModelRequestOptions *)self initWithMutableBuilder:v10];

  return v8;
}

- (CSVoiceTriggerRTModelRequestOptions)initWithMutableBuilder:(id)a3
{
  id v4 = (void (**)(id, CSVoiceTriggerRTModelRequestOptionsMutable *))a3;
  v21.receiver = self;
  v21.super_class = (Class)CSVoiceTriggerRTModelRequestOptions;
  id v5 = [(CSVoiceTriggerRTModelRequestOptions *)&v21 init];
  id v6 = objc_alloc_init(CSVoiceTriggerRTModelRequestOptionsMutable);
  if (v5)
  {
    if (v4) {
      v4[2](v4, v6);
    }
    uint64_t v7 = [(CSVoiceTriggerRTModelRequestOptionsMutable *)v6 mSiriLocale];
    siriLocale = v5->_siriLocale;
    v5->_siriLocale = (NSString *)v7;

    v5->_allowMph = [(CSVoiceTriggerRTModelRequestOptionsMutable *)v6 mAllowMph];
    v5->_userSelectedPhraseType = (NSNumber *)[(CSVoiceTriggerRTModelRequestOptionsMutable *)v6 mUserSelectedPhrasetype];
    uint64_t v9 = [(CSVoiceTriggerRTModelRequestOptionsMutable *)v6 mEndpointId];
    endpointId = v5->_endpointId;
    v5->_endpointId = (NSUUID *)v9;

    uint64_t v11 = [(CSVoiceTriggerRTModelRequestOptionsMutable *)v6 mEngineMajorVersion];
    engineMajorVersion = v5->_engineMajorVersion;
    v5->_engineMajorVersion = (NSNumber *)v11;

    uint64_t v13 = [(CSVoiceTriggerRTModelRequestOptionsMutable *)v6 mEngineMinorVersion];
    engineMinorVersion = v5->_engineMinorVersion;
    v5->_engineMinorVersion = (NSNumber *)v13;

    uint64_t v15 = [(CSVoiceTriggerRTModelRequestOptionsMutable *)v6 mAccessoryModelType];
    accessoryModelType = v5->_accessoryModelType;
    v5->_accessoryModelType = (NSNumber *)v15;

    id v17 = [(CSVoiceTriggerRTModelRequestOptionsMutable *)v6 mAccessoryInfo];
    id v18 = (CSCoreSpeechServicesAccessoryInfo *)[v17 copy];
    accessoryInfo = v5->_accessoryInfo;
    v5->_accessoryInfo = v18;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end