@interface PARSessionSwiftInternal
- (BOOL)canLoadCard:(id)a3;
- (BOOL)canLoadImage:(id)a3 context:(id)a4;
- (BOOL)canLoadMoreResults:(id)a3;
- (NSXPCConnection)connection;
- (PARBag)bag;
- (PARSessionConfiguration)configuration;
- (PARSessionDelegate)delegate;
- (PARSessionSwiftInternal)init;
- (PARSessionSwiftInternal)initWithSession:(id)a3 configuration:(id)a4 connection:(id)a5 delegate:(id)a6;
- (_TtC10CoreParsec15PARSearchClient)client;
- (id)taskWith:(id)a3 completion:(id)a4;
- (unint64_t)enabledStatus;
- (unint64_t)safariAssistantEnabledStatus;
- (unint64_t)safariAssistantEnabledStatusForPageLanguage:(id)a3;
- (void)addCompletion:(id)a3 forInput:(id)a4;
- (void)addEngagedResults:(id)a3;
- (void)addEngagedResults:(id)a3 completion:(id)a4;
- (void)allEngagedResultsFor:(id)a3 maxCount:(int64_t)a4 completion:(id)a5;
- (void)clearEngagedResults:(id)a3 completion:(id)a4;
- (void)clearEngagementsFrom:(id)a3 to:(id)a4;
- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4;
- (void)dealloc;
- (void)didEndSearch:(id)a3;
- (void)didSkipSearch:(int)a3 input:(id)a4 queryId:(unint64_t)a5;
- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4;
- (void)loadCard:(id)a3 completionHandler:(id)a4;
- (void)loadImage:(SFImage *)a3 context:(SFImageContext *)a4 completionHandler:(id)a5;
- (void)loadMoreResults:(id)a3 completionHandler:(id)a4;
- (void)loadWithTask:(id)a3;
- (void)reportFeedback:(id)a3 queryId:(int64_t)a4;
- (void)send:(id)a3 completion:(id)a4;
- (void)sendCBAEngagementFeedback:(id)a3 query:(unint64_t)a4;
- (void)sendCustomFeedback:(id)a3;
- (void)setBag:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)subscribeToChannel:(id)a3 reply:(id)a4;
- (void)subscriptionStatusForChannel:(id)a3 reply:(id)a4;
- (void)topEngagedResultsFor:(id)a3 maxCount:(int64_t)a4 completion:(id)a5;
- (void)unsubscribeFromChannel:(id)a3 reply:(id)a4;
- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4;
@end

@implementation PARSessionSwiftInternal

- (PARBag)bag
{
  v2 = self;
  v3 = sub_19C7E9DE8();

  return (PARBag *)v3;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_19C7F4B0C();
}

- (PARSessionSwiftInternal)initWithSession:(id)a3 configuration:(id)a4 connection:(id)a5 delegate:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  swift_unknownObjectRetain();
  return (PARSessionSwiftInternal *)PARSessionSwiftInternal.init(session:configuration:connection:delegate:)(v8, v9, a5);
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  PARSessionSwiftInternal.report(_:queryId:)(v6, a4);
}

- (void)start
{
  v2 = self;
  sub_19C7F52C0();
}

- (_TtC10CoreParsec15PARSearchClient)client
{
  id v2 = PARSessionSwiftInternal.client.getter();

  return (_TtC10CoreParsec15PARSearchClient *)v2;
}

- (PARSessionDelegate)delegate
{
  id v2 = self;
  v3 = (void *)sub_19C810A4C();

  return (PARSessionDelegate *)v3;
}

- (PARSessionConfiguration)configuration
{
  id v2 = self;
  id v3 = sub_19C7F54A8();

  return (PARSessionConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19C810C00(v4);
}

- (void)setBag:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_19C7F532C(a3);
}

- (NSXPCConnection)connection
{
  id v2 = sub_19C810EB8();

  return (NSXPCConnection *)v2;
}

- (void)dealloc
{
  id v2 = self;
  PARSessionSwiftInternal.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  sub_19C81B8E4((uint64_t)self + OBJC_IVAR___PARSessionSwiftInternal__delegate);

  swift_unknownObjectWeakDestroy();
}

- (id)taskWith:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  id v10 = sub_19C81107C(v8, (uint64_t)sub_19C81B8DC, v7);

  swift_release();

  return v10;
}

- (void)loadWithTask:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_19C8115DC();
}

- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  sub_19C899DF0();
  *(void *)(swift_allocObject() + 16) = v5;
  id v6 = self;
  sub_19C8119F0();

  swift_bridgeObjectRelease();

  swift_release();
}

- (unint64_t)enabledStatus
{
  id v2 = self;
  unint64_t v3 = sub_19C811B08();

  return v3;
}

