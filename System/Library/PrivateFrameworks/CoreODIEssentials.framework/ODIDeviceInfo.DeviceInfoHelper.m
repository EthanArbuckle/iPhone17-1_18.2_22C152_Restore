@interface ODIDeviceInfo.DeviceInfoHelper
- (_TtCC17CoreODIEssentials13ODIDeviceInfoP33_B07CCE03E02CC77E93497B1A0FAD96D316DeviceInfoHelper)init;
- (void)phoneNumberChanged:(id)a3;
@end

@implementation ODIDeviceInfo.DeviceInfoHelper

- (_TtCC17CoreODIEssentials13ODIDeviceInfoP33_B07CCE03E02CC77E93497B1A0FAD96D316DeviceInfoHelper)init
{
  result = (_TtCC17CoreODIEssentials13ODIDeviceInfoP33_B07CCE03E02CC77E93497B1A0FAD96D316DeviceInfoHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)phoneNumberChanged:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ACE4338);
  MEMORY[0x270FA5388](v5 - 8, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_214D1A368();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = self;
  v10[5] = a3;
  id v11 = a3;
  v12 = self;
  id v13 = v11;
  sub_214BF1380((uint64_t)v8, (uint64_t)&unk_26784D818, (uint64_t)v10);

  swift_release();
}

@end