@interface CKSuggestedActionsHandler
+ (id)pluginPayloadForShelfCardWithTitle:(id)a3 summary:(id)a4 userInfo:(id)a5;
- (_TtC7ChatKit25CKSuggestedActionsHandler)init;
- (_TtP7ChatKit33CKSuggestedActionsHandlerDelegate_)delegate;
- (void)openWithFallbackString:(id)a3;
- (void)performChipAction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CKSuggestedActionsHandler

- (_TtP7ChatKit33CKSuggestedActionsHandlerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit25CKSuggestedActionsHandler_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FBC390](v2);

  return (_TtP7ChatKit33CKSuggestedActionsHandlerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)openWithFallbackString:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_18F6746F0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)performChipAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18F673E0C(v4);
}

+ (id)pluginPayloadForShelfCardWithTitle:(id)a3 summary:(id)a4 userInfo:(id)a5
{
  uint64_t v5 = sub_18F7B97E0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_18F7B97E0();
  uint64_t v10 = v9;
  uint64_t v11 = sub_18F7B9660();
  id v12 = sub_18F674924(v5, v7, v8, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

- (_TtC7ChatKit25CKSuggestedActionsHandler)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CKSuggestedActionsHandler();
  return [(CKSuggestedActionsHandler *)&v4 init];
}

- (void).cxx_destruct
{
}

@end