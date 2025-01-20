@interface _BMIPBridgeZeoliteLibraryNode
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMIPBridgeZeoliteLibraryNode

+ (id)identifier
{
  v2 = (void *)sub_1B359E858();
  swift_bridgeObjectRelease();

  return v2;
}

+ (id)streamNames
{
  sub_1B359E898();
  OUTLINED_FUNCTION_2();

  return v2;
}

+ (id)validKeyPaths
{
  sub_1B359E8A8();
  OUTLINED_FUNCTION_2();

  return v2;
}

+ (id)streamWithName:(id)a3
{
  return sub_1B310687C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))static _BMIPBridgeZeoliteLibraryNode.stream(withName:));
}

+ (id)sublibraries
{
  return sub_1B3106A2C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static _BMIPBridgeZeoliteLibraryNode.sublibraries());
}

@end