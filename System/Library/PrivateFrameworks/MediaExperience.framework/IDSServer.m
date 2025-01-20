@interface IDSServer
@end

@implementation IDSServer

uint64_t __cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_block_invoke()
{
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioCategory = [[NSString alloc] initWithString:@"MediaPlayback"];
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioMode = [[NSString alloc] initWithString:@"Default"];
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientPriority = [objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:0];
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldHandoverInterruption = [objc_alloc(MEMORY[0x1E4F28ED0]) initWithBool:0];
  uint64_t result = [[NSString alloc] initWithCString:"Default" encoding:1];
  cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientName = result;
  return result;
}

void __cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_block_invoke_128(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __cmsm_IDSServer_ProcessRemoteInterruptionDoneMessage_block_invoke(uint64_t a1)
{
}

void __cmsm_IDSServer_ProcessRemotePlayingInfoReplyMessage_block_invoke(uint64_t a1)
{
  CMSM_IDSConnection_SetRemotePlayingInfo(*(const __CFArray **)(a1 + 32));
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __cmsm_IDSServer_ProcessUpdateSharedAudioRouteMacAddress_block_invoke(uint64_t a1)
{
  CMSM_IDSConnection_UpdateSharedAudioRouteMacAddressOnLocal(*(const __CFString **)(a1 + 32), *(void *)(a1 + 40) == *MEMORY[0x1E4F1CFD0]);
  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
  }
}

@end