@interface CKFunCameraUserConsentManager
+ (BOOL)shouldPromptUserForFunCameraConsent;
+ (void)presentFromViewController:(id)a3 presentedBlock:(id)a4 confirmBlock:(id)a5 cancelBlock:(id)a6;
- (CKFunCameraUserConsentManager)init;
@end

@implementation CKFunCameraUserConsentManager

+ (void)presentFromViewController:(id)a3 presentedBlock:(id)a4 confirmBlock:(id)a5 cancelBlock:(id)a6
{
  v9 = _Block_copy(a4);
  v10 = _Block_copy(a5);
  v11 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v9;
    v9 = sub_18F4C1EB4;
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v13 = 0;
    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v12 = 0;
  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  v10 = sub_18F4C1EB4;
  if (v11)
  {
LABEL_4:
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v11;
    v11 = sub_18F4C1E94;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v14 = 0;
LABEL_8:
  swift_getObjCClassMetadata();
  id v15 = a3;
  static FunCameraUserConsentManager.present(fromViewController:presentedBlock:confirmBlock:cancelBlock:)(v15, (uint64_t)v9, v12, (uint64_t)v10, v13, (uint64_t)v11, v14);
  sub_18EF6E880((uint64_t)v11);
  sub_18EF6E880((uint64_t)v10);
  sub_18EF6E880((uint64_t)v9);
}

+ (BOOL)shouldPromptUserForFunCameraConsent
{
  return _s7ChatKit27FunCameraUserConsentManagerC012shouldPrompte3ForcdF0SbyFZ_0() & 1;
}

- (CKFunCameraUserConsentManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FunCameraUserConsentManager();
  return [(CKFunCameraUserConsentManager *)&v3 init];
}

@end