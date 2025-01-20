@interface GKDashboardPlayerPickerCell
+ (CGSize)defaultSize;
- (BOOL)isSelectable;
- (BOOL)showsMessagesHandleInStatusText;
- (BOOL)showsPlayerSubtitle;
- (NSLayoutConstraint)nameConstraint;
- (NSLayoutConstraint)selectionHorizontalConstraint;
- (NSLayoutConstraint)selectionVerticalConstraint;
- (NSLayoutConstraint)statusHeightConstraint;
- (UIButton)selectionButton;
- (UIImageView)selectionView;
- (UIView)ringView;
- (double)nameInitialConstant;
- (double)selectionInitialHorizontalConstant;
- (double)selectionInitialVerticalConstant;
- (double)statusInitialConstant;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)awakeFromNib;
- (void)setNameConstraint:(id)a3;
- (void)setNameInitialConstant:(double)a3;
- (void)setPlayer:(id)a3;
- (void)setRingView:(id)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionButton:(id)a3;
- (void)setSelectionHorizontalConstraint:(id)a3;
- (void)setSelectionInitialHorizontalConstant:(double)a3;
- (void)setSelectionInitialVerticalConstant:(double)a3;
- (void)setSelectionVerticalConstraint:(id)a3;
- (void)setSelectionView:(id)a3;
- (void)setShowsMessagesHandleInStatusText:(BOOL)a3;
- (void)setShowsPlayerSubtitle:(BOOL)a3;
- (void)setStatusHeightConstraint:(id)a3;
- (void)setStatusInitialConstant:(double)a3;
- (void)setStatusText:(id)a3;
- (void)setStatusWithAchievementEarnedPoints:(int64_t)a3 andDate:(id)a4;
@end

@implementation GKDashboardPlayerPickerCell

+ (CGSize)defaultSize
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___GKDashboardPlayerPickerCell;
  objc_msgSendSuper2(&v4, sel_defaultSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)awakeFromNib
{
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardPlayerPickerCell;
  [(GKDashboardPlayerCell *)&v11 awakeFromNib];
  [(GKDashboardPlayerPickerCell *)self setClipsToBounds:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameConstraint);
  [WeakRetained constant];
  self->_nameInitialConstant = v4;

  id v5 = objc_loadWeakRetained((id *)&self->_selectionHorizontalConstraint);
  [v5 constant];
  self->_selectionInitialHorizontalConstant = v6;

  id v7 = objc_loadWeakRetained((id *)&self->_selectionVerticalConstraint);
  [v7 constant];
  self->_selectionInitialVerticalConstant = v8;

  id v9 = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  [v9 constant];
  self->_statusInitialConstant = v10;
}

- (void)setPlayer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardPlayerPickerCell;
  [(GKDashboardPlayerCell *)&v5 setPlayer:a3];
  [(GKDashboardPlayerPickerCell *)self setStatusText:&stru_1F07B2408];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  [WeakRetained setConstant:0.0];
}

- (void)setStatusWithAchievementEarnedPoints:(int64_t)a3 andDate:(id)a4
{
  id v13 = [a4 _gkFormattedWhenStringWithOptions:0];
  double v6 = NSString;
  id v7 = GKGameCenterUIFrameworkBundle();
  double v8 = GKGetLocalizedStringFromTableInBundle();
  id v9 = GKFormattedStringWithGroupingFromInteger();
  double v10 = objc_msgSend(v6, "localizedStringWithFormat:", v8, a3, v9, v13);

  [(GKDashboardPlayerPickerCell *)self setStatusText:v10];
  double statusInitialConstant = self->_statusInitialConstant;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  [WeakRetained setConstant:statusInitialConstant];
}

- (void)setSelectable:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selectable = a3;
  objc_super v5 = [(GKDashboardPlayerPickerCell *)self selectionButton];
  [v5 setEnabled:v3];

  if (v3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.3;
  }
  id v7 = [(GKDashboardPlayerPickerCell *)self selectionView];
  [v7 setAlpha:v6];

  double v8 = [(GKDashboardPlayerPickerCell *)self selectionButton];
  [v8 setAlpha:v6];

  id v9 = [(GKDashboardPlayerCell *)self nameLabel];
  [v9 setAlpha:v6];

  id v10 = [(GKDashboardPlayerCell *)self statusLabel];
  [v10 setAlpha:v6];
}

