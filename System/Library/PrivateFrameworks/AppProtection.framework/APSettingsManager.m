@interface APSettingsManager
+ (id)sharedManager;
- (APSettingsManager)init;
- (BOOL)canChangeHiddenStatusOfSubject:(id)a3;
- (BOOL)canChangeLockedStatusOfSubject:(id)a3;
- (BOOL)canChangeShownInSearchAndSiriForSubject:(id)a3;
- (BOOL)isAppHidingAvailable;
- (BOOL)isAppLockingAvailable;
- (BOOL)setSubject:(id)a3 isHidden:(BOOL)a4 error:(id *)a5;
- (BOOL)setSubject:(id)a3 isLocked:(BOOL)a4 error:(id *)a5;
- (void)setSubject:(id)a3 isHidden:(BOOL)a4 completion:(id)a5;
- (void)setSubject:(id)a3 isLocked:(BOOL)a4 completion:(id)a5;
- (void)setSubject:(id)a3 shownInSearchAndSiri:(BOOL)a4 completion:(id)a5;
- (void)waitForManagedProtectability:(id)a3;
@end

@implementation APSettingsManager

+ (id)sharedManager
{
  if (qword_2692C9F48 != -1) {
    swift_once();
  }
  if (qword_2692C9760 != -1) {
    swift_once();
  }
  v2 = (void *)qword_2692CF1A0;
  return v2;
}

- (BOOL)setSubject:(id)a3 isHidden:(BOOL)a4 error:(id *)a5
{
  return sub_247DB9A10(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, uint64_t))sub_247DBAD74);
}

- (BOOL)setSubject:(id)a3 isLocked:(BOOL)a4 error:(id *)a5
{
  return sub_247DB9A10(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, uint64_t))sub_247DBB3EC);
}

- (void)setSubject:(id)a3 isHidden:(BOOL)a4 completion:(id)a5
{
}

- (void)setSubject:(id)a3 isLocked:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)canChangeLockedStatusOfSubject:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_247DBBD98(v4);

  return v6 & 1;
}

- (BOOL)canChangeHiddenStatusOfSubject:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_247DBBE60(v4);

  return v6 & 1;
}

- (BOOL)isAppLockingAvailable
{
  return sub_247DBBF08((uint64_t)self, (uint64_t)a2) & 1;
}

- (BOOL)isAppHidingAvailable
{
  v2 = self;
  if ([(APSettingsManager *)v2 isAppLockingAvailable])
  {
    v3 = (APSettingsManager *)objc_msgSend(self, sel_sharedConnection);
    if (!v3)
    {
      __break(1u);
      return (char)v3;
    }
    id v4 = v3;
    unsigned __int8 v5 = [(APSettingsManager *)v3 isHidingAppsAllowed];

    v2 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  LOBYTE(v3) = v5;
  return (char)v3;
}

- (APSettingsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)APSettingsManager;
  return [(APSettingsManager *)&v3 init];
}

- (void)setSubject:(id)a3 shownInSearchAndSiri:(BOOL)a4 completion:(id)a5
{
  v7 = (void (**)(void *, void, void *))_Block_copy(a5);
  uint64_t v8 = sub_247DD2C20();
  uint64_t v10 = v9;
  id v11 = a3;
  v14 = self;
  id v12 = sub_247D8F1D4(v8, v10, -4, 0, 0, 278, 0xD00000000000002FLL, 0x8000000247DE0130, 0);
  swift_bridgeObjectRelease();
  v13 = (void *)sub_247DD2730();
  v7[2](v7, 0, v13);

  _Block_release(v7);
}

- (BOOL)canChangeShownInSearchAndSiriForSubject:(id)a3
{
  return 0;
}

- (void)waitForManagedProtectability:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = qword_2692C9F48;
  v7 = self;
  if (v6 != -1) {
    swift_once();
  }
  sub_247DB9248((uint64_t)sub_247D69074, v5);

  swift_release();
}

@end