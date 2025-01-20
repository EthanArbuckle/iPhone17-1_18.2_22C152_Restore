@interface AVChapterMetadataItem
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (AVChapterMetadataItem)init;
- (BOOL)_valueForKeyDependsOnMetadataValue:(id)a3;
- (id)_initWithAsset:(id)a3 chapterGroupIndex:(int64_t)a4 chapterIndex:(int64_t)a5 chapterType:(id)a6 extendedLanguageTag:(id)a7 languageCode:(id)a8 chapterDataType:(id)a9 time:(id *)a10 duration:(id *)a11;
- (id)commonKey;
- (id)dataType;
- (id)description;
- (id)extendedLanguageTag;
- (id)extraAttributes;
- (id)key;
- (id)keySpace;
- (id)languageCode;
- (id)locale;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)startDate;
- (id)value;
- (int64_t)_chapterGroupIndex;
- (int64_t)_chapterIndex;
- (int64_t)_valueStatus;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (void)_addFigAssetNotifications;
- (void)_ensureValueLoadedSync;
- (void)_removeFigAssetNotifications;
- (void)_setValueStatus:(int64_t)a3 figErrorCode:(int)a4;
- (void)_takeValueFrom:(id)a3;
- (void)cancelLoading;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation AVChapterMetadataItem

- (AVChapterMetadataItem)init
{
  long long v5 = *MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v3 = v5;
  uint64_t v4 = v6;
  return (AVChapterMetadataItem *)[(AVChapterMetadataItem *)self _initWithAsset:0 chapterGroupIndex:0 chapterIndex:0 chapterType:0 extendedLanguageTag:0 languageCode:0 chapterDataType:0 time:&v5 duration:&v3];
}

- (id)_initWithAsset:(id)a3 chapterGroupIndex:(int64_t)a4 chapterIndex:(int64_t)a5 chapterType:(id)a6 extendedLanguageTag:(id)a7 languageCode:(id)a8 chapterDataType:(id)a9 time:(id *)a10 duration:(id *)a11
{
  v27.receiver = self;
  v27.super_class = (Class)AVChapterMetadataItem;
  v17 = [(AVMetadataItem *)&v27 init];
  if (v17)
  {
    v18 = objc_alloc_init(AVChapterMetadataItemInternal);
    v17->_privChapter = v18;
    if (!a6) {
      goto LABEL_17;
    }
    if (!a3) {
      goto LABEL_17;
    }
    if (!v18) {
      goto LABEL_17;
    }
    CFRetain(v18);
    v17->_privChapter->readWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avchaptermetadataitem");
    if (!v17->_privChapter->readWriteQueue) {
      goto LABEL_17;
    }
    v17->_privChapter->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v17];
    v17->_privChapter->chapterGroupIndex = a4;
    v17->_privChapter->chapterIndex = a5;
    v17->_privChapter->chapterType = (NSString *)a6;
    if (a7 || !a8)
    {
      if (a7)
      {
        v20 = a10;
        if (!a8) {
          a8 = (id)AVLanguageCodeFromExtendedLanguageTag(a7);
        }
LABEL_15:
        v17->_privChapter->extendedLanguageTag = (NSString *)[a7 copy];
        v17->_privChapter->languageCode = (NSString *)[a8 copy];
        v17->_privChapter->chapterDataType = (NSString *)[a9 copy];
        privChapter = v17->_privChapter;
        int64_t var3 = v20->var3;
        *(_OWORD *)&privChapter->time.value = *(_OWORD *)&v20->var0;
        privChapter->time.epoch = var3;
        v23 = v17->_privChapter;
        long long v24 = *(_OWORD *)&a11->var0;
        v23->duration.epoch = a11->var3;
        *(_OWORD *)&v23->duration.value = v24;
        v25 = (const void *)[a3 _figAsset];
        if (v25)
        {
          v17->_privChapter->figAsset = (OpaqueFigAsset *)CFRetain(v25);
          [(AVChapterMetadataItem *)v17 _addFigAssetNotifications];
          v17->_privChapter->completions = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
          return v17;
        }
LABEL_17:

        return 0;
      }
    }
    else
    {
      ISO639_1FromISO639_2T = (void *)FigMetadataGetISO639_1FromISO639_2T();
      if (ISO639_1FromISO639_2T) {
        a7 = ISO639_1FromISO639_2T;
      }
      else {
        a7 = a8;
      }
    }
    v20 = a10;
    goto LABEL_15;
  }
  return v17;
}

