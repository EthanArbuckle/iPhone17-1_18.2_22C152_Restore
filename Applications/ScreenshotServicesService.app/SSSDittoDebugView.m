@interface SSSDittoDebugView
- (BOOL)shouldIncludePDF;
- (SSSDittoDebugView)initWithFrame:(CGRect)a3;
- (SSSDittoDebugViewDelegate)delegate;
- (id)blockToRunForAddScreenshotsButton;
- (id)generatePDF:(CGRect *)a3;
- (int64_t)numberOfScreenshotsToAdd;
- (void)_addScreenshotPushed;
- (void)_uiCatalogButtonPushed;
- (void)_updateScreenshotCount;
- (void)advanceScrollOffset;
- (void)layoutSubviews;
- (void)resetScrollOffset;
- (void)setBlockToRunForAddScreenshotsButton:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SSSDittoDebugView

- (SSSDittoDebugView)initWithFrame:(CGRect)a3
{
  v44.receiver = self;
  v44.super_class = (Class)SSSDittoDebugView;
  v3 = -[SSSDittoDebugView initWithFrame:](&v44, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = +[UIColor grayColor];
  [(SSSDittoDebugView *)v3 setBackgroundColor:v4];

  uint64_t v5 = +[UIButton buttonWithType:1];
  addScreenshotsButton = v3->_addScreenshotsButton;
  v3->_addScreenshotsButton = (UIButton *)v5;

  [(UIButton *)v3->_addScreenshotsButton addTarget:v3 action:"_addScreenshotPushed" forControlEvents:64];
  v7 = v3->_addScreenshotsButton;
  v8 = +[UIColor orangeColor];
  [(UIButton *)v7 setTintColor:v8];

  [(SSSDittoDebugView *)v3 addSubview:v3->_addScreenshotsButton];
  v9 = (UIStepper *)objc_alloc_init((Class)UIStepper);
  numberOfScreenshotsToAddStepper = v3->_numberOfScreenshotsToAddStepper;
  v3->_numberOfScreenshotsToAddStepper = v9;

  [(UIStepper *)v3->_numberOfScreenshotsToAddStepper setMinimumValue:1.0];
  [(UIStepper *)v3->_numberOfScreenshotsToAddStepper setMaximumValue:10.0];
  [(UIStepper *)v3->_numberOfScreenshotsToAddStepper setValue:1.0];
  v11 = v3->_numberOfScreenshotsToAddStepper;
  v12 = +[UIColor orangeColor];
  [(UIStepper *)v11 setTintColor:v12];

  [(UIStepper *)v3->_numberOfScreenshotsToAddStepper addTarget:v3 action:"_updateScreenshotCount" forControlEvents:4096];
  [(SSSDittoDebugView *)v3 addSubview:v3->_numberOfScreenshotsToAddStepper];
  [(SSSDittoDebugView *)v3 _updateScreenshotCount];
  v13 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  snapshotPDFSwitch = v3->_snapshotPDFSwitch;
  v3->_snapshotPDFSwitch = v13;

  v15 = v3->_snapshotPDFSwitch;
  v16 = +[UIColor orangeColor];
  [(UISwitch *)v15 setTintColor:v16];

  [(SSSDittoDebugView *)v3 addSubview:v3->_snapshotPDFSwitch];
  v17 = (UILabel *)objc_alloc_init((Class)UILabel);
  snapshotPDFLabel = v3->_snapshotPDFLabel;
  v3->_snapshotPDFLabel = v17;

  [(UILabel *)v3->_snapshotPDFLabel setText:@"Include PDF"];
  v19 = v3->_snapshotPDFLabel;
  v20 = +[UIFont systemFontOfSize:15.0];
  [(UILabel *)v19 setFont:v20];

  v21 = v3->_snapshotPDFLabel;
  v22 = +[UIColor orangeColor];
  [(UILabel *)v21 setTextColor:v22];

  [(UILabel *)v3->_snapshotPDFLabel sizeToFit];
  [(SSSDittoDebugView *)v3 addSubview:v3->_snapshotPDFLabel];
  v23 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  multipagePDFSwitch = v3->_multipagePDFSwitch;
  v3->_multipagePDFSwitch = v23;

  v25 = v3->_multipagePDFSwitch;
  v26 = +[UIColor orangeColor];
  [(UISwitch *)v25 setTintColor:v26];

  [(SSSDittoDebugView *)v3 addSubview:v3->_multipagePDFSwitch];
  v27 = (UILabel *)objc_alloc_init((Class)UILabel);
  multipagePDFLabel = v3->_multipagePDFLabel;
  v3->_multipagePDFLabel = v27;

  [(UILabel *)v3->_multipagePDFLabel setText:@"Multipage"];
  v29 = v3->_multipagePDFLabel;
  v30 = +[UIFont systemFontOfSize:15.0];
  [(UILabel *)v29 setFont:v30];

  v31 = v3->_multipagePDFLabel;
  v32 = +[UIColor orangeColor];
  [(UILabel *)v31 setTextColor:v32];

  [(UILabel *)v3->_multipagePDFLabel sizeToFit];
  [(SSSDittoDebugView *)v3 addSubview:v3->_multipagePDFLabel];
  uint64_t v33 = +[UIButton buttonWithType:3];
  uiCatalogButton = v3->_uiCatalogButton;
  v3->_uiCatalogButton = (UIButton *)v33;

  [(UIButton *)v3->_uiCatalogButton addTarget:v3 action:"_uiCatalogButtonPushed" forControlEvents:64];
  [(SSSDittoDebugView *)v3 addSubview:v3->_uiCatalogButton];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v35 = (void *)qword_1000B5760;
  uint64_t v49 = qword_1000B5760;
  if (!qword_1000B5760)
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100016468;
    v45[3] = &unk_100099928;
    v45[4] = &v46;
    sub_100016468((uint64_t)v45);
    v35 = (void *)v47[3];
  }
  v36 = v35;
  _Block_object_dispose(&v46, 8);
  v37 = (WKWebView *)objc_alloc_init(v36);
  webView = v3->_webView;
  v3->_webView = v37;

  v39 = v3->_webView;
  v40 = +[NSURL URLWithString:@"https://apple.com"];
  v41 = +[NSURLRequest requestWithURL:v40];
  id v42 = [(WKWebView *)v39 loadRequest:v41];

  [(SSSDittoDebugView *)v3 addSubview:v3->_webView];
  return v3;
}

