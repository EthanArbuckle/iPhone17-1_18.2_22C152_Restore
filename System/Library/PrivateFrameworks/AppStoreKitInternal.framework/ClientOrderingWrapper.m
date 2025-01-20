@interface ClientOrderingWrapper
- (_TtC19AppStoreKitInternal21ClientOrderingWrapper)init;
- (void)orderedVisibleIAPs:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7;
- (void)visibilityForIAPs:(id)a3 :(id)a4;
@end

@implementation ClientOrderingWrapper

- (void)visibilityForIAPs:(id)a3 :(id)a4
{
  uint64_t v6 = sub_1E1D5BCB8();
  id v7 = a4;
  v8 = self;
  sub_1E1C48ECC(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)orderedVisibleIAPs:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  uint64_t v10 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v12 = sub_1E1D5BE58();
    uint64_t v14 = v13;
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v10 = sub_1E1D5C248();
LABEL_4:
  if (a5) {
    a5 = (id)sub_1E1D5C248();
  }
  if (a6)
  {
    uint64_t v15 = sub_1E1D5BE58();
    a6 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v17 = a7;
  v18 = self;
  sub_1E1C49270(v12, v14, v10, (uint64_t)a5, v15, (uint64_t)a6, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal21ClientOrderingWrapper)init
{
  result = (_TtC19AppStoreKitInternal21ClientOrderingWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end