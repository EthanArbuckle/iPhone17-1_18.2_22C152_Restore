@interface IMBJITAppKitErrorViewController
- (_TtC8Business31IMBJITAppKitErrorViewController)initWithCoder:(id)a3;
- (_TtC8Business31IMBJITAppKitErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation IMBJITAppKitErrorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10008808C();
}

- (_TtC8Business31IMBJITAppKitErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1000BBAC8();
    *(void *)&self->delegate[OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate] = 0;
    swift_unknownObjectWeakInit();
    id v6 = a4;
    NSString v7 = sub_1000BBA88();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->delegate[OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate] = 0;
    swift_unknownObjectWeakInit();
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for IMBJITAppKitErrorViewController();
  v9 = [(IMBJITAppKitErrorViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC8Business31IMBJITAppKitErrorViewController)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IMBJITAppKitErrorViewController();
  return [(IMBJITAppKitErrorViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end