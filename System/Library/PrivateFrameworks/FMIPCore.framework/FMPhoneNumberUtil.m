@interface FMPhoneNumberUtil
+ (BOOL)isEmailValidWithEmail:(id)a3;
+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3;
+ (id)formatWithPhoneNumber:(id)a3;
+ (id)formattedWithHandle:(id)a3;
+ (id)unformatWithPhoneNumber:(id)a3;
- (_TtC8FMIPCore17FMPhoneNumberUtil)init;
@end

@implementation FMPhoneNumberUtil

+ (id)formatWithPhoneNumber:(id)a3
{
  return sub_1D43BD6DC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1D43BDBB0);
}

+ (id)formattedWithHandle:(id)a3
{
  return sub_1D43BD6DC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1D43BDCA0);
}

+ (id)unformatWithPhoneNumber:(id)a3
{
  uint64_t v3 = sub_1D44691F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1D4469B38();
  unint64_t v9 = v8;
  sub_1D4469188();
  sub_1D44691C8();
  swift_bridgeObjectRetain();
  sub_1D43BDDD0(v7, v9, (uint64_t)v6);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1D4469B08();
  swift_bridgeObjectRelease();
  return v10;
}

+ (BOOL)isEmailValidWithEmail:(id)a3
{
  sub_1D4469B38();
  if (qword_1EA6C8FF0 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_1EA6CB778;
  uint64_t v4 = (void *)sub_1D4469B08();
  LOBYTE(v3) = objc_msgSend(v3, sel_evaluateWithObject_, v4);
  swift_bridgeObjectRelease();

  return (char)v3;
}

+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3
{
  uint64_t v3 = sub_1D4469B38();
  char v5 = sub_1D43BDFC4(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_TtC8FMIPCore17FMPhoneNumberUtil)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return [(FMPhoneNumberUtil *)&v3 init];
}

@end