@interface CKSettingsCheckInLocationHistory
- (CKSettingsCheckInLocationHistory)init;
- (PSSpecifier)fullLocationHistoryDevices;
- (PSSpecifier)fullLocationHistoryMap;
- (PSSpecifier)fullLocationHistorySelector;
- (PSSpecifier)noLocationHistoryDevices;
- (PSSpecifier)noLocationHistoryMap;
- (PSSpecifier)noLocationHistorySelector;
- (PSSpecifier)sampleDevicesDataGroup;
- (PSSpecifier)sampleMapDataGroup;
- (PSSpecifier)selectionGroup;
- (id)getSelectionGroupFooterText;
- (id)sampleDevicesDataSpecifier;
- (id)sampleMapDataSpecifier;
- (id)specifiers;
- (void)setFullLocationHistoryDevices:(id)a3;
- (void)setFullLocationHistoryMap:(id)a3;
- (void)setFullLocationHistorySelector:(id)a3;
- (void)setNoLocationHistoryDevices:(id)a3;
- (void)setNoLocationHistoryMap:(id)a3;
- (void)setNoLocationHistorySelector:(id)a3;
- (void)setSampleDevicesDataGroup:(id)a3;
- (void)setSampleMapDataGroup:(id)a3;
- (void)setSelectionGroup:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSampleDataSpecifiersAnimated:(BOOL)a3;
@end

@implementation CKSettingsCheckInLocationHistory

- (CKSettingsCheckInLocationHistory)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKSettingsCheckInLocationHistory;
  v2 = [(CKSettingsCheckInLocationHistory *)&v5 init];
  if (v2)
  {
    v3 = MessagesSettingsLocalizedString(@"CHECK_IN_LOCATION_HISTORY_VIEW_TITLE");
    [(CKSettingsCheckInLocationHistory *)v2 setTitle:v3];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v6 = objc_opt_new();
    v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"LOCATION_HISTORY_SELECTION_GROUP"];
    [(CKSettingsCheckInLocationHistory *)self setSelectionGroup:v7];

    v8 = [(CKSettingsCheckInLocationHistory *)self selectionGroup];
    v9 = [(CKSettingsCheckInLocationHistory *)self getSelectionGroupFooterText];
    uint64_t v10 = *MEMORY[0x263F600F8];
    [v8 setProperty:v9 forKey:*MEMORY[0x263F600F8]];

    v11 = [(CKSettingsCheckInLocationHistory *)self selectionGroup];
    uint64_t v12 = MEMORY[0x263EFFA88];
    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];

    v13 = [(CKSettingsCheckInLocationHistory *)self selectionGroup];
    [v6 addObject:v13];

    v14 = (void *)MEMORY[0x263F5FC40];
    v15 = MessagesSettingsLocalizedString(@"CHECK_IN_LOCATION_HISTORY_SELECTION_NO_HISTORY");
    v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [(CKSettingsCheckInLocationHistory *)self setNoLocationHistorySelector:v16];

    v17 = [(CKSettingsCheckInLocationHistory *)self noLocationHistorySelector];
    uint64_t v18 = *MEMORY[0x263F5FEF8];
    [v17 setProperty:v12 forKey:*MEMORY[0x263F5FEF8]];

    v19 = [(CKSettingsCheckInLocationHistory *)self noLocationHistorySelector];
    uint64_t v20 = *MEMORY[0x263F60308];
    [v19 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60308]];

    v21 = [(CKSettingsCheckInLocationHistory *)self noLocationHistorySelector];
    [v6 addObject:v21];

    v22 = (void *)MEMORY[0x263F5FC40];
    v23 = MessagesSettingsLocalizedString(@"CHECK_IN_LOCATION_HISTORY_SELECTION_FULL_HISTORY");
    v24 = [v22 preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [(CKSettingsCheckInLocationHistory *)self setFullLocationHistorySelector:v24];

    v25 = [(CKSettingsCheckInLocationHistory *)self fullLocationHistorySelector];
    [v25 setProperty:v12 forKey:v18];

    v26 = [(CKSettingsCheckInLocationHistory *)self fullLocationHistorySelector];
    [v26 setProperty:v12 forKey:v20];

    v27 = [(CKSettingsCheckInLocationHistory *)self fullLocationHistorySelector];
    [v6 addObject:v27];

    v28 = [(CKSettingsCheckInLocationHistory *)self selectionGroup];
    if ([MEMORY[0x263F669F0] shareAllLocations]) {
      [(CKSettingsCheckInLocationHistory *)self fullLocationHistorySelector];
    }
    else {
    v29 = [(CKSettingsCheckInLocationHistory *)self noLocationHistorySelector];
    }
    [v28 setProperty:v29 forKey:*MEMORY[0x263F60200]];

    v30 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"LOCATION_HISTORY_SAMPLE_MAP_DATA_GROUP"];
    [(CKSettingsCheckInLocationHistory *)self setSampleMapDataGroup:v30];

    v31 = [(CKSettingsCheckInLocationHistory *)self sampleMapDataGroup];
    v32 = MessagesSettingsLocalizedString(@"CHECK_IN_LOCATION_HISTORY_SAMPLE_DATA_TITLE");
    [v31 setName:v32];

    v33 = [(CKSettingsCheckInLocationHistory *)self sampleMapDataGroup];
    [v6 addObject:v33];

    v34 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [(CKSettingsCheckInLocationHistory *)self setNoLocationHistoryMap:v34];

    v35 = [(CKSettingsCheckInLocationHistory *)self noLocationHistoryMap];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = *MEMORY[0x263F5FFE0];
    [v35 setProperty:v36 forKey:*MEMORY[0x263F5FFE0]];

    v38 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [(CKSettingsCheckInLocationHistory *)self setFullLocationHistoryMap:v38];

    v39 = [(CKSettingsCheckInLocationHistory *)self fullLocationHistoryMap];
    [v39 setProperty:objc_opt_class() forKey:v37];

    v40 = [(CKSettingsCheckInLocationHistory *)self sampleMapDataSpecifier];
    [v6 addObject:v40];

    v41 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"LOCATION_HISTORY_SAMPLE_DEVICES_DATA_GROUP"];
    [(CKSettingsCheckInLocationHistory *)self setSampleDevicesDataGroup:v41];

    v42 = [(CKSettingsCheckInLocationHistory *)self sampleDevicesDataGroup];
    v43 = MessagesSettingsLocalizedString(@"CHECK_IN_LOCATION_HISTORY_SELECTION_GROUP_FOOTER");
    [v42 setProperty:v43 forKey:v10];

    v44 = [(CKSettingsCheckInLocationHistory *)self sampleDevicesDataGroup];
    [v6 addObject:v44];

    v45 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [(CKSettingsCheckInLocationHistory *)self setNoLocationHistoryDevices:v45];

    v46 = [(CKSettingsCheckInLocationHistory *)self noLocationHistoryDevices];
    [v46 setProperty:objc_opt_class() forKey:v37];

    v47 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [(CKSettingsCheckInLocationHistory *)self setFullLocationHistoryDevices:v47];

    v48 = [(CKSettingsCheckInLocationHistory *)self fullLocationHistoryDevices];
    [v48 setProperty:objc_opt_class() forKey:v37];

    v49 = [(CKSettingsCheckInLocationHistory *)self sampleDevicesDataSpecifier];
    [v6 addObject:v49];

    v50 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v6;
    id v51 = v6;

    id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  }
  return v4;
}