- (void)_addFigAssetNotifications
{
  if (self->_privChapter->figAsset)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    CFRetain(self->_privChapter->weakReference);
    [v3 addListenerWithWeakReference:self->_privChapter->weakReference callback:chapterItem_handleFigChapterLoadingNotification name:*MEMORY[0x1E4F31EB8] object:self->_privChapter->figAsset flags:0];
    [v3 addListenerWithWeakReference:self->_privChapter->weakReference callback:chapterItem_handleFigChapterLoadingNotification name:*MEMORY[0x1E4F31EB0] object:self->_privChapter->figAsset flags:0];
    privChapter = self->_privChapter;
    uint64_t v5 = *MEMORY[0x1E4F31EE8];
    weakReference = privChapter->weakReference;
    figAsset = privChapter->figAsset;
    [v3 addListenerWithWeakReference:weakReference callback:chapterItem_handleFigChapterLoadingNotification name:v5 object:figAsset flags:0];
  }
}

- (void)_removeFigAssetNotifications
{
  if (self->_privChapter->figAsset)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v3 removeListenerWithWeakReference:self->_privChapter->weakReference callback:chapterItem_handleFigChapterLoadingNotification name:*MEMORY[0x1E4F31EB8] object:self->_privChapter->figAsset];
    [v3 removeListenerWithWeakReference:self->_privChapter->weakReference callback:chapterItem_handleFigChapterLoadingNotification name:*MEMORY[0x1E4F31EB0] object:self->_privChapter->figAsset];
    [v3 removeListenerWithWeakReference:self->_privChapter->weakReference callback:chapterItem_handleFigChapterLoadingNotification name:*MEMORY[0x1E4F31EE8] object:self->_privChapter->figAsset];
    weakReference = self->_privChapter->weakReference;
    CFRelease(weakReference);
  }
}

- (void)dealloc
{
  if (self->_privChapter)
  {
    [(AVChapterMetadataItem *)self _removeFigAssetNotifications];
    privChapter = self->_privChapter;
    figAsset = privChapter->figAsset;
    if (figAsset)
    {
      CFRelease(figAsset);
      privChapter = self->_privChapter;
    }
    readWriteQueue = privChapter->readWriteQueue;
    if (readWriteQueue)
    {
      dispatch_release(readWriteQueue);
      privChapter = self->_privChapter;
    }

    CFRelease(self->_privChapter);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVChapterMetadataItem;
  [(AVMetadataItem *)&v6 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[AVMutableMetadataItem allocWithZone:a3];
  id v5 = [(AVMetadataItem *)self _figMetadataDictionaryWithValue:1 diviningValueDataType:0];
  return [(AVMetadataItem *)v4 _initWithFigMetadataDictionary:v5];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  privChapter = self->_privChapter;
  long long v11 = *(_OWORD *)&privChapter->chapterType;
  value = privChapter->value;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime time = (CMTime)privChapter->time;
  CFStringRef v9 = (id)CMTimeCopyDescription(v8, &time);
  CMTime time = (CMTime)self->_privChapter->duration;
  return (id)[v3 stringWithFormat:@"<%@: %p, chapterType=%@, locale identifier=%@, value=%@, time=%@, duration=%@, extras=%@>", v5, self, v11, value, v9, (id)CMTimeCopyDescription(v8, &time), self->super._priv->extras];
}

- (id)key
{
  return self->_privChapter->chapterType;
}

- (id)commonKey
{
  return self->_privChapter->chapterType;
}

- (id)keySpace
{
  return (id)*MEMORY[0x1E4F32FA8];
}

- (id)locale
{
  if (self->_privChapter->extendedLanguageTag) {
    return (id)objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:");
  }
  else {
    return 0;
  }
}

- (id)extendedLanguageTag
{
  return self->_privChapter->extendedLanguageTag;
}

- (id)languageCode
{
  return self->_privChapter->languageCode;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 80);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 104);
  return self;
}

- (id)startDate
{
  return 0;
}

- (id)value
{
  [(AVChapterMetadataItem *)self _ensureValueLoadedSync];
  id v3 = self->_privChapter->value;
  return v3;
}

- (id)dataType
{
  return self->_privChapter->chapterDataType;
}

