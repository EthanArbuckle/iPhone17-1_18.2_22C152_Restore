@interface SFDownloadsBarButtonItem
- (SFDownloadsBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4;
- (double)progress;
- (void)pulse;
- (void)setEnabled:(BOOL)a3;
- (void)setProgress:(double)a3;
@end

@implementation SFDownloadsBarButtonItem

- (SFDownloadsBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFDownloadsBarButtonItem;
  v7 = [(UIBarItem *)&v15 init];
  if (v7)
  {
    v8 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.down.circle" withConfiguration:v8];
    [(SFDownloadsBarButtonItem *)v7 setImage:v9];

    [(SFDownloadsBarButtonItem *)v7 setTarget:v6];
    [(SFDownloadsBarButtonItem *)v7 setAction:a4];
    v10 = SFAccessibilityTitleForBarItem();
    [(SFDownloadsBarButtonItem *)v7 setTitle:v10];

    uint64_t v11 = +[SFDownloadsBarButtonItemView buttonWithBarButtonItem:v7];
    buttonView = v7->_buttonView;
    v7->_buttonView = (SFDownloadsBarButtonItemView *)v11;

    [(SFDownloadsBarButtonItem *)v7 setCustomView:v7->_buttonView];
    [(SFDownloadsBarButtonItem *)v7 setProgress:-2.0];
    v13 = v7;
  }
  return v7;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void)pulse
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SFDownloadsBarButtonItem;
  -[SFDownloadsBarButtonItem setEnabled:](&v5, sel_setEnabled_);
  [(SFDownloadsBarButtonItemView *)self->_buttonView setEnabled:v3];
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end