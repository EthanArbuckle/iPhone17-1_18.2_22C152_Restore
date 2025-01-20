@interface DOCConfiguration
- (BOOL)allowsDisplaying:(id)a3;
- (BOOL)canPresentContentForTab:(unint64_t)a3;
- (_TtP17RecentsAppPopover31DOCSourceListInterfaceProviding_)sourceListUI;
- (void)configureContextForDisplayingTab:(unint64_t)a3;
- (void)updateStateAndSceneIdentifiersWithWindow:(id)a3;
@end

@implementation DOCConfiguration

- (void)configureContextForDisplayingTab:(unint64_t)a3
{
  if (a3 > 2) {
    __break(1u);
  }
  else {
    [(DOCConfiguration *)self setDefaultEffectiveTabIdentifierForLocationRestore:*(void *)*(&off_1005A6CE8 + a3)];
  }
}

- (BOOL)canPresentContentForTab:(unint64_t)a3
{
  v4 = self;
  if (![(DOCConfiguration *)v4 forSavingDocuments])
  {
    BOOL v5 = 1;
    goto LABEL_5;
  }
  if (a3 < 3)
  {
    BOOL v5 = (a3 & 7) == 2;
LABEL_5:

    return v5;
  }
  type metadata accessor for DOCTab(0);
  BOOL result = sub_1004C08A0();
  __break(1u);
  return result;
}

- (BOOL)allowsDisplaying:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  LOBYTE(self) = sub_100095740(v4);

  return self & 1;
}

- (void)updateStateAndSceneIdentifiersWithWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001B6C60(a3);
}

- (_TtP17RecentsAppPopover31DOCSourceListInterfaceProviding_)sourceListUI
{
  type metadata accessor for DOCSourceListInterface_Default();
  v3 = self;
  inited = (void *)swift_initStaticObject();

  return (_TtP17RecentsAppPopover31DOCSourceListInterfaceProviding_ *)inited;
}

@end