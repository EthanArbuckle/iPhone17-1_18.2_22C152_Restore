@interface CCSQLCommandGenerator
+ (id)_generateCommaSeparatedPlaceholdersString:(unint64_t)a3;
+ (id)_generateCommaSeparatedValuesString:(id)a3;
+ (id)_generateJoinClause:(id)a3;
+ (id)_generateOrderByClause:(id)a3;
+ (id)_produceCriterionClause:(id)a3 tableName:(id)a4;
+ (id)_produceJoinCriterionClause:(id)a3;
+ (id)_produceSelectClauseWithTableName:(id)a3 columnNames:(id)a4 count:(BOOL)a5;
+ (id)_produceSetValuesClauseForColumnNames:(id)a3 columnValues:(id)a4;
+ (id)_removeEndingSemicolonFromCommandString:(id)a3;
+ (id)deleteFromTableWithName:(id)a3 criterion:(id)a4 returningColumns:(id)a5;
+ (id)insertCommandStringWithTableName:(id)a3 columnNames:(id)a4 returningColumns:(id)a5 onConflict:(id)a6;
+ (id)prefixColumnName:(id)a3 withTableName:(id)a4;
+ (id)selectFromTableWithName:(id)a3 columns:(id)a4 count:(BOOL)a5 join:(id)a6 criterion:(id)a7 order:(id)a8 limit:(id)a9 offset:(id)a10;
+ (id)updateWithTableName:(id)a3 columnNames:(id)a4 columnValues:(id)a5 criterion:(id)a6 returningColumns:(id)a7;
+ (void)addLimit:(id)a3 offset:(id)a4 forSelect:(id)a5;
+ (void)replaceOffset:(id)a3 forSelect:(id)a4;
- (CCSQLCommandGenerator)init;
@end

@implementation CCSQLCommandGenerator

+ (id)insertCommandStringWithTableName:(id)a3 columnNames:(id)a4 returningColumns:(id)a5 onConflict:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [a6 type];
  if ((unint64_t)(v13 - 1) > 2) {
    v14 = @"INSERT INTO %@ (%@) VALUES (%@)";
  }
  else {
    v14 = off_26527A1D0[v13 - 1];
  }
  id v15 = [NSString alloc];
  v16 = [v11 componentsJoinedByString:@", "];
  uint64_t v17 = [v11 count];

  v18 = [a1 _generateCommaSeparatedPlaceholdersString:v17];
  v19 = objc_msgSend(v15, "initWithFormat:", v14, v12, v16, v18);

  if ([v10 count])
  {
    v20 = [v10 componentsJoinedByString:@", "];
    uint64_t v21 = [v19 stringByAppendingFormat:@" RETURNING %@", v20];

    v19 = (void *)v21;
  }
  v22 = [v19 stringByAppendingString:@";"];

  return v22;
}

+ (id)_produceJoinCriterionClause:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 subCriteria];
  unint64_t v6 = [v4 sqlOperator];
  if (v6 > 0x10)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (((1 << v6) & 0x1FBFD) != 0)
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CCSQLCommandGenerator _produceJoinCriterionClause:](v4, v7);
    }

    goto LABEL_6;
  }
  if (v6 == 1)
  {
    id v11 = [NSString alloc];
    id v12 = [v4 columnName];
    uint64_t v13 = [v4 tableName];
    v14 = [a1 prefixColumnName:v12 withTableName:v13];
    id v15 = [v4 comparingColumnName];
    v16 = [v4 comparingTableName];
    uint64_t v17 = [a1 prefixColumnName:v15 withTableName:v16];
    v8 = (void *)[v11 initWithFormat:@"%@ = %@", v14, v17];
  }
  else
  {
    id v30 = v4;
    uint64_t v18 = [v5 count];
    v19 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v18];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v29 = v5;
    id v20 = v5;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [a1 _produceJoinCriterionClause:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          if (v25)
          {
            id v26 = [NSString alloc];
            v27 = [v25 clause];
            v28 = (void *)[v26 initWithFormat:@"(%@)", v27];
            [v19 addObject:v28];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v22);
    }

    if ([v19 count])
    {
      v8 = [v19 componentsJoinedByString:@" AND "];
    }
    else
    {
      v8 = 0;
    }
    id v4 = v30;

    v5 = v29;
  }
LABEL_7:
  v9 = [[CCSQLCommandClause alloc] initWithClause:v8 parameters:0];

  return v9;
}

