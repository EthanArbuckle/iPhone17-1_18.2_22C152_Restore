@interface DownloadingDataCell
- (_TtC18HealthExperienceUI19DownloadingDataCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI19DownloadingDataCell)initWithFrame:(CGRect)a3;
@end

@implementation DownloadingDataCell

- (_TtC18HealthExperienceUI19DownloadingDataCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI19DownloadingDataCell_item;
  v9 = (objc_class *)type metadata accessor for DownloadingDataCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v15.receiver = self;
  v15.super_class = v9;
  v10 = -[DownloadingDataCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v11 = self;
  v12 = v10;
  id v13 = objc_msgSend(v11, sel_secondarySystemGroupedBackgroundColor);
  [(DownloadingDataCell *)v12 setBackgroundColor:v13];

  sub_1AD63AF50();
  return v12;
}

- (_TtC18HealthExperienceUI19DownloadingDataCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI19DownloadingDataCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI19DownloadingDataCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end