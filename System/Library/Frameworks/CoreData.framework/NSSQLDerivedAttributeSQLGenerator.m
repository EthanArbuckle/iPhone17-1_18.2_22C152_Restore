@interface NSSQLDerivedAttributeSQLGenerator
+ (__CFString)_triggerColumnListComponentForAttributeKeypaths:(uint64_t)a3 startingAt:;
+ (uint64_t)_computeNewColumnTokenForKeypathExpression:(uint64_t)a3 governingEntity:;
+ (uint64_t)_computeSingleParameterTokenForFunctionAttribute:(uint64_t)a3 functionName:;
+ (uint64_t)_generateSQLForAttributeFunctionDerivationForDerivedAttribute:(void *)a3 keypaths:;
+ (uint64_t)_generateSQLForDerivedAttributeWithOneParameterKeypath:(void *)a3 keypaths:;
+ (uint64_t)_generateSQLForToOneDerivationForDerivedAttribute:(void *)a3 toOneKeypath:;
+ (uint64_t)_generateTriggerForAttribute:(uint64_t)a1 newToken:(void *)a2 updateToken:(uint64_t)a3 triggerColumnListComponent:(uint64_t)a4 triggerColumnWhereComponent:(void *)a5;
+ (uint64_t)_parameterPropertyTokenForDerivedAttribute:(void *)a3 andKeypath:(id *)a4 onEntity:;
+ (uint64_t)generateSQLForDerivedAttribute:(void *)a3 keypaths:;
@end

@implementation NSSQLDerivedAttributeSQLGenerator

+ (uint64_t)_computeSingleParameterTokenForFunctionAttribute:(uint64_t)a3 functionName:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  self;
  v5 = (void *)[a2 propertyDescription];
  v6 = objc_msgSend((id)objc_msgSend(v5, "derivationExpression"), "arguments");
  if ([v6 count] != 1)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v16 = @"derived attribute";
    v17[0] = v5;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v13 = @"currently unsupported (wrong number of arguments)";
    goto LABEL_6;
  }
  uint64_t v7 = [a2 entity];
  v8 = (void *)[v6 firstObject];
  if ([v8 expressionType] != 3)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v14 = @"derived attribute";
    v15 = v5;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v13 = @"bad parameter to function expression canonical: (not a keypath expression)";
LABEL_6:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v13 userInfo:v12]);
  }
  return [NSString stringWithFormat:@"%@(%@)", a3, +[NSSQLDerivedAttributeSQLGenerator _computeNewColumnTokenForKeypathExpression:governingEntity:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, v8, v7)];
}

+ (uint64_t)_generateSQLForAttributeFunctionDerivationForDerivedAttribute:(void *)a3 keypaths:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  self;
  v5 = +[NSSQLDerivedAttributeSQLGenerator _triggerColumnListComponentForAttributeKeypaths:startingAt:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a3, [a2 entity]);
  [a2 entity];
  self;
  self;
  v6 = (void *)[a2 propertyDescription];
  uint64_t v7 = (char *)objc_msgSend((id)objc_msgSend(v6, "derivationExpression"), "selector");
  if (sel_canonical_ == v7)
  {
    v9 = @"NSCoreDataCanonical";
LABEL_11:
    v8 = (void *)+[NSSQLDerivedAttributeSQLGenerator _computeSingleParameterTokenForFunctionAttribute:functionName:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, (uint64_t)v9);
    goto LABEL_12;
  }
  if (sel_uppercase_ == v7)
  {
    v9 = @"NSCoreDataToUpper";
    goto LABEL_11;
  }
  if (sel_lowercase_ == v7)
  {
    v9 = @"NSCoreDataToLower";
    goto LABEL_11;
  }
  if (sel_random == v7)
  {
    v9 = @"random";
    goto LABEL_11;
  }
  if (sel_now != v7)
  {
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    v14 = @"derived attribute";
    v15[0] = v6;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v13, @"currently unsupported (unsupported function)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1)));
  }
  self;
  v8 = (void *)[NSString stringWithFormat:@"NSCoreDataNow()"];
LABEL_12:
  uint64_t v10 = (uint64_t)v8;
  uint64_t v11 = [v8 stringByReplacingOccurrencesOfString:@"NEW." withString:&stru_1ED787880];

  return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, v10, v11, v5);
}

+ (uint64_t)generateSQLForDerivedAttribute:(void *)a3 keypaths:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v5 = [a2 propertyDescription];
  uint64_t v6 = v5;
  if (v5 && *(void *)(v5 + 128))
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v17 = @"derived attribute";
    v18[0] = v5;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v12 = @"currently unsupported (predicate)";
    goto LABEL_16;
  }
  if ([a3 count])
  {
    if ([a3 count] == 1)
    {
      uint64_t v7 = (void *)[a3 anyObject];
      if ([v7 count] == 1 || objc_msgSend(v7, "count") == 2)
      {
        return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForDerivedAttributeWithOneParameterKeypath:keypaths:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3);
      }
      v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      v15 = @"derived attribute";
      uint64_t v16 = v6;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v12 = @"currently unsupported (too many steps)";
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3C8];
      uint64_t v13 = @"derived attribute";
      uint64_t v14 = v6;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      uint64_t v12 = @"currently unsupported (too many keypaths)";
    }
LABEL_16:
    objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v12 userInfo:v11]);
  }

  return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForAttributeFunctionDerivationForDerivedAttribute:keypaths:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3);
}

