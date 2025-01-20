@interface TextActivityItemProvider
- (_TtC19AppStoreKitInternal24TextActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)item;
@end

@implementation TextActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if (a4)
  {
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC19AppStoreKitInternal24TextActivityItemProvider_excludedActivityTypes);
    id v8 = a3;
    v9 = self;
    id v10 = a4;
    if (sub_1E17B9828((uint64_t)v10, v7))
    {

      v11 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v12 = a3;
    v13 = self;
  }
  uint64_t v15 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC19AppStoreKitInternal24TextActivityItemProvider_text);
  uint64_t v14 = *(uint64_t *)((char *)&self->super.super._iop.__prevOp
                   + OBJC_IVAR____TtC19AppStoreKitInternal24TextActivityItemProvider_text);
  uint64_t v16 = MEMORY[0x1E4FBB1A0];
  v23[3] = MEMORY[0x1E4FBB1A0];
  v23[0] = v15;
  v23[1] = v14;
  swift_bridgeObjectRetain();

  v17 = __swift_project_boxed_opaque_existential_1Tm(v23, v16);
  uint64_t v18 = *(void *)(v16 - 8);
  __n128 v19 = MEMORY[0x1F4188790](v17);
  v21 = (char *)v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v18 + 16))(v21, v19);
  v11 = (void *)sub_1E1D5D398();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
LABEL_6:
  return v11;
}

- (id)item
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5D468();
  return v2;
}

- (_TtC19AppStoreKitInternal24TextActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_1E1D5CDD8();
  swift_unknownObjectRelease();
  result = (_TtC19AppStoreKitInternal24TextActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end