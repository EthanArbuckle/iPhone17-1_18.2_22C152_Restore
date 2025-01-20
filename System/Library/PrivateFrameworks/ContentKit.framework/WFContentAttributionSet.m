@interface WFContentAttributionSet
+ (BOOL)supportsSecureCoding;
+ (id)attributionSetByMergingAttributionSets:(id)a3;
+ (id)attributionSetWithAccountBasedAppDescriptor:(id)a3 accountIdentifier:(id)a4 disclosureLevel:(unint64_t)a5 originalItemIdentifier:(id)a6;
+ (id)attributionSetWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4;
+ (id)attributionSetWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4 originalItemIdentifier:(id)a5;
+ (id)attributionSetWithAttributions:(id)a3;
+ (id)attributionSetWithAttributions:(id)a3 shouldReduceAttributions:(BOOL)a4;
+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4;
+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5 originalItemIdentifier:(id)a6;
+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 originalItemIdentifier:(id)a5;
+ (id)combiningAttributions:(id)a3 withAttributions:(id)a4;
+ (id)compactAttributionsFrom:(id)a3 disclosureLevel:(unint64_t)a4;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (id)reducedAttributionsFrom:(id)a3;
+ (id)shortcutsAppAttributionSet;
+ (id)shortcutsAppAttributionSetWithDisclosureLevel:(unint64_t)a3;
- (BOOL)isAllowedToBeSentToDestinationWithManagedLevel:(unint64_t)a3;
- (BOOL)isEligibleToShareWithResultManagedLevel:(unint64_t *)a3;
- (BOOL)isEligibleToShareWithResultManagedLevel:(unint64_t *)a3 usingManagedConfigurationManager:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMoreRestrictiveThan:(id)a3;
- (BOOL)isSupersetOfAttributionSet:(id)a3;
- (NSArray)attributions;
- (NSDictionary)wfSerializedRepresentationWithPrivateItemIdentifiers;
- (WFContentAttributionSet)initWithAttribution:(id)a3;
- (WFContentAttributionSet)initWithAttributions:(id)a3;
- (WFContentAttributionSet)initWithCoder:(id)a3;
- (id)allOrigins;
- (id)attributionSetByFilteringNeighborsOfContentItem:(id)a3;
- (id)attributionSetByReplacingAccountWithAppOrigins;
- (id)wfSerializedRepresentation;
- (unint64_t)derivedDisclosureLevel;
- (unint64_t)derivedManagedLevel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContentAttributionSet

- (void).cxx_destruct
{
}

- (NSArray)attributions
{
  return self->_attributions;
}

- (NSDictionary)wfSerializedRepresentationWithPrivateItemIdentifiers
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"attributions";
  v2 = [(WFContentAttributionSet *)self attributions];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_55);
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

uint64_t __79__WFContentAttributionSet_wfSerializedRepresentationWithPrivateItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 wfSerializedRepresentationWithPrivateItemIdentifiers];
}

- (id)wfSerializedRepresentation
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"attributions";
  v2 = [(WFContentAttributionSet *)self attributions];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_53);
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

uint64_t __53__WFContentAttributionSet_wfSerializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 wfSerializedRepresentation];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentAttributionSet *)self attributions];
  [v4 encodeObject:v5 forKey:@"attributions"];
}

- (WFContentAttributionSet)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:3];
  v7 = objc_msgSend(v4, "setWithArray:", v6, v15, v16);
  v8 = +[WFContentLocation allContentLocationClasses];
  v9 = [v7 setByAddingObjectsFromSet:v8];
  v10 = +[WFDisclosureWarning allDisclosureWarningClasses];
  v11 = [v9 setByAddingObjectsFromSet:v10];

  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"attributions"];

  if (v12)
  {
    self = [(WFContentAttributionSet *)self initWithAttributions:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContentAttributionSet *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(WFContentAttributionSet *)self attributions];
      v7 = [(WFContentAttributionSet *)v5 attributions];

      char v8 = [v6 isEqualToArray:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)attributionSetByFilteringNeighborsOfContentItem:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentAttributionSet *)self attributions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__WFContentAttributionSet_attributionSetByFilteringNeighborsOfContentItem___block_invoke;
  v10[3] = &unk_264285848;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "if_map:", v10);
  char v8 = +[WFContentAttributionSet attributionSetWithAttributions:v7];

  return v8;
}

