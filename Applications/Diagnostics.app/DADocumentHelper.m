@interface DADocumentHelper
- (DADocumentHelper)initWithConsentHandles:(id)a3;
- (NSArray)contentsText;
- (NSString)fullName;
- (UIImage)imageSignature;
- (id)base64String:(id)a3;
- (id)consentBody;
- (id)currentDate;
- (id)generatePDFData;
- (void)saveConsentDocument:(id)a3;
- (void)setContentsText:(id)a3;
- (void)setFullName:(id)a3;
- (void)setImageSignature:(id)a3;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation DADocumentHelper

- (DADocumentHelper)initWithConsentHandles:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DADocumentHelper;
  v5 = [(DADocumentHelper *)&v26 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)WKWebView);
    v7 = +[UIScreen mainScreen];
    [v7 bounds];
    v8 = [v6 initWithFrame:];
    webView = v5->webView;
    v5->webView = v8;

    v19 = v5;
    [(WKWebView *)v5->webView setNavigationDelegate:v5];
    v10 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v4;
    id obj = v4;
    id v11 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = +[NSString stringWithFormat:@"ELS_HEALTH_CONSENT_%@_CONTENT", *(void *)(*((void *)&v22 + 1) + 8 * (void)v14)];
          v16 = +[NSBundle mainBundle];
          v17 = [v16 localizedStringForKey:v15 value:&stru_1001548A0 table:0];

          [v10 addObject:v17];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    v5 = v19;
    [(DADocumentHelper *)v19 setContentsText:v10];

    id v4 = v20;
  }

  return v5;
}

- (id)generatePDFData
{
  v15.origin.double x = 0.0;
  v15.origin.double y = 0.0;
  v15.size.double width = 595.200012;
  v15.size.double height = 841.799988;
  CGRect v16 = CGRectInset(v15, 24.0, 24.0);
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  id v7 = objc_alloc_init((Class)UIPrintPageRenderer);
  v8 = [(WKWebView *)self->webView viewPrintFormatter];
  [v7 addPrintFormatter:v8 startingAtPageAtIndex:0];

  v9 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, 0.0, 595.200012, 841.799988);
  [v7 setValue:v9 forKey:@"paperRect"];

  v10 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height);
  [v7 setValue:v10 forKey:@"printableRect"];

  id v11 = +[NSMutableData data];
  v17.origin.double x = 0.0;
  v17.origin.double y = 0.0;
  v17.size.double width = 595.200012;
  v17.size.double height = 841.799988;
  UIGraphicsBeginPDFContextToData(v11, v17, 0);
  if ((uint64_t)[v7 numberOfPages] >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      UIGraphicsBeginPDFPage();
      CGRect PDFContextBounds = UIGraphicsGetPDFContextBounds();
      [v7 drawPageAtIndex:v12++ inRect:CGRectMake(PDFContextBounds.origin.x, PDFContextBounds.origin.y, PDFContextBounds.size.width, PDFContextBounds.size.height)];
    }
    while (v12 < (uint64_t)[v7 numberOfPages]);
  }
  UIGraphicsEndPDFContext();

  return v11;
}

- (void)saveConsentDocument:(id)a3
{
  id v4 = a3;
  saveDataTimer = self->saveDataTimer;
  if (saveDataTimer) {
    [(NSTimer *)saveDataTimer invalidate];
  }
  id v6 = [v4 copy];
  id onSavePDFData = self->onSavePDFData;
  self->id onSavePDFData = v6;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002968C;
  v13[3] = &unk_10014BF90;
  v13[4] = self;
  v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v13 block:3.0];
  v9 = self->saveDataTimer;
  self->saveDataTimer = v8;

  webView = self->webView;
  id v11 = [(DADocumentHelper *)self consentBody];
  id v12 = [(WKWebView *)webView loadHTMLString:v11 baseURL:0];
}

- (id)base64String:(id)a3
{
  v3 = UIImagePNGRepresentation((UIImage *)a3);
  id v4 = [v3 base64EncodedStringWithOptions:1];

  return v4;
}

- (id)currentDate
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  [v2 setDateStyle:4];
  [v2 setTimeStyle:0];
  v3 = +[NSLocale currentLocale];
  [v2 setLocale:v3];

  id v4 = +[NSDate date];
  v5 = [v2 stringFromDate:v4];

  return v5;
}

- (id)consentBody
{
  v3 = [(DADocumentHelper *)self imageSignature];
  objc_super v26 = [(DADocumentHelper *)self base64String:v3];

  id v4 = +[NSBundle mainBundle];
  v5 = &stru_1001548A0;
  id v6 = [v4 localizedStringForKey:@"ELS_HEALTH_CONSENT_DOCUMENT_TITLE" value:&stru_1001548A0 table:0];
  long long v25 = +[NSString stringWithFormat:@"<center><h3>%@</h3></center>", v6];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [(DADocumentHelper *)self contentsText];
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      id v11 = 0;
      id v12 = v5;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = +[NSString stringWithFormat:@"<p>%@</p>", *(void *)(*((void *)&v27 + 1) + 8 * (void)v11)];
        v5 = [(__CFString *)v12 stringByAppendingString:v13];

        id v11 = (char *)v11 + 1;
        id v12 = v5;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  long long v24 = +[NSBundle mainBundle];
  v14 = [v24 localizedStringForKey:@"ELS_HEALTH_CONSENT_DOCUMENT_NAME" value:&stru_1001548A0 table:0];
  CGRect v15 = [(DADocumentHelper *)self fullName];
  CGRect v16 = +[NSBundle mainBundle];
  CGRect v17 = [v16 localizedStringForKey:@"ELS_HEALTH_CONSENT_DOCUMENT_SIGN" value:&stru_1001548A0 table:0];
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"ELS_HEALTH_CONSENT_DOCUMENT_DATE" value:&stru_1001548A0 table:0];
  id v20 = [(DADocumentHelper *)self currentDate];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<h3>%@</h3><p>%@</p><h3>%@</h3><img src=\"data:image/png;base64,%@\" /><h3>%@</h3><p>%@</p>",
    v14,
    v15,
    v17,
    v26,
    v19,
  v21 = v20);

  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%@%@%@%@</body></html>", @"<html dir=\"ltr\">", @"<head><style>body { font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\";font-size:14px;}</style></head><body>",
    v25,
    v5,
  long long v22 = v21);

  return v22;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  v5 = +[ELSManager sharedManager];
  [(DADocumentHelper *)self generatePDFData];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029BC4;
  v7[3] = &unk_10014B930;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v8;
  [v5 transactionWithBlock:v7];
}

- (NSArray)contentsText
{
  return self->_contentsText;
}

- (void)setContentsText:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (UIImage)imageSignature
{
  return self->_imageSignature;
}

- (void)setImageSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSignature, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_contentsText, 0);
  objc_storeStrong((id *)&self->saveDataTimer, 0);
  objc_storeStrong(&self->onSavePDFData, 0);

  objc_storeStrong((id *)&self->webView, 0);
}

@end