+ (uint64_t)_generateSQLForDerivedAttributeWithOneParameterKeypath:(void *)a3 keypaths:
{
  v256[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v5 = (void *)[a2 propertyDescription];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "derivationExpression"), "expressionType");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "anyObject"), "objectAtIndexedSubscript:", 0);
  v230 = a2;
  v8 = (id *)[a2 entity];
  if (v8) {
    v8 = (id *)[v8[5] objectForKey:v7];
  }
  int v9 = [v8 propertyType];
  if (v6 == 4)
  {
    switch(v9)
    {
      case 1:
        return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForAttributeFunctionDerivationForDerivedAttribute:keypaths:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3);
      case 7:
        goto LABEL_13;
      case 8:
        self;
        v19 = (void *)[a2 propertyDescription];
        v20 = (char *)objc_msgSend((id)objc_msgSend(v19, "derivationExpression"), "selector");
        if (sel_count_ != v20 && sel_sum_ != v20)
        {
          if (sel_min_ == v20 || sel_max_ == v20)
          {
            v21 = (void *)[a3 anyObject];
            self;
            v22 = (id *)[v230 entity];
            v23 = (NSSQLiteStatement *)[v230 propertyDescription];
            v24 = (void *)[(NSSQLiteStatement *)v23 derivationExpression];
            uint64_t v25 = [v21 objectAtIndexedSubscript:0];
            if (v22) {
              v26 = (void *)[v22[5] objectForKey:v25];
            }
            else {
              v26 = 0;
            }
            uint64_t v227 = [v26 destinationEntity];
            uint64_t v193 = [v230 columnName];
            if (v26) {
              v27 = (void *)v26[7];
            }
            else {
              v27 = 0;
            }
            uint64_t v28 = [v27 columnName];
            uint64_t v29 = [v21 objectAtIndexedSubscript:1];
            if (v227) {
              v30 = (void *)[*(id *)(v227 + 40) objectForKey:v29];
            }
            else {
              v30 = 0;
            }
            uint64_t v195 = [v30 columnName];
            uint64_t v205 = v28;
            uint64_t v203 = [NSString stringWithFormat:@"%@, %@", v28, v195];
            if (sel_min_ == (char *)[v24 selector])
            {
              v209 = @"<";
              v31 = @"MIN";
            }
            else
            {
              if (sel_max_ != (char *)[v24 selector])
              {
                v174 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v175 = *MEMORY[0x1E4F1C3C8];
                v244 = @"derived attribute";
                v249 = v23;
                uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v249 forKeys:&v244 count:1];
                uint64_t v13 = @"Unsupported: (unsupported function)";
                v172 = v174;
                uint64_t v173 = v175;
LABEL_118:
                objc_exception_throw((id)[v172 exceptionWithName:v173 reason:v13 userInfo:v12]);
              }
              v209 = @">";
              v31 = @"MAX";
            }
            v213 = v31;
            uint64_t v191 = [v22 tableName];
            uint64_t v219 = [(id)v227 tableName];
            uint64_t v83 = [[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@", objc_msgSend((id)v227, "tableName"), objc_msgSend(v22, "name"), -[NSSQLiteStatement name](v23, "name")];
            uint64_t v84 = [[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@", objc_msgSend(v22, "tableName"), objc_msgSend(v22, "name"), -[NSSQLiteStatement name](v23, "name")];
            v216 = v22;
            v85 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v83];
            v86 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE_SET", v83];
            v87 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE_UNSET", v83];
            v224 = (void *)v83;
            v88 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_DELETE", v83];
            v186 = (void *)v84;
            v89 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v84];
            v90 = (void *)[MEMORY[0x1E4F1CA48] array];
            v91 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            v92 = [[NSSQLiteStatement alloc] initWithEntity:v227 sqlString:v85];
            [v90 addObject:v92];

            v93 = [[NSSQLiteStatement alloc] initWithEntity:v227 sqlString:v86];
            [v90 addObject:v93];

            v94 = [[NSSQLiteStatement alloc] initWithEntity:v227 sqlString:v87];
            [v90 addObject:v94];

            v95 = [[NSSQLiteStatement alloc] initWithEntity:v227 sqlString:v88];
            [v90 addObject:v95];

            v96 = [[NSSQLiteStatement alloc] initWithEntity:v216 sqlString:v89];
            [v90 addObject:v96];

            v249 = v92;
            v250 = v93;
            v251 = v94;
            v252 = v95;
            v253 = v96;
            v188 = v91;
            objc_msgSend(v91, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v249, 5), @"dropStatements");

            if (v216 && (v216[20] || (id v104 = v216[19]) != 0 && [v104 count] && v216[20]))
            {
              uint64_t v97 = *((unsigned int *)v216 + 46);
              uint64_t v98 = *((unsigned int *)v216 + 47);
              unint64_t v99 = 0x1E4F29000uLL;
              id v100 = [NSString alloc];
              uint64_t v101 = v205;
              if (v97 >= v98)
              {
                v182 = (__CFString *)objc_msgSend(v100, "initWithFormat:", @" WHEN %d = NEW.Z_ENT", v97);
                v102 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" AND %d = Z_ENT", v97);
                uint64_t v103 = objc_msgSend([NSString alloc], "initWithFormat:", @" WHERE %d = Z_ENT", v97, v177);
              }
              else
              {
                v182 = (__CFString *)objc_msgSend(v100, "initWithFormat:", @" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d", v97, v98);
                v102 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" AND %d <= Z_ENT AND Z_ENT <= %d", v97, v98);
                uint64_t v103 = objc_msgSend([NSString alloc], "initWithFormat:", @" WHERE %d <= Z_ENT AND Z_ENT <= %d", v97, v98);
              }
              v184 = (__CFString *)v103;
            }
            else
            {
              v182 = &stru_1ED787880;
              v102 = &stru_1ED787880;
              v184 = &stru_1ED787880;
              unint64_t v99 = 0x1E4F29000;
              uint64_t v101 = v205;
            }
            uint64_t v105 = v227;
            v190 = v90;
            if (v227
              && (*(void *)(v227 + 160)
               || (v111 = *(void **)(v227 + 152)) != 0
               && (v112 = [v111 count], uint64_t v105 = v227, v112)
               && *(void *)(v227 + 160)))
            {
              uint64_t v106 = *(unsigned int *)(v105 + 184);
              uint64_t v107 = *(unsigned int *)(v105 + 188);
              id v108 = objc_alloc(*(Class *)(v99 + 24));
              if (v106 >= v107)
              {
                v109 = (__CFString *)objc_msgSend(v108, "initWithFormat:", @" AND %d = Z_ENT", v106);
                v110 = (__CFString *)objc_msgSend(objc_alloc(*(Class *)(v99 + 24)), "initWithFormat:", @" WHERE %d = Z_ENT", v106, v177);
              }
              else
              {
                v109 = (__CFString *)objc_msgSend(v108, "initWithFormat:", @" AND %d <= Z_ENT AND Z_ENT <= %d", v106, v107);
                v110 = (__CFString *)objc_msgSend(objc_alloc(*(Class *)(v99 + 24)), "initWithFormat:", @" WHERE %d <= Z_ENT AND Z_ENT <= %d", v106, v107);
              }
            }
            else
            {
              v109 = &stru_1ED787880;
              v110 = &stru_1ED787880;
            }
            v180 = v110;
            id v113 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            [v113 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL AND NEW.%@ NOT NULL%@)", v224, v219, v101, v195, v109];
            [v113 appendString:@" BEGIN"];
            v114 = v109;
            v208 = v109;
            uint64_t v115 = v193;
            uint64_t v116 = v191;
            v179 = v113;
            objc_msgSend(v113, "appendFormat:", @" UPDATE %@ SET %@ = NEW.%@ WHERE Z_PK = NEW.%@%@ AND %@;",
              v191,
              v193,
              v195,
              v101,
              v102,
              [*(id *)(v99 + 24) stringWithFormat:@"(%@ IS NULL OR NEW.%@ %@ %@)", v193, v195, v209, v193]);
            objc_msgSend(v113, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@ AND %@;",
              v116,
              [v230 name],
              v115,
              v116,
              v101,
              v102,
              [*(id *)(v99 + 24) stringWithFormat:@"(%@ IS NULL OR NEW.%@ %@= %@)", v115, v195, v209, v115]);
            [v113 appendFormat:@" END"];
            id v117 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            [v117 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE_SET AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL AND NEW.%@ NOT NULL%@)", v224, v203, v219, v101, v195, v114];
            v201 = v117;
            [v117 appendString:@" BEGIN"];
            objc_msgSend(v117, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;",
              v191,
              v193,
              v213,
              v195,
              v219,
              v101,
              v101,
              v101,
              v102,
              [NSString stringWithFormat:@"OLD.%@ %@= %@", v195, v209, v193]);
            uint64_t v118 = [v230 name];
            objc_msgSend(v201, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;",
              v116,
              v118,
              v193,
              v116,
              v101,
              v102,
              [NSString stringWithFormat:@"OLD.%@ %@= %@", v195, v209, v193]);
            objc_msgSend(v201, "appendFormat:", @" UPDATE %@ SET %@ = NEW.%@ WHERE Z_PK = NEW.%@%@ AND %@;",
              v191,
              v115,
              v195,
              v101,
              v102,
              [NSString stringWithFormat:@"(%@ IS NULL OR NEW.%@ %@ %@)", v115, v195, v209, v115]);
            uint64_t v119 = [v230 name];
            objc_msgSend(v201, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@ AND %@;",
              v116,
              v119,
              v193,
              v116,
              v101,
              v102,
              [NSString stringWithFormat:@"NEW.%@ %@= %@", v195, v209, v193]);
            [v201 appendFormat:@" END"];
            id v120 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            [v120 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE_UNSET AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL AND OLD.%@ NOT NULL AND (NEW.%@ IS NULL OR NEW.%@ IS NULL)%@)", v224, v203, v219, v101, v195, v101, v195, v208];
            [v120 appendString:@" BEGIN"];
            objc_msgSend(v120, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;",
              v191,
              v193,
              v213,
              v195,
              v219,
              v101,
              v101,
              v101,
              v102,
              [NSString stringWithFormat:@"OLD.%@ %@= %@", v195, v209, v193]);
            uint64_t v121 = [v230 name];
            objc_msgSend(v120, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;",
              v116,
              v121,
              v115,
              v116,
              v101,
              v102,
              [NSString stringWithFormat:@"(%@ IS NULL OR OLD.%@ %@= %@)", v115, v195, v209, v115]);
            [v120 appendFormat:@" END"];
            id v122 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            [v122 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL AND OLD.%@ NOT NULL%@)", v224, v219, v101, v195, v208];
            [v122 appendString:@" BEGIN"];
            objc_msgSend(v122, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;",
              v191,
              v193,
              v213,
              v195,
              v219,
              v101,
              v101,
              v101,
              v102,
              [NSString stringWithFormat:@"OLD.%@ %@= %@", v195, v209, v193]);
            uint64_t v123 = [v230 name];
            objc_msgSend(v122, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;",
              v116,
              v123,
              v115,
              v116,
              v101,
              v102,
              [NSString stringWithFormat:@"(%@ IS NULL OR OLD.%@ %@= %@)", v115, v195, v209, v115]);
            [v122 appendFormat:@" END"];
            id v124 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            [v124 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@", v186, v191, v182];
            [v124 appendString:@" BEGIN"];
            objc_msgSend(v124, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;",
              v191,
              v193,
              v213,
              v195,
              [(id)v227 tableName],
              v101);
            objc_msgSend(v124, "appendFormat:", @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
              v116,
              [v230 name],
              v193,
              v116);
            [v124 appendFormat:@" END"];

            v232 = [[NSSQLiteStatement alloc] initWithEntity:v227 sqlString:v179];
            [v190 addObject:v232];

            v225 = [[NSSQLiteStatement alloc] initWithEntity:v227 sqlString:v201];
            [v190 addObject:v225];

            v220 = [[NSSQLiteStatement alloc] initWithEntity:v227 sqlString:v120];
            [v190 addObject:v220];

            v125 = [[NSSQLiteStatement alloc] initWithEntity:v227 sqlString:v122];
            [v190 addObject:v125];

            v126 = [[NSSQLiteStatement alloc] initWithEntity:v216 sqlString:v124];
            [v190 addObject:v126];

            v127 = objc_msgSend([NSString alloc], "initWithFormat:", @"UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = %@.Z_PK)%@;",
                             v116,
                             v193,
                             v213,
                             v195,
                             [(id)v227 tableName],
                             v101,
                             v116,
                             v180);

            v128 = [[NSSQLiteStatement alloc] initWithEntity:v216 sqlString:v127];
            v256[0] = v128;
            objc_msgSend(v188, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v256, 1), @"dataStatements");
            v244 = (__CFString *)v232;
            v245 = v225;
            v246 = v220;
            v247 = v125;
            v248 = v126;
            objc_msgSend(v188, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v244, 5), @"triggerCreationStatements");

            v254 = v190;
            v255 = v188;
            goto LABEL_99;
          }
          uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v11 = *MEMORY[0x1E4F1C3C8];
          v242 = @"derived attribute";
          v243 = v19;
          v169 = (void *)MEMORY[0x1E4F1C9E8];
          v170 = (NSSQLiteStatement **)&v243;
          v171 = &v242;
