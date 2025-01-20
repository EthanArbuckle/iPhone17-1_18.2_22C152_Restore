@interface FBKContentItem
+ (id)areaFilterGroupWithContentItems:(id)a3;
+ (id)assignedToMeFilter;
+ (id)closedFilter;
+ (id)filterGroupsForAll;
+ (id)filterGroupsForTeam:(id)a3;
+ (id)openFilter;
+ (id)originatedByMeFilter;
+ (id)orphanedFilter;
+ (id)personalActionsFilterGroup;
+ (id)responsePendingFilter;
+ (id)teamActionsFilterGroupWithTeam:(id)a3;
+ (id)teamsFilterGroup;
- (BOOL)canResolveNeedsAction;
- (UIColor)itemTitleColor;
- (UIColor)needsActionTintColor;
- (UIColor)orphanBadgeTintColor;
- (UIColor)secondaryTextColor;
- (UIImage)imageForNeedsAction;
- (id)colorForActive:(BOOL)a3;
- (id)keyPathsForValuesAffectingItemTitleColor;
- (id)keyPathsForValuesAffectingSecondaryTextColor;
@end

@implementation FBKContentItem

- (UIColor)needsActionTintColor
{
  BOOL v3 = [(FBKContentItem *)self canResolveNeedsAction];

  return (UIColor *)[(FBKContentItem *)self colorForActive:v3];
}

- (BOOL)canResolveNeedsAction
{
  if ([(FBKContentItem *)self itemType] != (id)4) {
    return 1;
  }
  BOOL v3 = [(FBKContentItem *)self singleTeam];
  id v4 = [v3 teamType];
  v5 = [(FBKContentItem *)self assignee];
  v6 = [v5 ID];
  v7 = [(FBKContentItem *)self user];
  v8 = [v7 ID];
  unsigned __int8 v9 = [v6 isEqualToNumber:v8];

  if (v4) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 1;
  }
  if (-[FBKContentItem isOrphaned](self, "isOrphaned") && [v3 role] == (id)2) {
    BOOL v10 = 1;
  }

  return v10;
}

- (UIColor)orphanBadgeTintColor
{
  id v3 = [(FBKContentItem *)self canReassignFeedback];

  return (UIColor *)[(FBKContentItem *)self colorForActive:v3];
}

- (id)colorForActive:(BOOL)a3
{
  if (a3) {
    +[iFBAConstants tintColor];
  }
  else {
  id v3 = +[UIColor systemFillColor];
  }

  return v3;
}

- (UIImage)imageForNeedsAction
{
  return +[UIImage systemImageNamed:FBKSystemImageNameUnread];
}

- (id)keyPathsForValuesAffectingItemTitleColor
{
  return +[NSSet setWithObjects:@"type", @"closed", 0];
}

- (UIColor)itemTitleColor
{
  if ([(FBKContentItem *)self isClosedFeedback]) {
    +[UIColor secondaryLabelColor];
  }
  else {
  v2 = +[UIColor labelColor];
  }

  return (UIColor *)v2;
}

- (id)keyPathsForValuesAffectingSecondaryTextColor
{
  return +[NSSet setWithObjects:@"closed", 0];
}

- (UIColor)secondaryTextColor
{
  if ([(FBKContentItem *)self isClosedFeedback]) {
    +[UIColor secondaryLabelColor];
  }
  else {
  v2 = +[UIColor labelColor];
  }

  return (UIColor *)v2;
}

+ (id)filterGroupsForTeam:(id)a3
{
  id v3 = a3;
  sub_10008D608(v3);

  type metadata accessor for FBAFilterGroup();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

+ (id)filterGroupsForAll
{
  sub_10008DD7C();
  type metadata accessor for FBAFilterGroup();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

+ (id)assignedToMeFilter
{
  sub_10008C0D0();

  return v2;
}

+ (id)originatedByMeFilter
{
  sub_10008C314();

  return v2;
}

+ (id)responsePendingFilter
{
  NSArray v2 = sub_10008BE38();

  return v2;
}

+ (id)orphanedFilter
{
  id v2 = sub_10008C634();

  return v2;
}

+ (id)openFilter
{
  id v2 = sub_10008BF78();

  return v2;
}

+ (id)closedFilter
{
  id v2 = sub_10008DFDC();

  return v2;
}

+ (id)teamActionsFilterGroupWithTeam:(id)a3
{
  id v4 = a3;
  v5 = sub_10008C86C(a3);

  return v5;
}

+ (id)personalActionsFilterGroup
{
  id v2 = sub_10008E214();

  return v2;
}

+ (id)teamsFilterGroup
{
  id v2 = (void *)sub_10008D7E8();

  return v2;
}

+ (id)areaFilterGroupWithContentItems:(id)a3
{
  sub_100056B94(0, (unint64_t *)&qword_100122990);
  sub_10008DD38((unint64_t *)&qword_100122998, (unint64_t *)&qword_100122990);
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = (void *)sub_10008D0E8(v3);
  swift_bridgeObjectRelease();

  return v4;
}

@end