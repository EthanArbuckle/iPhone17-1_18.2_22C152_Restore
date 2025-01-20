@interface MediaControlClientNowPlayingInfoDidChange
@end

@implementation MediaControlClientNowPlayingInfoDidChange

void ___MediaControlClientNowPlayingInfoDidChange_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  int v3 = gLogCategory_MediaControlClientMetaData;
  if (!theDict)
  {
    if (gLogCategory_MediaControlClientMetaData <= 40
      && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v9 = *(void *)(a1 + 32);
    CFDictionaryRef v10 = 0;
    goto LABEL_33;
  }
  if (gLogCategory_MediaControlClientMetaData <= 10)
  {
    if (gLogCategory_MediaControlClientMetaData != -1) {
      goto LABEL_4;
    }
    int v5 = _LogCategory_Initialize();
    int v3 = gLogCategory_MediaControlClientMetaData;
    if (v5)
    {
      if (gLogCategory_MediaControlClientMetaData > 10) {
        goto LABEL_26;
      }
LABEL_4:
      if (v3 != -1 || _LogCategory_Initialize()) {
        goto LABEL_18;
      }
      goto LABEL_26;
    }
  }
  if (v3 <= 40 && (v3 != -1 || _LogCategory_Initialize()))
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54B58]);
    if (Value)
    {
      CFDataRef v7 = Value;
      CFTypeID v8 = CFGetTypeID(Value);
      if (v8 == CFDataGetTypeID()) {
        CFDataGetLength(v7);
      }
    }
    if (gLogCategory_MediaControlClientMetaData <= 40
      && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
    {
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54B48]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54B38]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54C18]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54C40]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54C38]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54BA0]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54B98]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54B68]);
LABEL_18:
      LogPrintF();
    }
  }
LABEL_26:
  if (CFDictionaryGetCount(theDict) != 2
    || !CFDictionaryGetInt64()
    || !CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x263F54C10]))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    CFDictionaryRef v10 = theDict;
LABEL_33:
    _MediaControlClientNowPlayingUpdate(v9, v10);
    goto LABEL_34;
  }
  if (gLogCategory_MediaControlClientMetaData <= 40
    && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_34:
  v11 = *(const void **)(a1 + 32);
  if (v11)
  {
    CFRelease(v11);
  }
}

@end