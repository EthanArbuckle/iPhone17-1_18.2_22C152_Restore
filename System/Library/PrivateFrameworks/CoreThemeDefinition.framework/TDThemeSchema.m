@interface TDThemeSchema
+ (BOOL)loadThemeConstantsForEntity:(id)a3 inContext:(id)a4;
- (BOOL)_renditionKey:(const _renditionkeytoken *)a3 isEqualToKeyIgnoringLook:(const _renditionkeytoken *)a4;
- (TDThemeSchema)initWithThemeDocument:(id)a3;
- (void)_addSchemaPartDefinitionsForStandardElement:(id *)a3 withElement:(id)a4;
- (void)_loadConstantForEntity:(id)a3 withDescriptor:(const _themeconstant *)a4;
- (void)_sanityCheckColorNamesAndUpdateIfNecessary;
- (void)_sanityCheckEffectRenditionsAndUpdateIfNecessary;
- (void)_sanityCheckMetafontSizeSelectorsAndUpdateIfNecessary;
- (void)_sanityCheckMicaRenditionsAndUpdateIfNecessary;
- (void)_sanityCheckObjectsWithEntityName:(id)a3 globalDescriptor:(void *)a4 matchIdentifierOnly:(BOOL)a5;
- (void)_sanityCheckSchemaAssets;
- (void)_sanityCheckSchemaCategoriesAndUpdateIfNecessary;
- (void)_sanityCheckSchemaDefinitionsAndUpdateIfNecessary;
- (void)_sanityCheckSchemaPartDefinitionsForStandardElement:(id *)a3 withElement:(id)a4;
- (void)dealloc;
- (void)loadBasicThemePart;
- (void)loadColorNames;
- (void)loadColorStatuses;
- (void)loadEffectConstants;
- (void)loadGlyphSizeConstants;
- (void)loadGlyphWeightConstants;
- (void)loadIterationTypes;
- (void)loadMetafontSelectors;
- (void)loadMetafontSizes;
- (void)loadRenditionSubtypes;
- (void)loadRenditionTypes;
- (void)loadSchemaCategories;
- (void)loadSchemaDefinitions;
- (void)loadStandardEffectDefinitions;
- (void)loadTemplateRenderingModeConstants;
- (void)loadTexturePixelFormats;
- (void)loadThemeCompressionTypes;
- (void)loadThemeDeploymentTargets;
- (void)loadThemeDirections;
- (void)loadThemeDisplayGamuts;
- (void)loadThemeDrawingLayers;
- (void)loadThemeElements;
- (void)loadThemeGraphicsFeatureSetClasses;
- (void)loadThemeIdioms;
- (void)loadThemeParts;
- (void)loadThemePresentationStates;
- (void)loadThemeSizes;
- (void)loadThemeStates;
- (void)loadThemeTextureFaces;
- (void)loadThemeTextureInterpretations;
- (void)loadThemeUISizeClasses;
- (void)loadThemeValues;
- (void)loadVectorGlyphRenderingModeConstants;
- (void)resetThemeConstants;
- (void)sanityCheckAndUpdateDocumentIfNecessary;
@end

@implementation TDThemeSchema

- (TDThemeSchema)initWithThemeDocument:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TDThemeSchema;
  v4 = [(TDThemeSchema *)&v6 init];
  if (v4) {
    v4->_doc = (CoreThemeDocument *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TDThemeSchema;
  [(TDThemeSchema *)&v3 dealloc];
}

- (void)_sanityCheckObjectsWithEntityName:(id)a3 globalDescriptor:(void *)a4 matchIdentifierOnly:(BOOL)a5
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  v93 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"identifier" ascending:1];
  id v101 = a3;
  obuint64_t j = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", a3, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:"));
  v94 = a4;
  id v7 = +[CoreThemeConstantEnumerator enumeratorForGlobalListAtAddress:a4];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = [v7 nextConstantHelper];
  id v96 = v8;
  if (!v9) {
    goto LABEL_26;
  }
  v10 = (void *)v9;
  id v95 = v7;
  do
  {
    if (!objc_msgSend((id)objc_msgSend(v10, "displayName"), "length")) {
      break;
    }
    if (objc_msgSend((id)objc_msgSend(v10, "label"), "hasPrefix:", @"obsolete")) {
      goto LABEL_25;
    }
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    uint64_t v104 = [obj countByEnumeratingWithState:&v114 objects:v120 count:16];
    if (!v104) {
      goto LABEL_24;
    }
    uint64_t v11 = 0;
    uint64_t v102 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v104; ++i)
      {
        if (*(void *)v115 != v102) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend((id)objc_msgSend(v13, "valueForKey:", @"identifier"), "integerValue");
        v15 = (void *)[v13 valueForKey:@"constantName"];
        v16 = (void *)[v13 valueForKey:@"displayName"];
        uint64_t v17 = [v10 identifier];
        uint64_t v18 = [v10 label];
        uint64_t v19 = [v10 displayName];
        if (v14 != v17)
        {
          if (a5
            || ([v15 isEqualToString:v18] & 1) == 0
            && ![v16 isEqualToString:v19])
          {
            continue;
          }
          uint64_t v91 = v17;
          TDSchemaLog(&cfstr_UpdatingIdenti.isa, v20, v21, v22, v23, v24, v25, v26, v18);
          objc_msgSend(v13, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", v17), @"identifier");
        }
        if (([v15 isEqualToString:v18] & 1) == 0)
        {
          uint64_t v91 = (uint64_t)v15;
          uint64_t v92 = v18;
          TDSchemaLog(&cfstr_UpdatingConsta.isa, v27, v28, v29, v30, v31, v32, v33, v18);
          [v13 setValue:v18 forKey:@"constantName"];
        }
        ++v11;
        if (([v16 isEqualToString:v19] & 1) == 0)
        {
          uint64_t v91 = (uint64_t)v16;
          uint64_t v92 = v19;
          TDSchemaLog(&cfstr_UpdatingDispla.isa, v34, v35, v36, v37, v38, v39, v40, v18);
          [v13 setValue:v19 forKey:@"displayName"];
        }
      }
      uint64_t v104 = [obj countByEnumeratingWithState:&v114 objects:v120 count:16];
    }
    while (v104);
    if (v11 >= 2)
    {
      NSLog(&cfstr_WarningDocumen.isa, [v10 valueForKey:@"label"]);
      id v7 = v95;
      id v8 = v96;
      goto LABEL_25;
    }
    id v7 = v95;
    id v8 = v96;
    if (!v11) {
LABEL_24:
    }
      [v8 addObject:v10];
LABEL_25:
    v10 = (void *)[v7 nextConstantHelper];
  }
  while (v10);
