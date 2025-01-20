@interface MWFeedParser
- (BOOL)createEnclosureFromAttributes:(id)a3 andAddToItem:(id)a4;
- (BOOL)didFail;
- (BOOL)isParsing;
- (BOOL)isStopped;
- (BOOL)parse;
- (BOOL)processAtomLink:(id)a3 andAddToMWObject:(id)a4;
- (MWFeedInfo)info;
- (MWFeedItem)item;
- (MWFeedParser)init;
- (MWFeedParser)initWithFeedRequest:(id)a3;
- (MWFeedParser)initWithFeedURL:(id)a3;
- (MWFeedParserDelegate)delegate;
- (NSDictionary)currentElementAttributes;
- (NSMutableString)currentText;
- (NSString)currentPath;
- (NSString)pathOfElementWithXHTMLType;
- (NSURL)url;
- (NSURLRequest)request;
- (NSURLSessionDataTask)urlTask;
- (NSXMLParser)feedParser;
- (int)feedParseType;
- (void)abortParsingEarly;
- (void)dispatchFeedInfoToDelegate;
- (void)dispatchFeedItemToDelegate;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCDATA:(id)a4;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parser:(id)a3 validationErrorOccurred:(id)a4;
- (void)parserDidStartDocument:(id)a3;
- (void)parsingFailedWithErrorCode:(int)a3 andDescription:(id)a4;
- (void)parsingFinished;
- (void)reset;
- (void)setCurrentElementAttributes:(id)a3;
- (void)setCurrentPath:(id)a3;
- (void)setCurrentText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedParseType:(int)a3;
- (void)setFeedParser:(id)a3;
- (void)setInfo:(id)a3;
- (void)setItem:(id)a3;
- (void)setPathOfElementWithXHTMLType:(id)a3;
- (void)setRequest:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUrlTask:(id)a3;
- (void)startParsingData:(id)a3 textEncodingName:(id)a4;
- (void)stopParsing;
@end

@implementation MWFeedParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->request, 0);
  objc_storeStrong((id *)&self->info, 0);
  objc_storeStrong((id *)&self->item, 0);
  objc_storeStrong((id *)&self->currentElementAttributes, 0);
  objc_storeStrong((id *)&self->currentText, 0);
  objc_storeStrong((id *)&self->currentPath, 0);
  objc_storeStrong((id *)&self->pathOfElementWithXHTMLType, 0);
  objc_storeStrong((id *)&self->url, 0);
  objc_storeStrong((id *)&self->dateFormatterRFC3339, 0);
  objc_storeStrong((id *)&self->dateFormatterRFC822, 0);
  objc_storeStrong((id *)&self->feedParser, 0);
  objc_storeStrong((id *)&self->urlTask, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (BOOL)isParsing
{
  return self->parsing;
}

- (BOOL)didFail
{
  return self->failed;
}

- (BOOL)isStopped
{
  return self->stopped;
}

- (void)setPathOfElementWithXHTMLType:(id)a3
{
}

- (NSString)pathOfElementWithXHTMLType
{
  return self->pathOfElementWithXHTMLType;
}

- (void)setInfo:(id)a3
{
}

- (MWFeedInfo)info
{
  return self->info;
}

- (void)setItem:(id)a3
{
}

- (MWFeedItem)item
{
  return self->item;
}

- (void)setCurrentElementAttributes:(id)a3
{
}

- (NSDictionary)currentElementAttributes
{
  return self->currentElementAttributes;
}

- (void)setCurrentText:(id)a3
{
}

- (NSMutableString)currentText
{
  return self->currentText;
}

- (void)setCurrentPath:(id)a3
{
}

- (NSString)currentPath
{
  return self->currentPath;
}

- (void)setFeedParser:(id)a3
{
}

- (NSXMLParser)feedParser
{
  return self->feedParser;
}

- (void)setFeedParseType:(int)a3
{
  self->feedParseType = a3;
}

- (int)feedParseType
{
  return self->feedParseType;
}

- (void)setUrlTask:(id)a3
{
}

- (NSURLSessionDataTask)urlTask
{
  return self->urlTask;
}

- (void)setDelegate:(id)a3
{
}

- (MWFeedParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (MWFeedParserDelegate *)WeakRetained;
}

- (void)setRequest:(id)a3
{
}

- (NSURLRequest)request
{
  return self->request;
}

- (NSURL)url
{
  return self->url;
}

- (BOOL)processAtomLink:(id)a3 andAddToMWObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 objectForKey:@"rel"];

    if (v8)
    {
      v9 = [v6 objectForKey:@"rel"];
      int v10 = [v9 isEqualToString:@"alternate"];

      if (!v10)
      {
        v11 = [v6 objectForKey:@"rel"];
        int v12 = [v11 isEqualToString:@"enclosure"];

        if (v12 && [v7 isMemberOfClass:objc_opt_class()])
        {
          [(MWFeedParser *)self createEnclosureFromAttributes:v6 andAddToItem:v7];
LABEL_10:
          LOBYTE(v13) = 1;
          goto LABEL_11;
        }
        goto LABEL_7;
      }
    }
    else
    {
      v13 = [v6 objectForKey:@"href"];

      if (!v13) {
        goto LABEL_11;
      }
    }
    v14 = [v6 objectForKey:@"href"];
    [v7 setLink:v14];

    goto LABEL_10;
  }
