@interface UNMutableNotificationCommunicationContext
@end

@implementation UNMutableNotificationCommunicationContext

intptr_t __101___UNMutableNotificationCommunicationContext_UserNotifications_INIntent__mutableContextFromINIntent___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [a2 _identifier];
  uint64_t v5 = [v3 URLWithString:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v8);
}

@end