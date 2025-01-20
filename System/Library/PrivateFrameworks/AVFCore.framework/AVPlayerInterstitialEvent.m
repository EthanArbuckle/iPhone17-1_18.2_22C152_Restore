@interface AVPlayerInterstitialEvent
+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem date:(NSDate *)date;
+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem identifier:(NSString *)identifier date:(NSDate *)date templateItems:(NSArray *)templateItems restrictions:(AVPlayerInterstitialEventRestrictions)restrictions resumptionOffset:(CMTime *)resumptionOffset playoutLimit:(CMTime *)playoutLimit userDefinedAttributes:(NSDictionary *)userDefinedAttributes;
+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem identifier:(NSString *)identifier time:(CMTime *)time templateItems:(NSArray *)templateItems restrictions:(AVPlayerInterstitialEventRestrictions)restrictions resumptionOffset:(CMTime *)resumptionOffset playoutLimit:(CMTime *)playoutLimit userDefinedAttributes:(NSDictionary *)userDefinedAttributes;
+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem time:(CMTime *)time;
+ (id)newItemArrayWithCopiedItems:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)plannedDuration;
- (AVPlayerInterstitialEvent)initWithPrimaryItem:(id)a3 identifier:(id)a4 time:(id *)a5 date:(id)a6 templateItems:(id)a7 restrictions:(unint64_t)a8 resumptionOffset:(id *)a9 playoutLimit:(id *)a10 userDefinedAttributes:(id)a11;
- (AVPlayerInterstitialEvent)initWithPrimaryItem:(id)a3 time:(id *)a4 date:(id)a5;
- (AVPlayerInterstitialEvent)initWithPrimaryItemAndFigEvent:(id)a3 templateItems:(id)a4 figEvent:(OpaqueFigPlayerInterstitialEvent *)a5;
- (AVPlayerInterstitialEventCue)cue;
- (AVPlayerInterstitialEventRestrictions)restrictions;
- (AVPlayerItem)primaryItem;
- (BOOL)_participatesInCoordinatedPlayback;
- (BOOL)alignsResumptionWithPrimarySegmentBoundary;
- (BOOL)alignsStartWithPrimarySegmentBoundary;
- (BOOL)contentMayVary;
- (BOOL)isEqual:(id)a3;
- (BOOL)supplementsPrimaryContent;
- (BOOL)validate:(int *)a3;
- (BOOL)willPlayOnce;
- (CMTime)playoutLimit;
- (CMTime)resumptionOffset;
- (CMTime)time;
- (NSArray)templateItems;
- (NSDate)date;
- (NSDictionary)assetListResponse;
- (NSDictionary)userDefinedAttributes;
- (NSString)identifier;
- (OpaqueFigPlayerInterstitialEvent)figEvent;
- (id)_internalTemplateItems;
- (id)assetURLsReturningError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)timelineOccupancy;
- (unint64_t)hash;
- (void)_updateStartOffset;
- (void)checkMutability;
- (void)dealloc;
- (void)setAlignsResumptionWithPrimarySegmentBoundary:(BOOL)alignsResumptionWithPrimarySegmentBoundary;
- (void)setAlignsStartWithPrimarySegmentBoundary:(BOOL)alignsStartWithPrimarySegmentBoundary;
- (void)setContentMayVary:(BOOL)a3;
- (void)setCue:(AVPlayerInterstitialEventCue)cue;
- (void)setDate:(NSDate *)date;
- (void)setIdentifier:(NSString *)identifier;
- (void)setImmutable;
- (void)setPlannedDuration:(id *)a3;
- (void)setPlayoutLimit:(CMTime *)playoutLimit;
- (void)setPrimaryItem:(AVPlayerItem *)primaryItem;
- (void)setRestrictions:(AVPlayerInterstitialEventRestrictions)restrictions;
- (void)setResumptionOffset:(CMTime *)resumptionOffset;
- (void)setSupplementsPrimaryContent:(BOOL)a3;
- (void)setTemplateItems:(NSArray *)templateItems;
- (void)setTime:(CMTime *)time;
- (void)setTimelineOccupancy:(int64_t)a3;
- (void)setUserDefinedAttributes:(NSDictionary *)userDefinedAttributes;
- (void)setWillPlayOnce:(BOOL)willPlayOnce;
@end

