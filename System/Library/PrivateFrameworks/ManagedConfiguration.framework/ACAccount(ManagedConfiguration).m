@interface ACAccount(ManagedConfiguration)
- (id)mcAccountIdentifier;
- (id)mcBackingPayload;
- (id)mcBackingProfile;
- (id)mcConfigurationProfileIdentifier;
- (id)mcEASAccountEnableNotes;
- (id)mcEnableCalendarsUserOverridable;
- (id)mcEnableContactsUserOverridable;
- (id)mcEnableMailUserOverridable;
- (id)mcEnableNotesUserOverridable;
- (id)mcEnableRemindersUserOverridable;
- (id)mcPayloadUUID;
- (id)mcProfileUUID;
- (uint64_t)MCIsManaged;
- (void)setMcAccountIdentifier:()ManagedConfiguration;
- (void)setMcConfigurationProfileIdentifier:()ManagedConfiguration;
- (void)setMcEASAccountEnableNotes:()ManagedConfiguration;
- (void)setMcEnableCalendarsUserOverridable:()ManagedConfiguration;
- (void)setMcEnableContactsUserOverridable:()ManagedConfiguration;
- (void)setMcEnableMailUserOverridable:()ManagedConfiguration;
- (void)setMcEnableNotesUserOverridable:()ManagedConfiguration;
- (void)setMcEnableRemindersUserOverridable:()ManagedConfiguration;
- (void)setMcPayloadUUID:()ManagedConfiguration;
- (void)setMcProfileUUID:()ManagedConfiguration;
@end

@implementation ACAccount(ManagedConfiguration)

- (uint64_t)MCIsManaged
{
  v2 = [a1 accountPropertyForKey:@"MCAccountIsManaged"];
  if ([v2 BOOLValue])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 parentAccount];
    uint64_t v3 = [v4 MCIsManaged];
  }
  return v3;
}

- (id)mcAccountIdentifier
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcAccountIdentifier];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"MCAccountIdentifer"];
  }
  return v4;
}

- (void)setMcAccountIdentifier:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcAccountIdentifier:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"MCAccountIdentifer"];
  }
}

- (id)mcConfigurationProfileIdentifier
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcConfigurationProfileIdentifier];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:*MEMORY[0x1E4F17660]];
  }
  return v4;
}

- (void)setMcConfigurationProfileIdentifier:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcConfigurationProfileIdentifier:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:*MEMORY[0x1E4F17660]];
  }
}

- (id)mcProfileUUID
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcProfileUUID];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"mcProfileUUID"];
  }
  return v4;
}

- (void)setMcProfileUUID:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcProfileUUID:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"mcProfileUUID"];
  }
}

- (id)mcPayloadUUID
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcPayloadUUID];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"mcPayloadUUID"];
  }
  return v4;
}

- (void)setMcPayloadUUID:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcPayloadUUID:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"mcPayloadUUID"];
  }
}

- (id)mcEASAccountEnableNotes
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcEASAccountEnableNotes];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"mcEnableNotes"];
  }
  return v4;
}

- (void)setMcEASAccountEnableNotes:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcEASAccountEnableNotes:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"mcEnableNotes"];
  }
}

- (id)mcEnableMailUserOverridable
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcEnableMailUserOverridable];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"mcEnableMailUserOverridable"];
  }
  return v4;
}

- (void)setMcEnableMailUserOverridable:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcEnableMailUserOverridable:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"mcEnableMailUserOverridable"];
  }
}

- (id)mcEnableContactsUserOverridable
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcEnableContactsUserOverridable];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"mcEnableContactsUserOverridable"];
  }
  return v4;
}

- (void)setMcEnableContactsUserOverridable:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcEnableContactsUserOverridable:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"mcEnableContactsUserOverridable"];
  }
}

- (id)mcEnableCalendarsUserOverridable
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcEnableCalendarsUserOverridable];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"mcEnableCalendarsUserOverridable"];
  }
  return v4;
}

- (void)setMcEnableCalendarsUserOverridable:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcEnableCalendarsUserOverridable:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"mcEnableCalendarsUserOverridable"];
  }
}

- (id)mcEnableRemindersUserOverridable
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcEnableRemindersUserOverridable];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"mcEnableRemindersUserOverridable"];
  }
  return v4;
}

- (void)setMcEnableRemindersUserOverridable:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcEnableRemindersUserOverridable:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"mcEnableRemindersUserOverridable"];
  }
}

- (id)mcEnableNotesUserOverridable
{
  v2 = [a1 parentAccount];

  if (v2)
  {
    uint64_t v3 = [a1 parentAccount];
    v4 = [v3 mcEnableNotesUserOverridable];
  }
  else
  {
    v4 = [a1 accountPropertyForKey:@"mcEnableNotesUserOverridable"];
  }
  return v4;
}

- (void)setMcEnableNotesUserOverridable:()ManagedConfiguration
{
  id v6 = a3;
  v4 = [a1 parentAccount];

  if (v4)
  {
    v5 = [a1 parentAccount];
    [v5 setMcEnableNotesUserOverridable:v6];
  }
  else
  {
    [a1 setAccountProperty:v6 forKey:@"mcEnableNotesUserOverridable"];
  }
}

- (id)mcBackingProfile
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = [a1 mcProfileUUID];
  if (v1)
  {
    v2 = +[MCProfileConnection sharedConnection];
    [v2 installedProfileIdentifiersWithFilterFlags:3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
          v9 = (void *)MEMORY[0x1A6232D90](v4);
          v10 = objc_msgSend(v2, "installedProfileWithIdentifier:", v8, (void)v14);
          v11 = [v10 UUID];
          char v12 = [v11 isEqualToString:v1];

          if (v12)
          {
            goto LABEL_12;
          }

          ++v7;
        }
        while (v5 != v7);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v5 = v4;
        if (v4) {
          continue;
        }
        break;
      }
    }
    v10 = 0;
LABEL_12:
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)mcBackingPayload
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [a1 mcProfileUUID];
  uint64_t v3 = [a1 mcPayloadUUID];
  uint64_t v4 = (void *)v3;
  id v5 = 0;
  if (v2 && v3)
  {
    uint64_t v6 = +[MCProfileConnection sharedConnection];
    [v6 installedProfileIdentifiersWithFilterFlags:3];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v31)
    {
      uint64_t v8 = *(void *)v37;
      v28 = v6;
      v29 = v2;
      uint64_t v26 = *(void *)v37;
      id v27 = v7;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          uint64_t v10 = v8;
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          char v12 = (void *)MEMORY[0x1A6232D90]();
          v13 = [v6 installedProfileWithIdentifier:v11];
          long long v14 = [v13 UUID];
          int v15 = [v14 isEqualToString:v2];

          uint64_t v8 = v10;
          if (v15)
          {
            context = v12;
            long long v16 = [v13 payloads];
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v33;
              while (2)
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v33 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                  v23 = objc_msgSend(v22, "UUID", v26);
                  char v24 = [v23 isEqualToString:v4];

                  if (v24)
                  {
                    id v5 = v22;

                    uint64_t v6 = v28;
                    v2 = v29;
                    id v7 = v27;
                    goto LABEL_23;
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }

            uint64_t v6 = v28;
            v2 = v29;
            uint64_t v8 = v26;
            id v7 = v27;
            char v12 = context;
          }
        }
        id v5 = 0;
        uint64_t v31 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v31);
    }
    else
    {
      id v5 = 0;
    }
LABEL_23:
  }
  return v5;
}

@end