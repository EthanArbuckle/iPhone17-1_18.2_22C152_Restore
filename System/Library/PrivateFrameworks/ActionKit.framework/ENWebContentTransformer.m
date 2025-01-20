@interface ENWebContentTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (BOOL)inTitleElement;
- (ENMLWriter)enmlWriter;
- (ENNote)note;
- (ENWebArchive)webArchive;
- (ENWebContentTransformer)init;
- (ENXMLDTD)enmlDTD;
- (ENXMLSaxParser)htmlParser;
- (NSArray)ignorableAttributes;
- (NSArray)ignorableTags;
- (NSArray)inlineElements;
- (NSArray)skipTags;
- (NSString)mimeType;
- (NSString)title;
- (NSURL)archiveBaseURL;
- (NSURL)baseURL;
- (id)archiveBaseURLFromURL:(id)a3;
- (id)filenameFromURL:(id)a3;
- (id)htmlFromWebArchive:(id)a3;
- (id)mimeTypeFromFilename:(id)a3;
- (id)resourceFromWebResource:(id)a3;
- (id)sanitizeURLAttribute:(id)a3;
- (id)transformedValue:(id)a3;
- (unint64_t)ignoreElementCount;
- (void)parser:(id)a3 didEndElement:(id)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)setArchiveBaseURL:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setEnmlDTD:(id)a3;
- (void)setEnmlWriter:(id)a3;
- (void)setHtmlParser:(id)a3;
- (void)setIgnorableAttributes:(id)a3;
- (void)setIgnorableTags:(id)a3;
- (void)setIgnoreElementCount:(unint64_t)a3;
- (void)setInTitleElement:(BOOL)a3;
- (void)setInlineElements:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setNote:(id)a3;
- (void)setSkipTags:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWebArchive:(id)a3;
@end

@implementation ENWebContentTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineElements, 0);
  objc_storeStrong((id *)&self->_skipTags, 0);
  objc_storeStrong((id *)&self->_ignorableAttributes, 0);
  objc_storeStrong((id *)&self->_ignorableTags, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_webArchive, 0);
  objc_storeStrong((id *)&self->_archiveBaseURL, 0);
  objc_storeStrong((id *)&self->_enmlDTD, 0);
  objc_storeStrong((id *)&self->_enmlWriter, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setInTitleElement:(BOOL)a3
{
  self->_inTitleElement = a3;
}

- (BOOL)inTitleElement
{
  return self->_inTitleElement;
}

- (void)setIgnoreElementCount:(unint64_t)a3
{
  self->_ignoreElementCount = a3;
}

- (unint64_t)ignoreElementCount
{
  return self->_ignoreElementCount;
}

- (void)setInlineElements:(id)a3
{
}

- (NSArray)inlineElements
{
  return self->_inlineElements;
}

- (void)setSkipTags:(id)a3
{
}

- (NSArray)skipTags
{
  return self->_skipTags;
}

- (void)setIgnorableAttributes:(id)a3
{
}

- (NSArray)ignorableAttributes
{
  return self->_ignorableAttributes;
}

- (void)setIgnorableTags:(id)a3
{
}

- (NSArray)ignorableTags
{
  return self->_ignorableTags;
}

- (void)setNote:(id)a3
{
}

- (ENNote)note
{
  return self->_note;
}

- (void)setWebArchive:(id)a3
{
}

- (ENWebArchive)webArchive
{
  return self->_webArchive;
}

- (void)setArchiveBaseURL:(id)a3
{
}

- (NSURL)archiveBaseURL
{
  return self->_archiveBaseURL;
}

- (void)setEnmlDTD:(id)a3
{
}

- (ENXMLDTD)enmlDTD
{
  return self->_enmlDTD;
}

- (void)setEnmlWriter:(id)a3
{
}

- (ENMLWriter)enmlWriter
{
  return self->_enmlWriter;
}

- (void)setHtmlParser:(id)a3
{
}

- (ENXMLSaxParser)htmlParser
{
  return self->_htmlParser;
}

- (void)setBaseURL:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v7 = a4;
  if ([(ENWebContentTransformer *)self inTitleElement])
  {
    v5 = [(ENWebContentTransformer *)self title];
    v6 = [v5 stringByAppendingString:v7];
    [(ENWebContentTransformer *)self setTitle:v6];
  }
  else
  {
    if ([(ENWebContentTransformer *)self ignoreElementCount]) {
      goto LABEL_6;
    }
    v5 = [(ENWebContentTransformer *)self enmlWriter];
    [v5 writeString:v7];
  }

LABEL_6:
}

