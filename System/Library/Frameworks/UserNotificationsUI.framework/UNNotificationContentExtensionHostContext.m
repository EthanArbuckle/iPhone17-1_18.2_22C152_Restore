@interface UNNotificationContentExtensionHostContext
@end

@implementation UNNotificationContentExtensionHostContext

void __85___UNNotificationContentExtensionHostContext__extensionDidUpdatePlayPauseMediaButton__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 notificationExtensionDidUpdatePlayPauseMediaButton:*(void *)(a1 + 32)];
}

uint64_t __86___UNNotificationContentExtensionHostContext__extensionWantsToReceiveActionResponses___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWantsToReceiveActionResponses:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __84___UNNotificationContentExtensionHostContext__extensionWantsToBecomeFirstResponder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWantsToBecomeFirstResponder:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __84___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlayPauseMediaButtonType:*(void *)(a1 + 40)];
}

uint64_t __85___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlayPauseMediaButtonFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __85___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlayPauseMediaButtonColor:*(void *)(a1 + 40)];
}

void __99___UNNotificationContentExtensionHostContext__extensionDidCompleteNotificationResponse_withOption___block_invoke(void *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99___UNNotificationContentExtensionHostContext__extensionDidCompleteNotificationResponse_withOption___block_invoke_2;
  block[3] = &unk_264603710;
  id v2 = (void *)a1[5];
  block[4] = a1[4];
  id v3 = v2;
  uint64_t v4 = a1[6];
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __99___UNNotificationContentExtensionHostContext__extensionDidCompleteNotificationResponse_withOption___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 notificationExtension:*(void *)(a1 + 32) extensionDidCompleteResponse:*(void *)(a1 + 40) withOption:*(void *)(a1 + 48)];
}

void __75___UNNotificationContentExtensionHostContext__extensionMediaPlayingStarted__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75___UNNotificationContentExtensionHostContext__extensionMediaPlayingStarted__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __75___UNNotificationContentExtensionHostContext__extensionMediaPlayingStarted__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 notificationExtensionMediaPlayingDidStart:*(void *)(a1 + 32)];
}

void __74___UNNotificationContentExtensionHostContext__extensionMediaPlayingPaused__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___UNNotificationContentExtensionHostContext__extensionMediaPlayingPaused__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74___UNNotificationContentExtensionHostContext__extensionMediaPlayingPaused__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 notificationExtensionMediaPlayingDidPause:*(void *)(a1 + 32)];
}

void __77___UNNotificationContentExtensionHostContext__extensionRequestsDefaultAction__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77___UNNotificationContentExtensionHostContext__extensionRequestsDefaultAction__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __77___UNNotificationContentExtensionHostContext__extensionRequestsDefaultAction__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 notificationExtensionRequestsDefaultAction:*(void *)(a1 + 32)];
}

void __71___UNNotificationContentExtensionHostContext__extensionRequestsDismiss__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71___UNNotificationContentExtensionHostContext__extensionRequestsDismiss__block_invoke_2;
  block[3] = &unk_2646035C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71___UNNotificationContentExtensionHostContext__extensionRequestsDismiss__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 notificationExtensionRequestsDismiss:*(void *)(a1 + 32)];
}

void __71___UNNotificationContentExtensionHostContext__extensionDidUpdateTitle___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __71___UNNotificationContentExtensionHostContext__extensionDidUpdateTitle___block_invoke_2;
  v2[3] = &unk_2646036E8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __71___UNNotificationContentExtensionHostContext__extensionDidUpdateTitle___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 notificationExtension:*(void *)(a1 + 32) didUpdateTitle:*(void *)(a1 + 40)];
}

void __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
}

void __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke_3;
  v2[3] = &unk_2646036E8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 notificationExtension:*(void *)(a1 + 32) didUpdateNotificationActions:*(void *)(a1 + 40)];
}

@end