@interface AMSUIWebActivityIndicatorModel
- (AMSUIWebActivityIndicatorModel)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)animate;
- (NSString)debugDescription;
- (void)setAnimate:(BOOL)a3;
@end

@implementation AMSUIWebActivityIndicatorModel

- (AMSUIWebActivityIndicatorModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSUIWebActivityIndicatorModel;
  v6 = [(AMSUIWebActivityIndicatorModel *)&v10 init];
  if (v6)
  {
    v7 = [v5 objectForKeyedSubscript:@"animate"];
    if (objc_opt_respondsToSelector())
    {
      v8 = [v5 objectForKeyedSubscript:@"animate"];
      v6->_animate = [v8 BOOLValue];
    }
    else
    {
      v6->_animate = 1;
    }
  }
  return v6;
}

- (NSString)debugDescription
{
  v8[1] = *MEMORY[0x263EF8340];
  v7 = @"animate";
  BOOL v2 = [(AMSUIWebActivityIndicatorModel *)self animate];
  v3 = @"false";
  if (v2) {
    v3 = @"true";
  }
  v8[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v4 description];

  return (NSString *)v5;
}

- (BOOL)animate
{
  return self->_animate;
}

- (void)setAnimate:(BOOL)a3
{
  self->_animate = a3;
}

@end