@interface HUTileCell
+ (double)minimumDescriptionScaleFactor;
- (BOOL)isRearranging;
- (BOOL)prefixLabelShouldFeather;
- (BOOL)primaryLabelShouldFeather;
- (BOOL)recognizeDoubleClickGesture;
- (BOOL)reorderable;
- (BOOL)secondaryLabelShouldFeather;
- (BOOL)showPrefixLabel;
- (BOOL)toggleable;
- (BOOL)useMutedIconOffColors;
- (CGRect)bounds;
- (CGRect)iconViewTileFrame;
- (CGRect)prefixLabelTileFrame;
- (CGRect)primaryLabelTileFrame;
- (CGRect)secondaryLabelTileFrame;
- (CGRect)tileFrame;
- (HFItem)item;
- (HUBackgroundEffectViewGrouping)backgroundEffectGrouper;
- (HUGridSize)gridSize;
- (HUTileCell)initWithCoder:(id)a3;
- (HUTileCell)initWithFrame:(CGRect)a3;
- (UICellConfigurationState)_bridgedConfigurationState;
- (UIColor)backgroundColor;
- (double)backgroundCornerRadius;
- (id)baseIconViewConfiguration;
- (id)createBackgroundBlurView;
- (id)prefixLabelFont;
- (id)prefixLabelOffTextColor;
- (id)prefixLabelOnTextColor;
- (id)prefixLabelTextColor;
- (id)prefixString;
- (id)primaryLabelFont;
- (id)primaryLabelOffTextColor;
- (id)primaryLabelOnTextColor;
- (id)primaryLabelTextColor;
- (id)primaryString;
- (id)secondaryAttributedString;
- (id)secondaryLabelFont;
- (id)secondaryLabelOffTextColor;
- (id)secondaryLabelOnTextColor;
- (id)secondaryLabelTextColor;
- (id)secondaryString;
- (id)tappableAreaForPoint:(CGPoint)a3;
- (unint64_t)backgroundDisplayStyle;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)animateIconTouchDown;
- (void)animateIconTouchUp;
- (void)configureDragItem:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundDisplayStyle:(unint64_t)a3;
- (void)setBackgroundEffectGrouper:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setGridSize:(HUGridSize)a3;
- (void)setItem:(id)a3;
- (void)setRearranging:(BOOL)a3;
- (void)setReorderable:(BOOL)a3;
- (void)setShowPrefixLabel:(BOOL)a3;
- (void)setToggleable:(BOOL)a3;
- (void)setUseMutedIconOffColors:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUTileCell

- (HFItem)item
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUTileCell_item);
  swift_beginAccess();
  return (HFItem *)*v2;
}

- (void)setItem:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BE4E8BF0(a3);
}

- (BOOL)showPrefixLabel
{
  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_showPrefixLabel;
  swift_beginAccess();
  return *v2;
}

- (void)setShowPrefixLabel:(BOOL)a3
{
}

- (BOOL)toggleable
{
  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_toggleable;
  swift_beginAccess();
  return *v2;
}

- (void)setToggleable:(BOOL)a3
{
}

- (BOOL)useMutedIconOffColors
{
  v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_useMutedIconOffColors;
  swift_beginAccess();
  return *v2;
}

- (void)setUseMutedIconOffColors:(BOOL)a3
{
}

- (HUBackgroundEffectViewGrouping)backgroundEffectGrouper
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUBackgroundEffectViewGrouping *)v2;
}

- (void)setBackgroundEffectGrouper:(id)a3
{
  id v5 = (id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUTileCell_backgroundEffectGrouper);
  swift_beginAccess();
  *id v5 = a3;
  swift_unknownObjectRetain_n();
  v6 = self;
  swift_unknownObjectRelease();
  [(HUTileCell *)v6 setNeedsUpdateConfiguration];

  swift_unknownObjectRelease();
}

- (unint64_t)backgroundDisplayStyle
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUTileCell_backgroundDisplayStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundDisplayStyle:(unint64_t)a3
{
  id v5 = (unint64_t *)((char *)self + OBJC_IVAR___HUTileCell_backgroundDisplayStyle);
  swift_beginAccess();
  unint64_t v6 = *v5;
  *id v5 = a3;
  if (v6 != a3) {
    [(HUTileCell *)self setNeedsUpdateConfiguration];
  }
}

