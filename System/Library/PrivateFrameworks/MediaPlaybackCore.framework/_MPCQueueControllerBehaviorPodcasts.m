@interface _MPCQueueControllerBehaviorPodcasts
+ (BOOL)supportsSecureCoding;
+ (id)makeExtensionWithInvalidatable:(id)a3;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)allowsQueueModifications;
- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)containsRestorableContent;
- (BOOL)hasUserMutations;
- (BOOL)isEmpty;
- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 extension:(id)a5 reason:(id *)a6;
- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5;
- (BOOL)itemExistsForContentItemID:(id)a3;
- (MPCQueueControllerBehaviorHost)host;
- (NSArray)queueTrackIdentifiers;
- (NSString)sessionID;
- (_MPCQueueControllerBehaviorPodcasts)init;
- (_MPCQueueControllerBehaviorPodcasts)initWithCoder:(id)a3;
- (_MPCQueueControllerBehaviorPodcasts)initWithSessionID:(id)a3;
- (id)_itemForContentItemID:(id)a3;
- (id)_stateDictionaryIncludingQueue:(BOOL)a3;
- (id)componentsForContentItemID:(id)a3;
- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5;
- (id)finalizeStateRestorationWithTargetContentItemID:(id)a3 completion:(id)a4;
- (id)performLoadCommand:(id)a3 completion:(id)a4;
- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3;
- (int64_t)displayItemCount;
- (int64_t)playbackPositionRestorationPolicy;
- (int64_t)preferredUpcomingItemCount;
- (void)canReuseQueue:(id)a3 completion:(id)a4;
- (void)clearAllItemsAfterContentItemID:(id)a3;
- (void)connectToHost:(id)a3;
- (void)currentItemDidChangeFromContentItemID:(id)a3 toContentItemID:(id)a4;
- (void)didReachEndOfQueueWithReason:(id)a3;
- (void)disconnectFromHost:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadAdditionalUpcomingItems:(int64_t)a3 completion:(id)a4;
- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5;
- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5;
- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5;
- (void)removeContentItemID:(id)a3 completion:(id)a4;
- (void)setAllowsQueueModifications:(BOOL)a3;
- (void)setHasUserMutations:(BOOL)a3;
- (void)setHost:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation _MPCQueueControllerBehaviorPodcasts

+ (id)makeExtensionWithInvalidatable:(id)a3
{
  swift_unknownObjectRetain();
  id v3 = static QueueControllerBehaviorPodcasts.makeExtension(with:)();
  swift_unknownObjectRelease();

  return v3;
}

- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 extension:(id)a5 reason:(id *)a6
{
  uint64_t v9 = sub_21BEAA178();
  v11 = v10;
  id v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  LOBYTE(a6) = QueueControllerBehaviorPodcasts.isExportableSessionType(_:forContentItemID:extension:reason:)((uint64_t)v12, v9, v11, v14, a6);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return a6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return static QueueControllerBehaviorPodcasts.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (BOOL)hasUserMutations
{
  return sub_21BD0DDDC() & 1;
}

- (void)setHasUserMutations:(BOOL)a3
{
}

- (BOOL)allowsQueueModifications
{
  return sub_21BD0DEF0() & 1;
}

- (void)setAllowsQueueModifications:(BOOL)a3
{
}

- (NSString)sessionID
{
  sub_21BD0E028();
  v2 = (void *)sub_21BEAA138();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setSessionID:(id)a3
{
  sub_21BEAA178();
  v4 = self;
  sub_21BD0E0E8();
}

- (MPCQueueControllerBehaviorHost)host
{
  v2 = (void *)sub_21BD0E1F0();

  return (MPCQueueControllerBehaviorHost *)v2;
}

- (void)setHost:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_21BD0E294((uint64_t)a3);
}

- (_MPCQueueControllerBehaviorPodcasts)initWithCoder:(id)a3
{
  id v3 = a3;
  QueueControllerBehaviorPodcasts.init(coder:)();
  return result;
}

- (_MPCQueueControllerBehaviorPodcasts)initWithSessionID:(id)a3
{
  if (a3) {
    sub_21BEAA178();
  }
  QueueControllerBehaviorPodcasts.init(sessionID:)();
  return result;
}

- (void)connectToHost:(id)a3
{
}

- (void)disconnectFromHost:(id)a3
{
}

- (int64_t)playbackPositionRestorationPolicy
{
  return 0;
}

- (NSArray)queueTrackIdentifiers
{
  v2 = self;
  sub_21BD0FA14();

  id v3 = (void *)sub_21BEAA2F8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)canReuseQueue:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_21BD1687C(v7, (char *)v8, v6);
  _Block_release(v6);
}

