@interface AISSignOutContext
+ (BOOL)supportsSecureCoding;
- (AISSignOutContext)init;
- (AISSignOutContext)initWithAccountAltDSIDsByService:(id)a3;
- (AISSignOutContext)initWithAltDSID:(id)a3 machineIdToSignOut:(id)a4 type:(int64_t)a5;
- (AISSignOutContext)initWithCoder:(id)a3;
- (BOOL)shouldRemoveDeviceUser;
- (NSDictionary)accountAltDSIDsByService;
- (NSString)altDSID;
- (NSString)description;
- (NSString)machineIdToSignOut;
- (id)initWithAltDSID:(uint64_t)a3 type:(uint64_t)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AISSignOutContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)accountAltDSIDsByService
{
  type metadata accessor for AIDAServiceType(0);
  sub_248053B4C();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_248174FF0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (BOOL)shouldRemoveDeviceUser
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___AISSignOutContext_shouldRemoveDeviceUser);
}

- (NSString)altDSID
{
  v2 = self;
  sub_24811E55C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_248175130();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)machineIdToSignOut
{
  if (*(void *)&self->accountAltDSIDsByService[OBJC_IVAR___AISSignOutContext_machineIdToSignOut])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_248175130();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AISSignOutContext_type);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24811E6B4(v4);
}

- (AISSignOutContext)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (AISSignOutContext *)sub_24811F8D8(v3);

  return v4;
}

- (AISSignOutContext)initWithAccountAltDSIDsByService:(id)a3
{
  type metadata accessor for AIDAServiceType(0);
  sub_248053B4C();
  uint64_t v3 = sub_248175010();
  id v4 = (objc_class *)type metadata accessor for SignOutContext();
  v5 = objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___AISSignOutContext_accountAltDSIDsByService] = v3;
  v6 = &v5[OBJC_IVAR___AISSignOutContext_machineIdToSignOut];
  void *v6 = 0;
  v6[1] = 0;
  *(void *)&v5[OBJC_IVAR___AISSignOutContext_type] = 0;
  v5[OBJC_IVAR___AISSignOutContext_shouldRemoveDeviceUser] = 0;
  v9.receiver = v5;
  v9.super_class = v4;
  v7 = [(AISSignOutContext *)&v9 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (AISSignOutContext)initWithAltDSID:(id)a3 machineIdToSignOut:(id)a4 type:(int64_t)a5
{
  uint64_t v7 = sub_248175160();
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = sub_248175160();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  return (AISSignOutContext *)sub_24811F23C(v7, v9, v10, v12, a5);
}

- (id)initWithAltDSID:(uint64_t)a3 type:(uint64_t)a4
{
  sub_248175160();
  v6 = (void *)sub_248175130();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(a1, sel_initWithAltDSID_machineIdToSignOut_type_, v6, 0, a4);

  return v7;
}

- (AISSignOutContext)init
{
  result = (AISSignOutContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  SignOutContext.description.getter();

  uint64_t v3 = (void *)sub_248175130();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end