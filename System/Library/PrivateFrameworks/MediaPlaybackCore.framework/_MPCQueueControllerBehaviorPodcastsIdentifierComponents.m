@interface _MPCQueueControllerBehaviorPodcastsIdentifierComponents
- (BOOL)isPlaceholder;
- (NSString)contentItemID;
- (NSString)itemID;
- (NSString)sectionID;
- (_MPCQueueControllerBehaviorPodcastsIdentifierComponents)init;
- (unsigned)behaviorFlags;
- (void)setContentItemID:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setSectionID:(id)a3;
@end

@implementation _MPCQueueControllerBehaviorPodcastsIdentifierComponents

- (NSString)contentItemID
{
  return (NSString *)sub_21BCFE2C4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_21BCFE174);
}

- (void)setContentItemID:(id)a3
{
}

- (NSString)sectionID
{
  return (NSString *)sub_21BCFE2C4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_21BCFE1E0);
}

- (void)setSectionID:(id)a3
{
}

- (NSString)itemID
{
  return (NSString *)sub_21BCFE2C4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_21BCFE314);
}

- (void)setItemID:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return sub_21BCFE3A8() & 1;
}

- (void)setIsPlaceholder:(BOOL)a3
{
}

- (unsigned)behaviorFlags
{
  return 0;
}

- (_MPCQueueControllerBehaviorPodcastsIdentifierComponents)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end