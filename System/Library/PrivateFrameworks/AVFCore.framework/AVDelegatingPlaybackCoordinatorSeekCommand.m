@interface AVDelegatingPlaybackCoordinatorSeekCommand
- (AVDelegatingPlaybackCoordinatorSeekCommand)init;
- (AVDelegatingPlaybackCoordinatorSeekCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 itemTime:(id *)a7 shouldPause:(BOOL)a8 shouldBufferInAnticipationOfPlayback:(BOOL)a9 anticipatedPlaybackRate:(float)a10 completionDueDate:(id)a11;
- (BOOL)shouldBufferInAnticipationOfPlayback;
- (CMTime)itemTime;
- (NSDate)completionDueDate;
- (float)anticipatedPlaybackRate;
- (id)expectedCurrentItemIdentifier;
- (id)originator;
- (void)dealloc;
@end

@implementation AVDelegatingPlaybackCoordinatorSeekCommand

- (AVDelegatingPlaybackCoordinatorSeekCommand)init
{
  v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"-[AVDelegatingPlaybackCoordinatorSeekCommand init] unavailable", v2, v3, v4, v5, v6, v8), 0 reason userInfo];
  objc_exception_throw(v7);
}

- (AVDelegatingPlaybackCoordinatorSeekCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 itemTime:(id *)a7 shouldPause:(BOOL)a8 shouldBufferInAnticipationOfPlayback:(BOOL)a9 anticipatedPlaybackRate:(float)a10 completionDueDate:(id)a11
{
  v21.receiver = self;
  v21.super_class = (Class)AVDelegatingPlaybackCoordinatorSeekCommand;
  v18 = [(AVDelegatingPlaybackCoordinatorPlaybackControlCommand *)&v21 initInternal];
  if (v18)
  {
    *((void *)v18 + 1) = a3;
    *((void *)v18 + 2) = a4;
    *((void *)v18 + 3) = [a5 copy];
    *((void *)v18 + 4) = a6;
    long long v19 = *(_OWORD *)&a7->var0;
    *((void *)v18 + 7) = a7->var3;
    *(_OWORD *)(v18 + 40) = v19;
    v18[64] = a8;
    v18[65] = a9;
    *((float *)v18 + 17) = a10;
    *((void *)v18 + 9) = a11;
  }
  return (AVDelegatingPlaybackCoordinatorSeekCommand *)v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorSeekCommand;
  [(AVDelegatingPlaybackCoordinatorSeekCommand *)&v3 dealloc];
}

- (id)originator
{
  return self->_originator;
}

- (id)expectedCurrentItemIdentifier
{
  return self->_expectedCurrentItemIdentifier;
}

- (CMTime)itemTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (BOOL)shouldBufferInAnticipationOfPlayback
{
  return self->_shouldBufferInAnticipationOfPlayback;
}

- (float)anticipatedPlaybackRate
{
  return self->_anticipatedPlaybackRate;
}

- (NSDate)completionDueDate
{
  return self->_completionDueDate;
}

@end