@interface VOTUIRotorViewController
- (BOOL)_canShowWhileLocked;
- (void)loadView;
- (void)setRotorHidden:(BOOL)a3;
- (void)setupConstraintsIfNecessary;
- (void)updateVisualRotor:(id)a3;
@end

@implementation VOTUIRotorViewController

- (void)loadView
{
  id v3 = objc_alloc_init((Class)UIView);
  [(VOTUIRotorViewController *)self setView:v3];
}

- (void)setupConstraintsIfNecessary
{
  id v3 = [(VOTUIRotorViewController *)self view];
  id v15 = [v3 window];

  v4 = v15;
  if (v15 && !self->_constraintsSetUp)
  {
    v5 = +[NSMutableArray array];
    v6 = self->_rotorDisplay;
    v7 = [(VOTUIRotorViewController *)self view];
    v8 = +[NSLayoutConstraint constraintWithItem:v6 attribute:9 relatedBy:0 toItem:v7 attribute:9 multiplier:1.0 constant:0.0];
    [v5 addObject:v8];

    v9 = [(VOTUIRotorViewController *)self view];
    v10 = +[NSLayoutConstraint constraintWithItem:v6 attribute:10 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];

    [v5 addObject:v10];
    v11 = [(VOTUIRotorViewController *)self view];
    v12 = +[NSLayoutConstraint constraintWithItem:v11 attribute:9 relatedBy:0 toItem:v15 attribute:9 multiplier:1.0 constant:0.0];
    [v5 addObject:v12];

    v13 = [(VOTUIRotorViewController *)self view];
    v14 = +[NSLayoutConstraint constraintWithItem:v13 attribute:10 relatedBy:0 toItem:v15 attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v14];

    +[NSLayoutConstraint activateConstraints:v5];
    self->_constraintsSetUp = 1;

    v4 = v15;
  }
}

- (void)updateVisualRotor:(id)a3
{
  id v16 = a3;
  if (!self->_rotorDisplay)
  {
    v4 = objc_alloc_init(VOTUIRotorDisplay);
    rotorDisplay = self->_rotorDisplay;
    self->_rotorDisplay = v4;

    [(VOTUIRotorDisplay *)self->_rotorDisplay setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(VOTUIRotorViewController *)self view];
    [v6 addSubview:self->_rotorDisplay];
  }
  [(VOTUIRotorViewController *)self setupConstraintsIfNecessary];
  v7 = [v16 objectForKey:@"count"];
  v8 = v7;
  if (v7) {
    -[VOTUIRotorDisplay setRotorItemCount:](self->_rotorDisplay, "setRotorItemCount:", [v7 integerValue]);
  }
  v9 = [v16 objectForKey:@"increment"];
  v10 = v9;
  if (v9) {
    -[VOTUIRotorDisplay updateRotorPosition:](self->_rotorDisplay, "updateRotorPosition:", [v9 BOOLValue]);
  }
  v11 = [v16 objectForKey:@"title"];
  if (v11) {
    [(VOTUIRotorDisplay *)self->_rotorDisplay setTitle:v11];
  }
  v12 = [v16 objectForKey:@"show"];
  v13 = v12;
  if (v12)
  {
    unsigned int v14 = [v12 BOOLValue];
    id v15 = self->_rotorDisplay;
    if (v14) {
      [(VOTUIRotorDisplay *)v15 show];
    }
    else {
      [(VOTUIRotorDisplay *)v15 hide];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRotorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VOTUIRotorViewController *)self view];
  [v4 setHidden:v3];
}

- (void).cxx_destruct
{
}

@end