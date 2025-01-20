@interface HUNoResponseResidentsBannerItem
- (HUNoResponseResidentsBannerItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUNoResponseResidentsBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  if (a3) {
    sub_1BE9C4908();
  }
  v4 = self;
  id v5 = sub_1BE480460();

  swift_bridgeObjectRelease();

  return v5;
}

- (HUNoResponseResidentsBannerItem)initWithHome:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoResponseResidentsBannerItem();
  return [(HUBannerItem *)&v5 initWithHome:a3];
}

@end