- (void)parser:(id)a3 didEndElement:(id)a4
{
  id v8 = a4;
  if ([(ENWebContentTransformer *)self inTitleElement]
    && [v8 isEqualToString:@"title"])
  {
    [(ENWebContentTransformer *)self setInTitleElement:0];
  }
  else if ([(ENWebContentTransformer *)self ignoreElementCount])
  {
    [(ENWebContentTransformer *)self setIgnoreElementCount:[(ENWebContentTransformer *)self ignoreElementCount] - 1];
  }
  else
  {
    v5 = [(ENWebContentTransformer *)self skipTags];
    char v6 = [v5 containsObject:v8];

    if ((v6 & 1) == 0)
    {
      id v7 = [(ENWebContentTransformer *)self enmlWriter];
      [v7 endElement];
    }
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = [(ENWebContentTransformer *)self baseURL];
  if (v9)
  {
LABEL_2:

    goto LABEL_3;
  }
  if ([v7 isEqualToString:@"base"])
  {
    v9 = [v8 objectForKey:@"href"];
    if (v9)
    {
      v11 = [NSURL URLWithString:v9];
      [(ENWebContentTransformer *)self setBaseURL:v11];
    }
    goto LABEL_2;
  }
LABEL_3:
  v10 = [(ENWebContentTransformer *)self title];
  if (v10)
  {

    goto LABEL_10;
  }
  if (![v7 isEqualToString:@"title"])
  {
LABEL_10:
    if ([(ENWebContentTransformer *)self ignoreElementCount])
    {
      unint64_t v12 = [(ENWebContentTransformer *)self ignoreElementCount] + 1;
      v13 = self;
LABEL_12:
      [(ENWebContentTransformer *)v13 setIgnoreElementCount:v12];
      goto LABEL_54;
    }
    v14 = [(ENWebContentTransformer *)self skipTags];
    char v15 = [v14 containsObject:v7];

    if (v15) {
      goto LABEL_54;
    }
    v16 = [(ENWebContentTransformer *)self ignorableTags];
    int v17 = [v16 containsObject:v7];

    if (v17)
    {
      v13 = self;
      unint64_t v12 = 1;
      goto LABEL_12;
    }
    v18 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v58 = v8;
    id v19 = v8;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v66 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v65 + 1) + 8 * i);
          v25 = [(ENWebContentTransformer *)self ignorableAttributes];
          int v26 = [v25 containsObject:v24];

          if (v26) {
            [v18 removeObjectForKey:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v21);
    }

    v27 = (__CFString *)v7;
    if ([(__CFString *)v27 isEqualToString:@"img"])
    {
      v28 = [v18 objectForKeyedSubscript:@"src"];
      v60 = [(ENWebContentTransformer *)self sanitizeURLAttribute:v28];
      if (!v60)
      {
        [(ENWebContentTransformer *)self setIgnoreElementCount:1];
        id v8 = v58;
LABEL_48:

        goto LABEL_53;
      }
      v55 = v28;
      v56 = v27;
      id v57 = v7;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v29 = [(ENWebContentTransformer *)self webArchive];
      v30 = [v29 subresources];

      obuint64_t j = v30;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v62;
        while (2)
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v62 != v33) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void **)(*((void *)&v61 + 1) + 8 * j);
            v36 = [v35 URL];
            v37 = [v36 absoluteString];
            v38 = [v60 absoluteString];
            int v39 = [v37 isEqualToString:v38];

            if (v39)
            {
              uint64_t v40 = [(ENWebContentTransformer *)self resourceFromWebResource:v35];
              if (v40)
              {
                v50 = (void *)v40;
                v51 = [(ENWebContentTransformer *)self note];
                [v51 addResource:v50];

                [v18 removeObjectForKey:@"src"];
                v52 = [(ENWebContentTransformer *)self enmlWriter];
                v53 = [v50 dataHash];
                v54 = [v50 mimeType];
                [v52 writeResourceWithDataHash:v53 mime:v54 attributes:v18];

                [(ENWebContentTransformer *)self setIgnoreElementCount:1];
                id v7 = v57;
                id v8 = v58;
                v28 = v55;
                v27 = v56;
                goto LABEL_48;
              }
            }
          }
          uint64_t v32 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }

      v41 = [v60 absoluteString];
      [v18 setObject:v41 forKeyedSubscript:@"src"];

      id v7 = v57;
      id v8 = v58;
      v27 = v56;
    }
    else if ([(__CFString *)v27 isEqualToString:@"a"])
    {
      v42 = [v19 objectForKey:@"href"];
      id v8 = v58;
      if (v42)
      {
        v43 = [(ENWebContentTransformer *)self sanitizeURLAttribute:v42];
        v44 = v43;
        if (v43)
        {
          v45 = [v43 absoluteString];
          [v18 setObject:v45 forKeyedSubscript:@"href"];
        }
        else
        {
          [v18 removeObjectForKey:@"href"];
        }
      }
    }
    else
    {
      v46 = [(ENWebContentTransformer *)self enmlDTD];
      char v47 = [v46 isElementLegal:v27];

      if ((v47 & 1) == 0)
      {
        v48 = [(ENWebContentTransformer *)self inlineElements];
        int v49 = [v48 containsObject:v27];

        if (v49) {
          v27 = @"span";
        }
        else {
          v27 = @"div";
        }
      }
      id v8 = v58;
    }
    v28 = [(ENWebContentTransformer *)self enmlWriter];
    [v28 startElement:v27 attributes:v18];