LABEL_7:
  LOBYTE(v13) = 0;
LABEL_11:

  return (char)v13;
}

- (BOOL)createEnclosureFromAttributes:(id)a3 andAddToItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_17;
  }
  int feedType = self->feedType;
  switch(feedType)
  {
    case 1:
      v9 = @"length";
      int v10 = @"type";
      v11 = @"url";
      break;
    case 3:
      int v12 = [v6 objectForKey:@"rel"];
      int v13 = [v12 isEqualToString:@"enclosure"];

      if (!v13) {
        goto LABEL_17;
      }
      v9 = @"length";
      int v10 = @"type";
      v11 = @"href";
      break;
    case 2:
      v9 = @"enc:length";
      int v10 = @"enc:type";
      v11 = @"rdf:resource";
      break;
    default:
LABEL_17:
      BOOL v24 = 0;
      v20 = 0;
      v14 = 0;
      v15 = 0;
      v18 = 0;
      goto LABEL_18;
  }
  v14 = [v6 objectForKey:v11];
  v15 = [v6 objectForKey:v10];
  v16 = NSNumber;
  v17 = [v6 objectForKey:v9];
  v18 = objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "longLongValue"));

  if (v14)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    [v19 setObject:v14 forKey:@"url"];
    if (v15) {
      [v19 setObject:v15 forKey:@"type"];
    }
    if (v18) {
      [v19 setObject:v18 forKey:@"length"];
    }
    v20 = [NSDictionary dictionaryWithDictionary:v19];

    if (v20)
    {
      v21 = [v7 enclosures];

      if (v21)
      {
        v22 = [v7 enclosures];
        v23 = [v22 arrayByAddingObject:v20];
        [v7 setEnclosures:v23];
      }
      else
      {
        v22 = [MEMORY[0x263EFF8C0] arrayWithObject:v20];
        [v7 setEnclosures:v22];
      }

      BOOL v24 = 1;
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
    v20 = 0;
  }
LABEL_18:

  return v24;
}

- (void)setUrl:(id)a3
{
  id v16 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [NSURL URLWithString:v16];

    v5 = (void *)v4;
  }
  else
  {
    v5 = v16;
  }
  id v17 = v5;
  if (v5)
  {
    id v6 = [v5 scheme];
    int v7 = [v6 isEqualToString:@"feed"];

    if (v7)
    {
      v8 = NSURL;
      v9 = NSString;
      int v10 = [v17 resourceSpecifier];
      if ([v10 hasPrefix:@"//"]) {
        v11 = @"http:";
      }
      else {
        v11 = &stru_26F008428;
      }
      int v12 = [v17 resourceSpecifier];
      int v13 = [v9 stringWithFormat:@"%@%@", v11, v12];
      v14 = [v8 URLWithString:v13];
    }
    else
    {
      v14 = (NSURL *)[v17 copy];
    }
  }
  else
  {
    v14 = 0;
  }
  url = self->url;
  self->url = v14;
}