+ (id)_produceCriterionClause:(id)a3 tableName:(id)a4
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v113 = a4;
  if (v6)
  {
    v7 = [v6 columnName];
    v8 = [v6 tableName];
    v9 = [a1 prefixColumnName:v7 withTableName:v8];

    id v10 = [v6 comparingColumnName];
    id v11 = [v6 comparingTableName];
    id v12 = [a1 prefixColumnName:v10 withTableName:v11];

    uint64_t v13 = [v6 columnValues];
    v14 = [v6 subCriteria];
    v112 = [v6 subQuery];
    id v15 = objc_opt_new();
    switch([v6 sqlOperator])
    {
      case 1:
        v16 = v15;
        uint64_t v17 = [v6 comparingColumnName];

        id v18 = [NSString alloc];
        v19 = v18;
        if (!v17)
        {
          v37 = [a1 _generateCommaSeparatedPlaceholdersString:1];
          uint64_t v38 = [v19 initWithFormat:@"%@ = %@", v9, v37];
          goto LABEL_60;
        }
        id v20 = (void *)[v18 initWithFormat:@"%@ = %@", v9, v12];
        uint64_t v21 = v112;
        id v15 = v16;
        if (v20) {
          goto LABEL_69;
        }
        goto LABEL_58;
      case 2:
        id v23 = [NSString alloc];
        [a1 _generateCommaSeparatedPlaceholdersString:1];
        v25 = v24 = v15;
        uint64_t v26 = [v23 initWithFormat:@"%@ < %@", v9, v25];
        goto LABEL_11;
      case 3:
        id v27 = [NSString alloc];
        [a1 _generateCommaSeparatedPlaceholdersString:1];
        v25 = v24 = v15;
        uint64_t v26 = [v27 initWithFormat:@"%@ <= %@", v9, v25];
        goto LABEL_11;
      case 4:
        id v28 = [NSString alloc];
        [a1 _generateCommaSeparatedPlaceholdersString:1];
        v25 = v24 = v15;
        uint64_t v26 = [v28 initWithFormat:@"%@ >= %@", v9, v25];
LABEL_11:
        id v20 = (void *)v26;

        id v15 = v24;
        v29 = [v13 firstObject];
        [v24 addObject:v29];

        goto LABEL_68;
      case 5:
        id v30 = v15;
        id v31 = [NSString alloc];
        long long v32 = [a1 _generateCommaSeparatedPlaceholdersString:1];
        id v20 = (void *)[v31 initWithFormat:@"%@ MATCH %@", v113, v32];

        long long v33 = NSString;
        long long v34 = [v13 firstObject];
        v35 = [v33 stringWithFormat:@"%@ : %@", v9, v34];

        [v30 addObject:v35];
        id v15 = v30;
        goto LABEL_68;
      case 6:
        v16 = v15;
        id v36 = [NSString alloc];
        v37 = [a1 _generateCommaSeparatedPlaceholdersString:1];
        uint64_t v38 = [v36 initWithFormat:@"%@ != %@", v9, v37];
        goto LABEL_60;
      case 7:
        v39 = v15;
        id v40 = [NSString alloc];
        v41 = [a1 _generateCommaSeparatedPlaceholdersString:1];
        [a1 _generateCommaSeparatedPlaceholdersString:1];
        v43 = v42 = v14;
        v44 = v40;
        id v15 = v39;
        id v20 = (void *)[v44 initWithFormat:@"%@ BETWEEN (%@) AND (%@)", v9, v41, v43];

        v14 = v42;
        v45 = v39;
        goto LABEL_44;
      case 8:
        v111 = v12;
        v46 = v15;
        id v47 = [NSString alloc];
        uint64_t v21 = v112;
        if (v112)
        {
          v48 = [v112 commandString];
          [a1 _removeEndingSemicolonFromCommandString:v48];
          v50 = v49 = v14;
          id v20 = (void *)[v47 initWithFormat:@"%@ IN (%@)", v9, v50];

          v14 = v49;
          v51 = [v112 parameters];
LABEL_54:
          [v46 addObjectsFromArray:v51];

          id v15 = v46;
        }
        else
        {
          v101 = objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", objc_msgSend(v13, "count"));
          id v20 = (void *)[v47 initWithFormat:@"%@ IN (%@)", v9, v101];

          id v15 = v46;
          [v46 addObjectsFromArray:v13];
        }
LABEL_57:
        id v12 = v111;
        if (v20)
        {
LABEL_69:
          uint64_t v22 = [[CCSQLCommandClause alloc] initWithClause:v20 parameters:v15];
        }
        else
        {
LABEL_58:
          uint64_t v22 = 0;
        }
LABEL_70:

        break;
      case 9:
        v16 = v15;
        id v52 = [NSString alloc];
        v37 = [a1 _generateCommaSeparatedPlaceholdersString:1];
        uint64_t v38 = [v52 initWithFormat:@"%@ LIKE %@", v9, v37];
LABEL_60:
        id v20 = (void *)v38;

        v100 = [v13 firstObject];
        [v16 addObject:v100];

        id v15 = v16;
        goto LABEL_68;
      case 10:
        v53 = v12;
        v54 = v15;
        v109 = v13;
        v111 = v53;
        v105 = v9;
        id v106 = v6;
        uint64_t v55 = [v14 count];
        v56 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v55];
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        v107 = v14;
        id v57 = v14;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v118 objects:v123 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v119;
          do
          {
            for (uint64_t i = 0; i != v59; ++i)
            {
              if (*(void *)v119 != v60) {
                objc_enumerationMutation(v57);
              }
              v62 = [a1 _produceCriterionClause:*(void *)(*((void *)&v118 + 1) + 8 * i) tableName:v113];
              if (v62)
              {
                id v63 = [NSString alloc];
                v64 = [v62 clause];
                v65 = (void *)[v63 initWithFormat:@"(%@)", v64];
                [v56 addObject:v65];

                v66 = [v62 parameters];
                [v54 addObjectsFromArray:v66];
              }
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v118 objects:v123 count:16];
          }
          while (v59);
        }

        if (![v56 count]) {
          goto LABEL_55;
        }
        v67 = @" AND ";
        goto LABEL_40;
      case 11:
        v68 = v12;
        v54 = v15;
        v109 = v13;
        v111 = v68;
        v105 = v9;
        id v106 = v6;
        uint64_t v69 = [v14 count];
        v56 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v69];
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        v107 = v14;
        id v70 = v14;
        uint64_t v71 = [v70 countByEnumeratingWithState:&v114 objects:v122 count:16];
        if (v71)
        {
          uint64_t v72 = v71;
          uint64_t v73 = *(void *)v115;
          do
          {
            for (uint64_t j = 0; j != v72; ++j)
            {
              if (*(void *)v115 != v73) {
                objc_enumerationMutation(v70);
              }
              v75 = [a1 _produceCriterionClause:*(void *)(*((void *)&v114 + 1) + 8 * j) tableName:v113];
              if (v75)
              {
                id v76 = [NSString alloc];
                v77 = [v75 clause];
                v78 = (void *)[v76 initWithFormat:@"(%@)", v77];
                [v56 addObject:v78];

                v79 = [v75 parameters];
                [v54 addObjectsFromArray:v79];
              }
            }
            uint64_t v72 = [v70 countByEnumeratingWithState:&v114 objects:v122 count:16];
          }
          while (v72);
        }

        if ([v56 count])
        {
          v67 = @" OR ";
LABEL_40:
          id v20 = [v56 componentsJoinedByString:v67];
        }
        else
        {
LABEL_55:
          id v20 = 0;
        }
        v9 = v105;
        v14 = v107;
        uint64_t v13 = v109;
        uint64_t v21 = v112;
        id v15 = v54;

        id v6 = v106;
        goto LABEL_57;
      case 12:
        v80 = v15;
        id v81 = [NSString alloc];
        v82 = objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", objc_msgSend(v13, "count"));
        v103 = v9;
        v104 = v82;
        v83 = @"%@ IS %@";
        goto LABEL_43;
      case 13:
        v80 = v15;
        id v81 = [NSString alloc];
        v82 = objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", objc_msgSend(v13, "count"));
        v103 = v9;
        v104 = v82;
        v83 = @"%@ IS NOT %@";
