@interface CKFaceTimeUtilities
+ (BOOL)isDirectTelephonyAvailable;
+ (BOOL)isFaceTimeAudioAvailable:(id)a3;
+ (BOOL)isFaceTimeVideoAvailable:(id)a3;
+ (BOOL)isGroupFaceTimeSupported;
+ (BOOL)isModernScreenSharingAvailable:(id)a3;
+ (BOOL)isModernScreenSharingAvailableForEntity:(id)a3 capabilities:(id)a4;
+ (BOOL)isTelephonyAvailable;
+ (int64_t)faceTimeMaxParticipants;
+ (void)initializeCachedValues;
+ (void)queryModernScreenSharingCapabilities:(id)a3 completion:(id)a4;
+ (void)showCallControlsForConversation:(id)a3;
@end

@implementation CKFaceTimeUtilities

+ (void)initializeCachedValues
{
}

+ (BOOL)isTelephonyAvailable
{
  return [MEMORY[0x1E4FADA88] supportsTelephonyCalls];
}

+ (BOOL)isDirectTelephonyAvailable
{
  return [MEMORY[0x1E4FADA88] isDirectTelephonyCallingCurrentlyAvailable];
}

+ (BOOL)isFaceTimeVideoAvailable:(id)a3
{
  id v4 = a3;
  if ([v4 isGroupConversation])
  {
    if (![a1 isGroupFaceTimeSupported])
    {
      char v7 = 0;
      goto LABEL_9;
    }
    v5 = [v4 recipients];
    unint64_t v6 = [v5 count];
    char v7 = v6 <= +[CKFaceTimeUtilities faceTimeMaxParticipants];
  }
  else
  {
    v5 = [MEMORY[0x1E4F61740] sharedInstance];
    if ([v5 faceTimeSupported])
    {
      v8 = [MEMORY[0x1E4F61740] sharedInstance];
      char v7 = [v8 faceTimeAvailable];
    }
    else
    {
      char v7 = 0;
    }
  }

LABEL_9:
  v9 = [MEMORY[0x1E4F61730] sharedInstance];
  uint64_t v10 = [v9 availabilityForListenerID:CKFaceTimeServiceAvailabilityKey forService:0];

  if (v10) {
    BOOL v11 = v7;
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)isFaceTimeAudioAvailable:(id)a3
{
  id v4 = a3;
  if ([v4 isGroupConversation])
  {
    if (![a1 isGroupFaceTimeSupported])
    {
      LOBYTE(v7) = 0;
      goto LABEL_12;
    }
    v5 = [v4 recipients];
    unint64_t v6 = [v5 count];
    LOBYTE(v7) = v6 <= +[CKFaceTimeUtilities faceTimeMaxParticipants];
  }
  else
  {
    v5 = [MEMORY[0x1E4F61740] sharedInstance];
    if ([v5 faceTimeSupported])
    {
      v8 = [MEMORY[0x1E4F61740] sharedInstance];
      if ([v8 callingSupported])
      {
        v9 = [MEMORY[0x1E4F61740] sharedInstance];
        int v7 = [v9 faceTimeBlocked] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

LABEL_12:
  uint64_t v10 = [MEMORY[0x1E4F61730] sharedInstance];
  uint64_t v11 = [v10 availabilityForListenerID:CKFaceTimeServiceAvailabilityKey forService:2];

  if (v11) {
    BOOL v12 = v7;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)isGroupFaceTimeSupported
{
  v2 = [MEMORY[0x1E4F61740] sharedInstance];
  if ([v2 faceTimeSupported])
  {
    v3 = [MEMORY[0x1E4F61740] sharedInstance];
    if ([v3 multiwayAvailable])
    {
      id v4 = [MEMORY[0x1E4F61740] sharedInstance];
      int v5 = [v4 isGreenTea] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)isModernScreenSharingAvailable:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v5 = [v4 isModernScreenSharingEnabled];

  if ((v5 & 1) == 0)
  {
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (![v3 isGroupConversation])
  {
    v8 = [MEMORY[0x1E4F61740] sharedInstance];
    int v9 = [v8 isGreenTea];

    if (v9)
    {
      if ((_IMWillLog() & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    uint64_t v10 = [v3 chat];
    int v11 = [v10 isSMS];

    if (!v11)
    {
      BOOL v6 = 1;
      goto LABEL_8;
    }
    if (!_IMWillLog()) {
      goto LABEL_7;
    }
LABEL_6:
    _IMAlwaysLog();
    goto LABEL_7;
  }
  if (_IMWillLog()) {
    goto LABEL_6;
  }
LABEL_7:
  BOOL v6 = 0;
LABEL_8:

  return v6;
}

+ (void)showCallControlsForConversation:(id)a3
{
  if ([MEMORY[0x1E4F6BCC0] conversationIsVideoCall:a3]) {
    [MEMORY[0x1E4F1CB10] faceTimeShowInCallUIURL];
  }
  else {
  id v3 = [MEMORY[0x1E4F1CB10] faceTimeShowSystemCallControlsURL];
  }
  TUOpenURL();
}

+ (int64_t)faceTimeMaxParticipants
{
  return [MEMORY[0x1E4FADB78] maximumNumberOfInvitedMembers] + 1;
}

+ (void)queryModernScreenSharingCapabilities:(id)a3 completion:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)MEMORY[0x1E4F6E7B8];
  uint64_t v7 = *MEMORY[0x1E4F6AA50];
  uint64_t v8 = CKFaceTimeServiceAvailabilityKey;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke;
  v10[3] = &unk_1E562C580;
  id v11 = v5;
  id v9 = v5;
  [v6 currentRemoteDevicesForDestinations:a3 service:v7 listenerID:v8 queue:MEMORY[0x1E4F14428] completionBlock:v10];
}

void __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__75;
  uint64_t v10 = __Block_byref_object_dispose__75;
  id v11 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke_64;
  v5[3] = &unk_1E562C558;
  v5[4] = &v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v7[5]);
  }
  _Block_object_dispose(&v6, 8);
}

void __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke_2;
  v9[3] = &unk_1E562C530;
  v9[4] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v8 = [NSNumber numberWithBool:*((unsigned __int8 *)v11 + 24)];
  [v7 setObject:v8 forKey:v5];

  _Block_object_dispose(&v10, 8);
}

void __71__CKFaceTimeUtilities_queryModernScreenSharingCapabilities_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 capabilities];
  if ([v6 valueForCapability:*MEMORY[0x1E4F6B2A8]]
    && ![v6 valueForCapability:*MEMORY[0x1E4F6B268]])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (BOOL)isModernScreenSharingAvailableForEntity:(id)a3 capabilities:(id)a4
{
  id v5 = a4;
  id v6 = [a3 IDSCanonicalAddress];
  if (_IMWillLog())
  {
    uint64_t v10 = v6;
    _IMAlwaysLog();
  }
  uint64_t v7 = objc_msgSend(v5, "objectForKey:", v6, v10);

  if (v7)
  {
    uint64_t v8 = [v5 objectForKey:v6];
    LOBYTE(v7) = [v8 BOOLValue];
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }

  return (char)v7;
}

@end