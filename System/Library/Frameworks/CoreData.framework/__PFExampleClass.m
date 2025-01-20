@interface __PFExampleClass
- (__PFExampleClass)init;
- (void)pfExampleFunction;
@end

@implementation __PFExampleClass

- (void)pfExampleFunction
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_18AE53E30;
  *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v3 + 32) = 0xD000000000000011;
  *(void *)(v3 + 40) = 0x800000018AE54DF0;
  v4 = self;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
}

- (__PFExampleClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _PFExampleClass();
  return [(__PFExampleClass *)&v3 init];
}

@end