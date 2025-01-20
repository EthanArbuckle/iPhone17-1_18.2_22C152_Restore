@interface HSSetupStaticConfigurator
- (HSSetupStaticConfigurator)initWithContentViewControllers:(id)a3;
- (HSSetupStaticConfigurator)initWithViewControllers:(id)a3;
- (NSArray)staticViewControllers;
- (id)_nextViewControllerForResults:(id)a3;
- (void)setStaticViewControllers:(id)a3;
@end

@implementation HSSetupStaticConfigurator

- (HSSetupStaticConfigurator)initWithViewControllers:(id)a3
{
  id v5 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001292C;
  v11[3] = &unk_1000A9430;
  v6 = self;
  v12 = v6;
  [v5 na_each:v11];
  v7 = [v5 firstObject];
  v10.receiver = v6;
  v10.super_class = (Class)HSSetupStaticConfigurator;
  v8 = [(HSSetupConfigurator *)&v10 initWithInitialViewController:v7];

  if (v8) {
    objc_storeStrong((id *)&v8->_staticViewControllers, a3);
  }

  return v8;
}

- (HSSetupStaticConfigurator)initWithContentViewControllers:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000129E4;
  v8[3] = &unk_1000A9458;
  v4 = self;
  v9 = v4;
  id v5 = [a3 na_map:v8];
  v6 = [(HSSetupStaticConfigurator *)v4 initWithViewControllers:v5];

  return v6;
}

- (id)_nextViewControllerForResults:(id)a3
{
  v4 = [(HSSetupStaticConfigurator *)self staticViewControllers];
  id v5 = [(HSSetupStaticConfigurator *)self currentViewController];
  v6 = (char *)[v4 indexOfObject:v5];

  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [(HSSetupStaticConfigurator *)self currentViewController];
    v8 = [(HSSetupStaticConfigurator *)self staticViewControllers];
    NSLog(@"currentViewController %@ not in staticViewControllers %@", v7, v8);
  }
  v9 = v6 + 1;
  objc_super v10 = [(HSSetupStaticConfigurator *)self staticViewControllers];
  v11 = (char *)[v10 count];

  if (v9 < v11
    && ([(HSSetupStaticConfigurator *)self staticViewControllers],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 objectAtIndexedSubscript:v9],
        v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    v14 = +[NAFuture futureWithResult:v13];
  }
  else
  {
    v14 = +[NAFuture futureWithNoResult];
  }

  return v14;
}

- (NSArray)staticViewControllers
{
  return self->_staticViewControllers;
}

- (void)setStaticViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end