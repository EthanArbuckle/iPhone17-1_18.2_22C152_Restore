@interface CALayer(AmbientUI)
+ (id)ringLayerWithBlendMode:()AmbientUI cornerRadius:borderWidth:;
@end

@implementation CALayer(AmbientUI)

+ (id)ringLayerWithBlendMode:()AmbientUI cornerRadius:borderWidth:
{
  v7 = (void *)MEMORY[0x263F157E8];
  id v8 = a5;
  v9 = [v7 layer];
  [v9 setOpacity:0.0];
  [v9 setCornerRadius:a1];
  [v9 setBorderWidth:a2];
  v10 = [MEMORY[0x263F157C8] filterWithType:v8];

  [v9 setCompositingFilter:v10];

  return v9;
}

@end