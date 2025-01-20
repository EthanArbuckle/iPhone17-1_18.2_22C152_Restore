@interface DOCFileRenamingSupport(Swift_OBJC)
+ (void)_workaroundWrapper_renameDocumentAtURL:()Swift_OBJC newName:hostIdentifier:completionHandler:;
@end

@implementation DOCFileRenamingSupport(Swift_OBJC)

+ (void)_workaroundWrapper_renameDocumentAtURL:()Swift_OBJC newName:hostIdentifier:completionHandler:
{
  id v9 = a6;
  v10 = (void *)MEMORY[0x263F3AAC8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __118__DOCFileRenamingSupport_Swift_OBJC___workaroundWrapper_renameDocumentAtURL_newName_hostIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_2648FB460;
  id v13 = v9;
  id v11 = v9;
  [v10 _renameDocumentAtURL:a3 newName:a4 hostIdentifier:a5 roleIdentifier:0 completion:v12];
}

@end