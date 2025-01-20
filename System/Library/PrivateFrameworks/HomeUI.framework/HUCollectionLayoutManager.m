@interface HUCollectionLayoutManager
+ (UIListContentConfiguration)defaultInsetGroupedFooter;
+ (UIListContentConfiguration)defaultProminentInsetGroupedHeader;
- (HUCollectionLayoutManager)init;
- (HUGridSize)gridSizeForItem:(id)a3;
- (id)buildAdaptiveTileSectionFor:(id)a3 layoutEnvironment:(id)a4;
@end

@implementation HUCollectionLayoutManager

- (id)buildAdaptiveTileSectionFor:(id)a3 layoutEnvironment:(id)a4
{
  sub_1BE37E9E8(0, (unint64_t *)&qword_1EBA46790);
  unint64_t v6 = sub_1BE9C4C18();
  v7 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x1A0);
  swift_unknownObjectRetain();
  v8 = self;
  v9 = (void *)v7(a4);
  v10 = (void *)sub_1BE3A5E60(v6, a4);
  objc_msgSend(v9, sel_sectionTopMargin);
  double v12 = v11;
  objc_msgSend(v9, sel_sectionLeadingMargin);
  double v14 = v13;
  objc_msgSend(v9, sel_sectionBottomMargin);
  double v16 = v15;
  objc_msgSend(v9, sel_sectionTrailingMargin);
  objc_msgSend(v10, sel_setContentInsets_, v12, v14, v16, v17);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v10;
}

+ (UIListContentConfiguration)defaultProminentInsetGroupedHeader
{
  return (UIListContentConfiguration *)sub_1BE3A568C((uint64_t)a1, (uint64_t)a2, &qword_1EA111580, (void **)&qword_1EA1134B0);
}

+ (UIListContentConfiguration)defaultInsetGroupedFooter
{
  return (UIListContentConfiguration *)sub_1BE3A568C((uint64_t)a1, (uint64_t)a2, qword_1EA111588, (void **)&qword_1EA1134B8);
}

- (HUGridSize)gridSizeForItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1BE3AE890(v4);
  int64_t v8 = v7;

  int64_t v9 = v6;
  int64_t v10 = v8;
  result.columnsAcross = v10;
  result.rowsDown = v9;
  return result;
}

- (HUCollectionLayoutManager)init
{
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___HUCollectionLayoutManager_adaptiveTilesUsesPrefixes) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUCollectionLayoutManager_layoutOptions) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CollectionLayoutManager();
  return [(HUCollectionLayoutManager *)&v4 init];
}

- (void).cxx_destruct
{
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUCollectionLayoutManager_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUCollectionLayoutManager_layoutOptions);
}

@end