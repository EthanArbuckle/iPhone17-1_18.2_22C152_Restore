@interface DOCContentUnavailableButtonProperties
+ (Class)implClass;
- (UIAction)primaryAction;
- (id)asUIKit;
- (void)configurePlain;
- (void)setPrimaryAction:(id)a3;
@end

@implementation DOCContentUnavailableButtonProperties

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

- (void)configurePlain
{
  id v4 = +[UIButtonConfiguration plainButtonConfiguration];
  v3 = [(DOCContentUnavailableButtonProperties *)self asUIKit];
  [v3 setConfiguration:v4];
}

- (UIAction)primaryAction
{
  v2 = [(DOCContentUnavailableButtonProperties *)self asUIKit];
  v3 = [v2 primaryAction];

  return (UIAction *)v3;
}

- (void)setPrimaryAction:(id)a3
{
  id v4 = a3;
  v5 = [(DOCContentUnavailableButtonProperties *)self asUIKit];
  [v5 setPrimaryAction:v4];

  id v8 = [v4 title];

  if ([v8 length])
  {
    v6 = [(DOCContentUnavailableButtonProperties *)self asUIKit];
    v7 = [v6 configuration];
    [v7 setTitle:v8];
  }
}

@end