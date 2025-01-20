@interface URLActivityItemProvider
- (_TtC19AppStoreKitInternal23URLActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)activityViewControllerSubject:(id)a3;
- (id)item;
@end

@implementation URLActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if (a4)
  {
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC19AppStoreKitInternal23URLActivityItemProvider_excludedActivityTypes);
    id v8 = a3;
    v9 = self;
    id v10 = a4;
    if (sub_1E17B9828((uint64_t)v10, v7))
    {
      long long v24 = 0u;
      long long v25 = 0u;

      goto LABEL_6;
    }
  }
  else
  {
    id v11 = a3;
    v12 = self;
  }
  v13 = *(char **)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC19AppStoreKitInternal23URLActivityItemProvider_shareSheetData)
      + OBJC_IVAR____TtC19AppStoreKitInternal14ShareSheetData_url;
  uint64_t v14 = sub_1E1D57018();
  *((void *)&v25 + 1) = v14;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v24);
  (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(boxed_opaque_existential_0, v13, v14);

LABEL_6:
  uint64_t v16 = *((void *)&v25 + 1);
  if (*((void *)&v25 + 1))
  {
    v17 = __swift_project_boxed_opaque_existential_1Tm(&v24, *((uint64_t *)&v25 + 1));
    uint64_t v18 = *(void *)(v16 - 8);
    __n128 v19 = MEMORY[0x1F4188790](v17);
    v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v18 + 16))(v21, v19);
    v22 = (void *)sub_1E1D5D398();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

- (id)item
{
  v2 = self;
  sub_1E19FBE0C(v5);

  __swift_project_boxed_opaque_existential_1Tm(v5, v5[3]);
  v3 = (void *)sub_1E1D5D398();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (_TtC19AppStoreKitInternal23URLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_1E1D5CDD8();
  swift_unknownObjectRelease();
  result = (_TtC19AppStoreKitInternal23URLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1E19FC5D0();

  return v6;
}

- (id)activityViewControllerSubject:(id)a3
{
  sub_1E19FD3D0();
  if (v3)
  {
    swift_bridgeObjectRetain();
    id v4 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

@end