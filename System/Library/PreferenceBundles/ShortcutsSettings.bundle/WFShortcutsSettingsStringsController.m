@interface WFShortcutsSettingsStringsController
- (id)specifiers;
- (id)stringsFileName;
- (int64_t)numberOfParts;
@end

@implementation WFShortcutsSettingsStringsController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v14 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[WFShortcutsSettingsStringsController numberOfParts](self, "numberOfParts"));
    if ([(WFShortcutsSettingsStringsController *)self numberOfParts] >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = PSFooterTextGroupKey;
      do
      {
        v7 = +[NSString stringWithFormat:@"Part%li", v5];
        v8 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
        v9 = [(WFShortcutsSettingsStringsController *)self stringsFileName];
        v10 = WFShortcutsSettingsGetValueForKey(v7, v9);
        [v8 setProperty:v10 forKey:v6];

        [v4 addObject:v8];
        ++v5;
      }
      while (v5 < [(WFShortcutsSettingsStringsController *)self numberOfParts]);
    }
    id v11 = [v4 copy];
    v12 = *(void **)&self->PSListController_opaque[v14];
    *(void *)&self->PSListController_opaque[v14] = v11;

    v3 = *(void **)&self->PSListController_opaque[v14];
  }

  return v3;
}

- (id)stringsFileName
{
  return &stru_8520;
}

- (int64_t)numberOfParts
{
  return 0;
}

@end