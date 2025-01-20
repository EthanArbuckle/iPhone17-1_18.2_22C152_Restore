@interface QLDetailItemViewControllerState
+ (id)detailItemViewControllerStateWithActionButtonTitle:(id)a3 actionButtonView:(id)a4 informationVisible:(BOOL)a5;
- (BOOL)isInformationVisible;
- (NSString)actionButtonTitle;
- (UIView)actionButtonView;
- (void)setActionButtonTitle:(id)a3;
- (void)setActionButtonView:(id)a3;
- (void)setInformationVisible:(BOOL)a3;
@end

@implementation QLDetailItemViewControllerState

+ (id)detailItemViewControllerStateWithActionButtonTitle:(id)a3 actionButtonView:(id)a4 informationVisible:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_new();
  [v9 setActionButtonTitle:v8];

  [v9 setActionButtonView:v7];
  [v9 setInformationVisible:v5];

  return v9;
}

- (NSString)actionButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActionButtonTitle:(id)a3
{
}

- (UIView)actionButtonView
{
  return (UIView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActionButtonView:(id)a3
{
}

- (BOOL)isInformationVisible
{
  return self->_informationVisible;
}

- (void)setInformationVisible:(BOOL)a3
{
  self->_informationVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonView, 0);

  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
}

@end