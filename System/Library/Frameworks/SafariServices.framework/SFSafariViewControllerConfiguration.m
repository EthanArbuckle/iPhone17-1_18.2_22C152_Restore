@interface SFSafariViewControllerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_isBeingUsedForCellularServiceBootstrap;
- (BOOL)_isEphemeral;
- (BOOL)_isJITEnabled;
- (BOOL)_isPerformingAccountSecurityUpgrade;
- (BOOL)barCollapsingEnabled;
- (BOOL)entersReaderIfAvailable;
- (NSString)_personaUniqueIdentifier;
- (SFSafariViewControllerActivityButton)activityButton;
- (SFSafariViewControllerConfiguration)init;
- (SFSafariViewControllerConfiguration)initWithCoder:(id)a3;
- (UIEventAttribution)eventAttribution;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_redirectNotificationBehavior;
- (unint64_t)_storageModeForAuthenticationSession;
- (void)_setEphemeral:(BOOL)a3;
- (void)_setJITEnabled:(BOOL)a3;
- (void)_setPerformingAccountSecurityUpgrade:(BOOL)a3;
- (void)_setPersonaUniqueIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityButton:(SFSafariViewControllerActivityButton *)activityButton;
- (void)setBarCollapsingEnabled:(BOOL)barCollapsingEnabled;
- (void)setEntersReaderIfAvailable:(BOOL)entersReaderIfAvailable;
- (void)setEventAttribution:(UIEventAttribution *)eventAttribution;
- (void)set_isBeingUsedForCellularServiceBootstrap:(BOOL)a3;
- (void)set_redirectNotificationBehavior:(int64_t)a3;
- (void)set_storageModeForAuthenticationSession:(unint64_t)a3;
@end

@implementation SFSafariViewControllerConfiguration

