@interface ENMLUtility
+ (id)mediaTagWithDataHash:(id)a3 mime:(id)a4;
- (BOOL)shouldIgnoreNextEndElement;
- (BOOL)shouldInlineResources;
- (KSHTMLWriter)htmlWriter;
- (NSArray)resources;
- (NSMutableString)outputHTML;
- (NSXMLParser)xmlParser;
- (id)completionBlock;
- (void)convertENMLToHTML:(id)a3 withResources:(id)a4 inlineResources:(BOOL)a5 completionBlock:(id)a6;
- (void)generateHTMLFromENML:(id)a3 completion:(id)a4;
- (void)generateHTMLFromENML:(id)a3 inlinedResources:(id)a4 completion:(id)a5;
- (void)generateHTMLFromENML:(id)a3 referencedResources:(id)a4 completion:(id)a5;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCDATA:(id)a4;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 foundComment:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setHtmlWriter:(id)a3;
- (void)setOutputHTML:(id)a3;
- (void)setResources:(id)a3;
- (void)setShouldIgnoreNextEndElement:(BOOL)a3;
- (void)setShouldInlineResources:(BOOL)a3;
- (void)setXmlParser:(id)a3;
- (void)writeImageTagForResource:(id)a3 withAttributes:(id)a4;
- (void)writeResource:(id)a3 withAttributes:(id)a4;
- (void)writeTodoWithAttributes:(id)a3;
@end

@implementation ENMLUtility

+ (id)mediaTagWithDataHash:(id)a3 mime:(id)a4
{
  v5 = (__CFString *)a4;
  if (!v5)
  {
    v5 = @"application/octet-stream";
    v6 = @"application/octet-stream";
  }
  v7 = [a3 enlowercaseHexDigits];
  v8 = [NSString stringWithFormat:@"<%@ type =\"%@\" hash=\"%@\"/>", @"en-media", v5, v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmlParser, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_htmlWriter, 0);
  objc_storeStrong((id *)&self->_outputHTML, 0);
}

- (void)setShouldInlineResources:(BOOL)a3
{
  self->_shouldInlineResources = a3;
}

- (BOOL)shouldInlineResources
{
  return self->_shouldInlineResources;
}

- (void)setShouldIgnoreNextEndElement:(BOOL)a3
{
  self->_shouldIgnoreNextEndElement = a3;
}

- (BOOL)shouldIgnoreNextEndElement
{
  return self->_shouldIgnoreNextEndElement;
}

- (void)setXmlParser:(id)a3
{
}

- (NSXMLParser)xmlParser
{
  return self->_xmlParser;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setResources:(id)a3
{
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setHtmlWriter:(id)a3
{
}

- (KSHTMLWriter)htmlWriter
{
  return self->_htmlWriter;
}

- (void)setOutputHTML:(id)a3
{
}

- (NSMutableString)outputHTML
{
  return self->_outputHTML;
}

- (void)writeTodoWithAttributes:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v10 = [v4 dictionary];
  [v10 setObject:@"checkbox" forKey:@"type"];
  [v10 setObject:@"true" forKey:@"disabled"];
  v6 = [v5 valueForKey:@"checked"];

  LODWORD(v4) = [v6 isEqualToString:@"true"];
  if (v4)
  {
    v7 = [MEMORY[0x263EFF9D0] null];
    [v10 setObject:v7 forKey:@"checked"];
  }
  v8 = [(ENMLUtility *)self htmlWriter];
  [v8 startElement:@"input" attributes:v10];

  v9 = [(ENMLUtility *)self htmlWriter];
  [v9 endElement];
}

- (void)writeImageTagForResource:(id)a3 withAttributes:(id)a4
{
  id v22 = a3;
  v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  v8 = [v6 dictionaryWithDictionary:v7];
  v9 = [v22 mime];
  if ([(ENMLUtility *)self shouldInlineResources]
    || ([v22 attributes],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 sourceURL],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    v12 = [v22 data];
    v13 = [v12 body];
    v14 = [v13 base64EncodedStringWithOptions:0];

    v11 = [NSString stringWithFormat:@"data:%@;base64,%@", v9, v14];
  }
  [v8 setObject:v11 forKey:@"src"];
  if (!v9)
  {
    v9 = @"application/octet-stream";
    v15 = @"application/octet-stream";
  }
  [v8 setObject:v9 forKey:@"x-evernote-mime"];
  v16 = [v7 objectForKey:@"width"];
  v17 = [v7 objectForKey:@"height"];

  if (v16 && v17)
  {
    v18 = v17;
  }
  else
  {
    uint64_t v19 = [v22 width];

    v18 = [v22 height];

    v16 = (void *)v19;
    if (!v19) {
      goto LABEL_11;
    }
  }
  [v8 setObject:v16 forKey:@"width"];

LABEL_11:
  if (v18) {
    [v8 setObject:v18 forKey:@"height"];
  }
  v20 = [(ENMLUtility *)self htmlWriter];
  [v20 startElement:@"img" attributes:v8];

  v21 = [(ENMLUtility *)self htmlWriter];
  [v21 endElement];
}

- (void)writeResource:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    id v7 = a4;
    v8 = [v10 mime];
    v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];

    if ([v8 hasPrefix:@"image/"]) {
      [(ENMLUtility *)self writeImageTagForResource:v10 withAttributes:v9];
    }

    id v6 = v10;
  }
}

