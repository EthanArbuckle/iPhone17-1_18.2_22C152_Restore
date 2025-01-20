@interface VSKeychainGenericPassword
- (BOOL)isInvisible;
- (BOOL)isNegative;
- (BOOL)isSynchronizable;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSNumber)creatorCode;
- (NSNumber)typeCode;
- (NSString)accessGroup;
- (NSString)account;
- (NSString)comment;
- (NSString)generic;
- (NSString)itemDescription;
- (NSString)label;
- (NSString)service;
- (NSString)viewHint;
- (id)_faultWhileAccessingPrimitiveValueForKey:(id)a3;
- (void)_notifyWhileSettingPrimitiveValue:(id)a3 forKey:(id)a4;
- (void)setAccessGroup:(id)a3;
- (void)setAccount:(id)a3;
- (void)setComment:(id)a3;
- (void)setCreatorCode:(id)a3;
- (void)setGeneric:(id)a3;
- (void)setInvisible:(BOOL)a3;
- (void)setItemDescription:(id)a3;
- (void)setLabel:(id)a3;
- (void)setNegative:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSynchronizable:(BOOL)a3;
- (void)setTypeCode:(id)a3;
- (void)setViewHint:(id)a3;
@end

@implementation VSKeychainGenericPassword

- (void)_notifyWhileSettingPrimitiveValue:(id)a3 forKey:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [(VSKeychainItem *)self willChangeValueForKey:v7];
  [(VSKeychainItem *)self setPrimitiveValue:v6 forKey:v7];

  [(VSKeychainGenericPassword *)self didChangeValueForKey:v7];
}

- (id)_faultWhileAccessingPrimitiveValueForKey:(id)a3
{
  id v4 = a3;
  [(VSKeychainItem *)self willAccessValueForKey:v4];
  v5 = [(VSKeychainItem *)self primitiveValueForKey:v4];
  [(VSKeychainItem *)self didAccessValueForKey:v4];

  return v5;
}

- (NSString)accessGroup
{
  return (NSString *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"accessGroup"];
}

- (void)setAccessGroup:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"accessGroup"];
}

- (NSDate)creationDate
{
  return (NSDate *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"creationDate"];
}

- (NSDate)modificationDate
{
  return (NSDate *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"modificationDate"];
}

- (NSString)itemDescription
{
  return (NSString *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"itemDescription"];
}

- (void)setItemDescription:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"itemDescription"];
}

- (NSString)comment
{
  return (NSString *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"comment"];
}

- (void)setComment:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"comment"];
}

- (NSNumber)creatorCode
{
  return (NSNumber *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"creatorCode"];
}

- (void)setCreatorCode:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"creatorCode"];
}

- (NSNumber)typeCode
{
  return (NSNumber *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"typeCode"];
}

- (void)setTypeCode:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"typeCode"];
}

- (NSString)label
{
  return (NSString *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"label"];
}

- (void)setLabel:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"label"];
}

- (BOOL)isSynchronizable
{
  v2 = [(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"synchronizable"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSynchronizable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"synchronizable"];
}

- (NSString)viewHint
{
  return (NSString *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"viewHint"];
}

- (void)setViewHint:(id)a3
{
}

- (BOOL)isInvisible
{
  v2 = [(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"invisible"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setInvisible:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"invisible"];
}

- (BOOL)isNegative
{
  v2 = [(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"negative"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNegative:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"negative"];
}

- (NSString)account
{
  return (NSString *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"account"];
}

- (void)setAccount:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"account"];
}

- (NSString)service
{
  return (NSString *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"service"];
}

- (void)setService:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"service"];
}

- (NSString)generic
{
  return (NSString *)[(VSKeychainGenericPassword *)self _faultWhileAccessingPrimitiveValueForKey:@"generic"];
}

- (void)setGeneric:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainGenericPassword *)self _notifyWhileSettingPrimitiveValue:v4 forKey:@"generic"];
}

@end