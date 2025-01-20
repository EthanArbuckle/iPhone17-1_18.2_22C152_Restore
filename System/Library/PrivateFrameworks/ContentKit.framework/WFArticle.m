@interface WFArticle
+ (BOOL)supportsSecureCoding;
+ (WFArticle)articleWithTitle:(id)a3 author:(id)a4 publishedDate:(id)a5 body:(id)a6 excerpt:(id)a7 numberOfWords:(unint64_t)a8 mainImageURL:(id)a9 URL:(id)a10;
+ (id)mainImageURLFromHTML:(id)a3;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (id)summaryOfParagraph:(id)a3;
+ (unint64_t)numberOfWordsInString:(id)a3;
+ (void)fetchArticleFromURL:(id)a3 pageHTML:(id)a4 completionHandler:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)publishedDate;
- (NSString)author;
- (NSString)body;
- (NSString)excerpt;
- (NSString)title;
- (NSURL)URL;
- (NSURL)mainImageURL;
- (WFArticle)initWithCoder:(id)a3;
- (WFArticle)initWithTitle:(id)a3 author:(id)a4 publishedDate:(id)a5 body:(id)a6 excerpt:(id)a7 numberOfWords:(unint64_t)a8 mainImageURL:(id)a9 URL:(id)a10;
- (id)wfSerializedRepresentation;
- (unint64_t)hash;
- (unint64_t)numberOfWords;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFArticle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainImageURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_excerpt, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_publishedDate, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSURL)mainImageURL
{
  return self->_mainImageURL;
}

- (NSURL)URL
{
  return self->_URL;
}

- (unint64_t)numberOfWords
{
  return self->_numberOfWords;
}

- (NSString)excerpt
{
  return self->_excerpt;
}

- (NSString)body
{
  return self->_body;
}

- (NSDate)publishedDate
{
  return self->_publishedDate;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)title
{
  return self->_title;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFArticle *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(WFArticle *)self author];
  [v4 encodeObject:v6 forKey:@"author"];

  v7 = [(WFArticle *)self publishedDate];
  [v4 encodeObject:v7 forKey:@"publishedDate"];

  v8 = [(WFArticle *)self body];
  [v4 encodeObject:v8 forKey:@"body"];

  v9 = [(WFArticle *)self excerpt];
  [v4 encodeObject:v9 forKey:@"excerpt"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFArticle numberOfWords](self, "numberOfWords"));
  [v4 encodeObject:v10 forKey:@"numberOfWords"];

  v11 = [(WFArticle *)self mainImageURL];
  [v4 encodeObject:v11 forKey:@"mainImageURL"];

  id v12 = [(WFArticle *)self URL];
  [v4 encodeObject:v12 forKey:@"URL"];
}

- (WFArticle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"author"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publishedDate"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"excerpt"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfWords"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mainImageURL"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];

  v14 = [(WFArticle *)self initWithTitle:v5 author:v6 publishedDate:v7 body:v8 excerpt:v9 numberOfWords:v11 mainImageURL:v12 URL:v13];
  return v14;
}

- (id)wfSerializedRepresentation
{
  v24[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [(WFArticle *)self title];

  if (v4)
  {
    v5 = [(WFArticle *)self title];
    [v3 setObject:v5 forKeyedSubscript:@"title"];
  }
  v6 = [(WFArticle *)self author];

  if (v6)
  {
    v7 = [(WFArticle *)self author];
    [v3 setObject:v7 forKeyedSubscript:@"author"];
  }
  v8 = [(WFArticle *)self publishedDate];

  if (v8)
  {
    v9 = [(WFArticle *)self publishedDate];
    [v3 setObject:v9 forKeyedSubscript:@"publishedDate"];
  }
  v10 = [(WFArticle *)self body];

  if (v10)
  {
    uint64_t v11 = [(WFArticle *)self body];
    [v3 setObject:v11 forKeyedSubscript:@"body"];
  }
  id v12 = [(WFArticle *)self excerpt];

  if (v12)
  {
    v13 = [(WFArticle *)self excerpt];
    [v3 setObject:v13 forKeyedSubscript:@"excerpt"];
  }
  if ([(WFArticle *)self numberOfWords])
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFArticle numberOfWords](self, "numberOfWords"));
    [v3 setObject:v14 forKeyedSubscript:@"numberOfWords"];
  }
  v15 = [(WFArticle *)self mainImageURL];

  if (v15)
  {
    v16 = [(WFArticle *)self mainImageURL];
    v17 = [v16 absoluteString];
    [v3 setObject:v17 forKeyedSubscript:@"mainImageURL"];
  }
  v18 = [(WFArticle *)self URL];

  if (v18)
  {
    v19 = [(WFArticle *)self URL];
    v20 = [v19 absoluteString];
    [v3 setObject:v20 forKeyedSubscript:@"URL"];
  }
  v23 = @"link.contentkit.article";
  v24[0] = v3;
  v21 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

  return v21;
}

