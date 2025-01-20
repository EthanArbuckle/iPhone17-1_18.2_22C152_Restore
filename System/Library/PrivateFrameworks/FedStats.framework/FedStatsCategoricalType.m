@interface FedStatsCategoricalType
+ (id)createFromDict:(id)a3 possibleError:(id *)a4;
- (FedStatsCategoricalType)initWithCategories:(id)a3;
- (FedStatsCategoricalType)initWithCategoryFile:(id)a3;
- (FedStatsCategoricalType)initWithCategoryMap:(id)a3 categories:(id)a4;
- (FedStatsCategoricalType)initWithPrefixSize:(id)a3 fragmentSize:(id)a4 prefixTree:(id)a5 filters:(id)a6 tokenizer:(id)a7 preEncoder:(id)a8;
- (FedStatsCategoricalTypePreEncoderProtocol)preEncoder;
- (FedStatsCategoricalTypeTokenizerProtocol)tokenizer;
- (FedStatsSQLiteCategoryDatabase)categoryFile;
- (NSArray)categories;
- (NSArray)filters;
- (NSDictionary)categoryMap;
- (NSNumber)fragmentSize;
- (NSNumber)prefixSize;
- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4;
- (id)encodeToIndex:(id)a3 possibleError:(id *)a4;
- (id)kOutOfCategories;
- (id)sampleForIndex:(unint64_t)a3;
- (int64_t)dataType;
- (unint64_t)version;
- (void)setVersion:(unint64_t)a3;
@end

@implementation FedStatsCategoricalType

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
  categories = self->_categories;
  self->_categories = 0;

  categoryMap = self->_categoryMap;
  self->_categoryMap = 0;

  categoryFile = self->_categoryFile;
  self->_categoryFile = 0;

  preEncoder = self->_preEncoder;
  self->_preEncoder = 0;

  filters = self->_filters;
  self->_filters = 0;

  prefixSize = self->_prefixSize;
  self->_prefixSize = 0;

  fragmentSize = self->_fragmentSize;
  self->_fragmentSize = 0;
}

- (FedStatsCategoricalType)initWithCategories:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalType;
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, sel_initWithBound_, [v5 count]);
  v7 = v6;
  if (v6)
  {
    [(FedStatsCategoricalType *)v6 setVersion:1];
    objc_storeStrong((id *)&v7->_categories, a3);
  }

  return v7;
}

- (FedStatsCategoricalType)initWithCategoryMap:(id)a3 categories:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsCategoricalType;
  objc_super v9 = -[FedStatsBoundedULongType initWithBound:](&v12, sel_initWithBound_, [v8 count]);
  v10 = v9;
  if (v9)
  {
    [(FedStatsCategoricalType *)v9 setVersion:2];
    objc_storeStrong((id *)&v10->_categoryMap, a3);
    objc_storeStrong((id *)&v10->_categories, a4);
  }

  return v10;
}

- (FedStatsCategoricalType)initWithCategoryFile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalType;
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, sel_initWithBound_, [v5 dimensionality]);
  id v7 = v6;
  if (v6)
  {
    [(FedStatsCategoricalType *)v6 setVersion:3];
    objc_storeStrong((id *)&v7->_categoryFile, a3);
  }

  return v7;
}