LABEL_43:
        v84 = v81;
        id v15 = v80;
        id v20 = objc_msgSend(v84, "initWithFormat:", v83, v103, v104);

        v45 = v80;
LABEL_44:
        [v45 addObjectsFromArray:v13];
        goto LABEL_68;
      case 14:
        v85 = [v14 firstObject];
        if (v85)
        {
          v86 = v12;
          v87 = v15;
          uint64_t v88 = [a1 _produceCriterionClause:v85 tableName:v113];
          if (v88)
          {
            v89 = (void *)v88;
            v108 = v14;
            v110 = v13;
            id v90 = [NSString alloc];
            v91 = [v89 clause];
            v92 = (void *)[v90 initWithFormat:@"(%@)", v91];

            v93 = [v89 parameters];
            [v87 addObjectsFromArray:v93];

            if (v92)
            {
              id v20 = (void *)[[NSString alloc] initWithFormat:@"NOT %@", v92];
            }
            else
            {
              id v20 = 0;
            }
            v14 = v108;
            uint64_t v13 = v110;
          }
          else
          {
            id v20 = 0;
          }
          id v15 = v87;
          id v12 = v86;
        }
        else
        {
          id v20 = 0;
        }

LABEL_68:
        uint64_t v21 = v112;
        if (v20) {
          goto LABEL_69;
        }
        goto LABEL_58;
      case 15:
        uint64_t v21 = v112;
        if (!v112) {
          goto LABEL_58;
        }
        v111 = v12;
        v46 = v15;
        id v94 = [NSString alloc];
        v95 = [v112 commandString];
        [a1 _removeEndingSemicolonFromCommandString:v95];
        v97 = v96 = v14;
        uint64_t v98 = [v94 initWithFormat:@"EXISTS (%@)", v97];
        goto LABEL_53;
      case 16:
        uint64_t v21 = v112;
        if (!v112) {
          goto LABEL_58;
        }
        v111 = v12;
        v46 = v15;
        id v99 = [NSString alloc];
        v95 = [v112 commandString];
        [a1 _removeEndingSemicolonFromCommandString:v95];
        v97 = v96 = v14;
        uint64_t v98 = [v99 initWithFormat:@"NOT EXISTS (%@)", v97];
