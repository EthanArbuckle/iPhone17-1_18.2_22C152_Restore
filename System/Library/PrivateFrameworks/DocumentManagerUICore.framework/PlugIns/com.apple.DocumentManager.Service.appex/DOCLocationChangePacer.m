@interface DOCLocationChangePacer
- (_TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer)init;
- (_TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer)initWithHierarchyController:(id)a3;
- (void)performPendingLocationChange;
@end

@implementation DOCLocationChangePacer

- (_TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer)initWithHierarchyController:(id)a3
{
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer_pendingLocationChange);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (objc_class *)a3;
  v6 = self;
  sub_1004CA580();
  *(Class *)((char *)&v6->super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer_hierarchyController) = v5;
  v7 = v5;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for DOCLocationChangePacer();
  v8 = [(DOCLocationChangePacer *)&v10 init];

  return v8;
}

- (void)performPendingLocationChange
{
  v2 = self;
  sub_1001D0550();
}

- (_TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer)init
{
  result = (_TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer_hierarchyController));
  sub_100153E38(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer_pendingLocationChange), *(void **)&self->hierarchyController[OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer_pendingLocationChange]);
  v3 = (char *)self
     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service22DOCLocationChangePacer_timestampOfLastLocationChangeAttempt;
  uint64_t v4 = sub_1004CA590();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end