@interface NSXPCInterface(MFMailComposeRemoteInterfaces)
+ (id)mf_mailComposeRemoteServiceInterface;
+ (uint64_t)mf_mailComposeRemoteHostInterface;
@end

@implementation NSXPCInterface(MFMailComposeRemoteInterfaces)

+ (id)mf_mailComposeRemoteServiceInterface
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v1 = [a1 interfaceWithProtocol:&unk_1F08D1288];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  [v1 setClasses:v11 forSelector:sel_setCompositionValues_ argumentIndex:0 ofReply:0];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  [v1 setClasses:v15 forSelector:sel_framesForAttachmentsWithIdentifiers_withReply_ argumentIndex:0 ofReply:1];
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v18 = [v16 setWithArray:v17];
  [v1 setClasses:v18 forSelector:sel_addAttachmentWithItemProvider_mimeType_filename_hostIdentifier_ argumentIndex:0 ofReply:0];

  return v1;
}

+ (uint64_t)mf_mailComposeRemoteHostInterface
{
  return [a1 interfaceWithProtocol:&unk_1F089E610];
}

@end