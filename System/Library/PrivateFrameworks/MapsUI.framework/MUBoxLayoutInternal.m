@interface MUBoxLayoutInternal
- (BOOL)hasHorizontalAlignmentForArrangedLayoutItem:(id)a3;
- (BOOL)hasVerticalAlignmentForArrangedLayoutItem:(id)a3;
- (BOOL)horizontalAlignmentBoundsContent;
- (BOOL)horizontalAlignmentBoundsContentForArrangedLayoutItem:(id)a3;
- (BOOL)verticalAlignmentBoundsContent;
- (BOOL)verticalAlignmentBoundsContentForArrangedLayoutItem:(id)a3;
- (MUBoxLayoutInternal)initWithContainer:(id)a3;
- (MULayoutItem)container;
- (NSArray)arrangedLayoutItems;
- (NSDirectionalEdgeInsets)insets;
- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3;
- (UIOffset)offsetForArrangedLayoutItem:(id)a3;
- (float)horizontalAlignmentFittingSizePriority;
- (float)horizontalFittingSizePriorityForArrangedLayoutItem:(id)a3;
- (float)verticalAlignmentFittingSizePriority;
- (float)verticalFittingSizePriorityForArrangedLayoutItem:(id)a3;
- (int64_t)horizontalAlignment;
- (int64_t)horizontalAlignmentForArrangedLayoutItem:(id)a3;
- (int64_t)verticalAlignment;
- (int64_t)verticalAlignmentForArrangedLayoutItem:(id)a3;
- (void)addArrangedLayoutItem:(id)a3;
- (void)disableHorizontalAlignmentForArrangedLayoutItem:(id)a3;
- (void)disableVerticalAlignmentForArrangedLayoutItem:(id)a3;
- (void)removeArrangedLayoutItem:(id)a3;
- (void)resetHorizontalAlignmentForArrangedLayoutItem:(id)a3;
- (void)resetVerticalAlignmentForArrangedLayoutItem:(id)a3;
- (void)setArrangedLayoutItems:(id)a3;
- (void)setContainer:(id)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setHorizontalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4;
- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3;
- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4;
- (void)setHorizontalAlignmentFittingSizePriority:(float)a3;
- (void)setHorizontalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4;
- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4;
- (void)setVerticalAlignment:(int64_t)a3;
- (void)setVerticalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4;
- (void)setVerticalAlignmentBoundsContent:(BOOL)a3;
- (void)setVerticalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4;
- (void)setVerticalAlignmentFittingSizePriority:(float)a3;
- (void)setVerticalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4;
@end

@implementation MUBoxLayoutInternal

- (MUBoxLayoutInternal)initWithContainer:(id)a3
{
  swift_unknownObjectRetain();
  v3 = (MUBoxLayoutInternal *)sub_193220FC0();
  swift_unknownObjectRelease();
  return v3;
}

