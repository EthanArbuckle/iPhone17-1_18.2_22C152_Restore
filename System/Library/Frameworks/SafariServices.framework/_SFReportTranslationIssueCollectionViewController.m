@interface _SFReportTranslationIssueCollectionViewController
- (_SFReportTranslationIssueCollectionViewController)initWithBrowserContentController:(id)a3;
- (id)_footerText;
- (id)_headerText;
- (id)_issueStringForRowAtIndexPath:(id)a3;
- (int64_t)_numberOfIssueCategories;
- (void)_reportFeedbackForSelectedRowIndex:(int64_t)a3;
@end

@implementation _SFReportTranslationIssueCollectionViewController

- (_SFReportTranslationIssueCollectionViewController)initWithBrowserContentController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFReportTranslationIssueCollectionViewController;
  v5 = [(_SFReportFeedbackCollectionViewController *)&v9 initWithBrowserContentController:v4];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserContentController, v4);
    v7 = v6;
  }

  return v6;
}

- (id)_issueStringForRowAtIndexPath:(id)a3
{
  switch([a3 row])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      v3 = _WBSLocalizedString();
      break;
    default:
      v3 = 0;
      break;
  }

  return v3;
}

- (int64_t)_numberOfIssueCategories
{
  return 7;
}

- (void)_reportFeedbackForSelectedRowIndex:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  v5 = [WeakRetained activeDocument];
  id v6 = [v5 translationContext];

  [v6 requestSendFeedbackForTranslationIssue:a3];
}

- (id)_headerText
{
  return (id)_WBSLocalizedString();
}

- (id)_footerText
{
  return (id)_WBSLocalizedString();
}

- (void).cxx_destruct
{
}

@end