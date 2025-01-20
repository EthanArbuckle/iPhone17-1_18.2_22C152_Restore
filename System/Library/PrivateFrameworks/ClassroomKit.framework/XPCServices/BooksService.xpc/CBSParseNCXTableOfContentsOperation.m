@interface CBSParseNCXTableOfContentsOperation
- (BOOL)isAsynchronous;
- (CBSParseNCXTableOfContentsOperation)initWithFilePath:(id)a3 packageContents:(id)a4;
- (void)main;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
@end

@implementation CBSParseNCXTableOfContentsOperation

- (CBSParseNCXTableOfContentsOperation)initWithFilePath:(id)a3 packageContents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CBSParseNCXTableOfContentsOperation;
  v9 = [(CBSParseNCXTableOfContentsOperation *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mNCXFilePath, a3);
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
  unsigned int v4 = [v3 fileExistsAtPath:self->mNCXFilePath isDirectory:0];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSXMLParser);
    v6 = +[NSURL fileURLWithPath:self->mNCXFilePath];
    id v7 = (NSXMLParser *)[v5 initWithContentsOfURL:v6];
    mNCXParser = self->mNCXParser;
    self->mNCXParser = v7;

    [(NSXMLParser *)self->mNCXParser setDelegate:self];
    v9 = self->mNCXParser;
    [(NSXMLParser *)v9 parse];
  }
  else
  {
    [(CBSParseNCXTableOfContentsOperation *)self endOperationWithResultObject:0];
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9 = a4;
  id v10 = a7;
  if ([v9 isEqualToString:@"navPoint"])
  {
    if (self->mCurrentChapter) {
      -[NSMutableArray addObject:](self->mParentChapters, "addObject:");
    }
    uint64_t v11 = (CRKChapter *)objc_opt_new();
    mCurrentChapter = self->mCurrentChapter;
    self->mCurrentChapter = v11;
  }
  else if ([v9 isEqualToString:@"navLabel"])
  {
    uint64_t v13 = (NSMutableString *)objc_opt_new();
    mCurrentText = self->mCurrentText;
    self->mCurrentText = v13;
  }
  else if ([v9 isEqualToString:@"content"])
  {
    mPackageContents = self->mPackageContents;
    objc_super v16 = [v10 objectForKeyedSubscript:@"src"];
    id v21 = 0;
    v17 = [(CBSOPFPackageContents *)mPackageContents itemIdentifierForHref:v16 fragment:&v21];
    id v18 = v21;

    v19 = [(CBSOPFPackageContents *)self->mPackageContents urlWithItemIdentifier:v17 fragment:v18];
    [(CRKChapter *)self->mCurrentChapter setWebURL:v19];
  }
  mCurrentElementName = self->mCurrentElementName;
  self->mCurrentElementName = (NSString *)v9;
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v19 = a4;
  if ([v19 isEqualToString:@"navPoint"])
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
      goto LABEL_11;
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
    if (![v19 isEqualToString:@"navLabel"]) {
      goto LABEL_12;
    }
    uint64_t v13 = 56;
    mCurrentText = self->mCurrentText;
    v15 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    objc_super v16 = [(NSMutableString *)mCurrentText stringByTrimmingCharactersInSet:v15];
    [(CRKChapter *)self->mCurrentChapter setTitle:v16];
  }
  mCurrentChapter = *(CRKChapter **)&self->CATOperation_opaque[v13];
  *(void *)&self->CATOperation_opaque[v13] = 0;
LABEL_11:

LABEL_12:
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  if ([(NSString *)self->mCurrentElementName isEqualToString:@"text"]) {
    [(NSMutableString *)self->mCurrentText appendString:v5];
  }
}

- (void)parserDidEndDocument:(id)a3
{
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCurrentElementName, 0);
  objc_storeStrong((id *)&self->mCurrentText, 0);
  objc_storeStrong((id *)&self->mParentChapters, 0);
  objc_storeStrong((id *)&self->mCurrentChapter, 0);
  objc_storeStrong((id *)&self->mChapters, 0);
  objc_storeStrong((id *)&self->mPackageContents, 0);
  objc_storeStrong((id *)&self->mNCXFilePath, 0);

  objc_storeStrong((id *)&self->mNCXParser, 0);
}

@end