LABEL_26:
  if ([v8 count])
  {
    uint64_t v91 = [v8 valueForKey:@"label"];
    TDSchemaLog(&cfstr_EntityHasMissi.isa, v41, v42, v43, v44, v45, v46, v47, (char)v101);
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    uint64_t v48 = [v8 countByEnumeratingWithState:&v110 objects:v119 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v111;
      do
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v111 != v50) {
            objc_enumerationMutation(v96);
          }
          v52 = *(void **)(*((void *)&v110 + 1) + 8 * j);
          id v53 = [(CoreThemeDocument *)self->_doc newObjectForEntity:v101];
          objc_msgSend(v53, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v52, "identifier")), @"identifier");
          objc_msgSend(v53, "setValue:forKey:", objc_msgSend(v52, "label"), @"constantName");
          objc_msgSend(v53, "setValue:forKey:", objc_msgSend(v52, "displayName"), @"displayName");
        }
        id v8 = v96;
        uint64_t v49 = [v96 countByEnumeratingWithState:&v110 objects:v119 count:16];
      }
      while (v49);
    }
    objc_msgSend(-[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext"), "processPendingChanges");
  }

  id v54 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", v101, [MEMORY[0x263EFF8C0] arrayWithObject:v93]);
  v55 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  id obja = +[CoreThemeConstantEnumerator enumeratorForGlobalListAtAddress:v94];
  uint64_t v56 = [obja nextConstantHelper];
  if (v56)
  {
    v57 = (void *)v56;
    uint64_t v58 = 0;
    do
    {
      if (!objc_msgSend((id)objc_msgSend(v57, "displayName"), "length")) {
        break;
      }
      uint64_t v59 = [v57 identifier];
      uint64_t v60 = v59;
      if (v59 > v58) {
        uint64_t v58 = v59;
      }
      uint64_t v103 = v58;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      uint64_t v61 = [v54 countByEnumeratingWithState:&v106 objects:v118 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = 0;
        uint64_t v64 = *(void *)v107;
        do
        {
          for (uint64_t k = 0; k != v62; ++k)
          {
            if (*(void *)v107 != v64) {
              objc_enumerationMutation(v54);
            }
            v66 = *(void **)(*((void *)&v106 + 1) + 8 * k);
            if (v60 == objc_msgSend((id)objc_msgSend(v66, "valueForKey:", @"identifier"), "integerValue"))
            {
              if (v63 < 1)
              {
                ++v63;
              }
              else
              {
                uint64_t v105 = v63 + 1;
                char v67 = [v66 valueForKey:@"constantName"];
                TDSchemaLog(&cfstr_FoundExtraThem.isa, v68, v69, v70, v71, v72, v73, v74, v67);
                uint64_t v75 = objc_msgSend(v54, "objectAtIndex:", objc_msgSend(v54, "indexOfObject:", v66) - 1);
                uint64_t v76 = v64;
                uint64_t v77 = v60;
                v78 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"RenditionKeySpec"), "relationshipsWithDestinationEntity:", objc_msgSend(v66, "entity")), "objectAtIndex:", 0);
                v79 = (void *)MEMORY[0x263F08A98];
                uint64_t v90 = [v78 name];
                v80 = v79;
                uint64_t v60 = v77;
                uint64_t v64 = v76;
                if ((int64_t)-[CoreThemeDocument countForEntity:withPredicate:](self->_doc, "countForEntity:withPredicate:", @"RenditionKeySpec", [v80 predicateWithFormat:@"%K = %@", v90, v75]) <= 0)v81 = (void *)v75; {
                else
                }
                  v81 = v66;
                [v55 addObject:v81];
                uint64_t v63 = v105;
              }
            }
          }
          uint64_t v62 = [v54 countByEnumeratingWithState:&v106 objects:v118 count:16];
        }
        while (v62);
      }
      v57 = (void *)[obja nextConstantHelper];
      uint64_t v58 = v103;
    }
    while (v57);
  }
  else
  {
    uint64_t v58 = 0;
  }
  v82 = objc_msgSend(v54, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier > %d", v58, v91, v92));
  if ([v82 count]
    && ([v101 isEqualToString:@"EffectType"] & 1) == 0
    && ([v101 isEqualToString:@"EffectParameterType"] & 1) == 0)
  {
    [v82 valueForKey:@"constantName"];
    TDSchemaLog(&cfstr_RemovingExtraT.isa, v83, v84, v85, v86, v87, v88, v89, (char)v101);
    [v55 addObjectsFromArray:v82];
  }
  if ([v55 count])
  {
    [(CoreThemeDocument *)self->_doc deleteObjects:v55];
    objc_msgSend(-[TDPersistentDocument managedObjectContext](self->_doc, "managedObjectContext"), "processPendingChanges");
  }
}

- (void)_sanityCheckMetafontSizeSelectorsAndUpdateIfNecessary
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"controlSize.identifier" ascending:1];
  id v53 = self;
  obuint64_t j = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", @"MetafontSizeSelector", [MEMORY[0x263EFF8C0] arrayWithObject:v3]);

  id v4 = +[CoreThemeConstantEnumerator enumeratorForGlobalListAtAddress:MEMORY[0x263F38440]];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v52 = v4;
  uint64_t v6 = [v4 nextConstantHelper];
  if (v6)
  {
    id v7 = (void *)v6;
    id v51 = v5;
    while (1)
    {
      if (!objc_msgSend((id)objc_msgSend(v7, "displayName"), "length")) {
        goto LABEL_27;
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v56 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (!v56) {
        break;
      }
      uint64_t v57 = 0;
      uint64_t v55 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v63 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          int v10 = objc_msgSend((id)objc_msgSend(v9, "identifier"), "intValue");
          int v11 = objc_msgSend((id)objc_msgSend(v9, "controlSize"), "identifier");
          v12 = (void *)[v9 selectorName];
          v13 = (void *)[v9 displayName];
          uint64_t v14 = [v7 identifier];
          uint64_t v15 = [v7 label];
          uint64_t v16 = [v7 displayName];
          if (v14 == v10
            || ([v12 isEqualToString:v15] & 1) != 0
            || [v13 isEqualToString:v16])
          {
            if (objc_msgSend((id)objc_msgSend(v9, "identifier"), "integerValue") != v14)
            {
              TDSchemaLog(&cfstr_UpdatingIdenti.isa, v17, v18, v19, v20, v21, v22, v23, (char)v9);
              objc_msgSend(v9, "setIdentifier:", objc_msgSend(NSNumber, "numberWithInteger:", v14));
            }
            if (v14 != v11)
            {
              TDSchemaLog(&cfstr_UpdatingContro.isa, v17, v18, v19, v20, v21, v22, v23, (char)v9);
              objc_msgSend(v9, "setControlSize:", -[CoreThemeDocument sizeWithIdentifier:](v53->_doc, "sizeWithIdentifier:", v14));
            }
            if (([v12 isEqualToString:v15] & 1) == 0)
            {
              TDSchemaLog(&cfstr_UpdatingSelect.isa, v24, v25, v26, v27, v28, v29, v30, (char)v9);
              [v9 setSelectorName:v15];
            }
            ++v57;
            if (([v13 isEqualToString:v16] & 1) == 0)
            {
              TDSchemaLog(&cfstr_UpdatingDispla_0.isa, v31, v32, v33, v34, v35, v36, v37, (char)v9);
              [v9 setDisplayName:v16];
            }
          }
        }
        uint64_t v56 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
      }
      while (v56);
      if (v57 < 2)
      {
        id v5 = v51;
        if (!v57) {
          break;
        }
      }
      else
      {
        NSLog(&cfstr_WarningDocumen.isa, v7);
        id v5 = v51;
      }
LABEL_26:
      id v7 = (void *)[v52 nextConstantHelper];
      if (!v7) {
        goto LABEL_27;
      }
    }
    [v5 addObject:v7];
    goto LABEL_26;
  }
LABEL_27:
  if ([v5 count])
  {
    TDSchemaLog(&cfstr_EntityMetafont.isa, v38, v39, v40, v41, v42, v43, v44, (char)v5);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v45 = [v5 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v59 != v47) {
            objc_enumerationMutation(v5);
          }
          uint64_t v49 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          id v50 = [(CoreThemeDocument *)v53->_doc newObjectForEntity:@"MetafontSizeSelector"];
          objc_msgSend(v50, "setControlSize:", -[CoreThemeDocument sizeWithIdentifier:](v53->_doc, "sizeWithIdentifier:", objc_msgSend(v49, "identifier")));
          objc_msgSend(v50, "setSelectorName:", objc_msgSend(v49, "label"));
          objc_msgSend(v50, "setDisplayName:", objc_msgSend(v49, "displayName"));
        }
        uint64_t v46 = [v5 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v46);
    }
    objc_msgSend(-[TDPersistentDocument managedObjectContext](v53->_doc, "managedObjectContext"), "processPendingChanges");
  }
}

- (void)_sanityCheckColorNamesAndUpdateIfNecessary
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(CoreThemeDocument *)self->_doc allObjectsForEntity:@"ColorName" withSortDescriptors:0];
  id v4 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v5 = MEMORY[0x263F38420];
  if (*(void *)(MEMORY[0x263F38420] + 16))
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = objc_msgSend(NSString, "stringWithUTF8String:");
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v8 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (!v8) {
        goto LABEL_11;
      }
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v3);
          }
          v10 += objc_msgSend(v7, "isEqualToString:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "valueForKey:", @"displayName"));
        }
        uint64_t v9 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
      uint64_t v5 = MEMORY[0x263F38420];
      if (!v10) {
LABEL_11:
      }
        [v4 addIndex:v6];
      ++v6;
    }
    while (*(void *)(v5 + 40 * v6 + 16));
  }
  if ([v4 count])
  {
    uint64_t v13 = [v4 firstIndex];
    uint64_t v14 = self;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t j = v13; j != 0x7FFFFFFFFFFFFFFFLL; uint64_t j = [v4 indexGreaterThanIndex:j])
      {
        id v16 = [(CoreThemeDocument *)v14->_doc newObjectForEntity:@"ColorName"];
        uint64_t v17 = MEMORY[0x263F38420] + 40 * j;
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(NSString, "stringWithUTF8String:", *(void *)(v17 + 16)), @"displayName");
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(NSString, "stringWithUTF8String:", *(void *)(v17 + 24)), @"selector");
      }
    }
    objc_msgSend(-[TDPersistentDocument managedObjectContext](v14->_doc, "managedObjectContext"), "processPendingChanges");
  }
}

