@interface CreateRemoteControlSession
@end

@implementation CreateRemoteControlSession

uint64_t __carEndpoint_CreateRemoteControlSession_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 48);
  if (!*(_DWORD *)(v2 + 204))
  {
    if (gLogCategory_APEndpointCarPlay <= 90)
    {
      if (gLogCategory_APEndpointCarPlay != -1 || (result = _LogCategory_Initialize(), result))
      {
        IsAppleInternalBuild();
        result = LogPrintF();
      }
    }
    uint64_t v4 = *(void *)(*(void *)(v1 + 32) + 8);
    int v5 = -17605;
    goto LABEL_18;
  }
  if (*(unsigned char *)(result + 104))
  {
    result = *(void *)(v2 + 440);
    if (result)
    {
      **(void **)(v1 + 72) = CFDictionaryGetValue((CFDictionaryRef)result, **(const void ***)(*(void *)(*(void *)(v1 + 40) + 8) + 24));
      v3 = **(const void ***)(v1 + 72);
      if (v3)
      {
        result = (uint64_t)CFRetain(v3);
        if (gLogCategory_APEndpointCarPlay <= 50)
        {
          if (gLogCategory_APEndpointCarPlay != -1) {
            return LogPrintF();
          }
          result = _LogCategory_Initialize();
          if (result) {
            return LogPrintF();
          }
        }
        return result;
      }
      result = APSLogErrorAt();
    }
    uint64_t v4 = *(void *)(*(void *)(v1 + 32) + 8);
    int v5 = -17606;
LABEL_18:
    *(_DWORD *)(v4 + 24) = v5;
    return result;
  }
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = carEndpoint_createCommChannelInternal(*(const void **)(v1 + 88), *(__CFDictionary **)(v1 + 96), *(CFTypeRef **)(v1 + 72), *(CFTypeRef **)(*(void *)(*(void *)(v1 + 40) + 8)+ 24));
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(unsigned int *)(*(void *)(*(void *)(v1 + 32) + 8) + 24);
  if (result)
  {
    return APSLogErrorAt();
  }
  return result;
}

@end