LABEL_53:

    goto LABEL_54;
  }
  [(ENWebContentTransformer *)self setInTitleElement:1];
  [(ENWebContentTransformer *)self setTitle:&stru_26F008428];
LABEL_54:
}

- (id)resourceFromWebResource:(id)a3
{
  id v4 = a3;
  v5 = [v4 data];
  char v6 = v5;
  if (v5 && [v5 length])
  {
    id v7 = objc_alloc_init(ENResource);
    id v8 = [v4 URL];
    v9 = [v8 absoluteString];
    [(ENResource *)v7 setSourceUrl:v9];

    v10 = [(ENWebContentTransformer *)self filenameFromURL:v8];
    [(ENResource *)v7 setFilename:v10];

    [(ENResource *)v7 setData:v6];
    v11 = [v4 MIMEType];
    unint64_t v12 = v11;
    if (!v11 || ![v11 length])
    {
      v13 = [(ENResource *)v7 filename];
      uint64_t v14 = [(ENWebContentTransformer *)self mimeTypeFromFilename:v13];

      unint64_t v12 = (void *)v14;
    }
    [(ENResource *)v7 setMimeType:v12];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)mimeTypeFromFilename:(id)a3
{
  id v3 = a3;
  if (!v3
    || (+[ENMIMEUtils determineMIMETypeForFile:v3],
        (id v4 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = @"application/octet-stream";
    v5 = @"application/octet-stream";
  }

  return v4;
}

- (id)filenameFromURL:(id)a3
{
  id v3 = a3;
  if (CFURLHasDirectoryPath((CFURLRef)v3))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 lastPathComponent];
  }

  return v4;
}

- (id)sanitizeURLAttribute:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    char v6 = [v4 stringByReplacingPercentEscapesUsingEncoding:4];
    id v7 = [v6 stringByAddingPercentEscapesUsingEncoding:4];
    id v8 = NSURL;
    v9 = [(ENWebContentTransformer *)self baseURL];
    v10 = [v8 URLWithString:v7 relativeToURL:v9];

    if (+[ENMLWriter validateURLComponents:v10])
    {
      id v11 = v10;
    }
    else
    {
      unint64_t v12 = [(ENWebContentTransformer *)self webArchive];
      v13 = [v12 subresources];

      uint64_t v14 = [NSURL URLWithString:v5];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v13;
      id v11 = (id)[v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v21 = v6;
        uint64_t v16 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v15);
            }
            v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) URL];
            char v19 = [v18 isEqual:v14];

            if (v19)
            {
              id v11 = v14;
              goto LABEL_15;
            }
          }
          id v11 = (id)[v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v11) {
            continue;
          }
          break;
        }
LABEL_15:
        char v6 = v21;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)archiveBaseURLFromURL:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  CFURLRef v4 = v3;
  if (!v3)
  {
    CFURLRef v8 = 0;
    goto LABEL_12;
  }
  PathComponent = (__CFString *)CFURLCopyLastPathComponent(v3);
  char v6 = [(__CFURL *)v4 scheme];
  if ([@"file" isEqualToString:v6])
  {
    int v7 = [@"/" isEqualToString:PathComponent];

    if (v7) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  if ([(__CFString *)PathComponent length] && CFURLHasDirectoryPath(v4) != 1)
  {
    CFURLRef v9 = CFURLCreateCopyDeletingLastPathComponent(0, v4);
    goto LABEL_11;
  }
LABEL_9:
  CFURLRef v9 = v4;
LABEL_11:
  CFURLRef v8 = v9;

LABEL_12:
  return v8;
}