- (void)_addScreenshotPushed
{
  v2 = [(SSSDittoDebugView *)self blockToRunForAddScreenshotsButton];
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (BOOL)shouldIncludePDF
{
  return [(UISwitch *)self->_snapshotPDFSwitch isOn];
}

- (id)generatePDF:(CGRect *)a3
{
  uint64_t v5 = [(WKWebView *)self->_webView _webViewPrintFormatter];
  [v5 setSnapshotFirstPage:1];
  v6 = objc_alloc_init(DebugPrintPageRenderer);
  double y = CGPointZero.y;
  v8 = [(WKWebView *)self->_webView scrollView];
  [v8 contentSize];
  -[DebugPrintPageRenderer setPaperRect:](v6, "setPaperRect:", CGPointZero.x, y, v9, v10);

  [(DebugPrintPageRenderer *)v6 paperRect];
  -[DebugPrintPageRenderer setPrintableRect:](v6, "setPrintableRect:");
  v36 = v5;
  v11 = +[NSArray arrayWithObjects:&v36 count:1];
  [(DebugPrintPageRenderer *)v6 setPrintFormatters:v11];

  v12 = [(WKWebView *)self->_webView _printProvider];
  [v12 _wk_requestDocumentForPrintFormatter:v5];
  if (!objc_msgSend(v12, "_wk_pageCountForPrintFormatter:", v5))
  {
    v13 = 0;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v13 = (CGPDFDocument *)[v5 _printedDocument];
  if (!v13)
  {
    v28 = +[NSBundle mainBundle];
    CFURLRef v34 = [v28 URLForResource:@"ApplePDFForTestingRemoveBeforeMerging" withExtension:@"pdf"];
    if (!v34)
    {
      v13 = 0;
      goto LABEL_12;
    }
    CFURLRef v35 = v34;
    v13 = CGPDFDocumentCreateWithURL(v34);

    if (!v13) {
      goto LABEL_13;
    }
  }
  Page = CGPDFDocumentGetPage(v13, 1uLL);
  CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
  CGFloat x = BoxRect.origin.x;
  CGFloat v16 = BoxRect.origin.y;
  CGFloat width = BoxRect.size.width;
  double height = BoxRect.size.height;
  double v19 = BoxRect.size.height;
  if ([(UISwitch *)self->_multipagePDFSwitch isOn])
  {
    v20 = +[UIScreen mainScreen];
    [v20 bounds];
    double v19 = v21;
  }
  v13 = +[NSMutableData data];
  v39.origin.CGFloat x = x;
  v39.origin.double y = v16;
  v39.size.CGFloat width = width;
  v39.size.double height = v19;
  UIGraphicsBeginPDFContextToData((NSMutableData *)v13, v39, 0);
  v40.origin.CGFloat x = x;
  v40.origin.double y = v16;
  v40.size.CGFloat width = width;
  v40.size.double height = height;
  v45.origin.CGFloat x = x;
  v45.origin.double y = v16;
  v45.size.CGFloat width = width;
  v45.size.double height = v19;
  if (CGRectIntersectsRect(v40, v45))
  {
    double v22 = v16;
    do
    {
      v41.origin.CGFloat x = x;
      v41.origin.double y = v22;
      v41.size.CGFloat width = width;
      v41.size.double height = v19;
      v46.origin.CGFloat x = x;
      v46.origin.double y = v16;
      v46.size.CGFloat width = width;
      v46.size.double height = height;
      CGRect v42 = CGRectIntersection(v41, v46);
      double v23 = v42.size.height;
      v42.origin.double y = 0.0;
      UIGraphicsBeginPDFPageWithInfo(v42, 0);
      CurrentContext = UIGraphicsGetCurrentContext();
      double v22 = v19 + v22;
      CGContextTranslateCTM(CurrentContext, 0.0, height - v22 + v19 - v23);
      v25 = UIGraphicsGetCurrentContext();
      CGRect PDFContextBounds = UIGraphicsGetPDFContextBounds();
      CGContextTranslateCTM(v25, 0.0, PDFContextBounds.size.height);
      v26 = UIGraphicsGetCurrentContext();
      CGContextScaleCTM(v26, 1.0, -1.0);
      v27 = UIGraphicsGetCurrentContext();
      CGContextDrawPDFPage(v27, Page);
      v44.origin.CGFloat x = x;
      v44.origin.double y = v16;
      v44.size.CGFloat width = width;
      v44.size.double height = height;
      v47.origin.CGFloat x = x;
      v47.origin.double y = v22;
      v47.size.CGFloat width = width;
      v47.size.double height = v19;
    }
    while (CGRectIntersectsRect(v44, v47));
  }
  UIGraphicsEndPDFContext();
  if (a3)
  {
LABEL_11:
    v28 = [(WKWebView *)self->_webView scrollView];
    [v28 bounds];
    a3->origin.CGFloat x = v29;
    a3->origin.double y = v30;
    a3->size.CGFloat width = v31;
    a3->size.double height = v32;
LABEL_12:
  }
LABEL_13:

  return v13;
}

- (void)advanceScrollOffset
{
  v3 = [(WKWebView *)self->_webView scrollView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  [(SSSDittoDebugView *)self bounds];
  double v9 = v7 + v8 + -20.0;
  id v10 = [(WKWebView *)self->_webView scrollView];
  [v10 setContentOffset:1 animated:v5, v9];
}

- (void)resetScrollOffset
{
  id v2 = [(WKWebView *)self->_webView scrollView];
  [v2 setContentOffset:CGPointZero animated:1];
}

- (int64_t)numberOfScreenshotsToAdd
{
  [(UIStepper *)self->_numberOfScreenshotsToAddStepper value];
  return (uint64_t)v2;
}

- (void)_uiCatalogButtonPushed
{
  double v4 = objc_alloc_init(SSSDebugUICatalogViewController);
  v3 = [(SSSDittoDebugView *)self delegate];
  [v3 dittoDebugView:self requestsPresentationOfViewController:v4];
}

- (void)_updateScreenshotCount
{
  [(UIStepper *)self->_numberOfScreenshotsToAddStepper value];
  addScreenshotsButton = self->_addScreenshotsButton;
  CFStringRef v5 = &stru_10009B8B0;
  if ((uint64_t)v3 > 1) {
    CFStringRef v5 = @"s";
  }
  id v6 = +[NSString stringWithFormat:@"Snapshot %d Image%@", (uint64_t)v3, v5];
  [(UIButton *)addScreenshotsButton setTitle:v6 forState:0];
}

- (void)layoutSubviews
{
  [(UIButton *)self->_addScreenshotsButton setTitle:@"Snapshot 10 Images" forState:0];
  [(UIButton *)self->_addScreenshotsButton intrinsicContentSize];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v7 = (100.0 - v5) * 0.5;
  -[UIButton setFrame:](self->_addScreenshotsButton, "setFrame:", 8.0, v7, v3, v5);
  [(SSSDittoDebugView *)self _updateScreenshotCount];
  [(UIStepper *)self->_numberOfScreenshotsToAddStepper intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;
  v46.origin.CGFloat x = 8.0;
  v46.origin.double y = v7;
  v46.size.CGFloat width = v4;
  v46.size.double height = v6;
  CGFloat v12 = CGRectGetMaxX(v46) + 8.0;
  -[UIStepper setFrame:](self->_numberOfScreenshotsToAddStepper, "setFrame:", v12, (100.0 - v11) * 0.5, v9, v11);
  [(UILabel *)self->_snapshotPDFLabel frame];
  double v14 = v13;
  double v16 = v15;
  v47.origin.CGFloat x = v12;
  v47.origin.double y = (100.0 - v11) * 0.5;
  v47.size.CGFloat width = v9;
  v47.size.double height = v11;
  CGFloat v17 = CGRectGetMaxX(v47) + 32.0;
  -[UILabel setFrame:](self->_snapshotPDFLabel, "setFrame:", v17, (100.0 - v16) * 0.5, v14, v16);
  [(UISwitch *)self->_snapshotPDFSwitch frame];
  double v19 = v18;
  double v21 = v20;
  v48.origin.CGFloat x = v17;
  v48.origin.double y = (100.0 - v16) * 0.5;
  v48.size.CGFloat width = v14;
  v48.size.double height = v16;
  CGFloat v22 = CGRectGetMaxX(v48) + 8.0;
  -[UISwitch setFrame:](self->_snapshotPDFSwitch, "setFrame:", v22, (100.0 - v21) * 0.5, v19, v21);
  [(UILabel *)self->_multipagePDFLabel frame];
  double v24 = v23;
  double v26 = v25;
  v49.origin.CGFloat x = v22;
  v49.origin.double y = (100.0 - v21) * 0.5;
  v49.size.CGFloat width = v19;
  v49.size.double height = v21;
  CGFloat v27 = CGRectGetMaxX(v49) + 22.0;
  -[UILabel setFrame:](self->_multipagePDFLabel, "setFrame:", v27, (100.0 - v26) * 0.5, v24, v26);
  [(UISwitch *)self->_multipagePDFSwitch frame];
  double v29 = v28;
  double v31 = v30;
  v50.origin.CGFloat x = v27;
  v50.origin.double y = (100.0 - v26) * 0.5;
  v50.size.CGFloat width = v24;
  v50.size.double height = v26;
  -[UISwitch setFrame:](self->_multipagePDFSwitch, "setFrame:", CGRectGetMaxX(v50) + 8.0, (100.0 - v31) * 0.5, v29, v31);
  [(UIButton *)self->_uiCatalogButton bounds];
  double v33 = v32;
  double v35 = v34;
  [(SSSDittoDebugView *)self bounds];
  -[UIButton setFrame:](self->_uiCatalogButton, "setFrame:", v36 + v37 - v33 + -24.0, (100.0 - v35) * 0.5, v33, v35);
  [(SSSDittoDebugView *)self bounds];
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  [(SSSDittoDebugView *)self bounds];
  v53.origin.CGFloat x = v39;
  v53.origin.double y = 100.0;
  v53.size.CGFloat width = v41;
  v53.size.double height = v43;
  CGRect v52 = CGRectIntersection(v51, v53);
  webView = self->_webView;

  -[WKWebView setFrame:](webView, "setFrame:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
}

- (id)blockToRunForAddScreenshotsButton
{
  return self->_blockToRunForAddScreenshotsButton;
}

- (void)setBlockToRunForAddScreenshotsButton:(id)a3
{
}

- (SSSDittoDebugViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSDittoDebugViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_blockToRunForAddScreenshotsButton, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_uiCatalogButton, 0);
  objc_storeStrong((id *)&self->_multipagePDFLabel, 0);
  objc_storeStrong((id *)&self->_multipagePDFSwitch, 0);
  objc_storeStrong((id *)&self->_snapshotPDFLabel, 0);
  objc_storeStrong((id *)&self->_snapshotPDFSwitch, 0);
  objc_storeStrong((id *)&self->_numberOfScreenshotsToAddStepper, 0);

  objc_storeStrong((id *)&self->_addScreenshotsButton, 0);
}

@end