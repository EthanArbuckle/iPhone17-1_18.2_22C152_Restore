@interface AVPlayerItem(AVKitAdditionsPrivate)
- (id)avkit_data;
- (id)avkit_dataOrNil;
- (id)avkit_valueForAVKitProperty:()AVKitAdditionsPrivate;
- (id)contentSubtitle;
- (id)contentTitle;
- (id)externalMetadata;
- (id)interstitialTimeRanges;
- (uint64_t)defaultInterstitialPolicyEnforcement;
- (uint64_t)interstitialPolicyEnforcement;
- (uint64_t)translatesPlayerInterstitialEvents;
- (void)avkit_airMessageSendExternalMetadata;
- (void)avkit_airMessageSendToAppleTV;
- (void)avkit_setValue:()AVKitAdditionsPrivate forAVKitProperty:;
- (void)setContentSubtitle:()AVKitAdditionsPrivate;
- (void)setContentTitle:()AVKitAdditionsPrivate;
- (void)setExternalMetadata:()AVKitAdditionsPrivate;
- (void)setInterstitialTimeRanges:()AVKitAdditionsPrivate;
@end

@implementation AVPlayerItem(AVKitAdditionsPrivate)

- (void)setContentSubtitle:()AVKitAdditionsPrivate
{
  id v8 = (id)[a3 copy];
  v4 = [a1 contentSubtitle];
  char v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(a1, "avkit_data");
    v7 = [v6 customPropertyStorage];
    [v7 setObject:v8 forKeyedSubscript:@"contentSubtitle"];
  }
}

- (id)contentSubtitle
{
  v1 = objc_msgSend(a1, "avkit_dataOrNil");
  v2 = [v1 customPropertyStorage];
  v3 = [v2 objectForKeyedSubscript:@"contentSubtitle"];

  return v3;
}

- (void)setContentTitle:()AVKitAdditionsPrivate
{
  id v8 = (id)[a3 copy];
  v4 = [a1 contentTitle];
  char v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(a1, "avkit_data");
    v7 = [v6 customPropertyStorage];
    [v7 setObject:v8 forKeyedSubscript:@"contentTitle"];
  }
}

- (id)contentTitle
{
  v1 = objc_msgSend(a1, "avkit_dataOrNil");
  v2 = [v1 customPropertyStorage];
  v3 = [v2 objectForKeyedSubscript:@"contentTitle"];

  return v3;
}

- (id)avkit_data
{
  objc_msgSend(a1, "avkit_dataOrNil");
  v2 = (AVPlayerItemAVKitData *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(AVPlayerItemAVKitData);
    [a1 setAVKitData:v2];
  }
  v3 = [a1 AVKitData];

  return v3;
}

- (id)avkit_dataOrNil
{
  v2 = [a1 AVKitData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v4 = [a1 AVKitData];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setExternalMetadata:()AVKitAdditionsPrivate
{
  id v9 = (id)[a3 copy];
  v4 = [a1 externalMetadata];
  char v5 = [v9 isEqualToArray:v4];

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(a1, "avkit_data");
    v7 = [v6 customPropertyStorage];
    [v7 setObject:v9 forKeyedSubscript:@"externalMetadata"];

    id v8 = +[AVAirMessageDispatcher shared];
    LODWORD(v7) = [v8 haveAirPlayService];

    if (v7) {
      objc_msgSend(a1, "avkit_airMessageSendExternalMetadata");
    }
  }
}

- (id)externalMetadata
{
  v1 = objc_msgSend(a1, "avkit_dataOrNil");
  v2 = [v1 customPropertyStorage];
  v3 = [v2 objectForKeyedSubscript:@"externalMetadata"];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)interstitialTimeRanges
{
  v1 = objc_msgSend(a1, "avkit_dataOrNil");
  v2 = [v1 customPropertyStorage];

  uint64_t v3 = [v2 objectForKeyedSubscript:@"interstitialTimeRanges"];
  if (v3) {
    v4 = (void *)v3;
  }
  else {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (uint64_t)translatesPlayerInterstitialEvents
{
  return 1;
}

- (void)setInterstitialTimeRanges:()AVKitAdditionsPrivate
{
  id v8 = (id)[a3 copy];
  v4 = [a1 interstitialTimeRanges];
  char v5 = [v8 isEqualToArray:v4];

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(a1, "avkit_data");
    v7 = [v6 customPropertyStorage];
    [v7 setObject:v8 forKeyedSubscript:@"interstitialTimeRanges"];
  }
}

- (uint64_t)interstitialPolicyEnforcement
{
  v1 = objc_msgSend(a1, "avkit_data");
  uint64_t v2 = [v1 interstitialPolicyEnforcement];

  return v2;
}

- (uint64_t)defaultInterstitialPolicyEnforcement
{
  return 3;
}

- (void)avkit_airMessageSendToAppleTV
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAirMessageDispatcher shared];
  int v3 = [v2 haveAirPlayService];

  if (v3)
  {
    v4 = _avairlog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[AVPlayerItem(AVKitAdditionsPrivate) avkit_airMessageSendToAppleTV]";
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s Sending all available information for this player item.", (uint8_t *)&v7, 0xCu);
    }

    char v5 = [a1 externalMetadata];
    uint64_t v6 = [v5 count];

    if (v6) {
      objc_msgSend(a1, "avkit_airMessageSendExternalMetadata");
    }
  }
}

- (void)avkit_airMessageSendExternalMetadata
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 externalMetadata];
  int v3 = [a1 avkitACMIdentifier];
  v4 = +[AVAirMessage messageWithExternalMetadata:v2 itemIdentifier:v3];

  if (v4)
  {
    char v5 = _avairlog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[AVPlayerItem(AVKitAdditionsPrivate) avkit_airMessageSendExternalMetadata]";
      __int16 v9 = 2048;
      uint64_t v10 = [v2 count];
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending external metadata (%ld items)", (uint8_t *)&v7, 0x16u);
    }

    uint64_t v6 = +[AVAirMessageDispatcher shared];
    [v6 sendMessage:v4 completion:&__block_literal_global_1798];
  }
}

- (id)avkit_valueForAVKitProperty:()AVKitAdditionsPrivate
{
  id v4 = a3;
  char v5 = objc_msgSend(a1, "avkit_dataOrNil");
  uint64_t v6 = [v5 customPropertyStorage];
  int v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (void)avkit_setValue:()AVKitAdditionsPrivate forAVKitProperty:
{
  id v6 = a4;
  id v7 = a3;
  [a1 willChangeValueForKey:v6];
  id v8 = objc_msgSend(a1, "avkit_data");
  __int16 v9 = [v8 customPropertyStorage];
  [v9 setObject:v7 forKeyedSubscript:v6];

  [a1 didChangeValueForKey:v6];
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"AVPlayerItemAVKitDataDidChangeNotification" object:a1];
}

@end