- (void)setStatusText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKDashboardPlayerPickerCell;
  [(GKDashboardPlayerCell *)&v3 setStatusText:a3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKDashboardPlayerPickerCell;
  -[GKDashboardPlayerCell setSelected:](&v11, sel_setSelected_);
  objc_super v5 = [MEMORY[0x1E4F63A10] sharedTheme];
  double v6 = v5;
  if (v3) {
    [v5 playerPickerSelectedImage];
  }
  else {
  id v7 = [v5 playerPickerUnselectedImage];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionView);
  [WeakRetained setImage:v7];

  id v9 = objc_loadWeakRetained((id *)&self->_selectionButton);
  [v9 setSelected:v3];

  id v10 = [(GKDashboardPlayerPickerCell *)self contentView];
  [v10 setBackgroundColor:0];
}

- (void)setShowsPlayerSubtitle:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsPlayerSubtitle = a3;
  BOOL v5 = !a3;
  double v6 = [(GKDashboardPlayerCell *)self statusLabel];
  [v6 setHidden:v5];

  id v7 = [(GKDashboardPlayerCell *)self player];
  double v8 = [v7 internal];
  id v9 = [v8 contact];
  id v12 = [v9 _gkCompositeName];

  if (v12) {
    [(GKDashboardPlayerPickerCell *)self setStatusText:v12];
  }
  double statusInitialConstant = 0.0;
  if (v3) {
    double statusInitialConstant = self->_statusInitialConstant;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  [WeakRetained setConstant:statusInitialConstant];
}

- (void)setShowsMessagesHandleInStatusText:(BOOL)a3
{
  self->_showsMessagesHandleInStatusText = a3;
  BOOL v4 = !a3;
  BOOL v5 = [(GKDashboardPlayerCell *)self statusLabel];
  [v5 setHidden:v4];

  double v6 = [(GKDashboardPlayerCell *)self player];
  id v7 = [v6 internal];
  id v10 = [v7 messagesID];

  [(GKDashboardPlayerPickerCell *)self setStatusText:v10];
  if (self->_showsMessagesHandleInStatusText) {
    double statusInitialConstant = self->_statusInitialConstant;
  }
  else {
    double statusInitialConstant = 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);
  [WeakRetained setConstant:statusInitialConstant];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v8 = [(GKDashboardPlayerPickerCell *)self selectionButton];
  int v3 = [v8 isSelected];
  BOOL v4 = [MEMORY[0x1E4F63A10] sharedTheme];
  BOOL v5 = v4;
  if (v3) {
    [v4 playerPickerSelectedImage];
  }
  else {
  double v6 = [v4 playerPickerUnselectedImage];
  }
  id v7 = [(GKDashboardPlayerPickerCell *)self selectionView];
  [v7 setImage:v6];
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (BOOL)showsPlayerSubtitle
{
  return self->_showsPlayerSubtitle;
}

- (BOOL)showsMessagesHandleInStatusText
{
  return self->_showsMessagesHandleInStatusText;
}

- (UIImageView)selectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionView);

  return (UIImageView *)WeakRetained;
}

- (void)setSelectionView:(id)a3
{
}

- (UIView)ringView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ringView);

  return (UIView *)WeakRetained;
}

- (void)setRingView:(id)a3
{
}

- (UIButton)selectionButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionButton);

  return (UIButton *)WeakRetained;
}

- (void)setSelectionButton:(id)a3
{
}

- (NSLayoutConstraint)nameConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setNameConstraint:(id)a3
{
}

- (NSLayoutConstraint)selectionHorizontalConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionHorizontalConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSelectionHorizontalConstraint:(id)a3
{
}

- (NSLayoutConstraint)selectionVerticalConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionVerticalConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSelectionVerticalConstraint:(id)a3
{
}

- (NSLayoutConstraint)statusHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStatusHeightConstraint:(id)a3
{
}

- (double)nameInitialConstant
{
  return self->_nameInitialConstant;
}

- (void)setNameInitialConstant:(double)a3
{
  self->_nameInitialConstant = a3;
}

- (double)selectionInitialHorizontalConstant
{
  return self->_selectionInitialHorizontalConstant;
}

- (void)setSelectionInitialHorizontalConstant:(double)a3
{
  self->_selectionInitialHorizontalConstant = a3;
}

- (double)selectionInitialVerticalConstant
{
  return self->_selectionInitialVerticalConstant;
}

- (void)setSelectionInitialVerticalConstant:(double)a3
{
  self->_selectionInitialVerticalConstant = a3;
}

- (double)statusInitialConstant
{
  return self->_statusInitialConstant;
}

- (void)setStatusInitialConstant:(double)a3
{
  self->_double statusInitialConstant = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusHeightConstraint);
  objc_destroyWeak((id *)&self->_selectionVerticalConstraint);
  objc_destroyWeak((id *)&self->_selectionHorizontalConstraint);
  objc_destroyWeak((id *)&self->_nameConstraint);
  objc_destroyWeak((id *)&self->_selectionButton);
  objc_destroyWeak((id *)&self->_ringView);

  objc_destroyWeak((id *)&self->_selectionView);
}

@end