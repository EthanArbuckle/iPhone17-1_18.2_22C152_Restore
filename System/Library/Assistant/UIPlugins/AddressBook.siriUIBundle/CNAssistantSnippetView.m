@interface CNAssistantSnippetView
+ (id)descriptorForRequiredKeys;
- (BOOL)_deviceIsLockedWithPassword;
- (BOOL)_dragInteraction:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4;
- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4;
- (BOOL)allowsSelection;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6;
- (CNAssistantSnippetView)initWithFrame:(CGRect)a3 contact:(id)a4 displayedProperties:(id)a5 viewController:(id)a6;
- (CNContact)contact;
- (CNContactContentViewController)contactViewController;
- (SiriUISnippetViewController)viewController;
- (UIView)compactContactView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_displayIdentifier;
- (id)contactView;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (int64_t)snippetSizeClass;
- (void)_preventMoreSelections;
- (void)configureForCompact;
- (void)configureForExpanded;
- (void)contactViewControllerDidDismissDisambiguationUI:(id)a3;
- (void)contactViewControllerWillPresentDisambiguationUI:(id)a3;
- (void)dealloc;
- (void)openContact:(id)a3;
- (void)setAllowsSelection:(BOOL)a3;
- (void)setCompactContactView:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactViewController:(id)a3;
- (void)setSnippetSizeClass:(int64_t)a3;
- (void)setViewController:(id)a3;
@end

@implementation CNAssistantSnippetView

+ (id)descriptorForRequiredKeys
{
  v2 = +[CNContactContentViewController descriptorForRequiredKeys];
  v8[0] = v2;
  v8[1] = CNContactNoteKey;
  v3 = +[NSArray arrayWithObjects:v8 count:2];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CNAssistantSnippetView descriptorForRequiredKeys]");
  v5 = +[CNContact descriptorWithKeyDescriptors:v3 description:v4];
  v9 = v5;
  v6 = +[NSArray arrayWithObjects:&v9 count:1];

  return v6;
}

- (CNAssistantSnippetView)initWithFrame:(CGRect)a3 contact:(id)a4 displayedProperties:(id)a5 viewController:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v45.receiver = self;
  v45.super_class = (Class)CNAssistantSnippetView;
  v16 = -[CNAssistantSnippetView initWithFrame:](&v45, "initWithFrame:", x, y, width, height);
  v17 = v16;
  if (v16)
  {
    id v43 = v15;
    objc_storeWeak((id *)&v16->_viewController, v15);
    +[UIFont ab_setIgnoreUserFontSize:1];
    CNUISetUseSiriLocalization();
    v18 = +[CNContactStyle siriStyle];
    +[CNContactStyle setCurrentStyle:v18];

    v17->_allowsSelection = 1;
    unsigned int v19 = [(CNAssistantSnippetView *)v17 _deviceIsLockedWithPassword];
    v17->_snippetSizeClass = 0;
    compactContactView = v17->_compactContactView;
    v17->_compactContactView = 0;

    [(CNAssistantSnippetView *)v17 setContact:v13];
    v21 = (CNContactContentViewController *)[objc_alloc((Class)CNContactContentViewController) initWithContact:v13];
    contactViewController = v17->_contactViewController;
    v17->_contactViewController = v21;

    [(CNContactContentViewController *)v17->_contactViewController setContactDelegate:v17];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsActions:1];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsCardActions:0];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsEditing:0];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsSharing:0];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsConferencing:0];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsAddToFavorites:0];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsSendMessage:0];
    id v44 = v14;
    [(CNContactContentViewController *)v17->_contactViewController setDisplayedProperties:v14];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsActionsModel:v19 ^ 1];
    [(CNContactContentViewController *)v17->_contactViewController setAllowsDisplayModePickerActions:0];
    v23 = [(CNContactContentViewController *)v17->_contactViewController displayedProperties];
    id v24 = [v23 mutableCopy];

    [v24 removeObject:CNContactTextAlertKey];
    [v24 removeObject:CNContactCallAlertKey];
    v25 = [v13 note];
    if ([v25 length])
    {
    }
    else
    {
      v26 = [(CNContactContentViewController *)v17->_contactViewController displayedProperties];
      unsigned int v27 = [v26 containsObject:CNContactNoteKey];

      if (v27) {
        [v24 removeObject:CNContactNoteKey];
      }
    }
    [(CNContactContentViewController *)v17->_contactViewController setDisplayedProperties:v24];
    v28 = [(CNContactContentViewController *)v17->_contactViewController contactView];
    v29 = [(CNContactContentViewController *)v17->_contactViewController displayHeaderView];
    objc_msgSend(v28, "setLayoutMargins:", SiriUIDefaultEdgePadding, SiriUIDefaultEdgePadding, 0.0, SiriUIDefaultEdgePadding);
    [v28 setScrollEnabled:0];
    v30 = +[CNUIColorRepository siriTintColor];
    [v28 setTintColor:v30];

    NSAttributedStringKey v46 = NSFontAttributeName;
    v31 = [v28 valueTextAttributes];
    v32 = [v31 objectForKeyedSubscript:NSFontAttributeName];
    v47 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    [v28 setValueTextAttributes:v33];

    [v28 setShouldUseMapTiles:0];
    [v28 setLayoutMarginsFollowReadableWidth:0];
    [v29 disablePhotoTapGesture];
    [v29 setVisibleToScrollViews:1];
    if (v19)
    {
      v34 = [v29 photoView];
      v35 = [v34 avatarView];
      [v35 setThreeDTouchEnabled:0];
    }
    id v36 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v17 action:"openContact:"];
    [v29 addGestureRecognizer:v36];
    v37 = +[AFPreferences sharedPreferences];
    unsigned int v38 = [v37 enableDragAndDrop];

    if (v38)
    {
      id v39 = [objc_alloc((Class)UIDragInteraction) initWithDelegate:v17];
      v40 = [(CNContactContentViewController *)v17->_contactViewController view];
      [v40 addInteraction:v39];
    }
    [(CNAssistantSnippetView *)v17 configureForExpanded];
    v41 = +[UIColor clearColor];
    [(CNAssistantSnippetView *)v17 setBackgroundColor:v41];

    id v15 = v43;
    id v14 = v44;
  }

  return v17;
}

