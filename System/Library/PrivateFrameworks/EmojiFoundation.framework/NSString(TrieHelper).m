@interface NSString(TrieHelper)
- (id)getLowercaseCharacterAt:()TrieHelper locale:;
@end

@implementation NSString(TrieHelper)

- (id)getLowercaseCharacterAt:()TrieHelper locale:
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "substringWithRange:", a3, 1);
  v8 = [v7 lowercaseStringWithLocale:v6];

  return v8;
}

@end