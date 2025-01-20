@interface _ASCABLEQRCodeUtilities
+ (BOOL)isPasskeyRegistrationURL:(id)a3;
+ (BOOL)isPasskeyURL:(id)a3;
+ (int64_t)passkeyURLTypeFromURL:(id)a3;
- (_TtC26AuthenticationServicesCore23_ASCABLEQRCodeUtilities)init;
@end

@implementation _ASCABLEQRCodeUtilities

- (_TtC26AuthenticationServicesCore23_ASCABLEQRCodeUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(_ASCABLEQRCodeUtilities *)&v3 init];
}

+ (BOOL)isPasskeyURL:(id)a3
{
  uint64_t v3 = sub_2193E1FF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2193E1FA0();
  sub_2193E1FD0();
  if (v7)
  {
    uint64_t v8 = sub_2193E28A0();
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    if (v8 == 1868851558 && v10 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      char v12 = 1;
    }
    else
    {
      char v12 = sub_2193E3140();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v12 = 0;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v12 & 1;
}

+ (BOOL)isPasskeyRegistrationURL:(id)a3
{
  uint64_t v3 = sub_2193E1FF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2193E1FA0();
  BOOL v7 = _s26AuthenticationServicesCore23_ASCABLEQRCodeUtilitiesC13passkeURLType4fromSo010_ASPasskeyG0V10Foundation3URLV_tFZ_0((uint64_t)v6) == 2;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (int64_t)passkeyURLTypeFromURL:(id)a3
{
  uint64_t v3 = sub_2193E1FF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2193E1FA0();
  int64_t v7 = _s26AuthenticationServicesCore23_ASCABLEQRCodeUtilitiesC13passkeURLType4fromSo010_ASPasskeyG0V10Foundation3URLV_tFZ_0((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

@end