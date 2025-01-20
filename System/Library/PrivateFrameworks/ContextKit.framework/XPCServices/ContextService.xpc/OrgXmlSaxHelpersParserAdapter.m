@interface OrgXmlSaxHelpersParserAdapter
+ (const)__metadata;
- (BOOL)getFeatureWithNSString:(id)a3;
- (OrgXmlSaxHelpersParserAdapter)init;
- (OrgXmlSaxHelpersParserAdapter)initWithOrgXmlSaxParser:(id)a3;
- (id)getContentHandler;
- (id)getDTDHandler;
- (id)getEntityResolver;
- (id)getErrorHandler;
- (id)getPropertyWithNSString:(id)a3;
- (id)makeExceptionWithNSString:(id)a3;
- (id)processNameWithNSString:(id)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5;
- (id)setupParser;
- (void)charactersWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)checkNotParsingWithNSString:(id)a3 withNSString:(id)a4;
- (void)dealloc;
- (void)endDocument;
- (void)endElementWithNSString:(id)a3;
- (void)ignorableWhitespaceWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)parseWithNSString:(id)a3;
- (void)parseWithOrgXmlSaxInputSource:(id)a3;
- (void)processingInstructionWithNSString:(id)a3 withNSString:(id)a4;
- (void)reportErrorWithNSString:(id)a3;
- (void)setContentHandlerWithOrgXmlSaxContentHandler:(id)a3;
- (void)setDTDHandlerWithOrgXmlSaxDTDHandler:(id)a3;
- (void)setDocumentLocatorWithOrgXmlSaxLocator:(id)a3;
- (void)setEntityResolverWithOrgXmlSaxEntityResolver:(id)a3;
- (void)setErrorHandlerWithOrgXmlSaxErrorHandler:(id)a3;
- (void)setFeatureWithNSString:(id)a3 withBoolean:(BOOL)a4;
- (void)setPropertyWithNSString:(id)a3 withId:(id)a4;
- (void)setupWithOrgXmlSaxParser:(id)a3;
- (void)startDocument;
- (void)startElementWithNSString:(id)a3 withOrgXmlSaxAttributeList:(id)a4;
@end

@implementation OrgXmlSaxHelpersParserAdapter

- (OrgXmlSaxHelpersParserAdapter)init
{
  return self;
}

- (OrgXmlSaxHelpersParserAdapter)initWithOrgXmlSaxParser:(id)a3
{
  return self;
}

- (void)setupWithOrgXmlSaxParser:(id)a3
{
}

- (void)setFeatureWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ([a3 isEqual:off_10055C068])
  {
    sub_1001ABC68((uint64_t)self, @"feature", (uint64_t)a3, v7, v8, v9, v10, v11);
    self->namespaces_ = a4;
    if (!a4 && !self->prefixes_) {
      self->prefixes_ = 1;
    }
  }
  else if ([a3 isEqual:off_10055C070])
  {
    sub_1001ABC68((uint64_t)self, @"feature", (uint64_t)a3, v12, v13, v14, v15, v16);
    self->prefixes_ = a4;
    if (!a4 && !self->namespaces_) {
      self->namespaces_ = 1;
    }
  }
  else
  {
    if (![a3 isEqual:off_10055C078])
    {
      CFStringRef v24 = JreStrcat("$$", v17, v18, v19, v20, v21, v22, v23, @"Feature: ");
      v25 = new_OrgXmlSaxSAXNotRecognizedException_initWithNSString_((uint64_t)v24);
      objc_exception_throw(v25);
    }
    sub_1001ABC68((uint64_t)self, @"feature", (uint64_t)a3, v19, v20, v21, v22, v23);
    self->uris_ = a4;
  }
}

