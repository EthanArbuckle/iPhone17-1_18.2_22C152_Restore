@interface WFContactContentItem
+ (BOOL)hasLibrary;
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)cachedContactGroups;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (WFContact)cachedContact;
- (WFContact)contact;
- (id)changeTransaction;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)objectRepresentationsFromLabeledValues:(id)a3;
- (id)unnamedObjectRepresentationsFromLabeledValues:(id)a3;
- (void)setCachedContact:(id)a3;
@end

@implementation WFContactContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Contacts");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Contacts (plural)", @"Contacts");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Contact (singular)", @"Contact");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = +[WFObjectType typeWithClass:objc_opt_class()];
  v7 = +[WFObjectType typeWithClass:objc_opt_class()];
  v8 = +[WFObjectType typeWithClass:objc_opt_class()];
  v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DD50]];
  v10 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else if (([v4 conformsToClass:objc_opt_class()] & 1) != 0 {
         || ([v4 conformsToClass:objc_opt_class()] & 1) != 0)
  }
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFContactContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 count])
  {
    v19.receiver = a1;
    v19.super_class = (Class)&OBJC_METACLASS___WFContactContentItem;
    objc_msgSendSuper2(&v19, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __81__WFContactContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke;
    v14[3] = &unk_264286D08;
    id v15 = v10;
    id v16 = v12;
    id v17 = v13;
    id v18 = a1;
    [v16 allowContactsAccessWithCompletionHandler:v14];
  }
}

void __81__WFContactContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 allContactsWithSortOrder:0];
  id v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_425);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v8.receiver = *(id *)(a1 + 56);
  v8.super_class = (Class)&OBJC_METACLASS___WFContactContentItem;
  objc_msgSendSuper2(&v8, sel_runQuery_withItems_permissionRequestor_completionHandler_, v5, v4, v6, v7);
}

WFContactContentItem *__81__WFContactContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:a2];
}

- (void).cxx_destruct
{
}

- (void)setCachedContact:(id)a3
{
}

- (WFContact)cachedContact
{
  return self->_cachedContact;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 wfType];
  int v6 = [v5 conformsToClass:objc_opt_class()];

  if (v6)
  {
    uint64_t v7 = [v4 object];

    objc_super v8 = [(WFContentItem *)self cachingIdentifier];
    v9 = [v7 attributionSetWithCachingIdentifier:v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFContactContentItem;
    v9 = [(WFContentItem *)&v11 defaultSourceForRepresentation:v4];
  }
  return v9;
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  int v6 = (void *)MEMORY[0x263F852B8];
  uint64_t v7 = *MEMORY[0x263F1DD50];
  id v8 = a3;
  v9 = [v6 typeWithUTType:v7];
  LODWORD(v7) = [v8 conformsToType:v9];

  if (v7)
  {
    id v10 = [(WFContactContentItem *)self contact];
    objc_super v11 = [v10 vCardRepresentation];
  }
  else
  {
    objc_super v11 = 0;
  }
  return v11;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  if ((Class)objc_opt_class() == a3)
  {
    id v8 = [(WFContactContentItem *)self contact];
    v9 = [v8 imageData];

    if (v9)
    {
      id v10 = [MEMORY[0x263F85308] imageWithData:v9];
      objc_super v11 = +[WFObjectRepresentation object:v10];
      v33[0] = v11;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];

LABEL_19:
      goto LABEL_20;
    }
    uint64_t v7 = 0;
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      if ((Class)objc_opt_class() == a3)
      {
        v9 = [(WFContactContentItem *)self contact];
        uint64_t v18 = [(WFProcessedContacts *)v9 streetAddresses];
      }
      else if ((Class)objc_opt_class() == a3)
      {
        v9 = [(WFContactContentItem *)self contact];
        uint64_t v18 = [(WFProcessedContacts *)v9 phoneNumbers];
      }
      else
      {
        if ((Class)objc_opt_class() != a3)
        {
          if ((Class)objc_opt_class() == a3)
          {
            v9 = [(WFContactContentItem *)self contact];
            id v10 = [(WFProcessedContacts *)v9 URLs];
            uint64_t v19 = [(WFContactContentItem *)self objectRepresentationsFromLabeledValues:v10];
          }
          else
          {
            if ((Class)objc_opt_class() != a3)
            {
              if ((Class)objc_opt_class() == a3)
              {
                v26 = [(WFContentItem *)self objectForClass:objc_opt_class()];
                if (v26)
                {
                  v27 = +[WFObjectRepresentation object:v26];
                }
                else
                {
                  v28 = [(WFContactContentItem *)self contact];
                  v29 = [v28 INPersonRepresentation];
                  v27 = +[WFObjectRepresentation object:v29];
                }
                v30 = v27;
                uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
              }
              else
              {
                uint64_t v7 = 0;
              }
              goto LABEL_21;
            }
            v21 = [WFProcessedContacts alloc];
            v22 = [WFContactFieldEntry alloc];
            v23 = [(WFContactContentItem *)self contact];
            v24 = [(WFContactFieldEntry *)v22 initWithContact:v23];
            v32 = v24;
            v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
            v9 = [(WFProcessedContacts *)v21 initWithEntries:v25];

            id v10 = +[WFObjectRepresentation object:v9];
            v31 = v10;
            uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
          }
          goto LABEL_18;
        }
        v9 = [(WFContactContentItem *)self contact];
        uint64_t v18 = [(WFProcessedContacts *)v9 emailAddresses];
      }
      id v10 = (void *)v18;
      uint64_t v19 = [(WFContactContentItem *)self unnamedObjectRepresentationsFromLabeledValues:v18];
LABEL_18:
      uint64_t v7 = (void *)v19;
      goto LABEL_19;
    }
    id v12 = (void *)MEMORY[0x263EFF8C0];
    v9 = [(WFContactContentItem *)self contact];
    id v13 = [(WFProcessedContacts *)v9 birthday];
    v14 = objc_msgSend(v12, "arrayWithObjects:", v13, 0);
    id v15 = [(WFContactContentItem *)self contact];
    id v16 = [v15 dates];
    id v17 = [v14 arrayByAddingObjectsFromArray:v16];
    uint64_t v7 = [(WFContactContentItem *)self objectRepresentationsFromLabeledValues:v17];
  }
