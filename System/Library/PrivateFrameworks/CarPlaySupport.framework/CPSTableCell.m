@interface CPSTableCell
- (void)configureWithListItem:(id)a3 spinning:(BOOL)a4 environment:(id)a5 playbackState:(int64_t)a6;
@end

@implementation CPSTableCell

- (void)configureWithListItem:(id)a3 spinning:(BOOL)a4 environment:(id)a5 playbackState:(int64_t)a6
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v39 = a4;
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  int64_t v37 = a6;
  id v36 = 0;
  uint64_t v30 = [location[0] accessoryType];
  if (v30)
  {
    if (v30 == 1)
    {
      id v8 = (id)[MEMORY[0x263F313D8] accessoryWithDisclosureIndicator];
      id v9 = v36;
      id v36 = v8;
    }
    else if (v30 == 2)
    {
      char v34 = 0;
      char v32 = 0;
      if ([v38 isUserApplication])
      {
        id v35 = (id)[MEMORY[0x263F313D8] accessoryWithCloudIcon];
        char v34 = 1;
        objc_storeStrong(&v36, v35);
      }
      else
      {
        id v33 = (id)[MEMORY[0x263F313D8] accessoryWithiCloudIcon];
        char v32 = 1;
        objc_storeStrong(&v36, v33);
      }
      if (v32) {

      }
      if (v34) {
    }
      }
  }
  else
  {
    id v26 = (id)[location[0] accessoryImage];

    if (v26)
    {
      v24 = (void *)MEMORY[0x263F313D8];
      id v25 = (id)[location[0] accessoryImage];
      id v6 = (id)objc_msgSend(v24, "accessoryWithImage:");
      id v7 = v36;
      id v36 = v6;
    }
  }
  v20 = (void *)MEMORY[0x263F313E0];
  id v23 = (id)[location[0] text];
  id v22 = (id)[location[0] detailText];
  id v21 = (id)[location[0] image];
  char v16 = [location[0] isExplicitContent];
  id v17 = v36;
  BOOL v18 = v39;
  [location[0] playbackProgress];
  BOOL v14 = v10 > 0.0;
  [location[0] playbackProgress];
  double v19 = v11;
  int64_t v15 = v37;
  LOBYTE(v12) = v14;
  LOBYTE(v13) = [location[0] playingIndicatorLocation] == 0;
  BYTE1(v13) = [location[0] isEnabled] & 1;
  id v31 = (id)objc_msgSend(v20, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:playbackState:playingIndicatorLeadingSide:isEnabled:", v23, v22, v21, v16 & 1, v17, v18, v19, v12, v15, v13);

  [(CPUITableCell *)v41 applyConfiguration:v31];
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

@end