@interface APMRNowPlayingControllerDelegate
- (APMRNowPlayingControllerDelegate)initWithMetadataSource:(OpaqueAPMetadataSource *)a3;
- (void)controller:(id)a3 clientPropertiesDidChangeFrom:(id)a4 to:(id)a5;
- (void)controller:(id)a3 contentItemsDidUpdateWithContentItemChanges:(id)a4;
- (void)controller:(id)a3 didLoadArtworkForContentItems:(id)a4;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controller:(id)a3 playbackQueueDidChangeFrom:(id)a4 to:(id)a5;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)controller:(id)a3 playerPathDidChange:(id)a4;
- (void)controller:(id)a3 supportedCommandsDidChangeFrom:(id)a4 to:(id)a5;
- (void)dealloc;
- (void)flushMetadata;
- (void)notifyContentItemUpdates:(id)a3;
- (void)notifyNewContentItems:(id)a3;
- (void)notifyNewNowPlayingClient:(id)a3;
- (void)notifyNewPlaybackState:(unsigned int)a3;
- (void)notifyNewProxiableSupportedCommands:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation APMRNowPlayingControllerDelegate

- (APMRNowPlayingControllerDelegate)initWithMetadataSource:(OpaqueAPMetadataSource *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)APMRNowPlayingControllerDelegate;
  v4 = [(APMRNowPlayingControllerDelegate *)&v10 init];
  if (v4)
  {
    v4->_metadataSource = (OpaqueAPMetadataSource *)CFRetain(a3);
    v5 = (void *)[objc_alloc((Class)getMRNowPlayingControllerConfigurationClass[0]()) initWithDestination:a3->var11];
    v6 = v5;
    if (!v5) {
      goto LABEL_7;
    }
    [v5 setRequestPlaybackState:1];
    [v6 setRequestSupportedCommands:1];
    [v6 setRequestClientProperties:1];
    v7 = (void *)[(Class)getMRPlaybackQueueRequestClass[0]() defaultPlaybackQueueRequest];
    [v7 setArtworkHeight:600.0];
    [v7 setArtworkWidth:600.0];
    [v6 setPlaybackQueueRequest:v7];
    v8 = (MRNowPlayingController *)[objc_alloc(getMRNowPlayingControllerClass()) initWithConfiguration:v6];
    v4->_nowPlayingController = v8;
    if (v8)
    {
      [(MRNowPlayingController *)v8 setDelegate:v4];
    }
    else
    {
LABEL_7:
      APSLogErrorAt();

      v4 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v4;
}

- (void)dealloc
{
  metadataSource = self->_metadataSource;
  if (metadataSource)
  {
    CFRelease(metadataSource);
    self->_metadataSource = 0;
  }

  self->_nowPlayingController = 0;
  v4.receiver = self;
  v4.super_class = (Class)APMRNowPlayingControllerDelegate;
  [(APMRNowPlayingControllerDelegate *)&v4 dealloc];
}

- (void)start
{
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)stop
{
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)flushMetadata
{
  metadataSource = self->_metadataSource;
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRetain(metadataSource);
  var1 = metadataSource->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__APMRNowPlayingControllerDelegate_flushMetadata__block_invoke;
  block[3] = &unk_1E6890F40;
  block[4] = self;
  block[5] = metadataSource;
  dispatch_async(var1, block);
}

void __49__APMRNowPlayingControllerDelegate_flushMetadata__block_invoke(uint64_t a1)
{
  if (gLogCategory_APMetadataSource <= 40
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 88);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 88) = 0;
  }
  v3 = *(void **)(a1 + 40);
  CFDictionaryRef Empty = (const __CFDictionary *)CFDictionaryGetEmpty();
  metadataSource_handleNowPlayingInfoChangedInternal(v3, Empty, @"replace", 1);
  metadataSource_handleMRPlaybackStateChangedInternal(*(void **)(a1 + 40));
  metadataSource_handleMRSupportedCommandsChangedInternal(*(void **)(a1 + 40), MEMORY[0x1E4F1CBF0]);
  v5 = *(void **)(a1 + 40);
  uint64_t v6 = [(Class)getMRClientClass[0]() localClient];
  metadataSource_handleNowPlayingClientChangedInternal(v5, v6);
  v7 = *(const void **)(a1 + 40);
  CFRelease(v7);
}

- (void)notifyNewContentItems:(id)a3
{
  metadataSource = self->_metadataSource;
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    v9 = metadataSource;
    id v10 = a3;
    LogPrintF();
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "firstObject", v9, v10), "copy");
  if (v6)
  {
    CFRetain(metadataSource);
    id v7 = v6;
    var1 = metadataSource->var1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__APMRNowPlayingControllerDelegate_notifyNewContentItems___block_invoke;
    block[3] = &unk_1E6890F68;
    block[4] = self;
    block[5] = v6;
    void block[6] = metadataSource;
    dispatch_async(var1, block);
  }
}

