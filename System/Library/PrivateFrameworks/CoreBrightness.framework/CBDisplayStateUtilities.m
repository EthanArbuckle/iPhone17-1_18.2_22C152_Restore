@interface CBDisplayStateUtilities
+ (id)stringForDisplayMode:(int64_t)a3;
+ (id)stringForFlipbookState:(int64_t)a3;
+ (int64_t)displayModeFromProperty:(id)a3;
@end

@implementation CBDisplayStateUtilities

+ (id)stringForDisplayMode:(int64_t)a3
{
  v6 = @"Unknown";
  if (a3)
  {
    int64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    int64_t v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
        v6 = @"Off";
        break;
      case 1:
        v6 = @"Always On";
        break;
      case 2:
        v6 = @"Always On Suppressed";
        break;
      case 3:
        v6 = @"Active On";
        break;
      case 4:
        v6 = @"Active Dimmed";
        break;
      case 5:
        v6 = @"Invalid";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v6;
}

+ (id)stringForFlipbookState:(int64_t)a3
{
  v6 = @"Unknown";
  if (a3)
  {
    int64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    int64_t v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
        v6 = @"Flipbook Will Turn On";
        break;
      case 1:
        v6 = @"Flipbook Did Turn On";
        break;
      case 2:
        v6 = @"Flipbook Will Turn Off";
        break;
      case 3:
        v6 = @"Flipbook Did Turn Off";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v6;
}

+ (int64_t)displayModeFromProperty:(id)a3
{
  int64_t v5 = 5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = (void *)[a3 objectForKey:@"Value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return [v4 integerValue];
    }
  }
  return v5;
}

@end