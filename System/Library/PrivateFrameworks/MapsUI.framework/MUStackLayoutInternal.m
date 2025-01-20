@interface MUStackLayoutInternal
- (BOOL)alignmentBoundsContent;
- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3;
- (BOOL)distributionBoundsContent;
- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3;
- (MULayoutItem)container;
- (MUStackLayoutInternal)initWithContainer:(id)a3 axis:(int64_t)a4;
- (NSArray)arrangedLayoutItems;
- (NSDirectionalEdgeInsets)insets;
- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3;
- (UIOffset)offsetForArrangedLayoutItem:(id)a3;
- (double)spacing;
- (float)alignmentFittingSizePriority;
- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3;
- (float)distributionFittingSizePriority;
- (int64_t)alignment;
- (int64_t)alignmentForArrangedLayoutItem:(id)a3;
- (int64_t)axis;
- (int64_t)distribution;
- (void)addArrangedLayoutItem:(id)a3;
- (void)disableAlignmentForArrangedLayoutItem:(id)a3;
- (void)removeArrangedLayoutItem:(id)a3;
- (void)resetAlignmentForArrangedLayoutItem:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4;
- (void)setAlignmentBoundsContent:(BOOL)a3;
- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4;
- (void)setAlignmentFittingSizePriority:(float)a3;
- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4;
- (void)setArrangedLayoutItems:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setContainer:(id)a3;
- (void)setDistribution:(int64_t)a3;
- (void)setDistributionBoundsContent:(BOOL)a3;
- (void)setDistributionFittingSizePriority:(float)a3;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4;
- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4;
- (void)setSpacing:(double)a3;
@end

@implementation MUStackLayoutInternal

- (MUStackLayoutInternal)initWithContainer:(id)a3 axis:(int64_t)a4
{
  return (MUStackLayoutInternal *)StackLayout.init(container:axis:)((uint64_t)a3, a4);
}

- (MULayoutItem)container
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  v3 = (void *)MEMORY[0x1996FC540](v5);
  sub_193214F1C((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setContainer:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_19324F3CC((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
  sub_193214E14();
  swift_unknownObjectRelease();
}

- (int64_t)axis
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  int64_t v3 = v5[1];
  sub_193214F1C((uint64_t)v5);

  return v3;
}

- (void)setAxis:(int64_t)a3
{
  v4 = self;
  sub_19324F3CC((uint64_t)v6);
  int64_t v7 = a3;
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
}

- (int64_t)distribution
{
  v2 = self;
  sub_19324F3CC((uint64_t)v6);
  uint64_t v3 = v6[3];
  sub_193214F1C((uint64_t)v6);
  int64_t v4 = sub_19325BD90(v3);

  return v4;
}

- (void)setDistribution:(int64_t)a3
{
  int64_t v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325BE10(a3);
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
}

- (BOOL)distributionBoundsContent
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  unsigned int v3 = v5[6];
  sub_193214F1C((uint64_t)v5);
  LOBYTE(v3) = sub_19325C35C(v3);

  return v3 & 1;
}

- (void)setDistributionBoundsContent:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C3AC(v3);
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
}

- (float)distributionFittingSizePriority
{
  v2 = self;
  sub_19324F3CC((uint64_t)v6);
  uint64_t v3 = v6[3];
  sub_193214F1C((uint64_t)v6);
  float v4 = sub_19325C308(v3);

  return v4;
}

- (void)setDistributionFittingSizePriority:(float)a3
{
  float v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C4D4(a3);
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
}

- (int64_t)alignment
{
  v2 = self;
  sub_19324F3CC((uint64_t)v6);
  unsigned int v3 = v6[8];
  sub_193214F1C((uint64_t)v6);
  int64_t v4 = sub_19325C03C(v3);

  return v4;
}

- (void)setAlignment:(int64_t)a3
{
  int64_t v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C050(a3);
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
}

- (BOOL)alignmentBoundsContent
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  unsigned int v3 = v5[8];
  sub_193214F1C((uint64_t)v5);
  LOBYTE(v3) = sub_19325C6C0(v3);

  return v3 & 1;
}

- (void)setAlignmentBoundsContent:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C704(v3);
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
}

- (float)alignmentFittingSizePriority
{
  v2 = self;
  sub_19324F3CC((uint64_t)v6);
  uint64_t v3 = v6[4];
  sub_193214F1C((uint64_t)v6);
  float v4 = sub_19325C678(v3);

  return v4;
}

- (void)setAlignmentFittingSizePriority:(float)a3
{
  float v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C7A4(a3);
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
}

- (double)spacing
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  double v3 = *(double *)&v5[5];
  sub_193214F1C((uint64_t)v5);

  return v3;
}

