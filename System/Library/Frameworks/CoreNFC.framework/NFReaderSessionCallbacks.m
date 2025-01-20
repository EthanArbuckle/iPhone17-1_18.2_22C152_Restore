@interface NFReaderSessionCallbacks
+ (id)interface;
@end

@implementation NFReaderSessionCallbacks

+ (id)interface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D39BA20];
  id v3 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_didDetectTags_connectedTagIndex_ argumentIndex:0 ofReply:0];

  id v6 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback_ argumentIndex:0 ofReply:0];

  id v9 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback_ argumentIndex:1 ofReply:0];

  return v2;
}

@end