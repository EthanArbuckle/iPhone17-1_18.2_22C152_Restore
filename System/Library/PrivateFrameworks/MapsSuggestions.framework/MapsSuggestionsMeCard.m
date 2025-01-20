@interface MapsSuggestionsMeCard
- (BOOL)hasCorrected;
- (BOOL)hasGeocoded;
- (BOOL)hasHomeOrWork;
- (BOOL)hasHomeOrWorkOrSchool;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMeCard:(id)a3;
- (MapsSuggestionsMeCard)initWithShortcuts:(id)a3 hasCorrected:(BOOL)a4 hasGeocoded:(BOOL)a5;
- (MapsSuggestionsMeCard)initWithShortcuts:(id)a3 perCNPostalAddress:(id)a4 hasCorrected:(BOOL)a5 hasGeocoded:(BOOL)a6;
- (NSArray)hiddenShortcutsForHome;
- (NSArray)hiddenShortcutsForSchool;
- (NSArray)hiddenShortcutsForWork;
- (NSArray)mapItemsForAll;
- (NSArray)mapItemsForHome;
- (NSArray)mapItemsForSchool;
- (NSArray)mapItemsForWork;
- (NSArray)shortcutsForAll;
- (NSArray)shortcutsForAllIncludingHidden;
- (NSArray)shortcutsForHome;
- (NSArray)shortcutsForSchool;
- (NSArray)shortcutsForWork;
- (_BYTE)initWithHomes:(void *)a3 works:(void *)a4 schools:(void *)a5 hiddenHomes:(void *)a6 hiddenWorks:(void *)a7 hiddenSchools:(void *)a8 all:(void *)a9 allIncludingHidden:(void *)a10 perCNPostalAddress:(char)a11 hasCorrect:(char)a12 hasGeocoded:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortcutForCNPostalAddressIdentifier:(id)a3;
- (id)shortcutsPerCNPostalAddress;
@end

@implementation MapsSuggestionsMeCard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemsForAll, 0);
  objc_storeStrong((id *)&self->_mapItemsForSchool, 0);
  objc_storeStrong((id *)&self->_mapItemsForWork, 0);
  objc_storeStrong((id *)&self->_mapItemsForHome, 0);
  objc_storeStrong((id *)&self->_shortcutsForAllIncludingHidden, 0);
  objc_storeStrong((id *)&self->_shortcutsForAll, 0);
  objc_storeStrong((id *)&self->_hiddenShortcutsForSchool, 0);
  objc_storeStrong((id *)&self->_hiddenShortcutsForWork, 0);
  objc_storeStrong((id *)&self->_hiddenShortcutsForHome, 0);
  objc_storeStrong((id *)&self->_shortcutsForSchool, 0);
  objc_storeStrong((id *)&self->_shortcutsForWork, 0);
  objc_storeStrong((id *)&self->_shortcutsForHome, 0);
  objc_storeStrong((id *)&self->_perCNPostalAddress, 0);
}

