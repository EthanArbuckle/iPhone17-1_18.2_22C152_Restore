@interface AVCoordinatedPlaybackSuspension
- (AVCoordinatedPlaybackSuspension)initWithCoordinator:(id)a3 reason:(id)a4;
- (AVCoordinatedPlaybackSuspensionReason)reason;
- (NSDate)beginDate;
- (OpaqueFigTimelineCoordinatorSuspension)_figSuspension;
- (void)dealloc;
- (void)end;
- (void)endProposingNewTime:(CMTime *)time;
@end

@implementation AVCoordinatedPlaybackSuspension

- (AVCoordinatedPlaybackSuspension)initWithCoordinator:(id)a3 reason:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCoordinatedPlaybackSuspension;
  v6 = [(AVCoordinatedPlaybackSuspension *)&v8 init];
  if (v6)
  {
    if (!a4) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot initialize AVCoordinatedPlaybackSuspension with nil reason." userInfo:0]);
    }
    v6->_reason = (NSString *)[a4 copy];
    v6->_coordinator = (AVPlaybackCoordinator *)a3;
    v6->_beginDate = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(a4);
    if (FigTimelineCoordinatorSuspensionCreate() || !v6->_figSuspension)
    {

      return 0;
    }
    else
    {
      v6->_iVarMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    }
  }
  return v6;
}

- (void)dealloc
{
  if (self->_figSuspension) {
    -[AVPlaybackCoordinator _endSuspension:](self->_coordinator, "_endSuspension:");
  }

  FigSimpleMutexDestroy();
  figSuspension = self->_figSuspension;
  if (figSuspension) {
    CFRelease(figSuspension);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCoordinatedPlaybackSuspension;
  [(AVCoordinatedPlaybackSuspension *)&v4 dealloc];
}

- (OpaqueFigTimelineCoordinatorSuspension)_figSuspension
{
  MEMORY[0x199715030](self->_iVarMutex, a2);
  figSuspension = self->_figSuspension;
  MEMORY[0x199715040](self->_iVarMutex);
  return figSuspension;
}

- (void)end
{
  MEMORY[0x199715030](self->_iVarMutex, a2);
  figSuspension = self->_figSuspension;
  self->_figSuspension = 0;
  MEMORY[0x199715040](self->_iVarMutex);
  if (figSuspension)
  {
    [(AVPlaybackCoordinator *)self->_coordinator _endSuspension:figSuspension];
    CFRelease(figSuspension);
  }
}

- (void)endProposingNewTime:(CMTime *)time
{
  MEMORY[0x199715030](self->_iVarMutex, a2);
  figSuspension = self->_figSuspension;
  self->_figSuspension = 0;
  MEMORY[0x199715040](self->_iVarMutex);
  if (figSuspension)
  {
    coordinator = self->_coordinator;
    long long v7 = *(_OWORD *)&time->value;
    CMTimeEpoch epoch = time->epoch;
    [(AVPlaybackCoordinator *)coordinator _endSuspension:figSuspension proposingNewTime:&v7];
    CFRelease(figSuspension);
  }
}

- (AVCoordinatedPlaybackSuspensionReason)reason
{
  return self->_reason;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

@end