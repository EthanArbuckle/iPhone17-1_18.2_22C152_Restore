@interface AVCaptionRenderer
- (AVCaptionRenderer)init;
- (BOOL)setupFigCDS;
- (BOOL)setupFigCaptionClient;
- (BOOL)synchronizeWithCurrentAccessibilityPreferencesWithCompletionHandler:(id)a3;
- (CGRect)bounds;
- (NSArray)captionSceneChangesInRange:(CMTimeRange *)consideredTimeRange;
- (NSArray)captions;
- (id)defaultStyles;
- (id)description;
- (int)buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession;
- (void)dealloc;
- (void)renderInContext:(CGContext *)a3 atTime:(id *)a4;
- (void)renderInContext:(CGContextRef)ctx forTime:(CMTime *)time;
- (void)setBounds:(CGRect)bounds;
- (void)setCaptions:(NSArray *)captions;
- (void)setDefaultStyles:(id)a3;
- (void)teardownFigCDS;
- (void)teardownFigCaptionClient;
@end

@implementation AVCaptionRenderer

- (AVCaptionRenderer)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVCaptionRenderer;
  v2 = [(AVCaptionRenderer *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptionRendererInternal);
    v2->_internal = v3;
    if (!v3) {
      goto LABEL_5;
    }
    v2->_internal->_captions = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    internal = v2->_internal;
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    internal->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    internal->_bounds.size = v5;
    v2->_internal->_sortedCaptions = 0;
    v2->_internal->_defaultStyles = 0;
    v2->_internal->_useFigCaptionClientByDefault = 1;
    v2->_internal->_useFigCaptionClientByDefault = 1;
    if (!v2->_internal->_useFigCaptionClientByDefault)
    {
      if ([(AVCaptionRenderer *)v2 setupFigCDS]) {
        return v2;
      }
      goto LABEL_5;
    }
    if (![(AVCaptionRenderer *)v2 setupFigCaptionClient])
    {
LABEL_5:

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    if (internal->_useFigCaptionClientByDefault) {
      [(AVCaptionRenderer *)self teardownFigCaptionClient];
    }
    else {
      [(AVCaptionRenderer *)self teardownFigCDS];
    }

    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCaptionRenderer;
  [(AVCaptionRenderer *)&v4 dealloc];
}

- (NSArray)captions
{
  v2 = self->_internal->_captions;
  return v2;
}

- (void)setCaptions:(NSArray *)captions
{
  if (!captions)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"captions != nil"), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if (self->_internal->_captions != captions)
  {
    v9 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:captions copyItems:1];

    self->_internal->_captions = v9;
    internal = self->_internal;
    sortedCaptions = internal->_sortedCaptions;
    if (sortedCaptions)
    {

      self->_internal->_sortedCaptions = 0;
      internal = self->_internal;
    }
    if (internal->_useFigCaptionClientByDefault)
    {
      [(AVCaptionRenderer *)self teardownFigCaptionClient];
      [(AVCaptionRenderer *)self setupFigCaptionClient];
    }
    else
    {
      [(AVCaptionRenderer *)self teardownFigCDS];
      [(AVCaptionRenderer *)self setupFigCDS];
    }
  }
}

- (CGRect)bounds
{
  internal = self->_internal;
  double x = internal->_bounds.origin.x;
  double y = internal->_bounds.origin.y;
  double width = internal->_bounds.size.width;
  double height = internal->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)bounds
{
  CGFloat height = bounds.size.height;
  CGFloat width = bounds.size.width;
  CGFloat y = bounds.origin.y;
  CGFloat x = bounds.origin.x;
  internal = self->_internal;
  BOOL v9 = bounds.origin.x == internal->_bounds.origin.x && bounds.origin.y == internal->_bounds.origin.y;
  if (!v9
    || (bounds.size.width == internal->_bounds.size.width
      ? (BOOL v10 = bounds.size.height == internal->_bounds.size.height)
      : (BOOL v10 = 0),
        !v10))
  {
    if (internal->_useFigCaptionClientByDefault)
    {
      if (FigCaptionClientSetBounds()) {
        return;
      }
    }
    else if (MEMORY[0x199713B30](internal->_cdsSession, a2, bounds.origin.x, bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height))
    {
      return;
    }
    v11 = self->_internal;
    v11->_bounds.origin.CGFloat x = x;
    v11->_bounds.origin.CGFloat y = y;
    v11->_bounds.size.CGFloat width = width;
    v11->_bounds.size.CGFloat height = height;
  }
}

- (BOOL)synchronizeWithCurrentAccessibilityPreferencesWithCompletionHandler:(id)a3
{
  internal = self->_internal;
  if (internal->_useFigCaptionClientByDefault)
  {
    if (!internal->_captionClient) {
      goto LABEL_9;
    }
    int v5 = FigCaptionClientSynchronizeDefaults();
    if (!v5) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
    BOOL v7 = 0;
    if (!a3) {
      return v7;
    }
    goto LABEL_10;
  }
  if (internal->_cdsSession)
  {
    int v5 = FigCDSSessionSynchronizeDefaults();
    if (v5) {
      goto LABEL_7;
    }
  }
LABEL_9:
  uint64_t v6 = 0;
  BOOL v7 = 1;
  if (a3) {
LABEL_10:
  }
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
  return v7;
}