- (BOOL)getFeatureWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ([a3 isEqual:off_10055C068])
  {
    uint64_t v5 = 96;
  }
  else if ([a3 isEqual:off_10055C070])
  {
    uint64_t v5 = 97;
  }
  else
  {
    if (([a3 isEqual:off_10055C078] & 1) == 0)
    {
      CFStringRef v14 = JreStrcat("$$", v6, v7, v8, v9, v10, v11, v12, @"Feature: ");
      uint64_t v15 = new_OrgXmlSaxSAXNotRecognizedException_initWithNSString_((uint64_t)v14);
      objc_exception_throw(v15);
    }
    uint64_t v5 = 98;
  }
  return *((unsigned char *)&self->super.isa + v5);
}

- (void)setPropertyWithNSString:(id)a3 withId:(id)a4
{
  CFStringRef v8 = JreStrcat("$$", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, @"Property: ");
  uint64_t v9 = new_OrgXmlSaxSAXNotRecognizedException_initWithNSString_((uint64_t)v8);
  objc_exception_throw(v9);
}

- (id)getPropertyWithNSString:(id)a3
{
  CFStringRef v8 = JreStrcat("$$", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, @"Property: ");
  uint64_t v9 = new_OrgXmlSaxSAXNotRecognizedException_initWithNSString_((uint64_t)v8);
  objc_exception_throw(v9);
}

- (void)setEntityResolverWithOrgXmlSaxEntityResolver:(id)a3
{
}

- (id)getEntityResolver
{
  return self->entityResolver_;
}

- (void)setDTDHandlerWithOrgXmlSaxDTDHandler:(id)a3
{
}

- (id)getDTDHandler
{
  return self->dtdHandler_;
}

- (void)setContentHandlerWithOrgXmlSaxContentHandler:(id)a3
{
}

- (id)getContentHandler
{
  return self->contentHandler_;
}

- (void)setErrorHandlerWithOrgXmlSaxErrorHandler:(id)a3
{
}

- (id)getErrorHandler
{
  return self->errorHandler_;
}

- (void)parseWithNSString:(id)a3
{
  uint64_t v4 = new_OrgXmlSaxInputSource_initWithNSString_((uint64_t)a3);
  [(OrgXmlSaxHelpersParserAdapter *)self parseWithOrgXmlSaxInputSource:v4];
}

- (void)parseWithOrgXmlSaxInputSource:(id)a3
{
  if (self->parsing_)
  {
    uint64_t v6 = new_OrgXmlSaxSAXException_initWithNSString_(@"Parser is already in use");
    objc_exception_throw(v6);
  }
  -[OrgXmlSaxHelpersParserAdapter setupParser]_0((uint64_t)self);
  self->parsing_ = 1;
  parser = self->parser_;
  if (!parser) {
    JreThrowNullPointerException();
  }
  [(OrgXmlSaxParser *)parser parseWithOrgXmlSaxInputSource:a3];
  self->parsing_ = 0;
}

- (id)setupParser
{
  if (!*(unsigned char *)(a1 + 97) && !*(unsigned char *)(a1 + 96))
  {
    CFStringRef v8 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v8);
  }
  v2 = *(void **)(a1 + 48);
  if (!v2) {
    goto LABEL_19;
  }
  [v2 reset];
  if (*(unsigned char *)(a1 + 98)) {
    [*(id *)(a1 + 48) setNamespaceDeclUrisWithBoolean:1];
  }
  if (*(void *)(a1 + 16))
  {
    uint64_t v3 = *(void **)(a1 + 80);
    if (!v3) {
      goto LABEL_19;
    }
    objc_msgSend(v3, "setEntityResolverWithOrgXmlSaxEntityResolver:");
  }
  if (*(void *)(a1 + 24))
  {
    uint64_t v4 = *(void **)(a1 + 80);
    if (!v4) {
      goto LABEL_19;
    }
    objc_msgSend(v4, "setDTDHandlerWithOrgXmlSaxDTDHandler:");
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = *(void **)(a1 + 80);
    if (!v5) {
      goto LABEL_19;
    }
    objc_msgSend(v5, "setErrorHandlerWithOrgXmlSaxErrorHandler:");
  }
  uint64_t v6 = *(void **)(a1 + 80);
  if (!v6) {
LABEL_19:
  }
    JreThrowNullPointerException();
  [v6 setDocumentHandlerWithOrgXmlSaxDocumentHandler:a1];
  return JreStrongAssign((id *)(a1 + 8), 0);
}

