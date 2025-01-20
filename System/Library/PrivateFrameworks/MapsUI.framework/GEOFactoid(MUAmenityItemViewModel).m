@interface GEOFactoid(MUAmenityItemViewModel)
- (id)symbolImageForFont:()MUAmenityItemViewModel;
- (uint64_t)isApplePay;
@end

@implementation GEOFactoid(MUAmenityItemViewModel)

- (uint64_t)isApplePay
{
  return 0;
}

- (id)symbolImageForFont:()MUAmenityItemViewModel
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithFont:");
  v3 = [a1 symbolName];
  uint64_t v4 = [v3 length];

  if (!v4
    || (v5 = (void *)MEMORY[0x1E4FB1818],
        [a1 symbolName],
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v6, v2),
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v7 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:withConfiguration:", @"checkmark", v2);
  }

  return v7;
}

@end