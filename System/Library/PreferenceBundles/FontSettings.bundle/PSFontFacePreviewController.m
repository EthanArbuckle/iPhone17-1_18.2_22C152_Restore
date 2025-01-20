@interface PSFontFacePreviewController
- (NSArray)sampleViewControllers;
- (UIFont)font;
- (UIPageViewController)pageViewController;
- (id)fontLocalizedStringForKey:(id)a3;
- (id)fontPreferredLanguage;
- (id)makeAlphabetSampleView;
- (id)makeLoremIpsumSampleView;
- (id)makeRepertoireView;
- (id)makeSampleViewWithText:(id)a3 ofSize:(double)a4;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (id)sampleViewForPage:(int64_t)a3;
- (int64_t)presentationCountForPageViewController:(id)a3;
- (int64_t)presentationIndexForPageViewController:(id)a3;
- (void)setFont:(id)a3;
- (void)setPageViewController:(id)a3;
- (void)setSampleViewControllers:(id)a3;
- (void)updateNavigationItem;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSFontFacePreviewController

- (void)updateNavigationItem
{
  id v2 = [(PSFontFacePreviewController *)self navigationItem];
  [v2 setHidesBackButton:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v49.receiver = self;
  v49.super_class = (Class)PSFontFacePreviewController;
  [(PSFontFacePreviewController *)&v49 viewWillAppear:a3];
  [(PSFontFacePreviewController *)self updateNavigationItem];
  v4 = (UIPageViewController *)[objc_alloc((Class)UIPageViewController) initWithTransitionStyle:1 navigationOrientation:0 options:0];
  pageViewController = self->_pageViewController;
  self->_pageViewController = v4;

  [(UIPageViewController *)self->_pageViewController setDataSource:self];
  v6 = [[SamplePageViewController alloc] initWithPage:0 andController:self];
  v53[0] = v6;
  v7 = [[SamplePageViewController alloc] initWithPage:1 andController:self];
  v53[1] = v7;
  v8 = [[SamplePageViewController alloc] initWithPage:2 andController:self];
  v53[2] = v8;
  v9 = +[NSArray arrayWithObjects:v53 count:3];
  sampleViewControllers = self->_sampleViewControllers;
  self->_sampleViewControllers = v9;

  v11 = +[UIColor systemBackgroundColor];
  v12 = [(PSFontFacePreviewController *)self pane];
  [v12 setBackgroundColor:v11];

  v13 = [(PSFontFacePreviewController *)self specifier];
  v14 = [v13 propertyForKey:PSValueKey];
  font = self->_font;
  self->_font = v14;

  uint64_t v52 = objc_opt_class();
  v16 = +[NSArray arrayWithObjects:&v52 count:1];
  v17 = +[UIPageControl appearanceWhenContainedInInstancesOfClasses:v16];
  v18 = +[UIColor labelColor];
  v19 = [v18 colorWithAlphaComponent:0.2];
  [v17 setPageIndicatorTintColor:v19];

  uint64_t v51 = objc_opt_class();
  v20 = +[NSArray arrayWithObjects:&v51 count:1];
  v21 = +[UIPageControl appearanceWhenContainedInInstancesOfClasses:v20];
  v22 = +[UIColor labelColor];
  [v21 setCurrentPageIndicatorTintColor:v22];

  v23 = [(PSFontFacePreviewController *)self pageViewController];
  v24 = [(NSArray *)self->_sampleViewControllers objectAtIndexedSubscript:0];
  v50 = v24;
  v25 = +[NSArray arrayWithObjects:&v50 count:1];
  [v23 setViewControllers:v25 direction:0 animated:0 completion:0];

  v26 = objc_opt_new();
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v26 setAutoresizesSubviews:1];
  v27 = [(PSFontFacePreviewController *)self pane];
  [v27 addSubview:v26];

  v28 = [v26 topAnchor];
  v29 = [(PSFontFacePreviewController *)self pane];
  v30 = [v29 safeAreaLayoutGuide];
  v31 = [v30 topAnchor];
  v32 = [v28 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [v26 bottomAnchor];
  v34 = [(PSFontFacePreviewController *)self pane];
  v35 = [v34 safeAreaLayoutGuide];
  v36 = [v35 bottomAnchor];
  v37 = [v33 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  v38 = [v26 leadingAnchor];
  v39 = [(PSFontFacePreviewController *)self pane];
  v40 = [v39 safeAreaLayoutGuide];
  v41 = [v40 leadingAnchor];
  v42 = [v38 constraintEqualToAnchor:v41];
  [v42 setActive:1];

  v43 = [v26 trailingAnchor];
  v44 = [(PSFontFacePreviewController *)self pane];
  v45 = [v44 safeAreaLayoutGuide];
  v46 = [v45 trailingAnchor];
  v47 = [v43 constraintEqualToAnchor:v46];
  [v47 setActive:1];

  [(PSFontFacePreviewController *)self addChildViewController:self->_pageViewController];
  v48 = [(UIPageViewController *)self->_pageViewController view];
  [v26 bounds];
  objc_msgSend(v48, "setFrame:");
  [v26 addSubview:v48];
}

- (id)fontPreferredLanguage
{
  fontPreferredLanguage = self->_fontPreferredLanguage;
  if (!fontPreferredLanguage)
  {
    v4 = [(PSFontFacePreviewController *)self font];
    CFArrayRef v5 = CTFontCopySupportedLanguages(v4);

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 preferredLocalizations];
    if ([(__CFArray *)v5 count])
    {
      v8 = +[NSBundle preferredLocalizationsFromArray:v5 forPreferences:v7];
      v9 = [v6 localizations];
      v10 = +[NSBundle preferredLocalizationsFromArray:v9 forPreferences:v8];
      v11 = [v10 firstObject];
      v12 = self->_fontPreferredLanguage;
      self->_fontPreferredLanguage = v11;
    }
    if (!self->_fontPreferredLanguage)
    {
      v13 = [v7 firstObject];
      v14 = self->_fontPreferredLanguage;
      self->_fontPreferredLanguage = v13;
    }
    fontPreferredLanguage = self->_fontPreferredLanguage;
  }

  return fontPreferredLanguage;
}

- (id)fontLocalizedStringForKey:(id)a3
{
  id v4 = a3;
  fontLocalizedStrings = self->_fontLocalizedStrings;
  if (!fontLocalizedStrings)
  {
    v6 = [(PSFontFacePreviewController *)self fontPreferredLanguage];
    if (v6)
    {
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = [v7 URLForResource:@"FontSettings" withExtension:@".strings" subdirectory:0 localization:v6];

      v9 = +[NSDictionary dictionaryWithContentsOfURL:v8];
      v10 = self->_fontLocalizedStrings;
      self->_fontLocalizedStrings = v9;
    }
    fontLocalizedStrings = self->_fontLocalizedStrings;
  }
  v11 = [(NSDictionary *)fontLocalizedStrings objectForKey:v4];

  return v11;
}

- (id)sampleViewForPage:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = [(PSFontFacePreviewController *)self makeRepertoireView];
  }
  else if (a3 == 1)
  {
    v3 = [(PSFontFacePreviewController *)self makeLoremIpsumSampleView];
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(PSFontFacePreviewController *)self makeAlphabetSampleView];
  }

  return v3;
}