- (_BYTE)initWithHomes:(void *)a3 works:(void *)a4 schools:(void *)a5 hiddenHomes:(void *)a6 hiddenWorks:(void *)a7 hiddenSchools:(void *)a8 all:(void *)a9 allIncludingHidden:(void *)a10 perCNPostalAddress:(char)a11 hasCorrect:(char)a12 hasGeocoded:
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v93 = a2;
  id v92 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  if (a1)
  {
    v94.receiver = a1;
    v94.super_class = (Class)MapsSuggestionsMeCard;
    v26 = objc_msgSendSuper2(&v94, sel_init);
    v27 = v26;
    if (v26)
    {
      id v87 = v24;
      v26[16] = a11;
      v26[17] = a12;
      uint64_t v28 = [v93 copy];
      v29 = (void *)*((void *)v27 + 3);
      *((void *)v27 + 3) = v28;

      uint64_t v30 = [v92 copy];
      v31 = (void *)*((void *)v27 + 4);
      *((void *)v27 + 4) = v30;

      id v91 = v19;
      uint64_t v32 = [v19 copy];
      v33 = (void *)*((void *)v27 + 5);
      *((void *)v27 + 5) = v32;

      id v90 = v20;
      uint64_t v34 = [v20 copy];
      v35 = (void *)*((void *)v27 + 6);
      *((void *)v27 + 6) = v34;

      id v89 = v21;
      uint64_t v36 = [v21 copy];
      v37 = (void *)*((void *)v27 + 7);
      *((void *)v27 + 7) = v36;

      id v88 = v22;
      uint64_t v38 = [v22 copy];
      v39 = (void *)*((void *)v27 + 8);
      *((void *)v27 + 8) = v38;

      uint64_t v40 = [v23 copy];
      v41 = (void *)*((void *)v27 + 9);
      *((void *)v27 + 9) = v40;

      objc_storeStrong((id *)v27 + 10, a9);
      uint64_t v42 = [v25 copy];
      v43 = (void *)*((void *)v27 + 1);
      *((void *)v27 + 1) = v42;

      id v44 = *((id *)v27 + 3);
      id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v46 = v44;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v95 objects:v99 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v96;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v96 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = [*(id *)(*((void *)&v95 + 1) + 8 * i) geoMapItem];
            if (v51) {
              [v45 addObject:v51];
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v95 objects:v99 count:16];
        }
        while (v48);
      }

      uint64_t v52 = [v45 copy];
      v53 = (void *)*((void *)v27 + 11);
      *((void *)v27 + 11) = v52;

      id v54 = *((id *)v27 + 4);
      id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v56 = v54;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v99 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v96;
        do
        {
          for (uint64_t j = 0; j != v58; ++j)
          {
            if (*(void *)v96 != v59) {
              objc_enumerationMutation(v56);
            }
            v61 = [*(id *)(*((void *)&v95 + 1) + 8 * j) geoMapItem];
            if (v61) {
              [v55 addObject:v61];
            }
          }
          uint64_t v58 = [v56 countByEnumeratingWithState:&v95 objects:v99 count:16];
        }
        while (v58);
      }

      uint64_t v62 = [v55 copy];
      v63 = (void *)*((void *)v27 + 12);
      *((void *)v27 + 12) = v62;

      id v64 = *((id *)v27 + 5);
      id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v66 = v64;
      uint64_t v67 = [v66 countByEnumeratingWithState:&v95 objects:v99 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v96;
        do
        {
          for (uint64_t k = 0; k != v68; ++k)
          {
            if (*(void *)v96 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = [*(id *)(*((void *)&v95 + 1) + 8 * k) geoMapItem];
            if (v71) {
              [v65 addObject:v71];
            }
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v95 objects:v99 count:16];
        }
        while (v68);
      }

      uint64_t v72 = [v65 copy];
      v73 = (void *)*((void *)v27 + 13);
      *((void *)v27 + 13) = v72;

      id v74 = *((id *)v27 + 9);
      id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v76 = v74;
      uint64_t v77 = [v76 countByEnumeratingWithState:&v95 objects:v99 count:16];
      id v19 = v91;
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = *(void *)v96;
        do
        {
          for (uint64_t m = 0; m != v78; ++m)
          {
            if (*(void *)v96 != v79) {
              objc_enumerationMutation(v76);
            }
            v81 = [*(id *)(*((void *)&v95 + 1) + 8 * m) geoMapItem];
            if (v81) {
              [v75 addObject:v81];
            }
          }
          uint64_t v78 = [v76 countByEnumeratingWithState:&v95 objects:v99 count:16];
        }
        while (v78);
      }

      uint64_t v82 = [v75 copy];
      v83 = (void *)*((void *)v27 + 14);
      *((void *)v27 + 14) = v82;

      if ([*((id *)v27 + 3) count]
        || [*((id *)v27 + 4) count]
        || [*((id *)v27 + 6) count])
      {
        BOOL v84 = 1;
        v27[18] = 1;
        id v21 = v89;
        id v20 = v90;
        id v24 = v87;
        id v22 = v88;
      }
      else
      {
        uint64_t v86 = [*((id *)v27 + 7) count];
        v27[18] = v86 != 0;
        id v21 = v89;
        id v20 = v90;
        id v24 = v87;
        id v22 = v88;
        BOOL v84 = v86 || [*((id *)v27 + 5) count] || objc_msgSend(*((id *)v27 + 8), "count") != 0;
      }
      v27[19] = v84;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 5 && objc_msgSend(v2, "isHidden")) {
    uint64_t v3 = [v2 isSetupPlaceholder] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 3 && objc_msgSend(v2, "isHidden")) {
    uint64_t v3 = [v2 isSetupPlaceholder] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 2 && objc_msgSend(v2, "isHidden")) {
    uint64_t v3 = [v2 isSetupPlaceholder] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 5 && (objc_msgSend(v2, "isHidden") & 1) == 0) {
    uint64_t v3 = [v2 isSetupPlaceholder] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 3 && (objc_msgSend(v2, "isHidden") & 1) == 0) {
    uint64_t v3 = [v2 isSetupPlaceholder] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (MapsSuggestionsMeCard)initWithShortcuts:(id)a3 perCNPostalAddress:(id)a4 hasCorrected:(BOOL)a5 hasGeocoded:(BOOL)a6
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_16);
  v10 = objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_18);
  v11 = objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_20);
  v12 = objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_22);
  v13 = objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_24);
  v14 = objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_26);
  v15 = objc_msgSend(v8, "MSg_copyIf:", &__block_literal_global_28);
  v16 = (void *)[v7 copy];

  v17 = (MapsSuggestionsMeCard *)-[MapsSuggestionsMeCard initWithHomes:works:schools:hiddenHomes:hiddenWorks:hiddenSchools:all:allIncludingHidden:perCNPostalAddress:hasCorrect:hasGeocoded:](self, v9, v10, v11, v12, v13, v14, v15, v8, v16, a5, a6);
  return v17;
}

