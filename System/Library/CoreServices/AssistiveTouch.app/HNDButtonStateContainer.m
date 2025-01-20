@interface HNDButtonStateContainer
- (HNDButtonStateContainer)initWithUpButton:(id)a3 downButton:(id)a4;
- (NSNumber)downButton;
- (NSNumber)upButton;
@end

@implementation HNDButtonStateContainer

- (HNDButtonStateContainer)initWithUpButton:(id)a3 downButton:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HNDButtonStateContainer;
  v9 = [(HNDButtonStateContainer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upButton, a3);
    objc_storeStrong((id *)&v10->_downButton, a4);
  }

  return v10;
}

- (NSNumber)upButton
{
  return self->_upButton;
}

- (NSNumber)downButton
{
  return self->_downButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downButton, 0);

  objc_storeStrong((id *)&self->_upButton, 0);
}

@end