@interface DOCLocationChangePacer
- (_TtC17RecentsAppPopover22DOCLocationChangePacer)init;
- (_TtC17RecentsAppPopover22DOCLocationChangePacer)initWithHierarchyController:(id)a3;
- (void)performPendingLocationChange;
@end

@implementation DOCLocationChangePacer

- (_TtC17RecentsAppPopover22DOCLocationChangePacer)initWithHierarchyController:(id)a3
{
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC17RecentsAppPopover22DOCLocationChangePacer_pendingLocationChange);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (objc_class *)a3;
  v6 = self;
  sub_1004BBDC0();
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC17RecentsAppPopover22DOCLocationChangePacer_hierarchyController) = v5;
  v7 = v5;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for DOCLocationChangePacer();
  v8 = [(DOCLocationChangePacer *)&v10 init];

  return v8;
}

- (void)performPendingLocationChange
{
  v2 = self;
  sub_1002062CC();
}

- (_TtC17RecentsAppPopover22DOCLocationChangePacer)init
{
  result = (_TtC17RecentsAppPopover22DOCLocationChangePacer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover22DOCLocationChangePacer_hierarchyController));
  sub_1000A6158(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC17RecentsAppPopover22DOCLocationChangePacer_pendingLocationChange), *(void **)&self->hierarchyController[OBJC_IVAR____TtC17RecentsAppPopover22DOCLocationChangePacer_pendingLocationChange]);
  v3 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover22DOCLocationChangePacer_timestampOfLastLocationChangeAttempt;
  uint64_t v4 = sub_1004BBDD0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end