- (void)setDocumentLocatorWithOrgXmlSaxLocator:(id)a3
{
  JreStrongAssign((id *)&self->locator_, a3);
  contentHandler = self->contentHandler_;
  if (contentHandler)
  {
    [(OrgXmlSaxContentHandler *)contentHandler setDocumentLocatorWithOrgXmlSaxLocator:a3];
  }
}

- (void)startDocument
{
  contentHandler = self->contentHandler_;
  if (contentHandler) {
    [(OrgXmlSaxContentHandler *)contentHandler startDocument];
  }
}

- (void)endDocument
{
  contentHandler = self->contentHandler_;
  if (contentHandler) {
    [(OrgXmlSaxContentHandler *)contentHandler endDocument];
  }
}

- (void)startElementWithNSString:(id)a3 withOrgXmlSaxAttributeList:(id)a4
{
  if (!self->namespaces_)
  {
    if (!self->contentHandler_) {
      return;
    }
    attAdapter = self->attAdapter_;
    if (attAdapter)
    {
      [(OrgXmlSaxHelpersParserAdapter_AttributeListAdapter *)attAdapter setAttributeListWithOrgXmlSaxAttributeList:a4];
      if (a3)
      {
        contentHandler = self->contentHandler_;
        id v42 = [a3 intern];
        v43 = self->attAdapter_;
        [(OrgXmlSaxContentHandler *)contentHandler startElementWithNSString:&stru_10048C1F8 withNSString:&stru_10048C1F8 withNSString:v42 withOrgXmlSaxAttributes:v43];
        return;
      }
    }
LABEL_57:
    JreThrowNullPointerException();
  }
  nsSupport = self->nsSupport_;
  if (!nsSupport) {
    goto LABEL_57;
  }
  [(OrgXmlSaxHelpersNamespaceSupport *)nsSupport pushContext];
  if (!a4) {
    goto LABEL_57;
  }
  int v51 = [a4 getLength];
  if (v51 < 1)
  {
    atts = self->atts_;
    p_atts = &self->atts_;
    if (atts)
    {
      [(OrgXmlSaxHelpersAttributesImpl *)atts clear];
      goto LABEL_50;
    }
    goto LABEL_57;
  }
  id v52 = a4;
  uint64_t v8 = 0;
  do
  {
    id v9 = [v52 getNameWithInt:v8];
    if (!v9) {
      goto LABEL_57;
    }
    uint64_t v10 = v9;
    if ([v9 hasPrefix:@"xmlns"])
    {
      unsigned int v11 = [v10 indexOf:58];
      if (v11 == 5)
      {
        CFStringRef v13 = (const __CFString *)[v10 substring:6];
      }
      else
      {
        if (v11 != -1) {
          goto LABEL_17;
        }
        unsigned int v12 = [v10 length];
        CFStringRef v13 = &stru_10048C1F8;
        if (v12 != 5) {
          goto LABEL_17;
        }
      }
      id v14 = [v52 getValueWithInt:v8];
      if ([(OrgXmlSaxHelpersNamespaceSupport *)self->nsSupport_ declarePrefixWithNSString:v13 withNSString:v14])
      {
        uint64_t v22 = self->contentHandler_;
        if (v22) {
          [(OrgXmlSaxContentHandler *)v22 startPrefixMappingWithNSString:v13 withNSString:v14];
        }
      }
      else
      {
        [(OrgXmlSaxHelpersParserAdapter *)self reportErrorWithNSString:JreStrcat("$$", v15, v16, v17, v18, v19, v20, v21, @"Illegal Namespace prefix: ")];
      }
    }
LABEL_17:
    uint64_t v8 = (v8 + 1);
  }
  while (v51 != v8);
  uint64_t v23 = self->atts_;
  p_atts = &self->atts_;
  if (!v23) {
    goto LABEL_57;
  }
  id v49 = a3;
  [(OrgXmlSaxHelpersAttributesImpl *)v23 clear];
  uint64_t v24 = 0;
  do
  {
    id v25 = [v52 getNameWithInt:v24];
    id v26 = [v52 getTypeWithInt:v24];
    id v27 = [v52 getValueWithInt:v24];
    if (!v25) {
      goto LABEL_57;
    }
    id v28 = v27;
    if (![v25 hasPrefix:@"xmlns"])
    {
LABEL_25:
      v31 = sub_1001AC6C0(self, v25, 1, 1);
      v32 = v31;
      if (!v31) {
        JreThrowNullPointerException();
      }
      uint64_t size = v31->super.size_;
      if ((int)size < 1) {
        IOSArray_throwOutOfBoundsWithMsg(size, 0);
      }
      if ((int)size < 2) {
        IOSArray_throwOutOfBoundsWithMsg(size, 1);
      }
      if ((int)size <= 2) {
        IOSArray_throwOutOfBoundsWithMsg(size, 2);
      }
      [(OrgXmlSaxHelpersAttributesImpl *)*p_atts addAttributeWithNSString:v32->elementType_ withNSString:v32->buffer_[0] withNSString:v32->buffer_[1] withNSString:v26 withNSString:v28];
      goto LABEL_30;
    }
    unsigned int v29 = [v25 indexOf:58];
    if (v29 == 5)
    {
      CFStringRef v30 = (const __CFString *)[v25 substring:6];
      if (!v30) {
        goto LABEL_25;
      }
    }
    else
    {
      if (v29 != -1) {
        goto LABEL_25;
      }
      CFStringRef v30 = &stru_10048C1F8;
      if ([v25 length] != 5) {
        goto LABEL_25;
      }
    }
    if (self->prefixes_)
    {
      v34 = self->atts_;
      if (self->uris_)
      {
        CFStringRef v35 = (const __CFString *)OrgXmlSaxHelpersNamespaceSupport_XMLNS_;
        id v36 = [v25 intern];
        v37 = v34;
        CFStringRef v38 = v35;
        CFStringRef v39 = v30;
      }
      else
      {
        id v36 = [v25 intern];
        v37 = v34;
        CFStringRef v38 = &stru_10048C1F8;
        CFStringRef v39 = &stru_10048C1F8;
      }
      [(OrgXmlSaxHelpersAttributesImpl *)v37 addAttributeWithNSString:v38 withNSString:v39 withNSString:v36 withNSString:v26 withNSString:v28];
    }
LABEL_30:
    uint64_t v24 = (v24 + 1);
  }
  while (v51 != v24);
  a3 = v49;
LABEL_50:
  if (self->contentHandler_)
  {
    v45 = sub_1001AC6C0(self, a3, 0, 0);
    v46 = v45;
    if (!v45) {
      JreThrowNullPointerException();
    }
    v47 = self->contentHandler_;
    uint64_t v48 = v45->super.size_;
    if ((int)v48 < 1) {
      IOSArray_throwOutOfBoundsWithMsg(v48, 0);
    }
    if ((int)v48 < 2) {
      IOSArray_throwOutOfBoundsWithMsg(v48, 1);
    }
    if ((int)v48 <= 2) {
      IOSArray_throwOutOfBoundsWithMsg(v48, 2);
    }
    [(OrgXmlSaxContentHandler *)v47 startElementWithNSString:v46->elementType_ withNSString:v46->buffer_[0] withNSString:v46->buffer_[1] withOrgXmlSaxAttributes:*p_atts];
  }
}

