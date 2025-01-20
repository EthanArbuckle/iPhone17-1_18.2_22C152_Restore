@interface CNChevronButton
- (CNChevronButton)initWithFrame:(CGRect)a3;
- (CNChevronButtonMenuDelegate)delegateView;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setDelegateView:(id)a3;
@end

@implementation CNChevronButton

- (CNChevronButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNChevronButton;
  v3 = -[CNChevronButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CNChevronButton *)v3 setContextMenuInteractionEnabled:1];
    [(CNChevronButton *)v4 setShowsMenuAsPrimaryAction:1];
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v4 = [(CNChevronButton *)self delegateView];
  v5 = [v4 menuConfigurationForChevronButton];

  return v5;
}

- (CNChevronButtonMenuDelegate)delegateView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateView);

  return (CNChevronButtonMenuDelegate *)WeakRetained;
}

- (void)setDelegateView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end