- (unint64_t)hash
{
  v3 = [(WFArticle *)self URL];
  uint64_t v4 = [v3 hash];
  v5 = [(WFArticle *)self title];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFArticle *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(WFArticle *)self title];
      v7 = [(WFArticle *)v5 title];
      if (v6 == v7)
      {
        int v11 = 0;
      }
      else
      {
        v8 = [(WFArticle *)self title];
        v9 = [(WFArticle *)v5 title];
        int v10 = [v8 isEqualToString:v9];

        int v11 = v10 ^ 1;
      }

      v13 = [(WFArticle *)self author];
      v14 = [(WFArticle *)v5 author];
      if (v13 == v14)
      {
        int v52 = 0;
      }
      else
      {
        v15 = [(WFArticle *)self author];
        v16 = [(WFArticle *)v5 author];
        int v17 = [v15 isEqualToString:v16];

        int v52 = v17 ^ 1;
      }

      v18 = [(WFArticle *)self publishedDate];
      v19 = [(WFArticle *)v5 publishedDate];
      if (v18 == v19)
      {
        int v51 = 0;
      }
      else
      {
        v20 = [(WFArticle *)self publishedDate];
        v21 = [(WFArticle *)v5 publishedDate];
        int v22 = [v20 isEqualToDate:v21];

        int v51 = v22 ^ 1;
      }

      v23 = [(WFArticle *)self body];
      v24 = [(WFArticle *)v5 body];
      if (v23 == v24)
      {
        int v50 = 0;
      }
      else
      {
        v25 = [(WFArticle *)self body];
        v26 = [(WFArticle *)v5 body];
        int v27 = [v25 isEqualToString:v26];

        int v50 = v27 ^ 1;
      }

      v28 = [(WFArticle *)self excerpt];
      v29 = [(WFArticle *)v5 excerpt];
      if (v28 == v29)
      {
        int v33 = 0;
      }
      else
      {
        v30 = [(WFArticle *)self excerpt];
        v31 = [(WFArticle *)v5 excerpt];
        int v32 = [v30 isEqualToString:v31];

        int v33 = v32 ^ 1;
      }

      v34 = [(WFArticle *)self mainImageURL];
      v35 = [(WFArticle *)v5 mainImageURL];
      if (v34 == v35)
      {
        char v38 = 1;
      }
      else
      {
        v36 = [(WFArticle *)self mainImageURL];
        v37 = [(WFArticle *)v5 mainImageURL];
        char v38 = [v36 isEqual:v37];
      }
      v39 = [(WFArticle *)self URL];
      v40 = [(WFArticle *)v5 URL];
      if (v39 == v40)
      {
        char v49 = 1;
      }
      else
      {
        v41 = [(WFArticle *)self URL];
        [(WFArticle *)v5 URL];
        int v42 = v33;
        char v43 = v38;
        v45 = int v44 = v11;
        char v49 = [v41 isEqual:v45];

        int v11 = v44;
        char v38 = v43;
        int v33 = v42;
      }
      if ((v11 | v52 | v51 | v50 | v33))
      {
        char v12 = 0;
      }
      else
      {
        unint64_t v46 = [(WFArticle *)self numberOfWords];
        if (v46 == [(WFArticle *)v5 numberOfWords]) {
          char v47 = v38;
        }
        else {
          char v47 = 0;
        }
        char v12 = v47 & v49;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (WFArticle)initWithTitle:(id)a3 author:(id)a4 publishedDate:(id)a5 body:(id)a6 excerpt:(id)a7 numberOfWords:(unint64_t)a8 mainImageURL:(id)a9 URL:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)WFArticle;
  v23 = [(WFArticle *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    title = v23->_title;
    v23->_title = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    author = v23->_author;
    v23->_author = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    publishedDate = v23->_publishedDate;
    v23->_publishedDate = (NSDate *)v28;

    uint64_t v30 = [v19 copy];
    body = v23->_body;
    v23->_body = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    excerpt = v23->_excerpt;
    v23->_excerpt = (NSString *)v32;

    v23->_numberOfWords = a8;
    uint64_t v34 = [v21 copy];
    mainImageURL = v23->_mainImageURL;
    v23->_mainImageURL = (NSURL *)v34;

    uint64_t v36 = [v22 copy];
    URL = v23->_URL;
    v23->_URL = (NSURL *)v36;
  }
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.article"];

  id v19 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"title"];
  v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"author"];
  unint64_t v6 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"publishedDate"];
  v7 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"body"];
  v8 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"excerpt"];
  v9 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"numberOfWords"];
  uint64_t v10 = [v9 integerValue];

  int v11 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"mainImageURL"];
  uint64_t v12 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"URL"];
  v13 = (void *)v12;
  if (v11)
  {
    v14 = [NSURL URLWithString:v11];
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = 0;
    if (v12)
    {
LABEL_3:
      v15 = [NSURL URLWithString:v13];
      id v16 = [a1 articleWithTitle:v19 author:v5 publishedDate:v6 body:v7 excerpt:v8 numberOfWords:v10 mainImageURL:v14 URL:v15];

      if (!v11) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  id v16 = [a1 articleWithTitle:v19 author:v5 publishedDate:v6 body:v7 excerpt:v8 numberOfWords:v10 mainImageURL:v14 URL:0];
  if (v11) {
LABEL_4:
  }

LABEL_5:
  return v16;
}

+ (WFArticle)articleWithTitle:(id)a3 author:(id)a4 publishedDate:(id)a5 body:(id)a6 excerpt:(id)a7 numberOfWords:(unint64_t)a8 mainImageURL:(id)a9 URL:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  uint64_t v24 = (void *)[objc_alloc((Class)a1) initWithTitle:v23 author:v22 publishedDate:v21 body:v20 excerpt:v19 numberOfWords:a8 mainImageURL:v18 URL:v17];

  return (WFArticle *)v24;
}

