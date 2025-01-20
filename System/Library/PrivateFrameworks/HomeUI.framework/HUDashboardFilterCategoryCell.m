@interface HUDashboardFilterCategoryCell
+ (Class)layoutOptionsClass;
- (BOOL)areCellContentsHidden;
- (BOOL)isRearranging;
- (HFItem)item;
- (HUBackgroundEffectViewGrouping)backgroundEffectGrouper;
- (HUDashboardFilterCategoryCell)initWithCoder:(id)a3;
- (HUDashboardFilterCategoryCell)initWithFrame:(CGRect)a3;
- (HUGridCellLayoutOptions)layoutOptions;
- (UICellConfigurationState)_bridgedConfigurationState;
- (unint64_t)backgroundDisplayStyle;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
- (void)setBackgroundDisplayStyle:(unint64_t)a3;
- (void)setBackgroundEffectGrouper:(id)a3;
- (void)setCellContentsHidden:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setRearranging:(BOOL)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUDashboardFilterCategoryCell

- (void)prepareForReuse
{
  v2 = self;
  sub_1BE3BAC10();
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = sub_1BE9C3378();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1BE3BAF10();

  v8 = (void *)sub_1BE9C3358();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (UICellConfigurationState *)v8;
}

- (HUGridCellLayoutOptions)layoutOptions
{
  return (HUGridCellLayoutOptions *)sub_1BE3840E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUDashboardFilterCategoryCell_layoutOptions);
}

- (void)setLayoutOptions:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUDashboardFilterCategoryCell_layoutOptions);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (BOOL)areCellContentsHidden
{
  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_areCellContentsHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setCellContentsHidden:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_areCellContentsHidden;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (HFItem)item
{
  return (HFItem *)sub_1BE3840E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUDashboardFilterCategoryCell_item);
}

- (void)setItem:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUDashboardFilterCategoryCell_item);
  swift_beginAccess();
  id v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
  v8 = self;

  [(HUDashboardFilterCategoryCell *)v8 setNeedsUpdateConfiguration];
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1BE9C3378();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE9C3368();
  v8 = self;
  v9 = (void *)sub_1BE9C3358();
  uint64_t v10 = (objc_class *)type metadata accessor for DashboardFilterCategoryCell();
  v11.receiver = v8;
  v11.super_class = v10;
  [(HUDashboardFilterCategoryCell *)&v11 _bridgedUpdateConfigurationUsingState:v9];

  sub_1BE3BBB20((uint64_t)v7);
  sub_1BE3BBE80(v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (unint64_t)backgroundDisplayStyle
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_backgroundDisplayStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundDisplayStyle:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_backgroundDisplayStyle);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (HUBackgroundEffectViewGrouping)backgroundEffectGrouper
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (HUBackgroundEffectViewGrouping *)v2;
}

- (void)setBackgroundEffectGrouper:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1BE3BB99C((uint64_t)a3);
}

- (BOOL)isRearranging
{
  v2 = (BOOL *)self + OBJC_IVAR___HUDashboardFilterCategoryCell_isRearranging;
  swift_beginAccess();
  return *v2;
}

- (void)setRearranging:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1BE3BC7F0(a3);
}

- (HUDashboardFilterCategoryCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardFilterCategoryCell_layoutOptions) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___HUDashboardFilterCategoryCell_areCellContentsHidden) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUDashboardFilterCategoryCell_item) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardFilterCategoryCell_backgroundDisplayStyle) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___HUDashboardFilterCategoryCell_backgroundEffectGrouper) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___HUDashboardFilterCategoryCell_isRearranging) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DashboardFilterCategoryCell();
  return -[HUDashboardFilterCategoryCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (HUDashboardFilterCategoryCell)initWithCoder:(id)a3
{
  return (HUDashboardFilterCategoryCell *)DashboardFilterCategoryCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterCategoryCell_layoutOptions));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterCategoryCell_item));

  swift_unknownObjectRelease();
}

+ (Class)layoutOptionsClass
{
  sub_1BE3BD014();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)updateUIWithAnimation:(BOOL)a3
{
}

@end