@interface CSProminentDisplayInteractiveTransition
- (BSUIVibrancyConfiguration)fromVibrancyConfiguration;
- (BSUIVibrancyConfiguration)toVibrancyConfiguration;
- (CSCachingVibrancyTransitionProvider)cachingVibrancyTransitionProvider;
- (CSProminentDisplayInteractiveTransition)initWithViewController:(id)a3 baseFont:(id)a4 fromVibrancyConfiguration:(id)a5 toVibrancyConfiguration:(id)a6;
- (CSProminentDisplayInteractiveTransition)initWithViewController:(id)a3 baseFont:(id)a4 fromVibrancyConfiguration:(id)a5 toVibrancyConfiguration:(id)a6 cachingVibrancyTransitionProvider:(id)a7;
- (CSProminentDisplayViewController)viewController;
- (UIFont)baseFont;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)setCachingVibrancyTransitionProvider:(id)a3;
- (void)setViewController:(id)a3;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation CSProminentDisplayInteractiveTransition

- (CSProminentDisplayInteractiveTransition)initWithViewController:(id)a3 baseFont:(id)a4 fromVibrancyConfiguration:(id)a5 toVibrancyConfiguration:(id)a6 cachingVibrancyTransitionProvider:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CSProminentDisplayInteractiveTransition;
  v17 = [(CSProminentDisplayInteractiveTransition *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_viewController, v12);
    objc_storeStrong((id *)&v18->_baseFont, a4);
    uint64_t v19 = [v14 copy];
    fromVibrancyConfiguration = v18->_fromVibrancyConfiguration;
    v18->_fromVibrancyConfiguration = (BSUIVibrancyConfiguration *)v19;

    uint64_t v21 = [v15 copy];
    toVibrancyConfiguration = v18->_toVibrancyConfiguration;
    v18->_toVibrancyConfiguration = (BSUIVibrancyConfiguration *)v21;

    objc_storeStrong((id *)&v18->_cachingVibrancyTransitionProvider, a7);
  }

  return v18;
}

- (CSProminentDisplayInteractiveTransition)initWithViewController:(id)a3 baseFont:(id)a4 fromVibrancyConfiguration:(id)a5 toVibrancyConfiguration:(id)a6
{
  return [(CSProminentDisplayInteractiveTransition *)self initWithViewController:a3 baseFont:a4 fromVibrancyConfiguration:a5 toVibrancyConfiguration:a6 cachingVibrancyTransitionProvider:0];
}

- (void)updateInteractiveTransition:(double)a3
{
  id v5 = [(CSProminentDisplayInteractiveTransition *)self viewController];
  [v5 interactiveTransition:self didUpdate:a3];
}

- (void)finishInteractiveTransition
{
  id v3 = [(CSProminentDisplayInteractiveTransition *)self viewController];
  [v3 interactiveTransition:self didFinishSuccessfully:1];
}

- (void)cancelInteractiveTransition
{
  id v3 = [(CSProminentDisplayInteractiveTransition *)self viewController];
  [v3 interactiveTransition:self didFinishSuccessfully:0];
}

- (CSProminentDisplayViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (CSProminentDisplayViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (BSUIVibrancyConfiguration)fromVibrancyConfiguration
{
  return self->_fromVibrancyConfiguration;
}

- (BSUIVibrancyConfiguration)toVibrancyConfiguration
{
  return self->_toVibrancyConfiguration;
}

- (CSCachingVibrancyTransitionProvider)cachingVibrancyTransitionProvider
{
  return self->_cachingVibrancyTransitionProvider;
}

- (void)setCachingVibrancyTransitionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingVibrancyTransitionProvider, 0);
  objc_storeStrong((id *)&self->_toVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_fromVibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);

  objc_destroyWeak((id *)&self->_viewController);
}

@end