- (FedStatsCategoricalType)initWithPrefixSize:(id)a3 fragmentSize:(id)a4 prefixTree:(id)a5 filters:(id)a6 tokenizer:(id)a7 preEncoder:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v24 = a6;
  id v23 = a7;
  id v21 = a8;
  if (v16) {
    uint64_t v17 = objc_msgSend(v16, "dimensionality", v21, v23, v24, v25);
  }
  else {
    uint64_t v17 = 1;
  }
  v26.receiver = self;
  v26.super_class = (Class)FedStatsCategoricalType;
  v18 = -[FedStatsBoundedULongType initWithBound:](&v26, sel_initWithBound_, (v17 << objc_msgSend(v15, "unsignedIntegerValue", v21)) + 1);
  v19 = v18;
  if (v18)
  {
    [(FedStatsCategoricalType *)v18 setVersion:4];
    objc_storeStrong((id *)&v19->_categoryFile, a5);
    objc_storeStrong((id *)&v19->_prefixSize, a3);
    objc_storeStrong((id *)&v19->_fragmentSize, a4);
    objc_storeStrong((id *)&v19->_filters, a6);
    objc_storeStrong((id *)&v19->_tokenizer, a7);
    objc_storeStrong((id *)&v19->_preEncoder, a8);
  }

  return v19;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  v150[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 objectForKey:@"categories"];

  id v7 = [v5 objectForKey:@"categoryMap"];

  id v8 = [v5 objectForKey:@"categoryFile"];

  objc_super v9 = [v5 objectForKey:@"prefixSize"];

  if (v7) {
    int v10 = (v6 != 0) + 1;
  }
  else {
    int v10 = v6 != 0;
  }
  if (v8) {
    ++v10;
  }
  if (v9) {
    ++v10;
  }
  if (v10 != 1)
  {
    if (a4)
    {
      v22 = a4;
      v150[0] = @"categories";
      v150[1] = @"categoryMap";
      v150[2] = @"categoryFile";
      v150[3] = @"prefixTreeParameters";
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:4];
      id v23 = NSString;
      id v24 = [v11 componentsJoinedByString:@", "];
      id v25 = [v23 stringWithFormat:@"You're allowed to have exactly one of {%@} as key in parameters", v24];
      id *v22 = +[FedStatsError errorWithCode:301 description:v25];

      goto LABEL_23;
    }
