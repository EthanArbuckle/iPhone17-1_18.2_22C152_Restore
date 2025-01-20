@interface NFReaderSessionInterface
+ (id)interface;
+ (void)_configureInterface:(id)a3;
@end

@implementation NFReaderSessionInterface

+ (id)interface
{
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D39F190];
  [a1 _configureInterface:v3];

  return v3;
}

+ (void)_configureInterface:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFFA08];
  id v4 = a3;
  id v13 = (id)objc_msgSend([v3 alloc], "initWithObjects:", objc_opt_class(), 0);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v13 forSelector:sel_connect_completion_ argumentIndex:0 ofReply:0];
  [v4 setClasses:v13 forSelector:sel_connect_completion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:v13 forSelector:sel_transceive_completion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:v5 forSelector:sel_ndefWrite_completion_ argumentIndex:0 ofReply:0];
  [v4 setClasses:v5 forSelector:sel_ndefReadWithCompletion_ argumentIndex:1 ofReply:1];
  id v6 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_performVAS_completion_ argumentIndex:0 ofReply:0];
  [v4 setClasses:v12 forSelector:sel_performVAS_completion_ argumentIndex:1 ofReply:1];
}

@end