- (void)endElementWithNSString:(id)a3
{
  if (self->namespaces_)
  {
    uint64_t v4 = sub_1001AC6C0(self, a3, 0, 0);
    if (self->contentHandler_)
    {
      uint64_t v5 = v4;
      if (!v4) {
        goto LABEL_24;
      }
      uint64_t size = v4->super.size_;
      if ((int)size < 1) {
        IOSArray_throwOutOfBoundsWithMsg(size, 0);
      }
      if ((int)size < 2) {
        IOSArray_throwOutOfBoundsWithMsg(size, 1);
      }
      if ((int)size <= 2) {
        IOSArray_throwOutOfBoundsWithMsg(size, 2);
      }
      [(OrgXmlSaxContentHandler *)self->contentHandler_ endElementWithNSString:v5->elementType_ withNSString:v5->buffer_[0] withNSString:v5->buffer_[1]];
      nsSupport = self->nsSupport_;
      if (!nsSupport) {
        goto LABEL_24;
      }
      id v8 = [(OrgXmlSaxHelpersNamespaceSupport *)nsSupport getDeclaredPrefixes];
      if (!v8) {
        goto LABEL_24;
      }
      id v9 = v8;
      if ([v8 hasMoreElements])
      {
        do
        {
          id v10 = [v9 nextElement];
          objc_opt_class();
          if (v10 && (objc_opt_isKindOfClass() & 1) == 0) {
            JreThrowClassCastException();
          }
          [(OrgXmlSaxContentHandler *)self->contentHandler_ endPrefixMappingWithNSString:v10];
        }
        while (([v9 hasMoreElements] & 1) != 0);
      }
    }
    unsigned int v11 = self->nsSupport_;
    if (v11)
    {
      [(OrgXmlSaxHelpersNamespaceSupport *)v11 popContext];
      return;
    }
LABEL_24:
    JreThrowNullPointerException();
  }
  contentHandler = self->contentHandler_;
  if (!contentHandler) {
    return;
  }
  if (!a3) {
    goto LABEL_24;
  }
  id v13 = [a3 intern];
  [(OrgXmlSaxContentHandler *)contentHandler endElementWithNSString:&stru_10048C1F8 withNSString:&stru_10048C1F8 withNSString:v13];
}

