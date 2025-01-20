@interface SRCompactResultPlatterViewController
- (NSArray)siriContentViewControllers;
- (id)_createReusableViewWithClass:(Class)a3 snippetViewController:(id)a4;
- (void)setSiriContentViewControllers:(id)a3;
@end

@implementation SRCompactResultPlatterViewController

- (void)setSiriContentViewControllers:(id)a3
{
  v5 = (NSArray *)a3;
  p_siriContentViewControllers = &self->_siriContentViewControllers;
  if (self->_siriContentViewControllers != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->_siriContentViewControllers, a3);
    v7 = objc_opt_new();
    if ([(NSArray *)*p_siriContentViewControllers count])
    {
      unint64_t v8 = 0;
      v20 = self;
      do
      {
        v9 = -[NSArray objectAtIndex:](*p_siriContentViewControllers, "objectAtIndex:", v8, v18);
        v10 = [(NSArray *)*p_siriContentViewControllers lastObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v9;
          [v7 addObject:v11];
          v12 = -[SRCompactResultPlatterViewController _createReusableViewWithClass:snippetViewController:](self, "_createReusableViewWithClass:snippetViewController:", [v11 footerViewClass], v11);
          [v11 configureReusableFooterView:v12];
          id v13 = objc_alloc_init((Class)SiriUIFooterViewController);
          [v13 setView:v12];
          if (v12)
          {
            [(id)objc_opt_class() defaultHeight];
            if (v14 > 0.0)
            {
              id v15 = objc_alloc_init((Class)UIViewController);
              id v16 = objc_alloc_init((Class)SiriSharedUIContentPlatterSeparatorView);
              [v16 setSeparatorType:1];
              [v15 setView:v16];
              [v7 addObject:v15];

              self = v20;
            }
          }
          [v7 addObject:v13];
        }
        ++v8;
        if (v9 != v10)
        {
          v17 = [(NSArray *)*p_siriContentViewControllers objectAtIndex:v8];
          [(SRCompactResultPlatterViewController *)self appendSeparatorToViewControllers:v7 forNextViewController:v17];
        }
      }
      while ([(NSArray *)*p_siriContentViewControllers count] > v8);
    }
    -[SRCompactResultPlatterViewController setContentViewControllers:](self, "setContentViewControllers:", v7, v18);

    v5 = v19;
  }
}

- (id)_createReusableViewWithClass:(Class)a3 snippetViewController:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    a3 = [[a3 alloc] initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    if (objc_opt_respondsToSelector()) {
      [(objc_class *)a3 setSnippetViewController:v5];
    }
  }

  return a3;
}

- (NSArray)siriContentViewControllers
{
  return self->_siriContentViewControllers;
}

- (void).cxx_destruct
{
}

@end