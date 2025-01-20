@interface MPStoreLyricsSnippetRequest
- (MPStoreLyricsSnippetURLComponents)snippetURL;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setSnippetURL:(id)a3;
@end

@implementation MPStoreLyricsSnippetRequest

- (void).cxx_destruct
{
}

- (void)setSnippetURL:(id)a3
{
}

- (MPStoreLyricsSnippetURLComponents)snippetURL
{
  return self->_snippetURL;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(MPStoreLyricsSnippetRequest *)self snippetURL];
  [v5 setSnippetURL:v6];

  [v5 setResponseHandler:v4];
  return v5;
}

@end