@interface HFActionNaturalLanguageExecution
+ (id)_accessoryRepresentingIDsInSet:(id)a3;
+ (id)executionWithActions:(id)a3 options:(id)a4;
- (BOOL)named;
- (HFAccessoryRepresentable)singularInvolvedObject;
- (HFActionNaturalLanguageExecution)initWithOptions:(id)a3;
- (HFActionNaturalLanguageOptions)options;
- (NSMutableSet)indescribableActionTypes;
- (NSSet)actions;
- (NSSet)allInvolvedObjects;
- (NSSet)involvedServices;
- (id)stringKeysForMatterActions:(id)a3;
- (unint64_t)accessoryCount;
- (void)setActions:(id)a3;
- (void)setAllInvolvedObjects:(id)a3;
- (void)setInvolvedServices:(id)a3;
- (void)setNamed:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)updateInvolvedObjects;
@end

@implementation HFActionNaturalLanguageExecution

- (id)stringKeysForMatterActions:(id)a3
{
  sub_20BA208F4(0, (unint64_t *)&qword_2676AE868);
  sub_20BA378FC(&qword_2676AE870, (unint64_t *)&qword_2676AE868);
  uint64_t v4 = sub_20BCE7940();
  v5 = self;
  HFActionNaturalLanguageExecution.stringKeys(for:)(v4);

  swift_bridgeObjectRelease();
  sub_20BA208F4(0, (unint64_t *)&unk_2676AE1E0);
  sub_20BA378FC(&qword_2676AE878, (unint64_t *)&unk_2676AE1E0);
  v6 = (void *)sub_20BCE7920();
  swift_bridgeObjectRelease();
  return v6;
}

- (HFActionNaturalLanguageExecution)initWithOptions:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFActionNaturalLanguageExecution;
  v6 = [(HFActionNaturalLanguageExecution *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v7->_named = 0;
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    indescribableActionTypes = v7->_indescribableActionTypes;
    v7->_indescribableActionTypes = (NSMutableSet *)v8;
  }
  return v7;
}

- (HFAccessoryRepresentable)singularInvolvedObject
{
  if ([(HFActionNaturalLanguageExecution *)self accessoryCount] == 1)
  {
    v3 = [(HFActionNaturalLanguageExecution *)self allInvolvedObjects];
    uint64_t v4 = [v3 anyObject];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (HFAccessoryRepresentable *)v4;
}

- (unint64_t)accessoryCount
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(HFActionNaturalLanguageExecution *)self options];
  uint64_t v4 = [v3 accessoryCountType];

  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [(HFActionNaturalLanguageExecution *)self allInvolvedObjects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          objc_super v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "hf_containedServices");
          v12 = objc_msgSend(v11, "na_filter:", &__block_literal_global_335_0);

          if ([v12 count]) {
            uint64_t v13 = [v12 count];
          }
          else {
            uint64_t v13 = 1;
          }
          v8 += v13;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v8 = 0;
    }

    return v8;
  }
  else
  {
    v14 = [(HFActionNaturalLanguageExecution *)self allInvolvedObjects];
    unint64_t v15 = [v14 count];

    return v15;
  }
}

uint64_t __50__HFActionNaturalLanguageExecution_accessoryCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisible");
}

+ (id)executionWithActions:(id)a3 options:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:a3];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__HFActionNaturalLanguageExecution_executionWithActions_options___block_invoke;
  v18[3] = &unk_264090490;
  id v19 = v6;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "na_filter:", v18);

  v10 = [[HFActionNaturalLanguageExecution alloc] initWithOptions:v8];
  [(HFActionNaturalLanguageExecution *)v10 setActions:v9];
  objc_super v11 = objc_msgSend(v9, "na_map:", &__block_literal_global_338);
  [(HFActionNaturalLanguageExecution *)v10 setInvolvedServices:v11];

  [(HFActionNaturalLanguageExecution *)v10 updateInvolvedObjects];
  v12 = [(HFActionNaturalLanguageExecution *)v10 allInvolvedObjects];
  uint64_t v13 = [a1 _accessoryRepresentingIDsInSet:v12];

  v14 = [v8 objectsInContext];
  unint64_t v15 = [a1 _accessoryRepresentingIDsInSet:v14];

  v16 = objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v15);
  -[HFActionNaturalLanguageExecution setNamed:](v10, "setNamed:", [v16 count] != 0);

  return v10;
}

uint64_t __65__HFActionNaturalLanguageExecution_executionWithActions_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    objc_opt_class();
    id v7 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      if ([*(id *)(a1 + 32) ignoreOptionalCharacteristics])
      {
        objc_super v11 = [v10 characteristic];
        v12 = [v11 service];
        uint64_t v13 = [v12 serviceType];

        v14 = objc_msgSend(MEMORY[0x263F0E708], "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v13);
        unint64_t v15 = [v10 characteristic];
        v16 = [v15 characteristicType];
        uint64_t v8 = [v14 containsObject:v16];

        goto LABEL_14;
      }
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v8 = 1;
    goto LABEL_14;
  }
  id v7 = [v6 mediaProfiles];
  uint64_t v8 = [v7 count] != 0;
