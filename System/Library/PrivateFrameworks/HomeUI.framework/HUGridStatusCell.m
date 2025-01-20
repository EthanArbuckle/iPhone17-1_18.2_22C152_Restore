@interface HUGridStatusCell
+ (Class)layoutOptionsClass;
- (BOOL)areCellContentsHidden;
- (BOOL)prefixLabelShouldFeather;
- (BOOL)primaryLabelShouldFeather;
- (BOOL)recognizeDoubleClickGesture;
- (BOOL)secondaryLabelShouldFeather;
- (CGRect)iconViewTileFrame;
- (CGRect)prefixLabelTileFrame;
- (CGRect)primaryLabelTileFrame;
- (CGRect)secondaryLabelTileFrame;
- (CGRect)tileFrame;
- (HFItem)item;
- (HUGridCellLayoutOptions)layoutOptions;
- (HUGridStatusCell)initWithCoder:(id)a3;
- (HUGridStatusCell)initWithFrame:(CGRect)a3;
- (double)backgroundCornerRadius;
- (id)baseIconViewConfiguration;
- (id)createBackgroundBlurView;
- (id)prefixLabelFont;
- (id)prefixLabelTextColor;
- (id)prefixString;
- (id)primaryLabelFont;
- (id)primaryLabelTextColor;
- (id)primaryString;
- (id)secondaryAttributedString;
- (id)secondaryLabelFont;
- (id)secondaryLabelTextColor;
- (id)secondaryString;
- (unint64_t)backgroundDisplayStyle;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
- (void)setCellContentsHidden:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUGridStatusCell

+ (Class)layoutOptionsClass
{
  sub_1BE598184();

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)areCellContentsHidden
{
  v2 = (BOOL *)self + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (HUGridCellLayoutOptions)layoutOptions
{
  return (HUGridCellLayoutOptions *)sub_1BE3840E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUGridStatusCell_layoutOptions);
}

- (void)setLayoutOptions:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_layoutOptions);
  swift_beginAccess();
  v5 = *v4;
  BOOL *v4 = a3;
  id v6 = a3;
}

- (HFItem)item
{
  return (HFItem *)sub_1BE3840E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUGridStatusCell_item);
}

- (void)setItem:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_item);
  swift_beginAccess();
  id v6 = *v5;
  void *v5 = a3;
  id v7 = a3;
  v8 = self;

  [(HUGridStatusCell *)v8 setNeedsUpdateConfiguration];
}

- (HUGridStatusCell)initWithFrame:(CGRect)a3
{
  return (HUGridStatusCell *)GridStatusCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUGridStatusCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_layoutOptions) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_item) = 0;
  id v4 = a3;

  result = (HUGridStatusCell *)sub_1BE9C5A78();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3 = (char *)self + OBJC_IVAR___HUGridStatusCell_areCellContentsHidden;
  swift_beginAccess();
  unsigned char *v3 = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GridStatusCell();
  [(HUGridStatusCell *)&v4 prepareForReuse];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1BE9C3378();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C3368();
  v8 = self;
  sub_1BE598AFC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HUGridStatusCell_item);
}

- (id)prefixString
{
  return 0;
}

- (id)primaryString
{
  return 0;
}

- (id)secondaryString
{
  return 0;
}

- (id)secondaryAttributedString
{
  return 0;
}

- (CGRect)iconViewTileFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)prefixLabelTileFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)primaryLabelTileFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)secondaryLabelTileFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)prefixLabelShouldFeather
{
  return 0;
}

- (BOOL)primaryLabelShouldFeather
{
  return 0;
}

- (BOOL)secondaryLabelShouldFeather
{
  return 0;
}

- (id)prefixLabelFont
{
  return 0;
}

- (id)primaryLabelFont
{
  return 0;
}

- (id)secondaryLabelFont
{
  return 0;
}

- (id)prefixLabelTextColor
{
  return 0;
}

- (id)primaryLabelTextColor
{
  return 0;
}

- (id)secondaryLabelTextColor
{
  return 0;
}

- (CGRect)tileFrame
{
  [(HUGridStatusCell *)self frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)backgroundCornerRadius
{
  return 0.0;
}

- (unint64_t)backgroundDisplayStyle
{
  return 0;
}

- (id)createBackgroundBlurView
{
  return 0;
}

- (BOOL)recognizeDoubleClickGesture
{
  return 1;
}

- (id)baseIconViewConfiguration
{
  double v2 = self;
  GridStatusCell.baseIconViewConfiguration()((uint64_t)v11);

  uint64_t v3 = v12;
  if (v12)
  {
    double v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = MEMORY[0x1F4188790](v4);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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