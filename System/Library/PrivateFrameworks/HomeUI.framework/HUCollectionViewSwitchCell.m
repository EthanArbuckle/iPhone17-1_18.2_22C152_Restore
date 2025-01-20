@interface HUCollectionViewSwitchCell
- (BOOL)isDisabled;
- (HFItem)item;
- (_TtC6HomeUI26HUCollectionViewSwitchCell)initWithCoder:(id)a3;
- (_TtC6HomeUI26HUCollectionViewSwitchCell)initWithFrame:(CGRect)a3;
- (_TtP6HomeUI34HUCollectionViewSwitchCellDelegate_)delegate;
- (id)isSelected;
- (void)_toggleOn;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUCollectionViewSwitchCell

- (HFItem)item
{
  v2 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_item);
  swift_beginAccess();
  return (HFItem *)*v2;
}

- (void)setItem:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_item);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)isDisabled
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled);
}

- (void)setDisabled:(BOOL)a3
{
  if (*((unsigned char *)&self->super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled) != a3)
  {
    *((unsigned char *)&self->super.super.super.super.super.super.isa
    + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled) = a3;
    v3 = self;
    sub_1BE532BA4(0);
  }
}

- (_TtP6HomeUI34HUCollectionViewSwitchCellDelegate_)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP6HomeUI34HUCollectionViewSwitchCellDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)isSelected
{
  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for HUCollectionViewSwitchCell();
  return objc_msgSendSuper2(&v2, sel_isSelected);
}

- (_TtC6HomeUI26HUCollectionViewSwitchCell)initWithFrame:(CGRect)a3
{
  return (_TtC6HomeUI26HUCollectionViewSwitchCell *)HUCollectionViewSwitchCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6HomeUI26HUCollectionViewSwitchCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_item) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled) = 0;
  uint64_t v5 = OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_switchView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F42E78]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_delegate) = 0;

  result = (_TtC6HomeUI26HUCollectionViewSwitchCell *)sub_1BE9C5A78();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HUCollectionViewSwitchCell();
  objc_super v2 = v3.receiver;
  [(HUCollectionViewSwitchCell *)&v3 prepareForReuse];
  if (v2[OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled] == 1)
  {
    v2[OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled] = 0;
    sub_1BE532BA4(0);
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_1BE532BA4(v3);
}

- (void)_toggleOn
{
  objc_super v2 = self;
  sub_1BE533090();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_item));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_switchView));

  swift_unknownObjectRelease();
}

@end