- (void)dispatchFeedItemToDelegate
{
  item = self->item;
  if (!item) {
    return;
  }
  uint64_t v4 = [(MWFeedItem *)item summary];

  if (!v4)
  {
    v5 = [(MWFeedItem *)self->item content];
    [(MWFeedItem *)self->item setSummary:v5];

    [(MWFeedItem *)self->item setContent:0];
  }
  id v6 = [(MWFeedItem *)self->item date];
  if (v6) {
    goto LABEL_7;
  }
  int v7 = [(MWFeedItem *)self->item updated];

  if (v7)
  {
    id v6 = [(MWFeedItem *)self->item updated];
    [(MWFeedItem *)self->item setDate:v6];
LABEL_7:
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->delegate);
    [v10 feedParser:self didParseFeedItem:self->item];
  }
  [(MWFeedParser *)self setItem:0];
}

- (void)dispatchFeedInfoToDelegate
{
  if (self->info)
  {
    p_delegate = &self->delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      [v6 feedParser:self didParseFeedInfo:self->info];
    }
    [(MWFeedParser *)self setInfo:0];
  }
}

- (void)parser:(id)a3 validationErrorOccurred:(id)a4
{
  objc_msgSend(a4, "localizedDescription", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MWFeedParser *)self parsingFailedWithErrorCode:4 andDescription:v5];
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  if (!self->aborted)
  {
    objc_msgSend(a4, "localizedDescription", a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(MWFeedParser *)self parsingFailedWithErrorCode:3 andDescription:v5];
  }
}

