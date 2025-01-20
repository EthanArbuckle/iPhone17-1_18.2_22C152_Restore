@interface CPSPointsOfInterestPickerCell
+ (id)identifier;
- (BOOL)chosen;
- (BOOL)isSelected;
- (CPSPointsOfInterestPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setChosen:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setupViews;
@end

@implementation CPSPointsOfInterestPickerCell

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CPSPointsOfInterestPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v4 = v16;
  v16 = 0;
  v14.receiver = v4;
  v14.super_class = (Class)CPSPointsOfInterestPickerCell;
  v16 = [(CPSPointsOfInterestPickerCell *)&v14 initWithStyle:3 reuseIdentifier:location[0]];
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    [(CPSPointsOfInterestPickerCell *)v16 setSelectionStyle:3];
    id v11 = objc_alloc(MEMORY[0x263F1CB60]);
    id v12 = (id)[(CPSPointsOfInterestPickerCell *)v16 contentView];
    [v12 frame];
    id v13 = (id)objc_msgSend(v11, "initWithFrame:", v5, v6, v7, v8);

    [(CPSPointsOfInterestPickerCell *)v16 setBackgroundView:v13];
    [(CPSPointsOfInterestPickerCell *)v16 setupViews];
    objc_storeStrong(&v13, 0);
  }
  v10 = v16;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v10;
}

- (void)setupViews
{
  id v3 = +[CPSEntityStyles pickerCellPrimaryFont];
  id v2 = (id)[(CPSPointsOfInterestPickerCell *)self textLabel];
  [v2 setFont:v3];

  id v5 = +[CPSEntityStyles pickerCellSecondaryFont];
  id v4 = (id)[(CPSPointsOfInterestPickerCell *)self detailTextLabel];
  [v4 setFont:v5];
}

- (void)prepareForReuse
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestPickerCell;
  [(CPSPointsOfInterestPickerCell *)&v2 prepareForReuse];
  [(CPSPointsOfInterestPickerCell *)v4 setChosen:0];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  [(CPSPointsOfInterestPickerCell *)self setHighlighted:a3];
  char v6 = 0;
  if ([(CPSPointsOfInterestPickerCell *)self chosen])
  {
    id v7 = (id)[MEMORY[0x263F1C550] _carSystemSecondaryColor];
    char v6 = 1;
    id v5 = v7;
  }
  else
  {
    id v5 = 0;
  }
  id v4 = (id)[(CPSPointsOfInterestPickerCell *)self backgroundView];
  [v4 setBackgroundColor:v5];

  if (v6) {
}
  }

- (BOOL)isSelected
{
  return [(CPSPointsOfInterestPickerCell *)self chosen];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  char v6 = v10;
  id v5 = v10;
  id v7 = (CPSPointsOfInterestPickerCell *)(id)[location[0] nextFocusedItem];
  [(CPSPointsOfInterestPickerCell *)v6 setHighlighted:v5 == v7];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  id v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSPointsOfInterestPickerCell;
  [(CPSPointsOfInterestPickerCell *)&v9 setHighlighted:a3];
  char v8 = 1;
  if (![(CPSPointsOfInterestPickerCell *)v12 chosen]) {
    char v8 = v10;
  }
  id v6 = +[CPSEntityStyles pickerCellPrimaryFontColor:v8 & 1];
  id v5 = (id)[(CPSPointsOfInterestPickerCell *)v12 textLabel];
  [v5 setTextColor:v6];

  char v7 = 1;
  if (![(CPSPointsOfInterestPickerCell *)v12 chosen]) {
    char v7 = v10;
  }
  id v4 = +[CPSEntityStyles pickerCellSecondaryFontColor:v7 & 1];
  id v3 = (id)[(CPSPointsOfInterestPickerCell *)v12 detailTextLabel];
  [v3 setTextColor:v4];
}

- (void)setChosen:(BOOL)a3
{
  if (self->_chosen != a3)
  {
    self->_chosen = a3;
    [(CPSPointsOfInterestPickerCell *)self setSelected:a3];
  }
}

- (BOOL)chosen
{
  return self->_chosen;
}

@end