- (void)setSnippetSizeClass:(int64_t)a3
{
  if (self->_snippetSizeClass != a3)
  {
    self->_snippetSizeClass = a3;
    if (a3 == 1
      && ([(CNContactContentViewController *)self->_contactViewController displayedProperties],
          v4 = objc_claimAutoreleasedReturnValue(),
          id v5 = [v4 count],
          v4,
          (unint64_t)v5 >= 2))
    {
      [(CNAssistantSnippetView *)self configureForCompact];
    }
    else
    {
      [(CNAssistantSnippetView *)self configureForExpanded];
    }
  }
}

- (void)configureForCompact
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [(CNAssistantSnippetView *)self subviews];
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)v7) removeFromSuperview];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }

  id v8 = objc_alloc_init((Class)SFActionItem);
  v9 = [(CNContact *)self->_contact identifier];
  [v8 setContactIdentifier:v9];

  id v10 = objc_alloc_init((Class)SFContactImage);
  v11 = [(CNContact *)self->_contact identifier];
  unsigned int v27 = v11;
  v12 = +[NSArray arrayWithObjects:&v27 count:1];
  [v10 setContactIdentifiers:v12];

  id v13 = objc_alloc_init((Class)SFDetailedRowCardSection);
  id v14 = +[CNContactFormatter stringFromContact:self->_contact style:0];
  id v15 = +[SFRichText textWithString:v14];
  [v13 setTitle:v15];

  [v13 setAction:v8];
  [v13 setThumbnail:v10];
  id v26 = v13;
  v16 = +[NSArray arrayWithObjects:&v26 count:1];
  v17 = +[SearchUI viewsForCardSections:v16 feedbackListener:self];
  v18 = [v17 firstObject];
  compactContactView = self->_compactContactView;
  self->_compactContactView = v18;

  if (self->_compactContactView)
  {
    id v20 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"openContact:"];
    [(UIView *)self->_compactContactView addGestureRecognizer:v20];
    v21 = self->_compactContactView;
    [(CNAssistantSnippetView *)self bounds];
    -[UIView setFrame:](v21, "setFrame:");
    [(UIView *)self->_compactContactView setAutoresizingMask:18];
    [(CNAssistantSnippetView *)self addSubview:self->_compactContactView];
  }
}

- (void)configureForExpanded
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(CNAssistantSnippetView *)self subviews];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) removeFromSuperview];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [(CNContactContentViewController *)self->_contactViewController view];
  [(CNAssistantSnippetView *)self bounds];
  objc_msgSend(v8, "setFrame:");
  [v8 setAutoresizingMask:18];
  [(CNAssistantSnippetView *)self addSubview:v8];
}