- (unint64_t)safariAssistantEnabledStatusForPageLanguage:(id)a3
{
  uint64_t v4 = sub_19C899DF0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  unint64_t v8 = sub_19C811B50(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (unint64_t)safariAssistantEnabledStatus
{
  id v2 = self;
  unint64_t v3 = sub_19C811BB8();

  return v3;
}

- (void)sendCBAEngagementFeedback:(id)a3 query:(unint64_t)a4
{
  uint64_t v6 = sub_19C898DE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8, v9, v10, v11);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C898DB0();
  v14 = self;
  sub_19C811EE0((uint64_t)v13, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (PARSessionSwiftInternal)init
{
}

- (BOOL)canLoadImage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  LOBYTE(a4) = PARSessionSwiftInternal.canLoad(_:context:)(v6, a4);

  return a4 & 1;
}

- (void)loadImage:(SFImage *)a3 context:(SFImageContext *)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  uint64_t v12 = self;

  sub_19C813BE8((uint64_t)&unk_1E9410198, (uint64_t)v9);
}

- (BOOL)canLoadCard:(id)a3
{
  uint64_t v4 = (SFCard *)a3;
  uint64_t v5 = self;
  Swift::Bool v6 = PARSessionSwiftInternal.canLoad(_:)(v4);

  return v6;
}

- (void)loadCard:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)canLoadMoreResults:(id)a3
{
  return PARSessionSwiftInternal.canLoad(_:)(*(SFMoreResults *)(&a2 - 1));
}

- (void)loadMoreResults:(id)a3 completionHandler:(id)a4
{
}

- (void)send:(id)a3 completion:(id)a4
{
  Swift::Bool v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    Swift::Bool v6 = (void (*)(void))sub_19C81B41C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  uint64_t v9 = self;
  PARSessionSwiftInternal.send(_:completion:)(v8, v6, v7);
  sub_19C81B40C((uint64_t)v6);
}

- (void)sendCustomFeedback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  PARSessionSwiftInternal.send(_:)((uint64_t)v4);
}

- (void)didEndSearch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  PARSessionSwiftInternal.didEndSearch(_:)(v4);
}

- (void)didSkipSearch:(int)a3 input:(id)a4 queryId:(unint64_t)a5
{
  uint64_t v5 = *(void *)&a3;
  if (a4)
  {
    uint64_t v7 = sub_19C899DF0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v10 = self;
  PARSessionSwiftInternal.didSkipSearch(_:input:queryId:)(v5, v7, v9);

  swift_bridgeObjectRelease();
}

- (void)addCompletion:(id)a3 forInput:(id)a4
{
  uint64_t v5 = sub_19C899DF0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_19C899DF0();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  PARSessionSwiftInternal.addCompletion(_:forInput:)(v12, v13);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)clearEngagementsFrom:(id)a3 to:(id)a4
{
  uint64_t v5 = sub_19C898EC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v5, v7, v8, v9, v10);
  Swift::String v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v14, v15, v16, v17);
  v19 = (char *)&v22 - v18;
  sub_19C898EA0();
  sub_19C898EA0();
  v20 = self;
  PARSessionSwiftInternal.clearEngagements(from:to:)();

  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v13, v5);
  v21(v19, v5);
}

- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4
{
  uint64_t v6 = sub_19C899DF0();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  v13.value.super.super.isa = (Class)a4;
  PARSessionSwiftInternal.clearEngagements(withTitle:type:)(v11, v13);

  swift_bridgeObjectRelease();
}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
  uint64_t v6 = (PARSmartSearchV1Parameters *)a3;
  uint64_t v7 = (PARSmartSearchV2Parameters *)a4;
  uint64_t v8 = self;
  PARSessionSwiftInternal.updateParameters(forSmartSearchV1:smartSearchV2:)(v6, v7);
}

- (void)addEngagedResults:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4D9AB0);
  uint64_t v4 = sub_19C899F10();
  uint64_t v5 = self;
  PARSessionSwiftInternal.addEngagedResults(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)addEngagedResults:(id)a3 completion:(id)a4
{
  uint64_t v5 = (uint64_t (*)())_Block_copy(a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4D9AB0);
  sub_19C899F10();
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    uint64_t v5 = sub_19C81BB40;
  }
  uint64_t v6 = self;
  PARSessionSwiftInternal.addEngagedResults(_:completion:)();
  sub_19C81B40C((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)topEngagedResultsFor:(id)a3 maxCount:(int64_t)a4 completion:(id)a5
{
}

- (void)allEngagedResultsFor:(id)a3 maxCount:(int64_t)a4 completion:(id)a5
{
}

- (void)clearEngagedResults:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB4D9AB0);
  sub_19C899F10();
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    uint64_t v5 = sub_19C81B404;
  }
  uint64_t v6 = self;
  PARSessionSwiftInternal.clearEngagedResults(_:completion:)();
  sub_19C81B40C((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)subscribeToChannel:(id)a3 reply:(id)a4
{
}

- (void)unsubscribeFromChannel:(id)a3 reply:(id)a4
{
}

- (void)subscriptionStatusForChannel:(id)a3 reply:(id)a4
{
}

@end