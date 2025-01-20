@interface AVMobileAuxiliaryControl
+ (id)controlWithDisplayPriority:(int64_t)a3 identifier:(id)a4;
+ (id)controlWithView:(id)a3 displayPriority:(int64_t)a4 identifier:(id)a5;
- (AVMobileAuxiliaryControlDelegate)delegate;
- (BOOL)canOnlyAppearInOverflowMenu;
- (BOOL)isIncluded;
- (NSString)identifier;
- (UIView)controlView;
- (id)description;
- (int64_t)displayPriority;
- (void)setDelegate:(id)a3;
- (void)setIncluded:(BOOL)a3;
@end

@implementation AVMobileAuxiliaryControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (UIView)controlView
{
  return self->_controlView;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)displayPriority
{
  return self->_displayPriority;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileAuxiliaryControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileAuxiliaryControlDelegate *)WeakRetained;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AVMobileAuxiliaryControl;
  v4 = [(AVMobileAuxiliaryControl *)&v7 description];
  v5 = [v3 stringWithFormat:@"[%@ - %@]", v4, self->_identifier];

  return v5;
}

- (BOOL)canOnlyAppearInOverflowMenu
{
  return self->_controlView == 0;
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    id v4 = [(AVMobileAuxiliaryControl *)self delegate];
    [v4 auxiliaryControlDidChangeState:self];
  }
}

+ (id)controlWithDisplayPriority:(int64_t)a3 identifier:(id)a4
{
  v5 = (NSString *)a4;
  v6 = objc_alloc_init(AVMobileAuxiliaryControl);
  identifier = v6->_identifier;
  v6->_displayPriority = a3;
  v6->_identifier = v5;

  return v6;
}

+ (id)controlWithView:(id)a3 displayPriority:(int64_t)a4 identifier:(id)a5
{
  objc_super v7 = (UIView *)a3;
  v8 = (NSString *)a5;
  [(UIView *)v7 setTranslatesAutoresizingMaskIntoConstraints:1];
  [(UIView *)v7 setAutoresizingMask:0];
  v9 = objc_alloc_init(AVMobileAuxiliaryControl);
  controlView = v9->_controlView;
  v9->_controlView = v7;
  v11 = v7;

  identifier = v9->_identifier;
  v9->_displayPriority = a4;
  v9->_identifier = v8;

  return v9;
}

@end