LABEL_81:
    id v21 = 0;
    goto LABEL_102;
  }
  v118 = a4;
  if (v6)
  {
    objc_super v12 = v11 = [v5 objectForKey:@"categories"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v141 objects:v149 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v142;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v142 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v118)
              {
                id *v118 = +[FedStatsError errorWithCode:302 description:v12];
              }

              goto LABEL_58;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v141 objects:v149 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      v18 = [MEMORY[0x263EFFA08] setWithArray:v13];
      uint64_t v19 = [v18 count];
      uint64_t v20 = [v13 count];

      if (v19 == v20)
      {
        id v21 = (void *)[objc_alloc((Class)a1) initWithCategories:v13];
        goto LABEL_59;
      }
    }
    v49 = v118;
    goto LABEL_53;
  }
  if (!v7)
  {
    v49 = a4;
    if (v8)
    {
      objc_super v12 = v11 = [v5 objectForKey:@"categoryFile"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v50 = [v5 objectForKey:@"minIndex"];
        v51 = v50;
        if (v50) {
          uint64_t v52 = [v50 unsignedIntegerValue];
        }
        else {
          uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v61 = [v5 objectForKey:@"maxIndex"];
        v62 = v61;
        if (v61) {
          uint64_t v63 = [v61 unsignedIntegerValue];
        }
        else {
          uint64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
        }
        id v128 = 0;
        v64 = +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:v11 minIndex:v52 maxIndex:v63 checkForPrimaryKey:1 error:&v128];
        id v65 = v128;
        if (v64)
        {
          id v21 = (void *)[objc_alloc((Class)a1) initWithCategoryFile:v64];
        }
        else if (v118)
        {
          +[FedStatsError errorWithCode:302 underlyingError:v65 description:@"Cannot create database from the provided URL"];
          id v21 = 0;
          id *v118 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v21 = 0;
        }

        goto LABEL_59;
      }
LABEL_53:
      if (v49)
      {
        +[FedStatsError errorWithCode:302 description:v12];
        id v21 = 0;
        id *v49 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
LABEL_58:
      id v21 = 0;
      goto LABEL_59;
    }
    if (v9)
    {
      v53 = [v5 objectForKey:@"prefixSize"];
      v11 = v53;
      if (v53 && ([v53 integerValue] & 0x8000000000000000) == 0)
      {
        v54 = [v5 objectForKey:@"fragmentSize"];
        objc_super v12 = v54;
        if (!v54 || [v54 integerValue] <= 0)
        {
          if (v118) {
            v69 = {;
          }
            id *v118 = +[FedStatsError errorWithCode:101 description:v69];
          }
          goto LABEL_58;
        }
        if ([v11 unsignedIntegerValue])
        {
          v55 = [v5 objectForKey:@"prefixTreeParameters"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v118) {
              v87 = {;
            }
              id *v118 = +[FedStatsError errorWithCode:302 description:v87];
            }
            goto LABEL_146;
          }
          v56 = [v55 objectForKey:@"fileName"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v118)
            {
LABEL_145:

LABEL_146:
              goto LABEL_58;
            v59 = };
            id *v118 = +[FedStatsError errorWithCode:302 description:v59];
LABEL_144:

            goto LABEL_145;
          }
          id v127 = 0;
          v57 = +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:v56 minIndex:0 maxIndex:0x7FFFFFFFFFFFFFFFLL checkForPrimaryKey:0 error:&v127];
          id v58 = v127;
          v59 = v58;
          if (v118 && !v57)
          {
            id *v118 = +[FedStatsError errorWithCode:302 underlyingError:v58 description:@"Cannot load prefix tree as database"];
            goto LABEL_144;
          }

          if (!v57) {
            goto LABEL_58;
          }
        }
        else
        {
          v57 = 0;
        }
        v70 = [v5 objectForKey:@"filters"];
        if (v70)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v118) {
              v117 = {;
            }
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101);
              id v21 = 0;
              id *v118 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v21 = 0;
            }
            goto LABEL_202;
          }
        }
        v116 = [MEMORY[0x263EFF980] array];
        v106 = v11;
        if (v70)
        {
          id obja = v70;
          long long v125 = 0u;
          long long v126 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          id v112 = v70;
          uint64_t v71 = [v112 countByEnumeratingWithState:&v123 objects:v145 count:16];
          if (v71)
          {
            uint64_t v72 = v71;
            uint64_t v73 = *(void *)v124;
            do
            {
              for (uint64_t j = 0; j != v72; ++j)
              {
                if (*(void *)v124 != v73) {
                  objc_enumerationMutation(v112);
                }
                v75 = *(void **)(*((void *)&v123 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v70 = obja;
                  if (v118) {
                    v76 = {;
                  }
                    id *v118 = +[FedStatsError errorWithCode:101 description:v76];
                    goto LABEL_181;
                  }
                  goto LABEL_182;
                }
                v76 = [v75 objectForKey:@"filterVariant"];
                if (v76)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v118) {
                      v78 = {;
                    }
                      id *v118 = +[FedStatsError errorWithCode:101 description:v78];
                      goto LABEL_180;
                    }
                    v70 = obja;
                    goto LABEL_181;
                  }
                  uint64_t v77 = [v75 objectForKey:@"filterParameters"];
                  if (v77) {
                    v78 = (void *)v77;
                  }
                  else {
                    v78 = (void *)MEMORY[0x263EFFA78];
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (v118)
                    {
                      id v80 = (id)objc_claimAutoreleasedReturnValue();
                      v97 = +[FedStatsError errorWithCode:101 description:v80];
                      goto LABEL_178;
                    }
LABEL_180:
                    v70 = obja;

LABEL_181:
LABEL_182:

                    id v21 = 0;
                    v11 = v106;
LABEL_201:

LABEL_202:
LABEL_59:

                    goto LABEL_101;
                  }
                  id v122 = 0;
                  v79 = +[FedStatsCategoricalTypeFilterFactory filterForVariant:v76 parameters:v78 error:&v122];
                  id v80 = v122;
                  if (!v79)
                  {
                    if (v118)
                    {
                      v97 = +[FedStatsError errorWithCode:101 underlyingError:v80 description:@"Cannot create filter with given parameters"];
LABEL_178:
                      id *v118 = v97;
                    }

                    goto LABEL_180;
                  }
                  [v116 addObject:v79];
                }
                v11 = v106;
              }
              uint64_t v72 = [v112 countByEnumeratingWithState:&v123 objects:v145 count:16];
            }
            while (v72);
          }

          v49 = v118;
          v70 = obja;
        }
        v81 = [v5 objectForKey:@"tokenizerVariant"];
        if (v81)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v82 = [v5 objectForKey:@"tokenizerParameters"];
            if (v82) {
              v83 = (void *)v82;
            }
            else {
              v83 = (void *)MEMORY[0x263EFFA78];
            }
            objc_opt_class();
            id v113 = v83;
            if (objc_opt_isKindOfClass())
            {
              id v121 = 0;
              uint64_t v84 = +[FedStatsCategoricalTypeTokenizerFactory tokenizerForVariant:v81 parameters:v83 error:&v121];
              id v85 = v121;
              v86 = v85;
              if (v84)
              {

                id v114 = (id)v84;
                goto LABEL_152;
              }
              if (v49)
              {
                id *v118 = +[FedStatsError errorWithCode:101 underlyingError:v85 description:@"Cannot create tokenizer with given parameters"];
              }

              id v21 = 0;
              v11 = v106;
            }
            else
            {
              if (v49) {
                v96 = {;
              }
                id *v118 = +[FedStatsError errorWithCode:101 description:v96];
              }
              id v21 = 0;
            }
            v95 = v113;
          }
          else
          {
            if (!v49)
            {
              id v21 = 0;
LABEL_200:

              goto LABEL_201;
            }
            v95 = v94 = v49;
            +[FedStatsError errorWithCode:101 description:v95];
            id v21 = 0;
            id *v94 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_199:

          goto LABEL_200;
        }
        id v114 = 0;