- (id)getSelectionGroupFooterText
{
  if ([MEMORY[0x263F669F0] shareAllLocations]) {
    uint64_t v2 = @"CHECK_IN_LOCATION_HISTORY_SAMPLE_DATA_FULL_HISTORY_FOOTER";
  }
  else {
    uint64_t v2 = @"CHECK_IN_LOCATION_HISTORY_SAMPLE_DATA_NO_HISTORY_FOOTER";
  }
  v3 = MessagesSettingsLocalizedString(v2);
  return v3;
}

- (id)sampleMapDataSpecifier
{
  if ([MEMORY[0x263F669F0] shareAllLocations]) {
    [(CKSettingsCheckInLocationHistory *)self fullLocationHistoryMap];
  }
  else {
  v3 = [(CKSettingsCheckInLocationHistory *)self noLocationHistoryMap];
  }
  return v3;
}

- (id)sampleDevicesDataSpecifier
{
  if ([MEMORY[0x263F669F0] shareAllLocations]) {
    [(CKSettingsCheckInLocationHistory *)self fullLocationHistoryDevices];
  }
  else {
  v3 = [(CKSettingsCheckInLocationHistory *)self noLocationHistoryDevices];
  }
  return v3;
}

- (void)updateSampleDataSpecifiersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v49 = *MEMORY[0x263EF8340];
  objc_super v5 = [(CKSettingsCheckInLocationHistory *)self selectionGroup];
  v6 = [(CKSettingsCheckInLocationHistory *)self getSelectionGroupFooterText];
  [v5 setProperty:v6 forKey:*MEMORY[0x263F600F8]];

  v7 = [(CKSettingsCheckInLocationHistory *)self selectionGroup];
  [(CKSettingsCheckInLocationHistory *)self reloadSpecifier:v7 animated:1];

  uint64_t v46 = 0;
  v8 = [(CKSettingsCheckInLocationHistory *)self sampleMapDataGroup];
  v9 = [v8 identifier];
  [(CKSettingsCheckInLocationHistory *)self getGroup:&v46 row:0 ofSpecifierID:v9];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = [(CKSettingsCheckInLocationHistory *)self specifiersInGroup:v46];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v16 = [v15 identifier];
        v17 = [(CKSettingsCheckInLocationHistory *)self sampleMapDataGroup];
        uint64_t v18 = [v17 identifier];

        if (v16 != v18) {
          [(CKSettingsCheckInLocationHistory *)self removeSpecifier:v15 animated:v3];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v12);
  }

  v19 = [(CKSettingsCheckInLocationHistory *)self sampleMapDataGroup];
  uint64_t v20 = [v19 identifier];
  uint64_t v21 = [(CKSettingsCheckInLocationHistory *)self indexOfSpecifierID:v20] + 1;

  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = [(CKSettingsCheckInLocationHistory *)self sampleMapDataSpecifier];
    [(CKSettingsCheckInLocationHistory *)self insertSpecifier:v22 atIndex:v21 animated:v3];

    v23 = [(CKSettingsCheckInLocationHistory *)self sampleDevicesDataGroup];
    v24 = [v23 identifier];
    [(CKSettingsCheckInLocationHistory *)self getGroup:&v46 row:0 ofSpecifierID:v24];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v25 = -[CKSettingsCheckInLocationHistory specifiersInGroup:](self, "specifiersInGroup:", v46, 0);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          v31 = [v30 identifier];
          v32 = [(CKSettingsCheckInLocationHistory *)self sampleDevicesDataGroup];
          v33 = [v32 identifier];

          if (v31 != v33) {
            [(CKSettingsCheckInLocationHistory *)self removeSpecifier:v30 animated:v3];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v27);
    }

    v34 = [(CKSettingsCheckInLocationHistory *)self sampleDevicesDataGroup];
    v35 = [v34 identifier];
    uint64_t v36 = [(CKSettingsCheckInLocationHistory *)self indexOfSpecifierID:v35] + 1;

    if (v36 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v37 = [(CKSettingsCheckInLocationHistory *)self sampleDevicesDataSpecifier];
      [(CKSettingsCheckInLocationHistory *)self insertSpecifier:v37 atIndex:v36 animated:v3];
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CKSettingsCheckInLocationHistory *)self indexForIndexPath:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
  }
  uint64_t v10 = [(CKSettingsCheckInLocationHistory *)self getGroupSpecifierForSpecifier:v9];
  uint64_t v11 = [v10 propertyForKey:*MEMORY[0x263F60168]];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    uint64_t v13 = [(CKSettingsCheckInLocationHistory *)self selectionGroup];

    v14 = [v9 propertyForKey:*MEMORY[0x263F60308]];
    v15 = v14;
    if (v10 == v13)
    {
      uint64_t v16 = [v14 BOOLValue];
      [MEMORY[0x263F669F0] setShareAllLocations:v16];

      [(CKSettingsCheckInLocationHistory *)self updateSampleDataSpecifiersAnimated:1];
    }
    else
    {
      [(CKSettingsCheckInLocationHistory *)self setPreferenceValue:v14 specifier:v10];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CKSettingsCheckInLocationHistory;
  [(CKSettingsCheckInLocationHistory *)&v17 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (PSSpecifier)selectionGroup
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setSelectionGroup:(id)a3
{
}

- (PSSpecifier)noLocationHistorySelector
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setNoLocationHistorySelector:(id)a3
{
}

- (PSSpecifier)fullLocationHistorySelector
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setFullLocationHistorySelector:(id)a3
{
}

- (PSSpecifier)sampleMapDataGroup
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setSampleMapDataGroup:(id)a3
{
}

- (PSSpecifier)noLocationHistoryMap
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setNoLocationHistoryMap:(id)a3
{
}

- (PSSpecifier)fullLocationHistoryMap
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setFullLocationHistoryMap:(id)a3
{
}

- (PSSpecifier)sampleDevicesDataGroup
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setSampleDevicesDataGroup:(id)a3
{
}

- (PSSpecifier)noLocationHistoryDevices
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setNoLocationHistoryDevices:(id)a3
{
}

- (PSSpecifier)fullLocationHistoryDevices
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setFullLocationHistoryDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullLocationHistoryDevices, 0);
  objc_storeStrong((id *)&self->_noLocationHistoryDevices, 0);
  objc_storeStrong((id *)&self->_sampleDevicesDataGroup, 0);
  objc_storeStrong((id *)&self->_fullLocationHistoryMap, 0);
  objc_storeStrong((id *)&self->_noLocationHistoryMap, 0);
  objc_storeStrong((id *)&self->_sampleMapDataGroup, 0);
  objc_storeStrong((id *)&self->_fullLocationHistorySelector, 0);
  objc_storeStrong((id *)&self->_noLocationHistorySelector, 0);
  objc_storeStrong((id *)&self->_selectionGroup, 0);
}

@end