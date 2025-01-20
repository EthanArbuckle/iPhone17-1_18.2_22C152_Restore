@interface CNFInternalProcessListController
- (id)bundle;
- (id)specifiers;
- (void)conferenceKillProcesses:(id)a3;
- (void)conferenceKillProcessesAndNukeKeychain:(id)a3;
- (void)killJustIChatAgent:(id)a3;
- (void)killJustIMAVAgent:(id)a3;
- (void)killJustMediaServerD:(id)a3;
@end

@implementation CNFInternalProcessListController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(CNFInternalProcessListController *)self loadSpecifiersFromPlistName:@"ConferenceInternalProcessSettings" target:self];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)bundle
{
  return +[CNFInternalSettingsUtilities currentInternalSettingsBundle];
}

- (void)killJustIChatAgent:(id)a3
{
}

- (void)killJustIMAVAgent:(id)a3
{
}

- (void)killJustMediaServerD:(id)a3
{
}

- (void)conferenceKillProcessesAndNukeKeychain:(id)a3
{
  +[CNFInternalSettingsUtilities nukeKeychain];
  +[CNFInternalSettingsUtilities killEverything];
}

- (void)conferenceKillProcesses:(id)a3
{
}

@end