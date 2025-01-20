@interface IdentityProvisioningSession
- (_TtC7CoreIDV27IdentityProvisioningSession)init;
- (void)generateIdentityProvisioningAttestationsWithCredentialIdentifier:(NSString *)a3 pairingID:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation IdentityProvisioningSession

- (_TtC7CoreIDV27IdentityProvisioningSession)init
{
  return (_TtC7CoreIDV27IdentityProvisioningSession *)IdentityProvisioningSession.init()();
}

- (void)generateIdentityProvisioningAttestationsWithCredentialIdentifier:(NSString *)a3 pairingID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782E4B0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2148A1D78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26782E9F0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26782E500;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2148610D8((uint64_t)v11, (uint64_t)&unk_26782E508, (uint64_t)v16);
  swift_release();
}

- (void).cxx_destruct
{
}

@end