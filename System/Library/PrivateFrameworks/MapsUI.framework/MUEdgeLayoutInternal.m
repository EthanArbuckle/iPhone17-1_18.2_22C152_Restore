@interface MUEdgeLayoutInternal
- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4;
- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5;
- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5 edges:(unint64_t)a6 priority:(float)a7;
- (MULayoutItem)container;
- (MULayoutItem)item;
- (NSDirectionalEdgeInsets)insets;
- (float)priority;
- (unint64_t)edges;
- (void)setContainer:(id)a3;
- (void)setEdges:(unint64_t)a3;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setItem:(id)a3;
- (void)setPriority:(float)a3;
@end

@implementation MUEdgeLayoutInternal

- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5 edges:(unint64_t)a6 priority:(float)a7
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = (MUEdgeLayoutInternal *)sub_19320B2A0(a3, top, leading, bottom, trailing, a7, (uint64_t)a4, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v15;
}

- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4
{
  return -[MUEdgeLayoutInternal initWithItem:container:insets:](self, sel_initWithItem_container_insets_, a3, a4, *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
}

- (MUEdgeLayoutInternal)initWithItem:(id)a3 container:(id)a4 insets:(NSDirectionalEdgeInsets)a5
{
  LODWORD(v5) = 1148846080;
  return -[MUEdgeLayoutInternal initWithItem:container:insets:edges:priority:](self, sel_initWithItem_container_insets_edges_priority_, a3, a4, 15, a5.top, a5.leading, a5.bottom, a5.trailing, v5);
}

- (MULayoutItem)item
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  v3 = (void *)MEMORY[0x1996FC540](v5);
  sub_19320B3F8((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setItem:(id)a3
{
  v4 = self;
  if (a3) {
    objc_msgSend((id)swift_unknownObjectRetain(), sel__mapsui_disableTranslatesAutoresizingMaskIntoConstraints);
  }
  sub_19324F3CC((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_19320B428((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_19320B3F8((uint64_t)v6);
  swift_unknownObjectRelease();
}

- (MULayoutItem)container
{
  v2 = self;
  sub_19324F3CC((uint64_t)&v5);
  v3 = (void *)MEMORY[0x1996FC540](&v6);
  sub_19320B3F8((uint64_t)&v5);

  return (MULayoutItem *)v3;
}

- (void)setContainer:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_19324F3CC((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_19320B428((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_19320B3F8((uint64_t)v6);
  swift_unknownObjectRelease();
}

- (NSDirectionalEdgeInsets)insets
{
  v2 = self;
  sub_19324F3CC((uint64_t)v11);
  double v3 = *(double *)&v11[2];
  double v4 = *(double *)&v11[3];
  double v5 = *(double *)&v11[4];
  double v6 = *(double *)&v11[5];
  sub_19320B3F8((uint64_t)v11);

  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.double trailing = v10;
  result.double bottom = v9;
  result.double leading = v8;
  result.double top = v7;
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
  sub_19320B428((uint64_t)v9, (uint64_t)v8);
  sub_19324F470((uint64_t)v8);
  sub_19320B3F8((uint64_t)v9);
}

- (unint64_t)edges
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  unint64_t v3 = v5[6];
  sub_19320B3F8((uint64_t)v5);

  return v3;
}

- (void)setEdges:(unint64_t)a3
{
  double v4 = self;
  sub_19324F3CC((uint64_t)v6);
  unint64_t v7 = a3;
  sub_19320B428((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_19320B3F8((uint64_t)v6);
}

- (float)priority
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  float v3 = *(float *)&v5[14];
  sub_19320B3F8((uint64_t)v5);

  return v3;
}

- (void)setPriority:(float)a3
{
  double v4 = self;
  sub_19324F3CC((uint64_t)v6);
  float v7 = a3;
  sub_19320B428((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_19320B3F8((uint64_t)v6);
}

- (void).cxx_destruct
{
}

@end