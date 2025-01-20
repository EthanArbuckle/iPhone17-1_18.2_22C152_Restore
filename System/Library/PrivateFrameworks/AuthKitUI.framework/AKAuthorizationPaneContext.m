@interface AKAuthorizationPaneContext
- (AKAuthorizationPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4;
- (AKAuthorizationPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4 mutableConstraints:(id)a5;
- (AKAuthorizationPaneViewController)paneViewController;
- (NSMutableArray)internalMutableConstraints;
- (NSMutableArray)mutableConstraints;
- (UIStackView)stackView;
- (void)addEmptyViewWithSpacing:(double)a3;
- (void)addSubPane:(id)a3;
- (void)setInternalMutableConstraints:(id)a3;
@end

@implementation AKAuthorizationPaneContext

- (AKAuthorizationPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationPaneContext;
  v9 = [(AKAuthorizationPaneContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paneViewController, a3);
    objc_storeStrong((id *)&v10->_stackView, a4);
  }

  return v10;
}

- (AKAuthorizationPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4 mutableConstraints:(id)a5
{
  id v9 = a5;
  v10 = [(AKAuthorizationPaneContext *)self initWithPaneViewController:a3 stackView:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_internalMutableConstraints, a5);
  }

  return v11;
}

- (NSMutableArray)mutableConstraints
{
  v3 = [(AKAuthorizationPaneContext *)self internalMutableConstraints];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(AKAuthorizationPaneContext *)self paneViewController];
    id v5 = [v6 mutableConstraints];
  }

  return (NSMutableArray *)v5;
}

- (void)addSubPane:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAuthorizationPaneContext *)self stackView];
  [v4 addToStackView:v5 context:self];

  id v6 = [(AKAuthorizationPaneContext *)self mutableConstraints];
  [v4 addToConstraints:v6 context:self];
}

- (void)addEmptyViewWithSpacing:(double)a3
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  id v5 = [(AKAuthorizationPaneContext *)self stackView];
  [v5 addArrangedSubview:v7];

  id v6 = [(AKAuthorizationPaneContext *)self stackView];
  [v6 setCustomSpacing:v7 afterView:a3];
}

- (AKAuthorizationPaneViewController)paneViewController
{
  return self->_paneViewController;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSMutableArray)internalMutableConstraints
{
  return self->_internalMutableConstraints;
}

- (void)setInternalMutableConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalMutableConstraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_paneViewController, 0);
}

@end