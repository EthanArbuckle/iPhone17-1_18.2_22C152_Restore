@interface _MPCQueueControllerBehaviorPodcastsTransportableExtension
+ (NSString)defaultSessionType;
+ (NSString)fallbackSessionType;
- (BOOL)isSupportedSessionType:(id)a3 reason:(id *)a4;
- (MPCQueueControllerSessionTypesInvalidatable)sessionTypesInvalidatable;
- (_MPCQueueControllerBehaviorPodcastsTransportableExtension)init;
- (id)allKnownSessionTypes;
- (void)setSessionTypesInvalidatable:(id)a3;
@end

@implementation _MPCQueueControllerBehaviorPodcastsTransportableExtension

+ (NSString)defaultSessionType
{
  return (NSString *)sub_21BCDA60C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static QueueControllerBehaviorPodcastsTransportableExtension.defaultSessionType.getter);
}

+ (NSString)fallbackSessionType
{
  return (NSString *)sub_21BCDA60C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static QueueControllerBehaviorPodcastsTransportableExtension.fallbackSessionType.getter);
}

- (MPCQueueControllerSessionTypesInvalidatable)sessionTypesInvalidatable
{
  v2 = (void *)sub_21BCDA694();

  return (MPCQueueControllerSessionTypesInvalidatable *)v2;
}

- (void)setSessionTypesInvalidatable:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_21BCDA740((uint64_t)a3);
}

- (id)allKnownSessionTypes
{
  v2 = self;
  sub_21BCDA81C();

  type metadata accessor for MPPlaybackSessionType(0);
  v3 = (void *)sub_21BEAA2F8();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)isSupportedSessionType:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  v7 = self;
  LOBYTE(a4) = sub_21BCDA938((uint64_t)v6, a4);

  return a4 & 1;
}

- (_MPCQueueControllerBehaviorPodcastsTransportableExtension)init
{
  return (_MPCQueueControllerBehaviorPodcastsTransportableExtension *)QueueControllerBehaviorPodcastsTransportableExtension.init()();
}

- (void).cxx_destruct
{
}

@end