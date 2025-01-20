@interface WFShareSheetSafariWebPage
+ (BOOL)supportsSecureCoding;
+ (id)webPageFromPreprocessingResult:(id)a3 javaScriptRunnerIdentifier:(id)a4;
- (NSString)javaScriptRunnerIdentifier;
- (WFShareSheetSafariWebPage)initWithCoder:(id)a3;
- (WFShareSheetSafariWebPage)initWithURL:(id)a3 pageTitle:(id)a4 selectionText:(id)a5 selectionHTML:(id)a6 documentHTML:(id)a7 javaScriptRunnerIdentifier:(id)a8;
- (id)selectionHTML;
- (id)selectionText;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFShareSheetSafariWebPage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javaScriptRunnerIdentifier, 0);
  objc_storeStrong((id *)&self->_selectionHTML, 0);
  objc_storeStrong((id *)&self->_selectionText, 0);
}

- (NSString)javaScriptRunnerIdentifier
{
  return self->_javaScriptRunnerIdentifier;
}

- (id)selectionHTML
{
  return self->_selectionHTML;
}

- (id)selectionText
{
  return self->_selectionText;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFShareSheetSafariWebPage;
  id v4 = a3;
  [(WFSafariWebPage *)&v8 encodeWithCoder:v4];
  v5 = [(WFShareSheetSafariWebPage *)self selectionText];
  [v4 encodeObject:v5 forKey:@"selectionText"];

  v6 = [(WFShareSheetSafariWebPage *)self selectionHTML];
  [v4 encodeObject:v6 forKey:@"selectionHTML"];

  v7 = [(WFShareSheetSafariWebPage *)self javaScriptRunnerIdentifier];
  [v4 encodeObject:v7 forKey:@"javaScriptRunnerIdentifier"];
}

- (WFShareSheetSafariWebPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShareSheetSafariWebPage;
  v5 = [(WFSafariWebPage *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectionText"];
    selectionText = v5->_selectionText;
    v5->_selectionText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectionHTML"];
    selectionHTML = v5->_selectionHTML;
    v5->_selectionHTML = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"javaScriptRunnerIdentifier"];
    javaScriptRunnerIdentifier = v5->_javaScriptRunnerIdentifier;
    v5->_javaScriptRunnerIdentifier = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (WFShareSheetSafariWebPage)initWithURL:(id)a3 pageTitle:(id)a4 selectionText:(id)a5 selectionHTML:(id)a6 documentHTML:(id)a7 javaScriptRunnerIdentifier:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  v26.receiver = self;
  v26.super_class = (Class)WFShareSheetSafariWebPage;
  v17 = [(WFSafariWebPage *)&v26 initWithURL:a3 pageTitle:a4 documentHTML:a7];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    selectionText = v17->_selectionText;
    v17->_selectionText = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    selectionHTML = v17->_selectionHTML;
    v17->_selectionHTML = (NSData *)v20;

    uint64_t v22 = [v16 copy];
    javaScriptRunnerIdentifier = v17->_javaScriptRunnerIdentifier;
    v17->_javaScriptRunnerIdentifier = (NSString *)v22;

    v24 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)webPageFromPreprocessingResult:(id)a3 javaScriptRunnerIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"WFShareSheetSafariWebPage.m", 33, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  v9 = (objc_class *)a1;
  uint64_t v10 = [v7 objectForKey:@"URL"];
  v11 = [v7 objectForKey:@"title"];
  v12 = [v7 objectForKey:@"selectionText"];
  v13 = [v7 objectForKey:@"selection"];
  id v14 = [v7 objectForKey:@"document"];
  v21 = (void *)v10;
  id v15 = [NSURL URLWithString:v10];
  if ([v13 length])
  {
    id v16 = [v13 dataUsingEncoding:4];
  }
  else
  {
    id v16 = 0;
  }
  if ([v14 length])
  {
    v17 = [v14 dataUsingEncoding:4];
  }
  else
  {
    v17 = 0;
  }
  uint64_t v18 = (void *)[[v9 alloc] initWithURL:v15 pageTitle:v11 selectionText:v12 selectionHTML:v16 documentHTML:v17 javaScriptRunnerIdentifier:v8];

  return v18;
}

@end