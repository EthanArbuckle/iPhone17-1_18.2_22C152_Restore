@interface ServerConnectionDiedNotificationSymbolLoc
@end

@implementation ServerConnectionDiedNotificationSymbolLoc

void *__getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = MediaExperienceLibrary();
  result = dlsym(v2, "AVSystemController_ServerConnectionDiedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVSystemController_ServerConnectionDiedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

@end