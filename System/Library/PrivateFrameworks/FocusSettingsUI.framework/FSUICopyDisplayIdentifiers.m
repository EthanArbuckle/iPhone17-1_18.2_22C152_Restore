@interface FSUICopyDisplayIdentifiers
+ (id)displayIdentifiers;
@end

@implementation FSUICopyDisplayIdentifiers

+ (id)displayIdentifiers
{
  v2 = (void *)SBSCopyDisplayIdentifiers();
  return v2;
}

@end