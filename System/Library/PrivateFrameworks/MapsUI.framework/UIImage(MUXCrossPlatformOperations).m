@interface UIImage(MUXCrossPlatformOperations)
+ (id)_mapsui_customSymbolImageNamed:()MUXCrossPlatformOperations withConfiguration:;
+ (id)_mapsui_resolvedSymbolImageNamed:()MUXCrossPlatformOperations withConfiguration:;
+ (uint64_t)_mapsui_systemImageNamed:()MUXCrossPlatformOperations;
+ (uint64_t)_mapsui_systemImageNamed:()MUXCrossPlatformOperations withConfiguration:;
@end

@implementation UIImage(MUXCrossPlatformOperations)

+ (uint64_t)_mapsui_systemImageNamed:()MUXCrossPlatformOperations
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:");
}

+ (uint64_t)_mapsui_systemImageNamed:()MUXCrossPlatformOperations withConfiguration:
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:withConfiguration:");
}

+ (id)_mapsui_customSymbolImageNamed:()MUXCrossPlatformOperations withConfiguration:
{
  v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 _mapsuiBundle];
  v10 = [v5 imageNamed:v8 inBundle:v9 withConfiguration:v7];

  return v10;
}

+ (id)_mapsui_resolvedSymbolImageNamed:()MUXCrossPlatformOperations withConfiguration:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_customSymbolImageNamed:withConfiguration:", v5, v6);
  if (!v7)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:withConfiguration:", v5, v6);
  }

  return v7;
}

@end