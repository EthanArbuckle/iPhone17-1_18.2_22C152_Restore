@interface FLPreferencesTapActionResult
- (FLPreferencesTapActionResult)initWithViewControllerToPresent:(id)a3 presentationStyle:(unint64_t)a4;
- (UIViewController)viewControllerToPresent;
- (unint64_t)presentationStyle;
@end

@implementation FLPreferencesTapActionResult

- (FLPreferencesTapActionResult)initWithViewControllerToPresent:(id)a3 presentationStyle:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLPreferencesTapActionResult;
  v8 = [(FLPreferencesTapActionResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewControllerToPresent, a3);
    v9->_presentationStyle = a4;
  }

  return v9;
}

- (UIViewController)viewControllerToPresent
{
  return self->_viewControllerToPresent;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void).cxx_destruct
{
}

@end