- (void)_sanityCheckSchemaPartDefinitionsForStandardElement:(id *)a3 withElement:(id)a4
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  uint64_t v7 = [objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"name" ascending:1];
  id v89 = a4;
  uint64_t v8 = (void *)[a4 parts];
  uint64_t v85 = (void *)v7;
  uint64_t v9 = objc_msgSend(v8, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v7));
  uint64_t v10 = self;
  uint64_t v11 = objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  size_t v12 = [v11 partDefinitionCountForElementDefinition:a3];
  uint64_t v13 = (char *)malloc_type_malloc(440 * v12, 0x5867F01AuLL);
  memcpy(v13, a3->var4, 440 * v12);
  qsort_b(v13, v12, 0x1B8uLL, &__block_literal_global_5);
  unint64_t v87 = v12;
  obuint64_t j = (id)[MEMORY[0x263EFF980] array];
  uint64_t v86 = v13;
  if (v12)
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = &v13[440 * v14];
      id v16 = (void *)[[NSString alloc] initWithUTF8String:*(void *)v15];
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      uint64_t v17 = [v9 countByEnumeratingWithState:&v102 objects:v109 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v103;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v103 != v19) {
              objc_enumerationMutation(v9);
            }
            long long v21 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            if (objc_msgSend(v16, "isEqualToString:", objc_msgSend(v21, "name")))
            {
              uint64_t v22 = (void *)[v11 widgetNameForPartDefinition:v15];
              uint64_t v13 = v86;
              if ((objc_msgSend(v22, "isEqualToString:", objc_msgSend(v21, "widgetID")) & 1) == 0)
              {
                char v23 = [v89 name];
                [v21 name];
                [v21 widgetID];
                TDSchemaLog(&cfstr_UpdatingWidget.isa, v24, v25, v26, v27, v28, v29, v30, v23);
                [v21 setWidgetID:v22];
              }
              goto LABEL_16;
            }
            if (objc_msgSend(v16, "compare:", objc_msgSend(v21, "name")) == -1)
            {
              objc_msgSend(obj, "addObject:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v15, 8, 0));
              uint64_t v13 = v86;
              goto LABEL_16;
            }
          }
          uint64_t v18 = [v9 countByEnumeratingWithState:&v102 objects:v109 count:16];
          uint64_t v13 = v86;
          if (v18) {
            continue;
          }
          break;
        }
      }
      objc_msgSend(obj, "addObject:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v15, 8, 0));
LABEL_16:

      ++v14;
    }
    while (v14 != v87);
  }
  if ([obj count])
  {
    char v31 = [v89 name];
    TDSchemaLog(&cfstr_ElementWasMiss.isa, v32, v33, v34, v35, v36, v37, v38, v31);
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v39 = [obj countByEnumeratingWithState:&v98 objects:v108 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v99;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v99 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = (void *)[*(id *)(*((void *)&v98 + 1) + 8 * j) bytes];
        uint64_t v44 = (void *)[[NSString alloc] initWithUTF8String:*v43];
        uint64_t v45 = [v11 widgetNameForPartDefinition:v43];
        TDSchemaLog(&cfstr_AddingPart.isa, v46, v47, v48, v49, v50, v51, v52, (char)v44);
        id v53 = [(CoreThemeDocument *)v10->_doc newObjectForEntity:@"SchemaPartDefinition"];
        [v53 setName:v44];
        [v53 setWidgetID:v45];
        [v53 setElement:v89];
        [v53 updateDerivedRenditionData];
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v98 objects:v108 count:16];
    }
    while (v40);
  }
  id v54 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v55 = (void *)[v89 parts];
  uint64_t v56 = objc_msgSend(v55, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v85));

  if ([v56 count] > v87)
  {
    char v57 = [v89 name];
    TDSchemaLog(&cfstr_DocumentContai.isa, v58, v59, v60, v61, v62, v63, v64, v57);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    uint64_t v65 = [v56 countByEnumeratingWithState:&v94 objects:v107 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      unint64_t v67 = 0;
      uint64_t v68 = *(void *)v95;
LABEL_29:
      uint64_t v69 = 0;
      while (1)
      {
        if (*(void *)v95 != v68) {
          objc_enumerationMutation(v56);
        }
        if (v67 > v87) {
          break;
        }
        uint64_t v70 = *(void **)(*((void *)&v94 + 1) + 8 * v69);
        uint64_t v71 = (void *)[[NSString alloc] initWithUTF8String:*(void *)&v86[440 * v67]];
        if (objc_msgSend(v71, "isEqualToString:", objc_msgSend(v70, "name"))) {
          ++v67;
        }
        else {
          [v54 addObject:v70];
        }

        if (v66 == ++v69)
        {
          uint64_t v66 = [v56 countByEnumeratingWithState:&v94 objects:v107 count:16];
          if (v66) {
            goto LABEL_29;
          }
          break;
        }
      }
    }
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v72 = [v54 countByEnumeratingWithState:&v90 objects:v106 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v91;
      do
      {
        for (uint64_t k = 0; k != v73; ++k)
        {
          if (*(void *)v91 != v74) {
            objc_enumerationMutation(v54);
          }
          uint64_t v76 = *(void **)(*((void *)&v90 + 1) + 8 * k);
          char v77 = [v76 name];
          TDSchemaLog(&cfstr_DeletingPart.isa, v78, v79, v80, v81, v82, v83, v84, v77);
          [v89 removePartsObject:v76];
          [(CoreThemeDocument *)v10->_doc deleteObject:v76];
        }
        uint64_t v73 = [v54 countByEnumeratingWithState:&v90 objects:v106 count:16];
      }
      while (v73);
    }
  }
  if (v86) {
    free(v86);
  }
}

uint64_t __81__TDThemeSchema__sanityCheckSchemaPartDefinitionsForStandardElement_withElement___block_invoke(uint64_t a1, const char **a2, const char **a3)
{
  return strncmp(*a2, *a3, 0x64uLL);
}

- (void)_addSchemaPartDefinitionsForStandardElement:(id *)a3 withElement:(id)a4
{
  uint64_t v7 = objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  if (a3->var4[0].var3)
  {
    uint64_t v8 = (void *)v7;
    do
    {
      if (a3->var4[0].var0)
      {
        id v9 = [(CoreThemeDocument *)self->_doc newObjectForEntity:@"SchemaPartDefinition"];
        uint64_t v10 = [v8 widgetNameForPartDefinition:a3->var4];
        objc_msgSend(v9, "setName:", objc_msgSend(NSString, "stringWithCString:encoding:", a3->var4[0].var0, 4));
        [v9 setElement:a4];
        [v9 setWidgetID:v10];
        [v9 updateDerivedRenditionData];
      }
      int64_t var3 = a3->var4[1].var3;
      a3 = (const $A3BFAB32BE8B8144AB428F242CA2D26A *)((char *)a3 + 440);
    }
    while (var3);
  }
}

- (void)_sanityCheckSchemaCategoriesAndUpdateIfNecessary
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  TDSchemaLog(&cfstr_SynchronizingS.isa, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v60);
  id v9 = [(CoreThemeDocument *)self->_doc allObjectsForEntity:@"SchemaCategory" withSortDescriptors:0];
  uint64_t v61 = self;
  uint64_t v10 = objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  uint64_t v11 = [v10 elementCategoryCount];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v68;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v68 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v67 + 1) + 8 * v15);
        if (v11)
        {
          uint64_t v17 = 0;
          while (1)
          {
            uint64_t v18 = (unsigned int *)[v10 elementCategoryAtIndex:v17];
            if (objc_msgSend((id)objc_msgSend(v16, "constantName"), "isEqualToString:", objc_msgSend(NSString, "stringWithUTF8String:", *((void *)v18 + 1))))break; {
            if (v11 == ++v17)
            }
              goto LABEL_10;
          }
          if (*(void *)v18 != [v16 identifier])
          {
            char v35 = [v16 constantName];
            TDSchemaLog(&cfstr_UpdatingIdenti_0.isa, v36, v37, v38, v39, v40, v41, v42, v35);
            [v16 setIdentifier:*v18];
          }
        }
        else
        {
LABEL_10:
          char v19 = [v16 displayName];
          TDSchemaLog(&cfstr_RemovingRelati.isa, v20, v21, v22, v23, v24, v25, v26, v19);
          objc_msgSend(v16, "removeElements:", objc_msgSend(v16, "elements"));
          char v27 = [v16 displayName];
          TDSchemaLog(&cfstr_DeletingCatego.isa, v28, v29, v30, v31, v32, v33, v34, v27);
          [(CoreThemeDocument *)self->_doc deleteObject:v16];
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v43 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
      uint64_t v13 = v43;
    }
    while (v43);
  }
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v45 = (unsigned int *)[v10 elementCategoryAtIndex:i];
      uint64_t v46 = [NSString stringWithUTF8String:*((void *)v45 + 1)];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v47 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v64;
