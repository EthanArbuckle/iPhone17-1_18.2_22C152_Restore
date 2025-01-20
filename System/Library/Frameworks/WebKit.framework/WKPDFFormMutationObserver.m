@interface WKPDFFormMutationObserver
- (WKPDFFormMutationObserver)initWithPlugin:(void *)a3;
- (void)formChanged:(id)a3;
@end

@implementation WKPDFFormMutationObserver

- (WKPDFFormMutationObserver)initWithPlugin:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKPDFFormMutationObserver;
  result = [(WKPDFFormMutationObserver *)&v5 init];
  if (result) {
    result->_plugin = a3;
  }
  return result;
}

- (void)formChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *((unsigned char *)self->_plugin + 576) = 1;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PDFFormFieldName");
  plugin = (id *)self->_plugin;
  v6 = (void *)[plugin[37] annotationsForFieldName:v4];
  v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(WebKit **)(*((void *)&v13 + 1) + 8 * i);
        unsigned __int8 v12 = WebKit::UnifiedPDFPlugin::repaintRequirementsForAnnotation(v11, 0);
        WebKit::UnifiedPDFPlugin::setNeedsRepaintForAnnotation((uint64_t)plugin, v11, v12);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  if (v7) {
    CFRelease(v7);
  }
}

@end