LABEL_53:
        id v20 = (void *)v98;

        v14 = v96;
        v51 = [v21 parameters];
        goto LABEL_54;
      default:
        uint64_t v22 = 0;
        uint64_t v21 = v112;
        goto LABEL_70;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)prefixColumnName:(id)a3 withTableName:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = [NSString stringWithFormat:@"%@.%@", a4, v5];
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;

  return v8;
}

+ (id)_generateCommaSeparatedPlaceholdersString:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3;
    if (a3 == 1)
    {
      id v4 = @"?";
    }
    else
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
      do
      {
        [v5 addObject:@"?"];
        --v3;
      }
      while (v3);
      id v4 = [v5 componentsJoinedByString:@", "];
    }
  }
  else
  {
    id v4 = &stru_26FDBF2B8;
  }

  return v4;
}

+ (id)selectFromTableWithName:(id)a3 columns:(id)a4 count:(BOOL)a5 join:(id)a6 criterion:(id)a7 order:(id)a8 limit:(id)a9 offset:(id)a10
{
  BOOL v13 = a5;
  id v16 = a3;
  id v42 = a7;
  id v41 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = a6;
  id v20 = [a1 _produceSelectClauseWithTableName:v16 columnNames:a4 count:v13];
  uint64_t v21 = objc_opt_new();
  uint64_t v22 = [a1 _generateJoinClause:v19];

  if (v22)
  {
    id v23 = [v22 clause];
    uint64_t v24 = [v20 stringByAppendingString:v23];

    v25 = [v22 parameters];
    [v21 addObjectsFromArray:v25];

    id v20 = (void *)v24;
  }
  uint64_t v26 = [a1 _produceCriterionClause:v42 tableName:v16];
  id v27 = v26;
  if (v26)
  {
    id v28 = [v26 clause];
    uint64_t v29 = [v20 stringByAppendingFormat:@" WHERE %@", v28];

    id v30 = [v27 parameters];
    [v21 addObjectsFromArray:v30];

    id v20 = (void *)v29;
  }
  uint64_t v31 = [a1 _generateOrderByClause:v41];
  long long v32 = (void *)v31;
  if (v31)
  {
    uint64_t v33 = [v20 stringByAppendingFormat:@" ORDER BY %@", v31];

    id v20 = (void *)v33;
  }
  if (v17)
  {
    uint64_t v34 = [v20 stringByAppendingFormat:@" LIMIT %@", @"?"];

    [v21 addObject:v17];
    id v20 = (void *)v34;
  }
  if (v18)
  {
    uint64_t v35 = [v20 stringByAppendingFormat:@" OFFSET %@", @"?"];

    [v21 addObject:v18];
    id v20 = (void *)v35;
  }
  id v36 = [v20 stringByAppendingString:@";"];

  v37 = [CCDatabaseSelect alloc];
  if ([v21 count]) {
    uint64_t v38 = v21;
  }
  else {
    uint64_t v38 = 0;
  }
  v39 = [(CCDatabaseCommand *)v37 initWithCommandString:v36 parameters:v38];

  return v39;
}