- (id)makeAlphabetSampleView
{
  v3 = [(PSFontFacePreviewController *)self font];
  id v4 = (__CFString *)CTFontCopySampleString();

  if (!v4)
  {
    id v4 = [(PSFontFacePreviewController *)self fontLocalizedStringForKey:@"ALPHABET"];
    if (!v4)
    {
      CFArrayRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v6 = [v5 localizedStringForKey:@"ALPHABET" value:&stru_1CDF0 table:@"FontSettings"];

      if (v6) {
        id v4 = (__CFString *)v6;
      }
      else {
        id v4 = @"ABCDEFGHIJKLM\nNOPQRSTUVWXYZ\n\nabcdefghijklm\nnopqrstuvwxyz\n\n1234567890";
      }
    }
  }
  NSAttributedStringKey v17 = NSFontAttributeName;
  v7 = [(PSFontFacePreviewController *)self font];
  v8 = [v7 fontWithSize:32.0];
  v18 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  -[__CFString boundingRectWithSize:options:attributes:context:](v4, "boundingRectWithSize:options:attributes:context:", 9, v9, 0, CGRectInfinite.size.width, CGRectInfinite.size.height);
  double v11 = v10;

  v12 = [(PSFontFacePreviewController *)self pane];
  [v12 size];
  double v14 = v13 + -10.0;

  v15 = [(PSFontFacePreviewController *)self makeSampleViewWithText:v4 ofSize:floor(v14 / (v11 + 32.0) * 32.0)];

  return v15;
}

