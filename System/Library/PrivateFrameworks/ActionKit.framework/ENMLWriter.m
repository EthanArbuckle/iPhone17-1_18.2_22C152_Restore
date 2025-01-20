@interface ENMLWriter
+ (BOOL)validateURLComponents:(id)a3;
+ (id)emptyNote;
- (BOOL)startElement:(id)a3 attributes:(id)a4;
- (ENMLWriter)init;
- (id)validateURLAttribute:(id)a3 inAttributes:(id)a4;
- (void)endDocument;
- (void)startDocument;
- (void)startDocumentWithAttributes:(id)a3;
- (void)writeEncryptedInfo:(id)a3;
- (void)writeResource:(id)a3;
- (void)writeResourceWithDataHash:(id)a3 mime:(id)a4 attributes:(id)a5;
- (void)writeTodoWithCheckedState:(BOOL)a3;
@end

@implementation ENMLWriter

- (void)writeTodoWithCheckedState:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [NSDictionary dictionaryWithObject:@"true" forKey:@"checked"];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(ENXMLWriter *)self writeElement:@"en-todo" attributes:v4 content:0];
}

- (void)writeEncryptedInfo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [v10 cipher];
  [v4 setObject:v5 forKey:@"cipher"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "keyLength"));
  v7 = [v6 stringValue];

  [v4 setObject:v7 forKey:@"length"];
  v8 = [v10 hint];
  if (v8) {
    [v4 setObject:v8 forKey:@"hint"];
  }
  v9 = [v10 cipherText];
  [(ENXMLWriter *)self writeElement:@"en-crypt" attributes:v4 content:v9];
}

- (void)writeResource:(id)a3
{
  id v4 = a3;
  id v7 = [v4 data];
  id v5 = [v7 bodyHash];
  v6 = [v4 mime];

  [(ENMLWriter *)self writeResourceWithDataHash:v5 mime:v6 attributes:0];
}

- (void)writeResourceWithDataHash:(id)a3 mime:(id)a4 attributes:(id)a5
{
  v13 = (__CFString *)a4;
  v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a3;
  id v10 = [v8 dictionaryWithDictionary:a5];
  if (!v13)
  {
    v13 = @"application/octet-stream";
    v11 = @"application/octet-stream";
  }
  [v10 setObject:v13 forKey:@"type"];
  v12 = [v9 enlowercaseHexDigits];

  [v10 setObject:v12 forKey:@"hash"];
  [(ENXMLWriter *)self writeElement:@"en-media" attributes:v10 content:0];
}

- (BOOL)startElement:(id)a3 attributes:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"a"])
  {
    v8 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];
    id v9 = [v7 allKeys];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v14 hasPrefix:@"x-apple-"]) {
            [v8 removeObjectForKey:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
    uint64_t v15 = [(ENMLWriter *)self validateURLAttribute:@"href" inAttributes:v8];

    id v7 = (id)v15;
  }
  else if ([v6 isEqualToString:@"img"])
  {
    uint64_t v16 = [(ENMLWriter *)self validateURLAttribute:@"src" inAttributes:v7];

    id v7 = (id)v16;
  }
  v19.receiver = self;
  v19.super_class = (Class)ENMLWriter;
  BOOL v17 = [(ENXMLWriter *)&v19 startElement:v6 attributes:v7];

  return v17;
}

- (id)validateURLAttribute:(id)a3 inAttributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKey:v5];
  if (v7)
  {
    v8 = [NSURL URLWithString:v7];
    id v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
    if (+[ENMLWriter validateURLComponents:v8])
    {
      uint64_t v10 = [v8 absoluteString];
      [v9 setObject:v10 forKey:v5];
    }
    else
    {
      NSLog(&cfstr_UnableToValida.isa, v7, v6);
      [v9 removeObjectForKey:v5];
    }
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (void)endDocument
{
  [(ENXMLWriter *)self endElement];
  v3.receiver = self;
  v3.super_class = (Class)ENMLWriter;
  [(ENXMLWriter *)&v3 endDocument];
}

- (void)startDocument
{
}

- (void)startDocumentWithAttributes:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ENMLWriter;
  id v4 = a3;
  [(ENXMLWriter *)&v5 startDocument];
  [(ENMLWriter *)self startElement:@"en-note", v4, v5.receiver, v5.super_class attributes];
}

- (ENMLWriter)init
{
  v5.receiver = self;
  v5.super_class = (Class)ENMLWriter;
  v2 = [(ENXMLWriter *)&v5 init];
  if (v2)
  {
    objc_super v3 = +[ENXMLDTD enml2dtd];
    [(ENXMLWriter *)v2 setDtd:v3];
  }
  return v2;
}