- (HUGridSize)gridSize
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___HUTileCell__gridSize);
  if (*((unsigned char *)&self->super.super.super.super.__layeringSceneIdentity + OBJC_IVAR___HUTileCell__gridSize) == 1)
  {
    v3 = self;
    uint64_t v4 = sub_1BE4ECF94(v3);
    int64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = *v2;
    int64_t v6 = v2[1];
  }
  int64_t v7 = v4;
  int64_t v8 = v6;
  result.columnsAcross = v8;
  result.rowsDown = v7;
  return result;
}

- (void)setGridSize:(HUGridSize)a3
{
  v3 = (HUGridSize *)((char *)self + OBJC_IVAR___HUTileCell__gridSize);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUTileCell__gridSize);
  uint64_t v5 = *(void *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR___HUTileCell__gridSize);
  char v6 = *((unsigned char *)&self->super.super.super.super.__layeringSceneIdentity + OBJC_IVAR___HUTileCell__gridSize);
  HUGridSize *v3 = a3;
  LOBYTE(v3[1].rowsDown) = 0;
  if ((v6 & 1) != 0 || (a3.rowsDown == v4 ? (BOOL v7 = a3.columnsAcross == v5) : (BOOL v7 = 0), !v7)) {
    [(HUTileCell *)self setNeedsUpdateConfiguration];
  }
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TileCell();
  [(HUTileCell *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v7 = self;
  sub_1BE4ED328(x, y, width, height);
}

- (id)tappableAreaForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v5 = self;
  objc_super v6 = sub_1BE4EA144(x, y);

  return v6;
}

- (void)animateIconTouchDown
{
}

- (void)animateIconTouchUp
{
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = sub_1BE9C3378();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  objc_super v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v7 = self;
  sub_1BE4ED658((uint64_t)v6);

  int64_t v8 = (void *)sub_1BE9C3358();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (UICellConfigurationState *)v8;
}

