@interface _HKXMLTranslator
- (_HKXMLTranslator)initWithXSL:(id)a3 localizationTableName:(id)a4 localizationOverride:(id)a5;
- (id)_localizeXSL:(id)a3 localizationTableName:(id)a4 localizationOverride:(id)a5;
- (id)convertToHTMLFromXML:(id)a3;
- (void)dealloc;
@end

@implementation _HKXMLTranslator

- (_HKXMLTranslator)initWithXSL:(id)a3 localizationTableName:(id)a4 localizationOverride:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  v19.receiver = self;
  v19.super_class = (Class)_HKXMLTranslator;
  v11 = [(_HKXMLTranslator *)&v19 init];
  v12 = v11;
  if (v11)
  {
    if (v9 | v10)
    {
      id v13 = [(_HKXMLTranslator *)v11 _localizeXSL:v8 localizationTableName:v9 localizationOverride:v10];
    }
    else
    {
      id v13 = v8;
    }
    id v14 = v13;
    Memory = xmlReadMemory((const char *)[v14 bytes], objc_msgSend(v14, "length"), 0, 0, 0);
    if (Memory)
    {
      v16 = Memory;
      xsltStylesheetPtr v17 = xsltParseStylesheetDoc(Memory);
      v12->_stylesheet = v17;
      if (!v17) {
        xmlFreeDoc(v16);
      }
    }
    else
    {
      v12->_stylesheet = 0;

      v12 = 0;
    }
  }
  return v12;
}

- (void)dealloc
{
  stylesheet = self->_stylesheet;
  if (stylesheet)
  {
    xsltFreeStylesheet(stylesheet);
    self->_stylesheet = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_HKXMLTranslator;
  [(_HKXMLTranslator *)&v4 dealloc];
}

- (id)convertToHTMLFromXML:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 bytes];
  int v6 = [v4 length];

  Memory = xmlReadMemory(v5, v6, "content.xml", 0, 0);
  if (Memory)
  {
    id v8 = Memory;
    unint64_t v9 = xsltApplyStylesheet(self->_stylesheet, Memory, 0);
    if (v9)
    {
      unint64_t v10 = v9;
      mem = 0;
      int size = 0;
      xmlDocDumpFormatMemory(v9, &mem, &size, 1);
      if (mem)
      {
        id v11 = [NSString alloc];
        v12 = (void *)[v11 initWithBytes:mem length:size encoding:5];
        ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(mem);
      }
      else
      {
        v12 = 0;
      }
      xmlFreeDoc(v10);
    }
    else
    {
      v12 = 0;
    }
    xmlFreeDoc(v8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_localizeXSL:(id)a3 localizationTableName:(id)a4 localizationOverride:(id)a5
{
  id v7 = a3;
  id v36 = a4;
  id v8 = a5;
  v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  unint64_t v9 = [@"@@" dataUsingEncoding:4];
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v10 = [v7 length];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    id v34 = v7;
    v35 = v9;
    while (1)
    {
      uint64_t v13 = objc_msgSend(v7, "rangeOfData:options:range:", v9, 0, v12, v11);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        xsltStylesheetPtr v17 = objc_msgSend(v7, "subdataWithRange:", v12, v11);
        [v38 appendData:v17];
        goto LABEL_13;
      }
      uint64_t v15 = v13;
      uint64_t v16 = v14;
      xsltStylesheetPtr v17 = objc_msgSend(v7, "subdataWithRange:", v12, v13 - v12);
      [v38 appendData:v17];
      uint64_t v18 = v15 + v16;
      uint64_t v19 = [v7 length];
      uint64_t v20 = v19 - (v15 + v16);
      uint64_t v21 = objc_msgSend(v7, "rangeOfData:options:range:", v9, 0, v18, v19 - v18);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v23 = v21;
      uint64_t v24 = v22;
      v25 = objc_msgSend(v7, "subdataWithRange:", v18, v21 - v18);
      v26 = (void *)[[NSString alloc] initWithData:v25 encoding:4];
      v27 = [v37 localizedStringForKey:v26 value:&stru_1EEC60288 table:v36];
      if (v8)
      {
        v28 = [v8 objectForKey:v26];
        v29 = v28;
        if (v28)
        {
          id v30 = v28;

          v27 = v30;
          id v7 = v34;
        }
      }
      v31 = [v27 dataUsingEncoding:4];
      [v38 appendData:v31];
      uint64_t v12 = v23 + v24;
      uint64_t v11 = [v7 length] - v12;

      unint64_t v9 = v35;
      if (!v11) {
        goto LABEL_14;
      }
    }
    v32 = objc_msgSend(v7, "subdataWithRange:", v15, v20);
    [v38 appendData:v32];

LABEL_13:
  }
LABEL_14:

  return v38;
}

@end