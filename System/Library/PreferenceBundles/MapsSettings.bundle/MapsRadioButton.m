@interface MapsRadioButton
+ (id)buttonWithGroupIdentifier:(id)a3;
- (BOOL)isSelected;
- (CGSize)intrinsicContentSize;
- (MapsRadioButton)initWithFrame:(CGRect)a3;
- (NSObject)groupIdentifier;
- (UILabel)associatedLabel;
- (double)sizingLength;
- (int)controlSize;
- (void)_buttonTapped:(id)a3;
- (void)_fireAction;
- (void)_labelTapped;
- (void)_otherButtonDidChange:(id)a3;
- (void)setAssociatedLabel:(id)a3;
- (void)setControlSize:(int)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation MapsRadioButton

+ (id)buttonWithGroupIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)a1), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v5 setGroupIdentifier:v4];

  return v5;
}

- (MapsRadioButton)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MapsRadioButton;
  v3 = -[MapsRadioButton initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:0];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = +[UIImage imageNamed:@"RadioButton-Unselected"];
    [(UIButton *)v3->_button setImage:v6 forState:0];
    [(MapsRadioButton *)v3 sizingLength];
    v7 = +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:");
    v8 = +[UIImage systemImageNamed:@"smallcircle.fill.circle.fill" withConfiguration:v7];
    v9 = [v8 imageWithRenderingMode:2];

    [(UIButton *)v3->_button setImage:v9 forState:4];
    [(UIButton *)v3->_button addTarget:v3 action:"_buttonTapped:" forControlEvents:64];
    [(MapsRadioButton *)v3 addSubview:v3->_button];
    LODWORD(v10) = 1148846080;
    v11 = [(UIButton *)v3->_button _maps_constraintsEqualToEdgesOfView:v3 priority:v10];
    v12 = [v11 allConstraints];
    +[NSLayoutConstraint activateConstraints:v12];

    v13 = [(MapsRadioButton *)v3 heightAnchor];
    v14 = [(MapsRadioButton *)v3 widthAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v19 = v15;
    v16 = +[NSArray arrayWithObjects:&v19 count:1];
    +[NSLayoutConstraint activateConstraints:v16];
  }
  return v3;
}

- (void)setControlSize:(int)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    [(MapsRadioButton *)self invalidateIntrinsicContentSize];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIButton *)self->_button isSelected] != a3)
  {
    [(UIButton *)self->_button setSelected:v3];
    if (v3)
    {
      id v5 = +[NSNotificationCenter defaultCenter];
      v6 = [(MapsRadioButton *)self groupIdentifier];
      CFStringRef v8 = @"button";
      v9 = self;
      v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      [v5 postNotificationName:@"MapsRadioButtonDidChangeNotification" object:v6 userInfo:v7];
    }
  }
}

- (BOOL)isSelected
{
  return [(UIButton *)self->_button isSelected];
}

- (void)setGroupIdentifier:(id)a3
{
  id v4 = a3;
  groupIdentifier = self->_groupIdentifier;
  unint64_t v13 = (unint64_t)v4;
  id v6 = groupIdentifier;
  v7 = (void *)v13;
  if (v13 | (unint64_t)v6)
  {
    unsigned __int8 v8 = [(id)v13 isEqual:v6];

    v7 = (void *)v13;
    if ((v8 & 1) == 0)
    {
      if (self->_groupIdentifier)
      {
        v9 = +[NSNotificationCenter defaultCenter];
        [v9 removeObserver:self name:@"MapsRadioButtonDidChangeNotification" object:self->_groupIdentifier];
      }
      double v10 = [(id)v13 copyWithZone:0];
      v11 = self->_groupIdentifier;
      self->_groupIdentifier = v10;

      v7 = (void *)v13;
      if (self->_groupIdentifier)
      {
        v12 = +[NSNotificationCenter defaultCenter];
        [v12 addObserver:self selector:"_otherButtonDidChange:" name:@"MapsRadioButtonDidChangeNotification" object:self->_groupIdentifier];

        v7 = (void *)v13;
      }
    }
  }
}

- (void)_otherButtonDidChange:(id)a3
{
  id v8 = a3;
  id v4 = [v8 object];
  if (v4 && [(MapsRadioButton *)self isSelected])
  {
    id v5 = [v8 object];
    unsigned int v6 = [v5 isEqual:self->_groupIdentifier];

    if (!v6) {
      goto LABEL_8;
    }
    v7 = [v8 userInfo];
    id v4 = [v7 objectForKeyedSubscript:@"button"];

    if (v4 == self) {
      id v4 = self;
    }
    else {
      [(MapsRadioButton *)self setSelected:0];
    }
  }

LABEL_8:
}

- (void)_buttonTapped:(id)a3
{
}

- (void)_fireAction
{
  [(MapsRadioButton *)self setSelected:1];

  [(MapsRadioButton *)self sendActionsForControlEvents:4096];
}

- (void)setAssociatedLabel:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedLabel);

  if (WeakRetained != obj)
  {
    if (self->_labelTapGesture)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_associatedLabel);

      if (v5)
      {
        id v6 = objc_loadWeakRetained((id *)&self->_associatedLabel);
        [v6 removeGestureRecognizer:self->_labelTapGesture];
      }
    }
    id v7 = objc_storeWeak((id *)&self->_associatedLabel, obj);

    if (obj)
    {
      if (!self->_labelTapGesture)
      {
        id v8 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_labelTapped"];
        labelTapGesture = self->_labelTapGesture;
        self->_labelTapGesture = v8;
      }
      id v10 = objc_loadWeakRetained((id *)&self->_associatedLabel);
      [v10 setUserInteractionEnabled:1];

      id v11 = objc_loadWeakRetained((id *)&self->_associatedLabel);
      [v11 addGestureRecognizer:self->_labelTapGesture];
    }
  }
}

- (void)_labelTapped
{
}

- (double)sizingLength
{
  if ([(MapsRadioButton *)self controlSize]) {
    return (double)14;
  }
  else {
    return (double)16;
  }
}

- (CGSize)intrinsicContentSize
{
  [(MapsRadioButton *)self sizingLength];
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSObject)groupIdentifier
{
  return self->_groupIdentifier;
}

- (int)controlSize
{
  return self->_controlSize;
}

- (UILabel)associatedLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedLabel);

  return (UILabel *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedLabel);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_labelTapGesture, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end