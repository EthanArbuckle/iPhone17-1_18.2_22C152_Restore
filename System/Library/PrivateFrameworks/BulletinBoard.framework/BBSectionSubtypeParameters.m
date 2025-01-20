@interface BBSectionSubtypeParameters
+ (BOOL)supportsSecureCoding;
- (BBSectionIcon)sectionIconOverride;
- (BBSectionSubtypeParameters)fallbackParameters;
- (BBSectionSubtypeParameters)initWithCoder:(id)a3;
- (BBSectionSubtypeParameters)initWithFallbackParameters:(id)a3;
- (BOOL)allowsAddingToLockScreenWhenUnlocked;
- (BOOL)allowsAutomaticRemovalFromLockScreen;
- (BOOL)allowsPersistentBannersInCarPlay;
- (BOOL)allowsSupplementaryActionsInCarPlay;
- (BOOL)canBeSilencedByMenuButtonPress;
- (BOOL)coalescesWhenLocked;
- (BOOL)hideDismissActionInCarPlay;
- (BOOL)ignoresQuietMode;
- (BOOL)inertWhenLocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)playsMediaWhenRaised;
- (BOOL)playsSoundForModify;
- (BOOL)preemptsPresentedAlert;
- (BOOL)preservesUnlockActionCase;
- (BOOL)preventLock;
- (BOOL)prioritizeAtTopOfLockScreen;
- (BOOL)revealsAdditionalContentOnPresentation;
- (BOOL)shouldDismissBulletinWhenClosed;
- (BOOL)showsContactPhoto;
- (BOOL)showsUnreadIndicatorForNoticesFeed;
- (BOOL)suppressDelayForForwardedBulletins;
- (BOOL)suppressPresentationInAmbient;
- (BOOL)suppressesAlertsWhenAppIsActive;
- (BOOL)suppressesTitle;
- (BOOL)visuallyIndicatesWhenDateIsInFuture;
- (NSNumber)boxedAllowsAddingToLockScreenWhenUnlocked;
- (NSNumber)boxedAllowsAutomaticRemovalFromLockScreen;
- (NSNumber)boxedAllowsPersistentBannersInCarPlay;
- (NSNumber)boxedAllowsSupplementaryActionsInCarPlay;
- (NSNumber)boxedCanBeSilencedByMenuButtonPress;
- (NSNumber)boxedCoalescesWhenLocked;
- (NSNumber)boxedHideDismissActionInCarPlay;
- (NSNumber)boxedIPodOutAlertType;
- (NSNumber)boxedIgnoresQuietMode;
- (NSNumber)boxedInertWhenLocked;
- (NSNumber)boxedPlaysMediaWhenRaised;
- (NSNumber)boxedPlaysSoundForModify;
- (NSNumber)boxedPreservesUnlockActionCase;
- (NSNumber)boxedPreventLock;
- (NSNumber)boxedPrioritizeAtTopOfLockScreen;
- (NSNumber)boxedPrivacySettings;
- (NSNumber)boxedRevealsAdditionalContentOnPresentation;
- (NSNumber)boxedShouldDismissBulletinWhenClosed;
- (NSNumber)boxedShowsContactPhoto;
- (NSNumber)boxedShowsUnreadIndicatorForNoticesFeed;
- (NSNumber)boxedSubtypePriority;
- (NSNumber)boxedSuppressDelayForForwardedBulletins;
- (NSNumber)boxedSuppressPresentationInAmbient;
- (NSNumber)boxedSuppressesAlertsWhenAppIsActive;
- (NSNumber)boxedSuppressesTitle;
- (NSNumber)boxedVisuallyIndicatesWhenDateIsInFuture;
- (NSSet)alertSuppressionAppIDs;
- (NSString)alternateActionLabel;
- (NSString)bannerAccessoryRemoteServiceBundleIdentifier;
- (NSString)bannerAccessoryRemoteViewControllerClassName;
- (NSString)fullAlternateActionLabel;
- (NSString)fullUnlockActionLabel;
- (NSString)hiddenPreviewsBodyPlaceholder;
- (NSString)missedBannerDescriptionFormat;
- (NSString)secondaryContentRemoteServiceBundleIdentifier;
- (NSString)secondaryContentRemoteViewControllerClassName;
- (NSString)subtypeSummaryFormat;
- (NSString)topic;
- (NSString)unlockActionLabel;
- (int64_t)iPodOutAlertType;
- (unint64_t)hash;
- (unint64_t)privacySettings;
- (unint64_t)subtypePriority;
- (void)encodeWithCoder:(id)a3;
- (void)setAlertSuppressionAppIDs:(id)a3;
- (void)setAllowsAddingToLockScreenWhenUnlocked:(BOOL)a3;
- (void)setAllowsAutomaticRemovalFromLockScreen:(BOOL)a3;
- (void)setAllowsPersistentBannersInCarPlay:(BOOL)a3;
- (void)setAllowsSupplementaryActionsInCarPlay:(BOOL)a3;
- (void)setAlternateActionLabel:(id)a3;
- (void)setBannerAccessoryRemoteServiceBundleIdentifier:(id)a3;
- (void)setBannerAccessoryRemoteViewControllerClassName:(id)a3;
- (void)setBoxedAllowsAddingToLockScreenWhenUnlocked:(id)a3;
- (void)setBoxedAllowsAutomaticRemovalFromLockScreen:(id)a3;
- (void)setBoxedAllowsPersistentBannersInCarPlay:(id)a3;
- (void)setBoxedAllowsSupplementaryActionsInCarPlay:(id)a3;
- (void)setBoxedCanBeSilencedByMenuButtonPress:(id)a3;
- (void)setBoxedCoalescesWhenLocked:(id)a3;
- (void)setBoxedHideDismissActionInCarPlay:(id)a3;
- (void)setBoxedIPodOutAlertType:(id)a3;
- (void)setBoxedIgnoresQuietMode:(id)a3;
- (void)setBoxedInertWhenLocked:(id)a3;
- (void)setBoxedPlaysMediaWhenRaised:(id)a3;
- (void)setBoxedPlaysSoundForModify:(id)a3;
- (void)setBoxedPreservesUnlockActionCase:(id)a3;
- (void)setBoxedPreventLock:(id)a3;
- (void)setBoxedPrioritizeAtTopOfLockScreen:(id)a3;
- (void)setBoxedPrivacySettings:(id)a3;
- (void)setBoxedRevealsAdditionalContentOnPresentation:(id)a3;
- (void)setBoxedShouldDismissBulletinWhenClosed:(id)a3;
- (void)setBoxedShowsContactPhoto:(id)a3;
- (void)setBoxedShowsUnreadIndicatorForNoticesFeed:(id)a3;
- (void)setBoxedSubtypePriority:(id)a3;
- (void)setBoxedSuppressDelayForForwardedBulletins:(id)a3;
- (void)setBoxedSuppressPresentationInAmbient:(id)a3;
- (void)setBoxedSuppressesAlertsWhenAppIsActive:(id)a3;
- (void)setBoxedSuppressesTitle:(id)a3;
- (void)setBoxedVisuallyIndicatesWhenDateIsInFuture:(id)a3;
- (void)setCanBeSilencedByMenuButtonPress:(BOOL)a3;
- (void)setCoalescesWhenLocked:(BOOL)a3;
- (void)setFallbackParameters:(id)a3;
- (void)setFullAlternateActionLabel:(id)a3;
- (void)setFullUnlockActionLabel:(id)a3;
- (void)setHiddenPreviewsBodyPlaceholder:(id)a3;
- (void)setHideDismissActionInCarPlay:(BOOL)a3;
- (void)setIPodOutAlertType:(int64_t)a3;
- (void)setIgnoresQuietMode:(BOOL)a3;
- (void)setInertWhenLocked:(BOOL)a3;
- (void)setMissedBannerDescriptionFormat:(id)a3;
- (void)setPlaysMediaWhenRaised:(BOOL)a3;
- (void)setPlaysSoundForModify:(BOOL)a3;
- (void)setPreservesUnlockActionCase:(BOOL)a3;
- (void)setPreventLock:(BOOL)a3;
- (void)setPrioritizeAtTopOfLockScreen:(BOOL)a3;
- (void)setPrivacySettings:(unint64_t)a3;
- (void)setRevealsAdditionalContentOnPresentation:(BOOL)a3;
- (void)setSecondaryContentRemoteServiceBundleIdentifier:(id)a3;
- (void)setSecondaryContentRemoteViewControllerClassName:(id)a3;
- (void)setSectionIconOverride:(id)a3;
- (void)setShouldDismissBulletinWhenClosed:(BOOL)a3;
- (void)setShowsContactPhoto:(BOOL)a3;
- (void)setShowsUnreadIndicatorForNoticesFeed:(BOOL)a3;
- (void)setSubtypePriority:(unint64_t)a3;
- (void)setSubtypeSummaryFormat:(id)a3;
- (void)setSuppressDelayForForwardedBulletins:(BOOL)a3;
- (void)setSuppressPresentationInAmbient:(BOOL)a3;
- (void)setSuppressesAlertsWhenAppIsActive:(BOOL)a3;
- (void)setSuppressesTitle:(BOOL)a3;
- (void)setTopic:(id)a3;
- (void)setUnlockActionLabel:(id)a3;
- (void)setVisuallyIndicatesWhenDateIsInFuture:(BOOL)a3;
@end

@implementation BBSectionSubtypeParameters

- (BBSectionSubtypeParameters)initWithFallbackParameters:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BBSectionSubtypeParameters;
  v5 = [(BBSectionSubtypeParameters *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BBSectionSubtypeParameters *)v5 setFallbackParameters:v4];
  }

  return v6;
}

- (NSString)hiddenPreviewsBodyPlaceholder
{
  hiddenPreviewsBodyPlaceholder = self->_hiddenPreviewsBodyPlaceholder;
  if (hiddenPreviewsBodyPlaceholder)
  {
    v3 = hiddenPreviewsBodyPlaceholder;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained hiddenPreviewsBodyPlaceholder];
  }
  return v3;
}

- (NSString)subtypeSummaryFormat
{
  subtypeSummaryFormat = self->_subtypeSummaryFormat;
  if (subtypeSummaryFormat)
  {
    v3 = subtypeSummaryFormat;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained subtypeSummaryFormat];
  }
  return v3;
}

- (NSString)topic
{
  topic = self->_topic;
  if (topic)
  {
    v3 = topic;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained topic];
  }
  return v3;
}

- (NSString)missedBannerDescriptionFormat
{
  missedBannerDescriptionFormat = self->_missedBannerDescriptionFormat;
  if (missedBannerDescriptionFormat)
  {
    v3 = missedBannerDescriptionFormat;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained missedBannerDescriptionFormat];
  }
  return v3;
}

- (NSString)fullUnlockActionLabel
{
  fullUnlockActionLabel = self->_fullUnlockActionLabel;
  if (fullUnlockActionLabel)
  {
    v3 = fullUnlockActionLabel;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained fullUnlockActionLabel];
  }
  return v3;
}

- (NSString)unlockActionLabel
{
  unlockActionLabel = self->_unlockActionLabel;
  if (unlockActionLabel)
  {
    v3 = unlockActionLabel;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained unlockActionLabel];
  }
  return v3;
}

- (NSString)fullAlternateActionLabel
{
  fullAlternateActionLabel = self->_fullAlternateActionLabel;
  if (fullAlternateActionLabel)
  {
    v3 = fullAlternateActionLabel;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained fullAlternateActionLabel];
  }
  return v3;
}

- (NSString)alternateActionLabel
{
  alternateActionLabel = self->_alternateActionLabel;
  if (alternateActionLabel)
  {
    v3 = alternateActionLabel;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained alternateActionLabel];
  }
  return v3;
}

- (BBSectionIcon)sectionIconOverride
{
  sectionIconOverride = self->_sectionIconOverride;
  if (sectionIconOverride)
  {
    v3 = sectionIconOverride;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained sectionIconOverride];
  }
  return v3;
}

- (void)setSectionIconOverride:(id)a3
{
  v5 = (BBSectionIcon *)a3;
  sectionIconOverride = self->_sectionIconOverride;
  p_sectionIconOverride = &self->_sectionIconOverride;
  if (sectionIconOverride != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_sectionIconOverride, a3);
    v5 = v8;
  }
}

- (NSString)bannerAccessoryRemoteViewControllerClassName
{
  bannerAccessoryRemoteViewControllerClassName = self->_bannerAccessoryRemoteViewControllerClassName;
  if (bannerAccessoryRemoteViewControllerClassName)
  {
    v3 = bannerAccessoryRemoteViewControllerClassName;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained bannerAccessoryRemoteViewControllerClassName];
  }
  return v3;
}

- (NSString)bannerAccessoryRemoteServiceBundleIdentifier
{
  bannerAccessoryRemoteServiceBundleIdentifier = self->_bannerAccessoryRemoteServiceBundleIdentifier;
  if (bannerAccessoryRemoteServiceBundleIdentifier)
  {
    v3 = bannerAccessoryRemoteServiceBundleIdentifier;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained bannerAccessoryRemoteServiceBundleIdentifier];
  }
  return v3;
}

- (NSString)secondaryContentRemoteViewControllerClassName
{
  secondaryContentRemoteViewControllerClassName = self->_secondaryContentRemoteViewControllerClassName;
  if (secondaryContentRemoteViewControllerClassName)
  {
    v3 = secondaryContentRemoteViewControllerClassName;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained secondaryContentRemoteViewControllerClassName];
  }
  return v3;
}

- (NSString)secondaryContentRemoteServiceBundleIdentifier
{
  secondaryContentRemoteServiceBundleIdentifier = self->_secondaryContentRemoteServiceBundleIdentifier;
  if (secondaryContentRemoteServiceBundleIdentifier)
  {
    v3 = secondaryContentRemoteServiceBundleIdentifier;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    v3 = [WeakRetained secondaryContentRemoteServiceBundleIdentifier];
  }
  return v3;
}

