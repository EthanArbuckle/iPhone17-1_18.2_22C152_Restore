@interface CDPStateSwiftUIProvider
+ (id)makeSwiftUIViewForEDPTokenInSpyglassWithRecoveryToken:(id)a3 presentingViewController:(id)a4;
+ (id)makeSwiftUIViewForEDPTokenIntroScreenWithDelegate:(id)a3 isHSA2Enabled:(BOOL)a4;
+ (id)makeSwiftUIViewForEDPTokenSuccessScreenWithFullDataAccessRestored:(BOOL)a3 buttonHandler:(id)a4;
+ (void)makeSwiftUIViewForRemoteSecretDuringSignInCdpContext:(CDPContext *)a3 validator:(CDPRemoteDeviceSecretValidatorProtocol *)a4 devices:(NSArray *)a5 presentingViewController:(UIViewController *)a6 performingAccountRecovery:(BOOL)a7 delegate:(CDPUIController *)a8 offeringRemoteApproval:(BOOL)a9 canShowRPD:(BOOL)a10 isADPEnabled:(BOOL)a11 selectedDevice:(CDPDevice *)a12 completionHandler:(id)a13;
- (CDPStateSwiftUIProvider)init;
@end

@implementation CDPStateSwiftUIProvider

+ (void)makeSwiftUIViewForRemoteSecretDuringSignInCdpContext:(CDPContext *)a3 validator:(CDPRemoteDeviceSecretValidatorProtocol *)a4 devices:(NSArray *)a5 presentingViewController:(UIViewController *)a6 performingAccountRecovery:(BOOL)a7 delegate:(CDPUIController *)a8 offeringRemoteApproval:(BOOL)a9 canShowRPD:(BOOL)a10 isADPEnabled:(BOOL)a11 selectedDevice:(CDPDevice *)a12 completionHandler:(id)a13
{
  v36 = a4;
  v37 = a5;
  id v35 = a1;
  BOOL v33 = a11;
  BOOL v34 = a7;
  BOOL v32 = a10;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BDD378);
  MEMORY[0x270FA5388](v18 - 8);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a13);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a3;
  *(void *)(v22 + 24) = a4;
  *(void *)(v22 + 32) = a5;
  *(void *)(v22 + 40) = a6;
  *(unsigned char *)(v22 + 48) = v34;
  *(void *)(v22 + 56) = a8;
  *(unsigned char *)(v22 + 64) = a9;
  *(unsigned char *)(v22 + 65) = v32;
  *(unsigned char *)(v22 + 66) = v33;
  *(void *)(v22 + 72) = a12;
  *(void *)(v22 + 80) = v21;
  *(void *)(v22 + 88) = v35;
  uint64_t v23 = sub_2188620E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_267BDD3B8;
  v24[5] = v22;
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_267BDD3C8;
  v25[5] = v24;
  v26 = a3;
  swift_unknownObjectRetain();
  v27 = v37;
  v28 = a6;
  v29 = a8;
  v30 = a12;
  sub_218835554((uint64_t)v20, (uint64_t)&unk_267BDD3D8, (uint64_t)v25);
  swift_release();
}

+ (id)makeSwiftUIViewForEDPTokenInSpyglassWithRecoveryToken:(id)a3 presentingViewController:(id)a4
{
  uint64_t v5 = sub_218862080();
  id v6 = a4;
  v7 = (void *)sub_218836070(v5, v6);

  swift_bridgeObjectRelease();

  return v7;
}

+ (id)makeSwiftUIViewForEDPTokenIntroScreenWithDelegate:(id)a3 isHSA2Enabled:(BOOL)a4
{
  swift_unknownObjectRetain();
  id v6 = (void *)sub_218836408((uint64_t)a3, a4);
  swift_unknownObjectRelease();

  return v6;
}

+ (id)makeSwiftUIViewForEDPTokenSuccessScreenWithFullDataAccessRestored:(BOOL)a3 buttonHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  type metadata accessor for CDPUIEDPRecoveryTokenSuccessViewModel();
  swift_allocObject();
  swift_retain();
  sub_218830534(v4, (uint64_t)sub_2188352C0, v6);
  id v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BDD370));
  v8 = (void *)sub_218861510();
  swift_release();

  return v8;
}

- (CDPStateSwiftUIProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)CDPStateSwiftUIProvider;
  return [(CDPStateSwiftUIProvider *)&v3 init];
}

@end