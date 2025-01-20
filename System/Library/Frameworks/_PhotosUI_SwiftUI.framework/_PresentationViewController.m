@interface _PresentationViewController
- (_TtC17_PhotosUI_SwiftUIP33_3BA943E6D7A29AC315168BE52F028B9927_PresentationViewController)initWithCoder:(id)a3;
- (_TtC17_PhotosUI_SwiftUIP33_3BA943E6D7A29AC315168BE52F028B9927_PresentationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation _PresentationViewController

- (_TtC17_PhotosUI_SwiftUIP33_3BA943E6D7A29AC315168BE52F028B9927_PresentationViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_217B452B4();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_217B45374(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_217B45424(a3);
}

- (_TtC17_PhotosUI_SwiftUIP33_3BA943E6D7A29AC315168BE52F028B9927_PresentationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_217B5FB50();
  }
  id v5 = a4;
  sub_217B454C8();
}

- (void).cxx_destruct
{
  id v2 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC17_PhotosUI_SwiftUIP33_3BA943E6D7A29AC315168BE52F028B9927_PresentationViewController__presentationViewController);
  swift_release();
  swift_release();
}

@end