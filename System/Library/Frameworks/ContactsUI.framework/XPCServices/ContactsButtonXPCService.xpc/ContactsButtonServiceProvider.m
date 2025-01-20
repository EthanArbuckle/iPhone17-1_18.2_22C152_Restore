@interface ContactsButtonServiceProvider
- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (_TtC24ContactsButtonXPCService29ContactsButtonServiceProvider)init;
- (void)getRemoteContentForStyle:(id)a3 layerContext:(unint64_t)a4 queryString:(id)a5 currentFrame:(CGRect)a6 ignoredEmails:(id)a7 ignoredPhones:(id)a8 traitData:(id)a9 sbExtension:(id)a10 with:(id)a11;
- (void)onPrimaryTouchUpEvent:(id)a3 with:(id)a4;
- (void)sizeThatFitsWithProposalWidth:(id)a3 proposalHeight:(id)a4 with:(id)a5;
@end

@implementation ContactsButtonServiceProvider

- (void)sizeThatFitsWithProposalWidth:(id)a3 proposalHeight:(id)a4 with:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10001BE74(a3, a4, (char *)v11, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)getRemoteContentForStyle:(id)a3 layerContext:(unint64_t)a4 queryString:(id)a5 currentFrame:(CGRect)a6 ignoredEmails:(id)a7 ignoredPhones:(id)a8 traitData:(id)a9 sbExtension:(id)a10 with:(id)a11
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v18 = _Block_copy(a11);
  uint64_t v19 = sub_1000200B8();
  unint64_t v33 = v20;
  uint64_t v34 = v19;
  uint64_t v21 = sub_100020238();
  uint64_t v22 = sub_100020238();
  id v23 = a3;
  id v24 = a9;
  id v25 = a10;
  v26 = self;
  uint64_t v27 = sub_10001FB38();
  unint64_t v29 = v28;

  uint64_t v30 = sub_1000200B8();
  uint64_t v32 = v31;

  _Block_copy(v18);
  sub_10001C814(v23, a4, v34, v33, v21, v22, x, y, width, height, v27, v29, v30, v32, (uint64_t)v26, (ClassDescriptor **)v18);
  _Block_release(v18);
  _Block_release(v18);
  swift_bridgeObjectRelease();
  sub_10000676C(v27, v29);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)onPrimaryTouchUpEvent:(id)a3 with:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10001DE8C(a3, (unint64_t)v8, (void (**)(void, void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  id v10 = sub_10001F178(v7, v8);

  return (CGImage *)v10;
}

- (_TtC24ContactsButtonXPCService29ContactsButtonServiceProvider)init
{
  result = (_TtC24ContactsButtonXPCService29ContactsButtonServiceProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_logger;
  uint64_t v4 = sub_10001FBF8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotMachine));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_layerGrader));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_contentsGrader));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cnAuditToken));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTraits));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTag));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedStyle);
}

@end