LABEL_109:
          uint64_t v12 = [v169 dictionaryWithObjects:v170 forKeys:v171 count:1];
          uint64_t v13 = @"currently unsupported (unsupported function on to many (not count or sum))";
          goto LABEL_117;
        }
        v61 = (void *)[a3 anyObject];
        self;
        uint64_t v62 = [a2 entity];
        v63 = (NSSQLiteStatement *)[a2 propertyDescription];
        v64 = (void *)[(NSSQLiteStatement *)v63 derivationExpression];
        uint64_t v65 = [v61 objectAtIndexedSubscript:0];
        if (v62) {
          v66 = (void *)[*(id *)(v62 + 40) objectForKey:v65];
        }
        else {
          v66 = 0;
        }
        v67 = (id *)[v66 destinationEntity];
        uint64_t v204 = [v230 columnName];
        if (v66) {
          v68 = (void *)v66[7];
        }
        else {
          v68 = 0;
        }
        uint64_t v207 = [v68 columnName];
        if (sel_count_ != (char *)[v64 selector]) {
          goto LABEL_45;
        }
        if ((unint64_t)[v61 count] < 2)
        {
          BOOL v69 = 0;
          int v199 = 1;
          uint64_t v223 = v207;
          v229 = @"+ 1";
          v70 = @"- 1";
        }
        else
        {
          uint64_t v81 = [v61 objectAtIndexedSubscript:1];
          if (v67 && (v82 = (unsigned char *)[v67[5] objectForKey:v81]) != 0 && v82[24] == 1)
          {
            v70 = 0;
            uint64_t v223 = 0;
            v229 = 0;
            BOOL v69 = objc_msgSend((id)objc_msgSend(v82, "propertyDescription"), "attributeType") == 800;
            int v199 = v69;
          }
          else
          {
LABEL_45:
            BOOL v69 = 0;
            int v199 = 0;
            v70 = 0;
            uint64_t v223 = 0;
            v229 = 0;
          }
        }
        v129 = (char *)[v64 selector];
        if (v69 || (uint64_t v130 = v223, sel_sum_ == v129))
        {
          uint64_t v131 = [v61 objectAtIndexedSubscript:1];
          if (v67) {
            v132 = (void *)[v67[5] objectForKey:v131];
          }
          else {
            v132 = 0;
          }
          uint64_t v130 = [v132 columnName];
          v229 = (__CFString *)[NSString stringWithFormat:@"+ IFNULL(NEW.%@, 0)", v130];
          v70 = (__CFString *)[NSString stringWithFormat:@"- IFNULL(OLD.%@, 0)", v130];
          uint64_t v223 = [NSString stringWithFormat:@"%@, %@", v207, v130];
        }
        BOOL v202 = v69;
        uint64_t v221 = v130;
        if (v229 && v70)
        {
          v185 = v70;
          uint64_t v189 = [(id)v62 tableName];
          uint64_t v217 = [v67 tableName];
          v214 = v67;
          uint64_t v133 = [[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@_PARAMETER", objc_msgSend(v67, "tableName"), objc_msgSend((id)v62, "name"), -[NSSQLiteStatement name](v63, "name")];
          uint64_t v134 = [[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@_SOURCE", objc_msgSend((id)v62, "tableName"), objc_msgSend((id)v62, "name"), -[NSSQLiteStatement name](v63, "name")];
          v135 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v133];
          v136 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE_INCREMENT", v133];
          v137 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE_DECREMENT", v133];
          v211 = (void *)v133;
          v138 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_DELETE", v133];
          v183 = (void *)v134;
          v139 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v134];
          v140 = (void *)[MEMORY[0x1E4F1CA48] array];
          v141 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          v142 = [[NSSQLiteStatement alloc] initWithEntity:v62 sqlString:v135];
          [v140 addObject:v142];

          v143 = [[NSSQLiteStatement alloc] initWithEntity:v62 sqlString:v136];
          [v140 addObject:v143];

          v144 = [[NSSQLiteStatement alloc] initWithEntity:v62 sqlString:v137];
          [v140 addObject:v144];

          v145 = [[NSSQLiteStatement alloc] initWithEntity:v62 sqlString:v138];
          [v140 addObject:v145];

          v146 = [[NSSQLiteStatement alloc] initWithEntity:v62 sqlString:v139];
          [v140 addObject:v146];

          v249 = v142;
          v250 = v143;
          v251 = v144;
          v252 = v145;
          v253 = v146;
          v187 = v141;
          objc_msgSend(v141, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v249, 5), @"dropStatements");
          uint64_t v192 = v62;
          if (v62
            && (*(void *)(v62 + 160)
             || (v152 = *(void **)(v62 + 152)) != 0 && [v152 count] && *(void *)(v62 + 160)))
          {
            uint64_t v147 = *(unsigned int *)(v62 + 184);
            uint64_t v148 = *(unsigned int *)(v62 + 188);
            id v149 = [NSString alloc];
            if (v147 >= v148)
            {
              v194 = (__CFString *)objc_msgSend(v149, "initWithFormat:", @" WHEN %d = NEW.Z_ENT", v147);
              v150 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" AND %d = Z_ENT", v147);
              v151 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" WHERE %d = Z_ENT", v147, v178);
            }
            else
            {
              v194 = (__CFString *)objc_msgSend(v149, "initWithFormat:", @" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d", v147, v148);
              v150 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" AND %d <= Z_ENT AND Z_ENT <= %d", v147, v148);
              v151 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" WHERE %d <= Z_ENT AND Z_ENT <= %d", v147, v148);
            }
          }
          else
          {
            v194 = &stru_1ED787880;
            v150 = &stru_1ED787880;
            v151 = &stru_1ED787880;
          }
          v197 = v151;
          id v153 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          [v153 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL)", v211, v217, v207];
          v181 = v153;
          [v153 appendString:@" BEGIN"];
          uint64_t v154 = v204;
          uint64_t v155 = v189;
          objc_msgSend(v153, "appendFormat:", @" UPDATE %@ SET %@ = IFNULL(%@, 0) %@ WHERE Z_PK = NEW.%@%@;",
            v189,
            v204,
            v204,
            v229,
            v207,
            v150);
          objc_msgSend(v153, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;",
            v155,
            [v230 name],
            v204,
            v155,
            v207,
            v150);
          [v153 appendFormat:@" END"];
          id v156 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          [v156 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE_INCREMENT AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL)", v211, v223, v217, v207];
          [v156 appendString:@" BEGIN"];
          objc_msgSend(v156, "appendFormat:", @" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = NEW.%@%@;",
            v189,
            v154,
            v154,
            v229,
            v207,
            v150);
          objc_msgSend(v156, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;",
            v155,
            [v230 name],
            v204,
            v155,
            v207,
            v150);
          [v156 appendFormat:@" END"];
          id v157 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          [v157 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE_DECREMENT AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL)", v211, v223, v217, v207];
          [v157 appendString:@" BEGIN"];
          objc_msgSend(v157, "appendFormat:", @" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = OLD.%@%@;",
            v189,
            v154,
            v154,
            v185,
            v207,
            v150);
          objc_msgSend(v157, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;",
            v155,
            [v230 name],
            v204,
            v155,
            v207,
            v150);
          objc_msgSend(v157, "appendFormat:");
          id v158 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          [v158 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL)", v211, v217, v207];
          [v158 appendString:@" BEGIN"];
          objc_msgSend(v158, "appendFormat:", @" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = OLD.%@%@;",
            v189,
            v154,
            v154,
            v185,
            v207,
            v150);
          objc_msgSend(v158, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;",
            v155,
            [v230 name],
            v204,
            v155,
            v207,
            v150);
          [v158 appendFormat:@" END"];
          id v159 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          [v159 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@", v183, v189, v194];
          [v159 appendString:@" BEGIN"];
          if ((v199 & !v202) != 0) {
            v160 = @"COUNT";
          }
          else {
            v160 = @"SUM";
          }
          objc_msgSend(v159, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT IFNULL(%@(%@), 0) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;",
            v189,
            v204,
            v160,
            v221,
            [v214 tableName],
            v207);
          objc_msgSend(v159, "appendFormat:", @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
            v189,
            [v230 name],
            v204,
            v189);
          [v159 appendFormat:@" END"];

          v233 = [[NSSQLiteStatement alloc] initWithEntity:v192 sqlString:v181];
          [v140 addObject:v233];

          v226 = [[NSSQLiteStatement alloc] initWithEntity:v192 sqlString:v156];
          [v140 addObject:v226];

          v161 = [[NSSQLiteStatement alloc] initWithEntity:v192 sqlString:v157];
          [v140 addObject:v161];

          v162 = [[NSSQLiteStatement alloc] initWithEntity:v192 sqlString:v158];
          [v140 addObject:v162];

          v163 = [[NSSQLiteStatement alloc] initWithEntity:v192 sqlString:v159];
          [v140 addObject:v163];

          v164 = objc_msgSend([NSString alloc], "initWithFormat:", @"UPDATE %@ SET %@ = (SELECT IFNULL(%@(%@), 0) FROM %@ WHERE %@ = %@.Z_PK)%@;",
                           v189,
                           v204,
                           v160,
                           v221,
                           [v214 tableName],
                           v207,
                           v189,
                           v197);

          v165 = [[NSSQLiteStatement alloc] initWithEntity:v192 sqlString:v164];
          v256[0] = v165;
          objc_msgSend(v187, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v256, 1), @"dataStatements");
          v244 = (__CFString *)v233;
          v245 = v226;
          v246 = v161;
          v247 = v162;
          v248 = v163;
          objc_msgSend(v187, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v244, 5), @"triggerCreationStatements");

          v254 = v140;
          v255 = v187;
