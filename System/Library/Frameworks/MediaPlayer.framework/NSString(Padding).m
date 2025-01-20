@interface NSString(Padding)
- (id)stringByLeftPaddingToLength:()Padding withString:startingAtIndex:;
@end

@implementation NSString(Padding)

- (id)stringByLeftPaddingToLength:()Padding withString:startingAtIndex:
{
  id v8 = a4;
  v9 = objc_msgSend(&stru_1EE680640, "stringByPaddingToLength:withString:startingAtIndex:", a3 - objc_msgSend(a1, "length"), v8, a5);

  v10 = [v9 stringByAppendingString:a1];

  return v10;
}

@end