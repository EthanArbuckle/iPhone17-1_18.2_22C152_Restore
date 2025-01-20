@interface AAUISpecifierSpinnerController
- (AAUISpecifierSpinnerController)initWithSpecifier:(id)a3;
- (void)startSpinning;
- (void)stopSpinning;
@end

@implementation AAUISpecifierSpinnerController

- (AAUISpecifierSpinnerController)initWithSpecifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUISpecifierSpinnerController;
  v6 = [(AAUISpecifierSpinnerController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specifier, a3);
  }

  return v7;
}

- (void)startSpinning
{
}

- (void)stopSpinning
{
}

- (void).cxx_destruct
{
}

@end