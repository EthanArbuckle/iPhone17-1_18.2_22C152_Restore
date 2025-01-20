@interface DUDocumentObjC
- (DUDocumentHTMLDataObjC)documentHTMLData;
- (DUDocumentObjC)init;
- (NSArray)documentUIElements;
- (NSArray)keywords;
- (NSDate)dateCreated;
- (NSDate)dateModified;
- (NSString)abstract;
- (NSString)comment;
- (NSString)creator;
- (NSString)headline;
- (NSString)identifier;
- (NSString)inLanguage;
- (NSString)subHeadline;
- (NSString)text;
- (NSString)version;
- (NSURL)significantLink;
- (NSURL)thumbnailUrl;
- (NSURL)url;
- (void)setAbstract:(id)a3;
- (void)setComment:(id)a3;
- (void)setCreator:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateModified:(id)a3;
- (void)setDocumentHTMLData:(id)a3;
- (void)setDocumentUIElements:(id)a3;
- (void)setHeadline:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInLanguage:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setSignificantLink:(id)a3;
- (void)setSubHeadline:(id)a3;
- (void)setText:(id)a3;
- (void)setThumbnailUrl:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DUDocumentObjC

- (void).cxx_destruct
{
}

- (void)setDocumentHTMLData:(id)a3
{
  objc_msgSend_htmlDataForObjCHTMLData_(DUObjCCompatibilityUtils, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDocumentHTMLData_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (DUDocumentHTMLDataObjC)documentHTMLData
{
  v6 = objc_msgSend_documentHTMLData(self->_underlyingDocument, a2, v2, v3, v4);

  if (v6)
  {
    v11 = objc_msgSend_documentHTMLData(self->_underlyingDocument, v7, v8, v9, v10);
    v15 = objc_msgSend_objCHTMLDataForHTMLData_(DUObjCCompatibilityUtils, v12, (uint64_t)v11, v13, v14);
  }
  else
  {
    v15 = 0;
  }
  return (DUDocumentHTMLDataObjC *)v15;
}

- (void)setDocumentUIElements:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v6);
        }
        v18 = objc_msgSend_uiElementForObjCUIElement_(DUObjCCompatibilityUtils, v9, *(void *)(*((void *)&v22 + 1) + 8 * v14), v10, v11, (void)v22);
        if (v18) {
          objc_msgSend_addObject_(v5, v15, (uint64_t)v18, v16, v17);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v12);
  }

  objc_msgSend_setDocumentUIElements_(self->_underlyingDocument, v19, (uint64_t)v5, v20, v21);
}

- (NSArray)documentUIElements
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_documentUIElements(self->_underlyingDocument, a2, v2, v3, v4);
  if (objc_msgSend_count(v5, v6, v7, v8, v9))
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v5;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v25, (uint64_t)v29, 16);
    if (v13)
    {
      uint64_t v17 = v13;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v11);
          }
          long long v23 = objc_msgSend_objCUIElementForUIElement_(DUObjCCompatibilityUtils, v14, *(void *)(*((void *)&v25 + 1) + 8 * i), v15, v16, (void)v25);
          if (v23) {
            objc_msgSend_addObject_(v10, v20, (uint64_t)v23, v21, v22);
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v25, (uint64_t)v29, 16);
      }
      while (v17);
    }
  }
  else
  {
    id v10 = 0;
  }

  return (NSArray *)v10;
}

- (void)setDateModified:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setDateModified_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSDate)dateModified
{
  return (NSDate *)objc_msgSend_dateModified(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setDateCreated:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setDateCreated_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSDate)dateCreated
{
  return (NSDate *)objc_msgSend_dateCreated(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setSignificantLink:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setSignificantLink_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSURL)significantLink
{
  return (NSURL *)objc_msgSend_significantLink(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setThumbnailUrl:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setThumbnailUrl_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSURL)thumbnailUrl
{
  return (NSURL *)objc_msgSend_thumbnailUrl(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setUrl:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setUrl_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSURL)url
{
  return (NSURL *)objc_msgSend_url(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setIdentifier:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setIdentifier_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend_identifier(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setKeywords:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setKeywords_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSArray)keywords
{
  return (NSArray *)objc_msgSend_keywords(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setInLanguage:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setInLanguage_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)inLanguage
{
  return (NSString *)objc_msgSend_inLanguage(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setText:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setText_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)text
{
  return (NSString *)objc_msgSend_text(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setComment:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setComment_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)comment
{
  return (NSString *)objc_msgSend_comment(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setAbstract:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setAbstract_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)abstract
{
  return (NSString *)objc_msgSend_abstract(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setCreator:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setCreator_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)creator
{
  return (NSString *)objc_msgSend_creator(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setVersion:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setVersion_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)version
{
  return (NSString *)objc_msgSend_version(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setSubHeadline:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setSubHeadline_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)subHeadline
{
  return (NSString *)objc_msgSend_subHeadline(self->_underlyingDocument, a2, v2, v3, v4);
}

- (void)setHeadline:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setHeadline_(self->_underlyingDocument, v6, (uint64_t)v9, v7, v8);
}

- (NSString)headline
{
  return (NSString *)objc_msgSend_headline(self->_underlyingDocument, a2, v2, v3, v4);
}

- (DUDocumentObjC)init
{
  v6.receiver = self;
  v6.super_class = (Class)DUDocumentObjC;
  uint64_t v2 = [(DUDocumentObjC *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding13DURawDocument);
    underlyingDocument = v2->_underlyingDocument;
    v2->_underlyingDocument = v3;
  }
  return v2;
}

@end