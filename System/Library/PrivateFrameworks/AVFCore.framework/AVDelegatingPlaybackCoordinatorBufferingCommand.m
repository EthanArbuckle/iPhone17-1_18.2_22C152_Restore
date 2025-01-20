@interface AVDelegatingPlaybackCoordinatorBufferingCommand
- (AVDelegatingPlaybackCoordinatorBufferingCommand)init;
- (AVDelegatingPlaybackCoordinatorBufferingCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 anticipatedPlaybackRate:(float)a7 completionDueDate:(id)a8;
- (NSDate)completionDueDate;
- (float)anticipatedPlaybackRate;
- (id)expectedCurrentItemIdentifier;
- (id)originator;
- (void)dealloc;
@end

@implementation AVDelegatingPlaybackCoordinatorBufferingCommand

- (AVDelegatingPlaybackCoordinatorBufferingCommand)init
{
  v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"-[AVDelegatingPlaybackCoordinatorBufferingCommand init] unavailable", v2, v3, v4, v5, v6, v8), 0 reason userInfo];
  objc_exception_throw(v7);
}

- (AVDelegatingPlaybackCoordinatorBufferingCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 anticipatedPlaybackRate:(float)a7 completionDueDate:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)AVDelegatingPlaybackCoordinatorBufferingCommand;
  v14 = [(AVDelegatingPlaybackCoordinatorPlaybackControlCommand *)&v16 initInternal];
  if (v14)
  {
    v14->_coordinator = (AVDelegatingPlaybackCoordinator *)a3;
    v14->_originator = (AVCoordinatedPlaybackParticipant *)a4;
    v14->_expectedCurrentItemIdentifier = (NSString *)[a5 copy];
    v14->_commandOrderIndex = a6;
    v14->_anticipatedPlaybackRate = a7;
    v14->_completionDueDate = (NSDate *)a8;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorBufferingCommand;
  [(AVDelegatingPlaybackCoordinatorBufferingCommand *)&v3 dealloc];
}

- (id)originator
{
  return self->_originator;
}

- (id)expectedCurrentItemIdentifier
{
  return self->_expectedCurrentItemIdentifier;
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