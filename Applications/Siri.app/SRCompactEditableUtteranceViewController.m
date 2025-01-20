@interface SRCompactEditableUtteranceViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_didUpdateShowTipCount;
- (BOOL)_shouldShowAlternativesTableView;
- (BOOL)_shouldShowTip;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5;
- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5 preferences:(id)a6;
- (SRCompactEditableUtteranceViewControllerDelegate)_delegate;
- (UITableView)_alternativesTableView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_attributedStringForTip;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didShowTip;
- (void)_setAlternativesTableView:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setDidUpdateShowTipCount:(BOOL)a3;
- (void)_setShouldShowTip:(BOOL)a3;
- (void)_setupAlternativesTableView;
- (void)didResignFirstResponderFromUtteranceView:(id)a3;
- (void)editableUtteranceView:(id)a3 didFinishEditingWithText:(id)a4;
- (void)editableUtteranceView:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBeginEditingFromUtteranceView:(id)a3;
@end

@implementation SRCompactEditableUtteranceViewController

- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(SRPreferences);
  v12 = [(SRCompactEditableUtteranceViewController *)self initWithUserUtterance:v10 delegate:v9 dataSource:v8 preferences:v11];

  return v12;
}

- (SRCompactEditableUtteranceViewController)initWithUserUtterance:(id)a3 delegate:(id)a4 dataSource:(id)a5 preferences:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SRCompactEditableUtteranceViewController;
  v15 = [(SRCompactEditableUtteranceViewController *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_userUtterance, a3);
    objc_storeStrong((id *)&v16->_dataSource, a5);
    [(SRCompactEditableUtteranceViewController *)v16 _setDelegate:v12];
    [(SRCompactEditableUtteranceViewController *)v16 _setupAlternativesTableView];
    objc_storeStrong((id *)&v16->_userPreferences, a6);
    if ([(SRPreferences *)v16->_userPreferences showTapToEditTipCount] <= 1) {
      v16->_shouldShowTip = 1;
    }
  }

  return v16;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SRCompactEditableUtteranceViewController;
  [(SRCompactEditableUtteranceViewController *)&v4 viewWillAppear:a3];
  [(SRCompactEditableUtteranceView *)self->_editableUtteranceView beginEditing];
}

