@interface DAContainerProvider
+ (id)providerWithAddressBook:(void *)a3;
+ (id)providerWithContactStore:(id)a3;
- (BOOL)setLastSyncDateForContainer:(id)a3;
- (id)allContainers;
- (id)allContainersForAccountWithExternalIdentifier:(id)a3;
- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4;
- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10;
- (void)mergeAllRecordsIntoContainer:(id)a3 shouldInsertChangeHistoryRecords:(BOOL)a4;
- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5;
@end

@implementation DAContainerProvider

+ (id)providerWithContactStore:(id)a3
{
  id v3 = a3;
  v4 = [[_DAContactsContainerProvider alloc] initWithContactStore:v3];

  return v4;
}

+ (id)providerWithAddressBook:(void *)a3
{
  id v3 = [[_DAABLegacyContainerProvider alloc] initWithAddressBook:a3];
  return v3;
}

- (id)containerWithExternalIdentifier:(id)a3 forAccountWithExternalIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"containerWithExternalIdentifier:forAccountWithExternalIdentifier is abstract" userInfo:0];
  objc_exception_throw(v7);
}

- (id)allContainers
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"allContainers is abstract" userInfo:0];
  objc_exception_throw(v2);
}

- (id)allContainersForAccountWithExternalIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"allContainersForAccountWithExternalIdentifier is abstract" userInfo:0];
  objc_exception_throw(v4);
}

- (id)createNewContainerWithType:(int)a3 name:(id)a4 externalIdentifier:(id)a5 constraintsPath:(id)a6 syncData:(id)a7 contentReadonly:(BOOL)a8 propertiesReadonly:(BOOL)a9 forAccount:(id)a10
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a10;
  id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"createNewContainerWithType is abstract" userInfo:0];
  objc_exception_throw(v18);
}

- (void)setDefaultContainer:(id)a3 withLocalDBHelper:(id)a4 onlyIfNotSet:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"setDefaultContainer:onlyIfNotSet: is abstract" userInfo:0];
  objc_exception_throw(v8);
}

- (BOOL)setLastSyncDateForContainer:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"setLastSyncDateForContainer: is abstract" userInfo:0];
  objc_exception_throw(v4);
}

- (void)mergeAllRecordsIntoContainer:(id)a3 shouldInsertChangeHistoryRecords:(BOOL)a4
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"mergeAllRecordIntoContainer: is abstract" userInfo:0];
  objc_exception_throw(v5);
}

@end