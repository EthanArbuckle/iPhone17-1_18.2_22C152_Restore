@interface WFSafariWebPage
+ (BOOL)supportsSecureCoding;
- (NSData)documentHTML;
- (NSData)selectionHTML;
- (NSString)pageTitle;
- (NSString)selectionText;
- (NSURL)URL;
- (WFSafariWebPage)initWithCoder:(id)a3;
- (WFSafariWebPage)initWithURL:(id)a3 pageTitle:(id)a4 documentHTML:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSafariWebPage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentHTML, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (NSData)documentHTML
{
  return self->_documentHTML;
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFSafariWebPage *)self URL];
  [v4 encodeObject:v5 forKey:@"URL"];

  v6 = [(WFSafariWebPage *)self pageTitle];
  [v4 encodeObject:v6 forKey:@"pageTitle"];

  id v7 = [(WFSafariWebPage *)self documentHTML];
  [v4 encodeObject:v7 forKey:@"documentHTML"];
}

- (WFSafariWebPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pageTitle"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentHTML"];

  v8 = [(WFSafariWebPage *)self initWithURL:v5 pageTitle:v6 documentHTML:v7];
  return v8;
}

- (NSData)selectionHTML
{
  return 0;
}

- (NSString)selectionText
{
  return 0;
}

- (WFSafariWebPage)initWithURL:(id)a3 pageTitle:(id)a4 documentHTML:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFSafariWebPage.m", 17, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFSafariWebPage.m", 18, @"Invalid parameter not satisfying: %@", @"pageTitle" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)WFSafariWebPage;
  v12 = [(WFSafariWebPage *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    URL = v12->_URL;
    v12->_URL = (NSURL *)v13;

    uint64_t v15 = [v10 copy];
    pageTitle = v12->_pageTitle;
    v12->_pageTitle = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    documentHTML = v12->_documentHTML;
    v12->_documentHTML = (NSData *)v17;

    v19 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end