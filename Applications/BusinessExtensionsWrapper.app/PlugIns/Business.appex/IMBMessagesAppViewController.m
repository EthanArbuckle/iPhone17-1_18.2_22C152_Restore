@interface IMBMessagesAppViewController
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (IMBMessagesAppViewController)initWithCoder:(id)a3;
- (IMBMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (IMBMessagesAppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation IMBMessagesAppViewController

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100081BD4(v4);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  sub_100081DCC((id)a3);
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController);
  if (v5)
  {
    uint64_t v7 = *(void *)&self->featureFlagArbiter[OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController];
    uint64_t ObjectType = swift_getObjectType();
    v9 = *(double (**)(uint64_t, uint64_t, double, double))(v7 + 16);
    v10 = self;
    id v11 = v5;
    double width = v9(ObjectType, v7, width, height);
    double height = v12;
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (IMBMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1000BBAC8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (IMBMessagesAppViewController *)sub_100083D00(v5, v7, a4);
}

- (IMBMessagesAppViewController)initWithCoder:(id)a3
{
  return (IMBMessagesAppViewController *)sub_100083E7C(a3);
}

- (IMBMessagesAppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___IMBMessagesAppViewController_featureFlagArbiter);
  id v6 = objc_allocWithZone((Class)BCFeatureFlag);
  uint64_t v7 = self;
  id v8 = [v6 init];
  v5[3] = sub_1000074F8(0, (unint64_t *)&unk_1000FF180);
  v5[4] = &off_1000E75F8;
  void *v5 = v8;
  v9 = (Class *)((char *)&v7->super.super.super.super.isa
               + OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController);
  void *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&v7->super.super.super.super.isa
           + OBJC_IVAR___IMBMessagesAppViewController____lazy_storage___dismissalDelegator) = 0;

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for IMBMessagesAppViewController();
  return [(IMBMessagesAppViewController *)&v11 initWithShouldBeSheetPresentationControllerDelegate:v3];
}

- (void).cxx_destruct
{
  sub_10000FE60((uint64_t)self + OBJC_IVAR___IMBMessagesAppViewController_featureFlagArbiter);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController));

  swift_release();
}

@end