LABEL_152:
        v88 = [v5 objectForKey:@"preEncodingVariant"];
        if (!v88)
        {
          v90 = 0;
          goto LABEL_166;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v49)
          {
            id v21 = 0;
            v95 = v114;
LABEL_198:

            v11 = v106;
            goto LABEL_199;
          v90 = };
          +[FedStatsError errorWithCode:101 description:v90];
          id v21 = 0;
          id *v118 = (id)objc_claimAutoreleasedReturnValue();
          v95 = v114;
LABEL_197:

          goto LABEL_198;
        }
        id objb = v70;
        uint64_t v89 = [v5 objectForKey:@"preEncodingParameters"];
        if (v89) {
          v90 = (void *)v89;
        }
        else {
          v90 = (void *)MEMORY[0x263EFFA78];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v120 = 0;
          uint64_t v91 = +[FedStatsCategoricalTypePreEncoderFactory preEncoderForVariant:v88 parameters:v90 error:&v120];
          id v92 = v120;
          v93 = v92;
          if (v91)
          {

            v90 = (void *)v91;
            v70 = objb;
LABEL_166:
            v95 = v114;
            id v21 = (void *)[objc_alloc((Class)a1) initWithPrefixSize:v106 fragmentSize:v12 prefixTree:v57 filters:v116 tokenizer:v114 preEncoder:v90];
            goto LABEL_197;
          }
          if (!v118) {
            goto LABEL_195;
          }
          v98 = +[FedStatsError errorWithCode:101 underlyingError:v92 description:@"Cannot create pre-encoder with given parameters"];
        }
        else
        {
          if (!v118)
          {
LABEL_196:
            id v21 = 0;
            v70 = objb;
            v95 = v114;
            goto LABEL_197;
          v93 = };
          v98 = +[FedStatsError errorWithCode:101 description:v93];
        }
        id *v118 = v98;
LABEL_195:

        goto LABEL_196;
      }
      if (v118) {
        v60 = {;
      }
        id *v118 = +[FedStatsError errorWithCode:101 description:v60];
      }
LABEL_23:
      id v21 = 0;
      goto LABEL_101;
    }
    goto LABEL_81;
  }
  v11 = [v5 objectForKey:@"categoryMap"];
  objc_super v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v118)
    {
      +[FedStatsError errorWithCode:302 description:v26];
      id v21 = 0;
      id *v118 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_100;
    }
    goto LABEL_69;
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v27 = v11;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v137 objects:v148 count:16];
  if (!v28) {
    goto LABEL_34;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v138;
  do
  {
    for (uint64_t k = 0; k != v29; ++k)
    {
      if (*(void *)v138 != v30) {
        objc_enumerationMutation(v27);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v118)
        {
          id *v118 = +[FedStatsError errorWithCode:302 description:v26];
        }

LABEL_69:
        id v21 = 0;
        goto LABEL_100;
      }
    }
    uint64_t v29 = [v27 countByEnumeratingWithState:&v137 objects:v148 count:16];
  }
  while (v29);
LABEL_34:

  v32 = [v27 allKeys];
  v33 = [v32 sortedArrayUsingSelector:sel_compare_];

  v107 = [MEMORY[0x263EFF9A0] dictionary];
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v34 = v33;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v133 objects:v147 count:16];
  if (!v35) {
    goto LABEL_51;
  }
  uint64_t v115 = 0;
  uint64_t v36 = *(void *)v134;
  v104 = v34;
  v105 = v11;
  uint64_t v99 = *(void *)v134;
LABEL_36:
  uint64_t v37 = 0;
  v38 = v118;
  uint64_t v100 = v35;
