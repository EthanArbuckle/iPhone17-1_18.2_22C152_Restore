@interface CLFPhoneFaceTimeSettings
- (BOOL)dialerKeypadEnabled;
- (BOOL)legacyDialerKeypadEnabled;
- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit;
- (id)legacyOutgoingCommunicationLimit;
- (void)migrateCommunicationLimitsIfNecessary;
- (void)setLegacyDialerKeypadEnabled:(BOOL)a3;
@end

@implementation CLFPhoneFaceTimeSettings

uint64_t __56__CLFPhoneFaceTimeSettings_GeneratedCode_sharedInstance__block_invoke()
{
  sharedInstance_SharedSettings_0 = objc_alloc_init(CLFPhoneFaceTimeSettings);
  return MEMORY[0x270F9A758]();
}

- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit
{
  return 0;
}

- (BOOL)dialerKeypadEnabled
{
  v2 = [(CLFBaseCommunicationLimitSettings *)self outgoingCommunicationLimit];
  char v3 = [v2 isEqualToString:@"everyone"];

  return v3;
}

- (BOOL)legacyDialerKeypadEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"DialerKeypadEnabled" defaultValue:0];
}

- (void)setLegacyDialerKeypadEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"DialerKeypadEnabled"];
}

- (id)legacyOutgoingCommunicationLimit
{
  BOOL v2 = [(CLFPhoneFaceTimeSettings *)self legacyDialerKeypadEnabled];
  char v3 = &CLFCommunicationLimitEveryone;
  if (!v2) {
    char v3 = &CLFCommunicationLimitSelectedContacts;
  }
  id v4 = *v3;
  return v4;
}

- (void)migrateCommunicationLimitsIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)CLFPhoneFaceTimeSettings;
  [(CLFBaseCommunicationLimitSettings *)&v3 migrateCommunicationLimitsIfNecessary];
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:@"DialerKeypadEnabled"];
}

@end