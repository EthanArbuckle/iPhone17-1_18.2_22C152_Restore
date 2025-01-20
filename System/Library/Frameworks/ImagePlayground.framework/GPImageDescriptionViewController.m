@interface GPImageDescriptionViewController
- (UIViewController)presentingViewController;
- (_TtC15ImagePlayground32GPImageDescriptionViewController)initWithContentSnapshot:(id)a3;
@end

@implementation GPImageDescriptionViewController

- (UIViewController)presentingViewController
{
  v2 = self;
  v3 = sub_24418B758();

  return (UIViewController *)v3;
}

- (_TtC15ImagePlayground32GPImageDescriptionViewController)initWithContentSnapshot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GPImageDescriptionViewController();
  return [(AXSSImageDescriptionViewController *)&v5 initWithContentSnapshot:a3];
}

@end