- (MapsSuggestionsMeCard)initWithShortcuts:(id)a3 hasCorrected:(BOOL)a4 hasGeocoded:(BOOL)a5
{
  return [(MapsSuggestionsMeCard *)self initWithShortcuts:a3 perCNPostalAddress:0 hasCorrected:a4 hasGeocoded:a5];
}

uint64_t __87__MapsSuggestionsMeCard_initWithShortcuts_perCNPostalAddress_hasCorrected_hasGeocoded___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 2 && (objc_msgSend(v2, "isHidden") & 1) == 0) {
    uint64_t v3 = [v2 isSetupPlaceholder] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)shortcutsForAll
{
  return self->_shortcutsForAll;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v41 = [MapsSuggestionsMeCard alloc];
  shortcutsForHome = self->_shortcutsForHome;
  if (shortcutsForHome)
  {
    v5 = (objc_class *)MEMORY[0x1E4F1C978];
    v6 = shortcutsForHome;
    uint64_t v42 = (void *)[[v5 alloc] initWithArray:v6 copyItems:1];
  }
  else
  {
    uint64_t v42 = 0;
  }
  shortcutsForWoruint64_t k = self->_shortcutsForWork;
  if (shortcutsForWork)
  {
    id v8 = (objc_class *)MEMORY[0x1E4F1C978];
    v9 = shortcutsForWork;
    uint64_t v40 = (void *)[[v8 alloc] initWithArray:v9 copyItems:1];
  }
  else
  {
    uint64_t v40 = 0;
  }
  shortcutsForSchool = self->_shortcutsForSchool;
  if (shortcutsForSchool)
  {
    v11 = (objc_class *)MEMORY[0x1E4F1C978];
    v12 = shortcutsForSchool;
    v13 = (void *)[[v11 alloc] initWithArray:v12 copyItems:1];
  }
  else
  {
    v13 = 0;
  }
  hiddenShortcutsForHome = self->_hiddenShortcutsForHome;
  if (hiddenShortcutsForHome)
  {
    v15 = (objc_class *)MEMORY[0x1E4F1C978];
    v16 = hiddenShortcutsForHome;
    v17 = (void *)[[v15 alloc] initWithArray:v16 copyItems:1];
  }
  else
  {
    v17 = 0;
  }
  hiddenShortcutsForWoruint64_t k = self->_hiddenShortcutsForWork;
  if (hiddenShortcutsForWork)
  {
    id v19 = (objc_class *)MEMORY[0x1E4F1C978];
    id v20 = hiddenShortcutsForWork;
    id v21 = (void *)[[v19 alloc] initWithArray:v20 copyItems:1];
  }
  else
  {
    id v21 = 0;
  }
  hiddenShortcutsForSchool = self->_hiddenShortcutsForSchool;
  if (hiddenShortcutsForSchool)
  {
    id v23 = (objc_class *)MEMORY[0x1E4F1C978];
    id v24 = hiddenShortcutsForSchool;
    id v25 = (void *)[[v23 alloc] initWithArray:v24 copyItems:1];
  }
  else
  {
    id v25 = 0;
  }
  shortcutsForAll = self->_shortcutsForAll;
  if (shortcutsForAll)
  {
    v27 = (objc_class *)MEMORY[0x1E4F1C978];
    uint64_t v28 = shortcutsForAll;
    v29 = (void *)[[v27 alloc] initWithArray:v28 copyItems:1];
  }
  else
  {
    v29 = 0;
  }
  shortcutsForAllIncludingHidden = self->_shortcutsForAllIncludingHidden;
  if (shortcutsForAllIncludingHidden)
  {
    v31 = (objc_class *)MEMORY[0x1E4F1C978];
    uint64_t v32 = shortcutsForAllIncludingHidden;
    v33 = (void *)[[v31 alloc] initWithArray:v32 copyItems:1];
  }
  else
  {
    v33 = 0;
  }
  perCNPostalAddress = self->_perCNPostalAddress;
  if (perCNPostalAddress)
  {
    v35 = (objc_class *)MEMORY[0x1E4F1C9E8];
    uint64_t v36 = perCNPostalAddress;
    v37 = (void *)[[v35 alloc] initWithDictionary:v36 copyItems:1];
  }
  else
  {
    v37 = 0;
  }
  uint64_t v38 = -[MapsSuggestionsMeCard initWithHomes:works:schools:hiddenHomes:hiddenWorks:hiddenSchools:all:allIncludingHidden:perCNPostalAddress:hasCorrect:hasGeocoded:](v41, v42, v40, v13, v17, v21, v25, v29, v33, v37, *(_WORD *)&self->_hasCorrected, HIBYTE(*(_WORD *)&self->_hasCorrected));

  return v38;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MapsSuggestionsMeCard *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MapsSuggestionsMeCard *)self isEqualToMeCard:v4];
  }

  return v5;
}

