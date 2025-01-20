@interface MUAspectRatioLayoutInternal
- (MUAspectRatioLayoutInternal)initWithItem:(id)a3 aspectRatio:(double)a4;
- (MULayoutItem)item;
- (double)aspectRatio;
- (void)setAspectRatio:(double)a3;
- (void)setItem:(id)a3;
@end

@implementation MUAspectRatioLayoutInternal

- (MUAspectRatioLayoutInternal)initWithItem:(id)a3 aspectRatio:(double)a4
{
  swift_unknownObjectRetain();
  v6 = (MUAspectRatioLayoutInternal *)sub_19325BAD0(a3, a4);
  swift_unknownObjectRelease();
  return v6;
}

- (MULayoutItem)item
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  v3 = (void *)MEMORY[0x1996FC540](v5);
  sub_1931F0EAC((uint64_t)v5);

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
  sub_19325BB78((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_1931F0EAC((uint64_t)v6);

  swift_unknownObjectRelease();
}

- (double)aspectRatio
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  double v3 = *(double *)&v5[1];
  sub_1931F0EAC((uint64_t)v5);

  return v3;
}

- (void)setAspectRatio:(double)a3
{
  v4 = self;
  sub_19324F3CC((uint64_t)v6);
  double v7 = a3;
  sub_19325BB78((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_1931F0EAC((uint64_t)v6);
}

- (void).cxx_destruct
{
}

@end