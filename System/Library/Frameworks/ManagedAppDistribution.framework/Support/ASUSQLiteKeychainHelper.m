@interface ASUSQLiteKeychainHelper
+ (BOOL)storeKey:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
+ (id)fetchKeyWithIdentifier:(id)a3 error:(id *)a4;
@end

@implementation ASUSQLiteKeychainHelper

+ (id)fetchKeyWithIdentifier:(id)a3 error:(id *)a4
{
  v6 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.app-store-utilities.encryption", a3];
  v7 = sub_100168E94((uint64_t)a1, v6, a4);

  return v7;
}

+ (BOOL)storeKey:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.app-store-utilities.encryption", a4];
  LOBYTE(a5) = sub_100169144((uint64_t)a1, v8, v9, a5);

  return (char)a5;
}

@end