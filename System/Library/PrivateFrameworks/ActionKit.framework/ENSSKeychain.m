@interface ENSSKeychain
+ (BOOL)deletePasswordForService:(id)a3 account:(id)a4;
+ (BOOL)deletePasswordForService:(id)a3 account:(id)a4 error:(id *)a5;
+ (BOOL)setPassword:(id)a3 forService:(id)a4 account:(id)a5;
+ (BOOL)setPassword:(id)a3 forService:(id)a4 account:(id)a5 error:(id *)a6;
+ (id)accountsForService:(id)a3;
+ (id)allAccounts;
+ (id)passwordForService:(id)a3 account:(id)a4;
+ (id)passwordForService:(id)a3 account:(id)a4 error:(id *)a5;
+ (void)accessibilityType;
+ (void)setAccessibilityType:(void *)a3;
@end

@implementation ENSSKeychain

+ (void)setAccessibilityType:(void *)a3
{
  if (ENSSKeychainAccessibilityType) {
    CFRelease((CFTypeRef)ENSSKeychainAccessibilityType);
  }
  ENSSKeychainAccessibilityType = (uint64_t)a3;
}

+ (void)accessibilityType
{
  return (void *)ENSSKeychainAccessibilityType;
}

+ (id)accountsForService:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ENSSKeychainQuery);
  [(ENSSKeychainQuery *)v4 setService:v3];

  v5 = [(ENSSKeychainQuery *)v4 fetchAll:0];

  return v5;
}

+ (id)allAccounts
{
  return (id)[a1 accountsForService:0];
}

+ (BOOL)setPassword:(id)a3 forService:(id)a4 account:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(ENSSKeychainQuery);
  [(ENSSKeychainQuery *)v12 setService:v10];

  [(ENSSKeychainQuery *)v12 setAccount:v9];
  [(ENSSKeychainQuery *)v12 setPassword:v11];

  LOBYTE(a6) = [(ENSSKeychainQuery *)v12 save:a6];
  return (char)a6;
}

+ (BOOL)setPassword:(id)a3 forService:(id)a4 account:(id)a5
{
  return [a1 setPassword:a3 forService:a4 account:a5 error:0];
}

+ (BOOL)deletePasswordForService:(id)a3 account:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(ENSSKeychainQuery);
  [(ENSSKeychainQuery *)v9 setService:v8];

  [(ENSSKeychainQuery *)v9 setAccount:v7];
  LOBYTE(a5) = [(ENSSKeychainQuery *)v9 deleteItem:a5];

  return (char)a5;
}

+ (BOOL)deletePasswordForService:(id)a3 account:(id)a4
{
  return [a1 deletePasswordForService:a3 account:a4 error:0];
}

+ (id)passwordForService:(id)a3 account:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(ENSSKeychainQuery);
  [(ENSSKeychainQuery *)v9 setService:v8];

  [(ENSSKeychainQuery *)v9 setAccount:v7];
  [(ENSSKeychainQuery *)v9 fetch:a5];
  id v10 = [(ENSSKeychainQuery *)v9 password];

  return v10;
}

+ (id)passwordForService:(id)a3 account:(id)a4
{
  return (id)[a1 passwordForService:a3 account:a4 error:0];
}

@end