@interface FigCaptureLogSmartCameraGating
+ (void)initialize;
- (FigCaptureLogSmartCameraGating)initWithGateIdentifier:(int)a3;
- (void)dealloc;
- (void)logGateClosed;
- (void)logGateOpened;
- (void)logSmartCamIsConfident:(BOOL)a3 presentedIdentifiers:(id)a4 presentedCount:(int)a5;
- (void)logTracksCreated:(int)a3;
@end

@implementation FigCaptureLogSmartCameraGating

- (FigCaptureLogSmartCameraGating)initWithGateIdentifier:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureLogSmartCameraGating;
  result = [(FigCaptureLogSmartCameraGating *)&v5 init];
  if (result)
  {
    result->_gateIdentifier = a3;
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  openingTimestamp = self->_openingTimestamp;
  if (openingTimestamp)
  {
    [(FigCaptureLogSmartCameraGating *)self logGateClosed];
    openingTimestamp = self->_openingTimestamp;
  }

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureLogSmartCameraGating;
  [(FigCaptureLogSmartCameraGating *)&v4 dealloc];
}

- (void)logGateOpened
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_openingTimestamp = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  self->_currentPresentations = 0;
  *(void *)&self->_numFrames = 0;
  self->_numClosingFrames = 0;
  *(void *)&self->_numBoxesPresented = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)logTracksCreated:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_numTrackedRegions += a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)logSmartCamIsConfident:(BOOL)a3 presentedIdentifiers:(id)a4 presentedCount:(int)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a4)
  {
    [a4 count];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [a4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(a4);
          }
          if (![(NSSet *)self->_currentPresentations containsObject:*(void *)(*((void *)&v14 + 1) + 8 * v13)])++self->_numBoxesPresented; {
          ++v13;
          }
        }
        while (v11 != v13);
        uint64_t v11 = [a4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }

    self->_currentPresentations = (NSSet *)a4;
  }
  else
  {
    self->_numBoxesPresented += a5;
  }
  ++self->_numFrames;
  if (!a5)
  {
    ++self->_numEmptyFrames;
    if (a3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (!a3) {
LABEL_15:
  }
    ++self->_numClosingFrames;
LABEL_16:
  os_unfair_lock_unlock(p_lock);
}

- (void)logGateClosed
{
  v7[8] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_openingTimestamp)
  {
    v6[0] = @"GateID";
    uint64_t v4 = [NSNumber numberWithInt:self->_gateIdentifier];
    openingTimestamp = self->_openingTimestamp;
    v7[0] = v4;
    v7[1] = openingTimestamp;
    v6[1] = @"timestamp";
    v6[2] = @"timestampEnd";
    v7[2] = [MEMORY[0x1E4F1C9C8] now];
    v6[3] = @"NumFrames";
    v7[3] = [NSNumber numberWithInt:self->_numFrames];
    v6[4] = @"NumTrackedRegions";
    v7[4] = [NSNumber numberWithInt:self->_numTrackedRegions];
    v6[5] = @"NumBoxesPresented";
    v7[5] = [NSNumber numberWithInt:self->_numBoxesPresented];
    v6[6] = @"NumEmptyFrames";
    v7[6] = [NSNumber numberWithInt:self->_numEmptyFrames];
    v6[7] = @"NumClosingFrames";
    v7[7] = [NSNumber numberWithInt:self->_numClosingFrames];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:8];
    PLLogRegisteredEvent();

    self->_openingTimestamp = 0;
    self->_currentPresentations = 0;
  }
  else
  {
    FigDebugAssert3();
  }
  os_unfair_lock_unlock(p_lock);
}

@end