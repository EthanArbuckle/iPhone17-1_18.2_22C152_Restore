@interface HREMatterCommandMap
+ (HREMatterCommandMap)goHome;
+ (HREMatterCommandMap)mop;
+ (HREMatterCommandMap)pauseCleaning;
+ (HREMatterCommandMap)selectAllRooms;
+ (HREMatterCommandMap)startCleaning;
+ (HREMatterCommandMap)vacuum;
+ (HREMatterCommandMap)vacuumAndMop;
- (HREMatterCommandMap)init;
@end

@implementation HREMatterCommandMap

+ (HREMatterCommandMap)vacuum
{
  return (HREMatterCommandMap *)sub_237B6FA5C((uint64_t)a1, (uint64_t)a2, MEMORY[0x263F48F00], MEMORY[0x263F48F08], MEMORY[0x263F48EB0]);
}

+ (HREMatterCommandMap)mop
{
  return (HREMatterCommandMap *)sub_237B6FA5C((uint64_t)a1, (uint64_t)a2, MEMORY[0x263F48EF0], MEMORY[0x263F48F08], MEMORY[0x263F48EB0]);
}

+ (HREMatterCommandMap)vacuumAndMop
{
  return (HREMatterCommandMap *)sub_237B6FA5C((uint64_t)a1, (uint64_t)a2, MEMORY[0x263F48ED8], MEMORY[0x263F48F08], MEMORY[0x263F48EB0]);
}

+ (HREMatterCommandMap)startCleaning
{
  return (HREMatterCommandMap *)sub_237B6FA5C((uint64_t)a1, (uint64_t)a2, MEMORY[0x263F48E60], MEMORY[0x263F48E70], MEMORY[0x263F48EA0]);
}

+ (HREMatterCommandMap)pauseCleaning
{
  return (HREMatterCommandMap *)sub_237B6FDF8((uint64_t)a1, (uint64_t)a2, MEMORY[0x263F48E90]);
}

+ (HREMatterCommandMap)selectAllRooms
{
  return (HREMatterCommandMap *)sub_237B6FA5C((uint64_t)a1, (uint64_t)a2, MEMORY[0x263F48E38], MEMORY[0x263F48E48], MEMORY[0x263F48E88]);
}

+ (HREMatterCommandMap)goHome
{
  return (HREMatterCommandMap *)sub_237B6FDF8((uint64_t)a1, (uint64_t)a2, MEMORY[0x263F48E78]);
}

- (HREMatterCommandMap)init
{
  result = (HREMatterCommandMap *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end