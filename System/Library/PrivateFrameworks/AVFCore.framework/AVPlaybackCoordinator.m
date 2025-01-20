@interface AVPlaybackCoordinator
+ (void)initialize;
- (AVCoordinatedPlaybackSuspension)beginSuspensionForReason:(AVCoordinatedPlaybackSuspensionReason)suspensionReason;
- (AVPlaybackCoordinator)init;
- (BOOL)isDefunct;
- (BOOL)pauseSnapsToMediaTimeOfOriginator;
- (CMTime)expectedItemTimeAtHostTime:(SEL)a3;
- (NSArray)otherParticipants;
- (NSArray)suspensionReasons;
- (NSArray)suspensionReasonsThatTriggerWaiting;
- (NSInteger)participantLimitForWaitingOutSuspensionsWithReason:(AVCoordinatedPlaybackSuspensionReason)reason;
- (id)_currentWaitingPoliciesArray;
- (id)initInternal;
- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3;
- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4;
- (void)setParticipantLimit:(NSInteger)participantLimit forWaitingOutSuspensionsWithReason:(AVCoordinatedPlaybackSuspensionReason)reason;
- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)pauseSnapsToMediaTimeOfOriginator;
- (void)setSuspensionReasonsThatTriggerWaiting:(NSArray *)suspensionReasonsThatTriggerWaiting;
@end

@implementation AVPlaybackCoordinator

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackCoordinator;
  return [(AVPlaybackCoordinator *)&v3 init];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVPlaybackCoordinator)init
{
  v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"-[AVPlaybackCoordinator init] unavailable", v2, v3, v4, v5, v6, v8), 0 reason userInfo];
  objc_exception_throw(v7);
}

- (NSArray)suspensionReasons
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSArray)otherParticipants
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (AVCoordinatedPlaybackSuspension)beginSuspensionForReason:(AVCoordinatedPlaybackSuspensionReason)suspensionReason
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
}

- (CMTime)expectedItemTimeAtHostTime:(SEL)a3
{
  v7 = (objc_class *)objc_opt_class();
  result = (CMTime *)AVRequestConcreteImplementation((objc_class *)self, a3, v7);
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  return result;
}

- (void)setParticipantLimit:(NSInteger)participantLimit forWaitingOutSuspensionsWithReason:(AVCoordinatedPlaybackSuspensionReason)reason
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
}

- (NSInteger)participantLimitForWaitingOutSuspensionsWithReason:(AVCoordinatedPlaybackSuspensionReason)reason
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (void)setSuspensionReasonsThatTriggerWaiting:(NSArray *)suspensionReasonsThatTriggerWaiting
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
}

- (NSArray)suspensionReasonsThatTriggerWaiting
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)pauseSnapsToMediaTimeOfOriginator
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
}

- (BOOL)pauseSnapsToMediaTimeOfOriginator
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)_currentWaitingPoliciesArray
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)isDefunct
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end