@interface PasscodeViewState
+ (id)activeStateWithTitle:(id)a3 subtitle:(id)a4 accessoryView:(id)a5;
+ (id)backOffStateWithTitle:(id)a3 subtitle:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (PasscodeViewState)initWithRawValue:(int64_t)a3 title:(id)a4 subtitle:(id)a5 accessoryView:(id)a6 style:(id)a7;
- (PasscodeViewStyle)style;
- (UIView)accessoryView;
- (id)withStyle:(id)a3;
- (int64_t)rawValue;
@end

@implementation PasscodeViewState

- (PasscodeViewState)initWithRawValue:(int64_t)a3 title:(id)a4 subtitle:(id)a5 accessoryView:(id)a6 style:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PasscodeViewState;
  v17 = [(PasscodeViewState *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_rawValue = a3;
    objc_storeStrong((id *)&v17->_title, a4);
    objc_storeStrong((id *)&v18->_subtitle, a5);
    objc_storeStrong((id *)&v18->_accessoryView, a6);
    if (v16)
    {
      v19 = (PasscodeViewStyle *)v16;
    }
    else
    {
      v19 = +[PasscodeViewStyle defaultStyleWithBackgroundStyle:0];
    }
    style = v18->_style;
    v18->_style = v19;
  }
  return v18;
}

+ (id)activeStateWithTitle:(id)a3 subtitle:(id)a4 accessoryView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[PasscodeViewState alloc] initWithRawValue:0 title:v9 subtitle:v8 accessoryView:v7 style:0];

  return v10;
}

+ (id)backOffStateWithTitle:(id)a3 subtitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PasscodeViewState alloc] initWithRawValue:1 title:v6 subtitle:v5 accessoryView:0 style:0];

  return v7;
}

- (id)withStyle:(id)a3
{
  id v4 = a3;
  id v5 = [PasscodeViewState alloc];
  int64_t v6 = [(PasscodeViewState *)self rawValue];
  id v7 = [(PasscodeViewState *)self title];
  id v8 = [(PasscodeViewState *)self subtitle];
  id v9 = [(PasscodeViewState *)self accessoryView];
  v10 = [(PasscodeViewState *)v5 initWithRawValue:v6 title:v7 subtitle:v8 accessoryView:v9 style:v4];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PasscodeViewState *)self rawValue];
    if (v6 != [v5 rawValue]) {
      goto LABEL_8;
    }
    id v7 = [(PasscodeViewState *)self style];
    id v8 = [v5 style];

    if (v7 != v8) {
      goto LABEL_8;
    }
    id v9 = [(PasscodeViewState *)self title];
    v10 = [v5 title];
    unsigned int v11 = [v9 isEqualToString:v10];

    if (!v11) {
      goto LABEL_8;
    }
    v12 = [(PasscodeViewState *)self subtitle];
    id v13 = [v5 subtitle];
    unsigned int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      id v15 = [(PasscodeViewState *)self accessoryView];
      id v16 = [v5 accessoryView];
      BOOL v17 = v15 == v16;
    }
    else
    {
LABEL_8:
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (PasscodeViewStyle)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end