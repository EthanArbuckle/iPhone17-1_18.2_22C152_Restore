@interface IMConversationListTypingIndicatorLayer
- (id)defaultBubbleColor;
- (id)defaultThinkingDotColor;
@end

@implementation IMConversationListTypingIndicatorLayer

- (id)defaultBubbleColor
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_colorWithDynamicProvider_, &unk_26C9190F8);
}

- (id)defaultThinkingDotColor
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_colorWithDynamicProvider_, &unk_26C919118);
}

@end