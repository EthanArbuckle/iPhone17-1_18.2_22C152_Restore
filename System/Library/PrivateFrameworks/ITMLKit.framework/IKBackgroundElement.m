@interface IKBackgroundElement
- (IKAudioElement)audio;
- (NSArray)images;
- (UIColor)backgroundColor;
- (double)transitionInterval;
@end

@implementation IKBackgroundElement

- (NSArray)images
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(IKViewElement *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 elementType] == 49 && !objc_msgSend(v9, "imageType")) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    v10 = (void *)[v3 copy];
  }
  else {
    v10 = 0;
  }

  return (NSArray *)v10;
}

- (IKAudioElement)audio
{
  return (IKAudioElement *)[(IKViewElement *)self childElementWithType:6];
}

- (double)transitionInterval
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 transitionInterval];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (UIColor)backgroundColor
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 ikBackgroundColor];
  double v4 = [v3 color];

  return (UIColor *)v4;
}

@end