LABEL_37:
  if (*(void *)v134 != v36) {
    objc_enumerationMutation(v34);
  }
  uint64_t v101 = v37;
  id v111 = *(id *)(*((void *)&v133 + 1) + 8 * v37);
  v39 = objc_msgSend(v27, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    v103 = v39;
    obuint64_t j = v39;
    uint64_t v40 = [obj countByEnumeratingWithState:&v129 objects:v146 count:16];
    if (!v40) {
      goto LABEL_49;
    }
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v130;
    v102 = v26;
LABEL_42:
    uint64_t v43 = 0;
    while (1)
    {
      if (*(void *)v130 != v42) {
        objc_enumerationMutation(obj);
      }
      uint64_t v44 = *(void *)(*((void *)&v129 + 1) + 8 * v43);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      v45 = [v107 allKeys];
      int v46 = [v45 containsObject:v44];

      if (v46)
      {
        id v34 = v104;
        v11 = v105;
        v66 = v118;
        objc_super v26 = v102;
        v39 = v103;
        if (v118)
        {
          v67 = @"Subcategories must be distinct";
LABEL_96:
          id *v66 = +[FedStatsError errorWithCode:302 description:v67];
        }
        goto LABEL_97;
      }
      v47 = +[FedStatsCategoricalTypeSubcategory categoryWithSuperCategory:v111 index:v115];
      [v107 setObject:v47 forKey:v44];

      if (v41 == ++v43)
      {
        uint64_t v41 = [obj countByEnumeratingWithState:&v129 objects:v146 count:16];
        v38 = v118;
        objc_super v26 = v102;
        if (v41) {
          goto LABEL_42;
        }
LABEL_49:

        ++v115;
        uint64_t v37 = v101 + 1;
        id v34 = v104;
        v11 = v105;
        uint64_t v36 = v99;
        if (v101 + 1 == v100)
        {
          uint64_t v35 = [v104 countByEnumeratingWithState:&v133 objects:v147 count:16];
          if (!v35)
          {
LABEL_51:

            v48 = v107;
            id v21 = (void *)[objc_alloc((Class)a1) initWithCategoryMap:v107 categories:v34];
            goto LABEL_99;
          }
          goto LABEL_36;
        }
        goto LABEL_37;
      }
    }
    id v34 = v104;
    v11 = v105;
    v66 = v118;
    objc_super v26 = v102;
    v39 = v103;
    if (v118)
    {
      v67 = v102;
      goto LABEL_96;
    }
LABEL_97:

    goto LABEL_98;
  }
  if (v38)
  {
    id *v38 = +[FedStatsError errorWithCode:302 description:v26];
  }
LABEL_98:

  id v21 = 0;
  v48 = v107;
LABEL_99:

LABEL_100:
LABEL_101:

LABEL_102:
  return v21;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  switch([(FedStatsCategoricalType *)self version])
  {
    case 1uLL:
      id v7 = [(FedStatsCategoricalType *)self categories];
      uint64_t v8 = [v7 indexOfObject:v6];

      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_super v9 = &unk_27000ED28;
      }
      else
      {
        objc_super v9 = [NSNumber numberWithUnsignedInteger:v8 + 1];
      }
      goto LABEL_64;
    case 2uLL:
      int v10 = [(FedStatsCategoricalType *)self categoryMap];
      id v11 = [v10 objectForKey:v6];

      if (v11)
      {
        objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "index") + 1);
      }
      else
      {
        objc_super v9 = &unk_27000ED28;
      }
      goto LABEL_28;
    case 3uLL:
      objc_super v12 = [(FedStatsCategoricalType *)self categoryFile];
      id v55 = 0;
      objc_super v9 = [v12 encode:v6 error:&v55];
      id v11 = v55;

      if (v9)
      {
        id v13 = v9;
      }
      else if (a4)
      {
        *a4 = +[FedStatsError errorWithCode:401 underlyingError:v11 description:@"Error when encoding categorical type over database"];
      }

LABEL_28:
      goto LABEL_64;
    case 4uLL:
      v48 = a4;
      id v14 = v6;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v15 = [(FedStatsCategoricalType *)self filters];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (!v16) {
        goto LABEL_18;
      }
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v52;
      break;
    default:
      if (a4)
      {
        +[FedStatsError errorWithCode:900 description:@"The categorical type version is not supported"];
        objc_super v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v9 = 0;
      }
      goto LABEL_64;
  }