LABEL_14:

  return v8;
}

id __65__HFActionNaturalLanguageExecution_executionWithActions_options___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_affectedCharacteristic");
  id v3 = [v2 service];

  return v3;
}

+ (id)_accessoryRepresentingIDsInSet:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_340);
}

id __67__HFActionNaturalLanguageExecution__accessoryRepresentingIDsInSet___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_homeKitObject");
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

- (void)updateInvolvedObjects
{
  id v3 = [(HFActionNaturalLanguageExecution *)self actions];
  id v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_343_0);

  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v5 = [MEMORY[0x263EFF9C0] set];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke_4;
  v11[3] = &unk_264097430;
  v11[4] = self;
  uint64_t v13 = &v14;
  id v6 = v5;
  id v12 = v6;
  objc_msgSend(v4, "na_map:", v11);
  id v7 = (NSSet *)objc_claimAutoreleasedReturnValue();

  if (!*((unsigned char *)v15 + 24))
  {
    uint64_t v8 = [(NSSet *)v7 setByAddingObjectsFromSet:v6];

    id v7 = (NSSet *)v8;
  }
  allInvolvedObjects = self->_allInvolvedObjects;
  self->_allInvolvedObjects = v7;
  id v10 = v7;

  _Block_object_dispose(&v14, 8);
}

id __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "hf_affectedCharacteristic");

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = objc_msgSend(v2, "hf_affectedCharacteristic");
    id v6 = [v5 service];
    uint64_t v7 = [v4 setWithObject:v6];
LABEL_5:
    uint64_t v9 = (void *)v7;

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    id v5 = [v2 commands];
    id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_346);
    uint64_t v7 = [v8 setWithArray:v6];
    goto LABEL_5;
  }
  id v5 = objc_msgSend(v2, "hf_affectedAccessoryProfiles");
  uint64_t v9 = objc_msgSend(v5, "na_map:", &__block_literal_global_349_0);
LABEL_7:

  return v9;
}

uint64_t __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

id __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C0FB658]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = [v2 accessory];
  }
  id v6 = v5;

  return v6;
}

id __57__HFActionNaturalLanguageExecution_updateInvolvedObjects__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) options];
  id v5 = [v4 objectsInContext];
  int v6 = [v5 containsObject:v3];

  if (v6)
  {
    id v7 = v3;
    goto LABEL_25;
  }
  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (!v9)
  {
LABEL_11:
    uint64_t v14 = +[HFAccessoryLikeObject accessoryLikeObjectsForAccessoryRepresentable:v7];
    if ([v14 count] == 1)
    {
      unint64_t v15 = [v14 anyObject];
    }
    else
    {
      unint64_t v15 = 0;
    }
    if (v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v7;
    }
    id v17 = v16;
    long long v18 = [*(id *)(a1 + 32) options];
    if ([v18 useMediaContainersNotInContext])
    {
    }
    else
    {
      int v19 = [v15 conformsToProtocol:&unk_26C155B48];

      if (v19)
      {
        long long v20 = [*(id *)(a1 + 32) options];
        v21 = [v20 objectsInContext];
        int v22 = [v21 containsObject:v17];

        if (!v22)
        {
          objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v17);
          id v7 = 0;
          goto LABEL_23;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    id v7 = v17;
LABEL_23:

    goto LABEL_24;
  }
  id v10 = [*(id *)(a1 + 32) involvedServices];
  if ([v10 count] != 1)
  {

    goto LABEL_11;
  }
  objc_super v11 = [v9 accessory];
  int v12 = objc_msgSend(v11, "hf_showAsAccessoryTile");

  if (!v12) {
    goto LABEL_11;
  }
  id v13 = v9;
LABEL_24:

LABEL_25:
  return v7;
}

- (HFActionNaturalLanguageOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSSet)allInvolvedObjects
{
  return self->_allInvolvedObjects;
}

- (void)setAllInvolvedObjects:(id)a3
{
}

- (NSSet)involvedServices
{
  return self->_involvedServices;
}

- (void)setInvolvedServices:(id)a3
{
}

- (BOOL)named
{
  return self->_named;
}

- (void)setNamed:(BOOL)a3
{
  self->_named = a3;
}

- (NSMutableSet)indescribableActionTypes
{
  return self->_indescribableActionTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indescribableActionTypes, 0);
  objc_storeStrong((id *)&self->_involvedServices, 0);
  objc_storeStrong((id *)&self->_allInvolvedObjects, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end