LABEL_20:
        uint64_t v50 = 0;
        while (1)
        {
          if (*(void *)v64 != v49) {
            objc_enumerationMutation(obj);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * v50), "constantName"), "isEqualToString:", v46))break; {
          if (v48 == ++v50)
          }
          {
            uint64_t v48 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
            if (v48) {
              goto LABEL_20;
            }
            goto LABEL_26;
          }
        }
      }
      else
      {
LABEL_26:
        id v51 = [(CoreThemeDocument *)v61->_doc newObjectForEntity:@"SchemaCategory"];
        [v51 setIdentifier:*v45];
        objc_msgSend(v51, "setDisplayName:", objc_msgSend(NSString, "stringWithUTF8String:", *((void *)v45 + 2)));
        objc_msgSend(v51, "setConstantName:", objc_msgSend(NSString, "stringWithUTF8String:", *((void *)v45 + 1)));
        char v52 = [v51 displayName];
        TDSchemaLog(&cfstr_AddedMissingCa.isa, v53, v54, v55, v56, v57, v58, v59, v52);
      }
    }
  }
  objc_msgSend(-[TDPersistentDocument managedObjectContext](v61->_doc, "managedObjectContext"), "processPendingChanges");
  [(CoreThemeDocument *)v61->_doc recacheThemeConstant:@"SchemaCategory"];
}

- (void)_sanityCheckSchemaDefinitionsAndUpdateIfNecessary
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  TDSchemaLog(&cfstr_SynchronizingS_0.isa, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v92);
  long long v93 = @"SchemaEffectDefinition";
  id v9 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:@"SchemaElementDefinition"];
  uint64_t v10 = objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  obuint64_t j = v9;
  uint64_t v96 = [v9 countByEnumeratingWithState:&v120 objects:v128 count:16];
  if (v96)
  {
    uint64_t v95 = *(void *)v121;
    long long v100 = (void *)v10;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v121 != v95) {
          objc_enumerationMutation(obj);
        }
        uint64_t v98 = v11;
        uint64_t v12 = *(void *)(*((void *)&v120 + 1) + 8 * v11);
        long long v97 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"name" ascending:1];
        id v13 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", v12, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:"));
        uint64_t v14 = (void *)[MEMORY[0x263EFF980] array];
        Class v101 = NSClassFromString((NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", v12), "managedObjectClassName"));
        unint64_t v103 = [(objc_class *)v101 elementDefinitionCountWithSchema:v10];
        if (v103)
        {
          for (uint64_t i = 0; i != v103; ++i)
          {
            uint64_t v102 = [(objc_class *)v101 sortedElementDefinitionAtIndex:i withSchema:v10];
            id v16 = (void *)[[NSString alloc] initWithUTF8String:*(void *)v102];
            long long v116 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            uint64_t v17 = [v13 countByEnumeratingWithState:&v116 objects:v127 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v117;
              while (2)
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v117 != v19) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v21 = *(void **)(*((void *)&v116 + 1) + 8 * j);
                  if (objc_msgSend(v16, "isEqualToString:", objc_msgSend(v21, "name")))
                  {
                    [(TDThemeSchema *)self _sanityCheckSchemaPartDefinitionsForStandardElement:v102 withElement:v21];
                    uint64_t v10 = (uint64_t)v100;
                    uint64_t v22 = (void *)[v100 categoryForElementDefinition:v102];
                    long long v99 = (void *)[[NSString alloc] initWithUTF8String:v22[1]];
                    if ((objc_msgSend(v99, "isEqualToString:", objc_msgSend((id)objc_msgSend(v21, "category"), "constantName")) & 1) == 0)
                    {
                      id v23 = [(CoreThemeDocument *)self->_doc schemaCategoryWithIdentifier:*v22];
                      char v24 = [v21 name];
                      objc_msgSend((id)objc_msgSend(v21, "category"), "constantName");
                      TDSchemaLog(&cfstr_UpdatingCatego.isa, v25, v26, v27, v28, v29, v30, v31, v24);
                      [v21 setCategory:v23];
                    }

                    if (*(unsigned __int8 *)(v102 + 16) != [v21 published])
                    {
                      [v21 published];
                      TDSchemaLog(&cfstr_UpdatingPublis.isa, v32, v33, v34, v35, v36, v37, v38, (char)v21);
                      [v21 setPublished:*(unsigned __int8 *)(v102 + 16)];
                    }
                    goto LABEL_23;
                  }
                  if (objc_msgSend(v16, "compare:", objc_msgSend(v21, "name")) == -1)
                  {
                    objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v102, 8, 0));
                    uint64_t v10 = (uint64_t)v100;
                    goto LABEL_23;
                  }
                }
                uint64_t v18 = [v13 countByEnumeratingWithState:&v116 objects:v127 count:16];
                uint64_t v10 = (uint64_t)v100;
                if (v18) {
                  continue;
                }
                break;
              }
            }
            objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v102, 8, 0));
LABEL_23:
          }
        }
        if ([v14 count]) {
          TDSchemaLog(&cfstr_DocumentIsMiss.isa, v39, v40, v41, v42, v43, v44, v45, (char)v93);
        }
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        uint64_t v46 = [v14 countByEnumeratingWithState:&v112 objects:v126 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v113;
          do
          {
            for (uint64_t k = 0; k != v47; ++k)
            {
              if (*(void *)v113 != v48) {
                objc_enumerationMutation(v14);
              }
              uint64_t v50 = [*(id *)(*((void *)&v112 + 1) + 8 * k) bytes];
              id v51 = [(CoreThemeDocument *)self->_doc schemaCategoryWithIdentifier:*(void *)(v50 + 24)];
              uint64_t v52 = [NSString stringWithUTF8String:*(void *)v50];
              char v53 = [v51 constantName];
              TDSchemaLog(&stru_26E86B5B0.isa, v54, v55, v56, v57, v58, v59, v60, v53);
              id v61 = [(CoreThemeDocument *)self->_doc newObjectForEntity:v12];
              [v61 setName:v52];
              [v61 setPublished:*(unsigned __int8 *)(v50 + 16)];
              [v61 setCategory:v51];
              [(TDThemeSchema *)self _addSchemaPartDefinitionsForStandardElement:v50 withElement:v61];
            }
            uint64_t v47 = [v14 countByEnumeratingWithState:&v112 objects:v126 count:16];
          }
          while (v47);
        }
        id v62 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->_doc, "allObjectsForEntity:withSortDescriptors:", v12, [MEMORY[0x263EFF8C0] arrayWithObject:v97]);

        uint64_t v10 = (uint64_t)v100;
        if ([v62 count] > v103)
        {
          TDSchemaLog(&cfstr_DocumentContai_0.isa, v63, v64, v65, v66, v67, v68, v69, (char)v93);
          long long v70 = (void *)[MEMORY[0x263EFF980] array];
          long long v108 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          uint64_t v71 = [v62 countByEnumeratingWithState:&v108 objects:v125 count:16];
          if (v71)
          {
            uint64_t v72 = v71;
            unint64_t v73 = 0;
            uint64_t v74 = *(void *)v109;
            do
            {
              for (uint64_t m = 0; m != v72; ++m)
              {
                if (*(void *)v109 != v74) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v76 = *(void **)(*((void *)&v108 + 1) + 8 * m);
                if (v73 >= v103)
                {
                  [v70 addObject:*(void *)(*((void *)&v108 + 1) + 8 * m)];
                }
                else
                {
                  char v77 = (void *)[v100 sortedElementDefinitionAtIndex:v73];
                  if (*v77)
                  {
                    uint64_t v78 = (void *)[[NSString alloc] initWithUTF8String:*v77];
                    if (objc_msgSend(v78, "isEqualToString:", objc_msgSend(v76, "name"))) {
                      ++v73;
                    }
                    else {
                      [v70 addObject:v76];
                    }
                  }
                }
              }
              uint64_t v72 = [v62 countByEnumeratingWithState:&v108 objects:v125 count:16];
            }
            while (v72);
          }
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          uint64_t v79 = [v70 countByEnumeratingWithState:&v104 objects:v124 count:16];
          if (v79)
          {
            uint64_t v80 = v79;
            uint64_t v81 = *(void *)v105;
            do
            {
              for (uint64_t n = 0; n != v80; ++n)
              {
                if (*(void *)v105 != v81) {
                  objc_enumerationMutation(v70);
                }
                uint64_t v83 = *(void **)(*((void *)&v104 + 1) + 8 * n);
                char v84 = [v83 name];
                TDSchemaLog(&cfstr_DeletingElemen.isa, v85, v86, v87, v88, v89, v90, v91, v84);
                [(CoreThemeDocument *)self->_doc deleteObject:v83];
              }
              uint64_t v80 = [v70 countByEnumeratingWithState:&v104 objects:v124 count:16];
            }
            while (v80);
          }
        }
        uint64_t v11 = v98 + 1;
      }
      while (v98 + 1 != v96);
      uint64_t v96 = [obj countByEnumeratingWithState:&v120 objects:v128 count:16];
    }
    while (v96);
  }
}

