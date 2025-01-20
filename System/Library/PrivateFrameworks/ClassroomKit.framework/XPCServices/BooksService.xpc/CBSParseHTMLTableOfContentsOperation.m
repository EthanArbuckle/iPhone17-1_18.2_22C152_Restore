@interface CBSParseHTMLTableOfContentsOperation
- (BOOL)isAsynchronous;
- (CBSParseHTMLTableOfContentsOperation)initWithFilePath:(id)a3 packageContents:(id)a4;
- (void)main;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
@end

@implementation CBSParseHTMLTableOfContentsOperation

- (CBSParseHTMLTableOfContentsOperation)initWithFilePath:(id)a3 packageContents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CBSParseHTMLTableOfContentsOperation;
  v9 = [(CBSParseHTMLTableOfContentsOperation *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mHTMLFilePath, a3);
    objc_storeStrong((id *)&v10->mPackageContents, a4);
    uint64_t v11 = objc_opt_new();
    mChapters = v10->mChapters;
    v10->mChapters = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    mParentChapters = v10->mParentChapters;
    v10->mParentChapters = (NSMutableArray *)v13;
  }
  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:self->mHTMLFilePath isDirectory:0];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSXMLParser);
    v6 = +[NSURL fileURLWithPath:self->mHTMLFilePath];
    id v7 = (NSXMLParser *)[v5 initWithContentsOfURL:v6];
    mHTMLParser = self->mHTMLParser;
    self->mHTMLParser = v7;

    [(NSXMLParser *)self->mHTMLParser setDelegate:self];
    v9 = self->mHTMLParser;
    [(NSXMLParser *)v9 parse];
  }
  else
  {
    [(CBSParseHTMLTableOfContentsOperation *)self endOperationWithResultObject:0];
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9 = a4;
  id v10 = a7;
  if ([v9 isEqualToString:@"nav"])
  {
    self->mIsInNav = 1;
  }
  else if (!self->mIsInNav)
  {
    goto LABEL_10;
  }
  if ([v9 isEqualToString:@"li"])
  {
    if (self->mCurrentChapter) {
      -[NSMutableArray addObject:](self->mParentChapters, "addObject:");
    }
    uint64_t v11 = (CRKChapter *)objc_opt_new();
    mCurrentChapter = self->mCurrentChapter;
    self->mCurrentChapter = v11;
  }
  else if ([v9 isEqualToString:@"a"])
  {
    uint64_t v13 = (NSMutableString *)objc_opt_new();
    mCurrentText = self->mCurrentText;
    self->mCurrentText = v13;

    mPackageContents = self->mPackageContents;
    objc_super v16 = [v10 objectForKeyedSubscript:@"href"];
    id v20 = 0;
    v17 = [(CBSOPFPackageContents *)mPackageContents itemIdentifierForHref:v16 fragment:&v20];
    id v18 = v20;

    v19 = [(CBSOPFPackageContents *)self->mPackageContents urlWithItemIdentifier:v17 fragment:v18];
    [(CRKChapter *)self->mCurrentChapter setWebURL:v19];
  }
LABEL_10:
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v19 = a4;
  if ([v19 isEqualToString:@"nav"])
  {
    self->mIsInNav = 0;
    goto LABEL_15;
  }
  if (self->mIsInNav)
  {
    if ([v19 isEqualToString:@"li"])
    {
      if ([(NSMutableArray *)self->mParentChapters count])
      {
        id v7 = [(NSMutableArray *)self->mParentChapters lastObject];
        [(NSMutableArray *)self->mParentChapters removeLastObject];
        id v8 = [(CRKChapter *)self->mCurrentChapter title];
        id v9 = [v8 length];

        if (v9)
        {
          id v10 = [v7 subchapters];
          uint64_t v11 = [v10 arrayByAddingObject:self->mCurrentChapter];
          [v7 setSubchapters:v11];
        }
        mCurrentChapter = self->mCurrentChapter;
        self->mCurrentChapter = (CRKChapter *)v7;
        goto LABEL_14;
      }
      uint64_t v13 = 40;
      v17 = [(CRKChapter *)self->mCurrentChapter title];
      id v18 = [v17 length];

      if (v18) {
        [(NSMutableArray *)self->mChapters addObject:self->mCurrentChapter];
      }
    }
    else
    {
      if (![v19 isEqualToString:@"a"]) {
        goto LABEL_15;
      }
      uint64_t v13 = 56;
      mCurrentText = self->mCurrentText;
      v15 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      objc_super v16 = [(NSMutableString *)mCurrentText stringByTrimmingCharactersInSet:v15];
      [(CRKChapter *)self->mCurrentChapter setTitle:v16];
    }
    mCurrentChapter = *(CRKChapter **)&self->CATOperation_opaque[v13];
    *(void *)&self->CATOperation_opaque[v13] = 0;
LABEL_14:
  }
LABEL_15:
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
}

- (void)parserDidEndDocument:(id)a3
{
  if ([(CBSParseHTMLTableOfContentsOperation *)self isExecuting])
  {
    mChapters = self->mChapters;
    [(CBSParseHTMLTableOfContentsOperation *)self endOperationWithResultObject:mChapters];
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5 = a4;
  if ([(CBSParseHTMLTableOfContentsOperation *)self isExecuting]) {
    [(CBSParseHTMLTableOfContentsOperation *)self endOperationWithError:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCurrentText, 0);
  objc_storeStrong((id *)&self->mParentChapters, 0);
  objc_storeStrong((id *)&self->mCurrentChapter, 0);
  objc_storeStrong((id *)&self->mChapters, 0);
  objc_storeStrong((id *)&self->mPackageContents, 0);
  objc_storeStrong((id *)&self->mHTMLFilePath, 0);

  objc_storeStrong((id *)&self->mHTMLParser, 0);
}

@end