@implementation AVPlayerInterstitialEvent

+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem identifier:(NSString *)identifier time:(CMTime *)time templateItems:(NSArray *)templateItems restrictions:(AVPlayerInterstitialEventRestrictions)restrictions resumptionOffset:(CMTime *)resumptionOffset playoutLimit:(CMTime *)playoutLimit userDefinedAttributes:(NSDictionary *)userDefinedAttributes
{
  if ((time->flags & 0x1D) != 1)
  {
    v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)identifier, (uint64_t)time, (uint64_t)templateItems, restrictions, (uint64_t)resumptionOffset, (uint64_t)"CMTIME_IS_NUMERIC(time)"), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  id v16 = objc_alloc((Class)a1);
  CMTime v21 = *time;
  CMTime v20 = *resumptionOffset;
  CMTime v19 = *playoutLimit;
  return (AVPlayerInterstitialEvent *)(id)[v16 initWithPrimaryItem:primaryItem identifier:identifier time:&v21 date:0 templateItems:templateItems restrictions:restrictions resumptionOffset:&v20 playoutLimit:&v19 userDefinedAttributes:userDefinedAttributes];
}

+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem identifier:(NSString *)identifier date:(NSDate *)date templateItems:(NSArray *)templateItems restrictions:(AVPlayerInterstitialEventRestrictions)restrictions resumptionOffset:(CMTime *)resumptionOffset playoutLimit:(CMTime *)playoutLimit userDefinedAttributes:(NSDictionary *)userDefinedAttributes
{
  if (!date)
  {
    v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)identifier, 0, (uint64_t)templateItems, restrictions, (uint64_t)resumptionOffset, (uint64_t)"date != nil"), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  id v16 = objc_alloc((Class)a1);
  long long v21 = *MEMORY[0x1E4F1F9F8];
  uint64_t v22 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  CMTime v20 = *resumptionOffset;
  CMTime v19 = *playoutLimit;
  return (AVPlayerInterstitialEvent *)(id)[v16 initWithPrimaryItem:primaryItem identifier:identifier time:&v21 date:date templateItems:templateItems restrictions:restrictions resumptionOffset:&v20 playoutLimit:&v19 userDefinedAttributes:userDefinedAttributes];
}

- (id)assetURLsReturningError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v18 = 0;
  CMTime v19 = &v18;
  uint64_t v20 = 0x3052000000;
  long long v21 = __Block_byref_object_copy__6;
  uint64_t v22 = __Block_byref_object_dispose__6;
  uint64_t v23 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AVPlayerInterstitialEvent_assetURLsReturningError___block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v18;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = (void *)v19[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "asset"), "_absoluteURL");
        if (!v11)
        {
          v5 = 0;
          if (a3) {
            *a3 = (id)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Template items for interstitial events must employ assets that can be referenced by URL (AVURLAssets)" userInfo:0]);
          }
          goto LABEL_12;
        }
        [v5 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  _Block_object_dispose(&v18, 8);
  return v5;
}

uint64_t __53__AVPlayerInterstitialEvent_assetURLsReturningError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)newItemArrayWithCopiedItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    long long v13 = *MEMORY[0x1E4F1FA48];
    uint64_t v8 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(a3);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = (id)objc_msgSend(v10, "copy", v13);
        if (v10) {
          [v10 currentTime];
        }
        else {
          memset(v18, 0, sizeof(v18));
        }
        long long v16 = v13;
        uint64_t v17 = v8;
        long long v14 = v13;
        uint64_t v15 = v8;
        [v11 seekToTime:v18 toleranceBefore:&v16 toleranceAfter:&v14 completionHandler:0];
        [v4 addObject:v11];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  return v4;
}

