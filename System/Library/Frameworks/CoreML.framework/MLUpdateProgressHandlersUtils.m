@interface MLUpdateProgressHandlersUtils
+ (id)progressEventsToString:(int64_t)a3;
@end

@implementation MLUpdateProgressHandlersUtils

+ (id)progressEventsToString:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([&unk_1EF11A988 count])
  {
    unint64_t v5 = 0;
    do
    {
      if (((1 << v5) & (unint64_t)a3) != 0)
      {
        v6 = [&unk_1EF11A988 objectAtIndex:v5];
        [v4 addObject:v6];
      }
      ++v5;
    }
    while (v5 < [&unk_1EF11A988 count]);
  }
  if (!a3) {
    [v4 addObject:@"Training End"];
  }
  v7 = [v4 description];

  return v7;
}

@end