@interface MPCSonicQueueFeeder_Swift
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)shouldShuffleExcludeContentID:(id)a3;
- (BOOL)shouldUsePlaceholderForContentID:(id)a3;
- (BOOL)supportsAutoPlayForContentID:(id)a3;
- (MPCSonicQueueFeeder_Swift)init;
- (MPCSonicQueueFeeder_Swift)initWithQueueFeeder:(id)a3;
- (id)genericModelObjectForContentID:(id)a3 error:(id *)a4;
- (id)identifiersForContentID:(id)a3;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)loadWithContext:(MPCModelPlaybackContext *)a3 completion:(id)a4;
- (void)reloadSection:(MPMutableIdentifierListSection *)a3 completion:(id)a4;
@end

@implementation MPCSonicQueueFeeder_Swift

- (MPCSonicQueueFeeder_Swift)initWithQueueFeeder:(id)a3
{
  return (MPCSonicQueueFeeder_Swift *)sub_21BC6B294(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_21BC6B534();
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  v3 = (char *)self + OBJC_IVAR___MPCSonicQueueFeeder_Swift__storage;

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
}

- (id)identifiersForContentID:(id)a3
{
  uint64_t v4 = sub_21BEAA178();
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_21BC6B664(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)supportsAutoPlayForContentID:(id)a3
{
  return sub_21BC6D8B4(self, (uint64_t)a2, (uint64_t)a3, sub_21BC6C7DC);
}

- (BOOL)shouldUsePlaceholderForContentID:(id)a3
{
  return 0;
}

- (BOOL)shouldShuffleExcludeContentID:(id)a3
{
  return sub_21BC6D8B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_21BC6D824);
}

- (id)genericModelObjectForContentID:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_21BEAA178();
  uint64_t v7 = v6;
  v8 = self;
  v9 = (void *)sub_21BC6D91C(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (void)loadWithContext:(MPCModelPlaybackContext *)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C63EF8, (uint64_t)v7);
}

- (void)reloadSection:(MPMutableIdentifierListSection *)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C63EA0, (uint64_t)v7);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_21BC718BC((uint64_t)v8, v7);

  return v9;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_21BC7251C(v7, v8, (void (**)(void))v6);
  _Block_release(v6);
}

- (MPCSonicQueueFeeder_Swift)init
{
}

@end