LABEL_99:
          v80 = (void *)MEMORY[0x1E4F1C978];
          return [v80 arrayWithObjects:&v254 count:2];
        }
        uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v11 = *MEMORY[0x1E4F1C3C8];
        v244 = @"derived attribute";
        v249 = v63;
LABEL_116:
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v249 forKeys:&v244 count:1];
        uint64_t v13 = @"Unsupported: (unsupported function)";
        goto LABEL_117;
      case 9:
        self;
        v32 = (NSSQLiteStatement *)[a2 propertyDescription];
        v33 = (char *)objc_msgSend((id)-[NSSQLiteStatement derivationExpression](v32, "derivationExpression"), "selector");
        if (sel_count_ != v33)
        {
          uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v11 = *MEMORY[0x1E4F1C3C8];
          v244 = @"derived attribute";
          v249 = v32;
          v169 = (void *)MEMORY[0x1E4F1C9E8];
          v170 = &v249;
          v171 = &v244;
          goto LABEL_109;
        }
        v34 = v33;
        v35 = (void *)[a3 anyObject];
        self;
        uint64_t v36 = [a2 entity];
        v37 = (NSSQLiteStatement *)[a2 propertyDescription];
        v38 = (void *)[(NSSQLiteStatement *)v37 derivationExpression];
        uint64_t v39 = [v35 objectAtIndexedSubscript:0];
        if (v36) {
          v40 = (void *)[*(id *)(v36 + 40) objectForKey:v39];
        }
        else {
          v40 = 0;
        }
        uint64_t v218 = [v230 columnName];
        uint64_t v215 = [v40 columnName];
        if (v34 == (char *)[v38 selector])
        {
          uint64_t v198 = [(id)v36 tableName];
          uint64_t v41 = [v40 correlationTableName];
          uint64_t v42 = [[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@_PARAMETER", v41, objc_msgSend((id)v36, "name"), -[NSSQLiteStatement name](v37, "name")];
          v43 = (void *)[[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@_SOURCE", objc_msgSend((id)v36, "tableName"), objc_msgSend((id)v36, "name"), -[NSSQLiteStatement name](v37, "name")];
          v44 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v42];
          v228 = (void *)v42;
          v45 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_DELETE", v42];
          v46 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v43];
          v47 = (void *)[MEMORY[0x1E4F1CA48] array];
          v48 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          v49 = [[NSSQLiteStatement alloc] initWithEntity:v36 sqlString:v44];
          [v47 addObject:v49];

          v50 = [[NSSQLiteStatement alloc] initWithEntity:v36 sqlString:v45];
          [v47 addObject:v50];

          v51 = [[NSSQLiteStatement alloc] initWithEntity:v36 sqlString:v46];
          [v47 addObject:v51];

          v249 = v49;
          v250 = v50;
          v251 = v51;
          v210 = v48;
          objc_msgSend(v48, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v249, 3), @"dropStatements");
          uint64_t v212 = v36;
          v206 = v47;
          if (v36
            && (*(void *)(v36 + 160)
             || (v71 = *(void **)(v36 + 152)) != 0 && [v71 count] && *(void *)(v36 + 160)))
          {
            uint64_t v52 = v36;
            uint64_t v53 = v198;
            uint64_t v54 = *(unsigned int *)(v52 + 184);
            uint64_t v55 = *(unsigned int *)(v52 + 188);
            id v56 = [NSString alloc];
            uint64_t v57 = v41;
            uint64_t v58 = v215;
            if (v54 >= v55)
            {
              v222 = (__CFString *)objc_msgSend(v56, "initWithFormat:", @" WHEN %d = NEW.Z_ENT", v54);
              v59 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" AND %d = Z_ENT", v54);
              v60 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" WHERE %d = Z_ENT", v54, v176);
            }
            else
            {
              v222 = (__CFString *)objc_msgSend(v56, "initWithFormat:", @" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d", v54, v55);
              v59 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" AND %d <= Z_ENT AND Z_ENT <= %d", v54, v55);
              v60 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @" WHERE %d <= Z_ENT AND Z_ENT <= %d", v54, v55);
            }
          }
          else
          {
            uint64_t v53 = v198;
            uint64_t v57 = v41;
            uint64_t v58 = v215;
            v222 = &stru_1ED787880;
            v59 = &stru_1ED787880;
            v60 = &stru_1ED787880;
          }
          v200 = v60;
          id v72 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          uint64_t v73 = v57;
          [v72 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW", v228, v57];
          [v72 appendString:@" BEGIN"];
          objc_msgSend(v72, "appendFormat:", @" UPDATE %@ SET %@ = IFNULL(%@, 0) + 1 WHERE Z_PK = NEW.%@%@;",
            v53,
            v218,
            v218,
            v58,
            v59);
          objc_msgSend(v72, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;",
            v53,
            [v230 name],
            v218,
            v53,
            v58,
            v59);
          [v72 appendFormat:@" END"];
          id v74 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          uint64_t v196 = v73;
          [v74 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW", v228, v73];
          [v74 appendString:@" BEGIN"];
          objc_msgSend(v74, "appendFormat:", @" UPDATE %@ SET %@ = %@ - 1 WHERE Z_PK = OLD.%@%@;",
            v53,
            v218,
            v218,
            v58,
            v59);
          objc_msgSend(v74, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;",
            v53,
            [v230 name],
            v218,
            v53,
            v58,
            v59);
          [v74 appendFormat:@" END"];
          id v75 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          [v75 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@", v43, v53, v222];
          [v75 appendString:@" BEGIN"];
          objc_msgSend(v75, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT IFNULL(COUNT(%@), 0) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;",
            v53,
            v218,
            v58,
            v73,
            v58);
          objc_msgSend(v75, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
            v53,
            [v230 name],
            v218,
            v53);
          [v75 appendFormat:@" END"];

          v231 = [[NSSQLiteStatement alloc] initWithEntity:v212 sqlString:v72];
          [v206 addObject:v231];

          v76 = [[NSSQLiteStatement alloc] initWithEntity:v212 sqlString:v74];
          [v206 addObject:v76];

          v77 = [[NSSQLiteStatement alloc] initWithEntity:v212 sqlString:v75];
          [v206 addObject:v77];

          v78 = objc_msgSend([NSString alloc], "initWithFormat:", @"UPDATE %@ SET %@ = (SELECT IFNULL(COUNT(%@), 0) FROM %@ WHERE %@ = %@.Z_PK)%@;",
                          v53,
                          v218,
                          v58,
                          v196,
                          v58,
                          v53,
                          v200);

          v79 = [[NSSQLiteStatement alloc] initWithEntity:v212 sqlString:v78];
          v256[0] = v79;
          objc_msgSend(v210, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v256, 1), @"dataStatements");
          v244 = (__CFString *)v231;
          v245 = v76;
          v246 = v77;
          objc_msgSend(v210, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v244, 3), @"triggerCreationStatements");

          v254 = v206;
          v255 = v210;
          v80 = (void *)MEMORY[0x1E4F1C978];
          return [v80 arrayWithObjects:&v254 count:2];
        }
        uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v11 = *MEMORY[0x1E4F1C3C8];
        v244 = @"derived attribute";
        v249 = v37;
        goto LABEL_116;
      default:
        uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v11 = *MEMORY[0x1E4F1C3C8];
        v236 = @"derived attribute";
        v237 = v5;
        v166 = (void *)MEMORY[0x1E4F1C9E8];
        v167 = &v237;
        v168 = &v236;
        goto LABEL_104;
    }
  }
  if (v6 != 3)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v234 = @"derived attribute";
    v235 = v5;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
    uint64_t v13 = @"currently unsupported (unsupported expression type)";
