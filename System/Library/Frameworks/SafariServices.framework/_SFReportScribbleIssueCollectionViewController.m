@interface _SFReportScribbleIssueCollectionViewController
- (_SFReportScribbleIssueCollectionViewController)initWithBrowserContentController:(id)a3;
- (id)_footerText;
- (id)_headerText;
- (id)_issueStringForRowAtIndexPath:(id)a3;
- (int64_t)_numberOfIssueCategories;
- (void)_reportFeedbackForSelectedRowIndex:(int64_t)a3;
@end

@implementation _SFReportScribbleIssueCollectionViewController

- (_SFReportScribbleIssueCollectionViewController)initWithBrowserContentController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFReportScribbleIssueCollectionViewController;
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
  id v3 = a3;
  if ([v3 row] && objc_msgSend(v3, "row") != 1) {
    [v3 row];
  }
  id v4 = _WBSLocalizedString();

  return v4;
}

- (int64_t)_numberOfIssueCategories
{
  return 4;
}

- (void)_reportFeedbackForSelectedRowIndex:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained reportScribbleFeedbackForSelectedRowIndex:a3];
  }
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