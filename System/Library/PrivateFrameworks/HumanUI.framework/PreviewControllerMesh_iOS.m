@interface PreviewControllerMesh_iOS
- (SCNView)sceneView;
- (_TtC7HumanUI25PreviewControllerMesh_iOS)init;
- (_TtC7HumanUI25PreviewControllerMesh_iOS)initWithCoder:(id)a3;
- (_TtC7HumanUI25PreviewControllerMesh_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setSceneView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PreviewControllerMesh_iOS

- (SCNView)sceneView
{
  return (SCNView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView));
}

- (void)setSceneView:(id)a3
{
  if (a3)
  {
    v4 = self;
    objc_msgSend(a3, sel_setAllowsCameraControl_, 0);
    id v5 = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView);
    *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView) = (Class)a3;
  }
  else
  {
    __break(1u);
  }
}

- (_TtC7HumanUI25PreviewControllerMesh_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_25298D4A8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7HumanUI25PreviewControllerMesh_iOS *)sub_25297BEBC(v5, v7, a4);
}

- (_TtC7HumanUI25PreviewControllerMesh_iOS)init
{
  swift_getObjectType();
  v3 = (void *)sub_25298D498();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v6 = [(PreviewControllerMesh_iOS *)self initWithNibName:v3 bundle:v5];

  return v6;
}

- (_TtC7HumanUI25PreviewControllerMesh_iOS)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25297CDB8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_25297C100();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_sceneView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7HumanUI25PreviewControllerMesh_iOS_skeleton3DColor);
}

@end