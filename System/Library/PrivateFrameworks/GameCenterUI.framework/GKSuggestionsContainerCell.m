@interface GKSuggestionsContainerCell
+ (NSString)reuseIdentifier;
+ (double)defaultCellHeight;
- (BOOL)canBecomeFocused;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)playerIsSelectable:(id)a3;
- (BOOL)playerIsSelected:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKDashboardMultiplayerPickerDataSource)multiplayerPickerDataSource;
- (NSLayoutConstraint)containerViewLeadingConstraint;
- (NSLayoutConstraint)containerViewTrailingConstraint;
- (UICollectionView)suggestionsCollectionView;
- (UIView)containerView;
- (UIViewController)presentationViewController;
- (_TtC12GameCenterUI26GKSuggestionsContainerCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI26GKSuggestionsContainerCell)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)getSuggestedPlayerGroups;
- (id)nearbyIconTapHandler;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)getMaxPlayerCount;
- (int64_t)getSelectedPlayerCount;
- (void)awakeFromNib;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureWithDelegate:(id)a3 nearbyPlayers:(id)a4;
- (void)didAttemptSelectingAlreadySelectedPlayers:(id)a3 inGroup:(id)a4;
- (void)didDeselectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
- (void)didDeselectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
- (void)didExceedAvailablePlayers;
- (void)didSelectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
- (void)didSelectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6;
- (void)donateGroupToPeopleSuggester:(id)a3;
- (void)handleLongPressGesture:(id)a3;
- (void)layoutSubviews;
- (void)setContainerView:(id)a3;
- (void)setContainerViewLeadingConstraint:(id)a3;
- (void)setContainerViewTrailingConstraint:(id)a3;
- (void)setMultiplayerPickerDataSource:(id)a3;
- (void)setNearbyIconTapHandler:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSuggestionsCollectionView:(id)a3;
- (void)updateNearbyPlayers:(id)a3;
- (void)updateVisibleItemsWithPlayers:(id)a3 excludedIndexPath:(id)a4;
@end

@implementation GKSuggestionsContainerCell

+ (NSString)reuseIdentifier
{
  static GKSuggestionsContainerCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (double)defaultCellHeight
{
  return static GKSuggestionsContainerCell.defaultCellHeight.getter();
}

- (UICollectionView)suggestionsCollectionView
{
}

- (void)setSuggestionsCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF5E3CE4();
}

- (UIView)containerView
{
}

- (void)setContainerView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF5E3DC4();
}

- (UIViewController)presentationViewController
{
  v2 = (void *)GKSuggestionsContainerCell.presentationViewController.getter();

  return (UIViewController *)v2;
}

- (void)setPresentationViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  GKSuggestionsContainerCell.presentationViewController.setter(a3);
}

- (GKDashboardMultiplayerPickerDataSource)multiplayerPickerDataSource
{
  v2 = (void *)GKSuggestionsContainerCell.multiplayerPickerDataSource.getter();

  return (GKDashboardMultiplayerPickerDataSource *)v2;
}

- (void)setMultiplayerPickerDataSource:(id)a3
{
  id v5 = a3;
  v6 = self;
  GKSuggestionsContainerCell.multiplayerPickerDataSource.setter(a3);
}

- (NSLayoutConstraint)containerViewLeadingConstraint
{
}

- (void)setContainerViewLeadingConstraint:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF5E4260();
}

- (NSLayoutConstraint)containerViewTrailingConstraint
{
}

- (void)setContainerViewTrailingConstraint:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF5E4340();
}

- (void)awakeFromNib
{
  v2 = self;
  GKSuggestionsContainerCell.awakeFromNib()();
}

- (void)configureWithDelegate:(id)a3 nearbyPlayers:(id)a4
{
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC38A0);
  unint64_t v6 = sub_1AF7AE2B0();
  swift_unknownObjectRetain();
  v7 = self;
  GKSuggestionsContainerCell.configure(delegate:nearbyPlayers:)(a3, v6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateNearbyPlayers:(id)a3
{
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC38A0);
  uint64_t v4 = sub_1AF7AE2B0();
  id v5 = self;
  GKSuggestionsContainerCell.updateNearbyPlayers(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (id)nearbyIconTapHandler
{
  uint64_t v2 = GKSuggestionsContainerCell.nearbyIconTapHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3F8B2C;
    v6[3] = &block_descriptor_48;
    uint64_t v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setNearbyIconTapHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    uint64_t v4 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v5 = 0;
  }
  unint64_t v6 = self;
  GKSuggestionsContainerCell.nearbyIconTapHandler.setter((uint64_t)v4, v5);
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  GKSuggestionsContainerCell.layoutSubviews()();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  Swift::Int v8 = GKSuggestionsContainerCell.collectionView(_:numberOfItemsInSection:)((UICollectionView *)v7, a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  id v12 = GKSuggestionsContainerCell.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = GKSuggestionsContainerCell.collectionView(_:shouldSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1AF7A9A60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  GKSuggestionsContainerCell.collectionView(_:layout:sizeForItemAt:)(v12);
  double v16 = v15;
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)updateVisibleItemsWithPlayers:(id)a3 excludedIndexPath:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC5F20);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC38A0);
  sub_1AF7AE2B0();
  if (a4)
  {
    sub_1AF7A99E0();
    uint64_t v9 = sub_1AF7A9A60();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = sub_1AF7A9A60();
    uint64_t v10 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v8, v10, 1, v9);
  v11 = self;
  GKSuggestionsContainerCell.updateVisibleItems(players:excludedIndexPath:)();

  swift_bridgeObjectRelease();
  sub_1AF5EFE78((uint64_t)v8);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)handleLongPressGesture:(id)a3
{
  uint64_t v4 = (UILongPressGestureRecognizer *)a3;
  uint64_t v5 = self;
  GKSuggestionsContainerCell.handleLongPressGesture(_:)(v4);
}

