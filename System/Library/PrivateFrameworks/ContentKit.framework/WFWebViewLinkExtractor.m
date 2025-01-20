@interface WFWebViewLinkExtractor
+ (id)linkPositionRetrievalJavaScript;
+ (void)extractLinksFromScriptResult:(id)a3 withDestinationWidth:(double)a4 completionHandler:(id)a5;
+ (void)extractLinksFromWKWebView:(id)a3 withDestinationWidth:(double)a4 completionHandler:(id)a5;
@end

@implementation WFWebViewLinkExtractor

+ (id)linkPositionRetrievalJavaScript
{
  v2 = objc_msgSend([NSString alloc], "initWithCString:encoding:", "function getMetricsDictionaryFromRect(rect) { return {'x': rect.left, 'y': rect.top, 'width': rect.width, 'height': rect.height}; } var measuringStick = document.createElement('a'); measuringStick.href = 'h"
                 "ttp://prevueguide.com'; measuringStick.style.cssText = 'height: 100%; width: 100%; float: left'; docume"
                 "nt.body.appendChild(measuringStick); var pageMetrics = getMetricsDictionaryFromRect(measuringStick.getB"
                 "oundingClientRect()); document.body.removeChild(measuringStick); var links = document.getElementsByTagN"
                 "ame('a'); var linkDictionaries = []; for (var i = 0; i < links.length; ++i) { var link = links[i]; var "
                 "rect = link.getBoundingClientRect(); if (link.href && rect.width && rect.height) { var linkDictionary ="
                 " getMetricsDictionaryFromRect(rect); linkDictionary['href'] = link.href; linkDictionaries.push(linkDict"
                 "ionary); } } JSON.stringify({'pageMetrics': pageMetrics, 'links':linkDictionaries});",
                 4);
  return v2;
}

+ (void)extractLinksFromScriptResult:(id)a3 withDestinationWidth:(double)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)MEMORY[0x263F08900];
    v10 = [v7 dataUsingEncoding:4];
    v11 = [v9 JSONObjectWithData:v10 options:0 error:0];

    v12 = [v11 objectForKey:@"pageMetrics"];
    v13 = [v11 objectForKey:@"links"];
    v14 = [v12 objectForKey:@"width"];
    [v14 floatValue];
    double v16 = a4 / v15;

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __94__WFWebViewLinkExtractor_extractLinksFromScriptResult_withDestinationWidth_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_40_e25__24__0__NSDictionary_8Q16l;
    *(double *)&v18[4] = v16;
    v17 = objc_msgSend(v13, "if_compactMap:", v18);
    v8[2](v8, v17);
  }
  else
  {
    v8[2](v8, 0);
  }
}

WFWebViewLink *__94__WFWebViewLinkExtractor_extractLinksFromScriptResult_withDestinationWidth_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKey:@"width"];
  [v4 floatValue];
  CGFloat v6 = v5;

  id v7 = [v3 objectForKey:@"height"];
  [v7 floatValue];
  CGFloat v9 = v8;

  v10 = [v3 objectForKey:@"x"];
  [v10 floatValue];
  CGFloat v12 = v11;

  v13 = [v3 objectForKey:@"y"];
  [v13 floatValue];
  CGFloat v15 = v14;

  CGAffineTransformMakeScale(&v24, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32));
  v26.origin.double x = v12;
  v26.origin.double y = v15;
  v26.size.double width = v6;
  v26.size.double height = v9;
  CGRect v27 = CGRectApplyAffineTransform(v26, &v24);
  double x = v27.origin.x;
  double y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  v20 = [v3 objectForKey:@"href"];

  v21 = [NSURL URLWithString:v20];
  if (v21) {
    v22 = -[WFWebViewLink initWithHref:rect:]([WFWebViewLink alloc], "initWithHref:rect:", v21, x, y, width, height);
  }
  else {
    v22 = 0;
  }

  return v22;
}

+ (void)extractLinksFromWKWebView:(id)a3 withDestinationWidth:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 linkPositionRetrievalJavaScript];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__WFWebViewLinkExtractor_extractLinksFromWKWebView_withDestinationWidth_completionHandler___block_invoke;
  v12[3] = &unk_2642858E0;
  double v15 = a4;
  id v13 = v8;
  id v14 = a1;
  id v11 = v8;
  [v9 evaluateJavaScript:v10 completionHandler:v12];
}

uint64_t __91__WFWebViewLinkExtractor_extractLinksFromWKWebView_withDestinationWidth_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) extractLinksFromScriptResult:a2 withDestinationWidth:*(void *)(a1 + 32) completionHandler:*(double *)(a1 + 48)];
}

@end