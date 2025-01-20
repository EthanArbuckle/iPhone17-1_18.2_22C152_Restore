@interface CKBrowserPluginCell
+ (id)reuseIdentifier;
- (IMBalloonPlugin)plugin;
- (UIImageView)browserImage;
- (id)iconView;
- (void)_setImageForPlugin:(id)a3;
- (void)_updateShinyStatus;
- (void)layoutSubviews;
- (void)setBrowserImage:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setPlugin:(id)a3 hideShinyStatus:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
@end

@implementation CKBrowserPluginCell

+ (id)reuseIdentifier
{
  return @"CKBrowserPluginCell";
}

- (id)iconView
{
  v3 = [(CKBrowserPluginCell *)self browserImage];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKBrowserPluginCell *)self setBrowserImage:v5];
  }

  return [(CKBrowserPluginCell *)self browserImage];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKBrowserPluginCell *)self isSelected] != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)CKBrowserPluginCell;
    [(CKBrowserPluginCell *)&v15 setSelected:v3];
    double v5 = 0.0;
    if (v3)
    {
      double v5 = 1.0;
      if (!self->_selectionOutline)
      {
        id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
        v7 = +[CKUIBehavior sharedBehaviors];
        v8 = [v7 theme];
        v9 = [v8 appSelectionOutline];
        v10 = (UIImageView *)[v6 initWithImage:v9];
        selectionOutline = self->_selectionOutline;
        self->_selectionOutline = v10;

        v12 = +[CKUIBehavior sharedBehaviors];
        v13 = [v12 theme];
        v14 = [v13 appSelectionOutlineColor];
        [(UIImageView *)self->_selectionOutline setTintColor:v14];

        [(CKBrowserPluginCell *)self addSubview:self->_selectionOutline];
        [(CKBrowserPluginCell *)self sendSubviewToBack:self->_selectionOutline];
        [(CKBrowserPluginCell *)self setNeedsLayout];
      }
    }
    [(UIImageView *)self->_selectionOutline setAlpha:v5];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKBrowserPluginCell;
  [(CKBrowserCell *)&v4 layoutSubviews];
  selectionOutline = self->_selectionOutline;
  [(CKBrowserCell *)self selectionFrame];
  -[UIImageView setFrame:](selectionOutline, "setFrame:");
}

- (void)_setImageForPlugin:(id)a3
{
  id v4 = a3;
  double v5 = [(CKBrowserPluginCell *)self traitCollection];
  objc_msgSend(v4, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(CKBrowserPluginCell *)self browserImage];
  [v6 setImage:v7];
}

- (void)setPlugin:(id)a3
{
}

- (void)setPlugin:(id)a3 hideShinyStatus:(BOOL)a4
{
  id v23 = a3;
  [(CKBrowserPluginCell *)self _setImageForPlugin:v23];
  id v7 = [v23 identifier];
  v8 = IMBalloonExtensionIDWithSuffix();
  int v9 = [v7 isEqualToString:v8];

  v10 = [(CKBrowserCell *)self browserLabel];
  if (v9)
  {
    v11 = CKFrameworkBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"MEMOJI_STICKERS_SHORT_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_6:
    v13 = (void *)v12;
    [v10 setText:v12];

    goto LABEL_7;
  }
  v11 = [v23 browserShortDisplayName];
  if (!v11)
  {
    uint64_t v12 = [v23 browserDisplayName];
    goto LABEL_6;
  }
  [v10 setText:v11];
LABEL_7:

  v14 = +[CKBalloonPluginManager sharedInstance];
  objc_super v15 = [v23 identifier];
  uint64_t v16 = [v14 badgeValueForPlugin:v15];

  v17 = [(CKBrowserCell *)self badgeView];
  [v17 setValue:v16];

  v18 = [(CKBrowserCell *)self badgeView];
  [v18 setHidden:v16 == 0];

  objc_storeStrong((id *)&self->_plugin, a3);
  [(CKBrowserPluginCell *)self _updateShinyStatus];
  v19 = [(CKBrowserCell *)self shinyStatusView];
  [v19 removeFromSuperview];

  if (!a4
    && ([(CKBrowserCell *)self shinyStatus] || [(CKBrowserCell *)self shinyStatus] != 3))
  {
    v20 = [[CKBrowserSelectionLabelAccessoryView alloc] initWithLabelAccessoryType:[(CKBrowserCell *)self shinyStatus]];
    [(CKBrowserCell *)self setShinyStatusView:v20];

    v21 = [(CKBrowserPluginCell *)self contentView];
    v22 = [(CKBrowserCell *)self shinyStatusView];
    [v21 addSubview:v22];
  }
  [(CKBrowserPluginCell *)self setNeedsLayout];
}

- (void)_updateShinyStatus
{
  BOOL v3 = [(CKBrowserPluginCell *)self plugin];
  int v4 = [v3 isBetaPlugin];

  if (v4)
  {
    double v5 = self;
    uint64_t v6 = 2;
  }
  else
  {
    id v7 = +[CKBalloonPluginManager sharedInstance];
    uint64_t v8 = [v7 launchStatusForPlugin:self->_plugin];

    double v5 = self;
    if (v8 == 1)
    {
      uint64_t v6 = 0;
    }
    else if (v8)
    {
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v6 = 1;
    }
  }

  [(CKBrowserCell *)v5 setShinyStatus:v6];
}

- (IMBalloonPlugin)plugin
{
  return self->_plugin;
}

- (UIImageView)browserImage
{
  return self->_browserImage;
}

- (void)setBrowserImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserImage, 0);
  objc_storeStrong((id *)&self->_plugin, 0);

  objc_storeStrong((id *)&self->_selectionOutline, 0);
}

@end