id __75__WFContentAttributionSet_attributionSetByFilteringNeighborsOfContentItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 privateItemIdentifiers];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) cachingIdentifier];
    int v6 = [v4 containsObject:v5];

    if (v6)
    {
      v7 = (void *)MEMORY[0x263EFF9D8];
      char v8 = [*(id *)(a1 + 32) cachingIdentifier];
      v9 = [v7 orderedSetWithObject:v8];
      [v3 setPrivateItemIdentifiers:v9];
    }
  }

  return v3;
}

- (id)attributionSetByReplacingAccountWithAppOrigins
{
  v2 = [(WFContentAttributionSet *)self attributions];
  id v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_42);
  id v4 = +[WFContentAttributionSet attributionSetWithAttributions:v3 shouldReduceAttributions:0];

  return v4;
}

uint64_t __73__WFContentAttributionSet_attributionSetByReplacingAccountWithAppOrigins__block_invoke(uint64_t a1, void *a2)
{
  return [a2 attributionByReplacingAccountWithAppOrigin];
}

- (WFContentAttributionSet)initWithAttributions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentAttributionSet;
  id v5 = [(WFContentAttributionSet *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attributions = v5->_attributions;
    v5->_attributions = (NSArray *)v6;

    char v8 = v5;
  }

  return v5;
}

- (WFContentAttributionSet)initWithAttribution:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFContentAttributionSet.m", 163, @"Invalid parameter not satisfying: %@", @"contentAttribution" object file lineNumber description];
  }
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v7 = [(WFContentAttributionSet *)self initWithAttributions:v6];

  return v7;
}

- (id)allOrigins
{
  v2 = [(WFContentAttributionSet *)self attributions];
  id v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_14);

  return v3;
}

uint64_t __37__WFContentAttributionSet_allOrigins__block_invoke(uint64_t a1, void *a2)
{
  return [a2 origin];
}

- (unint64_t)derivedManagedLevel
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(WFContentAttributionSet *)self attributions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        char v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) origin];
        v5 |= [v8 managedLevel];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)derivedDisclosureLevel
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(WFContentAttributionSet *)self attributions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) disclosureLevel];
        if (v5 <= v8) {
          unint64_t v5 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEligibleToShareWithResultManagedLevel:(unint64_t *)a3 usingManagedConfigurationManager:(id)a4
{
  id v6 = a4;
  if ([v6 isOpenInRestrictionInEffect])
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v7 = [(WFContentAttributionSet *)self attributions];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __100__WFContentAttributionSet_isEligibleToShareWithResultManagedLevel_usingManagedConfigurationManager___block_invoke;
    v11[3] = &unk_264285798;
    v11[4] = &v12;
    v11[5] = &v16;
    [v7 enumerateObjectsUsingBlock:v11];

    if (*((unsigned char *)v17 + 24))
    {
      if (*((unsigned char *)v13 + 24))
      {
        if ([v6 mayOpenFromUnmanagedToManaged]
          && ([v6 mayOpenFromManagedToUnmanaged] & 1) == 0)
        {
          LOBYTE(v9) = 1;
          unint64_t v8 = 2;
          if (!a3) {
            goto LABEL_16;
          }
        }
        else if ([v6 mayOpenFromUnmanagedToManaged])
        {
          unint64_t v8 = 0;
          LOBYTE(v9) = 0;
          if (!a3) {
            goto LABEL_16;
          }
        }
        else
        {
          unsigned int v9 = [v6 mayOpenFromManagedToUnmanaged];
          unint64_t v8 = v9;
          if (!a3) {
            goto LABEL_16;
          }
        }
        goto LABEL_15;
      }
      unint64_t v8 = 1;
    }
    else
    {
      unint64_t v8 = 2 * (*((unsigned char *)v13 + 24) != 0);
    }
    LOBYTE(v9) = 1;
    if (!a3)
    {
LABEL_16:
      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(&v16, 8);
      goto LABEL_17;
    }
LABEL_15:
    *a3 = v8;
    goto LABEL_16;
  }
  if (a3) {
    *a3 = 0;
  }
  LOBYTE(v9) = 1;
LABEL_17:

  return v9;
}

