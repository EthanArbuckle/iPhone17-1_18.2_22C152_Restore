@interface DULanguageTaggingResponseObjC
- (DUDebugInfoObjC)responseDebugInfo;
- (DULanguageTaggingResponseObjC)init;
- (NSArray)languageTags;
- (void)setLanguageTags:(id)a3;
- (void)setResponseDebugInfo:(id)a3;
@end

@implementation DULanguageTaggingResponseObjC

- (void).cxx_destruct
{
}

- (void)setResponseDebugInfo:(id)a3
{
  objc_msgSend_debugInfoForObjCDebugInfo_(DUObjCCompatibilityUtils, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseDebugInfo_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (DUDebugInfoObjC)responseDebugInfo
{
  v5 = objc_msgSend_responseDebugInfo(self->_underlying, a2, v2, v3, v4);
  id v9 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v6, (uint64_t)v5, v7, v8);

  return (DUDebugInfoObjC *)v9;
}

- (void)setLanguageTags:(id)a3
{
  objc_msgSend_setLanguageTags_(self->_underlying, a2, (uint64_t)a3, v3, v4);
}

- (NSArray)languageTags
{
  return (NSArray *)objc_msgSend_languageTags(self->_underlying, a2, v2, v3, v4);
}

- (DULanguageTaggingResponseObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DULanguageTaggingResponseObjC;
  uint64_t v2 = [(DULanguageTaggingResponseObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding25DULanguageTaggingResponse);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

@end