- (SFSafariViewControllerConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFSafariViewControllerConfiguration;
  v2 = [(SFSafariViewControllerConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_barCollapsingEnabled = 1;
    v2->_jitEnabled = 1;
    v2->_redirectNotificationBehavior = dyld_program_sdk_at_least();
    v4 = v3;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v5 + 40), self->_activityButton);
  *(unsigned char *)(v5 + 13) = self->_barCollapsingEnabled;
  *(unsigned char *)(v5 + 12) = self->_entersReaderIfAvailable;
  *(unsigned char *)(v5 + 8) = self->_ephemeral;
  *(unsigned char *)(v5 + 10) = self->_jitEnabled;
  *(unsigned char *)(v5 + 9) = self->_performingAccountSecurityUpgrade;
  objc_storeStrong((id *)(v5 + 24), self->_personaUniqueIdentifier);
  *(void *)(v5 + 16) = self->_redirectNotificationBehavior;
  *(unsigned char *)(v5 + 11) = self->_isBeingUsedForCellularServiceBootstrap;
  uint64_t v6 = [(UIEventAttribution *)self->_eventAttribution copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  *(void *)(v5 + 32) = self->_storageModeForAuthenticationSession;
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSafariViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFSafariViewControllerConfiguration;
  uint64_t v5 = [(SFSafariViewControllerConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customActivityButton"];
    activityButton = v5->_activityButton;
    v5->_activityButton = (SFSafariViewControllerActivityButton *)v6;

    v5->_barCollapsingEnabled = [v4 decodeBoolForKey:@"barCollapsingEnabled"];
    v5->_entersReaderIfAvailable = [v4 decodeBoolForKey:@"entersReaderIfAvailable"];
    v5->_ephemeral = [v4 decodeBoolForKey:@"isEphemeral"];
    v5->_jitEnabled = [v4 decodeBoolForKey:@"jitEnabled"];
    v5->_performingAccountSecurityUpgrade = [v4 decodeBoolForKey:@"performingAccountSecurityUpgrade"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueIdentifier"];
    personaUniqueIdentifier = v5->_personaUniqueIdentifier;
    v5->_personaUniqueIdentifier = (NSString *)v8;

    v5->_redirectNotificationBehavior = [v4 decodeIntegerForKey:@"redirectNotificationBehavior"];
    v5->_isBeingUsedForCellularServiceBootstrap = [v4 decodeBoolForKey:@"isBeingUsedForCellularServiceBootstrap"];
    id v10 = objc_alloc(MEMORY[0x1E4FB1760]);
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventAttribution"];
    uint64_t v12 = [v10 initWithUISClickAttribution:v11];
    eventAttribution = v5->_eventAttribution;
    v5->_eventAttribution = (UIEventAttribution *)v12;

    v5->_storageModeForAuthenticationSession = [v4 decodeIntegerForKey:@"storageModeForAuthenticationSession"];
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  activityButton = self->_activityButton;
  id v6 = a3;
  [v6 encodeObject:activityButton forKey:@"customActivityButton"];
  [v6 encodeBool:self->_barCollapsingEnabled forKey:@"barCollapsingEnabled"];
  [v6 encodeBool:self->_entersReaderIfAvailable forKey:@"entersReaderIfAvailable"];
  [v6 encodeBool:self->_ephemeral forKey:@"isEphemeral"];
  [v6 encodeBool:self->_jitEnabled forKey:@"jitEnabled"];
  [v6 encodeBool:self->_performingAccountSecurityUpgrade forKey:@"performingAccountSecurityUpgrade"];
  [v6 encodeObject:self->_personaUniqueIdentifier forKey:@"personaUniqueIdentifier"];
  [v6 encodeInteger:self->_redirectNotificationBehavior forKey:@"redirectNotificationBehavior"];
  [v6 encodeBool:self->_isBeingUsedForCellularServiceBootstrap forKey:@"isBeingUsedForCellularServiceBootstrap"];
  uint64_t v5 = [(UIEventAttribution *)self->_eventAttribution toUISClickAttribution];
  [v6 encodeObject:v5 forKey:@"eventAttribution"];

  [v6 encodeInteger:self->_storageModeForAuthenticationSession forKey:@"storageModeForAuthenticationSession"];
}

- (int64_t)_redirectNotificationBehavior
{
  return self->_redirectNotificationBehavior;
}

- (void)set_redirectNotificationBehavior:(int64_t)a3
{
  self->_redirectNotificationBehavior = a3;
}

- (BOOL)_isEphemeral
{
  return self->_ephemeral;
}

- (void)_setEphemeral:(BOOL)a3
{
  self->_ephemeral = a3;
}

- (BOOL)_isPerformingAccountSecurityUpgrade
{
  return self->_performingAccountSecurityUpgrade;
}

- (void)_setPerformingAccountSecurityUpgrade:(BOOL)a3
{
  self->_performingAccountSecurityUpgrade = a3;
}

- (NSString)_personaUniqueIdentifier
{
  return self->_personaUniqueIdentifier;
}

- (void)_setPersonaUniqueIdentifier:(id)a3
{
}

- (BOOL)_isJITEnabled
{
  return self->_jitEnabled;
}

- (void)_setJITEnabled:(BOOL)a3
{
  self->_jitEnabled = a3;
}

- (BOOL)_isBeingUsedForCellularServiceBootstrap
{
  return self->_isBeingUsedForCellularServiceBootstrap;
}

- (void)set_isBeingUsedForCellularServiceBootstrap:(BOOL)a3
{
  self->_isBeingUsedForCellularServiceBootstrap = a3;
}

- (unint64_t)_storageModeForAuthenticationSession
{
  return self->_storageModeForAuthenticationSession;
}

- (void)set_storageModeForAuthenticationSession:(unint64_t)a3
{
  self->_storageModeForAuthenticationSession = a3;
}

- (BOOL)entersReaderIfAvailable
{
  return self->_entersReaderIfAvailable;
}

- (void)setEntersReaderIfAvailable:(BOOL)entersReaderIfAvailable
{
  self->_entersReaderIfAvailable = entersReaderIfAvailable;
}

- (BOOL)barCollapsingEnabled
{
  return self->_barCollapsingEnabled;
}

- (void)setBarCollapsingEnabled:(BOOL)barCollapsingEnabled
{
  self->_barCollapsingEnabled = barCollapsingEnabled;
}

- (SFSafariViewControllerActivityButton)activityButton
{
  return self->_activityButton;
}

- (void)setActivityButton:(SFSafariViewControllerActivityButton *)activityButton
{
}

- (UIEventAttribution)eventAttribution
{
  return self->_eventAttribution;
}

- (void)setEventAttribution:(UIEventAttribution *)eventAttribution
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAttribution, 0);
  objc_storeStrong((id *)&self->_activityButton, 0);

  objc_storeStrong((id *)&self->_personaUniqueIdentifier, 0);
}

@end