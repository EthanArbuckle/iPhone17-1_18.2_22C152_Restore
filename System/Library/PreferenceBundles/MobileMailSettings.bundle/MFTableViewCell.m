@interface MFTableViewCell
+ (double)defaultAccessoryWidth;
+ (double)reorderingAccessoryWidth;
- (BOOL)disabled;
- (BOOL)shouldDisableWhileEditing;
- (double)accessoryWidth;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setShouldDisableWhileEditing:(BOOL)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation MFTableViewCell

+ (double)defaultAccessoryWidth
{
  return 25.0;
}

+ (double)reorderingAccessoryWidth
{
  return 35.0;
}

- (double)accessoryWidth
{
  if (![(MFTableViewCell *)self isEditing])
  {
    if ([(MFTableViewCell *)self accessoryType]) {
      goto LABEL_3;
    }
LABEL_5:
    double v4 = 0.0;
    goto LABEL_6;
  }
  if (![(MFTableViewCell *)self editingAccessoryType]) {
    goto LABEL_5;
  }
LABEL_3:
  [(id)objc_opt_class() defaultAccessoryWidth];
  double v4 = v3;
LABEL_6:
  if ([(MFTableViewCell *)self isEditing]
    && [(MFTableViewCell *)self showsReorderControl])
  {
    return v4 + 35.0;
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MFTableViewCell;
  [(MFTableViewCell *)&v3 prepareForReuse];
  [(MFTableViewCell *)self setDisabled:0];
}

- (void)willTransitionToState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFTableViewCell;
  -[MFTableViewCell willTransitionToState:](&v5, "willTransitionToState:");
  if ([(MFTableViewCell *)self shouldDisableWhileEditing]) {
    [(MFTableViewCell *)self setDisabled:a3 != 0];
  }
}

- (BOOL)disabled
{
  return [(MFTableViewCell *)self isUserInteractionEnabled] ^ 1;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v4 = !a3;
  [(MFTableViewCell *)self setUserInteractionEnabled:v4];

  [(MFTableViewCell *)self setSelectionStyle:v4];
}

- (BOOL)shouldDisableWhileEditing
{
  return self->_shouldDisableWhileEditing;
}

- (void)setShouldDisableWhileEditing:(BOOL)a3
{
  self->_shouldDisableWhileEditing = a3;
}

- (void).cxx_destruct
{
}

@end