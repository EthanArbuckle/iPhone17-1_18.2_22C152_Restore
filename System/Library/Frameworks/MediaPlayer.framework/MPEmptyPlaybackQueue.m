@interface MPEmptyPlaybackQueue
+ (BOOL)supportsSecureCoding;
- (MPEmptyPlaybackQueue)init;
- (id)description;
@end

@implementation MPEmptyPlaybackQueue

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p EmptyQueue>", objc_opt_class(), self];
}

- (MPEmptyPlaybackQueue)init
{
  uint64_t v3 = MRSystemAppPlaybackQueueCreate();

  return [(MPRemotePlaybackQueue *)self initWithMediaRemotePlaybackQueue:v3 options:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end