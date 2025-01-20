@interface CarouselBalloonViewDataSourceManager
- (_TtC7ChatKit36CarouselBalloonViewDataSourceManager)init;
- (id)createInitialDataSource;
@end

@implementation CarouselBalloonViewDataSourceManager

- (_TtC7ChatKit36CarouselBalloonViewDataSourceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CarouselBalloonViewDataSourceManager();
  v2 = [(PXSectionedDataSourceManager *)&v7 init];
  id v3 = objc_allocWithZone((Class)type metadata accessor for CarouselBalloonViewDataSource());
  v4 = v2;
  id v5 = objc_msgSend(v3, sel_init);
  [(PXSectionedDataSourceManager *)v4 setDataSource:v5 changeDetails:0];

  return v4;
}

- (id)createInitialDataSource
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CarouselBalloonViewDataSource()), sel_init);

  return v2;
}

@end