LABEL_20:

LABEL_21:
  return v7;
}

- (id)unnamedObjectRepresentationsFromLabeledValues:(id)a3
{
  return (id)objc_msgSend(a3, "if_map:", &__block_literal_global_439);
}

id __70__WFContactContentItem_unnamedObjectRepresentationsFromLabeledValues___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  id v3 = +[WFObjectRepresentation object:v2];

  return v3;
}

- (id)objectRepresentationsFromLabeledValues:(id)a3
{
  return (id)objc_msgSend(a3, "if_map:", &__block_literal_global_436);
}

id __63__WFContactContentItem_objectRepresentationsFromLabeledValues___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 value];
  id v4 = [v2 label];

  uint64_t v5 = +[WFObjectRepresentation object:v3 named:v4];

  return v5;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToClass:objc_opt_class()])
  {
    uint64_t v5 = [(WFContactContentItem *)self contact];
    unsigned __int8 v6 = [v5 hasImageData];
LABEL_16:
    unsigned __int8 v7 = v6;
LABEL_17:

    goto LABEL_18;
  }
  if ([v4 conformsToClass:objc_opt_class()])
  {
    uint64_t v5 = [(WFContactContentItem *)self contact];
    if ([v5 hasValueForPropertyID:17])
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      id v10 = [(WFContactContentItem *)self contact];
      unsigned __int8 v7 = [v10 hasValueForPropertyID:12];
    }
    goto LABEL_17;
  }
  if ([v4 conformsToClass:objc_opt_class()])
  {
    id v8 = [(WFContactContentItem *)self contact];
    uint64_t v5 = v8;
    uint64_t v9 = 22;
LABEL_15:
    unsigned __int8 v6 = [v8 hasValueForPropertyID:v9];
    goto LABEL_16;
  }
  if ([v4 conformsToClass:objc_opt_class()])
  {
    id v8 = [(WFContactContentItem *)self contact];
    uint64_t v5 = v8;
    uint64_t v9 = 5;
    goto LABEL_15;
  }
  if ([v4 conformsToClass:objc_opt_class()])
  {
    id v8 = [(WFContactContentItem *)self contact];
    uint64_t v5 = v8;
    uint64_t v9 = 3;
    goto LABEL_15;
  }
  if ([v4 conformsToClass:objc_opt_class()])
  {
    id v8 = [(WFContactContentItem *)self contact];
    uint64_t v5 = v8;
    uint64_t v9 = 4;
    goto LABEL_15;
  }
  if (([v4 conformsToClass:objc_opt_class()] & 1) != 0
    || ([v4 conformsToClass:objc_opt_class()] & 1) != 0)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFContactContentItem;
    unsigned __int8 v7 = [(WFGenericFileContentItem *)&v12 canGenerateRepresentationForType:v4];
  }