- (void)setSpacing:(double)a3
{
  float v4 = self;
  sub_19324F3CC((uint64_t)v6);
  double v7 = a3;
  sub_193214F4C((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193214F1C((uint64_t)v6);
}

- (NSDirectionalEdgeInsets)insets
{
  v2 = self;
  sub_19324F3CC((uint64_t)v11);
  double v3 = *(double *)&v11[6];
  double v4 = *(double *)&v11[7];
  double v5 = *(double *)&v11[8];
  double v6 = *(double *)&v11[9];
  sub_193214F1C((uint64_t)v11);

  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.trailing = v10;
  result.bottom = v9;
  result.leading = v8;
  result.top = v7;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  CGFloat leading = a3.leading;
  CGFloat top = a3.top;
  double v7 = self;
  sub_19324F3CC((uint64_t)v9);
  CGFloat v10 = top;
  CGFloat v11 = leading;
  CGFloat v12 = bottom;
  CGFloat v13 = trailing;
  sub_193214F4C((uint64_t)v9, (uint64_t)v8);
  sub_19324F470((uint64_t)v8);
  sub_193214F1C((uint64_t)v9);
}

- (void).cxx_destruct
{
}

- (NSArray)arrangedLayoutItems
{
  v2 = self;
  StackLayout.arrangedLayoutItems.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4F6ED0);
  double v3 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setArrangedLayoutItems:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4F6ED0);
  unint64_t v4 = sub_193341460();
  double v5 = self;
  StackLayout.arrangedLayoutItems.setter(v4);
}

- (void)addArrangedLayoutItem:(id)a3
{
}

- (void)removeArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain_n();
  unint64_t v4 = self;
  sub_1932755BC();
  double v5 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v4->super.super.isa)
                                                                                + 0xB0))(v10);
  uint64_t v7 = v6;
  uint64_t v8 = sub_193217BC0(sub_1932184E4);
  int64_t v9 = *(void *)(*(void *)v7 + 16);
  if (v9 < v8)
  {
    __break(1u);
  }
  else
  {
    sub_193217F0C(v8, v9);
    v5(v10, 0);
    sub_193214F5C((uint64_t)v11);
    swift_unknownObjectRelease();
  }
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  double v5 = StackLayout.padding(forArrangedLayoutItem:)();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  swift_unknownObjectRelease();

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.CGFloat trailing = v15;
  result.CGFloat bottom = v14;
  result.CGFloat leading = v13;
  result.CGFloat top = v12;
  return result;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  swift_unknownObjectRetain();
  double v9 = self;
  StackLayout.setPadding(_:forArrangedLayoutItem:)(top, leading, bottom, trailing);
  swift_unknownObjectRelease();
}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  double v5 = StackLayout.offset(forArrangedLayoutItem:)();
  double v7 = v6;
  swift_unknownObjectRelease();

  double v8 = v5;
  double v9 = v7;
  result.vertical = v9;
  result.horizontal = v8;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  swift_unknownObjectRetain();
  double v7 = self;
  StackLayout.setOffset(_:forArrangedLayoutItem:)(horizontal, vertical);
  swift_unknownObjectRelease();
}

- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  unsigned int v5 = ~sub_193216AC4();
  swift_unknownObjectRelease();

  return (v5 & 0xFFFFFFFE) != 0;
}

- (void)disableAlignmentForArrangedLayoutItem:(id)a3
{
}

- (void)resetAlignmentForArrangedLayoutItem:(id)a3
{
}

- (int64_t)alignmentForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  unsigned int v5 = sub_193216AC4();
  if ((~v5 & 0xFFFFFFFE) == 0) {
    unsigned int v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v4->super.super.isa) + 0x118))();
  }
  int64_t v6 = sub_19325C03C(v5);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  swift_unknownObjectRetain();
  int64_t v6 = self;
  StackLayout.setAlignmentKind(_:forArrangedLayoutItem:)(a3);
  swift_unknownObjectRelease();
}

- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  unsigned int v5 = sub_193216AC4();
  if ((~v5 & 0xFFFFFFFE) != 0) {
    char v6 = sub_19325C6C0(v5);
  }
  else {
    char v6 = 0;
  }
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  swift_unknownObjectRetain();
  char v6 = self;
  StackLayout.setAlignmentBoundsContent(_:forArrangedLayoutItem:)(a3);
  swift_unknownObjectRelease();
}

- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  uint64_t v5 = sub_193216AC4();
  float v6 = 0.0;
  if ((~v5 & 0xFFFFFFFE) != 0) {
    float v6 = sub_19325C678(v5);
  }
  swift_unknownObjectRelease();

  return v6;
}

- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  swift_unknownObjectRetain();
  float v6 = self;
  StackLayout.setAlignmentFittingSizePriority(_:forArrangedLayoutItem:)(a3);
  swift_unknownObjectRelease();
}

@end