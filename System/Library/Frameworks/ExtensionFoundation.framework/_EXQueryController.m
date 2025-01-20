@interface _EXQueryController
+ (id)executeQueries:(id)a3;
+ (id)executeQuery:(id)a3;
+ (void)executeQueries:(id)a3 completionHandler:(id)a4;
+ (void)executeQuery:(id)a3 completionHandler:(id)a4;
- (NSArray)extensionIdentities;
- (NSArray)extensions;
- (NSArray)queries;
- (NSString)description;
- (_EXQueryController)init;
- (_EXQueryController)initWithQueries:(id)a3;
- (_EXQueryController)initWithQueries:(id)a3 delegate:(id)a4;
- (_EXQueryControllerDelegate)delegate;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)suspend;
@end

@implementation _EXQueryController

- (void)resume
{
  v2 = self;
  sub_191F39E58();
}

- (_EXQueryController)initWithQueries:(id)a3 delegate:(id)a4
{
  type metadata accessor for _EXQuery();
  unint64_t v4 = sub_191FB9ED8();
  swift_unknownObjectRetain();
  v5 = sub_191F394FC(v4);
  swift_unknownObjectRelease();
  return (_EXQueryController *)v5;
}

- (NSArray)extensionIdentities
{
  v2 = self;
  sub_191F55EB0();

  sub_191F53E80();
  v3 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

+ (id)executeQuery:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB27BE50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_191FBFCE0;
  *(void *)(inited + 32) = a3;
  unint64_t v8 = inited;
  sub_191FB9EF8();
  id v5 = a3;
  sub_191F87854(v8);
  swift_bridgeObjectRelease();

  sub_191F53E80();
  v6 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return v6;
}

+ (void)executeQuery:(id)a3 completionHandler:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB27BE50);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_191FBFCE0;
  *(void *)(v7 + 32) = a3;
  unint64_t v9 = v7;
  sub_191FB9EF8();
  id v8 = a3;
  sub_191F879BC(v9, (uint64_t)sub_191F92980, v6);

  swift_release();

  swift_bridgeObjectRelease();
}

+ (id)executeQueries:(id)a3
{
  type metadata accessor for _EXQuery();
  unint64_t v3 = sub_191FB9ED8();
  sub_191F87854(v3);
  swift_bridgeObjectRelease();
  sub_191F53E80();
  unint64_t v4 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return v4;
}

+ (void)executeQueries:(id)a3 completionHandler:(id)a4
{
  unint64_t v4 = _Block_copy(a4);
  type metadata accessor for _EXQuery();
  unint64_t v5 = sub_191FB9ED8();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  sub_191F879BC(v5, (uint64_t)sub_191F92950, v6);
  swift_bridgeObjectRelease();

  swift_release();
}

- (_EXQueryControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x192FEBBF0]((char *)self + OBJC_IVAR____EXQueryController_delegate, a2);

  return (_EXQueryControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)queries
{
  type metadata accessor for _EXQuery();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_EXQueryController)initWithQueries:(id)a3
{
  type metadata accessor for _EXQuery();
  unint64_t v3 = sub_191FB9ED8();
  return (_EXQueryController *)sub_191F922C8(v3);
}

- (void)suspend
{
  v2 = self;
  sub_191F86B48();
}

- (NSString)description
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryController_innerController);
  unint64_t v3 = self;
  id v4 = objc_msgSend(v2, sel_description);
  sub_191FB9DC8();

  unint64_t v5 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSArray)extensions
{
  v2 = self;
  sub_191F926AC();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92FD648);
  unint64_t v3 = (void *)sub_191FB9EC8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_EXQueryController)init
{
  result = (_EXQueryController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unint64_t v3 = (char *)self + OBJC_IVAR____EXQueryController_delegate;

  sub_191F92958((uint64_t)v3);
}

@end