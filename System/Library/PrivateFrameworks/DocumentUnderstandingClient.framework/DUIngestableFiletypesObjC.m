@interface DUIngestableFiletypesObjC
+ (id)supportedUTTypes;
@end

@implementation DUIngestableFiletypesObjC

+ (id)supportedUTTypes
{
  return (id)MEMORY[0x270F9A6D0](_TtC27DocumentUnderstandingClient21DUIngestableFiletypes, sel_supportedUTTypes);
}

@end