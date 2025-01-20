@interface UIColor(DOCTag)
+ (id)_doc_interfaceColorForTag:()DOCTag withAlphaComponent:;
+ (id)_doc_underlyingColorForTagColor:()DOCTag;
+ (uint64_t)doc_colorForTagColor:()DOCTag;
+ (uint64_t)doc_secondaryColorForTagColor:()DOCTag;
@end

@implementation UIColor(DOCTag)

+ (uint64_t)doc_colorForTagColor:()DOCTag
{
  return objc_msgSend(a1, "_doc_interfaceColorForTag:withAlphaComponent:", 1.0);
}

+ (id)_doc_interfaceColorForTag:()DOCTag withAlphaComponent:
{
  if (a4 <= 1) {
    a4 = 1;
  }
  v5 = objc_msgSend(MEMORY[0x263F825C8], "_doc_underlyingColorForTagColor:", a4);
  v6 = [v5 colorWithAlphaComponent:a1];

  if (v6 && UIAccessibilityIsInvertColorsEnabled())
  {
    uint64_t v7 = objc_msgSend(v6, "_doc_invertedColor");

    v6 = (void *)v7;
  }

  return v6;
}

+ (id)_doc_underlyingColorForTagColor:()DOCTag
{
  if (_doc_underlyingColorForTagColor__onceToken != -1) {
    dispatch_once(&_doc_underlyingColorForTagColor__onceToken, &__block_literal_global_10);
  }
  if ([(id)_doc_underlyingColorForTagColor__colors count] <= a3) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = a3;
  }
  v5 = [(id)_doc_underlyingColorForTagColor__colors objectAtIndexedSubscript:v4];

  return v5;
}

+ (uint64_t)doc_secondaryColorForTagColor:()DOCTag
{
  return objc_msgSend(a1, "_doc_interfaceColorForTag:withAlphaComponent:", 0.2);
}

@end