void __100__WFContentAttributionSet_isEligibleToShareWithResultManagedLevel_usingManagedConfigurationManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v6 = [v12 origin];
  uint64_t v7 = [v6 managedLevel];

  if (v7 == 2)
  {
    uint64_t v8 = a1 + 32;
  }
  else
  {
    unsigned int v9 = [v12 origin];
    uint64_t v10 = [v9 managedLevel];

    if (v10 != 1) {
      goto LABEL_6;
    }
    uint64_t v8 = a1 + 40;
  }
  *(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24) = 1;
LABEL_6:
  char v11 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v11) {
    char v11 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  *a4 = v11;
}

- (BOOL)isEligibleToShareWithResultManagedLevel:(unint64_t *)a3
{
  unint64_t v5 = +[WFManagedConfigurationProfile defaultProfile];
  LOBYTE(a3) = [(WFContentAttributionSet *)self isEligibleToShareWithResultManagedLevel:a3 usingManagedConfigurationManager:v5];

  return (char)a3;
}

- (BOOL)isMoreRestrictiveThan:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WFContentAttributionSet *)self attributions];
  id v6 = objc_msgSend(v5, "if_map:", &__block_literal_global_11);

  uint64_t v7 = NSDictionary;
  uint64_t v8 = [(WFContentAttributionSet *)self attributions];
  unsigned int v9 = [v7 dictionaryWithObjects:v8 forKeys:v6];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = [v4 attributions];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__WFContentAttributionSet_isMoreRestrictiveThan___block_invoke_2;
  v13[3] = &unk_264285770;
  id v11 = v9;
  id v14 = v11;
  char v15 = &v16;
  [v10 enumerateObjectsUsingBlock:v13];

  LOBYTE(v10) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v10;
}

void __49__WFContentAttributionSet_isMoreRestrictiveThan___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v14 = v6;
  uint64_t v8 = [v6 origin];
  unsigned int v9 = [v7 objectForKey:v8];

  if (v9)
  {
    unint64_t v10 = [v9 disclosureLevel];
    if (v10 >= [v14 disclosureLevel])
    {
      id v11 = [v9 origin];
      uint64_t v12 = [v11 managedLevel];
      long long v13 = [v14 origin];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12 == [v13 managedLevel];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v14 disclosureLevel] == 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

uint64_t __49__WFContentAttributionSet_isMoreRestrictiveThan___block_invoke(uint64_t a1, void *a2)
{
  return [a2 origin];
}

- (BOOL)isSupersetOfAttributionSet:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WFContentAttributionSet *)self attributions];
  id v6 = objc_msgSend(v5, "if_map:", &__block_literal_global_56);

  uint64_t v7 = NSDictionary;
  uint64_t v8 = [(WFContentAttributionSet *)self attributions];
  unsigned int v9 = [v7 dictionaryWithObjects:v8 forKeys:v6];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  unint64_t v10 = [v4 attributions];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__WFContentAttributionSet_isSupersetOfAttributionSet___block_invoke_2;
  v13[3] = &unk_264285770;
  id v11 = v9;
  id v14 = v11;
  char v15 = &v16;
  [v10 enumerateObjectsUsingBlock:v13];

  LOBYTE(v10) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v10;
}

