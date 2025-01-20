@interface DOCUserInterfaceState
- (unint64_t)mostRecentlyVisitedBrowseSourceWithFallback:(unint64_t)a3;
- (void)updateMostRecentlyVisitedBrowseSourceToTab:(unint64_t)a3;
@end

@implementation DOCUserInterfaceState

- (unint64_t)mostRecentlyVisitedBrowseSourceWithFallback:(unint64_t)a3
{
  v4 = self;
  id v5 = [(DOCUserInterfaceState *)v4 mostRecentlyVisitedEffectiveTabIdentifier];
  if (v5)
  {
    v6 = v5;
    unint64_t v7 = sub_1001996B0();
    char v9 = v8;

    if ((v9 & 1) == 0) {
      return v7;
    }
  }
  else
  {
  }
  return a3;
}

- (void)updateMostRecentlyVisitedBrowseSourceToTab:(unint64_t)a3
{
  if (a3 > 2)
  {
    __break(1u);
  }
  else
  {
    sub_1004CD2F0();
    id v5 = self;
    id v6 = sub_1004CD2B0();
    swift_bridgeObjectRelease();
    [(DOCUserInterfaceState *)v5 setMostRecentlyVisitedEffectiveTabIdentifier:v6];
  }
}

@end