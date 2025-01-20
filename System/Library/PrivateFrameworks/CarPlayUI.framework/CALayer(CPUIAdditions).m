@interface CALayer(CPUIAdditions)
- (uint64_t)cpui_startAnimating;
- (void)cpui_enumerateSublayersWithBlock:()CPUIAdditions;
@end

@implementation CALayer(CPUIAdditions)

- (void)cpui_enumerateSublayersWithBlock:()CPUIAdditions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = a3;
  v4[2](v4, a1);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = objc_msgSend(a1, "sublayers", 0);
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "cpui_enumerateSublayersWithBlock:", v4);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (uint64_t)cpui_startAnimating
{
  LODWORD(a2) = 1.0;
  [a1 setSpeed:a2];
  [a1 setTimeOffset:0.0];
  return [a1 setBeginTime:0.0];
}

@end