LABEL_12:
  uint64_t v20 = 0;
  uint64_t v21 = v18 + v17;
  v22 = v14;
  while (1)
  {
    if (*(void *)v52 != v19) {
      objc_enumerationMutation(v15);
    }
    id v14 = [*(id *)(*((void *)&v51 + 1) + 8 * v20) filter:v22];

    if (!v14) {
      break;
    }
    ++v20;
    v22 = v14;
    if (v17 == v20)
    {
      uint64_t v17 = [v15 countByEnumeratingWithState:&v51 objects:v57 count:16];
      uint64_t v18 = v21;
      if (v17) {
        goto LABEL_12;
      }
LABEL_18:

      id v23 = [(FedStatsCategoricalType *)self tokenizer];
      if (v23)
      {
        id v24 = [(FedStatsCategoricalType *)self tokenizer];
        id v25 = [v24 tokenize:v14];
      }
      else
      {
        id v56 = v14;
        id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
      }

      objc_super v26 = [(FedStatsCategoricalType *)self preEncoder];
      if (v26)
      {
        id v27 = [(FedStatsCategoricalType *)self preEncoder];
        uint64_t v28 = [v27 preEncode:v25];
      }
      else
      {
        uint64_t v28 = [v25 firstObject];
      }

      if (!v28)
      {
        if (v48)
        {
          +[FedStatsError errorWithCode:401 description:@"Data point cannot be tokenized and pre-encoded (not necessarily an error)"];
          objc_super v9 = 0;
          id *v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_super v9 = 0;
        }
        goto LABEL_61;
      }
      uint64_t v29 = [NSString stringWithFormat:@"%@", v28];
      uint64_t v30 = [(FedStatsCategoricalType *)self prefixSize];
      unint64_t v31 = [v30 unsignedIntegerValue];

      v32 = [(FedStatsCategoricalType *)self fragmentSize];
      uint64_t v33 = [v32 unsignedIntegerValue];

      if ([v29 length] <= v31)
      {
        if (v48)
        {
          +[FedStatsError errorWithCode:401 description:@"Pre-encoded data length shorter than prefix (not necessarily an error)"];
          objc_super v9 = 0;
          id *v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_super v9 = 0;
        }
        uint64_t v44 = v29;
        goto LABEL_60;
      }
      id v34 = [v29 stringByPaddingToLength:v33 + v31 withString:@"0" startingAtIndex:0];

      v47 = v34;
      if (v31)
      {
        uint64_t v35 = [v34 substringToIndex:v31];
        uint64_t v36 = [(FedStatsCategoricalType *)self categoryFile];
        id v50 = 0;
        uint64_t v37 = [v36 encode:v35 error:&v50];
        id v38 = v50;

        if (v37)
        {
          if ([v37 unsignedIntegerValue])
          {
            id v49 = v38;
            uint64_t v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v37, "unsignedIntegerValue") - 1);

            uint64_t v37 = (void *)v39;
            goto LABEL_46;
          }
          if (v48)
          {
            v45 = +[FedStatsError errorWithCode:401 description:@"Pre-encoded data does not match a prefix (not necessarily an error)"];
LABEL_55:
            uint64_t v41 = v37;
            uint64_t v44 = v47;
            objc_super v9 = 0;
            id *v48 = v45;
LABEL_59:

LABEL_60:
LABEL_61:

            uint64_t v15 = v14;
            goto LABEL_62;
          }
        }
        else if (v48)
        {
          v45 = +[FedStatsError errorWithCode:401 underlyingError:v38 description:@"Error when encoding prefix over prefix tree"];
          goto LABEL_55;
        }
        objc_super v9 = 0;
LABEL_57:
        uint64_t v41 = v37;
      }
      else
      {
        id v49 = 0;
        uint64_t v37 = &unk_27000ED28;
LABEL_46:
        uint64_t v40 = objc_msgSend(v47, "substringWithRange:", v31, v33);
        uint64_t v35 = +[FedStatsUtils bitStringToInt:v40];

        if (!v35)
        {
          objc_super v9 = 0;
          id v38 = v49;
          goto LABEL_57;
        }
        uint64_t v41 = v37;
        uint64_t v42 = [v37 unsignedIntegerValue] << v33;
        uint64_t v43 = [v35 unsignedIntegerValue];
        objc_super v9 = [NSNumber numberWithUnsignedInteger:v43 + v42 + 1];
        id v38 = v49;
      }
      uint64_t v44 = v47;
      goto LABEL_59;
    }
  }
  if (!v48)
  {
    objc_super v9 = 0;
    goto LABEL_63;
  }
  id v25 = objc_msgSend(NSString, "stringWithFormat:", @"Data point filtered out at Stage %lu (not necessarily an error)", v18 + v20);
  +[FedStatsError errorWithCode:401 description:v25];
  objc_super v9 = 0;
  id *v48 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:

