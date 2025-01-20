@interface DUDocumentHTMLDataObjC
- (DUDocumentEmailDataObjC)documentEmailData;
- (DUDocumentHTMLDataObjC)init;
- (NSString)htmlString;
- (void)setDocumentEmailData:(id)a3;
- (void)setHtmlString:(id)a3;
@end

@implementation DUDocumentHTMLDataObjC

- (void).cxx_destruct
{
}

- (void)setDocumentEmailData:(id)a3
{
  objc_msgSend_emailDataForObjCEmailData_(DUObjCCompatibilityUtils, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDocumentEmailData_(self->_underlyingElement, v6, (uint64_t)v9, v7, v8);
}

- (DUDocumentEmailDataObjC)documentEmailData
{
  v6 = objc_msgSend_documentEmailData(self->_underlyingElement, a2, v2, v3, v4);

  if (v6)
  {
    v11 = objc_msgSend_documentEmailData(self->_underlyingElement, v7, v8, v9, v10);
    v15 = objc_msgSend_objCEmailDataForEmailData_(DUObjCCompatibilityUtils, v12, (uint64_t)v11, v13, v14);
  }
  else
  {
    v15 = 0;
  }
  return (DUDocumentEmailDataObjC *)v15;
}

- (void)setHtmlString:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setHtmlString_(self->_underlyingElement, v6, (uint64_t)v9, v7, v8);
}

- (NSString)htmlString
{
  return (NSString *)objc_msgSend_htmlString(self->_underlyingElement, a2, v2, v3, v4);
}

- (DUDocumentHTMLDataObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUDocumentHTMLDataObjC;
  uint64_t v2 = [(DUDocumentHTMLDataObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding18DUDocumentHTMLData);
    underlyingElement = v2->_underlyingElement;
    v2->_underlyingElement = v3;

    v5 = v2;
  }

  return v2;
}

@end