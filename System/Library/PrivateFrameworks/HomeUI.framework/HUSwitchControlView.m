@interface HUSwitchControlView
+ (Class)valueClass;
- (BOOL)isDisabled;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HUControlViewDelegate)delegate;
- (HUSwitchControlView)initWithFrame:(CGRect)a3;
- (NSString)identifier;
- (UISwitch)switchView;
- (id)value;
- (void)_switchValueChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation HUSwitchControlView

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HUSwitchControlView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUSwitchControlView;
  v3 = -[HUSwitchControlView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4F42E78]);
    switchView = v3->_switchView;
    v3->_switchView = v4;

    [(UISwitch *)v3->_switchView sizeToFit];
    [(UISwitch *)v3->_switchView addTarget:v3 action:sel__switchValueChanged_ forControlEvents:4096];
    [(HUSwitchControlView *)v3 addSubview:v3->_switchView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(HUSwitchControlView *)self switchView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUSwitchControlView *)self switchView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)value
{
  v2 = NSNumber;
  double v3 = [(HUSwitchControlView *)self switchView];
  double v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isOn"));

  return v4;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  id v6 = [(HUSwitchControlView *)self switchView];
  uint64_t v5 = [v4 BOOLValue];

  objc_msgSend(v6, "setOn:animated:", v5, objc_msgSend(MEMORY[0x1E4F42FF0], "_isInAnimationBlock"));
}

- (BOOL)isDisabled
{
  v2 = [(HUSwitchControlView *)self switchView];
  char v3 = [v2 isEnabled] ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(HUSwitchControlView *)self switchView];
  [v4 setEnabled:v3];
}

- (void)_switchValueChanged:(id)a3
{
  id v4 = [(HUSwitchControlView *)self delegate];
  [v4 controlViewDidBeginUserInteraction:self];

  uint64_t v5 = [(HUSwitchControlView *)self delegate];
  id v6 = [(HUSwitchControlView *)self value];
  [v5 controlView:self valueDidChange:v6];

  id v7 = [(HUSwitchControlView *)self delegate];
  [v7 controlViewDidEndUserInteraction:self];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (HUControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISwitch)switchView
{
  return self->_switchView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end