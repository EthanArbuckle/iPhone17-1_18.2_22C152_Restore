@interface CKContextUIClasses
+ (BOOL)isPDFView:(id)a3;
+ (BOOL)isSFSafariView:(id)a3;
+ (BOOL)isWKWebView:(id)a3;
+ (void)lookupClasses;
@end

@implementation CKContextUIClasses

+ (void)lookupClasses
{
  classWKWebView = (uint64_t)objc_lookUpClass("WKWebView");
  classPDFView = (uint64_t)objc_lookUpClass("PDFView");
  classSFSafariView = (uint64_t)objc_lookUpClass("SFSafariView");
}

+ (BOOL)isWKWebView:(id)a3
{
  if (classWKWebView) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

+ (BOOL)isPDFView:(id)a3
{
  if (classPDFView) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

+ (BOOL)isSFSafariView:(id)a3
{
  if (classSFSafariView) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

@end