LABEL_117:
    v172 = v10;
    uint64_t v173 = v11;
    goto LABEL_118;
  }
  if (v9 == 1)
  {
    self;
    uint64_t v16 = +[NSSQLDerivedAttributeSQLGenerator _triggerColumnListComponentForAttributeKeypaths:startingAt:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a3, [a2 entity]);
    [a2 entity];
    self;
    self;
    v17 = (void *)+[NSSQLDerivedAttributeSQLGenerator _computeNewColumnTokenForKeypathExpression:governingEntity:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, objc_msgSend((id)objc_msgSend(a2, "propertyDescription"), "derivationExpression"), objc_msgSend(a2, "entity"));
    uint64_t v18 = [v17 stringByReplacingOccurrencesOfString:@"NEW." withString:&stru_1ED787880];
    return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, (uint64_t)v17, v18, v16);
  }
  else
  {
    if (v9 != 7)
    {
      if (v9 == 8)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v11 = *MEMORY[0x1E4F1C3C8];
        v240 = @"derived attribute";
        v241 = v5;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v241 forKeys:&v240 count:1];
        uint64_t v13 = @"malformed expression (dependent property is to many, derivation expression is not a function)";
      }
      else
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v11 = *MEMORY[0x1E4F1C3C8];
        v238 = @"derived attribute";
        v239 = v5;
        v166 = (void *)MEMORY[0x1E4F1C9E8];
        v167 = &v239;
        v168 = &v238;
