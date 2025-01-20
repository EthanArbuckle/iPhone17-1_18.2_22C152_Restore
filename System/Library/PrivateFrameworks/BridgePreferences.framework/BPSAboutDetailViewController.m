@interface BPSAboutDetailViewController
- (BOOL)contentViewIsInAdjustedScrollView;
- (BPSAboutDetailViewController)init;
- (NSArray)bullets;
- (NSArray)paragraphs;
- (NSString)footerString;
- (NSString)headerString;
- (NSString)titleString;
- (UIImage)headerGlyph;
- (id)onDismiss;
- (void)donePressed;
- (void)presentWithController:(id)a3;
- (void)presentWithController:(id)a3 onDismiss:(id)a4;
- (void)setBullets:(id)a3;
- (void)setFooterString:(id)a3;
- (void)setHeaderGlyph:(id)a3;
- (void)setHeaderString:(id)a3;
- (void)setOnDismiss:(id)a3;
- (void)setParagraphs:(id)a3;
- (void)setTitleString:(id)a3;
- (void)viewDidLoad;
@end

@implementation BPSAboutDetailViewController

- (BPSAboutDetailViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BPSAboutDetailViewController;
  v2 = [(OBTextWelcomeController *)&v6 initWithTitle:&stru_26CCB36C8];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:v2 action:sel_donePressed];
    v4 = [(OBBaseWelcomeController *)v2 navigationItem];
    [v4 setLeftBarButtonItem:v3];
  }
  return v2;
}

- (BOOL)contentViewIsInAdjustedScrollView
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)BPSAboutDetailViewController;
  [(OBBaseWelcomeController *)&v35 viewDidLoad];
  v3 = [(BPSAboutDetailViewController *)self headerView];
  v4 = [(BPSAboutDetailViewController *)self titleString];
  [v3 setTitle:v4];

  v5 = [(BPSAboutDetailViewController *)self headerGlyph];

  if (v5)
  {
    objc_super v6 = [(BPSAboutDetailViewController *)self headerView];
    v7 = [(BPSAboutDetailViewController *)self headerGlyph];
    [v6 setIcon:v7 accessibilityLabel:0];
  }
  v8 = [(BPSAboutDetailViewController *)self headerString];

  if (v8)
  {
    v9 = [(BPSAboutDetailViewController *)self headerString];
    [(OBTextWelcomeController *)self addSectionWithHeader:0 content:v9];
  }
  v10 = [(BPSAboutDetailViewController *)self bullets];

  if (v10)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v11 = [(BPSAboutDetailViewController *)self bullets];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          [(OBTextWelcomeController *)self addBulletedListItemWithTitle:*(void *)(*((void *)&v31 + 1) + 8 * i) description:0];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v13);
    }
  }
  v16 = [(BPSAboutDetailViewController *)self paragraphs];

  if (v16)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = [(BPSAboutDetailViewController *)self paragraphs];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          v23 = [v22 objectForKeyedSubscript:@"heading"];
          v24 = [v22 objectForKeyedSubscript:@"text"];
          if (v24) {
            [(OBTextWelcomeController *)self addSectionWithHeader:v23 content:v24];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v19);
    }
  }
  v25 = [(BPSAboutDetailViewController *)self footerString];

  if (v25)
  {
    v26 = [(BPSAboutDetailViewController *)self footerString];
    [(OBTextWelcomeController *)self addSectionWithHeader:0 content:v26];
  }
}

- (void)donePressed
{
  v3 = [(BPSAboutDetailViewController *)self parentViewController];
  [v3 dismissViewControllerAnimated:1 completion:self->_onDismiss];

  id onDismiss = self->_onDismiss;
  self->_id onDismiss = 0;
}

- (void)presentWithController:(id)a3
{
}

- (void)presentWithController:(id)a3 onDismiss:(id)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x21D4A9390](a4);
  id onDismiss = self->_onDismiss;
  self->_id onDismiss = v7;

  id v14 = (id)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:self];
  [v6 presentViewController:v14 animated:1 completion:0];

  v9 = [v14 view];
  v10 = [MEMORY[0x263F1C550] clearColor];
  [v9 setBackgroundColor:v10];

  v11 = [v14 navigationBar];
  [v11 setBarStyle:1];
  [v11 setTranslucent:1];
  uint64_t v12 = BPSNavBarBackgroundPointImage();
  [v11 setBackgroundImage:v12 forBarMetrics:0];

  uint64_t v13 = BPSSetupTintColor();
  [v11 setTintColor:v13];
}

- (NSString)headerString
{
  return self->_headerString;
}

- (void)setHeaderString:(id)a3
{
}

- (NSString)footerString
{
  return self->_footerString;
}

- (void)setFooterString:(id)a3
{
}

- (NSArray)bullets
{
  return self->_bullets;
}

- (void)setBullets:(id)a3
{
}

- (NSArray)paragraphs
{
  return self->_paragraphs;
}

- (void)setParagraphs:(id)a3
{
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (UIImage)headerGlyph
{
  return self->_headerGlyph;
}

- (void)setHeaderGlyph:(id)a3
{
}

- (id)onDismiss
{
  return self->_onDismiss;
}

- (void)setOnDismiss:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDismiss, 0);
  objc_storeStrong((id *)&self->_headerGlyph, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_paragraphs, 0);
  objc_storeStrong((id *)&self->_bullets, 0);
  objc_storeStrong((id *)&self->_footerString, 0);
  objc_storeStrong((id *)&self->_headerString, 0);
}

@end