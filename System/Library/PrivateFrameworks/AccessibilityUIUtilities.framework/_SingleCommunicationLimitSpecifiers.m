@interface _SingleCommunicationLimitSpecifiers
- (NSArray)allSpecifiers;
- (PSSpecifier)allContactsSpecifier;
- (PSSpecifier)everyoneSpecifier;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)selectedContactsSpecifier;
- (_SingleCommunicationLimitSpecifiers)initWithHeaderText:(id)a3 communicationLimit:(id)a4 maximumCommunicationLimit:(id)a5;
- (id)communicationLimitForSpecifier:(id)a3;
- (id)specifierForCommunicationLimit:(id)a3;
- (void)setAllContactsSpecifier:(id)a3;
- (void)setAllSpecifiers:(id)a3;
- (void)setEveryoneSpecifier:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setSelectedContactsSpecifier:(id)a3;
- (void)updateForCommunicationLimit:(id)a3 maximumCommunicationLimit:(id)a4;
@end

@implementation _SingleCommunicationLimitSpecifiers

- (_SingleCommunicationLimitSpecifiers)initWithHeaderText:(id)a3 communicationLimit:(id)a4 maximumCommunicationLimit:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)_SingleCommunicationLimitSpecifiers;
  v11 = [(_SingleCommunicationLimitSpecifiers *)&v27 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v8];
    groupSpecifier = v11->_groupSpecifier;
    v11->_groupSpecifier = (PSSpecifier *)v12;

    [(PSSpecifier *)v11->_groupSpecifier setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F931A8]];
    v14 = (void *)MEMORY[0x1E4F92E70];
    v15 = AXUILocalizedStringForKey(@"FAVORITES");
    uint64_t v16 = [v14 preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:0 cell:3 edit:0];
    selectedContactsSpecifier = v11->_selectedContactsSpecifier;
    v11->_selectedContactsSpecifier = (PSSpecifier *)v16;

    v18 = (void *)MEMORY[0x1E4F92E70];
    v19 = AXUILocalizedStringForKey(@"CONTACTS");
    uint64_t v20 = [v18 preferenceSpecifierNamed:v19 target:0 set:0 get:0 detail:0 cell:3 edit:0];
    allContactsSpecifier = v11->_allContactsSpecifier;
    v11->_allContactsSpecifier = (PSSpecifier *)v20;

    v22 = (void *)MEMORY[0x1E4F92E70];
    v23 = AXUILocalizedStringForKey(@"ANYONE");
    uint64_t v24 = [v22 preferenceSpecifierNamed:v23 target:0 set:0 get:0 detail:0 cell:3 edit:0];
    everyoneSpecifier = v11->_everyoneSpecifier;
    v11->_everyoneSpecifier = (PSSpecifier *)v24;

    [(_SingleCommunicationLimitSpecifiers *)v11 updateForCommunicationLimit:v9 maximumCommunicationLimit:v10];
  }

  return v11;
}

- (NSArray)allSpecifiers
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v3 = [(_SingleCommunicationLimitSpecifiers *)self groupSpecifier];
  v9[0] = v3;
  v4 = [(_SingleCommunicationLimitSpecifiers *)self selectedContactsSpecifier];
  v9[1] = v4;
  v5 = [(_SingleCommunicationLimitSpecifiers *)self allContactsSpecifier];
  v9[2] = v5;
  v6 = [(_SingleCommunicationLimitSpecifiers *)self everyoneSpecifier];
  v9[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return (NSArray *)v7;
}

- (id)specifierForCommunicationLimit:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F59020]])
  {
    uint64_t v5 = [(_SingleCommunicationLimitSpecifiers *)self allContactsSpecifier];
LABEL_7:
    v6 = (void *)v5;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F59040]])
  {
    uint64_t v5 = [(_SingleCommunicationLimitSpecifiers *)self selectedContactsSpecifier];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F59030]])
  {
    uint64_t v5 = [(_SingleCommunicationLimitSpecifiers *)self everyoneSpecifier];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (id)communicationLimitForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_SingleCommunicationLimitSpecifiers *)self allContactsSpecifier];

  if (v5 != v4)
  {
    id v6 = [(_SingleCommunicationLimitSpecifiers *)self selectedContactsSpecifier];

    if (v6 == v4)
    {
      id v9 = (id *)MEMORY[0x1E4F59040];
      goto LABEL_10;
    }
    id v7 = [(_SingleCommunicationLimitSpecifiers *)self everyoneSpecifier];

    if (v7 == v4)
    {
      id v9 = (id *)MEMORY[0x1E4F59030];
      goto LABEL_10;
    }
    id v8 = [MEMORY[0x1E4F59050] commonLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[_SingleCommunicationLimitSpecifiers communicationLimitForSpecifier:]();
    }
  }
  id v9 = (id *)MEMORY[0x1E4F59020];
LABEL_10:
  id v10 = *v9;

  return v10;
}

- (void)updateForCommunicationLimit:(id)a3 maximumCommunicationLimit:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_SingleCommunicationLimitSpecifiers *)self groupSpecifier];
  id v9 = [(_SingleCommunicationLimitSpecifiers *)self specifierForCommunicationLimit:v7];

  [v8 setProperty:v9 forKey:*MEMORY[0x1E4F931D8]];
  id v10 = CLFSortedCommunicationLimits();
  uint64_t v11 = [v10 indexOfObject:v6];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [MEMORY[0x1E4F59050] commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_SingleCommunicationLimitSpecifiers updateForCommunicationLimit:maximumCommunicationLimit:]();
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93___SingleCommunicationLimitSpecifiers_updateForCommunicationLimit_maximumCommunicationLimit___block_invoke;
    v13[3] = &unk_1E649C8D8;
    v13[4] = self;
    v13[5] = v11;
    [v10 enumerateObjectsUsingBlock:v13];
  }
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)selectedContactsSpecifier
{
  return self->_selectedContactsSpecifier;
}

- (void)setSelectedContactsSpecifier:(id)a3
{
}

- (PSSpecifier)allContactsSpecifier
{
  return self->_allContactsSpecifier;
}

- (void)setAllContactsSpecifier:(id)a3
{
}

- (PSSpecifier)everyoneSpecifier
{
  return self->_everyoneSpecifier;
}

- (void)setEveryoneSpecifier:(id)a3
{
}

- (void)setAllSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
  objc_storeStrong((id *)&self->_everyoneSpecifier, 0);
  objc_storeStrong((id *)&self->_allContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_selectedContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

- (void)communicationLimitForSpecifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1C39D1000, v0, OS_LOG_TYPE_FAULT, "Unhandled incoming communication limit specifier: %@", v1, 0xCu);
}

- (void)updateForCommunicationLimit:maximumCommunicationLimit:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1C39D1000, v0, OS_LOG_TYPE_FAULT, "Unable to find maximum communication limit \"%@\" in sorted list.", v1, 0xCu);
}

@end