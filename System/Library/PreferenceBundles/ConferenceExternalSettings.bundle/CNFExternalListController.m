@interface CNFExternalListController
- (id)specifiers;
@end

@implementation CNFExternalListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(CNFExternalListController *)self loadSpecifiersFromPlistName:@"ConferenceExternalSettings" target:self];
    v6 = *(void **)&self->super.PSListController_opaque[v3];
    *(void *)&self->super.PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.PSListController_opaque[v3];
  }

  return v4;
}

@end