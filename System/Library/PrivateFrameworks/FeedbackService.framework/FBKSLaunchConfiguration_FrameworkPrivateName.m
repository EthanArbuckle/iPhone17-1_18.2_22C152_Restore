@interface FBKSLaunchConfiguration_FrameworkPrivateName
+ (id)fromJSONWithData:(id)a3;
- (FBKSLaunchConfiguration_FrameworkPrivateName)init;
- (NSData)asJSON;
- (NSString)localizedAlertViewDeclineButtonTitle;
- (NSString)localizedAlertViewProceedButtonTitle;
- (NSString)localizedPromptMessage;
- (NSString)localizedPromptTitle;
- (int64_t)promptStyle;
- (void)setAlwaysLaunchInRemoteAlert:(BOOL)a3;
- (void)setLocalizedAlertViewDeclineButtonTitle:(id)a3;
- (void)setLocalizedAlertViewProceedButtonTitle:(id)a3;
- (void)setLocalizedPromptMessage:(id)a3;
- (void)setLocalizedPromptTitle:(id)a3;
- (void)setNotifyImmediately:(BOOL)a3;
- (void)setPromptStyle:(int64_t)a3;
- (void)setToSkipPrompt:(BOOL)a3;
@end

@implementation FBKSLaunchConfiguration_FrameworkPrivateName

- (void)setToSkipPrompt:(BOOL)a3
{
}

- (void)setAlwaysLaunchInRemoteAlert:(BOOL)a3
{
}

- (void)setNotifyImmediately:(BOOL)a3
{
}

- (NSData)asJSON
{
  v2 = self;
  uint64_t v3 = FBKSLaunchConfiguration.asJSON.getter();
  unint64_t v5 = v4;

  v6 = (void *)sub_24E001CC0();
  sub_24DF9311C(v3, v5);
  return (NSData *)v6;
}

+ (id)fromJSONWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_24E001CD0();
  unint64_t v6 = v5;

  v7 = (void *)_s15FeedbackService23FBKSLaunchConfigurationC8fromJSON4dataACSg10Foundation4DataV_tFZ_0();
  sub_24DF9311C(v4, v6);
  return v7;
}

- (int64_t)promptStyle
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setPromptStyle:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_promptStyle);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSString)localizedPromptTitle
{
  return (NSString *)sub_24DFB5538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptTitle);
}

- (void)setLocalizedPromptTitle:(id)a3
{
}

- (NSString)localizedPromptMessage
{
  return (NSString *)sub_24DFB5538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedPromptMessage);
}

- (void)setLocalizedPromptMessage:(id)a3
{
}

- (NSString)localizedAlertViewProceedButtonTitle
{
  return (NSString *)sub_24DFB5538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewProceedButtonTitle);
}

- (void)setLocalizedAlertViewProceedButtonTitle:(id)a3
{
}

- (NSString)localizedAlertViewDeclineButtonTitle
{
  return (NSString *)sub_24DFB5538((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___FBKSLaunchConfiguration_FrameworkPrivateName_localizedAlertViewDeclineButtonTitle);
}

- (void)setLocalizedAlertViewDeclineButtonTitle:(id)a3
{
}

- (FBKSLaunchConfiguration_FrameworkPrivateName)init
{
  return (FBKSLaunchConfiguration_FrameworkPrivateName *)FBKSLaunchConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end