void __54__WFContentAttributionSet_isSupersetOfAttributionSet___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v14 = v6;
  uint64_t v8 = [v6 origin];
  unsigned int v9 = [v7 objectForKey:v8];

  if (v9 && (unint64_t v10 = [v9 disclosureLevel], v10 >= objc_msgSend(v14, "disclosureLevel")))
  {
    id v11 = [v9 origin];
    uint64_t v12 = [v11 managedLevel];
    long long v13 = [v14 origin];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12 == [v13 managedLevel];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

uint64_t __54__WFContentAttributionSet_isSupersetOfAttributionSet___block_invoke(uint64_t a1, void *a2)
{
  return [a2 origin];
}

- (BOOL)isAllowedToBeSentToDestinationWithManagedLevel:(unint64_t)a3
{
  unint64_t v5 = +[WFManagedConfigurationProfile defaultProfile];
  id v6 = v5;
  if (a3)
  {
    BOOL v7 = 1;
    if ([v5 isOpenInRestrictionInEffect])
    {
      uint64_t v14 = 0;
      char v15 = &v14;
      uint64_t v16 = 0x2020000000;
      char v17 = 1;
      uint64_t v8 = [(WFContentAttributionSet *)self attributions];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      void v10[2] = __74__WFContentAttributionSet_isAllowedToBeSentToDestinationWithManagedLevel___block_invoke;
      v10[3] = &unk_264285728;
      uint64_t v12 = &v14;
      id v11 = v6;
      unint64_t v13 = a3;
      [v8 enumerateObjectsUsingBlock:v10];

      BOOL v7 = *((unsigned char *)v15 + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

void __74__WFContentAttributionSet_isAllowedToBeSentToDestinationWithManagedLevel___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v6 = [v11 origin];
  uint64_t v7 = [v6 managedLevel];

  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v8 = [v11 origin];
  uint64_t v9 = [v8 managedLevel];

  if (v9 == 3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_10;
  }
  if (([*(id *)(a1 + 32) mayOpenFromManagedToUnmanaged] & 1) == 0 && *(void *)(a1 + 48) == 1
    || ([*(id *)(a1 + 32) mayOpenFromUnmanagedToManaged] & 1) == 0 && *(void *)(a1 + 48) == 2)
  {
    unint64_t v10 = [v11 origin];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 managedLevel] == *(void *)(a1 + 48);
  }
  else
  {
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_10:
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"attributions"];

  id v6 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_58);

  uint64_t v7 = [a1 attributionSetWithAttributions:v6];

  return v7;
}

id __64__WFContentAttributionSet_objectWithWFSerializedRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContentAttribution objectWithWFSerializedRepresentation:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)reducedAttributionsFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    unint64_t v5 = [MEMORY[0x263EFF9B0] orderedSet];
    id v6 = [MEMORY[0x263EFF9B0] orderedSet];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v12, "disclosureLevel", (void)v18) == 1) {
            unint64_t v13 = v6;
          }
          else {
            unint64_t v13 = v5;
          }
          [v13 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [a1 compactAttributionsFrom:v5 disclosureLevel:0];
    char v15 = [a1 compactAttributionsFrom:v6 disclosureLevel:1];
    uint64_t v16 = [v14 arrayByAddingObjectsFromArray:v15];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263EFFA68];
  }

  return v16;
}

+ (id)compactAttributionsFrom:(id)a3 disclosureLevel:(unint64_t)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([v7 count])
  {
    id v39 = a1;
    SEL v40 = a2;
    unint64_t v41 = a4;
    v43 = objc_opt_new();
    uint64_t v8 = [MEMORY[0x263EFF9B0] orderedSet];
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v42 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v10);
          }
          char v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "disclosureWarnings", v39, v40);
          uint64_t v17 = [v16 count];

          if (v17)
          {
            long long v18 = [v15 disclosureWarnings];
            [v8 unionOrderedSet:v18];
          }
          long long v19 = [v15 privateItemIdentifiers];

          if (v19)
          {
            long long v20 = [v15 origin];
            long long v21 = [v9 objectForKey:v20];

            v22 = [v15 privateItemIdentifiers];
            uint64_t v23 = v22;
            if (v21)
            {
              [v21 unionOrderedSet:v22];
            }
            else
            {
              v24 = (void *)[v22 mutableCopy];
              v25 = [v15 origin];
              [v9 setObject:v24 forKey:v25];
            }
          }
          else
          {
            [v43 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v12);
    }

    if (VCIsInternalBuild())
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v26 = v43;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v49 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * j), "origin", v39, v40);
            v32 = [v9 objectForKey:v31];

            if (v32)
            {
              v33 = [MEMORY[0x263F08690] currentHandler];
              [v33 handleFailureInMethod:v40 object:v39 file:@"WFContentAttributionSet.m" lineNumber:274 description:@"Attempting to compact attributions with mix of nonnull and nil privateItemIdentifiers is not supported"];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v28);
      }
    }
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __67__WFContentAttributionSet_compactAttributionsFrom_disclosureLevel___block_invoke;
    v44[3] = &unk_264285800;
    unint64_t v47 = v41;
    id v45 = v8;
    id v34 = v43;
    id v46 = v34;
    id v35 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v44];
    v36 = v46;
    id v37 = v34;

    id v7 = v42;
  }
  else
  {
    id v37 = (id)MEMORY[0x263EFFA68];
  }

  return v37;
}