- (AVPlayerInterstitialEvent)initWithPrimaryItem:(id)a3 identifier:(id)a4 time:(id *)a5 date:(id)a6 templateItems:(id)a7 restrictions:(unint64_t)a8 resumptionOffset:(id *)a9 playoutLimit:(id *)a10 userDefinedAttributes:(id)a11
{
  v35.receiver = self;
  v35.super_class = (Class)AVPlayerInterstitialEvent;
  long long v16 = [(AVPlayerInterstitialEvent *)&v35 init];
  uint64_t v17 = v16;
  if (v16)
  {
    if (!a6 && (a5->var2 & 0x1D) != 1)
    {
      long long v20 = v16;
      v26 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v17, a2, @"invalid parameter not satisfying: %s", v21, v22, v23, v24, v25, (uint64_t)"date != nil || CMTIME_IS_NUMERIC(time)"), 0 reason userInfo];
      objc_exception_throw(v26);
    }
    v16->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayerinterstitialevent.ivars");
    objc_storeWeak((id *)&v17->_primaryItem, a3);
    v17->_templateItems = (NSArray *)+[AVPlayerInterstitialEvent newItemArrayWithCopiedItems:a7];
    id v34 = 0;
    if ([(AVPlayerInterstitialEvent *)v17 assetURLsReturningError:&v34])
    {
      id v18 = a11;
      if (!a11) {
        id v18 = (id)MEMORY[0x1E4F1CC08];
      }
      long long v32 = *(_OWORD *)&a5->var0;
      int64_t var3 = a5->var3;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v31 = *a9;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v30 = *a10;
      id v29 = v18;
      WORD2(v28) = 256;
      LODWORD(v28) = 0;
      BYTE2(v27) = 0;
      LOWORD(v27) = 0;
      FigPlayerInterstitialEventCreate();
      [(AVPlayerInterstitialEvent *)v17 _updateStartOffset];
    }
    else
    {

      if ([v34 code] == -11999) {
        objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v34, "userInfo"), "objectForKey:", @"AVErrorExceptionKey"));
      }
      return 0;
    }
  }
  return v17;
}

- (AVPlayerInterstitialEvent)initWithPrimaryItem:(id)a3 time:(id *)a4 date:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)AVPlayerInterstitialEvent;
  uint64_t v9 = [(AVPlayerInterstitialEvent *)&v19 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    if (!a5 && (a4->var2 & 0x1D) != 1)
    {
      v12 = v9;
      id v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)p_isa, a2, @"invalid parameter not satisfying: %s", v13, v14, v15, v16, v17, (uint64_t)"date != nil || CMTIME_IS_NUMERIC(time)"), 0 reason userInfo];
      objc_exception_throw(v18);
    }
    v9->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayerinterstitialevent.ivars");
    objc_storeWeak(p_isa + 2, a3);
    FigPlayerInterstitialEventCreate();
  }
  return (AVPlayerInterstitialEvent *)p_isa;
}

+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem time:(CMTime *)time
{
  id v6 = objc_alloc((Class)a1);
  CMTime v8 = *time;
  return (AVPlayerInterstitialEvent *)(id)[v6 initWithPrimaryItem:primaryItem time:&v8 date:0];
}

+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem date:(NSDate *)date
{
  id v6 = objc_alloc((Class)a1);
  long long v8 = *MEMORY[0x1E4F1F9F8];
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return (AVPlayerInterstitialEvent *)(id)[v6 initWithPrimaryItem:primaryItem time:&v8 date:date];
}

- (AVPlayerInterstitialEvent)initWithPrimaryItemAndFigEvent:(id)a3 templateItems:(id)a4 figEvent:(OpaqueFigPlayerInterstitialEvent *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVPlayerInterstitialEvent;
  long long v8 = [(AVPlayerInterstitialEvent *)&v10 init];
  if (v8)
  {
    v8->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayerinterstitialevent.ivars");
    objc_storeWeak((id *)&v8->_primaryItem, a3);
    v8->_templateItems = (NSArray *)[a4 copy];
    v8->_figEvent = (OpaqueFigPlayerInterstitialEvent *)CFRetain(a5);
  }
  return v8;
}

