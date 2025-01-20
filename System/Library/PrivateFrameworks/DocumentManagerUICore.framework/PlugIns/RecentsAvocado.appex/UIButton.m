@interface UIButton
- (UIAction)doc_primaryAction;
- (void)setDoc_primaryAction:(id)a3;
@end

@implementation UIButton

- (UIAction)doc_primaryAction
{
  v2 = self;
  v3 = (void *)UIButton.doc_primaryAction.getter();

  return (UIAction *)v3;
}

- (void)setDoc_primaryAction:(id)a3
{
  id v5 = a3;
  v6 = self;
  UIButton.doc_primaryAction.setter(a3);
}

@end