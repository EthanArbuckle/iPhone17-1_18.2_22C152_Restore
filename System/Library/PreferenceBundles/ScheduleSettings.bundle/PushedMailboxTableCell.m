@interface PushedMailboxTableCell
+ (id)_iconForType:(int64_t)a3 nested:(BOOL)a4;
+ (int)_cacheIndexForType:(int64_t)a3;
- (BOOL)isChecked;
- (PushedMailboxTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (unsigned)level;
- (void)_setupMailFolderIconForImage:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setChecked:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLevel:(unsigned int)a3;
- (void)setMailboxName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PushedMailboxTableCell

+ (int)_cacheIndexForType:(int64_t)a3
{
  for (unint64_t i = 0; _mailFolderImages[i] != a3; i += 3)
  {
    if (i >= 0x12) {
      +[PushedMailboxTableCell _cacheIndexForType:]();
    }
  }
  return i + 2;
}

+ (id)_iconForType:(int64_t)a3 nested:(BOOL)a4
{
  int v4 = +[PushedMailboxTableCell _cacheIndexForType:](PushedMailboxTableCell, "_cacheIndexForType:", a3, a4);
  id result = (id)_mailFolderImages[v4];
  if (!result)
  {
    v6 = (id *)&_mailFolderImages[v4];
    v7 = (void *)[MEMORY[0x263F1C6B0] systemImageNamed:*(v6 - 1)];
    id result = (id)objc_msgSend(v7, "imageWithTintColor:", objc_msgSend(MEMORY[0x263F1C550], "_systemInteractionTintColor"));
    id *v6 = result;
  }
  return result;
}

- (PushedMailboxTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PushedMailboxTableCell;
  int v4 = [(PushedMailboxTableCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    v4->_mailboxName = v5;
    -[UILabel setFont:](v5, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:18.0]);
    objc_msgSend((id)-[PushedMailboxTableCell contentView](v4, "contentView"), "addSubview:", v4->_mailboxName);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PushedMailboxTableCell;
  [(PushedMailboxTableCell *)&v3 dealloc];
}

- (void)_setupMailFolderIconForImage:(id)a3
{
  mailboxIcon = self->_mailboxIcon;
  if (!mailboxIcon)
  {
    self->_mailboxIcon = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
    objc_msgSend((id)-[PushedMailboxTableCell contentView](self, "contentView"), "addSubview:", self->_mailboxIcon);
    mailboxIcon = self->_mailboxIcon;
  }
  [(UIImageView *)mailboxIcon setImage:a3];
  v6 = self->_mailboxIcon;

  [(UIImageView *)v6 sizeToFit];
}

- (void)setType:(int64_t)a3
{
  id v4 = +[PushedMailboxTableCell _iconForType:a3 nested:self->_level != 0];

  [(PushedMailboxTableCell *)self _setupMailFolderIconForImage:v4];
}

- (void)setMailboxName:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PushedMailboxTableCell;
  -[PushedMailboxTableCell setEnabled:](&v7, sel_setEnabled_);
  mailboxName = self->_mailboxName;
  if (v3) {
    uint64_t v6 = [MEMORY[0x263F1C550] labelColor];
  }
  else {
    uint64_t v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  }
  [(UILabel *)mailboxName setTextColor:v6];
}

- (BOOL)isChecked
{
  return [(PushedMailboxTableCell *)self accessoryType] == 3;
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = self;
  if (!a3)
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  if ([(PushedMailboxTableCell *)self isUserInteractionEnabled])
  {
    self = v3;
    uint64_t v4 = 3;
LABEL_5:
    [(PushedMailboxTableCell *)self setAccessoryType:v4];
    return;
  }
  uint64_t v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark"];
  id v6 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v5];
  [(PushedMailboxTableCell *)v3 setAccessoryView:v6];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PushedMailboxTableCell;
  [(PushedMailboxTableCell *)&v3 prepareForReuse];
  [(PushedMailboxTableCell *)self setAccessoryView:0];
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)PushedMailboxTableCell;
  [(PushedMailboxTableCell *)&v21 layoutSubviews];
  [(PushedMailboxTableCell *)self frame];
  objc_msgSend((id)-[PushedMailboxTableCell contentView](self, "contentView"), "bounds");
  double v4 = v3;
  [(UILabel *)self->_mailboxName sizeToFit];
  [(UILabel *)self->_mailboxName frame];
  double v6 = v5;
  double v8 = v7;
  uint64_t level = self->_level;
  if (level)
  {
    if (level == 1) {
      double v10 = 86.0;
    }
    else {
      double v10 = (float)((float)(level - 1) * 30.0) + 90.0 + -4.0;
    }
  }
  else
  {
    double v10 = 55.0;
  }
  UIRoundToViewScale();
  double v12 = v11;
  objc_msgSend((id)-[PushedMailboxTableCell contentView](self, "contentView"), "frame");
  double v14 = v4 - v10 - v13 + -5.0;
  if (v6 >= v14) {
    double v15 = v14;
  }
  else {
    double v15 = v6;
  }
  -[UILabel setFrame:](self->_mailboxName, "setFrame:", v10, v12, v15, v8);
  [(UIImageView *)self->_mailboxIcon frame];
  double width = v22.size.width;
  double height = v22.size.height;
  CGRectGetWidth(v22);
  UIRoundToViewScale();
  double v19 = v18;
  UIRoundToViewScale();
  -[UIImageView setFrame:](self->_mailboxIcon, "setFrame:", v19, v20, width, height);
  [(PushedMailboxTableCell *)self _setMarginWidth:v10];
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_uint64_t level = a3;
}

+ (void)_cacheIndexForType:.cold.1()
{
}

@end