@interface FeedbackListViewController
+ (id)createWithViewModel:(id)a3;
- (_TtC6MailUI26FeedbackListViewController)init;
@end

@implementation FeedbackListViewController

+ (id)createWithViewModel:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = (id)static FeedbackListViewController.create(viewModel:)(a3);

  return v6;
}

- (_TtC6MailUI26FeedbackListViewController)init
{
  return (_TtC6MailUI26FeedbackListViewController *)FeedbackListViewController.init()();
}

@end