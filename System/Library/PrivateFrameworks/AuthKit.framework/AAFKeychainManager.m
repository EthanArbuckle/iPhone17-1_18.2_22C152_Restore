@interface AAFKeychainManager
- (BOOL)addWithItem:(id)a3 error:(id *)a4;
- (BOOL)deleteKeychainItemsFor:(id)a3 error:(id *)a4;
- (id)keychainItemFor:(id)a3;
- (id)keychainItemsForDescriptor:(id)a3 withGroup:(id)a4 error:(id *)a5;
@end

@implementation AAFKeychainManager

- (BOOL)addWithItem:(id)a3 error:(id *)a4
{
  return sub_1000E2EBC(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_addKeychainItem_error_, "Keychain item added successfully", "Failed to add keychain item with error: %@");
}

- (id)keychainItemFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1000E2684((uint64_t)v4);

  return v6;
}

- (id)keychainItemsForDescriptor:(id)a3 withGroup:(id)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_1000E278C(v10, v7, v9);

  swift_bridgeObjectRelease();
  sub_1000E2FEC();
  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (BOOL)deleteKeychainItemsFor:(id)a3 error:(id *)a4
{
  return sub_1000E2EBC(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_deleteKeychainItemsForDescriptor_error_, "Keychain item(s) deletion successful", "Keychain item(s) deletion failed with error: %@");
}

@end