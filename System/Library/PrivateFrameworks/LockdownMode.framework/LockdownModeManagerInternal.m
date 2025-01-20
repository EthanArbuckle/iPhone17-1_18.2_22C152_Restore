@interface LockdownModeManagerInternal
+ (LockdownModeManagerInternal)shared;
- (BOOL)enabled;
- (BOOL)enabledInAccount;
- (LockdownModeManagerInternal)init;
- (void)enableIfNeeded:(BOOL)a3 completion:(id)a4;
- (void)getEnabledInAccount:(BOOL)a3 completion:(id)a4;
- (void)migrateIfNeededWithCompletion:(id)a3;
- (void)notifyRestrictionChanged:(id)a3;
- (void)rebootIfNeeded;
- (void)setEnabled:(BOOL)a3 options:(id)a4 completion:(id)a5;
@end

@implementation LockdownModeManagerInternal

- (LockdownModeManagerInternal)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___LockdownModeManagerInternal____lazy_storage___connection) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LockdownModeManagerInternal *)&v5 init];
}

- (BOOL)enabled
{
  return _s12LockdownMode0aB7ManagerC7enabledSbvg_0() & 1;
}

+ (LockdownModeManagerInternal)shared
{
  if (qword_26B278810 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B278818;

  return (LockdownModeManagerInternal *)v2;
}

- (BOOL)enabledInAccount
{
  v2 = self;
  char v3 = LockdownModeManager.enabledInAccount.getter();

  return v3 & 1;
}

- (void)getEnabledInAccount:(BOOL)a3 completion:(id)a4
{
}

- (void)setEnabled:(BOOL)a3 options:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4) {
    a4 = (id)sub_255085700();
  }
  _Block_copy(v8);
  v9 = self;
  sub_255084ED0(a3, (uint64_t)a4, (uint64_t)v9, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)notifyRestrictionChanged:(id)a3
{
  uint64_t v4 = sub_255085720();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LockdownModeManager.notifyRestrictionChanged(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)enableIfNeeded:(BOOL)a3 completion:(id)a4
{
}

- (void)migrateIfNeededWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  objc_super v5 = self;
  sub_2550850E8((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)rebootIfNeeded
{
  objc_super v5 = self;
  uint64_t v2 = sub_255082C48((uint64_t)sub_255082D48, (uint64_t)&block_descriptor_77, (SEL *)&selRef_synchronousRemoteObjectProxyWithErrorHandler_);
  if (v2)
  {
    char v3 = (void *)v2;
    aBlock[4] = sub_255084008;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2550833A0;
    aBlock[3] = &block_descriptor_47;
    uint64_t v4 = _Block_copy(aBlock);
    objc_msgSend(v3, sel_rebootIfNeededWithCompletion_, v4);
    swift_unknownObjectRelease();
    _Block_release(v4);
  }
  else
  {
  }
}

- (void).cxx_destruct
{
}

@end