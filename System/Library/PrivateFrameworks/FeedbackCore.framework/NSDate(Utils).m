@interface NSDate(Utils)
+ (id)dateWithYear:()Utils month:day:;
+ (id)tomorrow;
- (BOOL)isEarlierThan:()Utils;
@end

@implementation NSDate(Utils)

+ (id)dateWithYear:()Utils month:day:
{
  id v8 = objc_alloc(MEMORY[0x263EFF8F0]);
  v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v10 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v10 setYear:a3];
  [v10 setMonth:a4];
  [v10 setDay:a5];
  v11 = [v9 dateFromComponents:v10];

  return v11;
}

+ (id)tomorrow
{
  v0 = [MEMORY[0x263EFF910] date];
  v1 = [v0 dateByAddingTimeInterval:86400.0];

  return v1;
}

- (BOOL)isEarlierThan:()Utils
{
  return objc_msgSend(a1, "compare:") == -1;
}

@end