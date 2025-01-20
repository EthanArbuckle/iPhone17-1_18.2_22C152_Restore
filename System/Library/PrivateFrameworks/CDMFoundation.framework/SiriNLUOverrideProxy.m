@interface SiriNLUOverrideProxy
- (BOOL)isOverrideStoreValid;
- (BOOL)loadComponentOverrideTrieStoreWithTrieFilePath:(id)a3;
- (BOOL)loadGlobalOverrideTrieStoreWithTrieFilePath:(id)a3;
- (SiriNLUOverrideProxy)init;
- (SiriNLUOverrideProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4;
- (id)matchWithInputs:(id)a3 overrideNamespace:(int)a4;
- (id)matchWithInputs:(id)a3 shouldAppend:(BOOL *)a4;
- (void)preheatWithLanguageCode:(id)a3;
@end

@implementation SiriNLUOverrideProxy

- (SiriNLUOverrideProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4
{
  return (SiriNLUOverrideProxy *)SiriNLUOverrideProxy.init(useTrie:useMemory:)();
}

- (BOOL)isOverrideStoreValid
{
  v2 = self;
  char v3 = sub_2264F27FC();

  return v3 & 1;
}

- (BOOL)loadGlobalOverrideTrieStoreWithTrieFilePath:(id)a3
{
  return sub_2264F2D80(self, (uint64_t)a2, (uint64_t)a3, sub_2264F29DC);
}

- (BOOL)loadComponentOverrideTrieStoreWithTrieFilePath:(id)a3
{
  return sub_2264F2D80(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_2264F2AF0);
}

- (id)matchWithInputs:(id)a3 overrideNamespace:(int)a4
{
  sub_2263BDC3C(0, (unint64_t *)&unk_26ABD4E70);
  sub_2265FB380();
  v5 = self;
  v6 = (void *)sub_2264F3084();

  swift_bridgeObjectRelease();
  return v6;
}

- (void)preheatWithLanguageCode:(id)a3
{
  sub_2265FB0A0();
  v4 = self;
  sub_2264F3A88();

  swift_bridgeObjectRelease();
}

- (id)matchWithInputs:(id)a3 shouldAppend:(BOOL *)a4
{
  sub_2263BDC3C(0, (unint64_t *)&unk_26ABD4E70);
  unint64_t v6 = sub_2265FB380();
  v7 = self;
  sub_2264F3CD0(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
  sub_2263BDC3C(0, &qword_26ABD2CD0);
  v8 = (void *)sub_2265FB370();
  swift_bridgeObjectRelease();
  return v8;
}

- (SiriNLUOverrideProxy)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end