- (void)prepareForReuse
{
  double v2 = self;
  sub_1BE4EDE2C();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1BE9C3378();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  BOOL v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C3368();
  int64_t v8 = self;
  sub_1BE4EE218((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TileCell();
  id v4 = a3;
  id v5 = v6.receiver;
  [(HUTileCell *)&v6 traitCollectionDidChange:v4];
  objc_msgSend(v5, sel_setNeedsUpdateConfiguration, v6.receiver, v6.super_class);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
}

- (BOOL)isRearranging
{
  double v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_isRearranging;
  swift_beginAccess();
  return *v2;
}

- (void)setRearranging:(BOOL)a3
{
  id v4 = self;
  sub_1BE4EA474(a3);
}

- (BOOL)reorderable
{
  double v2 = (BOOL *)self + OBJC_IVAR___HUTileCell_reorderable;
  swift_beginAccess();
  return *v2;
}

- (void)setReorderable:(BOOL)a3
{
  id v4 = self;
  sub_1BE4EA7BC(a3);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1BE4EE6A0();
}

- (HUTileCell)initWithFrame:(CGRect)a3
{
  return (HUTileCell *)TileCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUTileCell)initWithCoder:(id)a3
{
  return (HUTileCell *)TileCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___HUTileCell_dynamicGridSizeCalculator;

  sub_1BE37E904((uint64_t)v3);
}

- (void)configureDragItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  TileCell.configureDragItem(_:)((UIDragItem)v4);
}

+ (double)minimumDescriptionScaleFactor
{
  return 0.8;
}

- (id)prefixString
{
  return sub_1BE5A439C(self, (uint64_t)a2, (void (*)(void))TileCell.prefixString());
}

- (id)primaryString
{
  return sub_1BE5A439C(self, (uint64_t)a2, (void (*)(void))TileCell.primaryString());
}

- (id)secondaryString
{
  return sub_1BE5A439C(self, (uint64_t)a2, (void (*)(void))TileCell.secondaryString());
}

- (id)secondaryAttributedString
{
  double v2 = self;
  uint64_t v3 = (void *)TileCell.secondaryAttributedString()();

  return v3;
}

- (CGRect)iconViewTileFrame
{
  double v2 = sub_1BE5A4678(self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI19TileCellContentView_iconView);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)prefixLabelTileFrame
{
  double v2 = sub_1BE5A4678(self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI19TileCellContentView_prefixLabel);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)primaryLabelTileFrame
{
  double v2 = sub_1BE5A4678(self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI19TileCellContentView_titleLabel);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)secondaryLabelTileFrame
{
  double v2 = sub_1BE5A4678(self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI19TileCellContentView_descriptionLabel);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (BOOL)prefixLabelShouldFeather
{
  double v2 = self;
  Swift::Bool v3 = TileCell.prefixLabelShouldFeather()();

  return v3;
}

- (BOOL)primaryLabelShouldFeather
{
  double v2 = self;
  Swift::Bool v3 = TileCell.primaryLabelShouldFeather()();

  return v3;
}

- (BOOL)secondaryLabelShouldFeather
{
  double v2 = self;
  Swift::Bool v3 = TileCell.secondaryLabelShouldFeather()();

  return v3;
}

- (id)prefixLabelFont
{
  double v2 = self;
  Swift::Bool v3 = (void *)TileCell.prefixLabelFont()();

  return v3;
}

- (id)primaryLabelFont
{
  double v2 = self;
  Swift::Bool v3 = (void *)TileCell.primaryLabelFont()();

  return v3;
}

- (id)secondaryLabelFont
{
  double v2 = self;
  Swift::Bool v3 = (void *)TileCell.secondaryLabelFont()();

  return v3;
}

- (id)prefixLabelTextColor
{
  double v2 = self;
  Swift::Bool v3 = (void *)TileCell.prefixLabelTextColor()();

  return v3;
}

- (id)primaryLabelTextColor
{
  double v2 = self;
  Swift::Bool v3 = (void *)TileCell.primaryLabelTextColor()();

  return v3;
}

- (id)secondaryLabelTextColor
{
  double v2 = self;
  Swift::Bool v3 = (void *)TileCell.secondaryLabelTextColor()();

  return v3;
}

- (id)primaryLabelOnTextColor
{
  return sub_1BE5A575C(self, (uint64_t)a2, 1);
}

- (id)primaryLabelOffTextColor
{
  return sub_1BE5A575C(self, (uint64_t)a2, 0);
}

- (id)prefixLabelOnTextColor
{
  return sub_1BE5A5904(self, (uint64_t)a2, 1);
}

- (id)prefixLabelOffTextColor
{
  return sub_1BE5A5904(self, (uint64_t)a2, 0);
}

- (id)secondaryLabelOnTextColor
{
  return sub_1BE5A5AAC(self, (uint64_t)a2, 1);
}

- (id)secondaryLabelOffTextColor
{
  return sub_1BE5A5AAC(self, (uint64_t)a2, 0);
}

- (UIColor)backgroundColor
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA455C0);
  MEMORY[0x1F4188790](v3 - 8);
  double v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v6 = self;
  MEMORY[0x1C1896760]();
  uint64_t v7 = sub_1BE9C3448();
  int64_t v8 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7)) {
    int64_t v8 = (void *)sub_1BE9C33F8();
  }
  sub_1BE39DA0C((uint64_t)v5, &qword_1EBA455C0);

  return (UIColor *)v8;
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA455C0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v15 - v9;
  id v11 = a3;
  v12 = self;
  MEMORY[0x1C1896760]();
  uint64_t v13 = sub_1BE9C3448();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v10, 1, v13))
  {
    sub_1BE5A5FF0((uint64_t)v10, (uint64_t)v7);
    MEMORY[0x1C1896770](v7);

    sub_1BE39DA0C((uint64_t)v10, &qword_1EBA455C0);
  }
  else
  {
    v14 = (HUTileCell *)v11;
    sub_1BE9C3408();
    MEMORY[0x1C1896770](v10);

    v12 = v14;
  }
}

- (CGRect)tileFrame
{
  [(HUTileCell *)self bounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (double)backgroundCornerRadius
{
  double v2 = self;
  double v3 = TileCell.backgroundCornerRadius()();

  return v3;
}

- (id)createBackgroundBlurView
{
  double v2 = self;
  TileCell.createBackgroundBlurView()(v3);
  double v5 = v4;

  return v5;
}

- (BOOL)recognizeDoubleClickGesture
{
  double v2 = self;

  return objc_msgSend(v2, sel_isAnIPad);
}

- (id)baseIconViewConfiguration
{
  double v2 = self;
  TileCell.baseIconViewConfiguration()((uint64_t)v11);

  uint64_t v3 = v12;
  if (v12)
  {
    double v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = MEMORY[0x1F4188790](v4);
    uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
    uint64_t v9 = (void *)sub_1BE9C5C08();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end