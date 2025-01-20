@interface ACDXPCEventPublisherWrapper
+ (void)notifySubscribersOfAccountChange:(id)a3 type:(int)a4;
- (_TtC14AccountsDaemon27ACDXPCEventPublisherWrapper)init;
@end

@implementation ACDXPCEventPublisherWrapper

+ (void)notifySubscribersOfAccountChange:(id)a3 type:(int)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED548);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v9 = sub_218420E58();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = 0;
    *(void *)(v10 + 24) = 0;
    *(void *)(v10 + 32) = a3;
    *(_DWORD *)(v10 + 40) = a4;
    id v11 = a3;
    sub_21840C5FC((uint64_t)v8, (uint64_t)&unk_267BC9C70, v10);

    swift_release();
    sub_2184154CC((uint64_t)v8, (uint64_t *)&unk_26ABED548);
  }
}

- (_TtC14AccountsDaemon27ACDXPCEventPublisherWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ACDXPCEventPublisherWrapper();
  return [(ACDXPCEventPublisherWrapper *)&v3 init];
}

@end