@interface HUPopUpMenuIconCollectionListCell
- (HUPopUpMenuIconCollectionListCell)initWithCoder:(id)a3;
- (HUPopUpMenuIconCollectionListCell)initWithFrame:(CGRect)a3;
- (id)_buildAccessories;
- (void)prepareForReuse;
@end

@implementation HUPopUpMenuIconCollectionListCell

- (id)_buildAccessories
{
  v2 = self;
  sub_1BE4470E4();

  sub_1BE37E9E8(0, &qword_1EA115158);
  v3 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PopUpMenuIconCollectionListCell();
  v2 = (char *)v5.receiver;
  [(HUPopUpMenuIconCollectionListCell *)&v5 prepareForReuse];
  v3 = (void **)&v2[OBJC_IVAR___HUPopUpMenuIconCollectionListCell_menu];
  swift_beginAccess();
  v4 = *v3;
  void *v3 = 0;
}

- (HUPopUpMenuIconCollectionListCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR___HUPopUpMenuIconCollectionListCell_menu) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PopUpMenuIconCollectionListCell();
  return -[HUIconCollectionListCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (HUPopUpMenuIconCollectionListCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR___HUPopUpMenuIconCollectionListCell_menu) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PopUpMenuIconCollectionListCell();
  return [(HUPopUpMenuIconCollectionListCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUPopUpMenuIconCollectionListCell_menu));
}

@end