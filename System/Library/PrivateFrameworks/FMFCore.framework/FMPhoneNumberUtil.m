@interface FMPhoneNumberUtil
+ (BOOL)isEmailValidWithEmail:(id)a3;
+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3;
+ (id)formatWithPhoneNumber:(id)a3;
+ (id)formattedWithHandle:(id)a3;
+ (id)unformatWithPhoneNumber:(id)a3;
- (_TtC7FMFCore17FMPhoneNumberUtil)init;
@end

@implementation FMPhoneNumberUtil

+ (id)formatWithPhoneNumber:(id)a3
{
  return sub_21CB33DCC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CB342A0);
}

+ (id)formattedWithHandle:(id)a3
{
  return sub_21CB33DCC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_21CB34584);
}

+ (id)unformatWithPhoneNumber:(id)a3
{
  uint64_t v3 = sub_21CB87280();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21CB882F0();
  unint64_t v9 = v8;
  sub_21CB87240();
  sub_21CB87260();
  swift_bridgeObjectRetain();
  sub_21CB34390(v7, v9, (uint64_t)v6);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  v10 = (void *)sub_21CB882C0();
  swift_bridgeObjectRelease();

  return v10;
}

+ (BOOL)isEmailValidWithEmail:(id)a3
{
  sub_21CB882F0();
  if (qword_267C94968 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_267CA52B8;
  uint64_t v4 = (void *)sub_21CB882C0();
  LOBYTE(v3) = objc_msgSend(v3, sel_evaluateWithObject_, v4);
  swift_bridgeObjectRelease();

  return (char)v3;
}

+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3
{
  uint64_t v3 = sub_21CB882F0();
  char v5 = sub_21CB346B4(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_TtC7FMFCore17FMPhoneNumberUtil)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return [(FMPhoneNumberUtil *)&v3 init];
}

@end