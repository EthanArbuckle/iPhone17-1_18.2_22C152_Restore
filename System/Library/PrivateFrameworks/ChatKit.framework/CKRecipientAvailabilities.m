@interface CKRecipientAvailabilities
- (BOOL)hasIDStatus:(int64_t)a3 forRecipient:(id)a4 forServicesWithCapability:(id)a5;
- (BOOL)hasResultsForRecipient:(id)a3;
- (CKRecipientAvailabilities)init;
- (CKRecipientAvailabilities)initWithReachabilityController:(id)a3;
- (NSString)description;
- (id)availabilitiesForRecipients:(id)a3 service:(id)a4;
- (id)reachabilityForRecipient:(id)a3 service:(id)a4;
- (id)reachabilityForRecipient:(id)a3 service:(id)a4 isFinal:(BOOL *)a5;
- (id)recipientsWithoutResults:(id)a3 onService:(id)a4;
- (int64_t)idStatusForRecipient:(id)a3 service:(id)a4;
- (void)addEntriesFromIDSResults:(id)a3;
- (void)refreshAvailabilityForRecipients:(id)a3 context:(id)a4 resultHandler:(id)a5;
@end

@implementation CKRecipientAvailabilities

- (CKRecipientAvailabilities)initWithReachabilityController:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKRecipientAvailabilities_reachabilityController) = (Class)a3;
  id v4 = a3;
  v5 = self;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___CKRecipientAvailabilities_reachabilities) = (Class)sub_18F4A6CF8(MEMORY[0x1E4FBC860]);

  v8.receiver = v5;
  v8.super_class = (Class)CKRecipientAvailabilities;
  v6 = [(CKRecipientAvailabilities *)&v8 init];

  return v6;
}

- (CKRecipientAvailabilities)init
{
  id v3 = objc_msgSend(self, sel_sharedController);
  id v4 = [(CKRecipientAvailabilities *)self initWithReachabilityController:v3];

  return v4;
}

- (NSString)description
{
  swift_beginAccess();
  id v3 = self;
  sub_18F7B6CA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E923BDF8);
  sub_18F7B9670();

  swift_bridgeObjectRelease();
  id v4 = (void *)sub_18F7B97A0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (void)refreshAvailabilityForRecipients:(id)a3 context:(id)a4 resultHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_18F7B99C0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a4;
  v11 = self;
  sub_18F5A8DFC(v8, (uint64_t)v10, (uint64_t)sub_18F5AADEC, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (BOOL)hasResultsForRecipient:(id)a3
{
  uint64_t v4 = sub_18F7B97E0();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_18F5A9234(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)recipientsWithoutResults:(id)a3 onService:(id)a4
{
  uint64_t v5 = sub_18F7B99C0();
  uint64_t v6 = sub_18F7B97E0();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  sub_18F5AA8EC(v5, (uint64_t)v9, v6, v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  id v10 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v10;
}

- (id)reachabilityForRecipient:(id)a3 service:(id)a4
{
  uint64_t v5 = sub_18F7B97E0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_18F7B97E0();
  uint64_t v10 = v9;
  v11 = self;
  v12 = sub_18F5A9424(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v12;
}

- (id)reachabilityForRecipient:(id)a3 service:(id)a4 isFinal:(BOOL *)a5
{
  uint64_t v7 = sub_18F7B97E0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_18F7B97E0();
  uint64_t v12 = v11;
  v13 = self;
  id v14 = sub_18F5A95DC(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

- (int64_t)idStatusForRecipient:(id)a3 service:(id)a4
{
  sub_18F7B97E0();
  sub_18F7B97E0();
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_18F7B97A0();
  uint64_t v7 = (void *)sub_18F7B97A0();
  id v8 = [(CKRecipientAvailabilities *)v5 reachabilityForRecipient:v6 service:v7];

  if (v8)
  {
    unsigned int v9 = objc_msgSend(v8, sel_isReachable);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v9) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
}

- (id)availabilitiesForRecipients:(id)a3 service:(id)a4
{
  uint64_t v5 = sub_18F7B99C0();
  sub_18F7B97E0();
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_18F4A6E30(MEMORY[0x1E4FBC860]);
  id v8 = v6;
  sub_18F7B6CA0();
  sub_18F5AAB04(v7, v5, v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  sub_18EF3528C(0, (unint64_t *)&qword_1E922C110);
  unsigned int v9 = (void *)sub_18F7B9640();
  swift_bridgeObjectRelease();

  return v9;
}

- (BOOL)hasIDStatus:(int64_t)a3 forRecipient:(id)a4 forServicesWithCapability:(id)a5
{
  uint64_t v7 = sub_18F7B97E0();
  uint64_t v9 = v8;
  sub_18F7B97E0();
  uint64_t v10 = self;
  sub_18F5A99D4(a3, v7, v9);
  char v12 = v11;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (void)addEntriesFromIDSResults:(id)a3
{
  sub_18EF3528C(0, (unint64_t *)&qword_1E922C110);
  uint64_t v4 = sub_18F7B9660();
  uint64_t v5 = self;
  sub_18F5A9D74(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end