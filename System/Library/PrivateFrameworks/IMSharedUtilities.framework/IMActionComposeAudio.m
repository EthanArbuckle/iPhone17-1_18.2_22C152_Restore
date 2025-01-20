@interface IMActionComposeAudio
- (IMActionComposeAudio)init;
- (IMActionComposeAudio)initWithDictionary:(id)a3;
- (IMActionComposeAudio)initWithPhoneNumber:(id)a3;
- (NSString)phoneNumber;
- (id)dictionaryRepresentation;
@end

@implementation IMActionComposeAudio

- (NSString)phoneNumber
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (IMActionComposeAudio)initWithPhoneNumber:(id)a3
{
  uint64_t v4 = sub_1A09F3E18();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionComposeAudio_phoneNumber);
  uint64_t *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)IMActionComposeAudio;
  return [(IMActionComposeAudio *)&v8 init];
}

- (IMActionComposeAudio)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionComposeAudio *)IMActionComposeAudio.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  sub_1A07856F8(&qword_1E94F9368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A0A08A20;
  *(void *)(inited + 32) = 0x6D754E656E6F6870;
  *(void *)(inited + 40) = 0xEB00000000726562;
  uint64_t v4 = self;
  v5 = [(IMActionComposeAudio *)v4 phoneNumber];
  uint64_t v6 = sub_1A09F3E18();
  uint64_t v8 = v7;

  *(void *)(inited + 72) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v8;
  sub_1A08D7480(inited);

  v9 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v9;
}

- (IMActionComposeAudio)init
{
  result = (IMActionComposeAudio *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end