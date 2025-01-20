@interface AVDelegatingPlaybackCoordinatorPlaybackControlCommand
- (AVCoordinatedPlaybackParticipant)originator;
- (AVDelegatingPlaybackCoordinatorPlaybackControlCommand)init;
- (NSString)expectedCurrentItemIdentifier;
- (id)initInternal;
@end

@implementation AVDelegatingPlaybackCoordinatorPlaybackControlCommand

- (AVDelegatingPlaybackCoordinatorPlaybackControlCommand)init
{
  v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"-[AVDelegatingPlaybackCoordinatorPlaybackControlCommand init] unavailable", v2, v3, v4, v5, v6, v8), 0 reason userInfo];
  objc_exception_throw(v7);
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorPlaybackControlCommand;
  return [(AVDelegatingPlaybackCoordinatorPlaybackControlCommand *)&v3 init];
}

- (AVCoordinatedPlaybackParticipant)originator
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSString)expectedCurrentItemIdentifier
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end