@interface VSViewServiceXPCInterface
+ (id)viewServiceHostInterface;
+ (id)viewServiceInterface;
@end

@implementation VSViewServiceXPCInterface

+ (id)viewServiceInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34EAF80];
}

+ (id)viewServiceHostInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34EAFE0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel__request_didFailWithError_ argumentIndex:1 ofReply:0];

  return v2;
}

@end