@interface CKNicknameUpdateListViewFactory
+ (id)listViewWithUpdates:(id)a3 delegate:(id)a4;
- (CKNicknameUpdateListViewFactory)init;
@end

@implementation CKNicknameUpdateListViewFactory

+ (id)listViewWithUpdates:(id)a3 delegate:(id)a4
{
  sub_18EF3528C(0, &qword_1E923C8D0);
  unint64_t v5 = sub_18F7B99C0();
  type metadata accessor for NicknameUpdateListViewFactory();
  swift_unknownObjectRetain();
  uint64_t v6 = sub_18F5D987C(v5, (uint64_t)a4);
  id v7 = sub_18F5D935C(v6, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

- (CKNicknameUpdateListViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NicknameUpdateListViewFactory();
  return [(CKNicknameUpdateListViewFactory *)&v3 init];
}

@end