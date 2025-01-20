@interface NSReadMutableAttributedStringWithCoder
@end

@implementation NSReadMutableAttributedStringWithCoder

Class ___NSReadMutableAttributedStringWithCoder_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  qword_1EB1EC970 = (uint64_t)(id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  Class Class = objc_getClass("NSParagraphStyle");
  if (Class) {
    [(id)qword_1EB1EC970 addObject:Class];
  }
  Class v10 = objc_getClass("NSGlyphInfo");
  if (v10) {
    [(id)qword_1EB1EC970 addObject:v10];
  }
  Class v11 = objc_getClass("NSTextAlternatives");
  if (v11) {
    [(id)qword_1EB1EC970 addObject:v11];
  }
  Class v12 = objc_getClass("NSTextAttachment");
  if (v12) {
    [(id)qword_1EB1EC970 addObject:v12];
  }
  Class v13 = objc_getClass("NSShadow");
  if (v13) {
    [(id)qword_1EB1EC970 addObject:v13];
  }
  Class v14 = objc_getClass("NSAdaptiveImageGlyph");
  if (v14) {
    [(id)qword_1EB1EC970 addObject:v14];
  }
  Class v15 = objc_getClass("NSFont");
  if (v15) {
    [(id)qword_1EB1EC970 addObject:v15];
  }
  Class v16 = objc_getClass("UIFont");
  if (v16) {
    [(id)qword_1EB1EC970 addObject:v16];
  }
  Class v17 = objc_getClass("NSColor");
  if (v17) {
    [(id)qword_1EB1EC970 addObject:v17];
  }
  Class v18 = objc_getClass("UIColor");
  if (v18) {
    [(id)qword_1EB1EC970 addObject:v18];
  }
  qword_1EB1EC978 = [(id)qword_1EB1EC970 mutableCopy];
  Class result = objc_getClass("NSTextEncapsulation");
  if (result)
  {
    Class v20 = result;
    v21 = (void *)qword_1EB1EC978;
    return (Class)[v21 addObject:v20];
  }
  return result;
}

@end