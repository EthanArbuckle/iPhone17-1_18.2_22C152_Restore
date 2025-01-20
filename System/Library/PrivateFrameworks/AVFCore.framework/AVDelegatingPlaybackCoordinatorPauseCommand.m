@interface AVDelegatingPlaybackCoordinatorPauseCommand
- (AVDelegatingPlaybackCoordinatorPauseCommand)init;
- (AVDelegatingPlaybackCoordinatorPauseCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 shouldBufferInAnticipationOfPlayback:(BOOL)a7 anticipatedPlaybackRate:(float)a8;
- (BOOL)shouldBufferInAnticipationOfPlayback;
- (float)anticipatedPlaybackRate;
- (id)expectedCurrentItemIdentifier;
- (id)originator;
- (void)dealloc;
@end

@implementation AVDelegatingPlaybackCoordinatorPauseCommand

- (AVDelegatingPlaybackCoordinatorPauseCommand)init
{
  v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"-[AVDelegatingPlaybackCoordinatorPauseCommand init] unavailable", v2, v3, v4, v5, v6, v8), 0 reason userInfo];
  objc_exception_throw(v7);
}

- (AVDelegatingPlaybackCoordinatorPauseCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 shouldBufferInAnticipationOfPlayback:(BOOL)a7 anticipatedPlaybackRate:(float)a8
{
  v16.receiver = self;
  v16.super_class = (Class)AVDelegatingPlaybackCoordinatorPauseCommand;
  v14 = [(AVDelegatingPlaybackCoordinatorPlaybackControlCommand *)&v16 initInternal];
  if (v14)
  {
    v14->_coordinator = (AVDelegatingPlaybackCoordinator *)a3;
    v14->_originator = (AVCoordinatedPlaybackParticipant *)a4;
    v14->_expectedCurrentItemIdentifier = (NSString *)[a5 copy];
    v14->_commandOrderIndex = a6;
    v14->_shouldBufferInAnticipationOfPlayback = a7;
    v14->_anticipatedPlaybackRate = a8;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorPauseCommand;
  [(AVDelegatingPlaybackCoordinatorPauseCommand *)&v3 dealloc];
}

- (id)originator
{
  return self->_originator;
}

- (id)expectedCurrentItemIdentifier
{
  return self->_expectedCurrentItemIdentifier;
}

- (BOOL)shouldBufferInAnticipationOfPlayback
{
  return self->_shouldBufferInAnticipationOfPlayback;
}

- (float)anticipatedPlaybackRate
{
  return self->_anticipatedPlaybackRate;
}

@end