LABEL_18:

  return v7;
}

- (id)changeTransaction
{
  id v2 = [[WFContactContentItemChangeTransaction alloc] initWithContentItem:self];
  return v2;
}

- (WFContact)contact
{
  id v3 = [(WFContactContentItem *)self cachedContact];

  if (v3)
  {
    id v4 = [(WFContactContentItem *)self cachedContact];
  }
  else
  {
    uint64_t v5 = [(WFContentItem *)self objectForClass:objc_opt_class()];
    if (v5) {
      +[WFContact cnContactWithINPerson:v5];
    }
    else {
    id v4 = [(WFContentItem *)self objectForClass:objc_opt_class()];
    }
    [(WFContactContentItem *)self setCachedContact:v4];
  }
  return (WFContact *)v4;
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (id)stringConversionBehavior
{
  id v2 = WFLocalizedString(@"Full Name");
  id v3 = +[WFContentItemStringConversionBehavior coercingToStringWithDescription:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v132[22] = *MEMORY[0x263EF8340];
  v129 = objc_opt_new();
  v127 = WFLocalizedContentPropertyNameMarker(@"First Name");
  v126 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v127 class:objc_opt_class()];
  v125 = [v126 userInfo:&unk_26C741D28];
  v124 = [v125 setterBlock:&__block_literal_global_172_6139];
  v132[0] = v124;
  v123 = WFLocalizedContentPropertyNameMarker(@"Middle Name");
  v122 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v123 class:objc_opt_class()];
  v121 = [v122 userInfo:&unk_26C741D40];
  v120 = [v121 setterBlock:&__block_literal_global_183_6141];
  v132[1] = v120;
  v119 = WFLocalizedContentPropertyNameMarker(@"Last Name");
  v118 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v119 class:objc_opt_class()];
  v117 = [v118 userInfo:&unk_26C741D58];
  v116 = [v117 setterBlock:&__block_literal_global_191];
  v132[2] = v116;
  v115 = WFLocalizedContentPropertyNameMarker(@"Phone Numbers");
  v114 = +[WFContentPropertyBuilder block:&__block_literal_global_194 name:v115 class:objc_opt_class()];
  v113 = [v114 userInfo:&unk_26C741D70];
  v112 = [v113 multipleValues:1];
  v111 = [v112 setterBlock:&__block_literal_global_207];
  v110 = WFLocalizedContentPropertyNameMarker(@"Phone Number");
  v109 = [v111 singularItemName:v110];
  v132[3] = v109;
  v108 = WFLocalizedContentPropertyNameMarker(@"Email Addresses");
  v107 = +[WFContentPropertyBuilder block:&__block_literal_global_213_6144 name:v108 class:objc_opt_class()];
  v106 = [v107 userInfo:&unk_26C741D88];
  v105 = [v106 multipleValues:1];
  v104 = [v105 setterBlock:&__block_literal_global_222];
  v103 = WFLocalizedContentPropertyNameMarker(@"Email Address");
  v102 = [v104 singularItemName:v103];
  v132[4] = v102;
  v101 = WFLocalizedContentPropertyNameMarker(@"Street Addresses");
  v100 = +[WFContentPropertyBuilder block:&__block_literal_global_228 name:v101 class:objc_opt_class()];
  v99 = [v100 userInfo:&unk_26C741DA0];
  v98 = [v99 multipleValues:1];
  v97 = [v98 setterBlock:&__block_literal_global_237_6147];
  v96 = WFLocalizedContentPropertyNameMarker(@"Street Address");
  v95 = [v97 singularItemName:v96];
  v132[5] = v95;
  v94 = WFLocalizedContentPropertyNameMarker(@"URLs");
  v93 = +[WFContentPropertyBuilder block:&__block_literal_global_243 name:v94 class:objc_opt_class()];
  v92 = [v93 userInfo:&unk_26C741DB8];
  v91 = [v92 multipleValues:1];
  v90 = [v91 canLowercaseName:0];
  v89 = [v90 setterBlock:&__block_literal_global_252];
  v88 = WFLocalizedContentPropertyNameMarker(@"URL");
  v87 = [v89 singularItemName:v88];
  v132[6] = v87;
  v86 = WFLocalizedContentPropertyNameMarker(@"Birthday");
  v85 = +[WFContentPropertyBuilder keyPath:@"contact.birthday.value" name:v86 class:objc_opt_class()];
  v84 = [v85 userInfo:&unk_26C741DD0];
  v83 = [v84 timeUnits:8220];
  v82 = [v83 comparableUnits:24];
  v81 = [v82 setterBlock:&__block_literal_global_268];
  v132[7] = v81;
  v80 = WFLocalizedContentPropertyNameMarker(@"Contact Photo");
  v79 = +[WFContentPropertyBuilder block:&__block_literal_global_271 name:v80 class:objc_opt_class()];
  v78 = [v79 userInfo:&unk_26C741DE8];
  v77 = [v78 setterBlock:&__block_literal_global_281];
  v132[8] = v77;
  v75 = WFLocalizedContentPropertyNameMarker(@"Has Photo");
  v76 = [NSNumber numberWithBool:1];
  v74 = +[WFContentPropertyBuilder block:&__block_literal_global_284 name:v75 class:objc_opt_class()];
  v73 = WFLocalizedContentPropertyNameMarker(@"Has No Photo");
  v72 = [v74 negativeName:v73];
  v71 = WFLocalizedString(@"Contact");
  v70 = [v72 singularItemName:v71];
  v69 = [v70 gettable:0];
  v68 = [v69 userInfo:&unk_26C741E00];
  v132[9] = v68;
  v67 = WFLocalizedContentPropertyNameMarker(@"Prefix");
  v66 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v67 class:objc_opt_class()];
  v65 = [v66 userInfo:&unk_26C741E18];
  v64 = [v65 setterBlock:&__block_literal_global_307_6151];
  v132[10] = v64;
  v63 = WFLocalizedContentPropertyNameMarker(@"Suffix");
  v62 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v63 class:objc_opt_class()];
  v61 = [v62 userInfo:&unk_26C741E30];
  v60 = [v61 setterBlock:&__block_literal_global_315];
  v132[11] = v60;
  v59 = WFLocalizedContentPropertyNameMarker(@"Nickname");
  v58 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v59 class:objc_opt_class()];
  v57 = [v58 userInfo:&unk_26C741E48];
  v56 = [v57 setterBlock:&__block_literal_global_323];
  v132[12] = v56;
  v55 = WFLocalizedContentPropertyNameMarker(@"Phonetic First Name");
  v54 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v55 class:objc_opt_class()];
  v53 = [v54 userInfo:&unk_26C741E60];
  v52 = [v53 setterBlock:&__block_literal_global_331_6153];
  v132[13] = v52;
  v51 = WFLocalizedContentPropertyNameMarker(@"Phonetic Last Name");
  v50 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v51 class:objc_opt_class()];
  v49 = [v50 userInfo:&unk_26C741E78];
  v48 = [v49 setterBlock:&__block_literal_global_339];
  v132[14] = v48;
  v47 = WFLocalizedContentPropertyNameMarker(@"Phonetic Middle Name");
  v46 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v47 class:objc_opt_class()];
  v45 = [v46 userInfo:&unk_26C741E90];
  v44 = [v45 setterBlock:&__block_literal_global_347];
  v132[15] = v44;
  v43 = WFLocalizedContentPropertyNameMarker(@"Company");
  v42 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v43 class:objc_opt_class()];
  v41 = [v42 userInfo:&unk_26C741EA8];
  v40 = [v41 setterBlock:&__block_literal_global_355];
  v132[16] = v40;
  v39 = WFLocalizedContentPropertyNameMarker(@"Job Title");
  v38 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v39 class:objc_opt_class()];
  v37 = [v38 userInfo:&unk_26C741EC0];
  v36 = [v37 setterBlock:&__block_literal_global_363];
  v132[17] = v36;
  v35 = WFLocalizedContentPropertyNameMarker(@"Department");
  v34 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v35 class:objc_opt_class()];
  v33 = [v34 userInfo:&unk_26C741ED8];
  v32 = [v33 setterBlock:&__block_literal_global_371];
  v132[18] = v32;
  v31 = WFLocalizedContentPropertyNameMarker(@"Notes");
  v30 = +[WFContentPropertyBuilder block:&__block_literal_global_6134 name:v31 class:objc_opt_class()];
  v29 = [v30 userInfo:&unk_26C741EF0];
  v28 = [v29 sortable:0];
  v27 = [v28 appendable:1];
  v26 = [v27 setterBlock:&__block_literal_global_379];
  v132[19] = v26;
  v25 = WFLocalizedContentPropertyNameMarker(@"Creation Date");
  id v2 = +[WFContentPropertyBuilder keyPath:@"contact.creationDate" name:v25 class:objc_opt_class()];
  id v3 = [v2 userInfo:@"WFFileCreationDate"];
  id v4 = [v3 tense:1];
  uint64_t v5 = [v4 timeUnits:8444];
  v132[20] = v5;
  unsigned __int8 v6 = WFLocalizedContentPropertyNameMarker(@"Last Modified Date");
  unsigned __int8 v7 = +[WFContentPropertyBuilder keyPath:@"contact.modificationDate" name:v6 class:objc_opt_class()];
  id v8 = [v7 userInfo:@"WFFileModificationDate"];
  uint64_t v9 = [v8 tense:1];
  id v10 = [v9 timeUnits:8444];
  v132[21] = v10;
  objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:22];
  [v129 addObjectsFromArray:v11];

  v131[0] = MEMORY[0x263EF8330];
  v131[1] = 3221225472;
  v131[2] = __40__WFContactContentItem_propertyBuilders__block_invoke_2_393;
  v131[3] = &__block_descriptor_40_e43_v32__0__WFContactContentItem_8_16___v____24l;
  v131[4] = a1;
  objc_super v12 = WFLocalizedContentPropertyNameMarker(@"Group");
  id v13 = +[WFContentPropertyBuilder block:v131 name:v12 class:objc_opt_class()];
  v14 = [v13 multipleValues:1];
  v130[0] = MEMORY[0x263EF8330];
  v130[1] = 3221225472;
  v130[2] = __40__WFContactContentItem_propertyBuilders__block_invoke_4;
  v130[3] = &__block_descriptor_40_e14___NSArray_8__0l;
  v130[4] = a1;
  id v15 = [v14 possibleValuesGetter:v130];
  id v16 = [v15 userInfo:@"WFContactItemGroupProperty"];
  id v17 = [v16 gettable:0];
  uint64_t v18 = [v17 setterBlock:&__block_literal_global_407];
  [v129 insertObject:v18 atIndex:0];

  uint64_t v19 = WFLocalizedContentPropertyNameMarker(@"File Size");
  v20 = +[WFContentPropertyBuilder block:&__block_literal_global_410 name:v19 class:objc_opt_class()];
  v21 = [v20 userInfo:@"WFFileSizeProperty"];
  v22 = [v21 filterable:0];
  v23 = [v22 sortable:0];
  [v129 addObject:v23];

  return v129;
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_393(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a2;
  unsigned __int8 v7 = *(void **)(a1 + 32);
  id v8 = a4;
  uint64_t v9 = [v7 cachedContactGroups];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__WFContactContentItem_propertyBuilders__block_invoke_3;
  v12[3] = &unk_264286C80;
  id v13 = v6;
  id v10 = v6;
  objc_super v11 = objc_msgSend(v9, "if_compactMap:", v12);
  ((void (**)(void, void *))a4)[2](v8, v11);
}