- (void)parserDidStartDocument:(id)a3
{
  p_delegate = &self->delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 feedParserDidStart:self];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  currentText = self->currentText;
  if (self->parseStructureAsContent)
  {
    objc_msgSend(a4, "stringByEncodingHTMLEntities", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableString *)currentText appendString:v6];
  }
  else
  {
    id v5 = self->currentText;
    [(NSMutableString *)v5 appendString:a4];
  }
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  if (v7 || (id v7 = (void *)[[NSString alloc] initWithData:v6 encoding:5]) != 0) {
    [(NSMutableString *)self->currentText appendString:v7];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v33 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = (void *)MEMORY[0x23ECE6170]();
  if (self->parseStructureAsContent)
  {
    unint64_t v14 = [(NSString *)self->currentPath length];
    if (v14 > [(NSString *)self->pathOfElementWithXHTMLType length])
    {
      if (([v10 isEqualToString:@"br"] & 1) == 0
        && ([v10 isEqualToString:@"img"] & 1) == 0
        && ([v10 isEqualToString:@"input"] & 1) == 0
        && ([v10 isEqualToString:@"hr"] & 1) == 0
        && ([v10 isEqualToString:@"link"] & 1) == 0
        && ([v10 isEqualToString:@"base"] & 1) == 0
        && ([v10 isEqualToString:@"basefont"] & 1) == 0
        && ([v10 isEqualToString:@"frame"] & 1) == 0
        && ([v10 isEqualToString:@"meta"] & 1) == 0
        && ([v10 isEqualToString:@"area"] & 1) == 0
        && ([v10 isEqualToString:@"col"] & 1) == 0
        && ([v10 isEqualToString:@"param"] & 1) == 0)
      {
        [(NSMutableString *)self->currentText appendFormat:@"</%@>", v10];
      }
      goto LABEL_66;
    }
    self->parseStructureAsContent = 0;
    [(MWFeedParser *)self setPathOfElementWithXHTMLType:0];
  }
  currentText = self->currentText;
  if (currentText)
  {
    id v16 = [(NSMutableString *)currentText stringByRemovingNewLinesAndWhitespace];
    int feedType = self->feedType;
    if (feedType != 3)
    {
      if (feedType != 2)
      {
        if (feedType != 1) {
          goto LABEL_99;
        }
        if (![(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/title"])
        {
          if (![(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/link"])
          {
            if (![(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/author"]
              && ![(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/dc:creator"])
            {
              if (![(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/guid"])
              {
                if (![(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/description"])
                {
                  if (![(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/content:encoded"])
                  {
                    if ([(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/pubDate"])
                    {
                      if ([v16 length])
                      {
                        v18 = (void *)MEMORY[0x263EFF910];
                        v19 = v16;
                        uint64_t v20 = 1;
LABEL_73:
                        v25 = [v18 dateFromInternetDateTimeString:v19 formatHint:v20];
                        [(MWFeedItem *)self->item setDate:v25];
                        goto LABEL_74;
                      }
                      goto LABEL_65;
                    }
                    if ([(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/enclosure"])
                    {
LABEL_81:
                      [(MWFeedParser *)self createEnclosureFromAttributes:self->currentElementAttributes andAddToItem:self->item];
                      goto LABEL_65;
                    }
                    if (![(NSString *)self->currentPath isEqualToString:@"/rss/channel/item/dc:date"])
                    {
                      if (self->feedParseType != 1)
                      {
                        if ([(NSString *)self->currentPath isEqualToString:@"/rss/channel/title"])
                        {
                          goto LABEL_90;
                        }
                        if ([(NSString *)self->currentPath isEqualToString:@"/rss/channel/description"])
                        {
                          goto LABEL_93;
                        }
                        currentPath = self->currentPath;
                        v29 = @"/rss/channel/link";
LABEL_96:
                        if ([(NSString *)currentPath isEqualToString:v29])
                        {
                          if (![v16 length]) {
                            goto LABEL_65;
                          }
                          info = self->info;
                          goto LABEL_42;
                        }
                      }
LABEL_99:

                      goto LABEL_100;
                    }
LABEL_71:
                    if ([v16 length])
                    {
                      v18 = (void *)MEMORY[0x263EFF910];
                      v19 = v16;
                      uint64_t v20 = 2;
                      goto LABEL_73;
                    }
LABEL_65:

LABEL_66:
                    v27 = [(NSString *)self->currentPath stringByDeletingLastPathComponent];
                    [(MWFeedParser *)self setCurrentPath:v27];

                    goto LABEL_67;
                  }
LABEL_57:
                  if ([v16 length]) {
                    [(MWFeedItem *)self->item setContent:v16];
                  }
                  goto LABEL_65;
                }
LABEL_53:
                if (![v16 length]) {
                  goto LABEL_65;
                }
                item = self->item;
LABEL_55:
                [item setSummary:v16];
                goto LABEL_65;
              }
LABEL_60:
              if ([v16 length]) {
                [(MWFeedItem *)self->item setIdentifier:v16];
              }
              goto LABEL_65;
            }
            goto LABEL_63;
          }
LABEL_40:
          if (![v16 length]) {
            goto LABEL_65;
          }
          info = self->item;
LABEL_42:
          [info setLink:v16];
          goto LABEL_65;
        }
LABEL_36:
        if (![v16 length]) {
          goto LABEL_65;
        }
        v23 = self->item;
LABEL_38:
        [v23 setTitle:v16];
        goto LABEL_65;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item/title"]) {
        goto LABEL_36;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item/link"]) {
        goto LABEL_40;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item/description"]) {
        goto LABEL_53;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item/content:encoded"]) {
        goto LABEL_57;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item/dc:identifier"]) {
        goto LABEL_60;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item/dc:creator"])
      {
LABEL_63:
        if ([v16 length]) {
          [(MWFeedItem *)self->item setAuthor:v16];
        }
        goto LABEL_65;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item/dc:date"]) {
        goto LABEL_71;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item/enc:enclosure"]) {
        goto LABEL_81;
      }
      if (self->feedParseType == 1) {
        goto LABEL_99;
      }
      if (![(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/channel/title"])
      {
        if (![(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/channel/description"])
        {
          currentPath = self->currentPath;
          v29 = @"/rdf:RDF/channel/link";
          goto LABEL_96;
        }
LABEL_93:
        if (![v16 length]) {
          goto LABEL_65;
        }
        item = self->info;
        goto LABEL_55;
      }
LABEL_90:
      if (![v16 length]) {
        goto LABEL_65;
      }
      v23 = self->info;
      goto LABEL_38;
    }
    if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry/title"]) {
      goto LABEL_36;
    }
    if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry/link"])
    {
      currentElementAttributes = self->currentElementAttributes;
      v22 = self->item;
    }
    else
    {
      if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry/id"]) {
        goto LABEL_60;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry/summary"]) {
        goto LABEL_53;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry/content"]) {
        goto LABEL_57;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry/author/name"]
        || [(NSString *)self->currentPath isEqualToString:@"/feed/entry/dc:creator"])
      {
        goto LABEL_63;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry/published"]) {
        goto LABEL_71;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry/updated"])
      {
        if ([v16 length])
        {
          v25 = [MEMORY[0x263EFF910] dateFromInternetDateTimeString:v16 formatHint:2];
          [(MWFeedItem *)self->item setUpdated:v25];
LABEL_74:

          goto LABEL_65;
        }
        goto LABEL_65;
      }
      if (self->feedParseType == 1) {
        goto LABEL_99;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/feed/title"]) {
        goto LABEL_90;
      }
      if ([(NSString *)self->currentPath isEqualToString:@"/feed/description"]) {
        goto LABEL_93;
      }
      if (![(NSString *)self->currentPath isEqualToString:@"/feed/link"]) {
        goto LABEL_99;
      }
      currentElementAttributes = self->currentElementAttributes;
      v22 = self->info;
    }
    [(MWFeedParser *)self processAtomLink:currentElementAttributes andAddToMWObject:v22];
    goto LABEL_65;
  }
LABEL_100:
  v30 = [(NSString *)self->currentPath stringByDeletingLastPathComponent];
  [(MWFeedParser *)self setCurrentPath:v30];

  int v31 = self->feedType;
  if ((v31 - 1) <= 1)
  {
    if ([v12 isEqualToString:@"item"])
    {
LABEL_105:
      [(MWFeedParser *)self dispatchFeedItemToDelegate];
      goto LABEL_106;
    }
    int v31 = self->feedType;
  }
  if (v31 == 3 && [v12 isEqualToString:@"entry"]) {
    goto LABEL_105;
  }
LABEL_106:
  int v32 = self->feedType;
  if (v32 == 1)
  {
    if ([v12 isEqualToString:@"rss"]) {
      goto LABEL_114;
    }
    int v32 = self->feedType;
  }
  if (v32 != 2)
  {
LABEL_112:
    if (v32 != 3 || ![v12 isEqualToString:@"feed"]) {
      goto LABEL_67;
    }
    goto LABEL_114;
  }
  if (([v12 isEqualToString:@"rdf:RDF"] & 1) == 0)
  {
    int v32 = self->feedType;
    goto LABEL_112;
  }
LABEL_114:
  if (self->info && self->feedParseType != 1) {
    [(MWFeedParser *)self dispatchFeedInfoToDelegate];
  }
LABEL_67:
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)MEMORY[0x23ECE6170]();
  v18 = [(NSString *)self->currentPath stringByAppendingPathComponent:v15];
  [(MWFeedParser *)self setCurrentPath:v18];

  [(MWFeedParser *)self setCurrentElementAttributes:v16];
  if (self->parseStructureAsContent)
  {
    id v37 = v15;
    id v38 = v14;
    v39 = v13;
    id v40 = v12;
    [(NSMutableString *)self->currentText appendFormat:@"<%@", v13];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v36 = v16;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          currentText = self->currentText;
          v26 = [v19 objectForKey:v24];
          v27 = [v26 stringByEncodingHTMLEntities];
          [(NSMutableString *)currentText appendFormat:@" %@=\"%@\"", v24, v27];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v21);
    }

    id v13 = v39;
    if (([v39 isEqualToString:@"br"] & 1) != 0
      || ([v39 isEqualToString:@"img"] & 1) != 0
      || ([v39 isEqualToString:@"input"] & 1) != 0
      || ([v39 isEqualToString:@"hr"] & 1) != 0
      || ([v39 isEqualToString:@"link"] & 1) != 0
      || ([v39 isEqualToString:@"base"] & 1) != 0
      || ([v39 isEqualToString:@"basefont"] & 1) != 0
      || ([v39 isEqualToString:@"frame"] & 1) != 0
      || ([v39 isEqualToString:@"meta"] & 1) != 0
      || ([v39 isEqualToString:@"area"] & 1) != 0
      || ([v39 isEqualToString:@"col"] & 1) != 0
      || [v39 isEqualToString:@"param"])
    {
      v28 = self->currentText;
      v29 = @" />";
    }
    else
    {
      v28 = self->currentText;
      v29 = @">";
    }
    [(NSMutableString *)v28 appendString:v29];
    id v12 = v40;
    id v15 = v37;
    id v14 = v38;
    id v16 = v36;
    goto LABEL_23;
  }
  v30 = [(MWFeedParser *)self currentText];
  [v30 setString:&stru_26F008428];

  int feedType = self->feedType;
  if (!feedType)
  {
    if ([v15 isEqualToString:@"rss"])
    {
      int v32 = 1;
    }
    else if ([v15 isEqualToString:@"rdf:RDF"])
    {
      int v32 = 2;
    }
    else
    {
      if (![v15 isEqualToString:@"feed"])
      {
        [(MWFeedParser *)self parsingFailedWithErrorCode:3 andDescription:@"XML document is not a valid web feed document."];
        goto LABEL_23;
      }
      int v32 = 3;
    }
    self->int feedType = v32;
    goto LABEL_23;
  }
  if (self->feedParseType != 1)
  {
    if (feedType == 1)
    {
      if ([(NSString *)self->currentPath isEqualToString:@"/rss/channel"]) {
        goto LABEL_23;
      }
      int feedType = self->feedType;
    }
    if (feedType == 2)
    {
      if ([(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/channel"]) {
        goto LABEL_23;
      }
      int feedType = self->feedType;
    }
    if (feedType == 3)
    {
      if ([(NSString *)self->currentPath isEqualToString:@"/feed"]) {
        goto LABEL_23;
      }
      int feedType = self->feedType;
    }
  }
  if (feedType == 1)
  {
    if ([(NSString *)self->currentPath isEqualToString:@"/rss/channel/item"]) {
      goto LABEL_43;
    }
    int feedType = self->feedType;
  }
  if (feedType == 2)
  {
    if (![(NSString *)self->currentPath isEqualToString:@"/rdf:RDF/item"])
    {
      int feedType = self->feedType;
      goto LABEL_41;
    }
LABEL_43:
    if (self->hasEncounteredItems
      || (self->hasEncounteredItems = 1, self->feedParseType == 1)
      || ([(MWFeedParser *)self dispatchFeedInfoToDelegate], self->feedParseType != 2))
    {
      id v33 = objc_alloc_init(MWFeedItem);
      [(MWFeedParser *)self setItem:v33];
    }
    else
    {
      [(MWFeedParser *)self abortParsingEarly];
    }
    goto LABEL_23;
  }
LABEL_41:
  if (feedType != 3) {
    goto LABEL_23;
  }
  if ([(NSString *)self->currentPath isEqualToString:@"/feed/entry"]) {
    goto LABEL_43;
  }
  if (self->feedType == 3)
  {
    v34 = [v16 objectForKey:@"type"];
    v35 = v34;
    if (v34 && [v34 isEqualToString:@"xhtml"])
    {
      self->parseStructureAsContent = 1;
      [(MWFeedParser *)self setPathOfElementWithXHTMLType:self->currentPath];
    }
  }
LABEL_23:
}

- (void)parsingFailedWithErrorCode:(int)a3 andDescription:(id)a4
{
  if (!self->parsingComplete)
  {
    *(_WORD *)&self->failed = 257;
    self->parsing = 0;
    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = a3;
    id v7 = [NSDictionary dictionaryWithObject:a4 forKey:*MEMORY[0x263F08320]];
    uint64_t v13 = [v5 errorWithDomain:@"MWFeedParser" code:v6 userInfo:v7];

    feedParser = self->feedParser;
    if (feedParser)
    {
      self->aborted = 1;
      [(NSXMLParser *)feedParser abortParsing];
    }
    [(MWFeedParser *)self reset];
    id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    char v10 = objc_opt_respondsToSelector();

    id v11 = (void *)v13;
    if (v10)
    {
      id v12 = objc_loadWeakRetained((id *)&self->delegate);
      [v12 feedParser:self didFailWithError:v13];

      id v11 = (void *)v13;
    }
  }
}

- (void)parsingFinished
{
  if (!self->parsingComplete)
  {
    self->parsing = 0;
    self->parsingComplete = 1;
    p_delegate = &self->delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      [v6 feedParserDidFinish:self];
    }
    [(MWFeedParser *)self reset];
  }
}

- (void)stopParsing
{
  if (self->parsing && !self->parsingComplete)
  {
    self->stopped = 1;
    [(NSURLSessionDataTask *)self->urlTask cancel];
    [(MWFeedParser *)self setUrlTask:0];
    self->aborted = 1;
    [(NSXMLParser *)self->feedParser abortParsing];
    [(MWFeedParser *)self parsingFinished];
  }
}

- (void)abortParsingEarly
{
  self->aborted = 1;
  [(NSXMLParser *)self->feedParser abortParsing];
  [(MWFeedParser *)self parsingFinished];
}

- (void)startParsingData:(id)a3 textEncodingName:(id)a4
{
  id v24 = a3;
  id v6 = (__CFString *)a4;
  if (!v24)
  {
    id v24 = 0;
    goto LABEL_28;
  }
  if (self->feedParser) {
    goto LABEL_28;
  }
  id v7 = objc_alloc_init(MWFeedInfo);
  id v8 = [(MWFeedParser *)self url];
  [(MWFeedInfo *)v7 setUrl:v8];

  [(MWFeedParser *)self setInfo:v7];
  char v9 = [(__CFString *)v6 lowercaseString];
  char v10 = [v9 isEqualToString:@"utf-8"];

  if (v10) {
    goto LABEL_18;
  }
  if (v6
    && (CFStringEncoding v11 = CFStringConvertIANACharSetNameToEncoding(v6), v11 != -1)
    && (unint64_t v12 = CFStringConvertEncodingToNSStringEncoding(v11)) != 0
    && (uint64_t v13 = (void *)[[NSString alloc] initWithData:v24 encoding:v12]) != 0
    || (uint64_t v13 = (void *)[[NSString alloc] initWithData:v24 encoding:4]) != 0
    || (uint64_t v13 = (void *)[[NSString alloc] initWithData:v24 encoding:5]) != 0)
  {
  }
  else
  {
    uint64_t v13 = (void *)[[NSString alloc] initWithData:v24 encoding:30];

    if (!v13) {
      goto LABEL_26;
    }
  }
  if ([v13 hasPrefix:@"<?xml"])
  {
    uint64_t v14 = [v13 rangeOfString:@"?>"];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v15 = [v13 substringToIndex:v14];
      if ([v15 rangeOfString:@"encoding=\"UTF-8\"" options:1] != 0x7FFFFFFFFFFFFFFFLL
        || (uint64_t v16 = [v15 rangeOfString:@"encoding=\""], v16 == 0x7FFFFFFFFFFFFFFFLL)
        || (uint64_t v18 = v16,
            uint64_t v19 = objc_msgSend(v15, "rangeOfString:options:range:", @"\", 0, v16 + v17, objc_msgSend(v15, "length"") - (v16 + v17)), v19 == 0x7FFFFFFFFFFFFFFFLL))
      {
      }
      else
      {
        uint64_t v23 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", v18, v20 - v18 + v19, @"encoding=\"UTF-8\"");

        uint64_t v13 = (void *)v23;
        if (!v23) {
          goto LABEL_26;
        }
      }
    }
  }
  id v24 = [v13 dataUsingEncoding:4];

  if (v24)
  {
LABEL_18:
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F08D58]) initWithData:v24];
    [(MWFeedParser *)self setFeedParser:v21];
    feedParser = self->feedParser;
    if (feedParser)
    {
      [(NSXMLParser *)feedParser setDelegate:self];
      [(NSXMLParser *)self->feedParser setShouldProcessNamespaces:1];
      [(NSXMLParser *)self->feedParser parse];
      [(MWFeedParser *)self setFeedParser:0];
    }
    else
    {
      [(MWFeedParser *)self parsingFailedWithErrorCode:3 andDescription:@"Feed not a valid XML document"];
    }

    goto LABEL_27;
  }
LABEL_26:
  [(MWFeedParser *)self parsingFailedWithErrorCode:3 andDescription:@"Error with feed encoding"];
  id v24 = 0;
LABEL_27:

LABEL_28:
}

- (BOOL)parse
{
  [(MWFeedParser *)self reset];
  if (self->url
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->delegate), WeakRetained, WeakRetained))
  {
    if (!self->parsing)
    {
      *(_DWORD *)&self->aborted = 256;
      self->parsingComplete = 0;
      id v8 = [MEMORY[0x263EFC648] defaultSessionConfiguration];
      [v8 setURLCache:0];
      char v9 = [MEMORY[0x263EFC640] sessionWithConfiguration:v8];
      char v10 = [(MWFeedParser *)self request];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __21__MWFeedParser_parse__block_invoke;
      v13[3] = &unk_264E58688;
      v13[4] = self;
      CFStringEncoding v11 = [v9 dataTaskWithRequest:v10 completionHandler:v13];
      urlTask = self->urlTask;
      self->urlTask = v11;

      [(NSURLSessionDataTask *)self->urlTask resume];
      return 1;
    }
    uint64_t v4 = @"Cannot start parsing as parsing is already in progress";
    char v5 = self;
    uint64_t v6 = 5;
  }
  else
  {
    uint64_t v4 = @"Delegate or URL not specified";
    char v5 = self;
    uint64_t v6 = 1;
  }
  [(MWFeedParser *)v5 parsingFailedWithErrorCode:v6 andDescription:v4];
  return 0;
}

void __21__MWFeedParser_parse__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  char v9 = *(unsigned char **)(a1 + 32);
  if (!v13 || v8)
  {
    [*(id *)(a1 + 32) setUrlTask:0];
    CFStringEncoding v11 = *(void **)(a1 + 32);
    unint64_t v12 = [v8 localizedDescription];
    [v11 parsingFailedWithErrorCode:2 andDescription:v12];
  }
  else
  {
    if (!v9[74])
    {
      char v10 = [v7 textEncodingName];
      [v9 startParsingData:v13 textEncodingName:v10];

      char v9 = *(unsigned char **)(a1 + 32);
    }
    [v9 setUrlTask:0];
  }
}

- (void)reset
{
  [(MWFeedParser *)self setUrlTask:0];
  self->int feedType = 0;
  [(MWFeedParser *)self setCurrentPath:@"/"];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [(MWFeedParser *)self setCurrentText:v3];

  [(MWFeedParser *)self setItem:0];
  [(MWFeedParser *)self setInfo:0];
  [(MWFeedParser *)self setCurrentElementAttributes:0];
  self->parseStructureAsContent = 0;
  [(MWFeedParser *)self setPathOfElementWithXHTMLType:0];
  self->hasEncounteredItems = 0;
}

- (MWFeedParser)initWithFeedRequest:(id)a3
{
  id v4 = a3;
  char v5 = [(MWFeedParser *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 URL];
    [(MWFeedParser *)v5 setUrl:v6];

    [(MWFeedParser *)v5 setRequest:v4];
  }

  return v5;
}

- (MWFeedParser)initWithFeedURL:(id)a3
{
  id v4 = a3;
  char v5 = [(MWFeedParser *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [NSURL URLWithString:v4];

      id v4 = (id)v6;
    }
    [(MWFeedParser *)v5 setUrl:v4];
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v5->url cachePolicy:4 timeoutInterval:60.0];
    [v7 _setNonAppInitiated:1];
    [v7 setValue:@"MWFeedParser" forHTTPHeaderField:@"User-Agent"];
    [(MWFeedParser *)v5 setRequest:v7];
  }
  return v5;
}

- (MWFeedParser)init
{
  v14.receiver = self;
  v14.super_class = (Class)MWFeedParser;
  v2 = [(MWFeedParser *)&v14 init];
  id v3 = v2;
  if (v2)
  {
    v2->feedParseType = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    char v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatterRFC822 = v3->dateFormatterRFC822;
    v3->dateFormatterRFC822 = v5;

    id v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatterRFC3339 = v3->dateFormatterRFC3339;
    v3->dateFormatterRFC3339 = v7;

    [(NSDateFormatter *)v3->dateFormatterRFC822 setLocale:v4];
    [(NSDateFormatter *)v3->dateFormatterRFC3339 setLocale:v4];
    char v9 = v3->dateFormatterRFC822;
    char v10 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [(NSDateFormatter *)v9 setTimeZone:v10];

    CFStringEncoding v11 = v3->dateFormatterRFC3339;
    unint64_t v12 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
    [(NSDateFormatter *)v11 setTimeZone:v12];
  }
  return v3;
}

@end