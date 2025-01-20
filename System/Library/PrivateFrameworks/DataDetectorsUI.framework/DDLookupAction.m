@interface DDLookupAction
- (DDLookupAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5;
- (DDLookupAction)initWithRVQuery:(id)a3 context:(id)a4;
- (DDLookupAction)initWithRVQuery:(id)a3 reportAnIssueBlock:(id)a4 context:(id)a5;
- (DDLookupAction)initWithRVQuery:(id)a3 reportAnIssueBlock:(id)a4 metadataFetchingBlock:(id)a5 context:(id)a6;
- (id)createViewController;
- (id)iconName;
- (id)menuActions;
- (void)adaptForPresentationInPopover:(BOOL)a3;
@end

@implementation DDLookupAction

- (DDLookupAction)initWithRVQuery:(id)a3 context:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DDLookupAction;
  v8 = [(DDParsecPreviewAction *)&v11 initWithURL:0 result:0 context:a4];
  v9 = v8;
  if (v8)
  {
    [(DDParsecPreviewAction *)v8 setPreviewMode:0];
    objc_storeStrong((id *)&v9->_query, a3);
  }

  return v9;
}

- (DDLookupAction)initWithQueryString:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DDLookupAction;
  v10 = [(DDParsecPreviewAction *)&v15 initWithURL:0 result:0 context:a5];
  objc_super v11 = v10;
  if (v10)
  {
    [(DDParsecPreviewAction *)v10 setPreviewMode:0];
    uint64_t v12 = [v9 copy];
    queryString = v11->_queryString;
    v11->_queryString = (NSString *)v12;

    v11->_queryStringRange.NSUInteger location = location;
    v11->_queryStringRange.NSUInteger length = length;
  }

  return v11;
}

- (DDLookupAction)initWithRVQuery:(id)a3 reportAnIssueBlock:(id)a4 context:(id)a5
{
  return [(DDLookupAction *)self initWithRVQuery:a3 reportAnIssueBlock:a4 metadataFetchingBlock:0 context:a5];
}

- (DDLookupAction)initWithRVQuery:(id)a3 reportAnIssueBlock:(id)a4 metadataFetchingBlock:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DDLookupAction;
  v14 = [(DDParsecPreviewAction *)&v21 initWithURL:0 result:0 context:a6];
  objc_super v15 = v14;
  if (v14)
  {
    [(DDParsecPreviewAction *)v14 setPreviewMode:0];
    objc_storeStrong((id *)&v15->_query, a3);
    uint64_t v16 = MEMORY[0x1A6236DA0](v12);
    id reportAnIssueBlock = v15->_reportAnIssueBlock;
    v15->_id reportAnIssueBlock = (id)v16;

    uint64_t v18 = MEMORY[0x1A6236DA0](v13);
    id reportAnIssueMetadataFetchingBlock = v15->_reportAnIssueMetadataFetchingBlock;
    v15->_id reportAnIssueMetadataFetchingBlock = (id)v18;
  }
  return v15;
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
}

- (id)createViewController
{
  query = self->_query;
  if (self->_queryString)
  {
    if (!query)
    {
      v4 = -[DDParsecCollectionViewController initWithString:range:]([DDParsecCollectionViewController alloc], "initWithString:range:", self->_queryString, self->_queryStringRange.location, self->_queryStringRange.length);
      parsecViewController = self->super.super._parsecViewController;
      self->super.super._parsecViewController = v4;

LABEL_6:
      [(DDParsecCollectionViewController *)self->super.super._parsecViewController setPreviewMode:self->super.super._previewMode];
      [(DDParsecCollectionViewController *)self->super.super._parsecViewController setParsecDelegate:self];
      v8 = self->super.super._parsecViewController;
      goto LABEL_7;
    }
LABEL_5:
    v6 = [[DDParsecCollectionViewController alloc] initWithQuery:self->_query];
    id v7 = self->super.super._parsecViewController;
    self->super.super._parsecViewController = v6;

    [(DDParsecCollectionViewController *)self->super.super._parsecViewController setReportAnIssueBlock:self->_reportAnIssueBlock];
    [(DDParsecCollectionViewController *)self->super.super._parsecViewController setReportAnIssueMetadataFetchingBlock:self->_reportAnIssueMetadataFetchingBlock];
    goto LABEL_6;
  }
  if (query) {
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:
  return v8;
}

- (id)menuActions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  query = self->_query;
  if (query)
  {
    v4 = [(RVQuery *)query title];
    NSUInteger length = [(NSString *)v4 length];
    NSUInteger location = 0;
  }
  else
  {
    v4 = self->_queryString;
    NSUInteger location = self->_queryStringRange.location;
    NSUInteger length = self->_queryStringRange.length;
  }
  id v7 = -[DDCopyAction initWithQueryString:range:context:]([DDCopyAction alloc], "initWithQueryString:range:context:", v4, location, length, self->super.super.super.super._context);
  v8 = -[DDSearchWebAction initWithQueryString:range:context:]([DDSearchWebAction alloc], "initWithQueryString:range:context:", v4, location, length, self->super.super.super.super._context);
  v12[0] = v8;
  v12[1] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = +[DDActionGroup groupWithActions:]((uint64_t)DDActionGroup, v9);

  return v10;
}

- (id)iconName
{
  return @"doc.text.magnifyingglass";
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reportAnIssueMetadataFetchingBlock, 0);
  objc_storeStrong(&self->_reportAnIssueBlock, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end