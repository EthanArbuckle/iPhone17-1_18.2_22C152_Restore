@interface MUSizeLayoutInternal
+ (double)useIntrinsicContentSize;
- (CGSize)size;
- (MULayoutItem)item;
- (MUSizeLayoutInternal)initWithItem:(id)a3 size:(CGSize)a4;
- (MUSizeLayoutInternal)initWithItem:(id)a3 size:(CGSize)a4 priority:(float)a5;
- (float)priority;
- (void)setItem:(id)a3;
- (void)setPriority:(float)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation MUSizeLayoutInternal

+ (double)useIntrinsicContentSize
{
  if (qword_1EB4F72E0 != -1) {
    swift_once();
  }
  return *(double *)&static SizeLayout.useIntrinsicContentSize;
}

- (MUSizeLayoutInternal)initWithItem:(id)a3 size:(CGSize)a4
{
  LODWORD(v4) = 1148846080;
  return -[MUSizeLayoutInternal initWithItem:size:priority:](self, sel_initWithItem_size_priority_, a3, a4.width, a4.height, v4);
}

- (MUSizeLayoutInternal)initWithItem:(id)a3 size:(CGSize)a4 priority:(float)a5
{
  double height = a4.height;
  double width = a4.width;
  swift_unknownObjectRetain();
  return (MUSizeLayoutInternal *)SizeLayout.init(item:size:priority:)((uint64_t)a3, width, height, a5);
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
  double v4 = self;
  if (a3) {
    objc_msgSend((id)swift_unknownObjectRetain(), sel__mapsui_disableTranslatesAutoresizingMaskIntoConstraints);
  }
  sub_19324F3CC((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_193219EE8((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_1931F0EAC((uint64_t)v6);
  swift_unknownObjectRelease();
}

- (CGSize)size
{
  v2 = (void *)MEMORY[0x1E4FBC8C8];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x88);
  double v4 = self;
  uint64_t v5 = v3();
  if (v6)
  {
    if (qword_1EB4F72E0 != -1) {
      swift_once();
    }
    uint64_t v7 = static SizeLayout.useIntrinsicContentSize;
  }
  else
  {
    uint64_t v7 = v5;
  }
  uint64_t v8 = (*(uint64_t (**)(void))((*v2 & (uint64_t)v4->super.super.isa) + 0xA0))();
  if (v9)
  {
    if (qword_1EB4F72E0 != -1) {
      swift_once();
    }
    uint64_t v11 = static SizeLayout.useIntrinsicContentSize;
  }
  else
  {
    uint64_t v10 = v8;

    uint64_t v11 = v10;
  }
  double v12 = *(double *)&v7;
  double v13 = *(double *)&v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  SizeLayout.size.setter(width, height);
}

- (float)priority
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  float v3 = v6;
  sub_1931F0EAC((uint64_t)v5);

  return v3;
}

- (void)setPriority:(float)a3
{
  double v4 = self;
  sub_19324F3CC((uint64_t)v6);
  float v7 = a3;
  sub_193219EE8((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_1931F0EAC((uint64_t)v6);
}

- (void).cxx_destruct
{
}

@end