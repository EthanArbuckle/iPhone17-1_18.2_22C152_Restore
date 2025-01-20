@interface AFTipKitDonator
+ (void)_donateToTipsWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 userInfo:(id)a6;
+ (void)donateAnnounceNotificationsInCarPlaySettingsChange:(int64_t)a3;
+ (void)donateCallHangUpAvailabilityChanged:(BOOL)a3;
+ (void)donateDictationEventStartedForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5;
+ (void)donateMessageSentForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5;
+ (void)donateSiriEventStartedForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5;
@end

@implementation AFTipKitDonator

+ (void)donateCallHangUpAvailabilityChanged:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"state";
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [a1 _donateToTipsWithIdentifier:@"com.apple.siri.call-hang-up.availability.changed" bundleID:@"com.apple.siri" context:0 userInfo:v5];
}

+ (void)donateMessageSentForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5
{
}

+ (void)donateSiriEventStartedForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5
{
}

+ (void)donateDictationEventStartedForBundleId:(id)a3 context:(id)a4 userInfo:(id)a5
{
}

+ (void)donateAnnounceNotificationsInCarPlaySettingsChange:(int64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"AFSiriCarPlayAnnounceEnablementType";
  if ((unint64_t)a3 > 4) {
    v4 = @"(unknown)";
  }
  else {
    v4 = off_1E592AEC0[a3];
  }
  v5 = v4;
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [a1 _donateToTipsWithIdentifier:@"com.apple.siri.announce.carplay.settings.changed" bundleID:@"com.apple.siri" context:0 userInfo:v6];
}

+ (void)_donateToTipsWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 userInfo:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (_AFTipKitDonatorQueue_onceToken != -1) {
    dispatch_once(&_AFTipKitDonatorQueue_onceToken, &__block_literal_global_1964);
  }
  v13 = _AFTipKitDonatorQueue_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__AFTipKitDonator__donateToTipsWithIdentifier_bundleID_context_userInfo___block_invoke;
  v18[3] = &unk_1E592C220;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v13, v18);
}

void __73__AFTipKitDonator__donateToTipsWithIdentifier_bundleID_context_userInfo___block_invoke(void *a1)
{
  id v3 = (id)[objc_alloc((Class)getBMDiscoverabilitySignalEventClass()) initWithIdentifier:a1[4] bundleID:a1[5] context:a1[6] userInfo:a1[7]];
  v1 = [getBMStreamsClass() discoverabilitySignal];
  v2 = [v1 source];
  [v2 sendEvent:v3];
}

@end