@interface HUEditableTextIconCell
- (HFItem)item;
- (HUEditableTextIconCell)initWithCoder:(id)a3;
- (HUEditableTextIconCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)setItem:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUEditableTextIconCell

- (HFItem)item
{
  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.isa + OBJC_IVAR___HUEditableTextIconCell_item);
  swift_beginAccess();
  return (HFItem *)*v2;
}

- (void)setItem:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.super.super.super.isa + OBJC_IVAR___HUEditableTextIconCell_item);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EditableTextIconCell();
  v2 = (char *)v5.receiver;
  [(HUEditableTextCollectionListCell *)&v5 prepareForReuse];
  v3 = &v2[OBJC_IVAR___HUEditableTextIconCell_displayStyle];
  swift_beginAccess();
  *(void *)v3 = 1;
  id v4 = sub_1BE4C45A0();
  objc_msgSend(v4, sel_updateWithIconDescriptor_displayStyle_animated_, 0, *(void *)v3, 0);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  id v4 = self;
  sub_1BE4C4BF0(a3);
}

- (void)updateConstraints
{
  v2 = self;
  sub_1BE4C507C();
}

- (HUEditableTextIconCell)initWithFrame:(CGRect)a3
{
  return (HUEditableTextIconCell *)EditableTextIconCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUEditableTextIconCell)initWithCoder:(id)a3
{
  return (HUEditableTextIconCell *)EditableTextIconCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEditableTextIconCell_item));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEditableTextIconCell____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEditableTextIconCell____lazy_storage___iconContainerView));
  sub_1BE39DA0C((uint64_t)self + OBJC_IVAR___HUEditableTextIconCell____lazy_storage___iconAccessory, (uint64_t *)&unk_1EA1166E8);
}

@end