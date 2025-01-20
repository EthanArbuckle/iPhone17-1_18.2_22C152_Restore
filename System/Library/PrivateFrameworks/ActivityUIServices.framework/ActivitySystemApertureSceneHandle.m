@interface ActivitySystemApertureSceneHandle
- (ACActivityDescriptor)descriptor;
- (FBScene)scene;
- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)init;
- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)initWithAcActivityDescritor:(id)a3 systemMetricsRequest:(id)a4;
- (_TtP18ActivityUIServices41ActivitySystemApertureSceneHandleDelegate_)delegate;
- (void)dealloc;
- (void)invalidate;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneDidInvalidate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation ActivitySystemApertureSceneHandle

- (FBScene)scene
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  return (FBScene *)*v2;
}

- (void)setScene:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (ACActivityDescriptor)descriptor
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  return (ACActivityDescriptor *)*v2;
}

- (void)setDescriptor:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtP18ActivityUIServices41ActivitySystemApertureSceneHandleDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x23ECEAE20](v2);
  return (_TtP18ActivityUIServices41ActivitySystemApertureSceneHandleDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)initWithAcActivityDescritor:(id)a3 systemMetricsRequest:(id)a4
{
  return (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *)ActivitySystemApertureSceneHandle.init(acActivityDescritor:systemMetricsRequest:)(a3, a4);
}

- (void)dealloc
{
  v2 = self;
  sub_23C98C01C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActivitySystemApertureSceneHandle();
  [(ActivitySystemApertureSceneHandle *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_activityDescriptor;
  uint64_t v4 = sub_23C990C60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_systemMetricsRequest));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector));
  v5 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  sub_23C9563B0((uint64_t)v5);
}

- (void)invalidate
{
  v2 = self;
  sub_23C98C01C();
}

- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)init
{
  result = (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sceneDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23C98DFE0("[%{public}s] Scene did activate.");
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23C98DFE0("[%{public}s] Scene did invalidate");
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  ActivitySystemApertureSceneHandle.sceneDidDeactivate(_:withError:)(v6, a4);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  sub_23C959038(0, (unint64_t *)&unk_26AF227F0);
  sub_23C975BB4();
  uint64_t v6 = sub_23C9910E0();
  id v7 = a3;
  id v8 = self;
  sub_23C98E244(v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_23C98E9F0((uint64_t)v11);
}

@end