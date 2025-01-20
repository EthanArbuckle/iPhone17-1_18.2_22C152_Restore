@interface NSDictionary(UserNotifications)
- (id)un_nonEmptyCopy;
- (id)un_safeCastObjectForKey:()UserNotifications class:;
@end

@implementation NSDictionary(UserNotifications)

- (id)un_nonEmptyCopy
{
  v2 = (void *)[a1 count];
  if (v2) {
    v2 = (void *)[a1 copy];
  }

  return v2;
}

- (id)un_safeCastObjectForKey:()UserNotifications class:
{
  v5 = objc_msgSend(a1, "objectForKey:");
  v6 = UNSafeCast(a4, v5);

  return v6;
}

@end