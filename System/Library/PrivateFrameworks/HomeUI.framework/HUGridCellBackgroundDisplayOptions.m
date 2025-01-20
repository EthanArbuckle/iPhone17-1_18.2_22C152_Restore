@interface HUGridCellBackgroundDisplayOptions
+ (id)defaultOptions;
- (NSString)contentSizeCategory;
- (double)gutter;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)contentColorStyle;
- (unint64_t)displayStyle;
- (void)setContentColorStyle:(unint64_t)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setDisplayStyle:(unint64_t)a3;
@end

@implementation HUGridCellBackgroundDisplayOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HUGridCellBackgroundDisplayOptions);
  [(HUGridCellBackgroundDisplayOptions *)v4 setContentColorStyle:[(HUGridCellBackgroundDisplayOptions *)self contentColorStyle]];
  v5 = [(HUGridCellBackgroundDisplayOptions *)self contentSizeCategory];
  [(HUGridCellBackgroundDisplayOptions *)v4 setContentSizeCategory:v5];

  [(HUGridCellBackgroundDisplayOptions *)v4 setDisplayStyle:[(HUGridCellBackgroundDisplayOptions *)self displayStyle]];
  return v4;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (void)setContentSizeCategory:(id)a3
{
  self->_contentSizeCategory = (NSString *)a3;
}

- (void)setContentColorStyle:(unint64_t)a3
{
  self->_contentColorStyle = a3;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (unint64_t)contentColorStyle
{
  return self->_contentColorStyle;
}

+ (id)defaultOptions
{
  v2 = objc_alloc_init(HUGridCellBackgroundDisplayOptions);
  [(HUGridCellBackgroundDisplayOptions *)v2 setContentColorStyle:0];
  [(HUGridCellBackgroundDisplayOptions *)v2 setContentSizeCategory:*MEMORY[0x1E4F437D0]];
  [(HUGridCellBackgroundDisplayOptions *)v2 setDisplayStyle:0];

  return v2;
}

- (double)gutter
{
  return 0.0;
}

@end