- (void)_takeValueFrom:(id)a3
{
  id v5 = [(AVChapterMetadataItem *)self commonKey];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F32F98]];
  CFTypeID v7 = CFGetTypeID(a3);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v6)
  {
    if (v7 == TypeID)
    {
      CFStringRef v9 = [a3 objectForKey:*MEMORY[0x1E4F32858]];
      v10 = v9;
      if (!v9) {
        goto LABEL_11;
      }
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == CFDataGetTypeID())
      {
        v10 = CFRetain(v10);
        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
  if (v7 != TypeID)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v12 = [a3 objectForKey:*MEMORY[0x1E4F328A8]];
  v10 = v12;
  if (v12)
  {
    CFTypeID v13 = CFGetTypeID(v12);
    if (v13 == CFStringGetTypeID()) {
      v10 = CFRetain(v10);
    }
    else {
      v10 = 0;
    }
  }
  v14 = (const void *)[a3 objectForKey:*MEMORY[0x1E4F328A0]];
  if (v14)
  {
    v15 = v14;
    CFTypeID v16 = CFGetTypeID(v14);
    if (v16 == CFStringGetTypeID())
    {
      CFTypeRef v17 = (id)CFRetain(v15);

      id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      self->super._priv->extras = (NSDictionary *)objc_msgSend(v18, "initWithObjectsAndKeys:", v17, *MEMORY[0x1E4F33018], 0);
    }
  }
LABEL_11:

  self->_privChapter->value = v10;
  [(AVChapterMetadataItem *)self _setValueStatus:2 figErrorCode:0];
}

- (id)extraAttributes
{
  id v3 = [(AVChapterMetadataItem *)self commonKey];
  if (([v3 isEqualToString:*MEMORY[0x1E4F32F98]] & 1) == 0) {
    [(AVChapterMetadataItem *)self _ensureValueLoadedSync];
  }
  v5.receiver = self;
  v5.super_class = (Class)AVChapterMetadataItem;
  return [(AVMetadataItem *)&v5 extraAttributes];
}

- (int64_t)_chapterGroupIndex
{
  return self->_privChapter->chapterGroupIndex;
}

- (int64_t)_chapterIndex
{
  return self->_privChapter->chapterIndex;
}

- (BOOL)_valueForKeyDependsOnMetadataValue:(id)a3
{
  if (!a3) {
    goto LABEL_6;
  }
  if ([a3 isEqualToString:@"value"])
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  uint64_t v7 = [a3 rangeOfString:@"Value" options:14];
  LOBYTE(v5) = 1;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL && !v6)
  {
LABEL_6:
    int v5 = [a3 isEqualToString:@"extraAttributes"];
    if (v5)
    {
      id v8 = [(AVChapterMetadataItem *)self commonKey];
      LOBYTE(v5) = [v8 isEqualToString:*MEMORY[0x1E4F32F98]] ^ 1;
    }
  }
  return v5;
}

- (int64_t)_valueStatus
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  privChapter = self->_privChapter;
  uint64_t v10 = 0;
  readWriteQueue = privChapter->readWriteQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__AVChapterMetadataItem__valueStatus__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  av_readwrite_dispatch_queue_read(readWriteQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __37__AVChapterMetadataItem__valueStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 16)
                                                                              + 128);
  return result;
}

- (void)_setValueStatus:(int64_t)a3 figErrorCode:(int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  uint64_t v22 = 0;
  if (a3)
  {
    readWriteQueue = self->_privChapter->readWriteQueue;
    if (a3 == 1)
    {
      int v5 = v16;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__AVChapterMetadataItem__setValueStatus_figErrorCode___block_invoke;
      v16[3] = &unk_1E57B2160;
      v16[4] = self;
    }
    else
    {
      int v5 = block;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__AVChapterMetadataItem__setValueStatus_figErrorCode___block_invoke_2;
      block[3] = &unk_1E57B2DA0;
      block[4] = self;
      block[6] = a3;
      int v15 = a4;
    }
    v5[5] = &v17;
    av_readwrite_dispatch_queue_write(readWriteQueue, v5);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = (void *)v18[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))();
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
      }
      while (v7);
    }
  }
  _Block_object_dispose(&v17, 8);
}

uint64_t __54__AVChapterMetadataItem__setValueStatus_figErrorCode___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 16);
  uint64_t v2 = *(void *)(v1 + 128);
  if (v2)
  {
    if (v2 >= 2)
    {
      uint64_t v3 = result;
      *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = [*(id *)(v1 + 144) copy];
      int64_t v4 = *(void **)(*(void *)(*(void *)(v3 + 32) + 16) + 144);
      return [v4 removeAllObjects];
    }
  }
  else
  {
    *(void *)(v1 + 128) = 1;
  }
  return result;
}