+ (id)mainImageURLFromHTML:(id)a3
{
  id v3 = +[WFRichTextContentItem normalizedHTMLDocumentFromHTML:a3];
  uint64_t v4 = [v3 dataUsingEncoding:4];

  id v5 = v4;
  htmlDocPtr Memory = htmlReadMemory((const char *)[v5 bytes], objc_msgSend(v5, "length"), 0, 0, 2049);
  v7 = xmlXPathNewContext(Memory);
  RootElement = xmlDocGetRootElement(Memory);
  xmlXPathObjectPtr v9 = xmlXPathNodeEval(RootElement, (const xmlChar *)"//img", v7);
  if (v9)
  {
    uint64_t v10 = v9;
    p_nodeNr = &v9->nodesetval->nodeNr;
    if (p_nodeNr)
    {
      uint64_t v12 = 0;
      v13 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
      do
      {
        if (v12 >= *p_nodeNr) {
          break;
        }
        Prop = xmlGetProp(*(const xmlNode **)(*((void *)p_nodeNr + 1) + 8 * v12), (const xmlChar *)"src");
        if (Prop)
        {
          v15 = Prop;
          id v16 = NSURL;
          id v17 = [NSString stringWithUTF8String:Prop];
          id v18 = [v16 URLWithString:v17];

          (*v13)(v15);
          if (v18) {
            goto LABEL_12;
          }
        }
        ++v12;
        p_nodeNr = &v10->nodesetval->nodeNr;
      }
      while (p_nodeNr);
      id v18 = 0;
    }
    else
    {
      id v18 = 0;
    }
LABEL_12:
    xmlXPathFreeObject(v10);
    xmlXPathFreeContext(v7);
    xmlFreeDoc(Memory);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (id)summaryOfParagraph:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  uint64_t v5 = [v3 length];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __32__WFArticle_summaryOfParagraph___block_invoke;
  v11[3] = &unk_264289BE0;
  id v6 = v4;
  id v12 = v6;
  id v7 = v3;
  id v13 = v7;
  v14 = v15;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 4, v11);
  v8 = v13;
  id v9 = v6;

  _Block_object_dispose(v15, 8);
  return v9;
}