+ (id)emptyNote
{
  v2 = objc_alloc_init(ENMLWriter);
  [(ENMLWriter *)v2 startDocument];
  [(ENMLWriter *)v2 endDocument];
  objc_super v3 = [(ENXMLWriter *)v2 contents];

  return v3;
}

+ (BOOL)validateURLComponents:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 scheme];
    if ([v5 rangeOfString:@"script"] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    if ([v5 isEqualToString:@"file"])
    {
LABEL_4:
      char v6 = 1;
LABEL_8:

      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"x-apple-data-detectors"])
    {
LABEL_7:
      char v6 = 0;
      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"tel"]) {
      goto LABEL_4;
    }
    v8 = [MEMORY[0x263F08AE8] enRegexWithPattern:@"^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\\?([^#]*))?(#(.*))?"];
    id v9 = [v4 absoluteString];
    uint64_t v10 = [v8 enCapturedSubstringsOfString:v9];

    if (!v10 || [v10 count] != 10)
    {
      char v6 = 0;
LABEL_45:

      goto LABEL_8;
    }
    uint64_t v11 = [v10 objectAtIndex:2];

    uint64_t v12 = [v4 scheme];
    char v6 = [v11 enIsEqualToStringOrNil:v12];

    if ((v6 & 1) == 0)
    {
      v13 = [v4 scheme];
      NSLog(&cfstr_SchemeDoesNotM.isa, v11, v13);
    }
    v14 = [v10 objectAtIndex:4];
    uint64_t v15 = [MEMORY[0x263F089D8] string];
    uint64_t v16 = [v4 user];
    if (v16)
    {
    }
    else
    {
      BOOL v17 = [v4 password];

      if (!v17) {
        goto LABEL_24;
      }
    }
    v18 = [v4 user];

    if (v18)
    {
      objc_super v19 = [v4 user];
      [v15 appendString:v19];
    }
    long long v20 = [v4 password];

    if (v20)
    {
      [v15 appendString:@":"];
      long long v21 = [v4 password];
      [v15 appendString:v21];
    }
    [v15 appendString:@"@"];
LABEL_24:
    long long v22 = [v4 host];

    if (v22)
    {
      long long v23 = [v4 host];
      [v15 appendString:v23];
    }
    v24 = [v4 port];

    if (v24)
    {
      [v15 appendString:@":"];
      uint64_t v25 = [v4 port];
      [v15 appendFormat:@"%@", v25];
    }
    if (([v14 enIsEqualToStringOrNil:v15] & 1) == 0)
    {
      NSLog(&cfstr_AuthorityDoesN.isa, v14, v15);
      char v6 = 0;
    }
    v26 = [v10 objectAtIndex:5];
    v27 = [v26 stringByReplacingPercentEscapesUsingEncoding:4];

    uint64_t v28 = [v4 path];
    v42 = v14;
    v43 = v11;
    v41 = (void *)v28;
    if ([v27 enIsEqualToStringOrNil:v28]) {
      goto LABEL_40;
    }
    if ([v11 caseInsensitiveCompare:@"mailto"])
    {
      if ([v27 hasSuffix:@"/"])
      {
        v29 = objc_msgSend(v27, "substringToIndex:", objc_msgSend(v27, "length") - 1);

        if (([v29 enIsEqualToStringOrNil:v28] & 1) == 0)
        {
          NSLog(&cfstr_PathDoesNotMat_0.isa, v29, v28);
          char v6 = 0;
        }
        v27 = v29;
        goto LABEL_40;
      }
      NSLog(&cfstr_PathDoesNotMat_0.isa, v27, v28);
    }
    else
    {
      v30 = [v4 resourceSpecifier];
      char v31 = [v27 enIsEqualToStringOrNil:v30];

      if (v31)
      {
LABEL_40:
        v33 = [v10 objectAtIndex:7];
        v34 = [v4 query];
        char v35 = [v33 enIsEqualToStringOrNil:v34];

        if ((v35 & 1) == 0)
        {
          v36 = [v4 query];
          NSLog(&cfstr_QueryDoesNotMa.isa, v33, v36);

          char v6 = 0;
        }
        v37 = [v10 objectAtIndex:9];
        v38 = [v4 fragment];
        char v39 = [v37 enIsEqualToStringOrNil:v38];

        if ((v39 & 1) == 0)
        {
          v40 = [v4 fragment];
          NSLog(&cfstr_FragmentDoesNo.isa, v37, v40);

          char v6 = 0;
        }

        objc_super v5 = v43;
        goto LABEL_45;
      }
      v32 = [v4 resourceSpecifier];
      NSLog(&cfstr_PathDoesNotMat.isa, v27, v32);
    }
    char v6 = 0;
    goto LABEL_40;
  }
  char v6 = 0;
LABEL_9:

  return v6;
}

@end