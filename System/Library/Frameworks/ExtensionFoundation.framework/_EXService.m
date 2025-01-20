@interface _EXService
+ (id)runAsXPCService;
- (_EXService)init;
@end

@implementation _EXService

- (_EXService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _EXService();
  return [(_EXService *)&v3 init];
}

+ (id)runAsXPCService
{
  v12 = sub_191F83524;
  uint64_t v13 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 1107296256;
  v10 = sub_191F2BF10;
  v11 = &block_descriptor_69;
  v1 = _Block_copy(&v8);
  id v2 = self;
  id v3 = objc_msgSend(v2, sel_listenerWithConfigurator_, v1);
  _Block_release(v1);
  swift_release();
  if (swift_isEscapingClosureAtFileLocation()) {
    goto LABEL_5;
  }
  v0 = &selRef_UUID;
  objc_msgSend(v3, sel_activate);
  v12 = sub_191F83538;
  uint64_t v13 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 1107296256;
  v10 = sub_191F2BF10;
  v11 = &block_descriptor_72;
  v4 = _Block_copy(&v8);
  id v5 = objc_msgSend(v2, sel_listenerWithConfigurator_, v4);
  _Block_release(v4);
  swift_release();
  if (swift_isEscapingClosureAtFileLocation())
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  objc_msgSend(v5, sel_activate);
  v12 = sub_191F83554;
  uint64_t v13 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 1107296256;
  v10 = sub_191F2BF10;
  v11 = &block_descriptor_75;
  v6 = _Block_copy(&v8);
  id v2 = objc_msgSend(v2, sel_listenerWithConfigurator_, v6);
  _Block_release(v6);
  swift_release();
  if (swift_isEscapingClosureAtFileLocation())
  {
    __break(1u);
LABEL_5:
    __break(1u);
    goto LABEL_6;
  }
LABEL_7:
  [v2 v0[137]];
  id result = objc_msgSend(self, sel_activateXPCService);
  __break(1u);
  return result;
}

@end