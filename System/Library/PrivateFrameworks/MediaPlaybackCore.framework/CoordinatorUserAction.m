@interface CoordinatorUserAction
- (id)identifier;
- (id)options;
- (id)sourceID;
- (uint64_t)setIdentifier:(uint64_t)a1;
- (uint64_t)setOptions:(uint64_t)a1;
- (uint64_t)setSourceID:(uint64_t)a1;
@end

@implementation CoordinatorUserAction

- (id)identifier
{
  swift_bridgeObjectRetain();
  v0 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return v0;
}

- (uint64_t)setIdentifier:(uint64_t)a1
{
  *(void *)(a1 + 16) = sub_21BEAA178();
  *(void *)(a1 + 24) = v2;
  swift_retain();
  swift_release();

  return swift_bridgeObjectRelease();
}

- (id)options
{
  swift_bridgeObjectRetain();
  sub_21BEAA088();
  OUTLINED_FUNCTION_23_1();
  swift_bridgeObjectRelease();

  return v0;
}

- (uint64_t)setOptions:(uint64_t)a1
{
  *(void *)(a1 + 48) = sub_21BEAA0A8();
  swift_retain();
  swift_release();

  return swift_bridgeObjectRelease();
}

- (id)sourceID
{
  swift_bridgeObjectRetain();
  v0 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return v0;
}

- (uint64_t)setSourceID:(uint64_t)a1
{
  *(void *)(a1 + 64) = sub_21BEAA178();
  *(void *)(a1 + 72) = v2;
  swift_retain();
  swift_release();

  return swift_bridgeObjectRelease();
}

@end