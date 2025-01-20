@interface AMSSendableBag
- (AMSProcessInfo)processInfo;
- (AMSSendableBag)init;
- (AMSSendableBag)initWithWrappedBag:(id)a3;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
@end

@implementation AMSSendableBag

- (AMSSendableBag)initWithWrappedBag:(id)a3
{
  return (AMSSendableBag *)SendableBag.init(wrappedBag:)((uint64_t)a3);
}

- (BOOL)isExpired
{
  v2 = self;
  unsigned __int8 v3 = SendableBag.isExpired.getter();

  return v3 & 1;
}

- (NSDate)expirationDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB389D00);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  SendableBag.expirationDate.getter((uint64_t)v5);

  uint64_t v7 = sub_18DD4D9A0();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_18DD4D910();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSDate *)v8;
}

- (NSString)profile
{
  return (NSString *)sub_18D7E3960(self, (uint64_t)a2, (void (*)(void))SendableBag.profile.getter);
}

- (NSString)profileVersion
{
  return (NSString *)sub_18D7E3960(self, (uint64_t)a2, (void (*)(void))SendableBag.profileVersion.getter);
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = SendableBag.BOOL(forKey:)((uint64_t)v4);

  return v6;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_18D677FD0((uint64_t)&unk_1E91BBAF0, v5);
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = SendableBag.double(forKey:)((uint64_t)v4);

  return v6;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = SendableBag.integer(forKey:)((uint64_t)v4);

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = SendableBag.string(forKey:)((uint64_t)v4);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = SendableBag.url(forKey:)((uint64_t)v4);

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = SendableBag.dictionary(forKey:)((uint64_t)v4);

  return v6;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = SendableBag.array(forKey:)((uint64_t)v4);

  return v6;
}

- (AMSProcessInfo)processInfo
{
  v2 = self;
  id v3 = SendableBag.processInfo.getter();

  return (AMSProcessInfo *)v3;
}

- (AMSSendableBag)init
{
}

- (void).cxx_destruct
{
}

@end