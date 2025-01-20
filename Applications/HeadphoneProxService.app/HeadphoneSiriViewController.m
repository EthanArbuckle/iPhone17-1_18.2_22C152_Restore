@interface HeadphoneSiriViewController
- (_TtC20HeadphoneProxService27HeadphoneSiriViewController)initWithContentView:(id)a3;
- (void)continueSetup;
- (void)dismissSetup;
- (void)showLearnMore;
- (void)skipSetup;
@end

@implementation HeadphoneSiriViewController

- (_TtC20HeadphoneProxService27HeadphoneSiriViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneSiriViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneSiriViewController_type] = 22;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneSiriViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

- (void)continueSetup
{
}

- (void)dismissSetup
{
}

- (void)skipSetup
{
}

- (void)showLearnMore
{
}

@end