id __40__WFContactContentItem_propertyBuilders__block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) cachedContactGroups];
  id v2 = [v1 valueForKey:@"name"];

  return v2;
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__WFContactContentItem_propertyBuilders__block_invoke_7;
  v7[3] = &unk_26428A288;
  id v8 = v5;
  id v6 = v5;
  [a2 getPreferredFileSize:v7];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [[WFFileSize alloc] initWithByteCount:a2];
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);
}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGroupChangeRequest:");
}

id __40__WFContactContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) contact];
  if ([v3 containsContact:v4])
  {
    id v5 = [v3 name];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_377(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v4 = a3;
  id v5 = [v12 mode];
  int v6 = [v5 isEqual:@"Append"];

  if (v6)
  {
    unsigned __int8 v7 = [v12 mutableContact];
    id v8 = [v7 note];
    uint64_t v9 = [(__CFString *)v8 stringByAppendingAsNewLine:v4];

    id v10 = [v12 mutableContact];
    [v10 setNote:v9];

    id v4 = v8;
  }
  else
  {
    if (v4) {
      objc_super v11 = v4;
    }
    else {
      objc_super v11 = &stru_26C71CE08;
    }
    unsigned __int8 v7 = [v12 mutableContact];
    [v7 setNote:v11];
  }
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_369(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setDepartmentName:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_361(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setJobTitle:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_353(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setOrganizationName:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_345(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setPhoneticMiddleName:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_337(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setPhoneticFamilyName:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_329(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setPhoneticGivenName:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_321(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setNickname:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_313(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setNameSuffix:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_305(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setNamePrefix:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_282(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = NSNumber;
  unsigned __int8 v7 = a4;
  id v9 = [a2 contact];
  id v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v9, "hasImageData"));
  ((void (**)(void, void *))a4)[2](v7, v8);
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v7 = [a3 PNGRepresentation];
  id v5 = [v4 mutableContact];
  [v5 setImageData:v7];

  id v6 = [v4 mutableContact];

  [v6 setThumbnailImageData:v7];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_269(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = (void *)MEMORY[0x263F85308];
  id v7 = a4;
  id v10 = [a2 contact];
  id v8 = [v10 imageData];
  id v9 = [v6 imageWithData:v8];
  ((void (**)(void, void *))a4)[2](v7, v9);
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_265(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 mutableContact];
  [v5 setBirthday:v4];
}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_250(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateURLs:");
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_241(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v9 = [a2 contact];
  id v7 = [v9 URLs];
  id v8 = [v7 valueForKey:@"value"];
  ((void (**)(void, void *))a4)[2](v6, v8);
}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_235(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateStreetAddresses:");
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_226(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v9 = [a2 contact];
  id v7 = [v9 streetAddresses];
  id v8 = [v7 valueForKey:@"value"];
  ((void (**)(void, void *))a4)[2](v6, v8);
}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_220(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateEmailAddresses:");
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2_211(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v9 = [a2 contact];
  id v7 = [v9 emailAddresses];
  id v8 = [v7 valueForKey:@"value"];
  ((void (**)(void, void *))a4)[2](v6, v8);
}

uint64_t __40__WFContactContentItem_propertyBuilders__block_invoke_204(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updatePhoneNumbers:");
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v9 = [a2 contact];
  id v7 = [v9 phoneNumbers];
  id v8 = [v7 valueForKey:@"value"];
  ((void (**)(void, void *))a4)[2](v6, v8);
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_189(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setFamilyName:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_181(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setMiddleName:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke_169(uint64_t a1, void *a2, __CFString *a3)
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &stru_26C71CE08;
  }
  id v5 = a3;
  id v6 = [a2 mutableContact];
  [v6 setGivenName:v4];
}

void __40__WFContactContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(void, void))
{
  id v7 = a4;
  id v8 = a3;
  id v11 = [a2 contact];
  uint64_t v9 = [v8 unsignedIntValue];

  id v10 = [v11 valueForPropertyID:v9];
  ((void (**)(void, void *))a4)[2](v7, v10);
}

+ (id)cachedContactGroups
{
  uint64_t v2 = (void *)cachedContactGroups_contactGroups;
  if (!cachedContactGroups_contactGroups)
  {
    uint64_t v3 = +[WFContactGroup allContactGroups];
    id v4 = (void *)cachedContactGroups_contactGroups;
    cachedContactGroups_contactGroups = v3;

    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__6237;
    id v13 = __Block_byref_object_dispose__6238;
    id v14 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__WFContactContentItem_cachedContactGroups__block_invoke;
    v8[3] = &unk_26428AC60;
    v8[4] = &v9;
    uint64_t v5 = +[WFContact addContactsChangeObserver:v8];
    id v6 = (void *)v10[5];
    v10[5] = v5;

    _Block_object_dispose(&v9, 8);
    uint64_t v2 = (void *)cachedContactGroups_contactGroups;
  }
  return v2;
}

uint64_t __43__WFContactContentItem_cachedContactGroups__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)cachedContactGroups_contactGroups;
  cachedContactGroups_contactGroups = 0;

  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return +[WFContact removeContactsChangeObserver:v3];
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v54[1] = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, void *, void))a3;
  id v8 = [(WFContactContentItem *)self contact];
  if (![v8 hasImageData]
    || ([v8 thumbnailImageData], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v24 = 0;
      goto LABEL_22;
    }
    if (v7)
    {
      id v12 = [v8 contact];
      v25 = [MEMORY[0x263F85258] currentDevice];
      [v25 screenScale];
      double v27 = v26;

      v28 = +[WFApplicationContext sharedContext];
      uint64_t v29 = [v28 shouldReverseLayoutDirection];

      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2050000000;
      v30 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
      uint64_t v51 = getCNAvatarImageRenderingScopeClass_softClass;
      if (!getCNAvatarImageRenderingScopeClass_softClass)
      {
        uint64_t v43 = MEMORY[0x263EF8330];
        uint64_t v44 = 3221225472;
        v45 = __getCNAvatarImageRenderingScopeClass_block_invoke;
        v46 = &unk_26428AC60;
        v47 = &v48;
        __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)&v43);
        v30 = (void *)v49[3];
      }
      id v31 = v30;
      _Block_object_dispose(&v48, 8);
      v23 = objc_msgSend(v31, "scopeWithPointSize:scale:rightToLeft:style:", v29, 0, width, height, v27);
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2050000000;
      v32 = (void *)getCNAvatarImageRendererSettingsClass_softClass;
      uint64_t v51 = getCNAvatarImageRendererSettingsClass_softClass;
      if (!getCNAvatarImageRendererSettingsClass_softClass)
      {
        uint64_t v43 = MEMORY[0x263EF8330];
        uint64_t v44 = 3221225472;
        v45 = __getCNAvatarImageRendererSettingsClass_block_invoke;
        v46 = &unk_26428AC60;
        v47 = &v48;
        __getCNAvatarImageRendererSettingsClass_block_invoke((uint64_t)&v43);
        v32 = (void *)v49[3];
      }
      id v33 = v32;
      _Block_object_dispose(&v48, 8);
      v34 = [v33 defaultSettings];
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2050000000;
      v35 = (void *)getCNAvatarImageRendererClass_softClass;
      uint64_t v51 = getCNAvatarImageRendererClass_softClass;
      if (!getCNAvatarImageRendererClass_softClass)
      {
        uint64_t v43 = MEMORY[0x263EF8330];
        uint64_t v44 = 3221225472;
        v45 = __getCNAvatarImageRendererClass_block_invoke;
        v46 = &unk_26428AC60;
        v47 = &v48;
        __getCNAvatarImageRendererClass_block_invoke((uint64_t)&v43);
        v35 = (void *)v49[3];
      }
      v36 = v35;
      _Block_object_dispose(&v48, 8);
      v37 = (void *)[[v36 alloc] initWithSettings:v34];
      v52 = v12;
      v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
      v39 = [v37 avatarImageForContacts:v38 scope:v23];

      BOOL v24 = v39 != 0;
      if (v39)
      {
        v40 = (void *)[objc_alloc(MEMORY[0x263F85308]) initWithPlatformImage:v39];
        v7[2](v7, v40, 0);
      }
      goto LABEL_19;
    }
LABEL_21:
    BOOL v24 = 1;
    goto LABEL_22;
  }
  if (!v7) {
    goto LABEL_21;
  }
  id v10 = (void *)MEMORY[0x263F85308];
  uint64_t v11 = [v8 thumbnailImageData];
  id v12 = [v10 imageWithData:v11];

  id v13 = [MEMORY[0x263F85258] currentDevice];
  [v13 screenScale];
  CGFloat v15 = v14;

  CGAffineTransformMakeScale(&v42, v15, v15);
  double a = v42.a;
  double b = v42.b;
  double c = v42.c;
  double d = v42.d;
  [v12 sizeInPixels];
  if (v20 > height * c + a * width)
  {
    [v12 sizeInPixels];
    if (v21 > height * d + b * width)
    {
      uint64_t v22 = objc_msgSend(v12, "resizedImageWithSizeInPoints:scale:", width, height, v15);

      id v12 = (void *)v22;
    }
  }
  uint64_t v53 = *MEMORY[0x263F85630];
  v54[0] = &unk_26C741FE0;
  v23 = [NSDictionary dictionaryWithObjects:v54 forKeys:&v53 count:1];
  ((void (**)(id, void *, void *))v7)[2](v7, v12, v23);
  BOOL v24 = 1;
LABEL_19:

LABEL_22:
  return v24;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(WFContactContentItem *)self contact];
    id v7 = [v6 organization];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  id v8 = [(WFContactContentItem *)self contact];
  uint64_t v9 = [v8 organization];
  BOOL v10 = v9 != 0;

  return v10;
}

@end