LABEL_104:
        uint64_t v12 = [v166 dictionaryWithObjects:v167 forKeys:v168 count:1];
        uint64_t v13 = @"currently unsupported (unsupported keypath property type)";
      }
      goto LABEL_117;
    }
LABEL_13:
    self;
    v15 = (void *)[a3 anyObject];
    return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForToOneDerivationForDerivedAttribute:toOneKeypath:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, v15);
  }
}

+ (uint64_t)_parameterPropertyTokenForDerivedAttribute:(void *)a3 andKeypath:(id *)a4 onEntity:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v7 = [a2 propertyDescription];
  if ([a3 count] != 2)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v16 = @"derived attribute";
    v17[0] = v7;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v13 = @"Unsupported: (multi-step keypath)";
    goto LABEL_10;
  }
  uint64_t v8 = [a3 objectAtIndexedSubscript:1];
  if (a4) {
    a4 = (id *)[a4[5] objectForKey:v8];
  }
  if ([a4 propertyType] != 1)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = @"derived attribute";
    uint64_t v15 = v7;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v13 = @"Unsupported: (bad keypath, should be toOne.attribute)";
LABEL_10:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v13 userInfo:v12]);
  }

  return [a4 columnName];
}

+ (uint64_t)_generateSQLForToOneDerivationForDerivedAttribute:(void *)a3 toOneKeypath:
{
  v85[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v5 = [a2 entity];
  uint64_t v6 = (void *)[a2 propertyDescription];
  uint64_t v7 = (void *)[v6 derivationExpression];
  uint64_t v8 = [v7 expressionType];
  uint64_t v9 = [a3 objectAtIndexedSubscript:0];
  if (v5) {
    uint64_t v10 = (void *)[*(id *)(v5 + 40) objectForKey:v9];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (id *)[v10 destinationEntity];
  v76 = a2;
  uint64_t v77 = [a2 columnName];
  if (v8 != 4)
  {
    if (v8 == 3)
    {
      uint64_t v12 = +[NSSQLDerivedAttributeSQLGenerator _parameterPropertyTokenForDerivedAttribute:andKeypath:onEntity:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3, v11);
      uint64_t v67 = [NSString stringWithFormat:@"NEW.%@", v12];
      uint64_t v72 = v12;
      uint64_t v70 = v12;
      goto LABEL_13;
    }
    uint64_t v62 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v63 = *MEMORY[0x1E4F1C3C8];
    v82 = @"derived attribute";
    uint64_t v83 = v6;
    uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    uint64_t v65 = @"Unsupported: (unsupported expression for to one)";
LABEL_49:
    objc_exception_throw((id)[v62 exceptionWithName:v63 reason:v65 userInfo:v64]);
  }
  uint64_t v13 = +[NSSQLDerivedAttributeSQLGenerator _parameterPropertyTokenForDerivedAttribute:andKeypath:onEntity:]((uint64_t)NSSQLDerivedAttributeSQLGenerator, a2, a3, v11);
  uint64_t v14 = (char *)[v7 selector];
  uint64_t v70 = v13;
  if (sel_canonical_ == v14)
  {
    uint64_t v67 = [NSString stringWithFormat:@"NSCoreDataCanonical(NEW.%@)", v13];
    uint64_t v15 = [NSString stringWithFormat:@"NSCoreDataCanonical(%@)", v13];
  }
  else if (sel_uppercase_ == v14)
  {
    uint64_t v67 = [NSString stringWithFormat:@"NSCoreDataToUpper(NEW.%@)", v13];
    uint64_t v15 = [NSString stringWithFormat:@"NSCoreDataToUpper(%@)", v13];
  }
  else
  {
    if (sel_lowercase_ != v14)
    {
      uint64_t v62 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v63 = *MEMORY[0x1E4F1C3C8];
      uint64_t v84 = @"derived attribute";
      v85[0] = v6;
      uint64_t v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
      uint64_t v65 = @"Unsupported: (unsupported function for to one)";
      goto LABEL_49;
    }
    uint64_t v67 = [NSString stringWithFormat:@"NSCoreDataToLower(NEW.%@)", v13];
    uint64_t v15 = [NSString stringWithFormat:@"NSCoreDataToLower(%@)", v13];
  }
  uint64_t v72 = v15;
LABEL_13:
  uint64_t v16 = [(id)v5 tableName];
  uint64_t v17 = [v11 tableName];
  uint64_t v74 = [v10 columnName];
  uint64_t v18 = [[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@_SOURCE", v16, objc_msgSend((id)objc_msgSend(v6, "entity"), "name"), objc_msgSend(v6, "name")];
  uint64_t v75 = v17;
  uint64_t v19 = [[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@_PARAMETER", v17, objc_msgSend((id)objc_msgSend(v6, "entity"), "name"), objc_msgSend(v6, "name")];
  v20 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v18];
  v71 = (void *)v18;
  v21 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE", v18];
  v22 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v19];
  uint64_t v73 = (void *)v19;
  v23 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE", v19];
  v24 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v25 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v26 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v20];

  [v24 addObject:v26];
  v27 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v21];

  [v24 addObject:v27];
  uint64_t v28 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v22];

  [v24 addObject:v28];
  uint64_t v29 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v23];

  [v24 addObject:v29];
  v81[0] = v26;
  v81[1] = v27;
  v81[2] = v28;
  v81[3] = v29;
  v68 = v25;
  objc_msgSend(v25, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v81, 4), @"dropStatements");
  BOOL v69 = v24;
  if (v5)
  {
    v30 = v71;
    unint64_t v31 = 0x1E4F29000uLL;
    uint64_t v32 = v74;
    if (*(void *)(v5 + 160)
      || (v38 = *(void **)(v5 + 152)) != 0 && [v38 count] && *(void *)(v5 + 160))
    {
      uint64_t v33 = *(unsigned int *)(v5 + 184);
      uint64_t v34 = *(unsigned int *)(v5 + 188);
      id v35 = [NSString alloc];
      if (v33 >= v34)
      {
        uint64_t v36 = objc_msgSend(v35, "initWithFormat:", @"%d = NEW.Z_ENT", v33);
        uint64_t v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d = Z_ENT", v33, v66);
      }
      else
      {
        uint64_t v36 = objc_msgSend(v35, "initWithFormat:", @"%d <= NEW.Z_ENT AND NEW.Z_ENT <= %d", v33, v34);
        uint64_t v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d <= Z_ENT AND Z_ENT <= %d", v33, v34);
      }
      uint64_t v39 = (void *)v37;
    }
    else
    {
      uint64_t v36 = 0;
      uint64_t v39 = 0;
    }
  }
  else
  {
    uint64_t v36 = 0;
    uint64_t v39 = 0;
    v30 = v71;
    unint64_t v31 = 0x1E4F29000;
    uint64_t v32 = v74;
  }
  id v40 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v40 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW", v30, v16];
  [v40 appendString:@" BEGIN"];
  if (v36) {
    uint64_t v41 = (__CFString *)[*(id *)(v31 + 24) stringWithFormat:@" AND %@", v36];
  }
  else {
    uint64_t v41 = &stru_1ED787880;
  }
  objc_msgSend(v40, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = NEW.%@) WHERE Z_PK = NEW.Z_PK%@;",
    v16,
    v77,
    v72,
    v75,
    v32,
    v41);
  uint64_t v42 = [v76 name];
  if (v36) {
    v43 = (__CFString *)[*(id *)(v31 + 24) stringWithFormat:@" AND %@", v36];
  }
  else {
    v43 = &stru_1ED787880;
  }
  objc_msgSend(v40, "appendFormat:", @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK%@;",
    v16,
    v42,
    v77,
    v16,
    v43);
  [v40 appendFormat:@" END"];
  id v44 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (v36) {
    v45 = (__CFString *)[*(id *)(v31 + 24) stringWithFormat:@" WHEN %@", v36];
  }
  else {
    v45 = &stru_1ED787880;
  }
  [v44 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW%@", v30, v74, v16, v45];
  [v44 appendString:@" BEGIN"];
  objc_msgSend(v44, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = NEW.%@) WHERE Z_PK = NEW.Z_PK;",
    v16,
    v77,
    v72,
    v75,
    v74);
  objc_msgSend(v44, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
    v16,
    [v76 name],
    v77,
    v16);
  [v44 appendFormat:@" END"];
  id v46 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v46 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW", v73, v75];
  [v46 appendString:@" BEGIN"];
  if (v39)
  {
    unint64_t v47 = v31;
    v48 = (__CFString *)[*(id *)(v31 + 24) stringWithFormat:@" AND %@", v39];
  }
  else
  {
    v48 = &stru_1ED787880;
    unint64_t v47 = v31;
  }
  [v46 appendFormat:@" UPDATE %@ SET %@ = %@ WHERE %@ = NEW.Z_PK%@;", v16, v77, v67, v74, v48];
  uint64_t v49 = [v76 name];
  if (v39) {
    v50 = (__CFString *)[*(id *)(v47 + 24) stringWithFormat:@" AND %@", v39];
  }
  else {
    v50 = &stru_1ED787880;
  }
  objc_msgSend(v46, "appendFormat:", @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE %@ = NEW.Z_PK%@;",
    v16,
    v49,
    v77,
    v16,
    v74,
    v50);
  [v46 appendFormat:@" END"];
  id v51 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v51 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW", v73, v70, v75];
  [v51 appendString:@" BEGIN"];
  if (v39) {
    uint64_t v52 = (__CFString *)[*(id *)(v47 + 24) stringWithFormat:@" AND %@", v39];
  }
  else {
    uint64_t v52 = &stru_1ED787880;
  }
  [v51 appendFormat:@" UPDATE %@ SET %@ = %@ WHERE %@ = NEW.Z_PK%@;", v16, v77, v67, v74, v52];
  uint64_t v53 = [v76 name];
  if (v39) {
    uint64_t v54 = (__CFString *)[*(id *)(v47 + 24) stringWithFormat:@" AND %@", v39];
  }
  else {
    uint64_t v54 = &stru_1ED787880;
  }
  objc_msgSend(v51, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE %@ = NEW.Z_PK%@;",
    v16,
    v53,
    v77,
    v16,
    v74,
    v54);
  [v51 appendFormat:@" END"];

  uint64_t v55 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v40];
  [v69 addObject:v55];

  id v56 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v44];
  [v69 addObject:v56];

  uint64_t v57 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v46];
  [v69 addObject:v57];

  uint64_t v58 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v51];
  [v69 addObject:v58];

  v59 = (void *)[[NSString alloc] initWithFormat:@"UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = %@.%@)%@", v16, v77, v72, v75, v16, v74, &stru_1ED787880];
  v60 = [[NSSQLiteStatement alloc] initWithEntity:v5 sqlString:v59];

  v80 = v60;
  objc_msgSend(v68, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v80, 1), @"dataStatements");

  v79[0] = v55;
  v79[1] = v56;
  v79[2] = v57;
  v79[3] = v58;
  objc_msgSend(v68, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v79, 4), @"triggerCreationStatements");
  v78[0] = v69;
  v78[1] = v68;
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
}

