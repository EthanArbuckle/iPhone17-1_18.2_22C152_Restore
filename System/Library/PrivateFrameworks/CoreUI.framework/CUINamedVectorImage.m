@interface CUINamedVectorImage
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4;
- (CGPDFDocument)pdfDocument;
- (double)scale;
@end

@implementation CUINamedVectorImage

- (double)scale
{
  return (double)[(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] themeScale];
}

- (CGPDFDocument)pdfDocument
{
  _CUILog(4, (uint64_t)"CoreUI: attempting to get a pdfDocumement from a CUINamedVectorImage use the subclasses instead", v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  _CUILog(4, (uint64_t)"-[CUINamedVectorImage rasterizeImageUsingScaleFactor:forTargetSize:] called in the abstract class", v4, v5, v6, v7, v8, v9, vars0);
  return 0;
}

@end