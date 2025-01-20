@interface HKClinicalDocumentIndexingUtilities
+ (id)contentStringFromDOCXData:(id)a3 error:(id *)a4;
+ (id)contentStringFromHTMLData:(id)a3 error:(id *)a4;
@end

@implementation HKClinicalDocumentIndexingUtilities

+ (id)contentStringFromHTMLData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (id) [[NSString alloc] initWithData:v5 encoding:4];
  v7 = htmlParseDoc((const xmlChar *)[v6 cStringUsingEncoding:4], "UTF-8");
  if (!v7)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    v20 = @"Failed to construct html document from the given data";
LABEL_13:
    objc_msgSend(v19, "hk_assignError:code:format:", a4, 100, v20);
    Content = 0;
    goto LABEL_14;
  }
  v8 = v7;
  xmlXPathContextPtr v9 = xmlXPathNewContext(v7);
  if (!v9)
  {
    xmlFreeDoc(v8);
    v19 = (void *)MEMORY[0x263F087E8];
    v20 = @"Failed to construct xpath context from the given doc";
    goto LABEL_13;
  }
  v10 = v9;
  uint64_t v11 = MEMORY[0x237DB7010]("//script | //style", v9);
  if (!v11)
  {
    xmlXPathFreeContext(v10);
    xmlFreeDoc(v8);
    v19 = (void *)MEMORY[0x263F087E8];
    v20 = @"Failed to evaluation xpath expression with the given doc";
    goto LABEL_13;
  }
  v12 = (xmlXPathObject *)v11;
  uint64_t v13 = *(void *)(v11 + 8);
  if (v13 && *(int *)v13 >= 1)
  {
    uint64_t v14 = 8 * (*(_DWORD *)v13 - 1);
    do
    {
      uint64_t v15 = *(void *)(v13 + 8);
      v16 = *(xmlNode **)(v15 + v14);
      *(void *)(v15 + v14) = 0;
      xmlUnlinkNode(v16);
      xmlFreeNode(v16);
      v14 -= 8;
    }
    while (v14 != -8);
  }
  RootElement = xmlDocGetRootElement(v8);
  Content = xmlNodeGetContent(RootElement);
  xmlXPathFreeObject(v12);
  xmlXPathFreeContext(v10);
  xmlFreeDoc(v8);
  if (Content) {
    Content = (xmlChar *)[[NSString alloc] initWithBytes:Content length:strlen((const char *)Content) encoding:4];
  }
LABEL_14:

  return Content;
}

+ (id)contentStringFromDOCXData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F0AA48]) initWithData:v5];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4;
  v35 = __Block_byref_object_dispose__4;
  id v36 = 0;
  id obj = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __71__HKClinicalDocumentIndexingUtilities_contentStringFromDOCXData_error___block_invoke;
  v27[3] = &unk_264BD9B50;
  id v8 = v7;
  id v28 = v8;
  v29 = &v31;
  [v6 enumerateEntriesWithError:&obj block:v27];
  objc_storeStrong(&v36, obj);
  xmlXPathContextPtr v9 = (void *)v32[5];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = v10;
    if (a4)
    {
      v12 = 0;
      *a4 = v10;
      goto LABEL_28;
    }
    _HKLogDroppedError();
    goto LABEL_12;
  }
  uint64_t v11 = [v8 firstObject];
  if (!v11)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 100, @"Failed to extract xml data from docx file");
LABEL_12:
    v12 = 0;
    goto LABEL_28;
  }
  id v13 = (id) [[NSString alloc] initWithData:v11 encoding:4];
  uint64_t v14 = xmlParseDoc((const xmlChar *)[v13 cStringUsingEncoding:4]);
  uint64_t v15 = v14;
  if (v14)
  {
    v16 = xmlXPathNewContext(v14);
    if (v16)
    {
      uint64_t v17 = MEMORY[0x237DB7010]("//*[local-name()='t']", v16);
      if (v17)
      {
        id v25 = v13;
        v26 = (xmlXPathObject *)v17;
        uint64_t v18 = *(void *)(v17 + 8);
        if (v18) {
          int v19 = *(_DWORD *)v18;
        }
        else {
          int v19 = 0;
        }
        id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (v19 >= 1)
        {
          unint64_t v21 = v19 + 1;
          do
          {
            Content = xmlNodeGetContent(*(const xmlNode **)(*(void *)(v18 + 8) + 8 * (v21 - 2)));
            if (Content)
            {
              v23 = (void *)[[NSString alloc] initWithUTF8String:Content];
              [v20 insertObject:v23 atIndex:0];
            }
            --v21;
          }
          while (v21 > 1);
        }
        xmlXPathFreeObject(v26);
        xmlXPathFreeContext(v16);
        xmlFreeDoc(v15);
        if ([v20 count])
        {
          v12 = [v20 componentsJoinedByString:@"\n"];
        }
        else
        {
          v12 = 0;
        }

        id v13 = v25;
        goto LABEL_27;
      }
      xmlXPathFreeContext(v16);
      xmlFreeDoc(v15);
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 100, @"Failed to evaluation xpath expression with the given doc");
    }
    else
    {
      xmlFreeDoc(v15);
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 100, @"Failed to construct xpath context from the given doc");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 100, @"Failed to construct html document from the given data");
  }
  v12 = 0;
LABEL_27:

LABEL_28:
  _Block_object_dispose(&v31, 8);

  return v12;
}

void __71__HKClinicalDocumentIndexingUtilities_contentStringFromDOCXData_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 pathname];
  int v7 = [v6 hasSuffix:@"document.xml"];

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v9 + 40);
    id v10 = [v5 dataWithError:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    [v8 addObject:v10];

    *a3 = 1;
  }
}

@end