@interface FSKitUtils
+ (id)stringWithFormatString:(id)a3 locale:(id)a4 arguments:(id)a5;
- (FSKitUtils)init;
@end

@implementation FSKitUtils

+ (id)stringWithFormatString:(id)a3 locale:(id)a4 arguments:(id)a5
{
  uint64_t v5 = sub_24DDED9E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24DDEDA00();
  uint64_t v11 = v10;
  sub_24DDED9D0();
  sub_24DDE4F20(0, &qword_2698928E8);
  unint64_t v12 = sub_24DDEDA20();
  _sSo10FSKitUtilsC0A0E6string16withFormatString6locale9argumentsS2S_10Foundation6LocaleVSaySo8NSObjectCGtFZ_0(v9, v11, (uint64_t)v8, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = (void *)sub_24DDED9F0();
  swift_bridgeObjectRelease();
  return v13;
}

- (FSKitUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)FSKitUtils;
  return [(FSKitUtils *)&v3 init];
}

@end