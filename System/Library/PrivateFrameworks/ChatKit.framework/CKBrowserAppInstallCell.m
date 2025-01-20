@interface CKBrowserAppInstallCell
+ (id)reuseIdentifier;
- (CKAppInstallation)installation;
- (CKBrowserIconView)browserIconView;
- (id)iconView;
- (void)layoutSubviews;
- (void)setBrowserIconView:(id)a3;
- (void)setInstallation:(id)a3;
@end

@implementation CKBrowserAppInstallCell

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKBrowserAppInstallCell;
  [(CKBrowserCell *)&v4 layoutSubviews];
  v3 = [(CKBrowserCell *)self badgeView];
  [v3 setHidden:1];
}

+ (id)reuseIdentifier
{
  return @"CKBrowserAppInstallCell";
}

- (id)iconView
{
  v3 = [(CKBrowserAppInstallCell *)self browserIconView];

  if (!v3)
  {
    objc_super v4 = [CKBrowserIconView alloc];
    v5 = -[CKBrowserIconView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKBrowserAppInstallCell *)self setBrowserIconView:v5];
  }

  return [(CKBrowserAppInstallCell *)self browserIconView];
}

- (void)setInstallation:(id)a3
{
  v5 = (CKAppInstallation *)a3;
  if (self->_installation != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_installation, a3);
    v6 = [(CKAppInstallation *)v12 icon];
    v7 = [(CKBrowserAppInstallCell *)self browserIconView];
    [v7 setIconImage:v6];

    v8 = [(CKAppInstallation *)v12 localizedDisplayName];
    v9 = [(CKBrowserCell *)self browserLabel];
    [v9 setText:v8];

    v10 = [(CKBrowserAppInstallCell *)self browserIconView];
    if ([(CKAppInstallation *)v12 installed]) {
      double v11 = 100.0;
    }
    else {
      [(CKAppInstallation *)v12 percentComplete];
    }
    [v10 setPercentComplete:1 animated:v11];

    [(CKBrowserAppInstallCell *)self setNeedsLayout];
    v5 = v12;
  }
}

- (CKAppInstallation)installation
{
  return self->_installation;
}

- (CKBrowserIconView)browserIconView
{
  return self->_browserIconView;
}

- (void)setBrowserIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserIconView, 0);

  objc_storeStrong((id *)&self->_installation, 0);
}

@end