- (id)performLoadCommand:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_21BD16D64(v7, (char *)v8, v6);
  uint64_t v10 = v9;
  _Block_release(v6);

  if (v10)
  {
    v11 = (void *)sub_21BEAA138();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)componentsForContentItemID:(id)a3
{
  return sub_21BD184B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_21BD17818);
}

- (BOOL)itemExistsForContentItemID:(id)a3
{
  uint64_t v4 = sub_21BEAA178();
  v6 = v5;
  id v7 = self;
  LOBYTE(v4) = sub_21BD17990(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  return sub_21BD1C064(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_21BD17A48);
}

- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4
{
  return 1;
}

- (BOOL)isEmpty
{
  return sub_21BD17AB4();
}

- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5
{
  char v5 = a5;
  if (a3)
  {
    uint64_t v8 = sub_21BEAA178();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  v11 = self;
  id v12 = (void *)sub_21BD17B24(v8, v10, a4, v5);

  swift_bridgeObjectRelease();

  return v12;
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  id v3 = self;
  sub_21BD17D24();

  uint64_t v4 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return v4;
}

- (void)currentItemDidChangeFromContentItemID:(id)a3 toContentItemID:(id)a4
{
  uint64_t v5 = sub_21BEAA178();
  uint64_t v7 = v6;
  uint64_t v8 = sub_21BEAA178();
  uint64_t v10 = v9;
  v11 = self;
  sub_21BD17FA4(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)_itemForContentItemID:(id)a3
{
  return sub_21BD184B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_21BD181F0);
}

- (_MPCQueueControllerBehaviorPodcasts)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  uint64_t v3 = MEMORY[0x263F8D8F0];
  sub_21BD23B5C((uint64_t)self + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_nextRequest, (uint64_t)&unk_26AAF38B0, MEMORY[0x263F5E858], MEMORY[0x263F8D8F0], (void (*)(void))sub_21BD20A0C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_21BD23B5C((uint64_t)self + OBJC_IVAR____MPCQueueControllerBehaviorPodcasts_activePlaybackContext, (uint64_t)&qword_26AAF3678, MEMORY[0x263F5E810], v3, (void (*)(void))sub_21BD20A0C);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3
{
  if (a3) {
    sub_21BEAA178();
  }
  v4.value._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v4.value._countAndFlagsBits;
  object = QueueControllerBehaviorPodcasts.tailInsertionContentItemID(forTargetContentItemID:)(v4).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    uint64_t v7 = (void *)sub_21BEAA138();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5
{
  sub_21BEAA178();
  uint64_t v7 = self;
  LOBYTE(a3) = QueueControllerBehaviorPodcasts.isSupportedInsertionPosition(_:fromContentItemID:reason:)(a3);

  swift_bridgeObjectRelease();
  return a3 & 1;
}

- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_21BEAA178();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  id v12 = self;
  sub_21BD191DC(v11, v9, (uint64_t)a4, (uint64_t)v12, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5
{
}

- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5
{
}

- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4
{
  return sub_21BD1C064(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t))QueueControllerBehaviorPodcasts.canRemoveContentItemID(_:reason:));
}

- (void)removeContentItemID:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_21BEAA178();
  unint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_21BD1C0C8(v6, v8, (uint64_t)v9, (void (**)(void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)clearAllItemsAfterContentItemID:(id)a3
{
  uint64_t v4 = sub_21BEAA178();
  uint64_t v6 = v5;
  unint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  QueueControllerBehaviorPodcasts.clearAllItems(afterContentItemID:)(v8);

  swift_bridgeObjectRelease();
}

- (int64_t)displayItemCount
{
  v2 = self;
  Swift::Int v3 = QueueControllerBehaviorPodcasts.displayItemCount()();

  return v3;
}

- (int64_t)preferredUpcomingItemCount
{
  v2 = self;
  int64_t v3 = QueueControllerBehaviorPodcasts.preferredUpcomingItemCount.getter();

  return v3;
}

- (void)loadAdditionalUpcomingItems:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  unint64_t v7 = self;
  sub_21BD1CA74(a3, (char *)v7, (void (**)(void, void))v6);
  _Block_release(v6);
}

- (void)didReachEndOfQueueWithReason:(id)a3
{
  sub_21BEAA178();
  v4._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v4._countAndFlagsBits;
  QueueControllerBehaviorPodcasts.didReachEndOfQueue(withReason:)(v4);

  swift_bridgeObjectRelease();
}

- (BOOL)containsRestorableContent
{
  return 1;
}

- (id)finalizeStateRestorationWithTargetContentItemID:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3) {
    sub_21BEAA178();
  }
  *(void *)(swift_allocObject() + 16) = v6;
  unint64_t v7 = self;
  QueueControllerBehaviorPodcasts.finalizeStateRestoration(withTargetContentItemID:completion:)();

  swift_release();
  swift_bridgeObjectRelease();

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  QueueControllerBehaviorPodcasts.encode(with:)((NSCoder)v4);
}

@end