void __58__APMRNowPlayingControllerDelegate_notifyNewContentItems___block_invoke(uint64_t a1)
{
  if (gLogCategory_APMetadataSource <= 40
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void *)(v2 + 88);
    uint64_t v10 = [*(id *)(a1 + 40) identifier];
    uint64_t v6 = v2;
    LogPrintF();
  }
  v3 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 88);
  objc_super v4 = (const void *)objc_msgSend(*(id *)(a1 + 40), "identifier", v6, v8, v10);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 88) = v4;
  if (v4) {
    CFRetain(v4);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void *)(a1 + 40);
    LogPrintF();
  }
  metadataSource_handleNowPlayingInfoChangedInternal(*(void **)(a1 + 48), (CFDictionaryRef)objc_msgSend(*(id *)(a1 + 40), "nowPlayingInfo", v7, v9), @"replace", 0);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v5 = *(void **)(a1 + 40);
}

- (void)notifyContentItemUpdates:(id)a3
{
  metadataSource = self->_metadataSource;
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a3 copyItems:1];
  if (v6)
  {
    CFRetain(metadataSource);
    id v7 = v6;
    var1 = metadataSource->var1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__APMRNowPlayingControllerDelegate_notifyContentItemUpdates___block_invoke;
    block[3] = &unk_1E6890F90;
    block[4] = a3;
    block[5] = self;
    void block[6] = v6;
    void block[7] = metadataSource;
    dispatch_async(var1, block);
  }
  else
  {
    APSLogErrorAt();
  }
}

void __61__APMRNowPlayingControllerDelegate_notifyContentItemUpdates___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 56) + 88))
  {
    CFArrayRef v2 = *(const __CFArray **)(a1 + 32);
    if (v2)
    {
      CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 32));
      if (Count >= 1)
      {
        CFIndex v4 = Count;
        CFIndex v5 = 0;
        while (1)
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v2, v5);
          [ValueAtIndex identifier];
          if (FigCFEqual()) {
            break;
          }
          if (v4 == ++v5) {
            goto LABEL_14;
          }
        }
        if (ValueAtIndex)
        {
          if (gLogCategory_APMetadataSource <= 30
            && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
          {
            uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v9 = ValueAtIndex;
            LogPrintF();
          }
          metadataSource_handleNowPlayingInfoChangedInternal(*(void **)(a1 + 56), (CFDictionaryRef)objc_msgSend(ValueAtIndex, "nowPlayingInfo", v8, v9), @"update", 0);
        }
      }
    }
    else
    {
      APSLogErrorAt();
    }
  }
LABEL_14:
  CFRelease(*(CFTypeRef *)(a1 + 56));
  id v7 = *(void **)(a1 + 48);
}

- (void)notifyNewPlaybackState:(unsigned int)a3
{
  metadataSource = self->_metadataSource;
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRetain(metadataSource);
  var1 = metadataSource->var1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__APMRNowPlayingControllerDelegate_notifyNewPlaybackState___block_invoke;
  block[3] = &__block_descriptor_44_e5_v8__0l;
  block[4] = metadataSource;
  unsigned int v7 = a3;
  dispatch_async(var1, block);
}

void __59__APMRNowPlayingControllerDelegate_notifyNewPlaybackState___block_invoke(uint64_t a1)
{
  metadataSource_handleMRPlaybackStateChangedInternal(*(void **)(a1 + 32));
  CFArrayRef v2 = *(const void **)(a1 + 32);
  CFRelease(v2);
}

- (void)notifyNewProxiableSupportedCommands:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    metadataSource = self->_metadataSource;
    if (gLogCategory_APMetadataSource <= 30
      && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
    {
      unsigned int v7 = metadataSource;
      uint64_t v8 = [v3 count];
      LogPrintF();
    }
    id v3 = (id)objc_msgSend(v3, "copy", v7, v8);
    if (v3)
    {
      CFRetain(metadataSource);
      id v5 = v3;
      var1 = metadataSource->var1;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__APMRNowPlayingControllerDelegate_notifyNewProxiableSupportedCommands___block_invoke;
      block[3] = &unk_1E6890F40;
      block[4] = v3;
      void block[5] = metadataSource;
      dispatch_async(var1, block);
    }
    else
    {
      APSLogErrorAt();
    }
  }
}

