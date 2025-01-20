@interface UIButtonConfiguration(ChatKitAdditions)
+ (id)ckCreateButtonConfigurationWithType:()ChatKitAdditions withImage:withTitle:withFont:;
+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withImage:;
+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withTitle:;
+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withTitle:withFont:;
@end

@implementation UIButtonConfiguration(ChatKitAdditions)

+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withTitle:
{
  return [a1 ckCreateButtonConfigurationWithType:a3 withImage:0 withTitle:a4 withFont:0];
}

+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withTitle:withFont:
{
  return [a1 ckCreateButtonConfigurationWithType:a3 withImage:0 withTitle:a4 withFont:a5];
}

+ (uint64_t)ckCreateButtonConfigurationWithType:()ChatKitAdditions withImage:
{
  return [a1 ckCreateButtonConfigurationWithType:a3 withImage:a4 withTitle:0 withFont:0];
}

+ (id)ckCreateButtonConfigurationWithType:()ChatKitAdditions withImage:withTitle:withFont:
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  switch(a3)
  {
    case 0:
      uint64_t v12 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
      goto LABEL_8;
    case 1:
      uint64_t v12 = [MEMORY[0x1E4F427E8] grayButtonConfiguration];
      goto LABEL_8;
    case 2:
      uint64_t v12 = [MEMORY[0x1E4F427E8] tintedButtonConfiguration];
      goto LABEL_8;
    case 3:
      uint64_t v12 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
LABEL_8:
      v13 = (void *)v12;
      if (v9) {
        goto LABEL_9;
      }
      goto LABEL_10;
    default:
      v13 = 0;
      if (!v9) {
        goto LABEL_10;
      }
LABEL_9:
      [v13 setImage:v9];
LABEL_10:
      if (v10)
      {
        if (v11)
        {
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v11 forKey:*MEMORY[0x1E4FB06F8]];
          v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v14];
          [v13 setAttributedTitle:v15];
        }
        else
        {
          [v13 setTitle:v10];
        }
      }

      return v13;
  }
}

@end