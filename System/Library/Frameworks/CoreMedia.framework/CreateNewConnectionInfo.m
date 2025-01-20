@interface CreateNewConnectionInfo
@end

@implementation CreateNewConnectionInfo

void __figXPC_CreateNewConnectionInfo_block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(void *)(a1 + 32) + 216), ".Operation");
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 216);
  CFStringRef theString = 0;
  v19 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v21 = 0u;
  unsigned int v5 = xpc_dictionary_get_uint64(v4, ".Operation");
  FigXPCMessageCopyCFString(v4, ".PropertyName", &theString);
  if (theString) {
    CFStringGetCString(theString, buffer, 128, 0);
  }
  v6 = (const char *)(v3 + 32);
  int v7 = OpCodeChar(v5, 3u);
  int v8 = OpCodeChar(v5, 2u);
  int v9 = OpCodeChar(v5, 1u);
  int v10 = OpCodeChar(v5, 0);
  asprintf(&v19, "Server %s Opcode '%c%c%c%c' %s", v6, v7, v8, v9, v10, buffer);
  v11 = v19;
  if ((uint64 & 0x200000000) == 0)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    context = dispatch_get_context(*(dispatch_object_t *)(v12 + 192));
    if (context)
    {
      v14 = context;
      remote_connection = xpc_dictionary_get_remote_connection(context);
      xpc_connection_send_message(remote_connection, v14);
      xpc_release(v14);
      dispatch_set_context(*(dispatch_object_t *)(*(void *)(a1 + 32) + 192), 0);
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if (*(void *)(v12 + 224))
    {
      uint64_t v16 = *(unsigned int *)(v12 + 160);
      pid_t v17 = getpid();
      *(void *)buffer = 0;
      FigSimpleMutexLock((pthread_mutex_t *)gSelfTerminationLock);
      FigServer_CopyProcessName(v16, (CFStringRef *)buffer);
      if (*(void *)buffer)
      {
        CFRelease(*(CFTypeRef *)buffer);
        *(void *)buffer = 0;
      }
      FigRPCServer_TimeoutCrashReport(v16, v11);
      kill(v17, 9);
    }
  }
  free(v11);
}

@end