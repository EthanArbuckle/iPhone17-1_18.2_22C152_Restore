@interface NSValue(PDFExtensions)
+ (uint64_t)PDFKitValueWithPDFPoint:()PDFExtensions;
+ (uint64_t)PDFKitValueWithPDFRect:()PDFExtensions;
@end

@implementation NSValue(PDFExtensions)

+ (uint64_t)PDFKitValueWithPDFRect:()PDFExtensions
{
  return objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:");
}

+ (uint64_t)PDFKitValueWithPDFPoint:()PDFExtensions
{
  return objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
}

@end