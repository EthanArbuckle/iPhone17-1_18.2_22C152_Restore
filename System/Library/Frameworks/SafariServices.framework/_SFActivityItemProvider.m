@interface _SFActivityItemProvider
- (NSSet)excludedActivityTypes;
- (NSString)pageTitle;
- (NSURL)url;
- (WKWebView)webView;
- (_SFActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (_SFActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6;
- (_SFActivityItemProvider)initWithURL:(id)a3 pageTitle:(id)a4 webView:(id)a5;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)item;
- (id)thumbnailHandler;
- (void)main;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setPageTitle:(id)a3;
- (void)setThumbnailHandler:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWebView:(id)a3;
@end

@implementation _SFActivityItemProvider

- (_SFActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  return 0;
}

- (_SFActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_SFActivityItemProvider;
  v14 = [(UIActivityItemProvider *)&v20 initWithPlaceholderItem:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a4);
    objc_storeStrong((id *)&v15->_pageTitle, a5);
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] set];
    excludedActivityTypes = v15->_excludedActivityTypes;
    v15->_excludedActivityTypes = (NSSet *)v16;

    objc_storeWeak((id *)&v15->_webView, v13);
    v18 = v15;
  }

  return v15;
}

- (_SFActivityItemProvider)initWithURL:(id)a3 pageTitle:(id)a4 webView:(id)a5
{
  return [(_SFActivityItemProvider *)self initWithPlaceholderItem:a3 URL:a3 pageTitle:a4 webView:a5];
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([(NSSet *)self->_excludedActivityTypes containsObject:a4])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(_SFActivityItemProvider *)self item];
  }

  return v5;
}

- (id)item
{
  return self->_url;
}

- (void)main
{
  v3 = [(_SFActivityItemProvider *)self excludedActivityTypes];
  v4 = [(UIActivityItemProvider *)self activityType];
  char v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFActivityItemProvider;
    [(UIActivityItemProvider *)&v6 main];
  }
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F43590]])
  {
    char v5 = [(NSURL *)self->_url safari_userVisibleString];
    objc_msgSend(v5, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
    objc_super v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v6 = self->_pageTitle;
  }

  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  thumbnailHandler = (void (**)(void, void, void, __n128, __n128))self->_thumbnailHandler;
  if (thumbnailHandler)
  {
    ((void (**)(void, id, id, __n128, __n128))thumbnailHandler)[2](thumbnailHandler, a4, a3, (__n128)a5, *(__n128 *)&a5.height);
    thumbnailHandler = (void (**)(void, void, void, __n128, __n128))objc_claimAutoreleasedReturnValue();
  }

  return thumbnailHandler;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
}

- (NSSet)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (id)thumbnailHandler
{
  return self->_thumbnailHandler;
}

- (void)setThumbnailHandler:(id)a3
{
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WKWebView *)WeakRetained;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong(&self->_thumbnailHandler, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end