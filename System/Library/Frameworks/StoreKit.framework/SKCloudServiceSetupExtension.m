@interface SKCloudServiceSetupExtension
+ (id)clientInterface;
+ (id)serviceInterface;
@end

@implementation SKCloudServiceSetupExtension

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08E3968];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_didFinishLoadingWithSuccess_error_ argumentIndex:1 ofReply:0];

  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_presentSafariViewControllerWithURL_animated_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)serviceInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F08F1788];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_applyConfiguration_ argumentIndex:0 ofReply:0];

  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_reloadWithContext_ argumentIndex:0 ofReply:0];

  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_handleSafariScriptURL_ argumentIndex:0 ofReply:0];

  return v2;
}

@end