- (void)parser:(id)a3 foundComment:(id)a4
{
  id v5 = a4;
  id v6 = [(ENMLUtility *)self htmlWriter];
  [v6 writeComment:v5];
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v5 = a4;
  id v6 = [(ENMLUtility *)self htmlWriter];
  [v6 startCDATA];

  id v7 = [(ENMLUtility *)self htmlWriter];
  v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];

  [v7 writeString:v8];
  id v9 = [(ENMLUtility *)self htmlWriter];
  [v9 endCDATA];
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  id v6 = [(ENMLUtility *)self htmlWriter];
  [v6 writeCharacters:v5];
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ([(ENMLUtility *)self shouldIgnoreNextEndElement])
  {
    [(ENMLUtility *)self setShouldIgnoreNextEndElement:0];
  }
  else
  {
    id v7 = [(ENMLUtility *)self htmlWriter];
    [v7 endElement];
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a7;
  if ([v9 isEqualToString:@"en-note"])
  {
    v11 = [(ENMLUtility *)self htmlWriter];
    [v11 startElement:@"body"];
LABEL_17:

    goto LABEL_18;
  }
  if ([v9 isEqualToString:@"en-todo"])
  {
    [(ENMLUtility *)self setShouldIgnoreNextEndElement:1];
    [(ENMLUtility *)self writeTodoWithAttributes:v10];
  }
  else
  {
    if (![v9 isEqualToString:@"en-media"]
      || ([(ENMLUtility *)self resources],
          v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      v11 = [(ENMLUtility *)self htmlWriter];
      [v11 startElement:v9 attributes:v10];
      goto LABEL_17;
    }
    v13 = [v10 objectForKey:@"hash"];
    v14 = [MEMORY[0x263EFF8F8] endataWithHexDigits:v13];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [(ENMLUtility *)self resources];
    id v15 = (id)[obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      v23 = v13;
      id v24 = v10;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v19 = [v18 data];
          v20 = [v19 bodyHash];
          int v21 = [v20 isEqualToData:v14];

          if (v21)
          {
            id v15 = v18;
            goto LABEL_20;
          }
        }
        id v15 = (id)[obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v15) {
          continue;
        }
        break;
      }
LABEL_20:
      v13 = v23;
      id v10 = v24;
    }

    id v22 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
    [v22 removeObjectForKey:@"hash"];
    [v22 removeObjectForKey:@"type"];
    [(ENMLUtility *)self setShouldIgnoreNextEndElement:1];
    [(ENMLUtility *)self writeResource:v15 withAttributes:v22];
  }
LABEL_18:
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__ENMLUtility_parser_parseErrorOccurred___block_invoke;
  v7[3] = &unk_264E5DED8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __41__ENMLUtility_parser_parseErrorOccurred___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionBlock];
  (*((void (**)(id, void, void))v2 + 2))(v2, 0, *(void *)(a1 + 40));
}

- (void)parserDidEndDocument:(id)a3
{
  v4 = [(ENMLUtility *)self htmlWriter];
  [v4 close];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__ENMLUtility_parserDidEndDocument___block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __36__ENMLUtility_parserDidEndDocument___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) completionBlock];
  id v2 = [*(id *)(a1 + 32) outputHTML];
  v3[2](v3, v2, 0);
}

- (void)convertENMLToHTML:(id)a3 withResources:(id)a4 inlineResources:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v6 = a5;
  id v10 = (objc_class *)MEMORY[0x263F08D58];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  id v15 = [v13 dataUsingEncoding:4];

  uint64_t v16 = (void *)[v14 initWithData:v15];
  [(ENMLUtility *)self setXmlParser:v16];

  v17 = [MEMORY[0x263F089D8] string];
  [(ENMLUtility *)self setOutputHTML:v17];

  v18 = [KSHTMLWriter alloc];
  uint64_t v19 = [(ENMLUtility *)self outputHTML];
  v20 = [(KSHTMLWriter *)v18 initWithOutputWriter:v19];
  [(ENMLUtility *)self setHtmlWriter:v20];

  int v21 = [(ENMLUtility *)self xmlParser];
  [v21 setDelegate:self];

  [(ENMLUtility *)self setResources:v12];
  [(ENMLUtility *)self setCompletionBlock:v11];

  [(ENMLUtility *)self setShouldInlineResources:v6];
  id v22 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__ENMLUtility_convertENMLToHTML_withResources_inlineResources_completionBlock___block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  dispatch_async(v22, block);
}

void __79__ENMLUtility_convertENMLToHTML_withResources_inlineResources_completionBlock___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) xmlParser];
  [v1 parse];
}

- (void)generateHTMLFromENML:(id)a3 referencedResources:(id)a4 completion:(id)a5
{
}

- (void)generateHTMLFromENML:(id)a3 inlinedResources:(id)a4 completion:(id)a5
{
}

- (void)generateHTMLFromENML:(id)a3 completion:(id)a4
{
}

@end