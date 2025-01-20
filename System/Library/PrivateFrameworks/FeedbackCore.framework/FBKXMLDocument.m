@interface FBKXMLDocument
- (FBKXMLDocument)initWithHTMLData:(id)a3;
- (FBKXMLDocument)initWithHTMLString:(id)a3;
- (FBKXMLDocument)initWithXMLData:(id)a3;
- (FBKXMLDocument)initWithXMLString:(id)a3;
- (id)performXPathQuery:(id)a3;
- (void)dealloc;
@end

@implementation FBKXMLDocument

- (FBKXMLDocument)initWithXMLString:(id)a3
{
  v4 = [a3 dataUsingEncoding:4 allowLossyConversion:1];
  v5 = [(FBKXMLDocument *)self initWithXMLData:v4];

  return v5;
}

- (FBKXMLDocument)initWithXMLData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKXMLDocument;
  v5 = [(FBKXMLDocument *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    v5->_document = xmlReadMemory((const char *)[v6 bytes], objc_msgSend(v6, "length"), "", 0, 18529);
  }

  return v5;
}

- (FBKXMLDocument)initWithHTMLString:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4 allowLossyConversion:1];
  v5 = [(FBKXMLDocument *)self initWithHTMLData:v4];

  return v5;
}

- (FBKXMLDocument)initWithHTMLData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBKXMLDocument;
  v5 = [(FBKXMLDocument *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    v5->_document = htmlReadMemory((const char *)[v6 bytes], objc_msgSend(v6, "length"), "", 0, 10337);
  }

  return v5;
}

- (void)dealloc
{
  xmlFreeDoc(self->_document);
  v3.receiver = self;
  v3.super_class = (Class)FBKXMLDocument;
  [(FBKXMLDocument *)&v3 dealloc];
}

- (id)performXPathQuery:(id)a3
{
  id v4 = a3;
  document = self->_document;
  if (document)
  {
    id v6 = xmlXPathNewContext(document);
    v7 = xmlCharStrdup((const char *)[v4 cStringUsingEncoding:4]);
    objc_super v8 = v7;
    if (v6 && v7)
    {
      uint64_t v9 = MEMORY[0x22A6CA910](v7, v6);
      v10 = (xmlXPathObject *)v9;
      if (v9)
      {
        v11 = *(int **)(v9 + 8);
        if (v11)
        {
          v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:*v11];
          if (*v11 >= 1)
          {
            uint64_t v13 = 0;
            do
            {
              v14 = [[FBKXMLNode alloc] initWithXMLNodePtr:*(void *)(*((void *)v11 + 1) + 8 * v13)];
              [v12 addObject:v14];

              ++v13;
            }
            while (v13 < *v11);
          }
          v15 = (void *)[v12 copy];

          goto LABEL_20;
        }
      }
      v18 = +[FBKLog appHandle];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_22A36D000, v18, OS_LOG_TYPE_DEFAULT, "Failed to evaluate XPath", v20, 2u);
      }
    }
    else
    {
      v17 = +[FBKLog appHandle];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create XPath context, or parse provided query", v21, 2u);
      }

      v10 = 0;
    }
    v15 = 0;
LABEL_20:
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v8);
    xmlXPathFreeContext(v6);
    xmlXPathFreeObject(v10);
    goto LABEL_21;
  }
  v16 = +[FBKLog appHandle];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "Attempted to XPath query an empty/null document", buf, 2u);
  }

  v15 = 0;
LABEL_21:

  return v15;
}

@end