- (id)defaultStyles
{
  return self->_internal->_defaultStyles;
}

- (void)setDefaultStyles:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    internal = self->_internal;
    p_internal = &self->_internal;
    internal->_defaultStyles = (AVTextStyleRule *)a3;
    uint64_t v7 = [a3 textMarkupAttributes];
  }
  else
  {
    uint64_t v7 = 0;
    p_internal = &self->_internal;
    self->_internal->_defaultStyles = 0;
  }
  v8 = *p_internal;
  if ((*p_internal)->_useFigCaptionClientByDefault)
  {
    captionClient = v8->_captionClient;
    MEMORY[0x1F40ED3D8](captionClient, v7);
  }
  else
  {
    cdsSession = v8->_cdsSession;
    MEMORY[0x1F40ED348](cdsSession, v7);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, captions = %@>", NSStringFromClass(v4), self, self->_internal->_captions];
}

- (NSArray)captionSceneChangesInRange:(CMTimeRange *)consideredTimeRange
{
  captions = self->_internal->_captions;
  uint64_t v6 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  if ([(NSArray *)captions count])
  {
    uint64_t v7 = objc_alloc_init(AVCaptionGrouper);
    sortedCaptions = self->_internal->_sortedCaptions;
    if (!sortedCaptions)
    {
      sortedCaptions = [(NSArray *)captions sortedArrayUsingComparator:&__block_literal_global_32];
      self->_internal->_sortedCaptions = sortedCaptions;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    long long v9 = *(_OWORD *)&consideredTimeRange->start.epoch;
    long long v16 = *(_OWORD *)&consideredTimeRange->start.value;
    long long v17 = v9;
    v15[2] = __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke_2;
    v15[3] = &unk_1E57B66F0;
    long long v18 = *(_OWORD *)&consideredTimeRange->duration.timescale;
    v15[4] = v7;
    [(NSArray *)sortedCaptions enumerateObjectsUsingBlock:v15];
    long long v13 = *MEMORY[0x1E4F1FA10];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    BOOL v10 = [(AVCaptionGrouper *)v7 flushAddedCaptionsIntoGroupsUpToTime:&v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke_3;
    v12[3] = &unk_1E57B6808;
    v12[4] = v6;
    [(NSArray *)v10 enumerateObjectsUsingBlock:v12];
  }
  return v6;
}

uint64_t __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    [a2 timeRange];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
  }
  *(_OWORD *)&time1.value = v8;
  time1.epoch = v9;
  if (a3) {
    [a3 timeRange];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  CMTime time2 = v6;
  int32_t v4 = CMTimeCompare(&time1, &time2);
  if (v4 < 0) {
    return -1;
  }
  else {
    return v4 != 0;
  }
}

uint64_t __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke_2(uint64_t a1, void *a2)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a2) {
    [a2 timeRange];
  }
  *(_OWORD *)&v6.start.value = *(_OWORD *)(a1 + 40);
  v6.start.epoch = *(void *)(a1 + 56);
  *(_OWORD *)&time2.value = v9;
  time2.epoch = v10;
  uint64_t result = CMTimeCompare(&v6.start, &time2);
  if ((int)result <= 0)
  {
    long long v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)&v6.start.value = *(_OWORD *)(a1 + 40);
    *(_OWORD *)&v6.start.epoch = v5;
    *(_OWORD *)&v6.duration.timescale = *(_OWORD *)(a1 + 72);
    CMTimeRangeGetEnd(&v7, &v6);
    *(_OWORD *)&v6.start.value = v9;
    v6.start.epoch = v10;
    uint64_t result = CMTimeCompare(&v6.start, &v7);
    if ((result & 0x80000000) != 0) {
      return [*(id *)(a1 + 32) addCaption:a2];
    }
  }
  return result;
}

void __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a2 captions] && objc_msgSend((id)objc_msgSend(a2, "captions"), "count"))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int32_t v4 = (void *)[a2 captions];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v11 = (void *)[v10 region];
          if ([v10 animation]) {
            char v7 = 1;
          }
          if ((v7 & 1) == 0 && v11 && [v11 scroll]) {
            char v7 = 1;
          }
          if (v7)
          {
            uint64_t v12 = 1;
            uint64_t v13 = 1;
            goto LABEL_22;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v7 = 0;
    }
    uint64_t v13 = v7 & 1;
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
LABEL_22:
  uint64_t v14 = [AVCaptionRendererScene alloc];
  if (a2) {
    [a2 timeRange];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  v15 = [(AVCaptionRendererScene *)v14 initWithTimeRange:v16 hasActiveCaptions:v12 needsPeriodicRefresh:v13];
  [*(id *)(a1 + 32) addObject:v15];
}