- (void)_sanityCheckEffectRenditionsAndUpdateIfNecessary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(CoreThemeDocument *)self->_doc targetPlatform];
  if (v3 <= 5 && ((1 << v3) & 0x3A) != 0)
  {
    id v5 = [(CoreThemeDocument *)self->_doc metadatumForKey:@"PreviousCoreThemeDefinitionDataModelKey"];
    if (v5)
    {
      if ((int)[v5 intValue] <= 43)
      {
        id v6 = [(CoreThemeDocument *)self->_doc allObjectsForEntity:@"EffectRenditionSpec" withSortDescriptors:0];
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v14;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v14 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
              objc_msgSend((id)objc_msgSend(v11, "effectScale"), "floatValue");
              if (*(float *)&v12 < 2.0)
              {
                LODWORD(v12) = 2.0;
                objc_msgSend(v11, "setEffectScale:", objc_msgSend(NSNumber, "numberWithFloat:", v12));
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v8);
        }
      }
    }
  }
}

- (void)_sanityCheckMicaRenditionsAndUpdateIfNecessary
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v3 = (void *)[MEMORY[0x263EFF9C0] set];
  id v4 = [(CoreThemeDocument *)self->_doc allObjectsForEntity:@"MicaElementProduction" withSortDescriptors:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "asset"), "scaleFactor") >= 2) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [(CoreThemeDocument *)self->_doc deleteProductions:v3 shouldDeleteAssetFiles:1];
}

- (BOOL)_renditionKey:(const _renditionkeytoken *)a3 isEqualToKeyIgnoringLook:(const _renditionkeytoken *)a4
{
  CUISystemThemeRenditionKeyFormat();

  return CUIEqualRenditionKeys();
}

- (void)_sanityCheckSchemaAssets
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v3 = [(CoreThemeDocument *)self->_doc allObjectsForEntity:@"SchemaElementProduction" withSortDescriptors:0];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v3;
  uint64_t v42 = [v3 countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v65;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v65 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v4;
        uint64_t v5 = *(void **)(*((void *)&v64 + 1) + 8 * v4);
        uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "renditions"), "anyObject"), "asset"), "source"), "name");
        uint64_t v47 = (void *)[v5 partDefinition];
        uint64_t v7 = (void *)[v47 renditionGroups];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v61;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v61 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              if (-[TDThemeSchema _renditionKey:isEqualToKeyIgnoringLook:](self, "_renditionKey:isEqualToKeyIgnoringLook:", objc_msgSend((id)objc_msgSend(v12, "baseKey"), "keyList"), objc_msgSend((id)objc_msgSend(v5, "baseKeySpec"), "key")))
              {
                uint64_t v46 = (void *)[MEMORY[0x263F08850] defaultManager];
                id v13 = [(CoreThemeDocument *)self->_doc defaultPathComponentsForPartDefinition:v47];
                id v14 = -[CoreThemeDocument folderNameFromRenditionKey:forPartDefinition:](self->_doc, "folderNameFromRenditionKey:forPartDefinition:", [v12 baseKey], v47);
                uint64_t v45 = [v13 stringByAppendingPathComponent:v14];
                if ((objc_msgSend((id)objc_msgSend(v5, "folderName"), "isEqualToString:", v14) & 1) == 0) {
                  [v5 setFolderName:v14];
                }
                uint64_t v50 = v12;
                uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_alloc(NSURL), "initFileURLWithPath:", -[CoreThemeDocument rootPathForProductionData](self->_doc, "rootPathForProductionData")), "URLByAppendingPathComponent:", v6), "URLByAppendingPathComponent:", v45);
                if (!objc_msgSend((id)objc_msgSend(v15, "path"), "length")) {
                  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDThemeSchema.m", 1156, @"Something is wacky with the locationURL %@", v15);
                }
                uint64_t v48 = v15;
                if ((objc_msgSend(v46, "fileExistsAtPath:", objc_msgSend(v15, "path")) & 1) != 0
                  || [v46 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:0])
                {
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v56 = 0u;
                  long long v57 = 0u;
                  id v44 = (id)[v5 renditions];
                  uint64_t v16 = [v44 countByEnumeratingWithState:&v56 objects:v69 count:16];
                  if (v16)
                  {
                    uint64_t v17 = v16;
                    uint64_t v49 = *(void *)v57;
                    while (1)
                    {
                      for (uint64_t j = 0; j != v17; ++j)
                      {
                        if (*(void *)v57 != v49) {
                          objc_enumerationMutation(v44);
                        }
                        uint64_t v19 = *(void **)(*((void *)&v56 + 1) + 8 * j);
                        long long v52 = 0u;
                        long long v53 = 0u;
                        long long v54 = 0u;
                        long long v55 = 0u;
                        uint64_t v20 = (void *)[v50 renditions];
                        uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v68 count:16];
                        if (!v21) {
                          continue;
                        }
                        uint64_t v22 = v21;
                        uint64_t v23 = *(void *)v53;
                        while (2)
                        {
                          for (uint64_t k = 0; k != v22; ++k)
                          {
                            if (*(void *)v53 != v23) {
                              objc_enumerationMutation(v20);
                            }
                            uint64_t v25 = *(void **)(*((void *)&v52 + 1) + 8 * k);
                            if (-[TDThemeSchema _renditionKey:isEqualToKeyIgnoringLook:](self, "_renditionKey:isEqualToKeyIgnoringLook:", [v25 key], objc_msgSend((id)objc_msgSend(v19, "keySpec"), "key")))
                            {
                              id v26 = [(CoreThemeDocument *)self->_doc defaultPNGFileNameForSchemaRendition:v25 withPartDefinition:v47];
                              char v27 = objc_msgSend(v46, "fileExistsAtPath:", objc_msgSend((id)objc_msgSend(v48, "path"), "stringByAppendingPathComponent:", v26));
                              uint64_t v28 = (void *)[v19 asset];
                              if (v27)
                              {
                                if (objc_msgSend((id)objc_msgSend(v28, "category"), "isEqualToString:", v45)) {
                                  goto LABEL_48;
                                }
LABEL_47:
                                objc_msgSend((id)objc_msgSend(v19, "asset"), "setCategory:", v45);
                                objc_msgSend((id)objc_msgSend(v19, "asset"), "setName:", v26);
                                goto LABEL_48;
                              }
                              uint64_t v29 = (void *)[v28 fileURLWithDocument:self->_doc];
                              if (objc_msgSend(v29, "isEqual:", objc_msgSend(v48, "URLByAppendingPathComponent:", v26)))
                              {
                                NSLog(&cfstr_MissingAsset.isa, [v29 path]);
                                goto LABEL_48;
                              }
                              long long v51 = 0uLL;
                              if (objc_msgSend(v46, "fileExistsAtPath:", objc_msgSend(v29, "path")))
                              {
                                objc_msgSend(v46, "copyItemAtURL:toURL:error:", v29, objc_msgSend(v48, "URLByAppendingPathComponent:", v26), (char *)&v51 + 8);
                                if (!*((void *)&v51 + 1))
                                {
                                  uint64_t v30 = @"copied existing file to %@";
                                  goto LABEL_45;
                                }
                              }
                              else
                              {
                                [(CoreThemeDocument *)self->_doc createReferencePNGForSchemaRendition:v25 withPartDefinition:v47 atLocation:v48 error:&v51];
                                if (!(void)v51)
                                {
                                  uint64_t v30 = @"wrote new reference file to %@";
LABEL_45:
                                  char v31 = objc_msgSend((id)objc_msgSend(v48, "URLByAppendingPathComponent:", v26), "path");
                                  TDSchemaLog(&v30->isa, v32, v33, v34, v35, v36, v37, v38, v31);
                                }
                              }
                              if (v51 != 0) {
                                goto LABEL_48;
                              }
                              goto LABEL_47;
                            }
                          }
                          uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v68 count:16];
                          if (v22) {
                            continue;
                          }
                          break;
                        }
LABEL_48:
                        ;
                      }
                      uint64_t v17 = [v44 countByEnumeratingWithState:&v56 objects:v69 count:16];
                      if (!v17) {
                        goto LABEL_50;
                      }
                    }
                  }
                }
                goto LABEL_50;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v60 objects:v70 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_50:
        uint64_t v4 = v43 + 1;
      }
      while (v43 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    }
    while (v42);
  }
}

