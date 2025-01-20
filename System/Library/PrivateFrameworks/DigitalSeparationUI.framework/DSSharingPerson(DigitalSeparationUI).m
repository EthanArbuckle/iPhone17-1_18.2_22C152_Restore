@interface DSSharingPerson(DigitalSeparationUI)
- (id)iconForDetail;
- (id)iconForTable;
- (id)iconWithSize:()DigitalSeparationUI;
@end

@implementation DSSharingPerson(DigitalSeparationUI)

- (id)iconWithSize:()DigitalSeparationUI
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263EFEBA0]);
  v5 = [MEMORY[0x263EFEBA8] defaultSettings];
  v6 = (void *)[v4 initWithSettings:v5];

  BOOL v7 = [(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] == 1;
  v8 = (void *)MEMORY[0x263EFEBB0];
  v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  v11 = objc_msgSend(v8, "scopeWithPointSize:scale:rightToLeft:style:", v7, 0, a2, a2, v10);

  v12 = [a1 contact];
  v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = objc_alloc_init(MEMORY[0x263EFEAF0]);
  }
  v15 = v14;

  v19[0] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  v17 = [v6 avatarImageForContacts:v16 scope:v11];

  return v17;
}

- (id)iconForTable
{
  v2 = [a1 contact];

  if (v2)
  {
    LODWORD(v3) = 1108344832;
    id v4 = [a1 iconWithSize:v3];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__DSSharingPerson_DigitalSeparationUI__iconForTable__block_invoke;
    block[3] = &unk_264C6E7D0;
    block[4] = a1;
    if (iconForTable_onceToken != -1) {
      dispatch_once(&iconForTable_onceToken, block);
    }
    id v4 = (id)iconForTable_contactLessIcon;
  }
  return v4;
}

- (id)iconForDetail
{
  v2 = [a1 contact];

  if (v2)
  {
    LODWORD(v3) = 1114636288;
    id v4 = [a1 iconWithSize:v3];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__DSSharingPerson_DigitalSeparationUI__iconForDetail__block_invoke;
    block[3] = &unk_264C6E7D0;
    block[4] = a1;
    if (iconForDetail_onceToken != -1) {
      dispatch_once(&iconForDetail_onceToken, block);
    }
    id v4 = (id)iconForDetail_contactLessIcon;
  }
  return v4;
}

@end