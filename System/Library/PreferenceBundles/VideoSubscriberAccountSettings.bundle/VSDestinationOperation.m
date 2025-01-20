@interface VSDestinationOperation
- (NSString)destination;
- (VSDestinationOperation)initWithDestination:(id)a3 viewController:(id)a4;
- (VSSettingsViewController)viewController;
- (void)executionDidBegin;
- (void)setDestination:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation VSDestinationOperation

- (void)executionDidBegin
{
  v3 = [(VSDestinationOperation *)self viewController];
  v4 = [v3 view];
  [v4 setUserInteractionEnabled:0];

  v5 = [(VSDestinationOperation *)self destination];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B838;
  v7[3] = &unk_14A50;
  id v8 = v3;
  v9 = self;
  id v6 = v3;
  [v6 handleDestination:v5 completion:v7];
}

- (VSDestinationOperation)initWithDestination:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VSDestinationOperation;
  v9 = [(VSDestinationOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destination, a3);
    objc_storeWeak((id *)&v10->_viewController, v8);
    v11 = [v7 description];
    v12 = +[NSString stringWithFormat:@"%@", v11];
    [(VSDestinationOperation *)v10 setName:v12];
  }
  return v10;
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (VSSettingsViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (VSSettingsViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end