+ (uint64_t)_generateTriggerForAttribute:(uint64_t)a1 newToken:(void *)a2 updateToken:(uint64_t)a3 triggerColumnListComponent:(uint64_t)a4 triggerColumnWhereComponent:(void *)a5
{
  v45[2] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v7 = [a2 entity];
  uint64_t v8 = (void *)[a2 propertyDescription];
  uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"Z_DA_%@_%@_%@", objc_msgSend((id)v7, "tableName"), objc_msgSend((id)objc_msgSend(v8, "entity"), "name"), objc_msgSend(v8, "name")];
  uint64_t v10 = [(id)v7 tableName];
  uint64_t v11 = [a2 columnName];
  uint64_t v12 = [[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v9];
  v38 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE", v9];
  if (objc_msgSend((id)objc_msgSend(v8, "derivationExpression"), "expressionType") == 3
    && (uint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "derivationExpression"), "keyPath"), v7)
    && (uint64_t v14 = (void *)[*(id *)(v7 + 40) objectForKey:v13]) != 0)
  {
    int v41 = objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "usesMergeableStorage");
  }
  else
  {
    int v41 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v15 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW", v9, v10];
  if ([a5 length]) {
    [v15 appendFormat:@" WHEN (NEW.%@ NOT NULL)", a5];
  }
  [v15 appendString:@" BEGIN"];
  if (v41) {
    objc_msgSend(v15, "appendFormat:", @" UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) WHERE Z_PK = NEW.Z_PK;",
  }
      v10,
      v11,
      v10,
      [a2 name],
      a4);
  else {
    [v15 appendFormat:@" UPDATE %@ SET %@ = %@ WHERE Z_PK = NEW.Z_PK;", v10, v11, a3, v32, v34];
  }
  objc_msgSend(v15, "appendFormat:", @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
    v10,
    [a2 name],
    v11,
    v10);
  [v15 appendFormat:@" END"];
  id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v16 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW", v9, a5, v10];
  if ([&stru_1ED787880 length]) {
    [v16 appendFormat:@" %@", &stru_1ED787880];
  }
  [v16 appendString:@" BEGIN"];
  if (v41) {
    objc_msgSend(v16, "appendFormat:", @" UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) WHERE Z_PK = NEW.Z_PK;",
  }
      v10,
      v11,
      v10,
      [a2 name],
      a4);
  else {
    [v16 appendFormat:@" UPDATE %@ SET %@ = %@ WHERE Z_PK = NEW.Z_PK;", v10, v11, a3, v33, v35];
  }
  uint64_t v17 = (void *)v12;
  objc_msgSend(v16, "appendFormat:", @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
    v10,
    [a2 name],
    v11,
    v10);
  [v16 appendFormat:@" END"];

  uint64_t v18 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v20 = [[NSSQLiteStatement alloc] initWithEntity:v7 sqlString:v12];
  [v18 addObject:v20];

  v21 = [[NSSQLiteStatement alloc] initWithEntity:v7 sqlString:v38];
  [v18 addObject:v21];

  v45[0] = v20;
  v45[1] = v21;
  objc_msgSend(v19, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v45, 2), @"dropStatements");

  v22 = [[NSSQLiteStatement alloc] initWithEntity:v7 sqlString:v15];
  [v18 addObject:v22];

  v23 = [[NSSQLiteStatement alloc] initWithEntity:v7 sqlString:v16];
  [v18 addObject:v23];

  if (v7
    && (*(void *)(v7 + 160)
     || (uint64_t v25 = *(void **)(v7 + 152)) != 0 && [v25 count] && *(void *)(v7 + 160)))
  {
    v24 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"WHERE %d <= Z_ENT AND Z_ENT <= %d", *(unsigned int *)(v7 + 184), *(unsigned int *)(v7 + 188));
  }
  else
  {
    v24 = &stru_1ED787880;
  }
  v26 = v24;
  id v27 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (v41) {
    uint64_t v28 = [v27 initWithFormat:@"UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) %@", v10, v11, v10, objc_msgSend(a2, "name"), a4, v26];
  }
  else {
    uint64_t v28 = [v27 initWithFormat:@"UPDATE %@ SET %@ = %@ %@", v10, v11, a4, v26, v36, v37];
  }
  uint64_t v29 = (void *)v28;

  v30 = [[NSSQLiteStatement alloc] initWithEntity:v7 sqlString:v29];
  id v44 = v30;
  objc_msgSend(v19, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v44, 1), @"dataStatements");
  v43[0] = v22;
  v43[1] = v23;
  objc_msgSend(v19, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v43, 2), @"triggerCreationStatements");

  v42[0] = v18;
  v42[1] = v19;
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
}