- (void)charactersWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  contentHandler = self->contentHandler_;
  if (contentHandler) {
    [(OrgXmlSaxContentHandler *)contentHandler charactersWithCharArray:a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
  }
}

- (void)ignorableWhitespaceWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  contentHandler = self->contentHandler_;
  if (contentHandler) {
    [(OrgXmlSaxContentHandler *)contentHandler ignorableWhitespaceWithCharArray:a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
  }
}

- (void)processingInstructionWithNSString:(id)a3 withNSString:(id)a4
{
  contentHandler = self->contentHandler_;
  if (contentHandler) {
    [(OrgXmlSaxContentHandler *)contentHandler processingInstructionWithNSString:a3 withNSString:a4];
  }
}

- (id)processNameWithNSString:(id)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5
{
  return sub_1001AC6C0(self, a3, a4, a5);
}

- (void)reportErrorWithNSString:(id)a3
{
  errorHandler = self->errorHandler_;
  if (errorHandler)
  {
    uint64_t v4 = sub_1001ACA14((uint64_t)self, (uint64_t)a3);
    [(OrgXmlSaxErrorHandler *)errorHandler errorWithOrgXmlSaxSAXParseException:v4];
  }
}

- (id)makeExceptionWithNSString:(id)a3
{
  return sub_1001ACA14((uint64_t)self, (uint64_t)a3);
}

- (void)checkNotParsingWithNSString:(id)a3 withNSString:(id)a4
{
  sub_1001ABC68((uint64_t)self, (uint64_t)a3, (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxHelpersParserAdapter;
  [(OrgXmlSaxHelpersParserAdapter *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100417508;
}

@end