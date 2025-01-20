@interface QLWebPaginationManager
- (CGRect)pageRectForPage:(int64_t)a3;
- (CGSize)pageSize;
- (NSArray)pageFrames;
- (NSString)pageElementXPath;
- (QLWebPaginationManager)initWithPageElementXPath:(id)a3 webview:(id)a4;
- (QLWebPaginationManager)initWithPageSize:(CGSize)a3 webview:(id)a4;
- (WKWebView)webview;
- (void)_getFramesForXpath:(id)a3 completion:(id)a4;
- (void)processPageGeometryFromXpath:(id)a3;
- (void)setPageElementXPath:(id)a3;
- (void)setPageFrames:(id)a3;
- (void)setPageSize:(CGSize)a3;
- (void)setWebview:(id)a3;
@end

@implementation QLWebPaginationManager

- (QLWebPaginationManager)initWithPageSize:(CGSize)a3 webview:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)QLWebPaginationManager;
  v8 = [(QLWebPaginationManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_pageSize.CGFloat width = width;
    v8->_pageSize.CGFloat height = height;
    objc_storeWeak((id *)&v8->_webview, v7);
  }

  return v9;
}

- (QLWebPaginationManager)initWithPageElementXPath:(id)a3 webview:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)QLWebPaginationManager;
  v9 = [(QLWebPaginationManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pageElementXPath, a3);
    objc_storeWeak((id *)&v10->_webview, v8);
  }

  return v10;
}

- (void)processPageGeometryFromXpath:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(QLWebPaginationManager *)self pageFrames];

  if (v5)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v6 = [(QLWebPaginationManager *)self pageElementXPath];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004790;
    v7[3] = &unk_100008430;
    v7[4] = self;
    id v8 = v4;
    [(QLWebPaginationManager *)self _getFramesForXpath:v6 completion:v7];
  }
}

- (CGRect)pageRectForPage:(int64_t)a3
{
  v5 = [(QLWebPaginationManager *)self pageElementXPath];

  if (v5)
  {
    CGFloat x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    v10 = [(QLWebPaginationManager *)self pageFrames];

    if (v10)
    {
      objc_super v11 = [(QLWebPaginationManager *)self pageFrames];
      id v12 = [v11 count];

      if ((unint64_t)v12 > a3)
      {
        v13 = [(QLWebPaginationManager *)self pageFrames];
        v14 = [v13 objectAtIndexedSubscript:a3];

        [v14 rectValue];
        CGFloat x = v15;
        double y = v16;
        CGFloat width = v17;
        CGFloat height = v18;
      }
    }
    else
    {
      v22 = qltLogHandles[14];
      if (!v22)
      {
        QLTInitLogging();
        v22 = qltLogHandles[14];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000053EC(v22);
      }
    }
  }
  else
  {
    [(QLWebPaginationManager *)self pageSize];
    double y = v19 * (double)a3;
    [(QLWebPaginationManager *)self pageSize];
    CGFloat width = v20;
    [(QLWebPaginationManager *)self pageSize];
    CGFloat height = v21;
    CGFloat x = 0.0;
  }
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.double y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (void)_getFramesForXpath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(QLWebPaginationManager *)self webview];
  CFStringRef v14 = @"xpath";
  id v15 = v7;
  v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v10 = +[WKContentWorld defaultClientWorld];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004A94;
  v12[3] = &unk_100008458;
  id v13 = v6;
  id v11 = v6;
  objc_msgSend(v8, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", @"\nlet elements = document.evaluate(xpath, document, null, XPathResult.ORDERED_NODE_ITERATOR_TYPE, null) \nlet frames = []\nvar node\nwhile ((node = elements.iterateNext()) != null) {\n    const {x,y,width,height} = node.getBoundingClientRect()\n    frames.push({x,y,width,height})\n}\nreturn frames;\n\n",
    v9,
    0,
    v10,
    v12);
}

- (CGSize)pageSize
{
  objc_copyStruct(v4, &self->_pageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_pageSize, &v3, 16, 1, 0);
}

- (NSString)pageElementXPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPageElementXPath:(id)a3
{
}

- (WKWebView)webview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webview);

  return (WKWebView *)WeakRetained;
}

- (void)setWebview:(id)a3
{
}

- (NSArray)pageFrames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPageFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageFrames, 0);
  objc_destroyWeak((id *)&self->_webview);

  objc_storeStrong((id *)&self->_pageElementXPath, 0);
}

@end