- (BOOL)suppressesAlertsWhenAppIsActive
{
  boxedSuppressesAlertsWhenAppIsActive = self->_boxedSuppressesAlertsWhenAppIsActive;
  if (boxedSuppressesAlertsWhenAppIsActive)
  {
    return [(NSNumber *)boxedSuppressesAlertsWhenAppIsActive BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained suppressesAlertsWhenAppIsActive];

    return v6;
  }
}

- (BOOL)coalescesWhenLocked
{
  boxedCoalescesWhenLocked = self->_boxedCoalescesWhenLocked;
  if (boxedCoalescesWhenLocked)
  {
    return [(NSNumber *)boxedCoalescesWhenLocked BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained coalescesWhenLocked];

    return v6;
  }
}

- (BOOL)inertWhenLocked
{
  boxedInertWhenLocked = self->_boxedInertWhenLocked;
  if (boxedInertWhenLocked)
  {
    return [(NSNumber *)boxedInertWhenLocked BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained inertWhenLocked];

    return v6;
  }
}

- (BOOL)preservesUnlockActionCase
{
  boxedPreservesUnlockActionCase = self->_boxedPreservesUnlockActionCase;
  if (boxedPreservesUnlockActionCase)
  {
    return [(NSNumber *)boxedPreservesUnlockActionCase BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained preservesUnlockActionCase];

    return v6;
  }
}

- (BOOL)visuallyIndicatesWhenDateIsInFuture
{
  boxedVisuallyIndicatesWhenDateIsInFuture = self->_boxedVisuallyIndicatesWhenDateIsInFuture;
  if (boxedVisuallyIndicatesWhenDateIsInFuture)
  {
    return [(NSNumber *)boxedVisuallyIndicatesWhenDateIsInFuture BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained visuallyIndicatesWhenDateIsInFuture];

    return v6;
  }
}

- (BOOL)canBeSilencedByMenuButtonPress
{
  boxedCanBeSilencedByMenuButtonPress = self->_boxedCanBeSilencedByMenuButtonPress;
  if (boxedCanBeSilencedByMenuButtonPress)
  {
    return [(NSNumber *)boxedCanBeSilencedByMenuButtonPress BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained canBeSilencedByMenuButtonPress];

    return v6;
  }
}

- (BOOL)preventLock
{
  boxedPreventLock = self->_boxedPreventLock;
  if (boxedPreventLock)
  {
    return [(NSNumber *)boxedPreventLock BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained preventLock];

    return v6;
  }
}

- (BOOL)ignoresQuietMode
{
  boxedIgnoresQuietMode = self->_boxedIgnoresQuietMode;
  if (boxedIgnoresQuietMode)
  {
    return [(NSNumber *)boxedIgnoresQuietMode BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained ignoresQuietMode];

    return v6;
  }
}

- (BOOL)suppressesTitle
{
  boxedSuppressesTitle = self->_boxedSuppressesTitle;
  if (boxedSuppressesTitle)
  {
    return [(NSNumber *)boxedSuppressesTitle BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained suppressesTitle];

    return v6;
  }
}

- (BOOL)showsUnreadIndicatorForNoticesFeed
{
  boxedShowsUnreadIndicatorForNoticesFeed = self->_boxedShowsUnreadIndicatorForNoticesFeed;
  if (boxedShowsUnreadIndicatorForNoticesFeed)
  {
    return [(NSNumber *)boxedShowsUnreadIndicatorForNoticesFeed BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained showsUnreadIndicatorForNoticesFeed];

    return v6;
  }
}

- (BOOL)showsContactPhoto
{
  boxedShowsContactPhoto = self->_boxedShowsContactPhoto;
  if (boxedShowsContactPhoto)
  {
    return [(NSNumber *)boxedShowsContactPhoto BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained showsContactPhoto];

    return v6;
  }
}

- (BOOL)playsSoundForModify
{
  boxedPlaysSoundForModify = self->_boxedPlaysSoundForModify;
  if (boxedPlaysSoundForModify)
  {
    return [(NSNumber *)boxedPlaysSoundForModify BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained playsSoundForModify];

    return v6;
  }
}

- (unint64_t)subtypePriority
{
  boxedSubtypePriority = self->_boxedSubtypePriority;
  if (boxedSubtypePriority)
  {
    return [(NSNumber *)boxedSubtypePriority unsignedIntegerValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    unint64_t v6 = [WeakRetained subtypePriority];

    return v6;
  }
}

- (int64_t)iPodOutAlertType
{
  boxedIPodOutAlertType = self->_boxedIPodOutAlertType;
  if (boxedIPodOutAlertType)
  {
    return [(NSNumber *)boxedIPodOutAlertType integerValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    int64_t v6 = [WeakRetained iPodOutAlertType];

    return v6;
  }
}

- (BOOL)allowsAutomaticRemovalFromLockScreen
{
  boxedAllowsAutomaticRemovalFromLockScreen = self->_boxedAllowsAutomaticRemovalFromLockScreen;
  if (boxedAllowsAutomaticRemovalFromLockScreen)
  {
    return [(NSNumber *)boxedAllowsAutomaticRemovalFromLockScreen BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained allowsAutomaticRemovalFromLockScreen];

    return v6;
  }
}

- (BOOL)allowsAddingToLockScreenWhenUnlocked
{
  boxedAllowsAddingToLockScreenWhenUnlocked = self->_boxedAllowsAddingToLockScreenWhenUnlocked;
  if (boxedAllowsAddingToLockScreenWhenUnlocked)
  {
    return [(NSNumber *)boxedAllowsAddingToLockScreenWhenUnlocked BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained allowsAddingToLockScreenWhenUnlocked];

    return v6;
  }
}

- (BOOL)prioritizeAtTopOfLockScreen
{
  boxedPrioritizeAtTopOfLockScreen = self->_boxedPrioritizeAtTopOfLockScreen;
  if (boxedPrioritizeAtTopOfLockScreen)
  {
    return [(NSNumber *)boxedPrioritizeAtTopOfLockScreen BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained prioritizeAtTopOfLockScreen];

    return v6;
  }
}

- (BOOL)preemptsPresentedAlert
{
  return 0;
}

- (BOOL)revealsAdditionalContentOnPresentation
{
  boxedRevealsAdditionalContentOnPresentation = self->_boxedRevealsAdditionalContentOnPresentation;
  if (boxedRevealsAdditionalContentOnPresentation)
  {
    return [(NSNumber *)boxedRevealsAdditionalContentOnPresentation BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained revealsAdditionalContentOnPresentation];

    return v6;
  }
}

- (unint64_t)privacySettings
{
  boxedPrivacySettings = self->_boxedPrivacySettings;
  if (boxedPrivacySettings)
  {
    return [(NSNumber *)boxedPrivacySettings unsignedIntegerValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    unint64_t v6 = [WeakRetained privacySettings];

    return v6;
  }
}

- (BOOL)shouldDismissBulletinWhenClosed
{
  boxedShouldDismissBulletinWhenClosed = self->_boxedShouldDismissBulletinWhenClosed;
  if (boxedShouldDismissBulletinWhenClosed)
  {
    return [(NSNumber *)boxedShouldDismissBulletinWhenClosed BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained shouldDismissBulletinWhenClosed];

    return v6;
  }
}

- (NSSet)alertSuppressionAppIDs
{
  return 0;
}

- (void)setAlertSuppressionAppIDs:(id)a3
{
  BOOL v4 = [a3 count] != 0;
  [(BBSectionSubtypeParameters *)self setSuppressesAlertsWhenAppIsActive:v4];
}

- (BOOL)allowsPersistentBannersInCarPlay
{
  boxedAllowsPersistentBannersInCarPlay = self->_boxedAllowsPersistentBannersInCarPlay;
  if (boxedAllowsPersistentBannersInCarPlay)
  {
    return [(NSNumber *)boxedAllowsPersistentBannersInCarPlay BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained allowsPersistentBannersInCarPlay];

    return v6;
  }
}

- (BOOL)allowsSupplementaryActionsInCarPlay
{
  boxedAllowsSupplementaryActionsInCarPlay = self->_boxedAllowsSupplementaryActionsInCarPlay;
  if (boxedAllowsSupplementaryActionsInCarPlay)
  {
    return [(NSNumber *)boxedAllowsSupplementaryActionsInCarPlay BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained allowsSupplementaryActionsInCarPlay];

    return v6;
  }
}

- (BOOL)playsMediaWhenRaised
{
  boxedPlaysMediaWhenRaised = self->_boxedPlaysMediaWhenRaised;
  if (boxedPlaysMediaWhenRaised)
  {
    return [(NSNumber *)boxedPlaysMediaWhenRaised BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained playsMediaWhenRaised];

    return v6;
  }
}

- (BOOL)suppressDelayForForwardedBulletins
{
  boxedSuppressDelayForForwardedBulletins = self->_boxedSuppressDelayForForwardedBulletins;
  if (boxedSuppressDelayForForwardedBulletins)
  {
    return [(NSNumber *)boxedSuppressDelayForForwardedBulletins BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained suppressDelayForForwardedBulletins];

    return v6;
  }
}

- (BOOL)hideDismissActionInCarPlay
{
  boxedHideDismissActionInCarPlay = self->_boxedHideDismissActionInCarPlay;
  if (boxedHideDismissActionInCarPlay)
  {
    return [(NSNumber *)boxedHideDismissActionInCarPlay BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained hideDismissActionInCarPlay];

    return v6;
  }
}

- (BOOL)suppressPresentationInAmbient
{
  boxedSuppressPresentationInAmbient = self->_boxedSuppressPresentationInAmbient;
  if (boxedSuppressPresentationInAmbient)
  {
    return [(NSNumber *)boxedSuppressPresentationInAmbient BOOLValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
    char v6 = [WeakRetained suppressPresentationInAmbient];

    return v6;
  }
}

- (void)setSuppressesAlertsWhenAppIsActive:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedSuppressesAlertsWhenAppIsActive:v4];
}

- (void)setCoalescesWhenLocked:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedCoalescesWhenLocked:v4];
}

- (void)setInertWhenLocked:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedInertWhenLocked:v4];
}

- (void)setPreservesUnlockActionCase:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedPreservesUnlockActionCase:v4];
}

- (void)setVisuallyIndicatesWhenDateIsInFuture:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedVisuallyIndicatesWhenDateIsInFuture:v4];
}

- (void)setCanBeSilencedByMenuButtonPress:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedCanBeSilencedByMenuButtonPress:v4];
}

- (void)setPreventLock:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedPreventLock:v4];
}

- (void)setIgnoresQuietMode:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedIgnoresQuietMode:v4];
}

- (void)setSuppressesTitle:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedSuppressesTitle:v4];
}

- (void)setShowsUnreadIndicatorForNoticesFeed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedShowsUnreadIndicatorForNoticesFeed:v4];
}

- (void)setShowsContactPhoto:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedShowsContactPhoto:v4];
}

- (void)setPlaysSoundForModify:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedPlaysSoundForModify:v4];
}

- (void)setSubtypePriority:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(BBSectionSubtypeParameters *)self setBoxedSubtypePriority:v4];
}

- (void)setIPodOutAlertType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(BBSectionSubtypeParameters *)self setBoxedIPodOutAlertType:v4];
}

- (void)setAllowsAutomaticRemovalFromLockScreen:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedAllowsAutomaticRemovalFromLockScreen:v4];
}

- (void)setAllowsAddingToLockScreenWhenUnlocked:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedAllowsAddingToLockScreenWhenUnlocked:v4];
}

- (void)setPrioritizeAtTopOfLockScreen:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedPrioritizeAtTopOfLockScreen:v4];
}

- (void)setRevealsAdditionalContentOnPresentation:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedRevealsAdditionalContentOnPresentation:v4];
}

- (void)setPrivacySettings:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(BBSectionSubtypeParameters *)self setBoxedPrivacySettings:v4];
}

- (void)setShouldDismissBulletinWhenClosed:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedShouldDismissBulletinWhenClosed:v4];
}

- (void)setAllowsPersistentBannersInCarPlay:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedAllowsPersistentBannersInCarPlay:v4];
}

- (void)setAllowsSupplementaryActionsInCarPlay:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedAllowsSupplementaryActionsInCarPlay:v4];
}

- (void)setPlaysMediaWhenRaised:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedPlaysMediaWhenRaised:v4];
}

- (void)setSuppressDelayForForwardedBulletins:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedSuppressDelayForForwardedBulletins:v4];
}

- (void)setHideDismissActionInCarPlay:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedHideDismissActionInCarPlay:v4];
}