- (void)sanityCheckAndUpdateDocumentIfNecessary
{
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeElement" globalDescriptor:MEMORY[0x263F38488] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemePart" globalDescriptor:MEMORY[0x263F384A8] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeSize" globalDescriptor:MEMORY[0x263F384B8] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeDirection" globalDescriptor:MEMORY[0x263F38468] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeValue" globalDescriptor:MEMORY[0x263F384F0] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeState" globalDescriptor:MEMORY[0x263F384C0] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemePresentationState" globalDescriptor:MEMORY[0x263F384B0] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeIdiom" globalDescriptor:MEMORY[0x263F384A0] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeDisplayGamut" globalDescriptor:MEMORY[0x263F38470] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeDeploymentTarget" globalDescriptor:MEMORY[0x263F38460] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"TexturePixelFormat" globalDescriptor:MEMORY[0x263F384E0] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"TextureFace" globalDescriptor:MEMORY[0x263F384D0] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"TextureInterpretation" globalDescriptor:MEMORY[0x263F384D8] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeCompressionType" globalDescriptor:MEMORY[0x263F38458] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeGraphicsFeatureSetClass" globalDescriptor:MEMORY[0x263F38490] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeUISizeClass" globalDescriptor:MEMORY[0x263F384E8] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"RenderingMode" globalDescriptor:MEMORY[0x263F384C8] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"IterationType" globalDescriptor:gThemeIterationTypes matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"RenditionType" globalDescriptor:MEMORY[0x263F38450] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"RenditionSubtype" globalDescriptor:MEMORY[0x263F38448] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ColorStatus" globalDescriptor:MEMORY[0x263F38418] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"MetafontSelector" globalDescriptor:MEMORY[0x263F38438] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckMetafontSizeSelectorsAndUpdateIfNecessary];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"EffectType" globalDescriptor:MEMORY[0x263F38430] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"EffectParameterType" globalDescriptor:MEMORY[0x263F38428] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeGlyphSize" globalDescriptor:MEMORY[0x263F38500] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"ThemeGlyphWeight" globalDescriptor:MEMORY[0x263F38508] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckObjectsWithEntityName:@"VectorGlyphRenderingMode" globalDescriptor:MEMORY[0x263F384F8] matchIdentifierOnly:0];
  [(TDThemeSchema *)self _sanityCheckSchemaCategoriesAndUpdateIfNecessary];
  [(TDThemeSchema *)self _sanityCheckSchemaDefinitionsAndUpdateIfNecessary];
  [(TDThemeSchema *)self _sanityCheckSchemaAssets];
  [(TDThemeSchema *)self _sanityCheckColorNamesAndUpdateIfNecessary];
  [(TDThemeSchema *)self _sanityCheckEffectRenditionsAndUpdateIfNecessary];
  [(TDThemeSchema *)self _sanityCheckMicaRenditionsAndUpdateIfNecessary];
  doc = self->_doc;

  [(CoreThemeDocument *)doc checkVersionsAndUpdateIfNecessary];
}

