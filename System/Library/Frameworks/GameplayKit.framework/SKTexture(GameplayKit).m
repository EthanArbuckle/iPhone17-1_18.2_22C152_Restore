@interface SKTexture(GameplayKit)
+ (id)textureWithNoiseMap:()GameplayKit;
@end

@implementation SKTexture(GameplayKit)

+ (id)textureWithNoiseMap:()GameplayKit
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "__colorData");
  v5 = (void *)MEMORY[0x263F17C30];
  [v3 sampleCount];
  int v10 = v6;
  [v3 sampleCount];
  v8 = objc_msgSend(v5, "textureWithData:size:", v4, (double)v10, (double)v7);

  return v8;
}

@end