- (id)makeLoremIpsumSampleView
{
  v3 = [(PSFontFacePreviewController *)self fontLocalizedStringForKey:@"LOREM_IPSUM"];
  if (!v3)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"LOREM_IPSUM" value:&stru_1CDF0 table:@"FontSettings"];

    if (v5) {
      v3 = (__CFString *)v5;
    }
    else {
      v3 = @"Lorem ipsum dolor sit amet, consectetur adipisici elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    }
  }
  uint64_t v6 = [(PSFontFacePreviewController *)self makeSampleViewWithText:v3 ofSize:24.0];

  return v6;
}

- (id)makeSampleViewWithText:(id)a3 ofSize:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)UITextView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v11 = objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v11 setTextAlignment:1];
  [v11 setEditable:0];
  [v11 setSelectable:0];
  [v11 setScrollEnabled:0];
  v12 = [(PSFontFacePreviewController *)self font];
  double v13 = [v12 fontWithSize:a4];
  [v11 setFont:v13];

  [v11 setText:v6];
  [v11 textContainerInset];
  objc_msgSend(v11, "setTextContainerInset:");
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v14) = 1148829696;
  [v11 setContentCompressionResistancePriority:1 forAxis:v14];
  id v15 = objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 addSubview:v11];
  v16 = [v15 widthAnchor];
  NSAttributedStringKey v17 = [v11 widthAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [v15 contentLayoutGuide];
  v20 = [v19 leadingAnchor];
  v21 = [v11 leadingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [v15 contentLayoutGuide];
  v24 = [v23 trailingAnchor];
  v25 = [v11 trailingAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [v15 contentLayoutGuide];
  v28 = [v27 topAnchor];
  v29 = [v11 topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [v15 contentLayoutGuide];
  v32 = [v31 bottomAnchor];
  v33 = [v11 bottomAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = [v15 heightAnchor];
  v36 = [v11 heightAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];

  LODWORD(v38) = 1132068864;
  [v37 setPriority:v38];
  [v37 setActive:1];
  id v39 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  LODWORD(v40) = 1148846080;
  [v39 setContentCompressionResistancePriority:1 forAxis:v40];
  [v39 addSubview:v15];
  v41 = [v39 widthAnchor];
  v42 = [v15 widthAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [v39 centerYAnchor];
  v45 = [v15 centerYAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [v39 heightAnchor];
  v48 = [v15 heightAnchor];
  objc_super v49 = [v47 constraintGreaterThanOrEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [v39 leadingAnchor];
  uint64_t v51 = [v15 leadingAnchor];
  uint64_t v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  return v39;
}

- (id)makeRepertoireView
{
  v3 = [RepertoireView alloc];
  id v4 = [(PSFontFacePreviewController *)self font];
  uint64_t v5 = [v4 fontWithSize:24.0];
  id v6 = -[RepertoireView initWithFrame:font:](v3, "initWithFrame:font:", v5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  return v6;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  uint64_t v5 = (char *)objc_msgSend(a4, "page", a3) + 1;
  if (v5 >= (char *)[(NSArray *)self->_sampleViewControllers count])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_sampleViewControllers objectAtIndexedSubscript:v5];
  }

  return v6;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  uint64_t v5 = (char *)objc_msgSend(a4, "page", a3);
  if ((uint64_t)v5 < 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_sampleViewControllers objectAtIndexedSubscript:v5 - 1];
  }

  return v6;
}

- (int64_t)presentationCountForPageViewController:(id)a3
{
  return [(NSArray *)self->_sampleViewControllers count];
}

- (int64_t)presentationIndexForPageViewController:(id)a3
{
  sampleViewControllers = self->_sampleViewControllers;
  id v4 = [(UIPageViewController *)self->_pageViewController viewControllers];
  uint64_t v5 = [v4 lastObject];
  NSUInteger v6 = [(NSArray *)sampleViewControllers indexOfObject:v5];

  return v6;
}

- (UIPageViewController)pageViewController
{
  return self->_pageViewController;
}

- (void)setPageViewController:(id)a3
{
}

- (NSArray)sampleViewControllers
{
  return self->_sampleViewControllers;
}

- (void)setSampleViewControllers:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_sampleViewControllers, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_fontLocalizedStrings, 0);

  objc_storeStrong((id *)&self->_fontPreferredLanguage, 0);
}

@end