void __32__WFArticle_summaryOfParagraph___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((unint64_t)[*(id *)(a1 + 32) length] <= 0xC7)
  {
    int v11 = *(void **)(a1 + 32);
    id v12 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a5, a6);
    [v11 appendString:v12];
  }
  if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 3) {
    *a7 = 1;
  }
}

+ (unint64_t)numberOfWordsInString:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v4 = [v3 length];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__WFArticle_numberOfWordsInString___block_invoke;
  v7[3] = &unk_264289BB8;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 3, v7);
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __35__WFArticle_numberOfWordsInString___block_invoke(uint64_t result)
{
  return result;
}

+ (void)fetchArticleFromURL:(id)a3 pageHTML:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFArticle.m", 83, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WFArticle_fetchArticleFromURL_pageHTML_completionHandler___block_invoke;
  block[3] = &unk_264289B90;
  id v19 = v11;
  id v20 = a1;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__WFArticle_fetchArticleFromURL_pageHTML_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v2 = (void *)get_SFReaderExtractorClass_softClass;
  uint64_t v22 = get_SFReaderExtractorClass_softClass;
  if (!get_SFReaderExtractorClass_softClass)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __get_SFReaderExtractorClass_block_invoke;
    v18[3] = &unk_26428AC60;
    v18[4] = &v19;
    __get_SFReaderExtractorClass_block_invoke((uint64_t)v18);
    v2 = (void *)v20[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v19, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __60__WFArticle_fetchArticleFromURL_pageHTML_completionHandler___block_invoke_2;
  id v14 = &unk_264289B68;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v16 = v5;
  uint64_t v17 = v6;
  id v7 = v4;
  id v15 = v7;
  uint64_t v8 = _Block_copy(&v11);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v10) {
    objc_msgSend(v7, "getExtractedDataForURL:withData:withCompletion:", v9, v10, v8, v11, v12, v13, v14);
  }
  else {
    objc_msgSend(v7, "getExtractedDataForURL:withCompletion:", v9, v8, v11, v12, v13, v14);
  }
}

