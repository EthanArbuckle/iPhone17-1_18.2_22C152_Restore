@interface SummarySharingPreviewSummariesCell
- (_TtC18HealthExperienceUI34SummarySharingPreviewSummariesCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI34SummarySharingPreviewSummariesCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation SummarySharingPreviewSummariesCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD456E5C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC18HealthExperienceUI34SummarySharingPreviewSummariesCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SummarySharingPreviewSummariesCell();
  return -[ButtonCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI34SummarySharingPreviewSummariesCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SummarySharingPreviewSummariesCell();
  return [(ButtonCollectionViewCell *)&v5 initWithCoder:a3];
}

@end