- (void)dealloc
{
  figEvent = self->_figEvent;
  if (figEvent) {
    CFRelease(figEvent);
  }

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerInterstitialEvent;
  [(AVPlayerInterstitialEvent *)&v5 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = FigPlayerInterstitialEventCopyAsDictionary();
  if (!v4) {
    return 0;
  }
  objc_super v5 = (const void *)v4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__6;
  uint64_t v17 = __Block_byref_object_dispose__6;
  uint64_t v18 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerInterstitialEvent_copyWithZone___block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v13;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  p_primaryItem = &self->_primaryItem;
  objc_loadWeak((id *)p_primaryItem);
  FigPlayerInterstitialEventCreateFromDictionary();
  long long v8 = [AVPlayerInterstitialEvent alloc];
  id Weak = objc_loadWeak((id *)p_primaryItem);
  objc_super v10 = [(AVPlayerInterstitialEvent *)v8 initWithPrimaryItemAndFigEvent:Weak templateItems:v14[5] figEvent:0];
  CFRelease(v5);

  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __42__AVPlayerInterstitialEvent_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  objc_super v10 = __Block_byref_object_dispose__6;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerInterstitialEvent_description__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__AVPlayerInterstitialEvent_description__block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t result = [(id)objc_msgSend(v2 stringWithFormat:@"<%@: %p, primaryItem = %p, ctx = %p, templateItems = %p, id = %@>", v4, *(void *)(a1 + 32), objc_loadWeak((id *)(*(void *)(a1 + 32) + 16)), *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 32), objc_msgSend(*(id *)(a1 + 32), "identifier")), "copy"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[AVPlayerItem isEqual:](-[AVPlayerInterstitialEvent primaryItem](self, "primaryItem"), "isEqual:", [a3 primaryItem])&& FigCFEqual();
}

- (unint64_t)hash
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerInterstitialEvent_hash__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AVPlayerInterstitialEvent_hash__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "primaryItem"), "hash");
  CFHashCode v3 = CFHash(*(CFTypeRef *)(*(void *)(a1 + 32) + 24)) ^ v2;
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 ^ result;
  return result;
}

- (void)setImmutable
{
}

- (void)checkMutability
{
  if (FigPlayerInterstitialEventIsImmutable()) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"events returned by AVPlayerInterstitialEventMonitor are not mutable; modify a copy instead",
  }
                               0));
}

- (AVPlayerItem)primaryItem
{
  return (AVPlayerItem *)objc_loadWeak((id *)&self->_primaryItem);
}

- (void)setPrimaryItem:(AVPlayerItem *)primaryItem
{
  [(AVPlayerInterstitialEvent *)self checkMutability];
  objc_storeWeak((id *)&self->_primaryItem, primaryItem);
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA40](figEvent, primaryItem);
}

- (NSString)identifier
{
  uint64_t v2 = (void *)FigPlayerInterstitialEventCopyIdentifier();
  CFHashCode v3 = (NSString *)(id)[v2 copy];
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

- (void)setIdentifier:(NSString *)identifier
{
  [(AVPlayerInterstitialEvent *)self checkMutability];
  id v5 = (id)[(NSString *)identifier copy];
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA08](figEvent, v5);
}

- (CMTime)time
{
  return (CMTime *)MEMORY[0x1F40ED9B8](self->_figEvent, a3);
}

- (void)setTime:(CMTime *)time
{
}

- (NSDate)date
{
  started = (void *)FigPlayerInterstitialEventCopyStartDate();
  CFHashCode v3 = (NSDate *)(id)[started copy];
  if (started) {
    CFRelease(started);
  }
  return v3;
}

- (void)setDate:(NSDate *)date
{
  [(AVPlayerInterstitialEvent *)self checkMutability];
  id v5 = (id)[(NSDate *)date copy];
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA60](figEvent, v5);
}

