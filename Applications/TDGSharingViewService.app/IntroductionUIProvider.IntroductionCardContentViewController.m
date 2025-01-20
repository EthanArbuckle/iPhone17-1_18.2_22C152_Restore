@interface IntroductionUIProvider.IntroductionCardContentViewController
- (_TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation IntroductionUIProvider.IntroductionCardContentViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController();
  v2 = (char *)v5.receiver;
  [(IntroductionUIProvider.IntroductionCardContentViewController *)&v5 viewDidLoad];
  v3 = *(void (**)(uint64_t))&v2[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler];
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_10000AE58((uint64_t)v3);
  }
}

- (_TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController)initWithContentView:(id)a3
{
  objc_super v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler];
  v6 = (objc_class *)type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController();
  *(void *)objc_super v5 = 0;
  *((void *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(IntroductionUIProvider.IntroductionCardContentViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end