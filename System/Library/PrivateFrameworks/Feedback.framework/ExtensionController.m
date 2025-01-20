@interface ExtensionController
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (ExtensionController)initWithCoder:(id)a3;
- (ExtensionController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation ExtensionController

- (void)loadView
{
  v2 = self;
  sub_23CF9994C();
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_23CF99CD4(v4);

  return self & 1;
}

- (ExtensionController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_23D005948();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_xpcConnection) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_contentViewController) = 0;
    id v6 = a4;
    v7 = (void *)sub_23D005918();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_xpcConnection) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_contentViewController) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ExtensionController();
  v9 = [(ExtensionController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (ExtensionController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_xpcConnection) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_contentViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExtensionController();
  return [(ExtensionController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ExtensionController_contentViewController);
}

@end