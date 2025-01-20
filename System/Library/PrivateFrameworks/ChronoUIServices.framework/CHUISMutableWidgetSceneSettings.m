@interface CHUISMutableWidgetSceneSettings
- (BOOL)areAnimationsPaused;
- (BOOL)canAppearInSecureEnvironment;
- (BOOL)isContentPaused;
- (BOOL)isInteractionDisabled;
- (BOOL)prefersUnredactedContentInLowLuminanceEnvironment;
- (BOOL)shouldVisibleEntrySnapshot;
- (BOOL)showsWidgetLabel;
- (BOOL)supportsLowLuminance;
- (BOOL)wantsBaseContentTouchEvents;
- (CHSInlineTextParameters)inlineTextParameters;
- (CHSWidget)widget;
- (CHSWidgetMetrics)metrics;
- (CHSWidgetRenderScheme)renderScheme;
- (CHSWidgetTintParameters)tintParameters;
- (CHUISWidgetVisibilitySettings)visibility;
- (NSString)additionalSnapshotPresentationContext;
- (NSString)hostIdentifier;
- (NSString)remoteViewControllerClassName;
- (NSString)widgetConfigurationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)keybagLockPolicy;
- (unint64_t)clipBehavior;
- (unint64_t)colorScheme;
- (unint64_t)contentType;
- (unint64_t)widgetPriority;
- (void)setAdditionalSnapshotPresentationContext:(id)a3;
- (void)setAnimationsPaused:(BOOL)a3;
- (void)setCanAppearInSecureEnvironment:(BOOL)a3;
- (void)setClipBehavior:(unint64_t)a3;
- (void)setColorScheme:(unint64_t)a3;
- (void)setContentPaused:(BOOL)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setInlineTextParameters:(id)a3;
- (void)setInteractionDisabled:(BOOL)a3;
- (void)setKeybagLockPolicy:(int64_t)a3;
- (void)setMetrics:(id)a3;
- (void)setPrefersUnredactedContentInLowLuminanceEnvironment:(BOOL)a3;
- (void)setRemoteViewControllerClassName:(id)a3;
- (void)setRenderScheme:(id)a3;
- (void)setShowsWidgetLabel:(BOOL)a3;
- (void)setSupportsLowLuminance:(BOOL)a3;
- (void)setTintParameters:(id)a3;
- (void)setVisibility:(id)a3;
- (void)setVisibleEntryShouldSnapshot:(BOOL)a3;
- (void)setWantsBaseContentTouchEvents:(BOOL)a3;
- (void)setWidget:(id)a3;
- (void)setWidgetConfigurationIdentifier:(id)a3;
- (void)setWidgetHostIdentifier:(id)a3;
- (void)setWidgetPriority:(unint64_t)a3;
@end

@implementation CHUISMutableWidgetSceneSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHUISWidgetSceneSettings alloc];

  return [(FBSSettings *)v4 initWithSettings:self];
}

- (void)setWidget:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88888];
}

- (void)setMetrics:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88889];
}

- (void)setWidgetHostIdentifier:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88896];
}

- (void)setWidgetConfigurationIdentifier:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88890];
}

- (void)setVisibility:(id)a3
{
  id v6 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  id v5 = (void *)[v6 copy];
  [v4 setObject:v5 forSetting:88891];
}

- (void)setContentType:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:88892];
}

- (void)setColorScheme:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:88893];
}

- (void)setWidgetPriority:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:88906];
}

- (void)setAnimationsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88894];
}

- (void)setContentPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88904];
}

- (void)setVisibleEntryShouldSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88895];
}

- (void)setCanAppearInSecureEnvironment:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88897];
}

- (void)setKeybagLockPolicy:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:88910];
}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88902];
}

- (void)setPrefersUnredactedContentInLowLuminanceEnvironment:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88903];
}

- (void)setTintParameters:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88898];
}

- (void)setInlineTextParameters:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88899];
}

- (void)setShowsWidgetLabel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88905];
}

- (void)setInteractionDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88907];
}

- (void)setAdditionalSnapshotPresentationContext:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88900];
}

- (void)setRemoteViewControllerClassName:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88901];
}

- (void)setRenderScheme:(id)a3
{
  id v5 = a3;
  v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:88908];
}

- (void)setClipBehavior:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:88909];
}

- (void)setWantsBaseContentTouchEvents:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:88911];
}

- (CHSWidget)widget
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88888];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return (CHSWidget *)v7;
}

- (CHSWidgetMetrics)metrics
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88889];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return (CHSWidgetMetrics *)v7;
}

- (NSString)hostIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88896];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (NSString)widgetConfigurationIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88890];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (CHUISWidgetVisibilitySettings)visibility
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88891];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  v8 = (void *)[v7 copy];

  return (CHUISWidgetVisibilitySettings *)v8;
}

- (unint64_t)contentType
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88892];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v7 unsignedIntegerValue];
  return v8;
}

- (unint64_t)colorScheme
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88893];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v7 unsignedIntegerValue];
  return v8;
}

- (unint64_t)widgetPriority
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88906];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v7 unsignedIntegerValue];
  return v8;
}

- (BOOL)areAnimationsPaused
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88894];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (BOOL)isContentPaused
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88904];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (BOOL)shouldVisibleEntrySnapshot
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88895];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (BOOL)canAppearInSecureEnvironment
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88897];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (int64_t)keybagLockPolicy
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88910];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  int64_t v8 = [v7 integerValue];
  return v8;
}

- (BOOL)supportsLowLuminance
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88902];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (BOOL)prefersUnredactedContentInLowLuminanceEnvironment
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88903];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (CHSWidgetTintParameters)tintParameters
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88898];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return (CHSWidgetTintParameters *)v7;
}

- (CHSInlineTextParameters)inlineTextParameters
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88899];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return (CHSInlineTextParameters *)v7;
}

- (BOOL)showsWidgetLabel
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88905];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (BOOL)isInteractionDisabled
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88907];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (NSString)additionalSnapshotPresentationContext
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88900];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = (void *)[v7 copy];

  return (NSString *)v8;
}

- (NSString)remoteViewControllerClassName
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88901];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = (void *)[v7 copy];

  return (NSString *)v8;
}

- (CHSWidgetRenderScheme)renderScheme
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = +[CHUISWidgetSceneSettings _renderSchemeFromSettings:v2];

  return (CHSWidgetRenderScheme *)v3;
}

- (unint64_t)clipBehavior
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88909];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v7 unsignedIntegerValue];
  return v8;
}

- (BOOL)wantsBaseContentTouchEvents
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:88911];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  return v8;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 88888 > 0x17)
  {
    v5.receiver = self;
    v5.super_class = (Class)CHUISMutableWidgetSceneSettings;
    BOOL v3 = -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
  }
  else
  {
    BOOL v3 = CHUISWidgetSceneSettingsKeyDescription(a3);
  }

  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  if (a5 - 88888 > 0x17)
  {
    v11.receiver = self;
    v11.super_class = (Class)CHUISMutableWidgetSceneSettings;
    v9 = [(FBSSettings *)&v11 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  else
  {
    CHUISWidgetSceneSettingsValueDescription(a5, v8);
    objc_claimAutoreleasedReturnValue();
    v9 = v8;
  }

  return v9;
}

- (void)setHostIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end