- (id)htmlFromWebArchive:(id)a3
{
  CFURLRef v3 = [a3 mainResource];
  uint64_t v4 = [v3 textEncodingName];
  if (v4) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = @"UTF-8";
  }
  CFStringEncoding v6 = CFStringConvertIANACharSetNameToEncoding(v5);
  unint64_t v7 = CFStringConvertEncodingToNSStringEncoding(v6);
  CFURLRef v8 = [v3 data];
  if (v8) {
    CFURLRef v9 = (void *)[[NSString alloc] initWithData:v8 encoding:v7];
  }
  else {
    CFURLRef v9 = 0;
  }

  return v9;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ENNote);
  [(ENWebContentTransformer *)self setNote:v5];
  CFStringEncoding v6 = objc_alloc_init(ENMLWriter);
  [(ENMLWriter *)v6 startDocument];
  [(ENWebContentTransformer *)self setEnmlWriter:v6];
  unint64_t v7 = +[ENXMLDTD enml2dtd];
  [(ENWebContentTransformer *)self setEnmlDTD:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    CFURLRef v8 = objc_alloc_init(ENXMLSaxParser);
    [(ENXMLSaxParser *)v8 setIsHTML:1];
    [(ENXMLSaxParser *)v8 setDelegate:self];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v10 = v4;
    if (isKindOfClass)
    {
      uint64_t v11 = [(ENWebContentTransformer *)self htmlFromWebArchive:v10];
      unint64_t v12 = [v10 mainResource];
      v13 = [v12 URL];
      [(ENWebContentTransformer *)self setBaseURL:v13];

      [(ENWebContentTransformer *)self setWebArchive:v10];
      id v10 = (id)v11;
    }
    uint64_t v14 = [(ENWebContentTransformer *)self baseURL];
    id v15 = [(ENWebContentTransformer *)self archiveBaseURLFromURL:v14];
    [(ENWebContentTransformer *)self setArchiveBaseURL:v15];

    [(ENXMLSaxParser *)v8 parseContents:v10];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v26 = 0;
      goto LABEL_10;
    }
    CFURLRef v8 = objc_alloc_init(ENResource);
    v28 = [(ENWebContentTransformer *)self baseURL];
    v29 = [v28 absoluteString];
    [(ENXMLSaxParser *)v8 setSourceUrl:v29];

    v30 = [(ENWebContentTransformer *)self baseURL];
    uint64_t v31 = [(ENWebContentTransformer *)self filenameFromURL:v30];
    [(ENXMLSaxParser *)v8 setFilename:v31];

    [(ENXMLSaxParser *)v8 setData:v4];
    id v10 = [(ENWebContentTransformer *)self mimeType];
    if (!v10)
    {
      uint64_t v32 = [(ENXMLSaxParser *)v8 filename];
      id v10 = [(ENWebContentTransformer *)self mimeTypeFromFilename:v32];
    }
    [(ENXMLSaxParser *)v8 setMimeType:v10];
    uint64_t v33 = [(ENWebContentTransformer *)self note];
    [v33 addResource:v8];

    v34 = [(ENXMLSaxParser *)v8 dataHash];
    v35 = [(ENXMLSaxParser *)v8 mimeType];
    [(ENMLWriter *)v6 writeResourceWithDataHash:v34 mime:v35 attributes:0];
  }
  [(ENMLWriter *)v6 endDocument];
  uint64_t v16 = [ENNoteContent alloc];
  int v17 = [(ENXMLWriter *)v6 contents];
  v18 = [(ENNoteContent *)v16 initWithENML:v17];
  [(ENNote *)v5 setContent:v18];

  char v19 = [(ENWebContentTransformer *)self baseURL];
  uint64_t v20 = [v19 absoluteString];
  [(ENNote *)v5 setSourceUrl:v20];

  uint64_t v21 = [(ENWebContentTransformer *)self title];
  if (!v21)
  {
    uint64_t v21 = [(ENNote *)v5 sourceUrl];
    if (!v21)
    {
      long long v22 = (void *)MEMORY[0x263F086E0];
      long long v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v24 = [v23 pathForResource:@"ENSDKResources" ofType:@"bundle"];
      long long v25 = [v22 bundleWithPath:v24];
      uint64_t v21 = [v25 localizedStringForKey:@"Untitled" value:&stru_26F008428 table:0];
    }
  }
  [(ENNote *)v5 setTitle:v21];
  int v26 = v5;

LABEL_10:
  return v26;
}

- (ENWebContentTransformer)init
{
  v5.receiver = self;
  v5.super_class = (Class)ENWebContentTransformer;
  v2 = [(ENWebContentTransformer *)&v5 init];
  CFURLRef v3 = v2;
  if (v2)
  {
    [(ENWebContentTransformer *)v2 setSkipTags:&unk_26F0765F0];
    [(ENWebContentTransformer *)v3 setIgnorableTags:&unk_26F076608];
    [(ENWebContentTransformer *)v3 setIgnorableAttributes:&unk_26F076620];
    [(ENWebContentTransformer *)v3 setInlineElements:&unk_26F076638];
  }
  return v3;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

@end