@interface NSMutableDictionary(UserNotifications)
- (uint64_t)un_safeSetObject:()UserNotifications forKey:;
@end

@implementation NSMutableDictionary(UserNotifications)

- (uint64_t)un_safeSetObject:()UserNotifications forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  else {
    return [a1 removeObjectForKey:a4];
  }
}

@end