- (void)setSuppressPresentationInAmbient:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(BBSectionSubtypeParameters *)self setBoxedSuppressPresentationInAmbient:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BBSectionSubtypeParameters *)a3;
  if (self == v4)
  {
    char v46 = 1;
    goto LABEL_120;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v46 = 0;
    goto LABEL_120;
  }
  v5 = v4;
  char v6 = [(BBSectionSubtypeParameters *)self hiddenPreviewsBodyPlaceholder];
  v7 = [(BBSectionSubtypeParameters *)v5 hiddenPreviewsBodyPlaceholder];
  id v153 = v7;
  id v154 = v6;
  int v152 = BSEqualObjects();
  if (v152)
  {
    uint64_t v8 = [(BBSectionSubtypeParameters *)self subtypeSummaryFormat];
    v136 = [(BBSectionSubtypeParameters *)v5 subtypeSummaryFormat];
    v137 = (void *)v8;
    if (BSEqualObjects())
    {
      uint64_t v9 = [(BBSectionSubtypeParameters *)self topic];
      [(BBSectionSubtypeParameters *)v5 topic];
      v134 = v135 = (void *)v9;
      if (BSEqualObjects())
      {
        uint64_t v10 = [(BBSectionSubtypeParameters *)self missedBannerDescriptionFormat];
        [(BBSectionSubtypeParameters *)v5 missedBannerDescriptionFormat];
        v132 = v133 = (void *)v10;
        if (BSEqualObjects())
        {
          uint64_t v11 = [(BBSectionSubtypeParameters *)self fullUnlockActionLabel];
          [(BBSectionSubtypeParameters *)v5 fullUnlockActionLabel];
          v130 = v131 = (void *)v11;
          if (BSEqualObjects())
          {
            uint64_t v12 = [(BBSectionSubtypeParameters *)self unlockActionLabel];
            [(BBSectionSubtypeParameters *)v5 unlockActionLabel];
            v128 = v129 = (void *)v12;
            if (BSEqualObjects())
            {
              uint64_t v13 = [(BBSectionSubtypeParameters *)self fullAlternateActionLabel];
              [(BBSectionSubtypeParameters *)v5 fullAlternateActionLabel];
              v126 = v127 = (void *)v13;
              if (BSEqualObjects())
              {
                uint64_t v14 = [(BBSectionSubtypeParameters *)self alternateActionLabel];
                v124 = [(BBSectionSubtypeParameters *)v5 alternateActionLabel];
                v125 = (void *)v14;
                if (BSEqualObjects())
                {
                  uint64_t v15 = [(BBSectionSubtypeParameters *)self boxedSuppressesAlertsWhenAppIsActive];
                  v122 = [(BBSectionSubtypeParameters *)v5 boxedSuppressesAlertsWhenAppIsActive];
                  v123 = (void *)v15;
                  if (BSEqualObjects())
                  {
                    uint64_t v16 = [(BBSectionSubtypeParameters *)self sectionIconOverride];
                    v120 = [(BBSectionSubtypeParameters *)v5 sectionIconOverride];
                    v121 = (void *)v16;
                    if (BSEqualObjects())
                    {
                      uint64_t v17 = [(BBSectionSubtypeParameters *)self boxedCoalescesWhenLocked];
                      v118 = [(BBSectionSubtypeParameters *)v5 boxedCoalescesWhenLocked];
                      v119 = (void *)v17;
                      if (BSEqualObjects())
                      {
                        uint64_t v18 = [(BBSectionSubtypeParameters *)self boxedInertWhenLocked];
                        v116 = [(BBSectionSubtypeParameters *)v5 boxedInertWhenLocked];
                        v117 = (void *)v18;
                        if (BSEqualObjects())
                        {
                          uint64_t v19 = [(BBSectionSubtypeParameters *)self boxedPreservesUnlockActionCase];
                          v62 = v5;
                          v114 = [(BBSectionSubtypeParameters *)v5 boxedPreservesUnlockActionCase];
                          v115 = (void *)v19;
                          if (BSEqualObjects())
                          {
                            uint64_t v20 = [(BBSectionSubtypeParameters *)self boxedVisuallyIndicatesWhenDateIsInFuture];
                            v112 = [(BBSectionSubtypeParameters *)v5 boxedVisuallyIndicatesWhenDateIsInFuture];
                            v113 = (void *)v20;
                            if (BSEqualObjects())
                            {
                              uint64_t v21 = [(BBSectionSubtypeParameters *)self boxedCanBeSilencedByMenuButtonPress];
                              v110 = [(BBSectionSubtypeParameters *)v5 boxedCanBeSilencedByMenuButtonPress];
                              v111 = (void *)v21;
                              if (BSEqualObjects())
                              {
                                uint64_t v22 = [(BBSectionSubtypeParameters *)self boxedPreventLock];
                                v108 = [(BBSectionSubtypeParameters *)v5 boxedPreventLock];
                                v109 = (void *)v22;
                                if (BSEqualObjects())
                                {
                                  uint64_t v23 = [(BBSectionSubtypeParameters *)self boxedIgnoresQuietMode];
                                  v106 = [(BBSectionSubtypeParameters *)v5 boxedIgnoresQuietMode];
                                  v107 = (void *)v23;
                                  if (BSEqualObjects())
                                  {
                                    uint64_t v24 = [(BBSectionSubtypeParameters *)self boxedSuppressesTitle];
                                    v104 = [(BBSectionSubtypeParameters *)v5 boxedSuppressesTitle];
                                    v105 = (void *)v24;
                                    if (BSEqualObjects())
                                    {
                                      uint64_t v25 = [(BBSectionSubtypeParameters *)self boxedShowsUnreadIndicatorForNoticesFeed];
                                      v102 = [(BBSectionSubtypeParameters *)v5 boxedShowsUnreadIndicatorForNoticesFeed];
                                      v103 = (void *)v25;
                                      if (BSEqualObjects())
                                      {
                                        uint64_t v26 = [(BBSectionSubtypeParameters *)self boxedShowsContactPhoto];
                                        v100 = [(BBSectionSubtypeParameters *)v5 boxedShowsContactPhoto];
                                        v101 = (void *)v26;
                                        if (BSEqualObjects())
                                        {
                                          uint64_t v27 = [(BBSectionSubtypeParameters *)self boxedPlaysSoundForModify];
                                          v98 = [(BBSectionSubtypeParameters *)v5 boxedPlaysSoundForModify];
                                          v99 = (void *)v27;
                                          if (BSEqualObjects())
                                          {
                                            uint64_t v28 = [(BBSectionSubtypeParameters *)self boxedSubtypePriority];
                                            v96 = [(BBSectionSubtypeParameters *)v62 boxedSubtypePriority];
                                            v97 = (void *)v28;
                                            if (BSEqualObjects())
                                            {
                                              uint64_t v29 = [(BBSectionSubtypeParameters *)self boxedIPodOutAlertType];
                                              v94 = [(BBSectionSubtypeParameters *)v62 boxedIPodOutAlertType];
                                              v95 = (void *)v29;
                                              if (BSEqualObjects())
                                              {
                                                uint64_t v30 = [(BBSectionSubtypeParameters *)self boxedAllowsAutomaticRemovalFromLockScreen];
                                                v92 = [(BBSectionSubtypeParameters *)v62 boxedAllowsAutomaticRemovalFromLockScreen];
                                                v93 = (void *)v30;
                                                if (BSEqualObjects())
                                                {
                                                  uint64_t v31 = [(BBSectionSubtypeParameters *)self boxedAllowsAddingToLockScreenWhenUnlocked];
                                                  v90 = [(BBSectionSubtypeParameters *)v62 boxedAllowsAddingToLockScreenWhenUnlocked];
                                                  v91 = (void *)v31;
                                                  if (BSEqualObjects())
                                                  {
                                                    uint64_t v32 = [(BBSectionSubtypeParameters *)self boxedPrioritizeAtTopOfLockScreen];
                                                    v88 = [(BBSectionSubtypeParameters *)v62 boxedPrioritizeAtTopOfLockScreen];
                                                    v89 = (void *)v32;
                                                    if (BSEqualObjects())
                                                    {
                                                      uint64_t v33 = [(BBSectionSubtypeParameters *)self boxedRevealsAdditionalContentOnPresentation];
                                                      v86 = [(BBSectionSubtypeParameters *)v62 boxedRevealsAdditionalContentOnPresentation];
                                                      v87 = (void *)v33;
                                                      if (BSEqualObjects())
                                                      {
                                                        uint64_t v34 = [(BBSectionSubtypeParameters *)self boxedPrivacySettings];
                                                        v84 = [(BBSectionSubtypeParameters *)v62 boxedPrivacySettings];
                                                        v85 = (void *)v34;
                                                        if (BSEqualObjects())
                                                        {
                                                          uint64_t v35 = [(BBSectionSubtypeParameters *)self boxedShouldDismissBulletinWhenClosed];
                                                          v82 = [(BBSectionSubtypeParameters *)v62 boxedShouldDismissBulletinWhenClosed];
                                                          v83 = (void *)v35;
                                                          if (BSEqualObjects())
                                                          {
                                                            uint64_t v36 = [(BBSectionSubtypeParameters *)self boxedAllowsPersistentBannersInCarPlay];
                                                            v80 = [(BBSectionSubtypeParameters *)v62 boxedAllowsPersistentBannersInCarPlay];
                                                            v81 = (void *)v36;
                                                            if (BSEqualObjects())
                                                            {
                                                              uint64_t v37 = [(BBSectionSubtypeParameters *)self boxedAllowsSupplementaryActionsInCarPlay];
                                                              v78 = [(BBSectionSubtypeParameters *)v62 boxedAllowsSupplementaryActionsInCarPlay];
                                                              v79 = (void *)v37;
                                                              if (BSEqualObjects())
                                                              {
                                                                uint64_t v38 = [(BBSectionSubtypeParameters *)self boxedPlaysMediaWhenRaised];
                                                                v76 = [(BBSectionSubtypeParameters *)v62 boxedPlaysMediaWhenRaised];
                                                                v77 = (void *)v38;
                                                                if (BSEqualObjects())
                                                                {
                                                                  uint64_t v39 = [(BBSectionSubtypeParameters *)self boxedSuppressDelayForForwardedBulletins];
                                                                  v74 = [(BBSectionSubtypeParameters *)v62 boxedSuppressDelayForForwardedBulletins];
                                                                  v75 = (void *)v39;
                                                                  if (BSEqualObjects())
                                                                  {
                                                                    uint64_t v40 = [(BBSectionSubtypeParameters *)self boxedHideDismissActionInCarPlay];
                                                                    v72 = [(BBSectionSubtypeParameters *)v62 boxedHideDismissActionInCarPlay];
                                                                    v73 = (void *)v40;
                                                                    if (BSEqualObjects())
                                                                    {
                                                                      uint64_t v41 = [(BBSectionSubtypeParameters *)self bannerAccessoryRemoteViewControllerClassName];
                                                                      v70 = [(BBSectionSubtypeParameters *)v62 bannerAccessoryRemoteViewControllerClassName];
                                                                      v71 = (void *)v41;
                                                                      if (BSEqualObjects())
                                                                      {
                                                                        uint64_t v42 = [(BBSectionSubtypeParameters *)self bannerAccessoryRemoteServiceBundleIdentifier];
                                                                        v68 = [(BBSectionSubtypeParameters *)v62 bannerAccessoryRemoteServiceBundleIdentifier];
                                                                        v69 = (void *)v42;
                                                                        if (BSEqualObjects())
                                                                        {
                                                                          uint64_t v43 = [(BBSectionSubtypeParameters *)self secondaryContentRemoteViewControllerClassName];
                                                                          v66 = [(BBSectionSubtypeParameters *)v62 secondaryContentRemoteViewControllerClassName];
                                                                          v67 = (void *)v43;
                                                                          if (BSEqualObjects())
                                                                          {
                                                                            uint64_t v44 = [(BBSectionSubtypeParameters *)self secondaryContentRemoteServiceBundleIdentifier];
                                                                            v64 = [(BBSectionSubtypeParameters *)v62 secondaryContentRemoteServiceBundleIdentifier];
                                                                            v65 = (void *)v44;
                                                                            if (BSEqualObjects())
                                                                            {
                                                                              uint64_t v45 = [(BBSectionSubtypeParameters *)self boxedSuppressPresentationInAmbient];
                                                                              v5 = v62;
                                                                              v7 = [(BBSectionSubtypeParameters *)v62 boxedSuppressPresentationInAmbient];
                                                                              v63 = (void *)v45;
                                                                              char v46 = BSEqualObjects();
                                                                              int v47 = 1;
                                                                              *(void *)&v151[20] = 0x100000001;
                                                                              *(_DWORD *)&v151[16] = 1;
                                                                              *(void *)&v151[8] = 0x100000001;
                                                                              int v48 = 1;
                                                                              int v49 = 1;
                                                                              *(void *)v151 = 0x100000001;
                                                                              int v149 = 1;
                                                                              uint64_t v147 = 0x100000001;
                                                                              uint64_t v146 = 0x100000001;
                                                                              uint64_t v145 = 0x100000001;
                                                                              uint64_t v144 = 0x100000001;
                                                                              uint64_t v143 = 0x100000001;
                                                                              uint64_t v142 = 0x100000001;
                                                                              uint64_t v141 = 0x100000001;
                                                                              uint64_t v140 = 0x100000001;
                                                                              uint64_t v139 = 0x100000001;
                                                                              uint64_t v138 = 0x100000001;
                                                                              int v148 = 1;
                                                                              int v150 = 1;
                                                                              int v50 = 1;
                                                                              int v51 = 1;
                                                                              int v52 = 1;
                                                                              int v53 = 1;
                                                                              goto LABEL_47;
                                                                            }
                                                                            int v47 = 0;
                                                                            char v46 = 0;
                                                                            *(void *)&v151[20] = 0x100000001;
                                                                            *(void *)&v151[12] = 0x100000001;
                                                                            *(_DWORD *)&v151[8] = 1;
                                                                            int v48 = 1;
                                                                            int v49 = 1;
                                                                            *(void *)v151 = 0x100000001;
                                                                            int v149 = 1;
                                                                            uint64_t v147 = 0x100000001;
                                                                            uint64_t v146 = 0x100000001;
                                                                            uint64_t v145 = 0x100000001;
                                                                            uint64_t v144 = 0x100000001;
                                                                            uint64_t v143 = 0x100000001;
                                                                            uint64_t v142 = 0x100000001;
                                                                            uint64_t v141 = 0x100000001;
                                                                            uint64_t v140 = 0x100000001;
                                                                            uint64_t v139 = 0x100000001;
                                                                            uint64_t v138 = 0x100000001;
                                                                            int v148 = 1;
                                                                            int v150 = 1;
                                                                            int v50 = 1;
                                                                            int v51 = 1;
                                                                            int v52 = 1;
                                                                            int v53 = 1;
                                                                          }
                                                                          else
                                                                          {
                                                                            int v53 = 0;
                                                                            int v47 = 0;
                                                                            char v46 = 0;
                                                                            *(void *)&v151[20] = 0x100000001;
                                                                            *(void *)&v151[12] = 0x100000001;
                                                                            *(_DWORD *)&v151[8] = 1;
                                                                            int v48 = 1;
                                                                            int v49 = 1;
                                                                            *(void *)v151 = 0x100000001;
                                                                            int v149 = 1;
                                                                            uint64_t v147 = 0x100000001;
                                                                            uint64_t v146 = 0x100000001;
                                                                            uint64_t v145 = 0x100000001;
                                                                            uint64_t v144 = 0x100000001;
                                                                            uint64_t v143 = 0x100000001;
                                                                            uint64_t v142 = 0x100000001;
                                                                            uint64_t v141 = 0x100000001;
                                                                            uint64_t v140 = 0x100000001;
                                                                            uint64_t v139 = 0x100000001;
                                                                            uint64_t v138 = 0x100000001;
                                                                            int v148 = 1;
                                                                            int v150 = 1;
                                                                            int v50 = 1;
                                                                            int v51 = 1;
                                                                            int v52 = 1;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          int v52 = 0;
                                                                          int v53 = 0;
                                                                          int v47 = 0;
                                                                          char v46 = 0;
                                                                          *(void *)&v151[20] = 0x100000001;
                                                                          *(void *)&v151[12] = 0x100000001;
                                                                          *(_DWORD *)&v151[8] = 1;
                                                                          int v48 = 1;
                                                                          int v49 = 1;
                                                                          *(void *)v151 = 0x100000001;
                                                                          int v149 = 1;
                                                                          uint64_t v147 = 0x100000001;
                                                                          uint64_t v146 = 0x100000001;
                                                                          uint64_t v145 = 0x100000001;
                                                                          uint64_t v144 = 0x100000001;
                                                                          uint64_t v143 = 0x100000001;
                                                                          uint64_t v142 = 0x100000001;
                                                                          uint64_t v141 = 0x100000001;
                                                                          uint64_t v140 = 0x100000001;
                                                                          uint64_t v139 = 0x100000001;
                                                                          uint64_t v138 = 0x100000001;
                                                                          int v148 = 1;
                                                                          int v150 = 1;
                                                                          int v50 = 1;
                                                                          int v51 = 1;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        int v51 = 0;
                                                                        int v52 = 0;
                                                                        int v53 = 0;
                                                                        int v47 = 0;
                                                                        char v46 = 0;
                                                                        *(void *)&v151[20] = 0x100000001;
                                                                        *(void *)&v151[12] = 0x100000001;
                                                                        *(_DWORD *)&v151[8] = 1;
                                                                        int v48 = 1;
                                                                        int v49 = 1;
                                                                        *(void *)v151 = 0x100000001;
                                                                        int v149 = 1;
                                                                        uint64_t v147 = 0x100000001;
                                                                        uint64_t v146 = 0x100000001;
                                                                        uint64_t v145 = 0x100000001;
                                                                        uint64_t v144 = 0x100000001;
                                                                        uint64_t v143 = 0x100000001;
                                                                        uint64_t v142 = 0x100000001;
                                                                        uint64_t v141 = 0x100000001;
                                                                        uint64_t v140 = 0x100000001;
                                                                        uint64_t v139 = 0x100000001;
                                                                        uint64_t v138 = 0x100000001;
                                                                        int v148 = 1;
                                                                        int v150 = 1;
                                                                        int v50 = 1;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      int v50 = 0;
                                                                      int v51 = 0;
                                                                      int v52 = 0;
                                                                      int v53 = 0;
                                                                      int v47 = 0;
                                                                      char v46 = 0;
                                                                      *(void *)&v151[20] = 0x100000001;
                                                                      *(void *)&v151[12] = 0x100000001;
                                                                      *(_DWORD *)&v151[8] = 1;
                                                                      int v48 = 1;
                                                                      int v49 = 1;
                                                                      *(void *)v151 = 0x100000001;
                                                                      int v149 = 1;
                                                                      uint64_t v147 = 0x100000001;
                                                                      uint64_t v146 = 0x100000001;
                                                                      uint64_t v145 = 0x100000001;
                                                                      uint64_t v144 = 0x100000001;
                                                                      uint64_t v143 = 0x100000001;
                                                                      uint64_t v142 = 0x100000001;
                                                                      uint64_t v141 = 0x100000001;
                                                                      uint64_t v140 = 0x100000001;
                                                                      uint64_t v139 = 0x100000001;
                                                                      uint64_t v138 = 0x100000001;
                                                                      int v148 = 1;
                                                                      int v150 = 1;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    int v50 = 0;
                                                                    int v51 = 0;
                                                                    int v52 = 0;
                                                                    int v53 = 0;
                                                                    int v47 = 0;
                                                                    char v46 = 0;
                                                                    *(void *)&v151[20] = 0x100000001;
                                                                    *(void *)&v151[12] = 0x100000001;
                                                                    *(_DWORD *)&v151[8] = 1;
                                                                    int v48 = 1;
                                                                    int v49 = 1;
                                                                    int v150 = 0;
                                                                    *(void *)v151 = 0x100000001;
                                                                    int v149 = 1;
                                                                    uint64_t v147 = 0x100000001;
                                                                    uint64_t v146 = 0x100000001;
                                                                    uint64_t v145 = 0x100000001;
                                                                    uint64_t v144 = 0x100000001;
                                                                    uint64_t v143 = 0x100000001;
                                                                    uint64_t v142 = 0x100000001;
                                                                    uint64_t v141 = 0x100000001;
                                                                    uint64_t v140 = 0x100000001;
                                                                    uint64_t v139 = 0x100000001;
                                                                    uint64_t v138 = 0x100000001;
                                                                    int v148 = 1;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  int v50 = 0;
                                                                  int v51 = 0;
                                                                  int v52 = 0;
                                                                  int v53 = 0;
                                                                  int v47 = 0;
                                                                  char v46 = 0;
                                                                  *(void *)&v151[20] = 0x100000001;
                                                                  *(void *)&v151[12] = 0x100000001;
                                                                  *(_DWORD *)&v151[8] = 1;
                                                                  int v48 = 1;
                                                                  int v49 = 1;
                                                                  int v150 = 0;
                                                                  *(void *)v151 = 0x100000001;
                                                                  int v148 = 0;
                                                                  int v149 = 1;
                                                                  uint64_t v146 = 0x100000001;
                                                                  uint64_t v145 = 0x100000001;
                                                                  uint64_t v144 = 0x100000001;
                                                                  uint64_t v143 = 0x100000001;
                                                                  uint64_t v142 = 0x100000001;
                                                                  uint64_t v141 = 0x100000001;
                                                                  uint64_t v140 = 0x100000001;
                                                                  uint64_t v139 = 0x100000001;
                                                                  uint64_t v138 = 0x100000001;
                                                                  uint64_t v147 = 0x100000001;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                int v50 = 0;
                                                                int v51 = 0;
                                                                int v52 = 0;
                                                                int v53 = 0;
                                                                int v47 = 0;
                                                                char v46 = 0;
                                                                *(void *)&v151[20] = 0x100000001;
                                                                *(void *)&v151[12] = 0x100000001;
                                                                *(_DWORD *)&v151[8] = 1;
                                                                int v48 = 1;
                                                                int v49 = 1;
                                                                int v150 = 0;
                                                                *(void *)v151 = 0x100000001;
                                                                int v148 = 0;
                                                                int v149 = 1;
                                                                uint64_t v147 = 0x100000000;
                                                                uint64_t v145 = 0x100000001;
                                                                uint64_t v144 = 0x100000001;
                                                                uint64_t v143 = 0x100000001;
                                                                uint64_t v142 = 0x100000001;
                                                                uint64_t v141 = 0x100000001;
                                                                uint64_t v140 = 0x100000001;
                                                                uint64_t v139 = 0x100000001;
                                                                uint64_t v138 = 0x100000001;
                                                                uint64_t v146 = 0x100000001;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              uint64_t v146 = 0x100000000;
                                                              int v50 = 0;
                                                              int v51 = 0;
                                                              int v52 = 0;
                                                              int v53 = 0;
                                                              int v47 = 0;
                                                              char v46 = 0;
                                                              *(void *)&v151[20] = 0x100000001;
                                                              *(void *)&v151[12] = 0x100000001;
                                                              *(_DWORD *)&v151[8] = 1;
                                                              int v48 = 1;
                                                              int v49 = 1;
                                                              int v150 = 0;
                                                              *(void *)v151 = 0x100000001;
                                                              int v148 = 0;
                                                              int v149 = 1;
                                                              uint64_t v147 = 0x100000000;
                                                              uint64_t v144 = 0x100000001;
                                                              uint64_t v143 = 0x100000001;
                                                              uint64_t v142 = 0x100000001;
                                                              uint64_t v141 = 0x100000001;
                                                              uint64_t v140 = 0x100000001;
                                                              uint64_t v139 = 0x100000001;
                                                              uint64_t v138 = 0x100000001;
                                                              uint64_t v145 = 0x100000001;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            uint64_t v145 = 0x100000000;
                                                            uint64_t v146 = 0x100000000;
                                                            int v50 = 0;
                                                            int v51 = 0;
                                                            int v52 = 0;
                                                            int v53 = 0;
                                                            int v47 = 0;
                                                            char v46 = 0;
                                                            *(void *)&v151[20] = 0x100000001;
                                                            *(void *)&v151[12] = 0x100000001;
                                                            *(_DWORD *)&v151[8] = 1;
                                                            int v48 = 1;
                                                            int v49 = 1;
                                                            int v150 = 0;
                                                            *(void *)v151 = 0x100000001;
                                                            int v148 = 0;
                                                            int v149 = 1;
                                                            uint64_t v147 = 0x100000000;
                                                            uint64_t v143 = 0x100000001;
                                                            uint64_t v142 = 0x100000001;
                                                            uint64_t v141 = 0x100000001;
                                                            uint64_t v140 = 0x100000001;
                                                            uint64_t v139 = 0x100000001;
                                                            uint64_t v138 = 0x100000001;
                                                            uint64_t v144 = 0x100000001;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          uint64_t v144 = 0x100000000;
                                                          uint64_t v145 = 0x100000000;
                                                          uint64_t v146 = 0x100000000;
                                                          int v50 = 0;
                                                          int v51 = 0;
                                                          int v52 = 0;
                                                          int v53 = 0;
                                                          int v47 = 0;
                                                          char v46 = 0;
                                                          *(void *)&v151[20] = 0x100000001;
                                                          *(void *)&v151[12] = 0x100000001;
                                                          *(_DWORD *)&v151[8] = 1;
                                                          int v48 = 1;
                                                          int v49 = 1;
                                                          int v150 = 0;
                                                          *(void *)v151 = 0x100000001;
                                                          int v148 = 0;
                                                          int v149 = 1;
                                                          uint64_t v147 = 0x100000000;
                                                          uint64_t v142 = 0x100000001;
                                                          uint64_t v141 = 0x100000001;
                                                          uint64_t v140 = 0x100000001;
                                                          uint64_t v139 = 0x100000001;
                                                          uint64_t v138 = 0x100000001;
                                                          uint64_t v143 = 0x100000001;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t v143 = 0x100000000;
                                                        uint64_t v144 = 0x100000000;
                                                        uint64_t v145 = 0x100000000;
                                                        uint64_t v146 = 0x100000000;
                                                        int v50 = 0;
                                                        int v51 = 0;
                                                        int v52 = 0;
                                                        int v53 = 0;
                                                        int v47 = 0;
                                                        char v46 = 0;
                                                        *(void *)&v151[20] = 0x100000001;
                                                        *(void *)&v151[12] = 0x100000001;
                                                        *(_DWORD *)&v151[8] = 1;
                                                        int v48 = 1;
                                                        int v49 = 1;
                                                        int v150 = 0;
                                                        *(void *)v151 = 0x100000001;
                                                        int v148 = 0;
                                                        int v149 = 1;
                                                        uint64_t v147 = 0x100000000;
                                                        uint64_t v141 = 0x100000001;
                                                        uint64_t v140 = 0x100000001;
                                                        uint64_t v139 = 0x100000001;
                                                        uint64_t v138 = 0x100000001;
                                                        uint64_t v142 = 0x100000001;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t v142 = 0x100000000;
                                                      uint64_t v143 = 0x100000000;
                                                      uint64_t v144 = 0x100000000;
                                                      uint64_t v145 = 0x100000000;
                                                      uint64_t v146 = 0x100000000;
                                                      int v50 = 0;
                                                      int v51 = 0;
                                                      int v52 = 0;
                                                      int v53 = 0;
                                                      int v47 = 0;
                                                      char v46 = 0;
                                                      *(void *)&v151[20] = 0x100000001;
                                                      *(void *)&v151[12] = 0x100000001;
                                                      *(_DWORD *)&v151[8] = 1;
                                                      int v48 = 1;
                                                      int v49 = 1;
                                                      int v150 = 0;
                                                      *(void *)v151 = 0x100000001;
                                                      int v148 = 0;
                                                      int v149 = 1;
                                                      uint64_t v147 = 0x100000000;
                                                      uint64_t v140 = 0x100000001;
                                                      uint64_t v139 = 0x100000001;
                                                      uint64_t v138 = 0x100000001;
                                                      uint64_t v141 = 0x100000001;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v141 = 0x100000000;
                                                    uint64_t v142 = 0x100000000;
                                                    uint64_t v143 = 0x100000000;
                                                    uint64_t v144 = 0x100000000;
                                                    uint64_t v145 = 0x100000000;
                                                    uint64_t v146 = 0x100000000;
                                                    int v50 = 0;
                                                    int v51 = 0;
                                                    int v52 = 0;
                                                    int v53 = 0;
                                                    int v47 = 0;
                                                    char v46 = 0;
                                                    *(void *)&v151[20] = 0x100000001;
                                                    *(void *)&v151[12] = 0x100000001;
                                                    *(_DWORD *)&v151[8] = 1;
                                                    int v48 = 1;
                                                    int v49 = 1;
                                                    int v150 = 0;
                                                    *(void *)v151 = 0x100000001;
                                                    int v148 = 0;
                                                    int v149 = 1;
                                                    uint64_t v147 = 0x100000000;
                                                    uint64_t v139 = 0x100000001;
                                                    uint64_t v138 = 0x100000001;
                                                    uint64_t v140 = 0x100000001;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t v140 = 0x100000000;
                                                  uint64_t v141 = 0x100000000;
                                                  uint64_t v142 = 0x100000000;
                                                  uint64_t v143 = 0x100000000;
                                                  uint64_t v144 = 0x100000000;
                                                  uint64_t v145 = 0x100000000;
                                                  uint64_t v146 = 0x100000000;
                                                  int v50 = 0;
                                                  int v51 = 0;
                                                  int v52 = 0;
                                                  int v53 = 0;
                                                  int v47 = 0;
                                                  char v46 = 0;
                                                  *(void *)&v151[20] = 0x100000001;
                                                  *(void *)&v151[12] = 0x100000001;
                                                  *(_DWORD *)&v151[8] = 1;
                                                  int v48 = 1;
                                                  int v49 = 1;
                                                  int v150 = 0;
                                                  *(void *)v151 = 0x100000001;
                                                  int v148 = 0;
                                                  int v149 = 1;
                                                  uint64_t v147 = 0x100000000;
                                                  uint64_t v138 = 0x100000001;
                                                  uint64_t v139 = 0x100000001;
                                                }
                                              }
                                              else
                                              {
                                                uint64_t v139 = 0x100000000;
                                                uint64_t v140 = 0x100000000;
                                                uint64_t v141 = 0x100000000;
                                                uint64_t v142 = 0x100000000;
                                                uint64_t v143 = 0x100000000;
                                                uint64_t v144 = 0x100000000;
                                                uint64_t v145 = 0x100000000;
                                                uint64_t v146 = 0x100000000;
                                                int v50 = 0;
                                                int v51 = 0;
                                                int v52 = 0;
                                                int v53 = 0;
                                                int v47 = 0;
                                                char v46 = 0;
                                                *(void *)&v151[20] = 0x100000001;
                                                *(void *)&v151[12] = 0x100000001;
                                                *(_DWORD *)&v151[8] = 1;
                                                int v48 = 1;
                                                int v49 = 1;
                                                int v150 = 0;
                                                *(void *)v151 = 0x100000001;
                                                int v148 = 0;
                                                int v149 = 1;
                                                uint64_t v147 = 0x100000000;
                                                uint64_t v138 = 0x100000001;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t v138 = 0x100000000;
                                              uint64_t v139 = 0x100000000;
                                              uint64_t v140 = 0x100000000;
                                              uint64_t v141 = 0x100000000;
                                              uint64_t v142 = 0x100000000;
                                              uint64_t v143 = 0x100000000;
                                              uint64_t v144 = 0x100000000;
                                              uint64_t v145 = 0x100000000;
                                              uint64_t v146 = 0x100000000;
                                              int v50 = 0;
                                              int v51 = 0;
                                              int v52 = 0;
                                              int v53 = 0;
                                              int v47 = 0;
                                              char v46 = 0;
                                              *(void *)&v151[20] = 0x100000001;
                                              *(void *)&v151[12] = 0x100000001;
                                              *(_DWORD *)&v151[8] = 1;
                                              int v48 = 1;
                                              int v49 = 1;
                                              int v150 = 0;
                                              *(void *)v151 = 0x100000001;
                                              int v148 = 0;
                                              int v149 = 1;
                                              uint64_t v147 = 0x100000000;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v138 = 0;
                                            uint64_t v139 = 0x100000000;
                                            uint64_t v140 = 0x100000000;
                                            uint64_t v141 = 0x100000000;
                                            uint64_t v142 = 0x100000000;
                                            uint64_t v143 = 0x100000000;
                                            uint64_t v144 = 0x100000000;
                                            uint64_t v145 = 0x100000000;
                                            uint64_t v146 = 0x100000000;
                                            int v50 = 0;
                                            int v51 = 0;
                                            int v52 = 0;
                                            int v53 = 0;
                                            int v47 = 0;
                                            char v46 = 0;
                                            *(void *)&v151[20] = 0x100000001;
                                            *(void *)&v151[12] = 0x100000001;
                                            *(_DWORD *)&v151[8] = 1;
                                            int v48 = 1;
                                            int v49 = 1;
                                            int v150 = 0;
                                            *(void *)v151 = 0x100000001;
                                            int v148 = 0;
                                            int v149 = 1;
                                            uint64_t v147 = 0x100000000;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t v139 = 0;
                                          uint64_t v138 = 0;
                                          uint64_t v140 = 0x100000000;
                                          uint64_t v141 = 0x100000000;
                                          uint64_t v142 = 0x100000000;
                                          uint64_t v143 = 0x100000000;
                                          uint64_t v144 = 0x100000000;
                                          uint64_t v145 = 0x100000000;
                                          uint64_t v146 = 0x100000000;
                                          int v50 = 0;
                                          int v51 = 0;
                                          int v52 = 0;
                                          int v53 = 0;
                                          int v47 = 0;
                                          char v46 = 0;
                                          *(void *)&v151[20] = 0x100000001;
                                          *(void *)&v151[12] = 0x100000001;
                                          *(_DWORD *)&v151[8] = 1;
                                          int v48 = 1;
                                          int v49 = 1;
                                          int v150 = 0;
                                          *(void *)v151 = 0x100000001;
                                          int v148 = 0;
                                          int v149 = 1;
                                          uint64_t v147 = 0x100000000;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v140 = 0;
                                        uint64_t v139 = 0;
                                        uint64_t v138 = 0;
                                        uint64_t v141 = 0x100000000;
                                        uint64_t v142 = 0x100000000;
                                        uint64_t v143 = 0x100000000;
                                        uint64_t v144 = 0x100000000;
                                        uint64_t v145 = 0x100000000;
                                        uint64_t v146 = 0x100000000;
                                        int v50 = 0;
                                        int v51 = 0;
                                        int v52 = 0;
                                        int v53 = 0;
                                        int v47 = 0;
                                        char v46 = 0;
                                        *(void *)&v151[20] = 0x100000001;
                                        *(void *)&v151[12] = 0x100000001;
                                        *(_DWORD *)&v151[8] = 1;
                                        int v48 = 1;
                                        int v49 = 1;
                                        int v150 = 0;
                                        *(void *)v151 = 0x100000001;
                                        int v148 = 0;
                                        int v149 = 1;
                                        uint64_t v147 = 0x100000000;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v141 = 0;
                                      uint64_t v140 = 0;
                                      uint64_t v139 = 0;
                                      uint64_t v138 = 0;
                                      uint64_t v142 = 0x100000000;
                                      uint64_t v143 = 0x100000000;
                                      uint64_t v144 = 0x100000000;
                                      uint64_t v145 = 0x100000000;
                                      uint64_t v146 = 0x100000000;
                                      int v50 = 0;
                                      int v51 = 0;
                                      int v52 = 0;
                                      int v53 = 0;
                                      int v47 = 0;
                                      char v46 = 0;
                                      *(void *)&v151[20] = 0x100000001;
                                      *(void *)&v151[12] = 0x100000001;
                                      *(_DWORD *)&v151[8] = 1;
                                      int v48 = 1;
                                      int v49 = 1;
                                      int v150 = 0;
                                      *(void *)v151 = 0x100000001;
                                      int v148 = 0;
                                      int v149 = 1;
                                      uint64_t v147 = 0x100000000;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v142 = 0;
                                    uint64_t v141 = 0;
                                    uint64_t v140 = 0;
                                    uint64_t v139 = 0;
                                    uint64_t v138 = 0;
                                    uint64_t v143 = 0x100000000;
                                    uint64_t v144 = 0x100000000;
                                    uint64_t v145 = 0x100000000;
                                    uint64_t v146 = 0x100000000;
                                    int v50 = 0;
                                    int v51 = 0;
                                    int v52 = 0;
                                    int v53 = 0;
                                    int v47 = 0;
                                    char v46 = 0;
                                    *(void *)&v151[20] = 0x100000001;
                                    *(void *)&v151[12] = 0x100000001;
                                    *(_DWORD *)&v151[8] = 1;
                                    int v48 = 1;
                                    int v49 = 1;
                                    int v150 = 0;
                                    *(void *)v151 = 0x100000001;
                                    int v148 = 0;
                                    int v149 = 1;
                                    uint64_t v147 = 0x100000000;
                                  }
                                }
                                else
                                {
                                  uint64_t v143 = 0;
                                  uint64_t v142 = 0;
                                  uint64_t v141 = 0;
                                  uint64_t v140 = 0;
                                  uint64_t v139 = 0;
                                  uint64_t v138 = 0;
                                  uint64_t v144 = 0x100000000;
                                  uint64_t v145 = 0x100000000;
                                  uint64_t v146 = 0x100000000;
                                  int v50 = 0;
                                  int v51 = 0;
                                  int v52 = 0;
                                  int v53 = 0;
                                  int v47 = 0;
                                  char v46 = 0;
                                  *(void *)&v151[20] = 0x100000001;
                                  *(void *)&v151[12] = 0x100000001;
                                  *(_DWORD *)&v151[8] = 1;
                                  int v48 = 1;
                                  int v49 = 1;
                                  int v150 = 0;
                                  *(void *)v151 = 0x100000001;
                                  int v148 = 0;
                                  int v149 = 1;
                                  uint64_t v147 = 0x100000000;
                                }
                              }
                              else
                              {
                                uint64_t v144 = 0;
                                uint64_t v143 = 0;
                                uint64_t v142 = 0;
                                uint64_t v141 = 0;
                                uint64_t v140 = 0;
                                uint64_t v139 = 0;
                                uint64_t v138 = 0;
                                uint64_t v145 = 0x100000000;
                                uint64_t v146 = 0x100000000;
                                int v50 = 0;
                                int v51 = 0;
                                int v52 = 0;
                                int v53 = 0;
                                int v47 = 0;
                                char v46 = 0;
                                *(void *)&v151[20] = 0x100000001;
                                *(void *)&v151[12] = 0x100000001;
                                *(_DWORD *)&v151[8] = 1;
                                int v48 = 1;
                                int v49 = 1;
                                int v150 = 0;
                                *(void *)v151 = 0x100000001;
                                int v148 = 0;
                                int v149 = 1;
                                uint64_t v147 = 0x100000000;
                              }
                            }
                            else
                            {
                              uint64_t v145 = 0;
                              uint64_t v144 = 0;
                              uint64_t v143 = 0;
                              uint64_t v142 = 0;
                              uint64_t v141 = 0;
                              uint64_t v140 = 0;
                              uint64_t v139 = 0;
                              uint64_t v138 = 0;
                              uint64_t v146 = 0x100000000;
                              int v50 = 0;
                              int v51 = 0;
                              int v52 = 0;
                              int v53 = 0;
                              int v47 = 0;
                              char v46 = 0;
                              *(void *)&v151[20] = 0x100000001;
                              *(void *)&v151[12] = 0x100000001;
                              *(_DWORD *)&v151[8] = 1;
                              int v48 = 1;
                              int v49 = 1;
                              int v150 = 0;
                              *(void *)v151 = 0x100000001;
                              int v148 = 0;
                              int v149 = 1;
                              uint64_t v147 = 0x100000000;
                            }
                          }
                          else
                          {
                            uint64_t v146 = 0;
                            uint64_t v145 = 0;
                            uint64_t v144 = 0;
                            uint64_t v143 = 0;
                            uint64_t v142 = 0;
                            uint64_t v141 = 0;
                            uint64_t v140 = 0;
                            uint64_t v139 = 0;
                            uint64_t v138 = 0;
                            uint64_t v147 = 0x100000000;
                            int v50 = 0;
                            int v51 = 0;
                            int v52 = 0;
                            int v53 = 0;
                            int v47 = 0;
                            char v46 = 0;
                            *(void *)&v151[20] = 0x100000001;
                            *(void *)&v151[12] = 0x100000001;
                            *(_DWORD *)&v151[8] = 1;
                            int v48 = 1;
                            int v49 = 1;
                            int v150 = 0;
                            *(void *)v151 = 0x100000001;
                            int v148 = 0;
                            int v149 = 1;
                          }
                          v5 = v62;
                        }
                        else
                        {
                          uint64_t v147 = 0;
                          uint64_t v146 = 0;
                          uint64_t v145 = 0;
                          uint64_t v144 = 0;
                          uint64_t v143 = 0;
                          uint64_t v142 = 0;
                          uint64_t v141 = 0;
                          uint64_t v140 = 0;
                          uint64_t v139 = 0;
                          uint64_t v138 = 0;
                          int v50 = 0;
                          int v51 = 0;
                          int v52 = 0;
                          int v53 = 0;
                          int v47 = 0;
                          char v46 = 0;
                          *(_DWORD *)&v151[20] = 1;
                          *(_DWORD *)&v151[24] = 1;
                          *(_DWORD *)&v151[12] = 1;
                          *(_DWORD *)&v151[16] = 1;
                          *(_DWORD *)&v151[4] = 1;
                          *(_DWORD *)&v151[8] = 1;
                          int v48 = 1;
                          int v49 = 1;
                          int v150 = 0;
                          *(_DWORD *)v151 = 1;
                          int v148 = 0;
                          int v149 = 1;
                        }
                      }
                      else
                      {
                        int v148 = 0;
                        int v149 = 0;
                        uint64_t v147 = 0;
                        uint64_t v146 = 0;
                        uint64_t v145 = 0;
                        uint64_t v144 = 0;
                        uint64_t v143 = 0;
                        uint64_t v142 = 0;
                        uint64_t v141 = 0;
                        uint64_t v140 = 0;
                        uint64_t v139 = 0;
                        uint64_t v138 = 0;
                        int v50 = 0;
                        int v51 = 0;
                        int v52 = 0;
                        int v53 = 0;
                        int v47 = 0;
                        char v46 = 0;
                        *(_DWORD *)&v151[20] = 1;
                        *(_DWORD *)&v151[24] = 1;
                        *(_DWORD *)&v151[12] = 1;
                        *(_DWORD *)&v151[16] = 1;
                        *(_DWORD *)&v151[4] = 1;
                        *(_DWORD *)&v151[8] = 1;
                        int v48 = 1;
                        int v49 = 1;
                        int v150 = 0;
                        *(_DWORD *)v151 = 1;
                      }
                    }
                    else
                    {
                      int v150 = 0;
                      *(_DWORD *)v151 = 0;
                      int v148 = 0;
                      int v149 = 0;
                      uint64_t v147 = 0;
                      uint64_t v146 = 0;
                      uint64_t v145 = 0;
                      uint64_t v144 = 0;
                      uint64_t v143 = 0;
                      uint64_t v142 = 0;
                      uint64_t v141 = 0;
                      uint64_t v140 = 0;
                      uint64_t v139 = 0;
                      uint64_t v138 = 0;
                      int v50 = 0;
                      int v51 = 0;
                      int v52 = 0;
                      int v53 = 0;
                      int v47 = 0;
                      char v46 = 0;
                      *(_DWORD *)&v151[20] = 1;
                      *(_DWORD *)&v151[24] = 1;
                      *(_DWORD *)&v151[12] = 1;
                      *(_DWORD *)&v151[16] = 1;
                      *(_DWORD *)&v151[4] = 1;
                      *(_DWORD *)&v151[8] = 1;
                      int v48 = 1;
                      int v49 = 1;
                    }
                  }
                  else
                  {
                    int v49 = 0;
                    int v150 = 0;
                    *(_DWORD *)v151 = 0;
                    int v148 = 0;
                    int v149 = 0;
                    uint64_t v147 = 0;
                    uint64_t v146 = 0;
                    uint64_t v145 = 0;
                    uint64_t v144 = 0;
                    uint64_t v143 = 0;
                    uint64_t v142 = 0;
                    uint64_t v141 = 0;
                    uint64_t v140 = 0;
                    uint64_t v139 = 0;
                    uint64_t v138 = 0;
                    int v50 = 0;
                    int v51 = 0;
                    int v52 = 0;
                    int v53 = 0;
                    int v47 = 0;
                    char v46 = 0;
                    *(_DWORD *)&v151[20] = 1;
                    *(_DWORD *)&v151[24] = 1;
                    *(_DWORD *)&v151[12] = 1;
                    *(_DWORD *)&v151[16] = 1;
                    *(_DWORD *)&v151[4] = 1;
                    *(_DWORD *)&v151[8] = 1;
                    int v48 = 1;
                  }
                }
                else
                {
                  int v48 = 0;
                  int v49 = 0;
                  int v150 = 0;
                  *(_DWORD *)v151 = 0;
                  int v148 = 0;
                  int v149 = 0;
                  uint64_t v147 = 0;
                  uint64_t v146 = 0;
                  uint64_t v145 = 0;
                  uint64_t v144 = 0;
                  uint64_t v143 = 0;
                  uint64_t v142 = 0;
                  uint64_t v141 = 0;
                  uint64_t v140 = 0;
                  uint64_t v139 = 0;
                  uint64_t v138 = 0;
                  int v50 = 0;
                  int v51 = 0;
                  int v52 = 0;
                  int v53 = 0;
                  int v47 = 0;
                  char v46 = 0;
                  *(_DWORD *)&v151[20] = 1;
                  *(_DWORD *)&v151[24] = 1;
                  *(_DWORD *)&v151[12] = 1;
                  *(_DWORD *)&v151[16] = 1;
                  *(_DWORD *)&v151[4] = 1;
                  *(_DWORD *)&v151[8] = 1;
                }
              }
              else
              {
                *(void *)v151 = 0;
                int v48 = 0;
                int v49 = 0;
                int v148 = 0;
                int v149 = 0;
                uint64_t v147 = 0;
                uint64_t v146 = 0;
                uint64_t v145 = 0;
                uint64_t v144 = 0;
                uint64_t v143 = 0;
                uint64_t v142 = 0;
                uint64_t v141 = 0;
                uint64_t v140 = 0;
                uint64_t v139 = 0;
                uint64_t v138 = 0;
                int v150 = 0;
                int v50 = 0;
                int v51 = 0;
                int v52 = 0;
                int v53 = 0;
                int v47 = 0;
                char v46 = 0;
                *(_DWORD *)&v151[20] = 1;
                *(_DWORD *)&v151[24] = 1;
                *(_DWORD *)&v151[12] = 1;
                *(_DWORD *)&v151[16] = 1;
                *(_DWORD *)&v151[8] = 1;
              }
            }
            else
            {
              *(void *)&v151[4] = 0;
              int v48 = 0;
              int v49 = 0;
              int v150 = 0;
              *(_DWORD *)v151 = 0;
              int v148 = 0;
              int v149 = 0;
              uint64_t v147 = 0;
              uint64_t v146 = 0;
              uint64_t v145 = 0;
              uint64_t v144 = 0;
              uint64_t v143 = 0;
              uint64_t v142 = 0;
              uint64_t v141 = 0;
              uint64_t v140 = 0;
              uint64_t v139 = 0;
              uint64_t v138 = 0;
              int v50 = 0;
              int v51 = 0;
              int v52 = 0;
              int v53 = 0;
              int v47 = 0;
              char v46 = 0;
              *(_DWORD *)&v151[20] = 1;
              *(_DWORD *)&v151[24] = 1;
              *(_DWORD *)&v151[12] = 1;
              *(_DWORD *)&v151[16] = 1;
            }
          }
          else
          {
            *(void *)v151 = 0;
            *(void *)&v151[8] = 0;
            int v48 = 0;
            int v49 = 0;
            int v148 = 0;
            int v149 = 0;
            uint64_t v147 = 0;
            uint64_t v146 = 0;
            uint64_t v145 = 0;
            uint64_t v144 = 0;
            uint64_t v143 = 0;
            uint64_t v142 = 0;
            uint64_t v141 = 0;
            uint64_t v140 = 0;
            uint64_t v139 = 0;
            uint64_t v138 = 0;
            int v150 = 0;
            int v50 = 0;
            int v51 = 0;
            int v52 = 0;
            int v53 = 0;
            int v47 = 0;
            char v46 = 0;
            *(_DWORD *)&v151[20] = 1;
            *(_DWORD *)&v151[24] = 1;
            *(_DWORD *)&v151[16] = 1;
          }
        }
        else
        {
          int v48 = 0;
          int v49 = 0;
          int v150 = 0;
          memset(v151, 0, 20);
          int v148 = 0;
          int v149 = 0;
          uint64_t v147 = 0;
          uint64_t v146 = 0;
          uint64_t v145 = 0;
          uint64_t v144 = 0;
          uint64_t v143 = 0;
          uint64_t v142 = 0;
          uint64_t v141 = 0;
          uint64_t v140 = 0;
          uint64_t v139 = 0;
          uint64_t v138 = 0;
          int v50 = 0;
          int v51 = 0;
          int v52 = 0;
          int v53 = 0;
          int v47 = 0;
          char v46 = 0;
          *(void *)&v151[20] = 0x100000001;
        }
      }
      else
      {
        memset(v151, 0, 24);
        int v48 = 0;
        int v49 = 0;
        int v148 = 0;
        int v149 = 0;
        uint64_t v147 = 0;
        uint64_t v146 = 0;
        uint64_t v145 = 0;
        uint64_t v144 = 0;
        uint64_t v143 = 0;
        uint64_t v142 = 0;
        uint64_t v141 = 0;
        uint64_t v140 = 0;
        uint64_t v139 = 0;
        uint64_t v138 = 0;
        int v150 = 0;
        int v50 = 0;
        int v51 = 0;
        int v52 = 0;
        int v53 = 0;
        int v47 = 0;
        char v46 = 0;
        *(_DWORD *)&v151[24] = 1;
      }
    }
    else
    {
      int v48 = 0;
      int v49 = 0;
      int v150 = 0;
      memset(v151, 0, sizeof(v151));
      int v148 = 0;
      int v149 = 0;
      uint64_t v147 = 0;
      uint64_t v146 = 0;
      uint64_t v145 = 0;
      uint64_t v144 = 0;
      uint64_t v143 = 0;
      uint64_t v142 = 0;
      uint64_t v141 = 0;
      uint64_t v140 = 0;
      uint64_t v139 = 0;
      uint64_t v138 = 0;
      int v50 = 0;
      int v51 = 0;
      int v52 = 0;
      int v53 = 0;
      int v47 = 0;
      char v46 = 0;
    }
  }
  else
  {
    int v52 = 0;
    int v48 = 0;
    int v49 = 0;
    int v150 = 0;
    memset(v151, 0, sizeof(v151));
    int v148 = 0;
    int v149 = 0;
    uint64_t v147 = 0;
    uint64_t v146 = 0;
    uint64_t v145 = 0;
    uint64_t v144 = 0;
    uint64_t v143 = 0;
    uint64_t v142 = 0;
    uint64_t v141 = 0;
    uint64_t v140 = 0;
    uint64_t v139 = 0;
    uint64_t v138 = 0;
    int v50 = 0;
    int v51 = 0;
    int v53 = 0;
    int v47 = 0;
    char v46 = 0;
  }
LABEL_47:
  if (v47)
  {
    int v54 = v50;
    int v55 = v49;
    v56 = v5;
    int v57 = v51;
    int v58 = v48;
    int v59 = v52;
    int v60 = v53;

    int v53 = v60;
    int v52 = v59;
    int v48 = v58;
    int v51 = v57;
    v5 = v56;
    int v49 = v55;
    int v50 = v54;
  }
  if (v53)
  {
  }
  if (v52)
  {

    if (!v51) {
      goto LABEL_53;
    }
  }
  else if (!v51)
  {
LABEL_53:
    if (!v50) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }

  if (v50)
  {
LABEL_54:
  }
LABEL_55:
  if (v150)
  {
  }
  if (v148)
  {
  }
  if (v147)
  {
  }
  if (v146)
  {
  }
  if (v145)
  {
  }
  if (v144)
  {
  }
  if (v143)
  {
  }
  if (v142)
  {
  }
  if (v141)
  {
  }
  if (v140)
  {
  }
  if (v139)
  {
  }
  if (v138)
  {
  }
  if (HIDWORD(v138))
  {
  }
  if (HIDWORD(v139))
  {
  }
  if (HIDWORD(v140))
  {
  }
  if (HIDWORD(v141))
  {
  }
  if (HIDWORD(v142))
  {
  }
  if (HIDWORD(v143))
  {
  }
  if (HIDWORD(v144))
  {
  }
  if (HIDWORD(v145))
  {
  }
  if (HIDWORD(v146))
  {
  }
  if (HIDWORD(v147))
  {
  }
  if (v149)
  {
  }
  if (*(_DWORD *)v151)
  {

    if (!v49) {
      goto LABEL_103;
    }
LABEL_125:

    if (!v48) {
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  if (v49) {
    goto LABEL_125;
  }
LABEL_103:
  if (v48)
  {
LABEL_104:
  }
LABEL_105:
  if (*(_DWORD *)&v151[4])
  {
  }
  if (*(_DWORD *)&v151[8])
  {
  }
  if (*(_DWORD *)&v151[12])
  {
  }
  if (*(_DWORD *)&v151[16])
  {
  }
  if (*(_DWORD *)&v151[20])
  {
  }
  if (*(_DWORD *)&v151[24])
  {
  }
  if (v152)
  {
  }
LABEL_120:

  return v46;
}

- (unint64_t)hash
{
  v81 = [(BBSectionSubtypeParameters *)self hiddenPreviewsBodyPlaceholder];
  uint64_t v3 = [v81 hash];
  v80 = [(BBSectionSubtypeParameters *)self subtypeSummaryFormat];
  uint64_t v4 = [v80 hash] ^ v3;
  v79 = [(BBSectionSubtypeParameters *)self topic];
  uint64_t v5 = [v79 hash];
  v78 = [(BBSectionSubtypeParameters *)self missedBannerDescriptionFormat];
  uint64_t v6 = v4 ^ v5 ^ [v78 hash];
  v77 = [(BBSectionSubtypeParameters *)self fullUnlockActionLabel];
  uint64_t v7 = [v77 hash];
  v76 = [(BBSectionSubtypeParameters *)self unlockActionLabel];
  uint64_t v8 = v7 ^ [v76 hash];
  v75 = [(BBSectionSubtypeParameters *)self fullAlternateActionLabel];
  uint64_t v9 = v6 ^ v8 ^ [v75 hash];
  v74 = [(BBSectionSubtypeParameters *)self alternateActionLabel];
  uint64_t v10 = [v74 hash];
  v73 = [(BBSectionSubtypeParameters *)self boxedSuppressesAlertsWhenAppIsActive];
  uint64_t v11 = v10 ^ [v73 hash];
  v72 = [(BBSectionSubtypeParameters *)self sectionIconOverride];
  uint64_t v12 = v11 ^ [v72 hash];
  v71 = [(BBSectionSubtypeParameters *)self boxedCoalescesWhenLocked];
  uint64_t v13 = v9 ^ v12 ^ [v71 hash];
  v70 = [(BBSectionSubtypeParameters *)self boxedInertWhenLocked];
  uint64_t v14 = [v70 hash];
  v69 = [(BBSectionSubtypeParameters *)self boxedPreservesUnlockActionCase];
  uint64_t v15 = v14 ^ [v69 hash];
  v68 = [(BBSectionSubtypeParameters *)self boxedVisuallyIndicatesWhenDateIsInFuture];
  uint64_t v16 = v15 ^ [v68 hash];
  v67 = [(BBSectionSubtypeParameters *)self boxedCanBeSilencedByMenuButtonPress];
  uint64_t v17 = v16 ^ [v67 hash];
  v66 = [(BBSectionSubtypeParameters *)self boxedPreventLock];
  uint64_t v18 = v13 ^ v17 ^ [v66 hash];
  v65 = [(BBSectionSubtypeParameters *)self boxedIgnoresQuietMode];
  uint64_t v19 = [v65 hash];
  v64 = [(BBSectionSubtypeParameters *)self boxedSuppressesTitle];
  uint64_t v20 = v19 ^ [v64 hash];
  v63 = [(BBSectionSubtypeParameters *)self boxedShowsUnreadIndicatorForNoticesFeed];
  uint64_t v21 = v20 ^ [v63 hash];
  v62 = [(BBSectionSubtypeParameters *)self boxedShowsContactPhoto];
  uint64_t v22 = v21 ^ [v62 hash];
  v61 = [(BBSectionSubtypeParameters *)self boxedPlaysSoundForModify];
  uint64_t v23 = v22 ^ [v61 hash];
  int v60 = [(BBSectionSubtypeParameters *)self boxedSubtypePriority];
  uint64_t v24 = v18 ^ v23 ^ [v60 hash];
  int v59 = [(BBSectionSubtypeParameters *)self boxedIPodOutAlertType];
  uint64_t v25 = [v59 hash];
  int v58 = [(BBSectionSubtypeParameters *)self boxedAllowsAutomaticRemovalFromLockScreen];
  uint64_t v26 = v25 ^ [v58 hash];
  int v57 = [(BBSectionSubtypeParameters *)self boxedAllowsAddingToLockScreenWhenUnlocked];
  uint64_t v27 = v26 ^ [v57 hash];
  v56 = [(BBSectionSubtypeParameters *)self boxedPrioritizeAtTopOfLockScreen];
  uint64_t v28 = v27 ^ [v56 hash];
  int v55 = [(BBSectionSubtypeParameters *)self boxedRevealsAdditionalContentOnPresentation];
  uint64_t v29 = v28 ^ [v55 hash];
  int v54 = [(BBSectionSubtypeParameters *)self boxedAllowsPersistentBannersInCarPlay];
  uint64_t v30 = v29 ^ [v54 hash];
  int v53 = [(BBSectionSubtypeParameters *)self boxedAllowsSupplementaryActionsInCarPlay];
  uint64_t v31 = v24 ^ v30 ^ [v53 hash];
  int v52 = [(BBSectionSubtypeParameters *)self boxedPrivacySettings];
  uint64_t v32 = [v52 hash];
  int v51 = [(BBSectionSubtypeParameters *)self boxedShouldDismissBulletinWhenClosed];
  uint64_t v33 = v32 ^ [v51 hash];
  uint64_t v34 = [(BBSectionSubtypeParameters *)self boxedPlaysMediaWhenRaised];
  uint64_t v35 = v33 ^ [v34 hash];
  uint64_t v36 = [(BBSectionSubtypeParameters *)self boxedSuppressDelayForForwardedBulletins];
  uint64_t v37 = v35 ^ [v36 hash];
  uint64_t v38 = [(BBSectionSubtypeParameters *)self boxedHideDismissActionInCarPlay];
  uint64_t v39 = v37 ^ [v38 hash];
  uint64_t v40 = [(BBSectionSubtypeParameters *)self bannerAccessoryRemoteViewControllerClassName];
  uint64_t v41 = v39 ^ [v40 hash];
  uint64_t v42 = [(BBSectionSubtypeParameters *)self bannerAccessoryRemoteServiceBundleIdentifier];
  uint64_t v43 = v41 ^ [v42 hash];
  uint64_t v44 = [(BBSectionSubtypeParameters *)self secondaryContentRemoteViewControllerClassName];
  uint64_t v45 = v31 ^ v43 ^ [v44 hash];
  char v46 = [(BBSectionSubtypeParameters *)self secondaryContentRemoteServiceBundleIdentifier];
  uint64_t v47 = [v46 hash];
  int v48 = [(BBSectionSubtypeParameters *)self boxedSuppressPresentationInAmbient];
  unint64_t v49 = v45 ^ v47 ^ [v48 hash];

  return v49;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBSectionSubtypeParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BBSectionSubtypeParameters;
  uint64_t v5 = [(BBSectionSubtypeParameters *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hiddenPreviewsBodyPlaceholder"];
    [(BBSectionSubtypeParameters *)v5 setHiddenPreviewsBodyPlaceholder:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtypeSummaryFormat"];
    [(BBSectionSubtypeParameters *)v5 setSubtypeSummaryFormat:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
    [(BBSectionSubtypeParameters *)v5 setTopic:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"missedBannerDescriptionFormat"];
    [(BBSectionSubtypeParameters *)v5 setMissedBannerDescriptionFormat:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullUnlockActionLabel"];
    [(BBSectionSubtypeParameters *)v5 setFullUnlockActionLabel:v10];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unlockActionLabel"];
    [(BBSectionSubtypeParameters *)v5 setUnlockActionLabel:v11];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAltnerateActionLabel"];
    [(BBSectionSubtypeParameters *)v5 setFullAlternateActionLabel:v12];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateActionLabel"];
    [(BBSectionSubtypeParameters *)v5 setAlternateActionLabel:v13];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionIconOverride"];
    [(BBSectionSubtypeParameters *)v5 setSectionIconOverride:v14];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bannerAccessoryRemoteViewControllerClassName"];
    [(BBSectionSubtypeParameters *)v5 setBannerAccessoryRemoteViewControllerClassName:v15];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bannerAccessoryRemoteServiceBundleIdentifier"];
    [(BBSectionSubtypeParameters *)v5 setBannerAccessoryRemoteServiceBundleIdentifier:v16];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryContentRemoteViewControllerClassName"];
    [(BBSectionSubtypeParameters *)v5 setSecondaryContentRemoteViewControllerClassName:v17];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryContentRemoteServiceBundleIdentifier"];
    [(BBSectionSubtypeParameters *)v5 setSecondaryContentRemoteServiceBundleIdentifier:v18];

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suppressWhenActive"];
    [(BBSectionSubtypeParameters *)v5 setBoxedSuppressesAlertsWhenAppIsActive:v19];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coalescesWhenLocked"];
    [(BBSectionSubtypeParameters *)v5 setBoxedCoalescesWhenLocked:v20];

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inertWhenLocked"];
    [(BBSectionSubtypeParameters *)v5 setBoxedInertWhenLocked:v21];

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preservesUnlockActionCase"];
    [(BBSectionSubtypeParameters *)v5 setBoxedPreservesUnlockActionCase:v22];

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visuallyIndicatesWhenDateIsInFuture"];
    [(BBSectionSubtypeParameters *)v5 setBoxedVisuallyIndicatesWhenDateIsInFuture:v23];

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"canBeSilencedByMenuButtonPress"];
    [(BBSectionSubtypeParameters *)v5 setBoxedCanBeSilencedByMenuButtonPress:v24];

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preventLock"];
    [(BBSectionSubtypeParameters *)v5 setBoxedPreventLock:v25];

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ignoresQuietMode"];
    [(BBSectionSubtypeParameters *)v5 setBoxedIgnoresQuietMode:v26];

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suppressesTitle"];
    [(BBSectionSubtypeParameters *)v5 setBoxedSuppressesTitle:v27];

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showsUnreadIndicatorForNoticesFeed"];
    [(BBSectionSubtypeParameters *)v5 setBoxedShowsUnreadIndicatorForNoticesFeed:v28];

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showsContactPhoto"];
    [(BBSectionSubtypeParameters *)v5 setBoxedShowsContactPhoto:v29];

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playsSoundForModify"];
    [(BBSectionSubtypeParameters *)v5 setBoxedPlaysSoundForModify:v30];

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtypePriority"];
    [(BBSectionSubtypeParameters *)v5 setBoxedSubtypePriority:v31];

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iPodOutAlertType"];
    [(BBSectionSubtypeParameters *)v5 setBoxedIPodOutAlertType:v32];

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsAutomaticRemovalFromLockScreen"];
    [(BBSectionSubtypeParameters *)v5 setBoxedAllowsAutomaticRemovalFromLockScreen:v33];

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsAddingToLockScreenWhenUnlocked"];
    [(BBSectionSubtypeParameters *)v5 setBoxedAllowsAddingToLockScreenWhenUnlocked:v34];

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prioritizeAtTopOfLockScreen"];
    [(BBSectionSubtypeParameters *)v5 setBoxedPrioritizeAtTopOfLockScreen:v35];

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"revealsAdditionalContentOnPresentation"];
    [(BBSectionSubtypeParameters *)v5 setBoxedRevealsAdditionalContentOnPresentation:v36];

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacySettings"];
    [(BBSectionSubtypeParameters *)v5 setBoxedPrivacySettings:v37];

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shouldDismissBulletinWhenClosed"];
    [(BBSectionSubtypeParameters *)v5 setBoxedShouldDismissBulletinWhenClosed:v38];

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsPersistentBannersInCarPlay"];
    [(BBSectionSubtypeParameters *)v5 setBoxedAllowsPersistentBannersInCarPlay:v39];

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsSupplementaryActionsInCarPlay"];
    [(BBSectionSubtypeParameters *)v5 setBoxedAllowsSupplementaryActionsInCarPlay:v40];

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playsMediaWhenRaised"];
    [(BBSectionSubtypeParameters *)v5 setBoxedPlaysMediaWhenRaised:v41];

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suppressDelayForForwardedBulletins"];
    [(BBSectionSubtypeParameters *)v5 setBoxedSuppressDelayForForwardedBulletins:v42];

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hideDismissActionInCarPlay"];
    [(BBSectionSubtypeParameters *)v5 setBoxedHideDismissActionInCarPlay:v43];

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suppressPresentationInAmbient"];
    [(BBSectionSubtypeParameters *)v5 setSuppressPresentationInAmbient:v44 != 0];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BBSectionSubtypeParameters *)self hiddenPreviewsBodyPlaceholder];
  [v4 encodeObject:v5 forKey:@"hiddenPreviewsBodyPlaceholder"];

  uint64_t v6 = [(BBSectionSubtypeParameters *)self subtypeSummaryFormat];
  [v4 encodeObject:v6 forKey:@"subtypeSummaryFormat"];

  uint64_t v7 = [(BBSectionSubtypeParameters *)self topic];
  [v4 encodeObject:v7 forKey:@"topic"];

  uint64_t v8 = [(BBSectionSubtypeParameters *)self missedBannerDescriptionFormat];
  [v4 encodeObject:v8 forKey:@"missedBannerDescriptionFormat"];

  uint64_t v9 = [(BBSectionSubtypeParameters *)self fullUnlockActionLabel];
  [v4 encodeObject:v9 forKey:@"fullUnlockActionLabel"];

  uint64_t v10 = [(BBSectionSubtypeParameters *)self unlockActionLabel];
  [v4 encodeObject:v10 forKey:@"unlockActionLabel"];

  uint64_t v11 = [(BBSectionSubtypeParameters *)self fullAlternateActionLabel];
  [v4 encodeObject:v11 forKey:@"fullAltnerateActionLabel"];

  uint64_t v12 = [(BBSectionSubtypeParameters *)self alternateActionLabel];
  [v4 encodeObject:v12 forKey:@"alternateActionLabel"];

  uint64_t v13 = [(BBSectionSubtypeParameters *)self sectionIconOverride];
  [v4 encodeObject:v13 forKey:@"sectionIconOverride"];

  uint64_t v14 = [(BBSectionSubtypeParameters *)self bannerAccessoryRemoteViewControllerClassName];
  [v4 encodeObject:v14 forKey:@"bannerAccessoryRemoteViewControllerClassName"];

  uint64_t v15 = [(BBSectionSubtypeParameters *)self bannerAccessoryRemoteServiceBundleIdentifier];
  [v4 encodeObject:v15 forKey:@"bannerAccessoryRemoteServiceBundleIdentifier"];

  uint64_t v16 = [(BBSectionSubtypeParameters *)self secondaryContentRemoteViewControllerClassName];
  [v4 encodeObject:v16 forKey:@"secondaryContentRemoteViewControllerClassName"];

  uint64_t v17 = [(BBSectionSubtypeParameters *)self secondaryContentRemoteServiceBundleIdentifier];
  [v4 encodeObject:v17 forKey:@"secondaryContentRemoteServiceBundleIdentifier"];

  uint64_t v18 = [(BBSectionSubtypeParameters *)self boxedSuppressesAlertsWhenAppIsActive];
  [v4 encodeObject:v18 forKey:@"suppressWhenActive"];

  uint64_t v19 = [(BBSectionSubtypeParameters *)self boxedCoalescesWhenLocked];
  [v4 encodeObject:v19 forKey:@"coalescesWhenLocked"];

  uint64_t v20 = [(BBSectionSubtypeParameters *)self boxedInertWhenLocked];
  [v4 encodeObject:v20 forKey:@"inertWhenLocked"];

  uint64_t v21 = [(BBSectionSubtypeParameters *)self boxedPreservesUnlockActionCase];
  [v4 encodeObject:v21 forKey:@"preservesUnlockActionCase"];

  uint64_t v22 = [(BBSectionSubtypeParameters *)self boxedVisuallyIndicatesWhenDateIsInFuture];
  [v4 encodeObject:v22 forKey:@"visuallyIndicatesWhenDateIsInFuture"];

  uint64_t v23 = [(BBSectionSubtypeParameters *)self boxedCanBeSilencedByMenuButtonPress];
  [v4 encodeObject:v23 forKey:@"canBeSilencedByMenuButtonPress"];

  uint64_t v24 = [(BBSectionSubtypeParameters *)self boxedPreventLock];
  [v4 encodeObject:v24 forKey:@"preventLock"];

  uint64_t v25 = [(BBSectionSubtypeParameters *)self boxedIgnoresQuietMode];
  [v4 encodeObject:v25 forKey:@"ignoresQuietMode"];

  uint64_t v26 = [(BBSectionSubtypeParameters *)self boxedSuppressesTitle];
  [v4 encodeObject:v26 forKey:@"suppressesTitle"];

  uint64_t v27 = [(BBSectionSubtypeParameters *)self boxedShowsUnreadIndicatorForNoticesFeed];
  [v4 encodeObject:v27 forKey:@"showsUnreadIndicatorForNoticesFeed"];

  uint64_t v28 = [(BBSectionSubtypeParameters *)self boxedShowsContactPhoto];
  [v4 encodeObject:v28 forKey:@"showsContactPhoto"];

  uint64_t v29 = [(BBSectionSubtypeParameters *)self boxedPlaysSoundForModify];
  [v4 encodeObject:v29 forKey:@"playsSoundForModify"];

  uint64_t v30 = [(BBSectionSubtypeParameters *)self boxedSubtypePriority];
  [v4 encodeObject:v30 forKey:@"subtypePriority"];

  uint64_t v31 = [(BBSectionSubtypeParameters *)self boxedIPodOutAlertType];
  [v4 encodeObject:v31 forKey:@"iPodOutAlertType"];

  uint64_t v32 = [(BBSectionSubtypeParameters *)self boxedAllowsAutomaticRemovalFromLockScreen];
  [v4 encodeObject:v32 forKey:@"allowsAutomaticRemovalFromLockScreen"];

  uint64_t v33 = [(BBSectionSubtypeParameters *)self boxedAllowsAddingToLockScreenWhenUnlocked];
  [v4 encodeObject:v33 forKey:@"allowsAddingToLockScreenWhenUnlocked"];

  uint64_t v34 = [(BBSectionSubtypeParameters *)self boxedPrioritizeAtTopOfLockScreen];
  [v4 encodeObject:v34 forKey:@"prioritizeAtTopOfLockScreen"];

  uint64_t v35 = [(BBSectionSubtypeParameters *)self boxedRevealsAdditionalContentOnPresentation];
  [v4 encodeObject:v35 forKey:@"revealsAdditionalContentOnPresentation"];

  uint64_t v36 = [(BBSectionSubtypeParameters *)self boxedPrivacySettings];
  [v4 encodeObject:v36 forKey:@"privacySettings"];

  uint64_t v37 = [(BBSectionSubtypeParameters *)self boxedShouldDismissBulletinWhenClosed];
  [v4 encodeObject:v37 forKey:@"shouldDismissBulletinWhenClosed"];

  uint64_t v38 = [(BBSectionSubtypeParameters *)self boxedAllowsPersistentBannersInCarPlay];
  [v4 encodeObject:v38 forKey:@"allowsPersistentBannersInCarPlay"];

  uint64_t v39 = [(BBSectionSubtypeParameters *)self boxedAllowsSupplementaryActionsInCarPlay];
  [v4 encodeObject:v39 forKey:@"allowsSupplementaryActionsInCarPlay"];

  uint64_t v40 = [(BBSectionSubtypeParameters *)self boxedPlaysMediaWhenRaised];
  [v4 encodeObject:v40 forKey:@"playsMediaWhenRaised"];

  uint64_t v41 = [(BBSectionSubtypeParameters *)self boxedSuppressDelayForForwardedBulletins];
  [v4 encodeObject:v41 forKey:@"suppressDelayForForwardedBulletins"];

  uint64_t v42 = [(BBSectionSubtypeParameters *)self boxedHideDismissActionInCarPlay];
  [v4 encodeObject:v42 forKey:@"hideDismissActionInCarPlay"];

  id v43 = [(BBSectionSubtypeParameters *)self boxedSuppressPresentationInAmbient];
  [v4 encodeObject:v43 forKey:@"suppressPresentationInAmbient"];
}

- (BBSectionSubtypeParameters)fallbackParameters
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackParameters);
  return (BBSectionSubtypeParameters *)WeakRetained;
}

- (void)setFallbackParameters:(id)a3
{
}

- (void)setHiddenPreviewsBodyPlaceholder:(id)a3
{
}

- (void)setSubtypeSummaryFormat:(id)a3
{
}

- (void)setTopic:(id)a3
{
}

- (void)setMissedBannerDescriptionFormat:(id)a3
{
}

- (void)setFullUnlockActionLabel:(id)a3
{
}

- (void)setUnlockActionLabel:(id)a3
{
}

- (void)setFullAlternateActionLabel:(id)a3
{
}

- (void)setAlternateActionLabel:(id)a3
{
}

- (void)setBannerAccessoryRemoteViewControllerClassName:(id)a3
{
}

- (void)setBannerAccessoryRemoteServiceBundleIdentifier:(id)a3
{
}

- (void)setSecondaryContentRemoteViewControllerClassName:(id)a3
{
}

- (void)setSecondaryContentRemoteServiceBundleIdentifier:(id)a3
{
}

- (NSNumber)boxedSuppressesAlertsWhenAppIsActive
{
  return self->_boxedSuppressesAlertsWhenAppIsActive;
}

- (void)setBoxedSuppressesAlertsWhenAppIsActive:(id)a3
{
}

- (NSNumber)boxedCoalescesWhenLocked
{
  return self->_boxedCoalescesWhenLocked;
}

- (void)setBoxedCoalescesWhenLocked:(id)a3
{
}

- (NSNumber)boxedInertWhenLocked
{
  return self->_boxedInertWhenLocked;
}

- (void)setBoxedInertWhenLocked:(id)a3
{
}

- (NSNumber)boxedPreservesUnlockActionCase
{
  return self->_boxedPreservesUnlockActionCase;
}

- (void)setBoxedPreservesUnlockActionCase:(id)a3
{
}

- (NSNumber)boxedVisuallyIndicatesWhenDateIsInFuture
{
  return self->_boxedVisuallyIndicatesWhenDateIsInFuture;
}

- (void)setBoxedVisuallyIndicatesWhenDateIsInFuture:(id)a3
{
}

- (NSNumber)boxedCanBeSilencedByMenuButtonPress
{
  return self->_boxedCanBeSilencedByMenuButtonPress;
}

- (void)setBoxedCanBeSilencedByMenuButtonPress:(id)a3
{
}

- (NSNumber)boxedPreventLock
{
  return self->_boxedPreventLock;
}

- (void)setBoxedPreventLock:(id)a3
{
}

- (NSNumber)boxedIgnoresQuietMode
{
  return self->_boxedIgnoresQuietMode;
}

- (void)setBoxedIgnoresQuietMode:(id)a3
{
}

- (NSNumber)boxedSuppressesTitle
{
  return self->_boxedSuppressesTitle;
}

- (void)setBoxedSuppressesTitle:(id)a3
{
}

- (NSNumber)boxedShowsUnreadIndicatorForNoticesFeed
{
  return self->_boxedShowsUnreadIndicatorForNoticesFeed;
}

- (void)setBoxedShowsUnreadIndicatorForNoticesFeed:(id)a3
{
}

- (NSNumber)boxedShowsContactPhoto
{
  return self->_boxedShowsContactPhoto;
}

- (void)setBoxedShowsContactPhoto:(id)a3
{
}

- (NSNumber)boxedPlaysSoundForModify
{
  return self->_boxedPlaysSoundForModify;
}

- (void)setBoxedPlaysSoundForModify:(id)a3
{
}

- (NSNumber)boxedSubtypePriority
{
  return self->_boxedSubtypePriority;
}

- (void)setBoxedSubtypePriority:(id)a3
{
}

- (NSNumber)boxedIPodOutAlertType
{
  return self->_boxedIPodOutAlertType;
}

- (void)setBoxedIPodOutAlertType:(id)a3
{
}

- (NSNumber)boxedAllowsAutomaticRemovalFromLockScreen
{
  return self->_boxedAllowsAutomaticRemovalFromLockScreen;
}

- (void)setBoxedAllowsAutomaticRemovalFromLockScreen:(id)a3
{
}

- (NSNumber)boxedAllowsAddingToLockScreenWhenUnlocked
{
  return self->_boxedAllowsAddingToLockScreenWhenUnlocked;
}

- (void)setBoxedAllowsAddingToLockScreenWhenUnlocked:(id)a3
{
}

- (NSNumber)boxedPrioritizeAtTopOfLockScreen
{
  return self->_boxedPrioritizeAtTopOfLockScreen;
}

- (void)setBoxedPrioritizeAtTopOfLockScreen:(id)a3
{
}

- (NSNumber)boxedRevealsAdditionalContentOnPresentation
{
  return self->_boxedRevealsAdditionalContentOnPresentation;
}

- (void)setBoxedRevealsAdditionalContentOnPresentation:(id)a3
{
}

- (NSNumber)boxedPrivacySettings
{
  return self->_boxedPrivacySettings;
}

- (void)setBoxedPrivacySettings:(id)a3
{
}

- (NSNumber)boxedShouldDismissBulletinWhenClosed
{
  return self->_boxedShouldDismissBulletinWhenClosed;
}

- (void)setBoxedShouldDismissBulletinWhenClosed:(id)a3
{
}

- (NSNumber)boxedAllowsPersistentBannersInCarPlay
{
  return self->_boxedAllowsPersistentBannersInCarPlay;
}

- (void)setBoxedAllowsPersistentBannersInCarPlay:(id)a3
{
}

- (NSNumber)boxedAllowsSupplementaryActionsInCarPlay
{
  return self->_boxedAllowsSupplementaryActionsInCarPlay;
}

- (void)setBoxedAllowsSupplementaryActionsInCarPlay:(id)a3
{
}

- (NSNumber)boxedPlaysMediaWhenRaised
{
  return self->_boxedPlaysMediaWhenRaised;
}

- (void)setBoxedPlaysMediaWhenRaised:(id)a3
{
}

- (NSNumber)boxedSuppressDelayForForwardedBulletins
{
  return self->_boxedSuppressDelayForForwardedBulletins;
}

- (void)setBoxedSuppressDelayForForwardedBulletins:(id)a3
{
}

- (NSNumber)boxedHideDismissActionInCarPlay
{
  return self->_boxedHideDismissActionInCarPlay;
}

- (void)setBoxedHideDismissActionInCarPlay:(id)a3
{
}

- (NSNumber)boxedSuppressPresentationInAmbient
{
  return self->_boxedSuppressPresentationInAmbient;
}

- (void)setBoxedSuppressPresentationInAmbient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxedSuppressPresentationInAmbient, 0);
  objc_storeStrong((id *)&self->_boxedHideDismissActionInCarPlay, 0);
  objc_storeStrong((id *)&self->_boxedSuppressDelayForForwardedBulletins, 0);
  objc_storeStrong((id *)&self->_boxedPlaysMediaWhenRaised, 0);
  objc_storeStrong((id *)&self->_boxedAllowsSupplementaryActionsInCarPlay, 0);
  objc_storeStrong((id *)&self->_boxedAllowsPersistentBannersInCarPlay, 0);
  objc_storeStrong((id *)&self->_boxedShouldDismissBulletinWhenClosed, 0);
  objc_storeStrong((id *)&self->_boxedPrivacySettings, 0);
  objc_storeStrong((id *)&self->_boxedRevealsAdditionalContentOnPresentation, 0);
  objc_storeStrong((id *)&self->_boxedPrioritizeAtTopOfLockScreen, 0);
  objc_storeStrong((id *)&self->_boxedAllowsAddingToLockScreenWhenUnlocked, 0);
  objc_storeStrong((id *)&self->_boxedAllowsAutomaticRemovalFromLockScreen, 0);
  objc_storeStrong((id *)&self->_boxedIPodOutAlertType, 0);
  objc_storeStrong((id *)&self->_boxedSubtypePriority, 0);
  objc_storeStrong((id *)&self->_boxedPlaysSoundForModify, 0);
  objc_storeStrong((id *)&self->_boxedShowsContactPhoto, 0);
  objc_storeStrong((id *)&self->_boxedShowsUnreadIndicatorForNoticesFeed, 0);
  objc_storeStrong((id *)&self->_boxedSuppressesTitle, 0);
  objc_storeStrong((id *)&self->_boxedIgnoresQuietMode, 0);
  objc_storeStrong((id *)&self->_boxedPreventLock, 0);
  objc_storeStrong((id *)&self->_boxedCanBeSilencedByMenuButtonPress, 0);
  objc_storeStrong((id *)&self->_boxedVisuallyIndicatesWhenDateIsInFuture, 0);
  objc_storeStrong((id *)&self->_boxedPreservesUnlockActionCase, 0);
  objc_storeStrong((id *)&self->_boxedInertWhenLocked, 0);
  objc_storeStrong((id *)&self->_boxedCoalescesWhenLocked, 0);
  objc_storeStrong((id *)&self->_boxedSuppressesAlertsWhenAppIsActive, 0);
  objc_storeStrong((id *)&self->_secondaryContentRemoteServiceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryContentRemoteViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_bannerAccessoryRemoteServiceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bannerAccessoryRemoteViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_sectionIconOverride, 0);
  objc_storeStrong((id *)&self->_alternateActionLabel, 0);
  objc_storeStrong((id *)&self->_fullAlternateActionLabel, 0);
  objc_storeStrong((id *)&self->_unlockActionLabel, 0);
  objc_storeStrong((id *)&self->_fullUnlockActionLabel, 0);
  objc_storeStrong((id *)&self->_missedBannerDescriptionFormat, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_subtypeSummaryFormat, 0);
  objc_storeStrong((id *)&self->_hiddenPreviewsBodyPlaceholder, 0);
  objc_destroyWeak((id *)&self->_fallbackParameters);
}

@end