- (int)buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (!Mutable) {
    return 0;
  }
  CFMutableArrayRef v4 = Mutable;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  captions = self->_internal->_captions;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__AVCaptionRenderer_buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession__block_invoke;
  v8[3] = &unk_1E57B6830;
  v8[4] = &v9;
  v8[5] = v4;
  [(NSArray *)captions enumerateObjectsUsingBlock:v8];
  int v6 = *((_DWORD *)v10 + 6);
  if (!v6)
  {
    if (self->_internal->_useFigCaptionClientByDefault) {
      int v6 = FigCaptionClientSetCaptionArray();
    }
    else {
      int v6 = 0;
    }
  }
  _Block_object_dispose(&v9, 8);
  CFRelease(v4);
  return v6;
}

void __83__AVCaptionRenderer_buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 _figCaptionData];
  if (a2) {
    [a2 timeRange];
  }
  int v7 = FigCaptionCreate();
  if (v7)
  {
    *a4 = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  }
  else
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), 0);
  }
}

- (BOOL)setupFigCaptionClient
{
  if (FigCaptionClientCreate()
    || FigCaptionClientSetCGContextDevice()
    || (CMClockGetHostTimeClock(), FigCaptionClientSetMasterClock())
    || ([(AVCaptionRenderer *)self buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession], FigCaptionClientSetBounds())|| FigCaptionClientSetCaptionCacheRange()|| FigCaptionClientStart())
  {
    captionClient = self->_internal->_captionClient;
    if (captionClient)
    {
      CFRelease(captionClient);
      LOBYTE(captionClient) = 0;
      self->_internal->_captionClient = 0;
    }
  }
  else
  {
    LOBYTE(captionClient) = 1;
  }
  return (char)captionClient;
}

- (BOOL)setupFigCDS
{
  if (FigCDSSessionCreate()
    || FigCDSSessionSetCGContextDevice()
    || (CMClockGetHostTimeClock(), FigCDSSessionSetMasterClock())
    || ([(AVCaptionRenderer *)self buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession], MEMORY[0x199713B30](self->_internal->_cdsSession, self->_internal->_bounds.origin.x, self->_internal->_bounds.origin.y, self->_internal->_bounds.size.width, self->_internal->_bounds.size.height))|| FigCDSSessionSetCaptionCacheRange()|| FigCDSSessionStart())
  {
    cdsSession = self->_internal->_cdsSession;
    if (cdsSession)
    {
      CFRelease(cdsSession);
      LOBYTE(cdsSession) = 0;
      self->_internal->_cdsSession = 0;
    }
  }
  else
  {
    LOBYTE(cdsSession) = 1;
  }
  return (char)cdsSession;
}

- (void)teardownFigCaptionClient
{
  if (self->_internal->_captionClient)
  {
    FigCaptionClientStop();
    captionClient = self->_internal->_captionClient;
    if (captionClient)
    {
      CFRelease(captionClient);
      self->_internal->_captionClient = 0;
    }
  }
}

- (void)teardownFigCDS
{
  if (self->_internal->_cdsSession)
  {
    FigCDSSessionStop();
    cdsSession = self->_internal->_cdsSession;
    if (cdsSession)
    {
      CFRelease(cdsSession);
      self->_internal->_cdsSession = 0;
    }
  }
}

- (void)renderInContext:(CGContext *)a3 atTime:(id *)a4
{
  internal = self->_internal;
  CGFloat x = internal->_bounds.origin.x;
  CGFloat y = internal->_bounds.origin.y;
  CGFloat width = internal->_bounds.size.width;
  CGFloat height = internal->_bounds.size.height;
  if (internal->_useFigCaptionClientByDefault)
  {
    if (FigCaptionClientSetTime()) {
      return;
    }
  }
  else if (FigCDSSessionSetTime())
  {
    return;
  }
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  if (!CGRectIsNull(v13))
  {
    CGContextSaveGState(a3);
    GenericGraCGFloat y = CGColorCreateGenericGray(0.0, 0.0);
    if (GenericGray)
    {
      int v12 = GenericGray;
      CGContextSetFillColorWithColor(a3, GenericGray);
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.CGFloat width = width;
      v14.size.CGFloat height = height;
      CGContextFillRect(a3, v14);
      CGColorRelease(v12);
    }
    CGContextRestoreGState(a3);
    if (self->_internal->_useFigCaptionClientByDefault) {
      FigCaptionClientUpdateCGContext();
    }
    else {
      FigCDSSessionUpdateCGContext();
    }
  }
}

- (void)renderInContext:(CGContextRef)ctx forTime:(CMTime *)time
{
  CMTime v4 = *time;
  [(AVCaptionRenderer *)self renderInContext:ctx atTime:&v4];
}

@end