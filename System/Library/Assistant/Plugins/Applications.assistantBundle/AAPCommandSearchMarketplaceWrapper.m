@interface AAPCommandSearchMarketplaceWrapper
- (_TtC12Applications34AAPCommandSearchMarketplaceWrapper)init;
- (_TtC12Applications34AAPCommandSearchMarketplaceWrapper)initWithMarketplace:(id)a3 keyword:(id)a4;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5;
@end

@implementation AAPCommandSearchMarketplaceWrapper

- (_TtC12Applications34AAPCommandSearchMarketplaceWrapper)initWithMarketplace:(id)a3 keyword:(id)a4
{
  if (!a3)
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = sub_15850();
  uint64_t v8 = v7;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = sub_15850();
LABEL_6:
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace);
  uint64_t *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword);
  uint64_t *v12 = v9;
  v12[1] = v10;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for AAPCommandSearchMarketplaceWrapper();
  return [(AAPCommandSearchMarketplaceWrapper *)&v14 init];
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5
{
  uint64_t v7 = (void (*)(id))_Block_copy(a3);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    uint64_t v7 = (void (*)(id))sub_134E8;
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_unknownObjectRetain();
  id v9 = a5;
  uint64_t v10 = self;
  _s12Applications34AAPCommandSearchMarketplaceWrapperC7perform10completion13serviceHelper13executionInfoyySDys11AnyHashableVypGSgcSg_So09AFServiceI0_pSgSo018AFCommandExecutionK0CSgtF_0(v7, v8);
  sub_134A0((uint64_t)v7);
  swift_unknownObjectRelease();
}

- (_TtC12Applications34AAPCommandSearchMarketplaceWrapper)init
{
  result = (_TtC12Applications34AAPCommandSearchMarketplaceWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end