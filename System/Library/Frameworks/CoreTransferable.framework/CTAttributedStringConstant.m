@interface CTAttributedStringConstant
+ (NSString)documentType;
+ (NSString)html;
+ (NSString)rtf;
+ (NSString)rtfd;
+ (void)documentType;
@end

@implementation CTAttributedStringConstant

+ (NSString)documentType
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (void **)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
  uint64_t v9 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
  if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr)
  {
    v3 = (void *)UIFoundationLibrary();
    v7[3] = (uint64_t)dlsym(v3, "NSDocumentTypeDocumentAttribute");
    getNSDocumentTypeDocumentAttributeSymbolLoc_ptr = v7[3];
    v2 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    +[CTAttributedStringConstant documentType]();
  }
  v4 = *v2;

  return (NSString *)v4;
}

+ (NSString)rtf
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (void **)getNSRTFTextDocumentTypeSymbolLoc_ptr;
  uint64_t v9 = getNSRTFTextDocumentTypeSymbolLoc_ptr;
  if (!getNSRTFTextDocumentTypeSymbolLoc_ptr)
  {
    v3 = (void *)UIFoundationLibrary();
    v7[3] = (uint64_t)dlsym(v3, "NSRTFTextDocumentType");
    getNSRTFTextDocumentTypeSymbolLoc_ptr = v7[3];
    v2 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    +[CTAttributedStringConstant documentType]();
  }
  v4 = *v2;

  return (NSString *)v4;
}

+ (NSString)rtfd
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (void **)getNSRTFDTextDocumentTypeSymbolLoc_ptr;
  uint64_t v9 = getNSRTFDTextDocumentTypeSymbolLoc_ptr;
  if (!getNSRTFDTextDocumentTypeSymbolLoc_ptr)
  {
    v3 = (void *)UIFoundationLibrary();
    v7[3] = (uint64_t)dlsym(v3, "NSRTFDTextDocumentType");
    getNSRTFDTextDocumentTypeSymbolLoc_ptr = v7[3];
    v2 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    +[CTAttributedStringConstant documentType]();
  }
  v4 = *v2;

  return (NSString *)v4;
}

+ (NSString)html
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (void **)getNSHTMLTextDocumentTypeSymbolLoc_ptr;
  uint64_t v9 = getNSHTMLTextDocumentTypeSymbolLoc_ptr;
  if (!getNSHTMLTextDocumentTypeSymbolLoc_ptr)
  {
    v3 = (void *)UIFoundationLibrary();
    v7[3] = (uint64_t)dlsym(v3, "NSHTMLTextDocumentType");
    getNSHTMLTextDocumentTypeSymbolLoc_ptr = v7[3];
    v2 = (void **)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    +[CTAttributedStringConstant documentType]();
  }
  v4 = *v2;

  return (NSString *)v4;
}

+ (void)documentType
{
}

@end