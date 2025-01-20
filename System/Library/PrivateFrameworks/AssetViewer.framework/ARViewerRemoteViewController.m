@interface ARViewerRemoteViewController
@end

@implementation ARViewerRemoteViewController

uint64_t __63___ARViewerRemoteViewController_serviceViewControllerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3E11110];
  uint64_t v1 = serviceViewControllerInterface_sVendorInterface;
  serviceViewControllerInterface_sVendorInterface = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __50___ARViewerRemoteViewController_exportedInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3E0B8A0];
  uint64_t v1 = exportedInterface_sHostInterface;
  exportedInterface_sHostInterface = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end