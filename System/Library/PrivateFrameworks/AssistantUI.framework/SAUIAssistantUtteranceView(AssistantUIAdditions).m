@interface SAUIAssistantUtteranceView(AssistantUIAdditions)
- (id)afui_insertionContext;
@end

@implementation SAUIAssistantUtteranceView(AssistantUIAdditions)

- (id)afui_insertionContext
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [a1 encodedClassName];
  if (v3) {
    [v2 setObject:v3 forKey:*MEMORY[0x263F65D38]];
  }
  v4 = [a1 dialogIdentifier];
  if (v4) {
    [v2 setObject:v4 forKey:*MEMORY[0x263F65D40]];
  }

  return v2;
}

@end