+ (id)_produceSelectClauseWithTableName:(id)a3 columnNames:(id)a4 count:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v5)
  {
    [NSString stringWithFormat:@"SELECT COUNT(*) FROM %@", v8];
  }
  else
  {
    id v11 = NSString;
    if (v9)
    {
      id v12 = [a1 _generateCommaSeparatedValuesString:v9];
      BOOL v13 = [v11 stringWithFormat:@"SELECT %@ FROM %@", v12, v8];

      goto LABEL_7;
    }
    [NSString stringWithFormat:@"SELECT * FROM %@", v8];
  BOOL v13 = };
LABEL_7:

  return v13;
}

+ (id)_generateOrderByClause:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [v4 orderMode];
  switch(v6)
  {
    case 3:
      id v8 = [NSString alloc];
      id v9 = [v5 columnNames];
      id v10 = [a1 _generateCommaSeparatedValuesString:v9];
      uint64_t v11 = [v8 initWithFormat:@"%@ DESC", v10];
LABEL_10:
      id v7 = (__CFString *)v11;

      break;
    case 2:
      id v12 = [NSString alloc];
      id v9 = [v5 columnNames];
      id v10 = [a1 _generateCommaSeparatedValuesString:v9];
      uint64_t v11 = [v12 initWithFormat:@"%@ ASC", v10];
      goto LABEL_10;
    case 1:
      id v7 = @"rank";
      break;
    default:
      id v7 = 0;
      break;
  }
LABEL_11:

  return v7;
}

+ (id)_generateJoinClause:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 joinType])
  {
    uint64_t v24 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v6 = [v5 joinTables];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v12 = [v11 joinCriterion];
          BOOL v13 = [a1 _produceJoinCriterionClause:v12];

          switch([v5 joinType])
          {
            case 1:
              id v14 = [NSString alloc];
              id v15 = [v11 table];
              id v16 = [v13 clause];
              uint64_t v17 = [v14 initWithFormat:@" JOIN %@ ON (%@)", v15, v16];
              goto LABEL_13;
            case 2:
              id v18 = [NSString alloc];
              id v15 = [v11 table];
              id v16 = [v13 clause];
              uint64_t v17 = [v18 initWithFormat:@" LEFT JOIN %@ ON (%@)", v15, v16];
              goto LABEL_13;
            case 3:
              id v19 = [NSString alloc];
              id v15 = [v11 table];
              id v16 = [v13 clause];
              uint64_t v17 = [v19 initWithFormat:@" RIGHT JOIN %@ ON (%@)", v15, v16];
              goto LABEL_13;
            case 4:
              id v20 = [NSString alloc];
              id v15 = [v11 table];
              id v16 = [v13 clause];
              uint64_t v17 = [v20 initWithFormat:@" FULL JOIN %@ ON (%@)", v15, v16];
LABEL_13:
              uint64_t v21 = (void *)v17;

              if (v21)
              {
                [v24 appendString:v21];
              }
              break;
            default:
              break;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    uint64_t v22 = [[CCSQLCommandClause alloc] initWithClause:v24 parameters:0];
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)_generateCommaSeparatedValuesString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    if (v4 == 1) {
      [v3 objectAtIndex:0];
    }
    else {
    BOOL v5 = [v3 componentsJoinedByString:@", "];
    }
  }
  else
  {
    BOOL v5 = &stru_26FDBF2B8;
  }

  return v5;
}

- (CCSQLCommandGenerator)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (void)addLimit:(id)a3 offset:(id)a4 forSelect:(id)a5
{
  id v15 = a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v15 commandString];
  id v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v15 parameters];
  id v12 = (void *)[v11 mutableCopy];

  if (!v12) {
    id v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  }
  BOOL v13 = [NSString stringWithFormat:@" LIMIT %@", @"?"];
  objc_msgSend(v10, "insertString:atIndex:", v13, objc_msgSend(v10, "length") - 1);
  [v12 addObject:v8];

  id v14 = [NSString stringWithFormat:@" OFFSET %@", @"?"];
  objc_msgSend(v10, "insertString:atIndex:", v14, objc_msgSend(v10, "length") - 1);
  [v12 addObject:v7];

  [v15 replaceParameters:v12];
  [v15 updateCommandString:v10];
}