- (void)loadThemeSizes
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeSize");
  uint64_t v5 = *(void *)(MEMORY[0x263F384B8] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384B8];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeSize alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeValues
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeValue");
  uint64_t v5 = *(void *)(MEMORY[0x263F384F0] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384F0];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeValue alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeElements
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeElement");
  uint64_t v5 = *(void *)(MEMORY[0x263F38488] + 48);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = MEMORY[0x263F38488] + 40;
    do
    {
      uint64_t v8 = *(const char **)v7;
      if (!*(void *)v7) {
        break;
      }
      size_t v9 = strlen((const char *)kObsoletePrefix);
      if (strncmp((const char *)kObsoletePrefix, v8, v9))
      {
        uint64_t v10 = [[TDThemeElement alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
        [(TDThemeConstant *)v10 setIdentifier:*(unsigned int *)(v7 - 8)];
        -[TDThemeConstant setDisplayName:](v10, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
        -[TDThemeConstant setConstantName:](v10, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);
      }
      uint64_t v5 = *(void *)(v7 + 40);
      v7 += 32;
    }
    while (v5);
  }
}

- (void)loadThemeParts
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemePart");
  uint64_t v5 = *(void *)(MEMORY[0x263F384A8] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384A8];
    do
    {
      uint64_t v8 = (const char *)*((void *)v7 + 1);
      if (!v8) {
        break;
      }
      size_t v9 = strlen((const char *)kObsoletePrefix);
      if (strncmp((const char *)kObsoletePrefix, v8, v9))
      {
        uint64_t v10 = [[TDThemePart alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
        [(TDThemeConstant *)v10 setIdentifier:*v7];
        -[TDThemeConstant setDisplayName:](v10, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
        -[TDThemeConstant setConstantName:](v10, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);
      }
      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadBasicThemePart
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemePart");
  uint64_t v5 = *MEMORY[0x263F384A8];
  uint64_t v6 = *(void *)(MEMORY[0x263F384A8] + 8);
  uint64_t v7 = *(void *)(MEMORY[0x263F384A8] + 16);
  uint64_t v8 = [[TDThemePart alloc] initWithEntity:v4 insertIntoManagedObjectContext:v3];
  [(TDThemeConstant *)v8 setIdentifier:v5];
  -[TDThemeConstant setDisplayName:](v8, "setDisplayName:", [NSString stringWithCString:v7 encoding:1]);
  -[TDThemeConstant setConstantName:](v8, "setConstantName:", [NSString stringWithCString:v6 encoding:1]);
}

- (void)loadThemeStates
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeState");
  uint64_t v5 = *(void *)(MEMORY[0x263F384C0] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384C0];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      size_t v9 = [[TDThemeState alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

+ (BOOL)loadThemeConstantsForEntity:(id)a3 inContext:(id)a4
{
  if (loadThemeConstantsForEntity_inContext__onceToken != -1) {
    dispatch_once(&loadThemeConstantsForEntity_inContext__onceToken, &__block_literal_global_307);
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)loadThemeConstantsForEntity_inContext__constantMappings, "objectForKey:", objc_msgSend(a3, "name")), "pointerValue");
  if (*(void *)(v6 + 16))
  {
    uint64_t v7 = (void *)v6;
    do
    {
      if (!v7[1]) {
        break;
      }
      uint64_t v8 = [[TDThemeConstant alloc] initWithEntity:a3 insertIntoManagedObjectContext:a4];
      -[TDThemeConstant setValue:forKey:](v8, "setValue:forKey:", [NSNumber numberWithInteger:*v7], @"identifier");
      -[TDThemeConstant setDisplayName:](v8, "setDisplayName:", [NSString stringWithCString:v7[2] encoding:1]);
      -[TDThemeConstant setConstantName:](v8, "setConstantName:", [NSString stringWithCString:v7[1] encoding:1]);

      uint64_t v9 = v7[5];
      v7 += 3;
    }
    while (v9);
  }
  return 1;
}

uint64_t __55__TDThemeSchema_loadThemeConstantsForEntity_inContext___block_invoke()
{
  uint64_t result = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", MEMORY[0x263F384B0]), @"ThemePresentationState", 0);
  loadThemeConstantsForEntity_inContext__constantMappings = result;
  return result;
}

- (void)loadThemePresentationStates
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemePresentationState");
  uint64_t v5 = *(void *)(MEMORY[0x263F384B0] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384B0];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemePresentationState alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeDirections
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeDirection");
  uint64_t v5 = *(void *)(MEMORY[0x263F38468] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38468];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeDirection alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeDrawingLayers
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeDrawingLayer");
  uint64_t v5 = *(void *)(MEMORY[0x263F38478] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38478];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeDrawingLayer alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeIdioms
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeIdiom");
  uint64_t v5 = *(void *)(MEMORY[0x263F384A0] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384A0];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeIdiom alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeDisplayGamuts
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeDisplayGamut");
  uint64_t v5 = *(void *)(MEMORY[0x263F38470] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38470];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeDisplayGamut alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeDeploymentTargets
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeDeploymentTarget");
  uint64_t v5 = *(void *)(MEMORY[0x263F38460] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38460];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeDeploymentTarget alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeCompressionTypes
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeCompressionType");
  uint64_t v5 = *(void *)(MEMORY[0x263F38458] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38458];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeCompressionType alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadTexturePixelFormats
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"TexturePixelFormat");
  uint64_t v5 = *(void *)(MEMORY[0x263F384E0] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384E0];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDTexturePixelFormat alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeTextureFaces
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"TextureFace");
  uint64_t v5 = *(void *)(MEMORY[0x263F384D0] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384D0];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeDisplayGamut alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeTextureInterpretations
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"TextureInterpretation");
  uint64_t v5 = *(void *)(MEMORY[0x263F384D8] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384D8];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDTextureInterpretation alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeGraphicsFeatureSetClasses
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeGraphicsFeatureSetClass");
  uint64_t v5 = *(void *)(MEMORY[0x263F38490] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38490];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeGraphicsFeatureSetClass alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadThemeUISizeClasses
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ThemeUISizeClass");
  uint64_t v5 = *(void *)(MEMORY[0x263F384E8] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F384E8];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeUISizeClass alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadIterationTypes
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"IterationType");
  uint64_t v5 = "Iterate Values";
  if ("Iterate Values")
  {
    uint64_t v6 = v4;
    uint64_t v7 = gThemeIterationTypes;
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDIterationType alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = (const char *)*((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadRenditionTypes
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"RenditionType");
  uint64_t v5 = *(void *)(MEMORY[0x263F38450] + 8);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38450];
    do
    {
      uint64_t v8 = [[TDRenditionType alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v8 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v8, "setDisplayName:", [NSString stringWithUTF8String:*((void *)v7 + 2)]);
      -[TDThemeConstant setConstantName:](v8, "setConstantName:", [NSString stringWithCString:v5 encoding:1]);

      uint64_t v5 = *((void *)v7 + 4);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadRenditionSubtypes
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"RenditionSubtype");
  uint64_t v5 = *(void *)(MEMORY[0x263F38448] + 8);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38448];
    do
    {
      uint64_t v8 = [[TDRenditionSubtype alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v8 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v8, "setDisplayName:", [NSString stringWithUTF8String:*((void *)v7 + 2)]);
      -[TDThemeConstant setConstantName:](v8, "setConstantName:", [NSString stringWithCString:v5 encoding:1]);

      uint64_t v5 = *((void *)v7 + 4);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadColorNames
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ColorName");
  if (*(void *)(MEMORY[0x263F38420] + 8))
  {
    uint64_t v5 = v4;
    uint64_t v6 = (void *)(MEMORY[0x263F38420] + 24);
    do
    {
      uint64_t v7 = *(v6 - 1);
      if (!v7) {
        break;
      }
      uint64_t v8 = [[TDColorName alloc] initWithEntity:v5 insertIntoManagedObjectContext:v3];
      -[TDColorName setDisplayName:](v8, "setDisplayName:", [NSString stringWithCString:v7 encoding:1]);
      -[TDColorName setSelector:](v8, "setSelector:", [NSString stringWithCString:*v6 encoding:1]);

      uint64_t v9 = v6[3];
      v6 += 5;
    }
    while (v9);
  }
}

- (void)loadColorStatuses
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"ColorStatus");
  uint64_t v5 = *(void *)(MEMORY[0x263F38418] + 8);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (uint64_t *)(MEMORY[0x263F38418] + 32);
    do
    {
      uint64_t v8 = *(v7 - 2);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeConstant alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      -[TDThemeConstant setValue:forKey:](v9, "setValue:forKey:", [NSNumber numberWithInteger:*(v7 - 4)], @"identifier");
      -[TDThemeConstant setValue:forKey:](v9, "setValue:forKey:", [NSString stringWithCString:v8 encoding:1], @"displayName");
      -[TDThemeConstant setValue:forKey:](v9, "setValue:forKey:", [NSString stringWithCString:v5 encoding:1], @"constantName");

      uint64_t v10 = *v7;
      v7 += 3;
      uint64_t v5 = v10;
    }
    while (v10);
  }
}

- (void)loadMetafontSelectors
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"MetafontSelector");
  uint64_t v5 = *(void *)(MEMORY[0x263F38438] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38438];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeConstant alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadMetafontSizes
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"MetafontSizeSelector");
  uint64_t v5 = *(void *)(MEMORY[0x263F38440] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (uint64_t *)MEMORY[0x263F38440];
    do
    {
      uint64_t v8 = v7[1];
      if (!v8) {
        break;
      }
      uint64_t v9 = *v7;
      id v10 = [(CoreThemeDocument *)self->_doc sizeWithIdentifier:*v7];
      long long v11 = [[TDMetafontSizeSelector alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      -[TDMetafontSizeSelector setIdentifier:](v11, "setIdentifier:", [NSNumber numberWithInteger:v9]);
      [(TDMetafontSizeSelector *)v11 setControlSize:v10];
      -[TDMetafontSizeSelector setSelectorName:](v11, "setSelectorName:", [NSString stringWithCString:v8 encoding:1]);
      -[TDMetafontSizeSelector setDisplayName:](v11, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);

      uint64_t v5 = v7[5];
      v7 += 3;
    }
    while (v5);
  }
}

- (void)loadEffectConstants
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"EffectType");
  uint64_t v5 = *(void *)(MEMORY[0x263F38430] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (unsigned int *)MEMORY[0x263F38430];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDThemeConstant alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"EffectParameterType");
  uint64_t v11 = *(void *)(MEMORY[0x263F38428] + 16);
  if (v11)
  {
    uint64_t v12 = v10;
    id v13 = (unsigned int *)MEMORY[0x263F38428];
    do
    {
      uint64_t v14 = *((void *)v13 + 1);
      if (!v14) {
        break;
      }
      uint64_t v15 = [[TDThemeConstant alloc] initWithEntity:v12 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v15 setIdentifier:*v13];
      -[TDThemeConstant setDisplayName:](v15, "setDisplayName:", [NSString stringWithCString:v11 encoding:1]);
      -[TDThemeConstant setConstantName:](v15, "setConstantName:", [NSString stringWithCString:v14 encoding:1]);

      uint64_t v11 = *((void *)v13 + 5);
      v13 += 6;
    }
    while (v11);
  }
}

- (void)_loadConstantForEntity:(id)a3 withDescriptor:(const _themeconstant *)a4
{
  id v7 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", a3);
  if (a4->var2)
  {
    uint64_t v9 = (void *)v8;
    do
    {
      if (!a4->var1) {
        break;
      }
      uint64_t v10 = objc_msgSend(objc_alloc(NSClassFromString((NSString *)objc_msgSend(v9, "managedObjectClassName"))), "initWithEntity:insertIntoManagedObjectContext:", v9, v7);
      [v10 setIdentifier:LODWORD(a4->var0)];
      objc_msgSend(v10, "setDisplayName:", objc_msgSend(NSString, "stringWithCString:encoding:", a4->var2, 1));
      objc_msgSend(v10, "setConstantName:", objc_msgSend(NSString, "stringWithCString:encoding:", a4->var1, 1));

      var2 = a4[1].var2;
      ++a4;
    }
    while (var2);
  }
}

- (void)loadGlyphSizeConstants
{
}

- (void)loadGlyphWeightConstants
{
}

- (void)loadVectorGlyphRenderingModeConstants
{
}

- (void)loadTemplateRenderingModeConstants
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"RenderingMode");
  uint64_t v5 = *(void *)(MEMORY[0x263F384C8] + 16);
  if (v5)
  {
    uint64_t v6 = v4;
    id v7 = (unsigned int *)MEMORY[0x263F384C8];
    do
    {
      uint64_t v8 = *((void *)v7 + 1);
      if (!v8) {
        break;
      }
      uint64_t v9 = [[TDTemplateRenderingMode alloc] initWithEntity:v6 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v7];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:v5 encoding:1]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:v8 encoding:1]);

      uint64_t v5 = *((void *)v7 + 5);
      v7 += 6;
    }
    while (v5);
  }
}