void __60__WFArticle_fetchArticleFromURL_pageHTML_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v62[1] = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v53 = a3;
  id v5 = [v53 domain];
  uint64_t v6 = get_SFReaderExtractorErrorDomain();
  if (![v5 isEqualToString:v6])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v53 code];

  if (v7 != 1)
  {
LABEL_5:
    id v14 = v53;
    if (!v4 || v53)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_19;
    }
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    id v15 = (id *)getNSDocumentTypeDocumentOptionSymbolLoc_ptr;
    uint64_t v57 = getNSDocumentTypeDocumentOptionSymbolLoc_ptr;
    if (!getNSDocumentTypeDocumentOptionSymbolLoc_ptr)
    {
      id v16 = UIFoundationLibrary_20296();
      v55[3] = (uint64_t)dlsym(v16, "NSDocumentTypeDocumentOption");
      getNSDocumentTypeDocumentOptionSymbolLoc_ptr = v55[3];
      id v15 = (id *)v55[3];
    }
    _Block_object_dispose(&v54, 8);
    if (v15)
    {
      id v17 = *v15;
      id v58 = v17;
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2020000000;
      id v18 = (id *)getNSHTMLTextDocumentTypeSymbolLoc_ptr_20299;
      uint64_t v57 = getNSHTMLTextDocumentTypeSymbolLoc_ptr_20299;
      if (!getNSHTMLTextDocumentTypeSymbolLoc_ptr_20299)
      {
        uint64_t v19 = UIFoundationLibrary_20296();
        v55[3] = (uint64_t)dlsym(v19, "NSHTMLTextDocumentType");
        getNSHTMLTextDocumentTypeSymbolLoc_ptr_20299 = v55[3];
        id v18 = (id *)v55[3];
      }
      _Block_object_dispose(&v54, 8);
      if (v18)
      {
        id v20 = *v18;
        v60[0] = v20;
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x2020000000;
        uint64_t v21 = (id *)getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_20303;
        uint64_t v57 = getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_20303;
        if (!getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_20303)
        {
          uint64_t v22 = UIFoundationLibrary_20296();
          v55[3] = (uint64_t)dlsym(v22, "NSCharacterEncodingDocumentAttribute");
          getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_20303 = v55[3];
          uint64_t v21 = (id *)v55[3];
        }
        _Block_object_dispose(&v54, 8);
        if (v21)
        {
          id v59 = *v21;
          v60[1] = &unk_26C742040;
          id v23 = NSDictionary;
          id v24 = v59;
          int v50 = [v23 dictionaryWithObjects:v60 forKeys:&v58 count:2];

          id v25 = objc_alloc(MEMORY[0x263F086A0]);
          uint64_t v26 = [v4 body];
          int v51 = (void *)[v25 initWithData:v26 options:v50 documentAttributes:0 error:0];

          id v27 = [NSString alloc];
          uint64_t v28 = [v4 body];
          char v49 = (void *)[v27 initWithData:v28 encoding:4];

          v29 = [v4 publishedDate];
          uint64_t v30 = +[WFDateDetector datesInString:v29 error:0];
          v48 = [v30 firstObject];

          v31 = [v4 title];
          uint64_t v32 = [v4 author];
          int v33 = *(void **)(a1 + 48);
          uint64_t v34 = [v51 string];
          v35 = [v33 summaryOfParagraph:v34];
          uint64_t v36 = *(void **)(a1 + 48);
          v37 = [v51 string];
          uint64_t v38 = [v36 numberOfWordsInString:v37];
          objc_super v39 = [v4 mainImageURL];
          v40 = [v4 url];
          v41 = +[WFArticle articleWithTitle:v31 author:v32 publishedDate:v48 body:v49 excerpt:v35 numberOfWords:v38 mainImageURL:v39 URL:v40];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          goto LABEL_17;
        }
        unint64_t v46 = [MEMORY[0x263F08690] currentHandler];
        char v47 = [NSString stringWithUTF8String:"NSAttributedStringDocumentAttributeKey getNSCharacterEncodingDocumentAttribute(void)"];
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, @"WFArticle.m", 27, @"%s", dlerror());
      }
      else
      {
        int v44 = [MEMORY[0x263F08690] currentHandler];
        v45 = [NSString stringWithUTF8String:"NSAttributedStringDocumentAttributeKey getNSHTMLTextDocumentType(void)"];
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"WFArticle.m", 26, @"%s", dlerror());
      }
    }
    else
    {
      int v42 = [MEMORY[0x263F08690] currentHandler];
      char v43 = [NSString stringWithUTF8String:"NSAttributedStringDocumentReadingOptionKey getNSDocumentTypeDocumentOption(void)"];
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"WFArticle.m", 28, @"%s", dlerror());
    }
    __break(1u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = get_SFReaderExtractorErrorDomain();
  uint64_t v61 = *MEMORY[0x263F08320];
  uint64_t v11 = WFLocalizedString(@"An article could not be extracted from the given information.");
  v62[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v62 forKeys:&v61 count:1];
  id v13 = [v9 errorWithDomain:v10 code:1 userInfo:v12];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v13);

LABEL_17:
  id v14 = v53;
LABEL_19:
}

@end