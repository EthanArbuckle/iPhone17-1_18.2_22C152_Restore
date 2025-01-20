@interface NSXPCInterface(HCSRemoteProtocols)
+ (id)hu_homeControlServiceXPCInterface;
+ (uint64_t)hu_homeControlXPCInterface;
@end

@implementation NSXPCInterface(HCSRemoteProtocols)

+ (id)hu_homeControlServiceXPCInterface
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [a1 interfaceWithProtocol:&unk_1F1AD9150];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:3];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v2, v5, v6);
  [v1 setClasses:v3 forSelector:sel_getTransitionSubviewFramesWithCompletion_ argumentIndex:0 ofReply:1];

  return v1;
}

+ (uint64_t)hu_homeControlXPCInterface
{
  return [a1 interfaceWithProtocol:&unk_1F1AD91B0];
}

@end