- (void)loadStandardEffectDefinitions
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(CoreThemeDocument *)self->_doc allObjectsForEntity:@"SchemaEffectDefinition" withSortDescriptors:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  uint64_t v22 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v6 = (void *)[v5 parts];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              [(CoreThemeDocument *)self->_doc createEffectStyleProductionForPartDefinition:v11];
              char v12 = [v5 name];
              [v11 name];
              TDSchemaLog(&cfstr_CreatingCustom.isa, v13, v14, v15, v16, v17, v18, v19, v12);
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v8);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }
}

- (void)loadSchemaCategories
{
  id v3 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(-[CoreThemeDocument managedObjectModel](self->_doc, "managedObjectModel"), "entitiesByName"), "objectForKey:", @"SchemaCategory");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform")), "elementCategoryCount");
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = (unsigned int *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform")), "elementCategoryAtIndex:", i);
      uint64_t v9 = [[TDSchemaCategory alloc] initWithEntity:v4 insertIntoManagedObjectContext:v3];
      [(TDThemeConstant *)v9 setIdentifier:*v8];
      -[TDThemeConstant setDisplayName:](v9, "setDisplayName:", [NSString stringWithCString:*((void *)v8 + 2) encoding:4]);
      -[TDThemeConstant setConstantName:](v9, "setConstantName:", [NSString stringWithCString:*((void *)v8 + 1) encoding:4]);
    }
  }
}

- (void)loadSchemaDefinitions
{
  context = (void *)MEMORY[0x237DD6000](self, a2);
  id v3 = objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", -[CoreThemeDocument targetPlatform](self->_doc, "targetPlatform"));
  id v4 = [(TDPersistentDocument *)self->_doc managedObjectContext];
  uint64_t v5 = [MEMORY[0x263EFF240] entityForName:@"SchemaElementDefinition" inManagedObjectContext:v4];
  uint64_t v6 = [v3 elementDefinitionCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = (void *)[v3 elementDefinitionAtIndex:i];
      if (*v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = [[TDSchemaElementDefinition alloc] initWithEntity:v5 insertIntoManagedObjectContext:v4];
        -[TDSchemaElementDefinition setName:](v11, "setName:", [NSString stringWithCString:*v10 encoding:4]);
        [(TDSchemaElementDefinition *)v11 setPublished:*((unsigned __int8 *)v10 + 16)];
        [(TDSchemaElementDefinition *)v11 setCategory:[(CoreThemeDocument *)self->_doc schemaCategoryWithIdentifier:v10[3]]];
        [(TDThemeSchema *)self _addSchemaPartDefinitionsForStandardElement:v10 withElement:v11];
      }
    }
  }
  uint64_t v12 = [MEMORY[0x263EFF240] entityForName:@"SchemaEffectDefinition" inManagedObjectContext:v4];
  uint64_t v13 = [v3 effectDefinitionCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t j = 0; j != v14; ++j)
    {
      uint64_t v16 = (void *)[v3 effectDefinitionAtIndex:j];
      if (*v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = [[TDSchemaEffectDefinition alloc] initWithEntity:v12 insertIntoManagedObjectContext:v4];
        -[TDSchemaEffectDefinition setName:](v18, "setName:", [NSString stringWithCString:*v17 encoding:4]);
        [(TDSchemaEffectDefinition *)v18 setPublished:*((unsigned __int8 *)v17 + 16)];
        [(TDSchemaEffectDefinition *)v18 setCategory:[(CoreThemeDocument *)self->_doc schemaCategoryWithIdentifier:v17[3]]];
        [(TDThemeSchema *)self _addSchemaPartDefinitionsForStandardElement:v17 withElement:v18];
      }
    }
  }
  uint64_t v19 = [MEMORY[0x263EFF240] entityForName:@"SchemaMaterialDefinition" inManagedObjectContext:v4];
  uint64_t v20 = [v3 materialDefinitionCount];
  if (v20)
  {
    uint64_t v21 = v20;
    for (uint64_t k = 0; k != v21; ++k)
    {
      long long v23 = (void *)[v3 materialDefinitionAtIndex:k];
      if (*v23)
      {
        long long v24 = v23;
        long long v25 = [[TDSchemaMaterialDefinition alloc] initWithEntity:v19 insertIntoManagedObjectContext:v4];
        -[TDSchemaMaterialDefinition setName:](v25, "setName:", [NSString stringWithCString:*v24 encoding:4]);
        [(TDSchemaMaterialDefinition *)v25 setPublished:*((unsigned __int8 *)v24 + 16)];
        [(TDSchemaMaterialDefinition *)v25 setCategory:[(CoreThemeDocument *)self->_doc schemaCategoryWithIdentifier:v24[3]]];
        [(TDThemeSchema *)self _addSchemaPartDefinitionsForStandardElement:v24 withElement:v25];
      }
    }
  }
}

- (void)resetThemeConstants
{
  id v3 = (void *)MEMORY[0x237DD6000](self, a2);
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeSize" withPredicate:0])[(TDThemeSchema *)self loadThemeSizes]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeValue" withPredicate:0])[(TDThemeSchema *)self loadThemeValues];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeElement" withPredicate:0])[(TDThemeSchema *)self loadThemeElements]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemePart" withPredicate:0])[(TDThemeSchema *)self loadThemeParts];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeState" withPredicate:0])[(TDThemeSchema *)self loadThemeStates]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemePresentationState" withPredicate:0])[(TDThemeSchema *)self loadThemePresentationStates];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeDirection" withPredicate:0])[(TDThemeSchema *)self loadThemeDirections]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeDrawingLayer" withPredicate:0])[(TDThemeSchema *)self loadThemeDrawingLayers];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeIdiom" withPredicate:0])[(TDThemeSchema *)self loadThemeIdioms]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeDisplayGamut" withPredicate:0])[(TDThemeSchema *)self loadThemeDisplayGamuts];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeDeploymentTarget" withPredicate:0])[(TDThemeSchema *)self loadThemeDeploymentTargets]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeCompressionType" withPredicate:0])[(TDThemeSchema *)self loadThemeCompressionTypes];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"TexturePixelFormat" withPredicate:0])[(TDThemeSchema *)self loadTexturePixelFormats]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"TextureFace" withPredicate:0])[(TDThemeSchema *)self loadThemeTextureFaces];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"TextureInterpretation" withPredicate:0])[(TDThemeSchema *)self loadThemeTextureInterpretations]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeGraphicsFeatureSetClass" withPredicate:0])[(TDThemeSchema *)self loadThemeGraphicsFeatureSetClasses];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeUISizeClass" withPredicate:0])[(TDThemeSchema *)self loadThemeUISizeClasses]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"IterationType" withPredicate:0])[(TDThemeSchema *)self loadIterationTypes];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"RenditionType" withPredicate:0])[(TDThemeSchema *)self loadRenditionTypes]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"RenditionSubtype" withPredicate:0])[(TDThemeSchema *)self loadRenditionSubtypes];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ColorStatus" withPredicate:0])[(TDThemeSchema *)self loadColorStatuses]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"MetafontSelector" withPredicate:0])[(TDThemeSchema *)self loadMetafontSelectors];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"MetafontSizeSelector" withPredicate:0])[(TDThemeSchema *)self loadMetafontSizes]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ColorName" withPredicate:0])[(TDThemeSchema *)self loadColorNames];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"SchemaCategory" withPredicate:0])[(TDThemeSchema *)self loadSchemaCategories]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"SchemaElementDefinition" withPredicate:0])[(TDThemeSchema *)self loadSchemaDefinitions];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"EffectType" withPredicate:0])[(TDThemeSchema *)self loadEffectConstants]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"RenderingMode" withPredicate:0])[(TDThemeSchema *)self loadTemplateRenderingModeConstants];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeGlyphSize" withPredicate:0])[(TDThemeSchema *)self loadGlyphSizeConstants]; {
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"ThemeGlyphWeight" withPredicate:0])[(TDThemeSchema *)self loadGlyphWeightConstants];
  }
  if (![(CoreThemeDocument *)self->_doc countForEntity:@"VectorGlyphRenderingMode" withPredicate:0])[(TDThemeSchema *)self loadVectorGlyphRenderingModeConstants]; {
}
  }

@end