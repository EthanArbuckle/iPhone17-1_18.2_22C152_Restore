@interface DNDMutableSenderConfiguration
- (void)removeAllowedContactMatchingContact:(id)a3;
- (void)removeDeniedContactMatchingContact:(id)a3;
- (void)setAllowedContactGroups:(id)a3;
- (void)setAllowedContactTypes:(id)a3;
- (void)setAllowedContacts:(id)a3;
- (void)setDeniedContactGroups:(id)a3;
- (void)setDeniedContactTypes:(id)a3;
- (void)setDeniedContacts:(id)a3;
- (void)setPhoneCallBypassSettings:(id)a3;
@end

@implementation DNDMutableSenderConfiguration

- (void)setAllowedContactTypes:(id)a3
{
  self->super._allowedContactTypes = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setDeniedContactTypes:(id)a3
{
  self->super._deniedContactTypes = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setAllowedContactGroups:(id)a3
{
  self->super._allowedContactGroups = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setDeniedContactGroups:(id)a3
{
  self->super._deniedContactGroups = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setAllowedContacts:(id)a3
{
  self->super._allowedContacts = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setDeniedContacts:(id)a3
{
  self->super._deniedContacts = (NSMutableSet *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setPhoneCallBypassSettings:(id)a3
{
  self->super._phoneCallBypassSettings = (DNDBypassSettings *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)removeAllowedContactMatchingContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->super._allowedContacts;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if (objc_msgSend(v4, "matchesContact:", v10, (void)v12)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    v11 = v10;

    if (!v11) {
      goto LABEL_13;
    }
    [(NSMutableSet *)self->super._allowedContacts removeObject:v11];
    v5 = v11;
  }
LABEL_12:

LABEL_13:
}

- (void)removeDeniedContactMatchingContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->super._deniedContacts;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if (objc_msgSend(v4, "matchesContact:", v10, (void)v12)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    v11 = v10;

    if (!v11) {
      goto LABEL_13;
    }
    [(NSMutableSet *)self->super._deniedContacts removeObject:v11];
    v5 = v11;
  }
LABEL_12:

LABEL_13:
}

@end