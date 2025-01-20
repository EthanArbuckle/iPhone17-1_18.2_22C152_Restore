@interface AudioAccommodationsTransparencyChooserViewController
- (id)specifiers;
@end

@implementation AudioAccommodationsTransparencyChooserViewController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v17 = OBJC_IVAR___PSListController__specifiers;
    v18 = self;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v16 = +[PSSpecifier emptyGroupSpecifier];
    objc_msgSend(v4, "addObject:");
    v5 = paAvailableBluetoothDevicesSupportingTransparencyAccommodations();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v11 = [v10 name];
          v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          v13 = [v10 address];
          [v12 setUserInfo:v13];

          [v4 addObject:v12];
        }
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
    v14 = *(void **)&v18->PSListController_opaque[v17];
    *(void *)&v18->PSListController_opaque[v17] = v4;

    v3 = *(void **)&v18->PSListController_opaque[v17];
  }

  return v3;
}

@end