void __72__APMRNowPlayingControllerDelegate_notifyNewProxiableSupportedCommands___block_invoke(uint64_t a1)
{
  metadataSource_handleMRSupportedCommandsChangedInternal(*(void **)(a1 + 40), *(CFArrayRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFArrayRef v2 = *(void **)(a1 + 32);
}

- (void)notifyNewNowPlayingClient:(id)a3
{
  if (a3)
  {
    metadataSource = self->_metadataSource;
    if (gLogCategory_APMetadataSource <= 30
      && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = metadataSource;
      id v9 = a3;
      LogPrintF();
    }
    id v5 = objc_msgSend(a3, "copy", v8, v9);
    if (v5)
    {
      CFRetain(metadataSource);
      id v6 = v5;
      var1 = metadataSource->var1;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__APMRNowPlayingControllerDelegate_notifyNewNowPlayingClient___block_invoke;
      block[3] = &unk_1E6890F68;
      void block[5] = v5;
      void block[6] = metadataSource;
      block[4] = a3;
      dispatch_async(var1, block);
    }
    else
    {
      APSLogErrorAt();
    }
  }
  else
  {
    APSLogErrorAt();
    id v5 = 0;
  }
}

void __62__APMRNowPlayingControllerDelegate_notifyNewNowPlayingClient___block_invoke(uint64_t a1)
{
  metadataSource_handleNowPlayingClientChangedInternal(*(void **)(a1 + 48), *(void *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFArrayRef v2 = *(void **)(a1 + 40);
}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  uint64_t v6 = objc_msgSend(a4, "playbackState", a3);
  unsigned int v7 = (void *)[a4 proxiableSupportedCommands];
  uint64_t v8 = [a4 clientProperties];
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    metadataSource = self->_metadataSource;
    uint64_t v10 = [v7 count];
    if (gLogCategory_APMetadataSource > 40) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize() != 0;
    }
    BOOL v16 = v11;
    uint64_t v17 = [a4 playbackQueue];
    uint64_t v14 = v10;
    uint64_t v15 = v8;
    v12 = metadataSource;
    uint64_t v13 = v6;
    LogPrintF();
  }
  -[APMRNowPlayingControllerDelegate notifyNewContentItems:](self, "notifyNewContentItems:", objc_msgSend((id)objc_msgSend(a4, "playbackQueue", v12, v13, v14, v15, v16, v17), "contentItems"));
  [(APMRNowPlayingControllerDelegate *)self notifyNewPlaybackState:v6];
  [(APMRNowPlayingControllerDelegate *)self notifyNewProxiableSupportedCommands:v7];
  [(APMRNowPlayingControllerDelegate *)self notifyNewNowPlayingClient:v8];
}

- (void)controller:(id)a3 playbackQueueDidChangeFrom:(id)a4 to:(id)a5
{
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    metadataSource = self->_metadataSource;
    id v9 = a5;
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend(a5, "contentItems", metadataSource, v9);
  [(APMRNowPlayingControllerDelegate *)self notifyNewContentItems:v7];
}

- (void)controller:(id)a3 contentItemsDidUpdateWithContentItemChanges:(id)a4
{
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(APMRNowPlayingControllerDelegate *)self notifyContentItemUpdates:a4];
}

- (void)controller:(id)a3 didLoadArtworkForContentItems:(id)a4
{
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    metadataSource = self->_metadataSource;
    id v9 = a4;
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "response", metadataSource, v9), "playbackQueue"), "contentItems");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__APMRNowPlayingControllerDelegate_controller_didLoadArtworkForContentItems___block_invoke;
  v10[3] = &unk_1E6890FB8;
  v10[4] = a4;
  -[APMRNowPlayingControllerDelegate notifyContentItemUpdates:](self, "notifyContentItemUpdates:", objc_msgSend(v7, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v10)));
}

BOOL __77__APMRNowPlayingControllerDelegate_controller_didLoadArtworkForContentItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend(a2, "identifier")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(APMRNowPlayingControllerDelegate *)self notifyNewPlaybackState:v5];
}

- (void)controller:(id)a3 supportedCommandsDidChangeFrom:(id)a4 to:(id)a5
{
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    metadataSource = self->_metadataSource;
    LogPrintF();
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "response", metadataSource), "proxiableSupportedCommands");
  [(APMRNowPlayingControllerDelegate *)self notifyNewProxiableSupportedCommands:v7];
}

- (void)controller:(id)a3 clientPropertiesDidChangeFrom:(id)a4 to:(id)a5
{
  if (gLogCategory_APMetadataSource <= 30
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(APMRNowPlayingControllerDelegate *)self notifyNewNowPlayingClient:a5];
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  if (gLogCategory_APMetadataSource <= 50
    && (gLogCategory_APMetadataSource != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(APMRNowPlayingControllerDelegate *)self flushMetadata];
}

@end