- (MULayoutItem)container
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  v3 = (void *)MEMORY[0x1996FC540](v5);
  sub_193221074((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setContainer:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_19324F3CC((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_1932210A4((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193221074((uint64_t)v6);
  swift_unknownObjectRelease();
}

- (int64_t)verticalAlignment
{
  v2 = self;
  sub_19324F3CC((uint64_t)v6);
  unsigned int v3 = v6[4];
  sub_193221074((uint64_t)v6);
  int64_t v4 = sub_19325C03C(v3);

  return v4;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  int64_t v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C050(a3);
  sub_1932210A4((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193221074((uint64_t)v6);
}

- (BOOL)verticalAlignmentBoundsContent
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  unsigned int v3 = v5[4];
  sub_193221074((uint64_t)v5);
  LOBYTE(v3) = sub_19325C6C0(v3);

  return v3 & 1;
}

- (void)setVerticalAlignmentBoundsContent:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C704(v3);
  sub_1932210A4((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193221074((uint64_t)v6);
}

- (float)verticalAlignmentFittingSizePriority
{
  v2 = self;
  sub_19324F3CC((uint64_t)v6);
  uint64_t v3 = v6[2];
  sub_193221074((uint64_t)v6);
  float v4 = sub_19325C678(v3);

  return v4;
}

- (void)setVerticalAlignmentFittingSizePriority:(float)a3
{
  float v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C7A4(a3);
  sub_1932210A4((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193221074((uint64_t)v6);
}

- (int64_t)horizontalAlignment
{
  v2 = self;
  sub_19324F3CC((uint64_t)v6);
  unsigned int v3 = v6[6];
  sub_193221074((uint64_t)v6);
  int64_t v4 = sub_19325C03C(v3);

  return v4;
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  int64_t v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C050(a3);
  sub_1932210A4((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193221074((uint64_t)v6);
}

- (BOOL)horizontalAlignmentBoundsContent
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  unsigned int v3 = v5[6];
  sub_193221074((uint64_t)v5);
  LOBYTE(v3) = sub_19325C6C0(v3);

  return v3 & 1;
}

- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C704(v3);
  sub_1932210A4((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193221074((uint64_t)v6);
}

- (float)horizontalAlignmentFittingSizePriority
{
  v2 = self;
  sub_19324F3CC((uint64_t)v6);
  uint64_t v3 = v6[3];
  sub_193221074((uint64_t)v6);
  float v4 = sub_19325C678(v3);

  return v4;
}

- (void)setHorizontalAlignmentFittingSizePriority:(float)a3
{
  float v4 = self;
  sub_19324F3CC((uint64_t)v6);
  sub_19325C7A4(a3);
  sub_1932210A4((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193221074((uint64_t)v6);
}

- (NSDirectionalEdgeInsets)insets
{
  v2 = self;
  sub_19324F3CC((uint64_t)v11);
  double v3 = *(double *)&v11[4];
  double v4 = *(double *)&v11[5];
  double v5 = *(double *)&v11[6];
  double v6 = *(double *)&v11[7];
  sub_193221074((uint64_t)v11);

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
  sub_1932210A4((uint64_t)v9, (uint64_t)v8);
  sub_19324F470((uint64_t)v8);
  sub_193221074((uint64_t)v9);
}

- (void).cxx_destruct
{
}

- (NSArray)arrangedLayoutItems
{
  v2 = self;
  BoxLayout.arrangedLayoutItems.getter();

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
  BoxLayout.arrangedLayoutItems.setter(v4);
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
                                                                                + 0x98))(v10);
  uint64_t v7 = v6;
  sub_193220B94(sub_1932184E4);
  int64_t v9 = *(void *)(*(void *)v7 + 16);
  if (v9 < v8)
  {
    __break(1u);
  }
  else
  {
    sub_193221348(v8, v9);
    v5(v10, 0);
    sub_193214F5C((uint64_t)v11);
    swift_unknownObjectRelease();
  }
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  double v5 = BoxLayout.padding(forArrangedLayoutItem:)();
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
  BoxLayout.setPadding(_:forArrangedLayoutItem:)(top, leading, bottom, trailing);
  swift_unknownObjectRelease();
}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  double v5 = BoxLayout.offset(forArrangedLayoutItem:)();
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
  BoxLayout.setOffset(_:forArrangedLayoutItem:)(horizontal, vertical);
  swift_unknownObjectRelease();
}

- (BOOL)hasVerticalAlignmentForArrangedLayoutItem:(id)a3
{
  return sub_19321FDA4(self, (uint64_t)a2, (uint64_t)a3, (unsigned int (*)(uint64_t))sub_19321F198);
}

- (void)disableVerticalAlignmentForArrangedLayoutItem:(id)a3
{
}

- (void)resetVerticalAlignmentForArrangedLayoutItem:(id)a3
{
}

- (int64_t)verticalAlignmentForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  unsigned int v5 = sub_19321F198();
  if ((~v5 & 0xFFFFFFFE) == 0) {
    unsigned int v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v4->super.super.isa) + 0xA0))();
  }
  int64_t v6 = sub_19325C03C(v5);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setVerticalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)verticalAlignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return sub_193220448(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_19321F198);
}

- (void)setVerticalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
}

- (float)verticalFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  return sub_193220780(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_19321F198);
}

- (void)setVerticalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)hasHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
  return sub_19321FDA4(self, (uint64_t)a2, (uint64_t)a3, (unsigned int (*)(uint64_t))sub_19321FBFC);
}

- (void)disableHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
}

- (void)resetHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
}

- (int64_t)horizontalAlignmentForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  unint64_t v4 = self;
  unsigned int v5 = sub_19321FBFC();
  if ((~v5 & 0xFFFFFFFE) == 0) {
    unsigned int v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v4->super.super.isa) + 0x100))();
  }
  int64_t v6 = sub_19325C03C(v5);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setHorizontalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)horizontalAlignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return sub_193220448(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_19321FBFC);
}

- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
}

- (float)horizontalFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  return sub_193220780(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_19321FBFC);
}

- (void)setHorizontalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
}

@end