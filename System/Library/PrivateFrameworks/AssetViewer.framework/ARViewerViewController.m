@interface ARViewerViewController
@end

@implementation ARViewerViewController

uint64_t __57___ARViewerViewController__remoteViewControllerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3E0B8A0];
  uint64_t v1 = _remoteViewControllerInterface_sHostInterface;
  _remoteViewControllerInterface_sHostInterface = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __45___ARViewerViewController__exportedInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3E11110];
  uint64_t v1 = _exportedInterface_sVendorInterface;
  _exportedInterface_sVendorInterface = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __54___ARViewerViewController_isIgnoringInteractionEvents__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __47___ARViewerViewController_statusBarOrientation__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end