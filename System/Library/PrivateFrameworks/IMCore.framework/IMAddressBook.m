@interface IMAddressBook
+ (BOOL)addressBookEnabled;
+ (void)setAddressBookEnabled:(BOOL)a3;
@end

@implementation IMAddressBook

+ (void)setAddressBookEnabled:(BOOL)a3
{
  byte_1E965C2A0 = a3;
}

+ (BOOL)addressBookEnabled
{
  return byte_1E965C2A0;
}

@end