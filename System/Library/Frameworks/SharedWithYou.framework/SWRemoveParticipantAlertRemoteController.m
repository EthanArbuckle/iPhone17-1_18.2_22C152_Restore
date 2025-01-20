@interface SWRemoveParticipantAlertRemoteController
@end

@implementation SWRemoveParticipantAlertRemoteController

uint64_t __75___SWRemoveParticipantAlertRemoteController_serviceViewControllerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDF3EAD8];
  uint64_t v1 = serviceViewControllerInterface_interface;
  serviceViewControllerInterface_interface = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __62___SWRemoveParticipantAlertRemoteController_exportedInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDF35C88];
  uint64_t v1 = exportedInterface_interface;
  exportedInterface_interface = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end