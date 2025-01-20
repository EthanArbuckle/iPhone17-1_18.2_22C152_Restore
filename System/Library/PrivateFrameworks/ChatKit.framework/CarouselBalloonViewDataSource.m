@interface CarouselBalloonViewDataSource
- (_TtC7ChatKit29CarouselBalloonViewDataSource)init;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation CarouselBalloonViewDataSource

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC7ChatKit29CarouselBalloonViewDataSource_items);
  if (!v3) {
    return 0;
  }
  if (!(v3 >> 62)) {
    return *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = self;
  sub_18F7B6CA0();
  int64_t v6 = sub_18F7BA5F0();

  swift_bridgeObjectRelease();
  return v6;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item = a3->item;
  v4 = self;
  id v6 = sub_18F76A088((uint64_t)v4, v5, item);

  return v6;
}

- (_TtC7ChatKit29CarouselBalloonViewDataSource)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7ChatKit29CarouselBalloonViewDataSource_items) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CarouselBalloonViewDataSource();
  return [(CarouselBalloonViewDataSource *)&v3 init];
}

- (void).cxx_destruct
{
}

@end