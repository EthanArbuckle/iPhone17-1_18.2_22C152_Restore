@interface UIFont(FIUINonBoldingFonts)
+ (CTFontRef)_fiui_nonBoldedVersionOfFont:()FIUINonBoldingFonts size:;
+ (id)fiui_nonBoldingRoundedSystemFontOfSize:()FIUINonBoldingFonts weight:;
+ (id)fiui_nonBoldingSystemFontOfSize:()FIUINonBoldingFonts;
+ (id)fiui_nonBoldingSystemFontOfSize:()FIUINonBoldingFonts weight:;
@end

@implementation UIFont(FIUINonBoldingFonts)

+ (id)fiui_nonBoldingRoundedSystemFontOfSize:()FIUINonBoldingFonts weight:
{
  v4 = objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:weight:design:", *MEMORY[0x263F03B70]);
  v5 = objc_msgSend(a1, "_fiui_nonBoldedVersionOfFont:size:", v4, a2);

  return v5;
}

+ (CTFontRef)_fiui_nonBoldedVersionOfFont:()FIUINonBoldingFonts size:
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v10 = *MEMORY[0x263F03AD0];
    v11[0] = &unk_26CF75580;
    v5 = NSDictionary;
    v6 = a4;
    v7 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[v5 dictionaryWithObjects:v11 forKeys:&v10 count:1]);
    CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes(v6, a1, 0, v7);

    CFRelease(v7);
  }
  else
  {
    CTFontRef CopyWithAttributes = 0;
  }
  return CopyWithAttributes;
}

+ (id)fiui_nonBoldingSystemFontOfSize:()FIUINonBoldingFonts
{
  v4 = objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:");
  v5 = objc_msgSend(a1, "_fiui_nonBoldedVersionOfFont:size:", v4, a2);

  return v5;
}

+ (id)fiui_nonBoldingSystemFontOfSize:()FIUINonBoldingFonts weight:
{
  v4 = objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:weight:");
  v5 = objc_msgSend(a1, "_fiui_nonBoldedVersionOfFont:size:", v4, a2);

  return v5;
}

@end