@interface CAMExpandingControlMenuItemConfiguration
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)slashesTitle;
- (BOOL)tintsTitle;
- (NSString)axHUDSymbolName;
- (UIImageSymbolConfiguration)axHUDSymbolConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)titleBorder;
- (void)setAxHUDSymbolConfiguration:(id)a3;
- (void)setAxHUDSymbolName:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setSlashesTitle:(BOOL)a3;
- (void)setTintsTitle:(BOOL)a3;
- (void)setTitleBorder:(int64_t)a3;
@end

@implementation CAMExpandingControlMenuItemConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(CAMExpandingControlMenuItemConfiguration *)self isEqualToConfiguration:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = (CAMExpandingControlMenuItemConfiguration *)a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v12 = 1;
    goto LABEL_11;
  }
  BOOL v6 = [(CAMExpandingControlMenuItemConfiguration *)self slashesTitle];
  if (v6 == [(CAMExpandingControlMenuItemConfiguration *)v5 slashesTitle]
    && (BOOL v7 = [(CAMExpandingControlMenuItemConfiguration *)self hidden],
        v7 == [(CAMExpandingControlMenuItemConfiguration *)v5 hidden])
    && (BOOL v8 = [(CAMExpandingControlMenuItemConfiguration *)self tintsTitle],
        v8 == [(CAMExpandingControlMenuItemConfiguration *)v5 tintsTitle])
    && (int64_t v9 = [(CAMExpandingControlMenuItemConfiguration *)self titleBorder],
        v9 == [(CAMExpandingControlMenuItemConfiguration *)v5 titleBorder]))
  {
    v10 = [(CAMExpandingControlMenuItemConfiguration *)self axHUDSymbolName];
    v11 = [(CAMExpandingControlMenuItemConfiguration *)v5 axHUDSymbolName];
    if (v10 == v11)
    {
      v14 = [(CAMExpandingControlMenuItemConfiguration *)self axHUDSymbolConfiguration];
      v15 = [(CAMExpandingControlMenuItemConfiguration *)v5 axHUDSymbolConfiguration];
      if (v14 == v15)
      {
        char v12 = 1;
      }
      else
      {
        v16 = [(CAMExpandingControlMenuItemConfiguration *)self axHUDSymbolConfiguration];
        v17 = [(CAMExpandingControlMenuItemConfiguration *)v5 axHUDSymbolConfiguration];
        char v12 = [v16 isEqualToConfiguration:v17];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
LABEL_9:
    char v12 = 0;
  }
LABEL_11:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CAMExpandingControlMenuItemConfiguration allocWithZone:a3] init];
  [(CAMExpandingControlMenuItemConfiguration *)v4 setSlashesTitle:[(CAMExpandingControlMenuItemConfiguration *)self slashesTitle]];
  [(CAMExpandingControlMenuItemConfiguration *)v4 setTintsTitle:[(CAMExpandingControlMenuItemConfiguration *)self tintsTitle]];
  [(CAMExpandingControlMenuItemConfiguration *)v4 setTitleBorder:[(CAMExpandingControlMenuItemConfiguration *)self titleBorder]];
  [(CAMExpandingControlMenuItemConfiguration *)v4 setHidden:[(CAMExpandingControlMenuItemConfiguration *)self hidden]];
  BOOL v5 = [(CAMExpandingControlMenuItemConfiguration *)self axHUDSymbolName];
  [(CAMExpandingControlMenuItemConfiguration *)v4 setAxHUDSymbolName:v5];

  BOOL v6 = [(CAMExpandingControlMenuItemConfiguration *)self axHUDSymbolConfiguration];
  [(CAMExpandingControlMenuItemConfiguration *)v4 setAxHUDSymbolConfiguration:v6];

  return v4;
}

- (BOOL)tintsTitle
{
  return self->_tintsTitle;
}

- (void)setTintsTitle:(BOOL)a3
{
  self->_tintsTitle = a3;
}

- (BOOL)slashesTitle
{
  return self->_slashesTitle;
}

- (void)setSlashesTitle:(BOOL)a3
{
  self->_slashesTitle = a3;
}

- (int64_t)titleBorder
{
  return self->_titleBorder;
}

- (void)setTitleBorder:(int64_t)a3
{
  self->_titleBorder = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)axHUDSymbolName
{
  return self->_axHUDSymbolName;
}

- (void)setAxHUDSymbolName:(id)a3
{
}

- (UIImageSymbolConfiguration)axHUDSymbolConfiguration
{
  return self->_axHUDSymbolConfiguration;
}

- (void)setAxHUDSymbolConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHUDSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_axHUDSymbolName, 0);
}

@end