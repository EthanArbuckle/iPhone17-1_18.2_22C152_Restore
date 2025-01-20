@interface SRPreferences
- (BOOL)hasPresentedSiriAdvancedFeaturesAssetsDownloadNotification;
- (BOOL)hasPresentedSiriAssetsNotification;
- (BOOL)siriIsActive;
- (NSString)lastCoreDuetPunchoutID;
- (NSUUID)lastPinnedTranscriptItemIdentifier;
- (SRPreferences)init;
- (double)lastTranscriptVerticalContentOffset;
- (int64_t)lastKnownInterfaceOrientation;
- (int64_t)lastVisibleTranscriptItemIndex;
- (int64_t)showTapToEditTipCount;
- (void)preferences:(id)a3 didChangeValueForKey:(id)a4;
- (void)setHasPresentedSiriAdvancedFeaturesAssetsDownloadNotification:(BOOL)a3;
- (void)setHasPresentedSiriAssetsNotification:(BOOL)a3;
- (void)setLastCoreDuetPunchoutID:(id)a3;
- (void)setLastKnownInterfaceOrientation:(int64_t)a3;
- (void)setLastPinnedTranscriptItemIdentifier:(id)a3;
- (void)setLastTranscriptVerticalContentOffset:(double)a3;
- (void)setLastVisibleTranscriptItemIndex:(int64_t)a3;
- (void)setShowTapToEditTipCount:(int64_t)a3;
- (void)setSiriIsActive:(BOOL)a3;
@end

@implementation SRPreferences

- (SRPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)SRPreferences;
  v2 = [(SRPreferences *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)SRUIFPreferences);
    v4 = (SRUIFPreferences *)[v3 initWithSuiteName:SRUIFPreferencesDefaultDomain];
    internalPreferences = v2->_internalPreferences;
    v2->_internalPreferences = v4;

    [(SRUIFPreferences *)v2->_internalPreferences setDelegate:v2];
  }
  return v2;
}

- (void)preferences:(id)a3 didChangeValueForKey:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v5 isEqualToString:@"SiriIsActive"] & 1) != 0
    || ([v5 isEqualToString:@"LastKnownInterfaceOrientation"] & 1) != 0
    || ([v5 isEqualToString:@"LastTranscriptVerticalContentOffset"] & 1) != 0
    || ([v5 isEqualToString:@"LastVisibleTranscriptItemIndex"] & 1) != 0
    || ([v5 isEqualToString:@"LastPinnedTranscriptItemIdentifier"] & 1) != 0
    || [v5 isEqualToString:@"TapToEditTipCount"])
  {
    [v6 synchronize];
  }
}

- (BOOL)siriIsActive
{
  return [(SRUIFPreferences *)self->_internalPreferences BOOLForKey:@"SiriIsActive"];
}

- (void)setSiriIsActive:(BOOL)a3
{
}

- (int64_t)lastKnownInterfaceOrientation
{
  return (int64_t)[(SRUIFPreferences *)self->_internalPreferences integerForKey:@"LastKnownInterfaceOrientation"];
}

- (void)setLastKnownInterfaceOrientation:(int64_t)a3
{
}

- (double)lastTranscriptVerticalContentOffset
{
  [(SRUIFPreferences *)self->_internalPreferences doubleForKey:@"LastTranscriptVerticalContentOffset"];
  return result;
}

- (void)setLastTranscriptVerticalContentOffset:(double)a3
{
}

- (int64_t)lastVisibleTranscriptItemIndex
{
  return (int64_t)[(SRUIFPreferences *)self->_internalPreferences integerForKey:@"LastVisibleTranscriptItemIndex"];
}

- (void)setLastVisibleTranscriptItemIndex:(int64_t)a3
{
}

- (void)setLastPinnedTranscriptItemIdentifier:(id)a3
{
  internalPreferences = self->_internalPreferences;
  id v4 = [a3 UUIDString];
  [(SRUIFPreferences *)internalPreferences setObject:v4 forKey:@"LastPinnedTranscriptItemIdentifier"];
}

- (NSUUID)lastPinnedTranscriptItemIdentifier
{
  id v3 = objc_alloc((Class)NSUUID);
  id v4 = [(SRUIFPreferences *)self->_internalPreferences objectForKey:@"LastPinnedTranscriptItemIdentifier"];
  id v5 = [v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (int64_t)showTapToEditTipCount
{
  return (int64_t)[(SRUIFPreferences *)self->_internalPreferences integerForKey:@"TapToEditTipCount"];
}

- (void)setShowTapToEditTipCount:(int64_t)a3
{
}

- (BOOL)hasPresentedSiriAssetsNotification
{
  return [(SRUIFPreferences *)self->_internalPreferences BOOLForKey:@"HasPresentedSiriAssetsNotification"];
}

- (void)setHasPresentedSiriAssetsNotification:(BOOL)a3
{
}

- (BOOL)hasPresentedSiriAdvancedFeaturesAssetsDownloadNotification
{
  return [(SRUIFPreferences *)self->_internalPreferences BOOLForKey:@"HasPresentedSiriAssetsDownloadNotification"];
}

- (void)setHasPresentedSiriAdvancedFeaturesAssetsDownloadNotification:(BOOL)a3
{
}

- (NSString)lastCoreDuetPunchoutID
{
  return self->_lastCoreDuetPunchoutID;
}

- (void)setLastCoreDuetPunchoutID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCoreDuetPunchoutID, 0);

  objc_storeStrong((id *)&self->_internalPreferences, 0);
}

@end