- (NSArray)templateItems
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  objc_super v10 = __Block_byref_object_dispose__6;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerInterstitialEvent_templateItems__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  CFHashCode v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __42__AVPlayerInterstitialEvent_templateItems__block_invoke(uint64_t a1)
{
  id result = +[AVPlayerInterstitialEvent newItemArrayWithCopiedItems:*(void *)(*(void *)(a1 + 32) + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setTemplateItems:(NSArray *)templateItems
{
  [(AVPlayerInterstitialEvent *)self checkMutability];
  id v5 = +[AVPlayerInterstitialEvent newItemArrayWithCopiedItems:templateItems];
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerInterstitialEvent_setTemplateItems___block_invoke;
  block[3] = &unk_1E57B2098;
  block[4] = self;
  block[5] = v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  id v7 = 0;
  if (![(AVPlayerInterstitialEvent *)self assetURLsReturningError:&v7]
    && [v7 code] == -11999)
  {
    objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v7, "userInfo"), "objectForKey:", @"AVErrorExceptionKey"));
  }
  [(AVPlayerInterstitialEvent *)self _updateStartOffset];
  FigPlayerInterstitialEventSetInterstitialAssetURLs();
}

void __46__AVPlayerInterstitialEvent_setTemplateItems___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 40);
}

- (AVPlayerInterstitialEventRestrictions)restrictions
{
  return FigPlayerInterstitialEventGetRestrictions();
}

- (void)setRestrictions:(AVPlayerInterstitialEventRestrictions)restrictions
{
  [(AVPlayerInterstitialEvent *)self checkMutability];
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA48](figEvent, restrictions);
}

- (CMTime)resumptionOffset
{
  return (CMTime *)MEMORY[0x1F40ED9A8](self->_figEvent, a3);
}

- (void)setResumptionOffset:(CMTime *)resumptionOffset
{
}

- (CMTime)playoutLimit
{
  return (CMTime *)MEMORY[0x1F40ED998](self->_figEvent, a3);
}

- (void)setPlayoutLimit:(CMTime *)playoutLimit
{
}

- (BOOL)alignsStartWithPrimarySegmentBoundary
{
  return FigPlayerInterstitialEventGetSnapOptions() & 1;
}

- (void)setAlignsStartWithPrimarySegmentBoundary:(BOOL)alignsStartWithPrimarySegmentBoundary
{
  BOOL v3 = alignsStartWithPrimarySegmentBoundary;
  [(AVPlayerInterstitialEvent *)self checkMutability];
  uint64_t v5 = FigPlayerInterstitialEventGetSnapOptions() & 0xFFFFFFFE | v3;
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA58](figEvent, v5);
}

- (BOOL)alignsResumptionWithPrimarySegmentBoundary
{
  return (FigPlayerInterstitialEventGetSnapOptions() >> 1) & 1;
}

- (void)setAlignsResumptionWithPrimarySegmentBoundary:(BOOL)alignsResumptionWithPrimarySegmentBoundary
{
  BOOL v3 = alignsResumptionWithPrimarySegmentBoundary;
  [(AVPlayerInterstitialEvent *)self checkMutability];
  int v5 = FigPlayerInterstitialEventGetSnapOptions() & 0xFFFFFFFD;
  if (v3) {
    int v6 = 2;
  }
  else {
    int v6 = 0;
  }
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA58](figEvent, v5 | v6);
}

- (AVPlayerInterstitialEventCue)cue
{
  if (FigPlayerInterstitialEventIsPreRoll()) {
    return (AVPlayerInterstitialEventCue)@"EventJoinCue";
  }
  if (FigPlayerInterstitialEventIsPostRoll()) {
    return (AVPlayerInterstitialEventCue)@"EventLeaveCue";
  }
  return (AVPlayerInterstitialEventCue)@"EventNoCue";
}

