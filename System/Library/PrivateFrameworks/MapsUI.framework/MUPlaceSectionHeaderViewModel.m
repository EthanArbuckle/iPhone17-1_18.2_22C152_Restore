@interface MUPlaceSectionHeaderViewModel
+ (id)viewModelForTitle:(id)a3 attribution:(id)a4 target:(id)a5 action:(SEL)a6;
- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3;
- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3 showSeeMore:(BOOL)a4;
- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3 subtitleString:(id)a4 showSeeMore:(BOOL)a5;
- (NSString)seeMoreButtonText;
- (NSString)subtitleString;
- (NSString)titleString;
- (SEL)selector;
- (UIMenu)seeMoreButtonMenu;
- (id)target;
- (void)setSeeMoreButtonMenu:(id)a3;
- (void)setSeeMoreButtonText:(id)a3;
- (void)setTarget:(id)a3 selector:(SEL)a4;
@end

@implementation MUPlaceSectionHeaderViewModel

- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3
{
  return [(MUPlaceSectionHeaderViewModel *)self initWithTitleString:a3 showSeeMore:1];
}

- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3 showSeeMore:(BOOL)a4
{
  return [(MUPlaceSectionHeaderViewModel *)self initWithTitleString:a3 subtitleString:&stru_1EE3BF360 showSeeMore:a4];
}

- (MUPlaceSectionHeaderViewModel)initWithTitleString:(id)a3 subtitleString:(id)a4 showSeeMore:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MUPlaceSectionHeaderViewModel;
  v11 = [(MUPlaceSectionHeaderViewModel *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_titleString, a3);
    objc_storeStrong((id *)&v12->_subtitleString, a4);
    if (v5)
    {
      uint64_t v13 = _MULocalizedStringFromThisBundle(@"More [Placecard Section Header]");
      seeMoreButtonText = v12->_seeMoreButtonText;
      v12->_seeMoreButtonText = (NSString *)v13;
    }
  }

  return v12;
}

- (void)setTarget:(id)a3 selector:(SEL)a4
{
  self->_selector = a4;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (NSString)seeMoreButtonText
{
  return self->_seeMoreButtonText;
}

- (void)setSeeMoreButtonText:(id)a3
{
}

- (UIMenu)seeMoreButtonMenu
{
  return self->_seeMoreButtonMenu;
}

- (void)setSeeMoreButtonMenu:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_seeMoreButtonMenu, 0);
  objc_storeStrong((id *)&self->_seeMoreButtonText, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

+ (id)viewModelForTitle:(id)a3 attribution:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 attributionURLs];
  if ([v12 count])
  {
    uint64_t v13 = [v10 providerName];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      v15 = [[MUPlaceSectionHeaderViewModel alloc] initWithTitleString:v9];
      objc_super v16 = NSString;
      v17 = _MULocalizedStringFromThisBundle(@"Open <provider> [Placecard]");
      v18 = [v10 providerName];
      v19 = objc_msgSend(v16, "stringWithFormat:", v17, v18);
      [(MUPlaceSectionHeaderViewModel *)v15 setSeeMoreButtonText:v19];

      [(MUPlaceSectionHeaderViewModel *)v15 setTarget:v11 selector:a6];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v15 = [[MUPlaceSectionHeaderViewModel alloc] initWithTitleString:v9 showSeeMore:0];
LABEL_6:

  return v15;
}

@end