+ (uint64_t)_computeNewColumnTokenForKeypathExpression:(uint64_t)a3 governingEntity:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v5 = [a2 keyPath];
  if (!a3 || (uint64_t v6 = (void *)[*(id *)(a3 + 40) objectForKey:v5]) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    uint64_t v19 = @"bad keypath";
    v20[0] = a2;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    uint64_t v14 = @"bad keypath";
    goto LABEL_7;
  }
  uint64_t v7 = v6;
  if (objc_msgSend((id)objc_msgSend(v6, "propertyDescription"), "_propertyType") != 2)
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    uint64_t v17 = @"bad keypath";
    uint64_t v18 = a2;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v14 = @"currently unsupported (bad root property type)";
    uint64_t v12 = v15;
    uint64_t v13 = v16;
LABEL_7:
    objc_exception_throw((id)[v12 exceptionWithName:v13 reason:v14 userInfo:v11]);
  }
  return [NSString stringWithFormat:@"NEW.%@", objc_msgSend(v7, "columnName")];
}

+ (__CFString)_triggerColumnListComponentForAttributeKeypaths:(uint64_t)a3 startingAt:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self;
  if (![a2 count]
    || [a2 count] == 1 && !objc_msgSend((id)objc_msgSend(a2, "anyObject"), "count"))
  {
    return @"Z_OPT";
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    char v9 = 1;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        if ((unint64_t)[v11 count] >= 2)
        {
          uint64_t v17 = *MEMORY[0x1E4F1C3C8];
          v22 = @"problem keypath";
          v23 = v11;
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v17, @"currently unsupported (extended keypath)", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1)));
        }
        uint64_t v12 = [v11 firstObject];
        if (a3) {
          uint64_t v13 = (void *)[*(id *)(a3 + 40) objectForKey:v12];
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v14 = [v13 columnName];
        if ((v9 & 1) == 0) {
          [v5 appendString:@", "];
        }
        [v5 appendString:v14];
        char v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      uint64_t v15 = [a2 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v7 = v15;
      char v9 = 0;
    }
    while (v15);
  }
  return (__CFString *)v5;
}

@end