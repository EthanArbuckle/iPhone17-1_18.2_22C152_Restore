@interface ZoomHandGesturesActionDetailController
- (id)_mapZoomActionToWCImage:(unint64_t)a3;
- (id)actionDetailControllerDelegate;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ZoomHandGesturesActionDetailController

- (id)actionDetailControllerDelegate
{
  v2 = [(ZoomHandGesturesActionDetailController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:@"ZoomHandGesturesActionDetailDelegate"];

  return v4;
}

- (id)specifiers
{
  v2 = self;
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v25 = (int)*MEMORY[0x263F5FDB8];
    v24 = [MEMORY[0x263EFF980] array];
    v4 = [(ZoomHandGesturesActionDetailController *)v2 actionDetailControllerDelegate];
    v30 = [v4 selectedActionForDetailController:v2];

    v5 = [MEMORY[0x263EFF980] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [MEMORY[0x263F88150] defaultActions];
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v28 = *(void *)v32;
      v29 = 0;
      uint64_t v27 = *MEMORY[0x263F60140];
      uint64_t v8 = *MEMORY[0x263F60308];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          v10 = v2;
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v12 = [v11 unsignedIntegerValue];
          v13 = [MEMORY[0x263F88150] nameForAction:v12];
          v14 = (void *)MEMORY[0x263F5FC40];
          v15 = settingsLocString(v13, @"ZoomSettings");
          v16 = [v14 preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          v2 = v10;
          v17 = [(ZoomHandGesturesActionDetailController *)v10 _mapZoomActionToWCImage:v12];
          [v16 setProperty:v17 forKey:v27];
          [v16 setProperty:v11 forKey:v8];
          if ([v11 isEqualToNumber:v30])
          {
            id v18 = v16;

            v29 = v18;
          }
          [v5 addObject:v16];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v7);
    }
    else
    {
      v29 = 0;
    }

    if ([v5 count])
    {
      v19 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:0 edit:0];
      [v19 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
      [v24 addObject:v19];
      if (v29) {
        [v19 setProperty:v29 forKey:*MEMORY[0x263F60200]];
      }
      [v24 addObjectsFromArray:v5];
    }
    v20 = v2;
    v21 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v25);
    *(Class *)((char *)&v20->super.super.super.super.super.super.isa + v25) = (Class)v24;
    id v22 = v24;

    v3 = *(Class *)((char *)&v20->super.super.super.super.super.super.isa + v25);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)ZoomHandGesturesActionDetailController;
  id v6 = a4;
  [(ZoomHandGesturesActionDetailController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[ZoomHandGesturesActionDetailController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);
  uint64_t v8 = [(ZoomHandGesturesActionDetailController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  uint64_t v10 = [v6 section];
  v11 = [(ZoomHandGesturesActionDetailController *)self specifierAtIndex:[(ZoomHandGesturesActionDetailController *)self indexOfGroup:v10]];
  uint64_t v12 = [v11 propertyForKey:*MEMORY[0x263F60168]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    if (v14)
    {
      v15 = [(ZoomHandGesturesActionDetailController *)self actionDetailControllerDelegate];
      [v15 setAction:v14 forDetailController:self];

      [(ZoomHandGesturesActionDetailController *)self reloadSpecifiers];
    }
  }
}

- (id)_mapZoomActionToWCImage:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
      v3 = WCImageForAction();
      break;
    case 1uLL:
      v4 = (void *)MEMORY[0x263F827E8];
      v5 = [MEMORY[0x263F88150] symbolNameForAction:1];
      id v6 = [v4 _systemImageNamed:v5];

      uint64_t v7 = [MEMORY[0x263F825C8] whiteColor];
      v3 = [v6 imageWithTintColor:v7 renderingMode:1];

      break;
    default:
      v3 = 0;
      break;
  }

  return v3;
}

@end