+ (void)replaceOffset:(id)a3 forSelect:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 parameters];
  id v8 = (id)[v7 mutableCopy];

  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", objc_msgSend(v8, "count") - 1, v6);
  [v5 updateParameters:v8];
}

+ (id)deleteFromTableWithName:(id)a3 criterion:(id)a4 returningColumns:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v9 alloc] initWithFormat:@"DELETE FROM %@", v11];
  BOOL v13 = [a1 _produceCriterionClause:v10 tableName:v11];

  if (v13)
  {
    id v14 = [v13 clause];
    uint64_t v15 = [v12 stringByAppendingFormat:@" WHERE %@", v14];

    id v12 = (void *)v15;
  }
  if ([v8 count])
  {
    id v16 = [v8 componentsJoinedByString:@", "];
    uint64_t v17 = [v12 stringByAppendingFormat:@" RETURNING %@", v16];

    id v12 = (void *)v17;
  }
  id v18 = [v12 stringByAppendingString:@";"];

  id v19 = [CCDatabaseDelete alloc];
  id v20 = [v13 parameters];
  uint64_t v21 = [(CCDatabaseCommand *)v19 initWithCommandString:v18 parameters:v20];

  return v21;
}

+ (id)updateWithTableName:(id)a3 columnNames:(id)a4 columnValues:(id)a5 criterion:(id)a6 returningColumns:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = (objc_class *)NSString;
  id v16 = a5;
  id v17 = a4;
  id v18 = (void *)[[v15 alloc] initWithFormat:@"UPDATE %@", v12];
  id v19 = [a1 _produceSetValuesClauseForColumnNames:v17 columnValues:v16];

  if (v19)
  {
    id v20 = [v19 clause];
    uint64_t v21 = [v18 stringByAppendingFormat:@" SET %@", v20];

    id v18 = (void *)v21;
  }
  uint64_t v22 = [a1 _produceCriterionClause:v13 tableName:v12];
  id v23 = v22;
  if (v22)
  {
    uint64_t v24 = [v22 clause];
    uint64_t v25 = [v18 stringByAppendingFormat:@" WHERE %@", v24];

    id v18 = (void *)v25;
  }
  if ([v14 count])
  {
    long long v26 = [v14 componentsJoinedByString:@", "];
    uint64_t v27 = [v18 stringByAppendingFormat:@" RETURNING %@", v26];

    id v18 = (void *)v27;
  }
  long long v28 = [v18 stringByAppendingString:@";"];

  uint64_t v29 = [v19 parameters];
  uint64_t v30 = [v29 count];
  uint64_t v31 = [v23 parameters];
  uint64_t v32 = [v31 count] + v30;

  uint64_t v33 = [MEMORY[0x263EFF980] arrayWithCapacity:v32];
  uint64_t v34 = [v19 parameters];
  [v33 addObjectsFromArray:v34];

  uint64_t v35 = [v23 parameters];
  [v33 addObjectsFromArray:v35];

  id v36 = [(CCDatabaseCommand *)[CCDatabaseUpdate alloc] initWithCommandString:v28 parameters:v33];

  return v36;
}

+ (id)_produceSetValuesClauseForColumnNames:(id)a3 columnValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 && (uint64_t v9 = v8, [v7 count] == v8))
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v9];
    id v11 = objc_opt_new();
    if ([v6 count])
    {
      unint64_t v12 = 0;
      do
      {
        id v13 = [NSString alloc];
        id v14 = [v6 objectAtIndex:v12];
        uint64_t v15 = [a1 _generateCommaSeparatedPlaceholdersString:1];
        id v16 = (void *)[v13 initWithFormat:@"%@ = %@", v14, v15];
        [v10 addObject:v16];

        id v17 = [v7 objectAtIndex:v12];
        [v11 addObject:v17];

        ++v12;
      }
      while (v12 < [v6 count]);
    }
    if ((unint64_t)[v10 count] <= 1)
    {
      uint64_t v21 = [CCSQLCommandClause alloc];
      id v18 = [v10 objectAtIndex:0];
      id v19 = v21;
    }
    else
    {
      id v18 = [v10 componentsJoinedByString:@", "];
      id v19 = [CCSQLCommandClause alloc];
    }
    id v20 = [(CCSQLCommandClause *)v19 initWithClause:v18 parameters:v11];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

+ (id)_removeEndingSemicolonFromCommandString:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@";"])
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

+ (void)_produceJoinCriterionClause:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 sqlOperator];
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "Inavlid join criterion, sql operator not supported for join %ld", (uint8_t *)&v3, 0xCu);
}

@end