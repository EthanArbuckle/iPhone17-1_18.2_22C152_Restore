@interface WFNoteGroupSubstituableState
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
+ (unint64_t)managedLevelForNotesAccounts;
- (id)legacySerializedRepresentation;
@end

@implementation WFNoteGroupSubstituableState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  v12 = WFEnforceClass(v8, v11);
  v13 = [v12 objectForKeyedSubscript:@"DisplayString"];
  uint64_t v14 = objc_opt_class();
  v15 = WFEnforceClass(v13, v14);

  v16 = [v12 objectForKeyedSubscript:@"Identifier"];
  uint64_t v17 = objc_opt_class();
  v18 = WFEnforceClass(v16, v17);

  if (v15) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    v24.receiver = a1;
    v24.super_class = (Class)&OBJC_METACLASS___WFNoteGroupSubstituableState;
    v22 = objc_msgSendSuper2(&v24, sel_valueFromSerializedRepresentation_variableProvider_parameter_, v8, v9, v10);
  }
  else
  {
    v20 = (void *)[objc_alloc(MEMORY[0x263F0FFA0]) initWithVocabularyIdentifier:v18 spokenPhrase:v15 pronunciationHint:0];
    v21 = WFNotesFolderLinkValueFromIntentsValue();
    v22 = (void *)[objc_alloc(MEMORY[0x263F52010]) initWithValue:v21 indentationLevel:0];
  }
  return v22;
}

+ (unint64_t)managedLevelForNotesAccounts
{
  v2 = [MEMORY[0x263F338E8] defaultProfile];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v3 = (void *)getACAccountDataclassNotesSymbolLoc_ptr;
  uint64_t v22 = getACAccountDataclassNotesSymbolLoc_ptr;
  if (!getACAccountDataclassNotesSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = (uint64_t)__getACAccountDataclassNotesSymbolLoc_block_invoke;
    uint64_t v17 = &unk_264E5EC88;
    v18 = &v19;
    __getACAccountDataclassNotesSymbolLoc_block_invoke(&v14);
    v3 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v3)
  {
    v4 = [v2 accountIdentifiersEnabledForDataclass:*v3];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__WFNoteGroupSubstituableState_managedLevelForNotesAccounts__block_invoke;
    v12[3] = &unk_264E5CF58;
    id v5 = v2;
    id v13 = v5;
    v6 = objc_msgSend(v4, "if_compactMap:", v12);
    uint64_t v14 = 0;
    uint64_t v15 = (uint64_t)&v14;
    uint64_t v16 = 0x2020000000;
    LOBYTE(v17) = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    LOBYTE(v22) = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__WFNoteGroupSubstituableState_managedLevelForNotesAccounts__block_invoke_2;
    v11[3] = &unk_264E5CF80;
    v11[4] = &v14;
    v11[5] = &v19;
    [v6 enumerateObjectsUsingBlock:v11];
    if (*(unsigned char *)(v15 + 24)) {
      unint64_t v7 = 2 * (*((unsigned char *)v20 + 24) == 0);
    }
    else {
      unint64_t v7 = *((unsigned __int8 *)v20 + 24);
    }
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v14, 8);

    return v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = [NSString stringWithUTF8String:"NSString *getACAccountDataclassNotes(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"WFNoteGroupSubstituableState.m", 19, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

uint64_t __60__WFNoteGroupSubstituableState_managedLevelForNotesAccounts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) accountWithIdentifier:a2];
}

uint64_t __60__WFNoteGroupSubstituableState_managedLevelForNotesAccounts__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 MCIsManaged];
  uint64_t v7 = 40;
  if (result) {
    uint64_t v7 = 32;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + v7) + 8) + 24) = 1;
  char v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v8) {
    char v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  *a4 = v8;
  return result;
}

- (id)legacySerializedRepresentation
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = [(WFVariableSubstitutableParameterState *)self value];
  v3 = [v2 value];
  v4 = WFNotesFolderIntentsValueFromLinkValue();

  if (v4)
  {
    v9[0] = @"DisplayString";
    id v5 = [v4 spokenPhrase];
    v9[1] = @"Identifier";
    v10[0] = v5;
    v6 = [v4 vocabularyIdentifier];
    v10[1] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end