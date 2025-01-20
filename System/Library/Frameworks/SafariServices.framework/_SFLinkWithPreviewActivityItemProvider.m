@interface _SFLinkWithPreviewActivityItemProvider
- (_SFLinkWithPreviewActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6;
- (id)activityViewControllerLinkMetadata:(id)a3;
@end

@implementation _SFLinkWithPreviewActivityItemProvider

- (_SFLinkWithPreviewActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6
{
  v17.receiver = self;
  v17.super_class = (Class)_SFLinkWithPreviewActivityItemProvider;
  v6 = [(_SFActivityItemProvider *)&v17 initWithPlaceholderItem:a3 URL:a4 pageTitle:a5 webView:a6];
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4F98BE8];
    v9 = [(_SFActivityItemProvider *)v6 url];
    v10 = [(_SFActivityItemProvider *)v7 webView];
    v11 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    v12 = [v11 linkPresentationIconCache];
    uint64_t v13 = [v8 linkMetadataForURL:v9 webView:v10 iconCache:v12];
    cachedLinkMetadata = v7->_cachedLinkMetadata;
    v7->_cachedLinkMetadata = (LPLinkMetadata *)v13;

    v15 = v7;
  }

  return v7;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77___SFLinkWithPreviewActivityItemProvider_activityViewControllerLinkMetadata___block_invoke;
  v6[3] = &unk_1E5C750A0;
  v6[4] = self;
  v4 = __77___SFLinkWithPreviewActivityItemProvider_activityViewControllerLinkMetadata___block_invoke((uint64_t)v6);
  [(LPLinkMetadata *)self->_cachedLinkMetadata setSelectedText:v4];

  return self->_cachedLinkMetadata;
}

- (void).cxx_destruct
{
}

@end