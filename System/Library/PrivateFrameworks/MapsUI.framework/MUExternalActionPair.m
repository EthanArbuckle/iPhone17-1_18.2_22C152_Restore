@interface MUExternalActionPair
- (MUExternalActionPair)initWithAction:(id)a3 actionController:(id)a4;
- (MUGroupedExternalActionController)actionController;
- (NSArray)viewModels;
@end

@implementation MUExternalActionPair

- (MUExternalActionPair)initWithAction:(id)a3 actionController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUExternalActionPair;
  v9 = [(MUExternalActionPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModels, a3);
    objc_storeStrong((id *)&v10->_actionController, a4);
  }

  return v10;
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (MUGroupedExternalActionController)actionController
{
  return self->_actionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end