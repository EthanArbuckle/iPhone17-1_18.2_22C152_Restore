@interface InCallServiceApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityStartStopToggle;
- (id)_axGetFirstCall;
- (id)accessibilityLabel;
@end

@implementation InCallServiceApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ICSApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityStartStopToggle
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __69__InCallServiceApplicationAccessibility_accessibilityStartStopToggle__block_invoke;
  v9 = &unk_265129FA8;
  v10 = &v11;
  AXPerformBlockSynchronouslyOnMainThread();
  if (*((unsigned char *)v12 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)InCallServiceApplicationAccessibility;
    BOOL v3 = [(InCallServiceApplicationAccessibility *)&v5 accessibilityStartStopToggle];
  }
  _Block_object_dispose(&v11, 8);
  return v3;
}

void __69__InCallServiceApplicationAccessibility_accessibilityStartStopToggle__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v14 = [v2 incomingCall];

  BOOL v3 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v4 = [v3 incomingVideoCall];

  objc_super v5 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v6 = [v5 currentAudioAndVideoCallCount];

  if (v14 | v4) {
    BOOL v7 = v6 == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (v14) {
      v12 = (void *)v14;
    }
    else {
      v12 = (void *)v4;
    }
    id v8 = v12;
    uint64_t v13 = [MEMORY[0x263F7E1A0] sharedInstance];
    [v13 answerCall:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    if (!v6) {
      goto LABEL_12;
    }
    id v8 = [MEMORY[0x263F7E1A0] sharedInstance];
    v9 = [MEMORY[0x263F7E1A0] sharedInstance];
    v10 = [v9 currentCalls];
    uint64_t v11 = [v10 firstObject];
    [v8 disconnectCall:v11];
  }
LABEL_12:
}

- (id)accessibilityLabel
{
  v2 = [(InCallServiceApplicationAccessibility *)self _axGetFirstCall];
  int v3 = [v2 service];

  if ((v3 - 1) > 2)
  {
    uint64_t v4 = &stru_26F6D4890;
  }
  else
  {
    accessibilityLocalizedString(off_265129FC8[v3 - 1]);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_axGetFirstCall
{
  v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  int v3 = [v2 currentAudioAndVideoCalls];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

@end