- (int64_t)getSelectedPlayerCount
{
  uint64_t v2 = self;
  Swift::Int v3 = GKSuggestionsContainerCell.getSelectedPlayerCount()();

  return v3;
}

- (int64_t)getMaxPlayerCount
{
  uint64_t v2 = self;
  Swift::Int v3 = GKSuggestionsContainerCell.getMaxPlayerCount()();

  return v3;
}

- (void)didSelectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v9 = sub_1AF7A9A60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = _Block_copy(a6);
  sub_1AF7A99E0();
  uint64_t v14 = sub_1AF7AE0E0();
  uint64_t v16 = v15;
  if (v13)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v13;
    id v13 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = a3;
  double v19 = self;
  GKSuggestionsContainerCell.didSelectPlayerGroup(_:indexPath:dataSourceIdentifier:completion:)(v18, (uint64_t)v12, v14, v16, (uint64_t)v13, v17);
  sub_1AF368930((uint64_t)v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)didSelectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v8 = sub_1AF7A9A60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a6);
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC38A0);
  uint64_t v13 = sub_1AF7AE2B0();
  sub_1AF7A99E0();
  uint64_t v14 = sub_1AF7AE0E0();
  uint64_t v16 = v15;
  if (v12)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v12;
    uint64_t v12 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = self;
  GKSuggestionsContainerCell.didSelectPlayers(_:indexPath:dataSourceIdentifier:completion:)(v13, (uint64_t)v11, v14, v16, (uint64_t)v12, v17);
  sub_1AF368930((uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)didDeselectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v9 = sub_1AF7A9A60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  sub_1AF7A99E0();
  uint64_t v14 = sub_1AF7AE0E0();
  uint64_t v16 = v15;
  if (v13)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v13;
    uint64_t v13 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = a3;
  uint64_t v19 = self;
  GKSuggestionsContainerCell.didDeselectPlayerGroup(_:indexPath:dataSourceIdentifier:completion:)(v18, (uint64_t)v12, v14, v16, (uint64_t)v13, v17);
  sub_1AF368930((uint64_t)v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)didDeselectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v8 = sub_1AF7A9A60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a6);
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC38A0);
  uint64_t v13 = sub_1AF7AE2B0();
  sub_1AF7A99E0();
  uint64_t v14 = sub_1AF7AE0E0();
  uint64_t v16 = v15;
  if (v12)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v12;
    uint64_t v12 = sub_1AF388384;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = self;
  GKSuggestionsContainerCell.didDeselectPlayers(_:indexPath:dataSourceIdentifier:completion:)(v13, (uint64_t)v11, v14, v16, (uint64_t)v12, v17);
  sub_1AF368930((uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)didExceedAvailablePlayers
{
  uint64_t v2 = self;
  GKSuggestionsContainerCell.didExceedAvailablePlayers()();
}

- (id)getSuggestedPlayerGroups
{
  uint64_t v2 = self;
  GKSuggestionsContainerCell.getSuggestedPlayerGroups()();

  type metadata accessor for GKSuggestedPlayerGroup();
  Swift::Int v3 = (void *)sub_1AF7AE2A0();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)playerIsSelectable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = GKSuggestionsContainerCell.playerIsSelectable(_:)((GKPlayer)v4);

  return self & 1;
}

- (BOOL)playerIsSelected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = GKSuggestionsContainerCell.playerIsSelected(_:)((GKPlayer)v4);

  return self & 1;
}

- (void)donateGroupToPeopleSuggester:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  GKSuggestionsContainerCell.donateGroupToPeopleSuggester(_:)((uint64_t)v4);
}

- (void)didAttemptSelectingAlreadySelectedPlayers:(id)a3 inGroup:(id)a4
{
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC38A0);
  uint64_t v6 = sub_1AF7AE2B0();
  id v7 = a4;
  uint64_t v8 = self;
  GKSuggestionsContainerCell.didAttemptSelectingAlreadySelectedPlayers(_:inGroup:)(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI26GKSuggestionsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26GKSuggestionsContainerCell *)GKSuggestionsContainerCell.init(frame:)();
}

- (_TtC12GameCenterUI26GKSuggestionsContainerCell)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI26GKSuggestionsContainerCell *)GKSuggestionsContainerCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1AF3E32DC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI26GKSuggestionsContainerCell_suggestionsDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI26GKSuggestionsContainerCell_nearbyIconTapHandler);

  sub_1AF368930(v3);
}

@end