void __67__WFContentAttributionSet_compactAttributionsFrom_disclosureLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v6 array];
  +[WFContentAttribution attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:](WFContentAttribution, "attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", v5, v8, v9, v7, [v7 count]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v10];
}

+ (id)combiningAttributions:(id)a3 withAttributions:(id)a4
{
  uint64_t v5 = [a3 arrayByAddingObjectsFromArray:a4];
  id v6 = [a1 reducedAttributionsFrom:v5];

  return v6;
}

+ (id)shortcutsAppAttributionSetWithDisclosureLevel:(unint64_t)a3
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v5 = +[WFContentAttribution shortcutsAppAttributionWithDisclosureLevel:a3];
  id v6 = (void *)[v4 initWithAttribution:v5];

  return v6;
}

+ (id)shortcutsAppAttributionSet
{
  id v2 = objc_alloc((Class)a1);
  uint64_t v3 = +[WFContentAttribution shortcutsAppAttribution];
  id v4 = (void *)[v2 initWithAttribution:v3];

  return v4;
}

+ (id)attributionSetWithAttributions:(id)a3 shouldReduceAttributions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    id v7 = [a1 reducedAttributionsFrom:v6];
  }
  id v8 = (void *)[objc_alloc((Class)a1) initWithAttributions:v7];

  return v8;
}

+ (id)attributionSetWithAttributions:(id)a3
{
  return (id)[a1 attributionSetWithAttributions:a3 shouldReduceAttributions:1];
}

+ (id)attributionSetByMergingAttributionSets:(id)a3
{
  BOOL v4 = objc_msgSend(a3, "if_flatMap:", &__block_literal_global_31);
  uint64_t v5 = [a1 reducedAttributionsFrom:v4];

  id v6 = (void *)[objc_alloc((Class)a1) initWithAttributions:v5];
  return v6;
}

uint64_t __66__WFContentAttributionSet_attributionSetByMergingAttributionSets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attributions];
}

+ (id)attributionSetWithAccountBasedAppDescriptor:(id)a3 accountIdentifier:(id)a4 disclosureLevel:(unint64_t)a5 originalItemIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  uint64_t v14 = +[WFAccountContentLocation locationWithAccountIdentifier:v11 appDescriptor:v12];

  char v15 = +[WFContentAttribution attributionWithDisclosureLevel:a5 origin:v14 originalItemIdentifier:v10];

  uint64_t v16 = (void *)[v13 initWithAttribution:v15];
  return v16;
}

+ (id)attributionSetWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4 originalItemIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  id v11 = +[WFAppContentLocation locationWithAppDescriptor:v9];

  id v12 = +[WFContentAttribution attributionWithDisclosureLevel:a4 origin:v11 originalItemIdentifier:v8];

  id v13 = (void *)[v10 initWithAttribution:v12];
  return v13;
}

+ (id)attributionSetWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4
{
  return (id)[a1 attributionSetWithAppDescriptor:a3 disclosureLevel:a4 originalItemIdentifier:0];
}

+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5 originalItemIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  uint64_t v14 = +[WFContentAttribution attributionWithDisclosureLevel:a4 origin:v12 disclosureWarnings:v11 originalItemIdentifier:v10];

  char v15 = (void *)[v13 initWithAttribution:v14];
  return v15;
}

+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 originalItemIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  id v11 = +[WFContentAttribution attributionWithDisclosureLevel:a4 origin:v9 originalItemIdentifier:v8];

  id v12 = (void *)[v10 initWithAttribution:v11];
  return v12;
}

+ (id)attributionSetWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  id v8 = +[WFContentAttribution attributionWithDisclosureLevel:a4 origin:v6 originalItemIdentifier:0];

  id v9 = (void *)[v7 initWithAttribution:v8];
  return v9;
}

@end