- (void)loadView
{
  v3 = [SRCompactEditableUtteranceView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[SRCompactEditableUtteranceView initWithFrame:userUtterance:delegate:](v3, "initWithFrame:userUtterance:delegate:", self->_userUtterance, self, CGRectZero.origin.x, y, width, height);
  editableUtteranceView = self->_editableUtteranceView;
  self->_editableUtteranceView = v7;

  [(SRCompactEditableUtteranceView *)self->_editableUtteranceView recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
  id v9 = self->_editableUtteranceView;
  id v10 = +[UIColor systemBackgroundColor];
  [(SRCompactEditableUtteranceView *)v9 setBackgroundColor:v10];

  [(SRCompactEditableUtteranceViewController *)self setView:self->_editableUtteranceView];
  id v11 = -[SRCompactLinkTappableTextView initWithFrame:]([SRCompactLinkTappableTextView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  textViewForFooterText = self->_textViewForFooterText;
  self->_textViewForFooterText = &v11->super;

  id v13 = self->_textViewForFooterText;
  id v14 = [(SRCompactEditableUtteranceViewController *)self _attributedStringForTip];
  [(UITextView *)v13 setAttributedText:v14];

  v15 = self->_textViewForFooterText;
  +[UIFont smallSystemFontSize];
  v16 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  [(UITextView *)v15 setFont:v16];

  [(UITextView *)self->_textViewForFooterText setEditable:0];
  [(UITextView *)self->_textViewForFooterText setScrollEnabled:0];
  -[UITextView setTextContainerInset:](self->_textViewForFooterText, "setTextContainerInset:", 7.5, 15.0, 7.5, 15.0);
  [(UITextView *)self->_textViewForFooterText setDelegate:self];
  if ([(SRCompactEditableUtteranceViewController *)self _shouldShowAlternativesTableView])
  {
    v17 = self->_editableUtteranceView;
    id v18 = [(SRCompactEditableUtteranceViewController *)self _alternativesTableView];
    [(SRCompactEditableUtteranceView *)v17 setAuxiliaryView:v18];
  }
  else if ([(SRCompactEditableUtteranceViewController *)self _shouldShowTip])
  {
    [(SRCompactEditableUtteranceView *)self->_editableUtteranceView setAuxiliaryView:self->_textViewForFooterText];
    [(SRCompactEditableUtteranceViewController *)self _didShowTip];
  }
}

- (void)editableUtteranceView:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactEditableUtteranceViewController *)self _delegate];
  [v6 editableUtteranceViewController:self requestsKeyboardWithCompletion:v5];
}

- (void)willBeginEditingFromUtteranceView:(id)a3
{
  id v4 = [(SRCompactEditableUtteranceViewController *)self _delegate];
  [v4 willBeginEditingFromUtteranceViewController:self];
}

- (void)didResignFirstResponderFromUtteranceView:(id)a3
{
  id v4 = [(SRCompactEditableUtteranceViewController *)self _delegate];
  [v4 didResignFirstResponderFromUtteranceViewController:self];
}

- (void)editableUtteranceView:(id)a3 didFinishEditingWithText:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactEditableUtteranceViewController *)self _delegate];
  [v6 editableUtteranceViewController:self didFinishEditingWithText:v5];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = (int64_t)[(SRCompactEditableUtteranceViewControllerDataSource *)self->_dataSource numberOfAlternativeUtterances];
  if (result >= 3) {
    return 3;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = off_1001700B0;
  id v7 = a4;
  id v8 = [a3 dequeueReusableCellWithIdentifier:v6];
  id v9 = +[UIColor clearColor];
  [v8 setBackgroundColor:v9];

  dataSource = self->_dataSource;
  id v11 = [v7 row];

  id v12 = [(SRCompactEditableUtteranceViewControllerDataSource *)dataSource attributedStringAtIndex:v11];
  id v13 = [v8 textLabel];
  [v13 setAttributedText:v12];

  id v14 = [v8 textLabel];
  v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v14 setFont:v15];

  v16 = [v8 textLabel];
  [v16 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];

  v17 = [v8 textLabel];
  [v17 setNumberOfLines:0];

  [v8 setSelectionStyle:0];

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 siriUILocalizedStringForKey:@"TITLE_FOR_SPEECH_ALTERNATIVE_LIST" table:0];
  id v6 = objc_alloc((Class)NSLocale);
  id v7 = AFUIGetLanguageCode();
  id v8 = [v6 initWithLocaleIdentifier:v7];
  id v9 = [v5 uppercaseStringWithLocale:v8];

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v7 textLabel];
    id v6 = +[UIColor labelColor];
    [v5 setTextColor:v6];
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([(SRCompactEditableUtteranceViewController *)self _shouldShowTip])
  {
    [(SRCompactEditableUtteranceViewController *)self _didShowTip];
    id v5 = [objc_alloc((Class)UITableViewHeaderFooterView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(UITextView *)self->_textViewForFooterText setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:self->_textViewForFooterText];
    id v6 = [v5 topAnchor];
    id v7 = [(UITextView *)self->_textViewForFooterText topAnchor];
    id v8 = [v6 constraintEqualToAnchor:v7];
    [v8 setActive:1];

    id v9 = [v5 bottomAnchor];
    id v10 = [(UITextView *)self->_textViewForFooterText bottomAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    id v12 = [v5 leadingAnchor];
    id v13 = [(UITextView *)self->_textViewForFooterText leadingAnchor];
    id v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [v5 trailingAnchor];
    v16 = [(UITextView *)self->_textViewForFooterText trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = a3;
  double v6 = 0.0;
  if ([(SRCompactEditableUtteranceViewController *)self _shouldShowTip])
  {
    [v5 bounds];
    -[UITextView sizeThatFits:](self->_textViewForFooterText, "sizeThatFits:", v7, 1.79769313e308);
    double v6 = v8;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = [(SRCompactEditableUtteranceViewController *)self _delegate];
  id v6 = [v5 row];

  [v7 editableUtteranceViewController:self alternativeSelectedAtIndex:v6];
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  double v8 = [(SRCompactEditableUtteranceViewController *)self _delegate];
  [v8 editableUtteranceViewController:self openURL:v7];

  return 0;
}

- (void)_setupAlternativesTableView
{
  if ([(SRCompactEditableUtteranceViewController *)self _shouldShowAlternativesTableView])
  {
    id v3 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(SRCompactEditableUtteranceViewController *)self _setAlternativesTableView:v3];

    id v4 = [(SRCompactEditableUtteranceViewController *)self _alternativesTableView];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:off_1001700B0];

    id v5 = [(SRCompactEditableUtteranceViewController *)self _alternativesTableView];
    [v5 setScrollEnabled:0];

    id v6 = [(SRCompactEditableUtteranceViewController *)self _alternativesTableView];
    [v6 setDelegate:self];

    id v7 = [(SRCompactEditableUtteranceViewController *)self _alternativesTableView];
    [v7 setDataSource:self];

    double v8 = [(SRCompactEditableUtteranceViewController *)self _alternativesTableView];
    id v9 = +[UIColor clearColor];
    [v8 setBackgroundColor:v9];

    id v10 = [(SRCompactEditableUtteranceViewController *)self _alternativesTableView];
    id v11 = +[UIColor separatorColor];
    [v10 setSeparatorColor:v11];

    id v13 = [(SRCompactEditableUtteranceViewController *)self _alternativesTableView];
    [v13 registerClass:objc_opt_class() forCellReuseIdentifier:off_1001700B0];
  }
  else
  {
    id v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SRCompactEditableUtteranceViewController _setupAlternativesTableView]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #compact: no alternative utterances to display", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldShowAlternativesTableView
{
  return (uint64_t)[(SRCompactEditableUtteranceViewControllerDataSource *)self->_dataSource numberOfAlternativeUtterances] > 0;
}

- (id)_attributedStringForTip
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 siriUILocalizedStringForKey:@"TEXT_FOR_SPEECH_ALTERNATIVE_LIST_TIP" table:0];
  id v4 = [v2 siriUILocalizedStringForKey:@"TEXT_FOR_SPEECH_ALTERNATIVE_LIST_TIP_LINK" table:0];
  id v5 = [v3 rangeOfString:v4 options:4];
  uint64_t v7 = v6;
  id v8 = [objc_alloc((Class)NSAttributedString) initWithString:v3];
  id v9 = [v8 mutableCopy];

  [v9 addAttribute:NSLinkAttributeName value:@"prefs:root=SIRI%23-64&path=VOICE_FEEDBACK_ID%23-64" range:v5, v7];
  id v10 = +[UIColor secondaryLabelColor];
  [v9 addAttribute:NSForegroundColorAttributeName value:v10 range:0, [v9 length]];

  return v9;
}

- (void)_didShowTip
{
  if (![(SRCompactEditableUtteranceViewController *)self _didUpdateShowTipCount])
  {
    [(SRCompactEditableUtteranceViewController *)self _setDidUpdateShowTipCount:1];
    id v3 = (char *)[(SRPreferences *)self->_userPreferences showTapToEditTipCount] + 1;
    userPreferences = self->_userPreferences;
    [(SRPreferences *)userPreferences setShowTapToEditTipCount:v3];
  }
}

- (SRCompactEditableUtteranceViewControllerDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SRCompactEditableUtteranceViewControllerDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (UITableView)_alternativesTableView
{
  return self->_alternativesTableView;
}

- (void)_setAlternativesTableView:(id)a3
{
}

- (BOOL)_shouldShowTip
{
  return self->_shouldShowTip;
}

- (void)_setShouldShowTip:(BOOL)a3
{
  self->_shouldShowTip = a3;
}

- (BOOL)_didUpdateShowTipCount
{
  return self->_didUpdateShowTipCount;
}

- (void)_setDidUpdateShowTipCount:(BOOL)a3
{
  self->_didUpdateShowTipCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativesTableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textViewForFooterText, 0);
  objc_storeStrong((id *)&self->_userPreferences, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_alternativeUtterances, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);

  objc_storeStrong((id *)&self->_editableUtteranceView, 0);
}

@end