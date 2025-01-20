@interface SHServerResponseContext
- (NSString)campaignToken;
- (SHServerResponseContext)init;
- (double)defaultRecordingIntermissionInSeconds;
- (double)defaultRecordingSignatureOffsetInSeconds;
- (void)setCampaignToken:(id)a3;
- (void)setDefaultRecordingIntermissionInSeconds:(double)a3;
- (void)setDefaultRecordingSignatureOffsetInSeconds:(double)a3;
- (void)sh_setCampaignTokenForClientIdentifier:(id)a3 completion:(id)a4;
- (void)sh_setDefaultValuesWithCompletion:(id)a3;
@end

@implementation SHServerResponseContext

- (void)sh_setDefaultValuesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = +[SHRemoteConfiguration sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009F98;
  v7[3] = &unk_100074EA8;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [v5 defaultValuesWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sh_setCampaignTokenForClientIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = +[SHRemoteConfiguration sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A164;
  v11[3] = &unk_100074ED0;
  id v9 = v7;
  id v13 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v6;
  id v12 = v10;
  [v8 campaignTokenWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (SHServerResponseContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHServerResponseContext;
  v2 = [(SHServerResponseContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    double v4 = SHRecordingSignatureOffsetDefaultValue;
    *(void *)&v2->_defaultRecordingIntermissionInSeconds = SHRecordingIntermissionDefaultValue;
    v2->_defaultRecordingSignatureOffsetInSeconds = v4;
    objc_storeStrong((id *)&v2->_campaignToken, SHCampaignTokenDefaultCampaignValue);
  }
  return v3;
}

- (double)defaultRecordingIntermissionInSeconds
{
  return self->_defaultRecordingIntermissionInSeconds;
}

- (void)setDefaultRecordingIntermissionInSeconds:(double)a3
{
  self->_defaultRecordingIntermissionInSeconds = a3;
}

- (double)defaultRecordingSignatureOffsetInSeconds
{
  return self->_defaultRecordingSignatureOffsetInSeconds;
}

- (void)setDefaultRecordingSignatureOffsetInSeconds:(double)a3
{
  self->_defaultRecordingSignatureOffsetInSeconds = a3;
}

- (NSString)campaignToken
{
  return self->_campaignToken;
}

- (void)setCampaignToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end