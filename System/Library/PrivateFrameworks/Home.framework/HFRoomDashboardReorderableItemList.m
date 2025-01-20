@interface HFRoomDashboardReorderableItemList
- (HFRoomDashboardReorderableItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4;
@end

@implementation HFRoomDashboardReorderableItemList

- (HFRoomDashboardReorderableItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4
{
  sub_20BCE7620();
  swift_unknownObjectRetain();
  v6 = (void *)sub_20BCE75E0();
  swift_bridgeObjectRelease();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RoomDashboardReorderableItemList();
  v7 = [(HFDashboardReorderableItemList *)&v9 initWithApplicationDataContainer:a3 category:v6];

  swift_unknownObjectRelease();
  return v7;
}

@end