@interface DefaultObjcUnarchiver
- (_TtC12AppleIDSetup21DefaultObjcUnarchiver)init;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)initForReadingFromData:(id)a3 error:(id *)a4;
- (id)initForReadingWithData:(id)a3;
@end

@implementation DefaultObjcUnarchiver

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "setByAddingObject:", +[ObjcArchivableWrapperClassProducer classForNSXPCListenerEndpoint](_TtC12AppleIDSetup34ObjcArchivableWrapperClassProducer, "classForNSXPCListenerEndpoint"));

  v11.receiver = self;
  v11.super_class = (Class)_TtC12AppleIDSetup21DefaultObjcUnarchiver;
  v9 = [(DefaultObjcUnarchiver *)&v11 decodeObjectOfClasses:v8 forKey:v6];

  return v9;
}

- (id)decodeObjectForKey:(id)a3
{
  sub_248175160();
  v4 = self;
  sub_248173BB0((uint64_t)v12);

  swift_bridgeObjectRelease();
  uint64_t v5 = v13;
  if (v13)
  {
    id v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v6);
    v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = (void *)sub_248175CD0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)initForReadingFromData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  sub_2481747D0();

  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12AppleIDSetup21DefaultObjcUnarchiver)init
{
  id result = (_TtC12AppleIDSetup21DefaultObjcUnarchiver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initForReadingWithData:(id)a3
{
  id v3 = a3;
  sub_2481747D0();

  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end