- (void)setCue:(AVPlayerInterstitialEventCue)cue
{
  [(AVPlayerInterstitialEvent *)self checkMutability];
  FigPlayerInterstitialEventSetIsPreRoll();
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA20](figEvent, cue == (AVPlayerInterstitialEventCue)@"EventLeaveCue");
}

- (BOOL)willPlayOnce
{
  return FigPlayerInterstitialEventCueOnce() != 0;
}

- (void)setWillPlayOnce:(BOOL)willPlayOnce
{
  BOOL v3 = willPlayOnce;
  [(AVPlayerInterstitialEvent *)self checkMutability];
  figEvent = self->_figEvent;
  MEMORY[0x1F40ED9F0](figEvent, v3);
}

- (NSDictionary)userDefinedAttributes
{
  uint64_t v2 = (void *)FigPlayerInterstitialEventCopyExtraAttributes();
  BOOL v3 = (NSDictionary *)(id)[v2 copy];
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

- (void)setUserDefinedAttributes:(NSDictionary *)userDefinedAttributes
{
  [(AVPlayerInterstitialEvent *)self checkMutability];
  id v5 = (id)[(NSDictionary *)userDefinedAttributes copy];
  figEvent = self->_figEvent;
  MEMORY[0x1F40ED9F8](figEvent, v5);
}

- (NSDictionary)assetListResponse
{
  uint64_t v2 = (void *)FigPlayerInterstitialEventCopyAssetListResponse();
  BOOL v3 = (NSDictionary *)(id)[v2 copy];
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

- (int64_t)timelineOccupancy
{
  return FigPlayerInterstitialEventGetTimelineOccupancy();
}

- (void)setTimelineOccupancy:(int64_t)a3
{
  [(AVPlayerInterstitialEvent *)self checkMutability];
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA78](figEvent, a3);
}

- (BOOL)supplementsPrimaryContent
{
  return FigPlayerInterstitialEventSupplementsPrimaryContent() != 0;
}

- (void)setSupplementsPrimaryContent:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVPlayerInterstitialEvent *)self checkMutability];
  figEvent = self->_figEvent;
  MEMORY[0x1F40EDA70](figEvent, v3);
}

- (BOOL)contentMayVary
{
  return FigPlayerInterstitialEventContentMayVary() != 0;
}

- (void)setContentMayVary:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVPlayerInterstitialEvent *)self checkMutability];
  figEvent = self->_figEvent;
  MEMORY[0x1F40ED9E8](figEvent, v3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)plannedDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1F40ED9C0](self->_figEvent, a3);
}

- (void)setPlannedDuration:(id *)a3
{
}

- (OpaqueFigPlayerInterstitialEvent)figEvent
{
  return self->_figEvent;
}

- (id)_internalTemplateItems
{
  uint64_t v2 = (void *)[(NSArray *)self->_templateItems copy];
  return v2;
}

- (BOOL)validate:(int *)a3
{
  int v4 = FigPlayerInterstitialEventValidate();
  if (a3) {
    *a3 = v4;
  }
  return v4 == 0;
}

- (BOOL)_participatesInCoordinatedPlayback
{
  if ([(AVPlayerInterstitialEvent *)self contentMayVary])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int64_t v3 = [(AVPlayerInterstitialEvent *)self timelineOccupancy];
    if (v3) {
      LOBYTE(v3) = [(AVPlayerInterstitialEvent *)self cue] != (AVPlayerInterstitialEventCue)@"EventJoinCue";
    }
  }
  return v3;
}

- (void)_updateStartOffset
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  objc_super v10 = __Block_byref_object_dispose__6;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVPlayerInterstitialEvent__updateStartOffset__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if ([(id)v7[5] count])
  {
    int v4 = (void *)[(id)v7[5] objectAtIndex:0];
    if (v4) {
      [v4 currentTime];
    }
    FigPlayerInterstitialEventSetFirstItemStartOffset();
  }

  _Block_object_dispose(&v6, 8);
}

uint64_t __47__AVPlayerInterstitialEvent__updateStartOffset__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void).cxx_destruct
{
}

@end