LABEL_63:
LABEL_64:

  return v9;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4)
    {
      int v10 = @"The decoder can only work with a non-null number type";
      uint64_t v11 = 500;
LABEL_8:
      +[FedStatsError errorWithCode:v11 description:v10];
      objc_super v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    objc_super v9 = 0;
    goto LABEL_16;
  }
  unint64_t v7 = [(FedStatsCategoricalType *)self version];
  if (v7 - 1 < 2)
  {
    if ([v6 unsignedLongValue])
    {
      uint64_t v8 = [(FedStatsCategoricalType *)self categories];
      objc_super v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "unsignedLongValue") - 1);
    }
    else
    {
      objc_super v9 = [(FedStatsCategoricalType *)self kOutOfCategories];
    }
    goto LABEL_16;
  }
  if (v7 != 3)
  {
    if (a4)
    {
      int v10 = @"The categorical type version is not supported";
      uint64_t v11 = 900;
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  objc_super v12 = [(FedStatsCategoricalType *)self categoryFile];
  uint64_t v15 = 0;
  objc_super v9 = objc_msgSend(v12, "decode:error:", objc_msgSend(v6, "unsignedLongValue"), &v15);

  if (v9) {
    id v13 = v9;
  }

LABEL_16:
  return v9;
}

- (int64_t)dataType
{
  return 3;
}

- (id)kOutOfCategories
{
  return @"FedStatsCategoricalDataOutOfBounds";
}

- (id)sampleForIndex:(unint64_t)a3
{
  if (!a3)
  {
LABEL_6:
    unint64_t v7 = [(FedStatsCategoricalType *)self kOutOfCategories];
    goto LABEL_8;
  }
  unint64_t v5 = [(FedStatsCategoricalType *)self version];
  if (v5 == 3)
  {
LABEL_5:
    id v6 = [NSNumber numberWithUnsignedLong:a3];
    unint64_t v7 = [(FedStatsCategoricalType *)self decodeFromIndex:v6 possibleError:0];

    goto LABEL_8;
  }
  if (v5 != 2)
  {
    if (v5 == 1) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [(FedStatsCategoricalType *)self categoryMap];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__FedStatsCategoricalType_sampleForIndex___block_invoke;
  v10[3] = &unk_2653112D8;
  v10[4] = &v11;
  v10[5] = a3;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];

  unint64_t v7 = objc_msgSend((id)v12[5], "objectAtIndex:", arc4random_uniform(objc_msgSend((id)v12[5], "count")));
  _Block_object_dispose(&v11, 8);

LABEL_8:
  return v7;
}

void __42__FedStatsCategoricalType_sampleForIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v5 = *(void *)(a1 + 40) - 1;
  if (v5 == [a3 index]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
}

- (unint64_t)version
{
  return self->_version;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSDictionary)categoryMap
{
  return self->_categoryMap;
}

- (FedStatsSQLiteCategoryDatabase)categoryFile
{
  return self->_categoryFile;
}

- (NSArray)filters
{
  return self->_filters;
}

- (FedStatsCategoricalTypeTokenizerProtocol)tokenizer
{
  return self->_tokenizer;
}

- (FedStatsCategoricalTypePreEncoderProtocol)preEncoder
{
  return self->_preEncoder;
}

- (NSNumber)prefixSize
{
  return self->_prefixSize;
}

- (NSNumber)fragmentSize
{
  return self->_fragmentSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentSize, 0);
  objc_storeStrong((id *)&self->_prefixSize, 0);
  objc_storeStrong((id *)&self->_preEncoder, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_categoryFile, 0);
  objc_storeStrong((id *)&self->_categoryMap, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end