@interface UIAccessibilityFunCamCustomAction
- (UIAccessibilityElement)axElement;
- (UIAccessibilityFunCamCustomAction)initWithName:(id)a3 target:(id)a4 selector:(SEL)a5 effect:(id)a6 axElement:(id)a7 vc:(id)a8;
- (UIViewController)vc;
- (id)effect;
- (void)setAxElement:(id)a3;
- (void)setEffect:(id)a3;
- (void)setVc:(id)a3;
@end

@implementation UIAccessibilityFunCamCustomAction

- (UIAccessibilityFunCamCustomAction)initWithName:(id)a3 target:(id)a4 selector:(SEL)a5 effect:(id)a6 axElement:(id)a7 vc:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)UIAccessibilityFunCamCustomAction;
  v17 = [(UIAccessibilityFunCamCustomAction *)&v20 initWithName:a3 target:a4 selector:a5];
  v18 = v17;
  if (v17)
  {
    [(UIAccessibilityFunCamCustomAction *)v17 setEffect:v14];
    [(UIAccessibilityFunCamCustomAction *)v18 setAxElement:v15];
    [(UIAccessibilityFunCamCustomAction *)v18 setVc:v16];
  }

  return v18;
}

- (id)effect
{
  id WeakRetained = objc_loadWeakRetained(&self->_effect);

  return WeakRetained;
}

- (void)setEffect:(id)a3
{
}

- (UIAccessibilityElement)axElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axElement);

  return (UIAccessibilityElement *)WeakRetained;
}

- (void)setAxElement:(id)a3
{
}

- (UIViewController)vc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vc);

  return (UIViewController *)WeakRetained;
}

- (void)setVc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_vc);
  objc_destroyWeak((id *)&self->_axElement);

  objc_destroyWeak(&self->_effect);
}

@end