uint64_t __54__AVChapterMetadataItem__setValueStatus_figErrorCode___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 16);
  if (*(uint64_t *)(v3 + 128) <= 1)
  {
    *(void *)(v3 + 128) = *(void *)(a1 + 48);
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 48) == 3)
    {
      *(_DWORD *)(*(void *)(v2 + 16) + 136) = *(_DWORD *)(a1 + 56);
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(v2 + 16) + 144) copy];
  int64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 16) + 144);
  return [v4 removeAllObjects];
}

- (void)_ensureValueLoadedSync
{
  if ([(AVChapterMetadataItem *)self _valueStatus] <= 1)
  {
    CFTypeRef cf = 0;
    privChapter = self->_privChapter;
    figAsset = privChapter->figAsset;
    if (figAsset)
    {
      int64_t chapterGroupIndex = privChapter->chapterGroupIndex;
      int64_t chapterIndex = privChapter->chapterIndex;
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      long long v10 = *(uint64_t (**)(OpaqueFigAsset *, int64_t, int64_t, uint64_t, CFTypeRef *))(v8 + 56);
      if (v10)
      {
        uint64_t v9 = v10(figAsset, chapterGroupIndex, chapterIndex, 1, &cf);
        if (!v9)
        {
          -[AVChapterMetadataItem _takeValueFrom:](self, "_takeValueFrom:", objc_msgSend((id)cf, "objectAtIndex:", 0, v9));
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v9 = 4294954514;
      }
    }
    else
    {
      uint64_t v9 = 4294955126;
    }
    [(AVChapterMetadataItem *)self _setValueStatus:3 figErrorCode:v9];
LABEL_12:
    if (cf) {
      CFRelease(cf);
    }
  }
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  if (![(AVChapterMetadataItem *)self _valueForKeyDependsOnMetadataValue:a3]) {
    return 2;
  }
  int64_t result = [(AVChapterMetadataItem *)self _valueStatus];
  if (a4)
  {
    if (result == 3)
    {
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(self->_privChapter->valueErrorCode, 0);
      return 3;
    }
  }
  return result;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  if ([(AVChapterMetadataItem *)self _valueStatus] >= 2)
  {
    if (a4)
    {
      uint64_t v7 = (void (*)(id))*((void *)a4 + 2);
      v7(a4);
    }
    return;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__AVChapterMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke;
  v21[3] = &unk_1E57B2D08;
  v21[4] = self;
  v21[5] = a3;
  if (objc_msgSend((id)objc_msgSend(a3, "indexesOfObjectsPassingTest:", v21), "count"))
  {
    if (a4)
    {
      uint64_t v8 = (void *)[a4 copy];
      readWriteQueue = self->_privChapter->readWriteQueue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __75__AVChapterMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_2;
      v20[3] = &unk_1E57B2098;
      v20[4] = self;
      v20[5] = v8;
      av_readwrite_dispatch_queue_write(readWriteQueue, v20);
    }
    privChapter = self->_privChapter;
    figAsset = privChapter->figAsset;
    if (figAsset)
    {
      int64_t chapterGroupIndex = privChapter->chapterGroupIndex;
      int64_t chapterIndex = privChapter->chapterIndex;
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v17 = *(uint64_t (**)(OpaqueFigAsset *, int64_t, int64_t, uint64_t))(v15 + 64);
      if (v17)
      {
        uint64_t v16 = v17(figAsset, chapterGroupIndex, chapterIndex, 1);
        if (!v16)
        {
          id v18 = self;
          uint64_t v19 = 1;
LABEL_21:
          [(AVChapterMetadataItem *)v18 _setValueStatus:v19 figErrorCode:v16];
          return;
        }
      }
      else
      {
        uint64_t v16 = 4294954514;
      }
    }
    else
    {
      uint64_t v16 = 4294955126;
    }
    id v18 = self;
    uint64_t v19 = 3;
    goto LABEL_21;
  }
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

uint64_t __75__AVChapterMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
  return [v1 _valueForKeyDependsOnMetadataValue:v2];
}

uint64_t __75__AVChapterMetadataItem_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 144) addObject:*(void *)(a1 + 40)];
}

- (void)cancelLoading
{
}

@end