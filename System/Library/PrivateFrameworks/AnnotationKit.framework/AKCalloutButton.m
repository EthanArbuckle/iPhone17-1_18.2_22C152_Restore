@interface AKCalloutButton
- (AKCalloutBar)bar;
- (AKCalloutButton)initWithFrame:(CGRect)a3;
- (int)position;
- (void)setBar:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPosition:(int)a3;
@end

@implementation AKCalloutButton

- (AKCalloutButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKCalloutButton;
  v3 = -[AKCalloutButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AKCalloutButton *)v3 setAdjustsImageWhenHighlighted:0];
    [(AKCalloutButton *)v4 setShowsTouchWhenHighlighted:0];
    v4->_position = -1;
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AKCalloutButton;
  -[AKCalloutButton setHighlighted:](&v6, sel_setHighlighted_);
  v5 = [(AKCalloutButton *)self bar];
  [v5 setHighlighted:v3 forControl:self];
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (AKCalloutBar)bar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);

  return (AKCalloutBar *)WeakRetained;
}

- (void)setBar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end