- (id)shortcutsPerCNPostalAddress
{
  return self->_perCNPostalAddress;
}

- (id)shortcutForCNPostalAddressIdentifier:(id)a3
{
  if (a3)
  {
    v4 = -[NSDictionary objectForKeyedSubscript:](self->_perCNPostalAddress, "objectForKeyedSubscript:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isEqualToMeCard:(id)a3
{
  v4 = (MapsSuggestionsMeCard *)a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_22;
  }
  if (self == v4) {
    goto LABEL_21;
  }
  if (self->_hasCorrected != v4->_hasCorrected) {
    goto LABEL_22;
  }
  if (self->_hasGeocoded != v4->_hasGeocoded) {
    goto LABEL_22;
  }
  shortcutsForHome = self->_shortcutsForHome;
  if (shortcutsForHome != v5->_shortcutsForHome && !-[NSArray isEqualToArray:](shortcutsForHome, "isEqualToArray:")) {
    goto LABEL_22;
  }
  if (((shortcutsForWoruint64_t k = self->_shortcutsForWork, shortcutsForWork == v5->_shortcutsForWork)
     || -[NSArray isEqualToArray:](shortcutsForWork, "isEqualToArray:"))
    && ((shortcutsForSchool = self->_shortcutsForSchool, shortcutsForSchool == v5->_shortcutsForSchool)
     || -[NSArray isEqualToArray:](shortcutsForSchool, "isEqualToArray:"))
    && ((hiddenShortcutsForHome = self->_hiddenShortcutsForHome, hiddenShortcutsForHome == v5->_hiddenShortcutsForHome)
     || -[NSArray isEqualToArray:](hiddenShortcutsForHome, "isEqualToArray:"))
    && ((hiddenShortcutsForWoruint64_t k = self->_hiddenShortcutsForWork, hiddenShortcutsForWork == v5->_hiddenShortcutsForWork)
     || -[NSArray isEqualToArray:](hiddenShortcutsForWork, "isEqualToArray:"))
    && ((hiddenShortcutsForSchool = self->_hiddenShortcutsForSchool,
         hiddenShortcutsForSchool == v5->_hiddenShortcutsForSchool)
     || -[NSArray isEqualToArray:](hiddenShortcutsForSchool, "isEqualToArray:"))
    && ((shortcutsForAllIncludingHidden = self->_shortcutsForAllIncludingHidden,
         shortcutsForAllIncludingHidden == v5->_shortcutsForAllIncludingHidden)
     || -[NSArray isEqualToArray:](shortcutsForAllIncludingHidden, "isEqualToArray:"))
    && ((perCNPostalAddress = self->_perCNPostalAddress, perCNPostalAddress == v5->_perCNPostalAddress)
     || -[NSDictionary isEqualToDictionary:](perCNPostalAddress, "isEqualToDictionary:")))
  {
LABEL_21:
    BOOL v14 = 1;
  }
  else
  {
LABEL_22:
    BOOL v14 = 0;
  }

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self->_hasCorrected) {
    v4 = "M";
  }
  else {
    v4 = "";
  }
  if (self->_hasGeocoded) {
    BOOL v5 = "G";
  }
  else {
    BOOL v5 = "";
  }
  v6 = (void *)[v3 initWithFormat:@"MECARD{%s%s} %u Homes (+%u), %u Works (+%u), %u Schools (+%u), %u total", v4, v5, -[NSArray count](self->_shortcutsForHome, "count"), -[NSArray count](self->_hiddenShortcutsForHome, "count"), -[NSArray count](self->_shortcutsForWork, "count"), -[NSArray count](self->_hiddenShortcutsForWork, "count"), -[NSArray count](self->_shortcutsForSchool, "count"), -[NSArray count](self->_hiddenShortcutsForSchool, "count"), -[NSArray count](self->_shortcutsForAllIncludingHidden, "count")];
  return v6;
}

- (NSArray)shortcutsForHome
{
  return self->_shortcutsForHome;
}

- (NSArray)shortcutsForWork
{
  return self->_shortcutsForWork;
}

- (NSArray)shortcutsForSchool
{
  return self->_shortcutsForSchool;
}

- (NSArray)hiddenShortcutsForHome
{
  return self->_hiddenShortcutsForHome;
}

- (NSArray)hiddenShortcutsForWork
{
  return self->_hiddenShortcutsForWork;
}

- (NSArray)hiddenShortcutsForSchool
{
  return self->_hiddenShortcutsForSchool;
}

- (NSArray)shortcutsForAllIncludingHidden
{
  return self->_shortcutsForAllIncludingHidden;
}

- (NSArray)mapItemsForHome
{
  return self->_mapItemsForHome;
}

- (NSArray)mapItemsForWork
{
  return self->_mapItemsForWork;
}

- (NSArray)mapItemsForSchool
{
  return self->_mapItemsForSchool;
}

- (NSArray)mapItemsForAll
{
  return self->_mapItemsForAll;
}

- (BOOL)hasCorrected
{
  return self->_hasCorrected;
}

- (BOOL)hasGeocoded
{
  return self->_hasGeocoded;
}

- (BOOL)hasHomeOrWork
{
  return self->_hasHomeOrWork;
}

- (BOOL)hasHomeOrWorkOrSchool
{
  return self->_hasHomeOrWorkOrSchool;
}

@end