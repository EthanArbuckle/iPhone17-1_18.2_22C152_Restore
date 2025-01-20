@interface NSString(UserNotificationsInternal)
- (id)un_stringWithMaxLength:()UserNotificationsInternal;
- (uint64_t)un_unsignedLongLongValue;
@end

@implementation NSString(UserNotificationsInternal)

- (id)un_stringWithMaxLength:()UserNotificationsInternal
{
  if ([a1 length] <= a3)
  {
    id v5 = a1;
  }
  else
  {
    id v5 = [a1 substringToIndex:a3];
  }

  return v5;
}

- (uint64_t)un_unsignedLongLongValue
{
  uint64_t v4 = 0;
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:a1];
  [v1 scanUnsignedLongLong:&v4];
  uint64_t v2 = v4;

  return v2;
}

@end