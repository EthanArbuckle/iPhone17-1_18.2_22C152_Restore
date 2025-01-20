@interface UIButtonConfiguration
@end

@implementation UIButtonConfiguration

id __59__UIButtonConfiguration_MapsUI___setupButtonConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  v4 = (void *)[v3 copy];

  return v4;
}

uint64_t __83__UIButtonConfiguration_MapsUI___mapsui_textButtonConfigurationWithFont_textColor___block_invoke()
{
  return [MEMORY[0x1E4FB1618] clearColor];
}

id __83__UIButtonConfiguration_MapsUI___mapsui_textButtonConfigurationWithFont_textColor___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  if (UIAccessibilityButtonShapesEnabled()) {
    [v3 setObject:&unk_1EE404AF0 forKeyedSubscript:*MEMORY[0x1E4FB0808]];
  }
  v4 = (void *)[v3 copy];

  return v4;
}

id __88__UIButtonConfiguration_MUPlaceHeaderButtonExtras___setupDirectionsButtonConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  v4 = (void *)[v2 copy];
  return v4;
}

@end