- (void)dealloc
{
  [(CNContactContentViewController *)self->_contactViewController setContactDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CNAssistantSnippetView;
  [(CNAssistantSnippetView *)&v3 dealloc];
}

- (double)desiredHeightForWidth:(double)a3
{
  if (self->_compactContactView)
  {
    -[UIView sizeThatFits:](self->_compactContactView, "sizeThatFits:", a3, 1.79769313e308);
    return v3;
  }
  else
  {
    contactViewController = self->_contactViewController;
    [(CNContactContentViewController *)contactViewController desiredHeightForWidth:a3];
  }
  return result;
}

- (void)openContact:(id)a3
{
  if (self->_allowsSelection)
  {
    id v4 = [(CNAssistantSnippetView *)self _displayIdentifier];
    id v5 = [(CNContactContentViewController *)self->_contactViewController contact];
    +[NSURL URLWithDisplayIdentifier:forSearchResultDomain:andIdentifier:](NSURL, "URLWithDisplayIdentifier:forSearchResultDomain:andIdentifier:", v4, 2, (int)[v5 iOSLegacyIdentifier]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    v7 = [WeakRetained delegate];
    id v8 = objc_loadWeakRetained((id *)&self->_viewController);
    [v7 siriViewController:v8 openURL:v9 completion:&stru_C3A8];

    [(CNAssistantSnippetView *)self _preventMoreSelections];
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v4 = [(CNContactContentViewController *)self->_contactViewController contact];
  id v5 = +[CNUIDraggingContacts dragItemForContact:v4 withContactStore:0];
  id v8 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return v6;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v5 = [(CNContactContentViewController *)self->_contactViewController contact];
  uint64_t v6 = +[CNUIDraggingContacts dragItemForContact:v5 withContactStore:0];
  id v9 = v6;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_dragInteraction:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4
{
  id v4 = objc_msgSend(a4, "view", a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v7 = a5;
  unsigned int v8 = [v7 isEqualToString:CNContactSocialProfilesKey];
  if (([v7 isEqualToString:CNContactRelationsKey] & 1) != 0
    || [v7 isEqualToString:CNContactInstantMessageAddressesKey])
  {
    int v9 = 0;
  }
  else
  {
    int v9 = v8 ^ 1;
  }
  unsigned int v10 = v9 & ~[v7 isEqualToString:CNContactNoteKey];
  if (v10 == 1) {
    [(CNAssistantSnippetView *)self _preventMoreSelections];
  }

  return v10;
}

- (void)contactViewControllerWillPresentDisambiguationUI:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    p_viewController = &self->_viewController;
    id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
    id v7 = [WeakRetained delegate];
    id v8 = objc_loadWeakRetained((id *)p_viewController);
    [v7 siriSnippetViewController:v8 setStatusViewHidden:1];
  }
}

- (void)contactViewControllerDidDismissDisambiguationUI:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    p_viewController = &self->_viewController;
    id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
    id v7 = [WeakRetained delegate];
    id v8 = objc_loadWeakRetained((id *)p_viewController);
    [v7 siriSnippetViewController:v8 setStatusViewHidden:0];
  }
}

- (id)contactView
{
  return [(CNContactContentViewController *)self->_contactViewController contactView];
}

- (void)_preventMoreSelections
{
  double v3 = [(CNAssistantSnippetView *)self contactView];
  [v3 setAllowsSelection:0];

  self->_allowsSelection = 0;
}

- (id)_displayIdentifier
{
  if (MGGetSInt32Answer() == 1) {
    return @"com.apple.mobilephone";
  }
  else {
    return @"com.apple.MobileAddressBook";
  }
}

- (BOOL)_deviceIsLockedWithPassword
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  CFBooleanRef v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 == kCFBooleanTrue;
}

- (int64_t)snippetSizeClass
{
  return self->_snippetSizeClass;
}

- (CNContactContentViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setContactViewController:(id)a3
{
}

- (SiriUISnippetViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (SiriUISnippetViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (void)setAllowsSelection:(BOOL)a3
{
  self->_allowsSelection = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (UIView)compactContactView
{
  return self->_compactContactView;
}

- (void)setCompactContactView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactContactView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_viewController);

  objc_storeStrong((id *)&self->_contactViewController, 0);
}

@end