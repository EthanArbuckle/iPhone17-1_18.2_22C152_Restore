@interface AMDatabase
+ (BOOL)checkDatabaseReadAccess:(id *)a3;
+ (BOOL)closeDatabase:(id *)a3;
+ (BOOL)openDatabase:(id *)a3;
+ (BOOL)openDatabaseWithAcousticParameterFilter:(unint64_t)a3 error:(id *)a4;
+ (id)acousticParameters:(id)a3 forMaterialName:(id)a4 error:(id *)a5;
+ (id)acousticParameters:(id)a3 forSemanticLabels:(id)a4 error:(id *)a5;
+ (id)labelsForSemanticType:(id)a3 error:(id *)a4;
+ (id)materialNamesForAcousticParameterType:(id)a3 error:(id *)a4;
@end

@implementation AMDatabase

+ (BOOL)openDatabase:(id *)a3
{
  if (_dbPtr) {
    DBIOCloseDatabase((void **)&_dbPtr, a3);
  }
  v5 = [MEMORY[0x263F086E0] bundleForClass:a1];
  v6 = [v5 resourcePath];
  v7 = [v6 stringByAppendingPathComponent:@"AMDatabase.db"];

  v8 = [NSURL fileURLWithPath:v7];
  v9 = DBIOOpenDatabaseFromURL(v8, a3);
  _dbPtr = (uint64_t)v9;
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = DBIODatabaseValidatedWithoutError(v9, a3);
  if ((v10 & 1) == 0)
  {
    DBIOCloseDatabase((void **)&_dbPtr, a3);
LABEL_9:
    BOOL v20 = 0;
    goto LABEL_10;
  }
  v11 = AbsorptionTable::get((AbsorptionTable *)v10);
  materialCachedTable<AMAbsorption>::readTable((uint64_t)v11, a3);
  v13 = ScatteringTable::get(v12);
  materialCachedTable<AMScattering>::readTable((uint64_t)v13, a3);
  v15 = SoundReductionTable::get(v14);
  materialCachedTable<AMSoundReductionIndex>::readTable((uint64_t)v15, a3);
  v16 = (void *)SemanticsTableCached;
  if (!SemanticsTableCached)
  {
    v17 = objc_alloc_init(SemanticsTable);
    v18 = (void *)SemanticsTableCached;
    SemanticsTableCached = (uint64_t)v17;

    v16 = (void *)SemanticsTableCached;
  }
  [v16 readTable:a3];
  _parameterFilter = 0;
  *(void *)&long long v19 = 255;
  *((void *)&v19 + 1) = 255;
  long long v22 = v19;
  uint64_t v23 = 0xFFFFLL;
  _defaultMaterial = [(id)SemanticsTableCached getMaterialsForPair:&v22];
  BOOL v20 = 1;
LABEL_10:

  return v20;
}

+ (BOOL)openDatabaseWithAcousticParameterFilter:(unint64_t)a3 error:(id *)a4
{
  v5 = (AbsorptionTable *)+[AMDatabase openDatabase:a4];
  BOOL v6 = (char)v5;
  if (v5)
  {
    if (a3 - 1 <= 2)
    {
      v7 = *(&off_2647FBF00 + a3 - 1);
      v8 = AbsorptionTable::get(v5);
      materialCachedTable<AMAbsorption>::applyAbsFilter((uint64_t)v8, v7);
    }
    _parameterFilter = a3;
  }
  return v6;
}

+ (BOOL)closeDatabase:(id *)a3
{
  return DBIOCloseDatabase((void **)&_dbPtr, a3);
}

+ (BOOL)checkDatabaseReadAccess:(id *)a3
{
  if (_dbPtr) {
    return 1;
  }
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = [v3 objectForKey:@"com.apple.acousticmaterials.parameterfilter"];

  if (v4 && [v4 unsignedIntValue] <= 7) {
    uint64_t v5 = [v4 unsignedIntValue];
  }
  else {
    uint64_t v5 = 1;
  }
  _parameterFilter = v5;
  BOOL v6 = +[AMDatabase openDatabaseWithAcousticParameterFilter:error:](AMDatabase, "openDatabaseWithAcousticParameterFilter:error:");

  return v6;
}

+ (id)materialNamesForAcousticParameterType:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (+[AMDatabase checkDatabaseReadAccess:a4])
  {
    BOOL v6 = (AbsorptionTable *)[v5 isEqualToString:@"acoustic absorption"];
    if (v6)
    {
      v7 = AbsorptionTable::get(v6);
      uint64_t v8 = materialCachedTable<AMAbsorption>::materialNames((uint64_t)v7);
      goto LABEL_8;
    }
    v9 = (ScatteringTable *)[v5 isEqualToString:@"acoustic scattering"];
    if (v9)
    {
      uint64_t v10 = ScatteringTable::get(v9);
      uint64_t v8 = materialCachedTable<AMScattering>::materialNames((uint64_t)v10);
      goto LABEL_8;
    }
    v11 = (SoundReductionTable *)[v5 isEqualToString:@"acoustic sound reduction index"];
    if (v11)
    {
      v12 = SoundReductionTable::get(v11);
      uint64_t v8 = materialCachedTable<AMSoundReductionIndex>::materialNames((uint64_t)v12);
LABEL_8:
      v13 = (void *)v8;
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  v13 = 0;
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v13)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    v15 = [NSString stringWithFormat:@"Materials for %@ don't exist in the database.", v5, *MEMORY[0x263F08320]];
    v19[0] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a4 = [v14 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v16];
  }
LABEL_13:

  return v13;
}

+ (id)labelsForSemanticType:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[AMDatabase checkDatabaseReadAccess:a4])
  {
    BOOL v6 = [(id)SemanticsTableCached labelsForSemanticType:v5 error:a4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)acousticParameters:(id)a3 forMaterialName:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!+[AMDatabase checkDatabaseReadAccess:a5])
  {
    a5 = 0;
    goto LABEL_16;
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v10 = (AbsorptionTable *)[v7 isEqualToString:@"acoustic absorption"];
  if (v10)
  {
    v11 = AbsorptionTable::get(v10);
    v12 = materialCachedTable<AMAbsorption>::getMaterial(v11, v8, (uint64_t *)a5);
    if (v12) {
      goto LABEL_11;
    }
LABEL_14:
    a5 = 0;
    goto LABEL_15;
  }
  v13 = (ScatteringTable *)[v7 isEqualToString:@"acoustic scattering"];
  if (v13)
  {
    v14 = ScatteringTable::get(v13);
    v12 = materialCachedTable<AMScattering>::getMaterial(v14, v8, (uint64_t *)a5);
    if (v12) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  v15 = (SoundReductionTable *)[v7 isEqualToString:@"acoustic sound reduction index"];
  if (!v15)
  {
    if (!a5) {
      goto LABEL_15;
    }
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = [NSString stringWithFormat:@"Unknown acoustic parameter type [%@]", v7, *MEMORY[0x263F08320]];
    v22[0] = v18;
    long long v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    *a5 = [v17 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v19];

    goto LABEL_14;
  }
  v16 = SoundReductionTable::get(v15);
  v12 = materialCachedTable<AMSoundReductionIndex>::getMaterial(v16, v8, (uint64_t *)a5);
  if (!v12) {
    goto LABEL_14;
  }
LABEL_11:
  [v9 setObject:v12 forKey:v7];

  a5 = (id *)[v9 copy];
LABEL_15:

LABEL_16:
  return a5;
}

+ (id)acousticParameters:(id)a3 forSemanticLabels:(id)a4 error:(id *)a5
{
  v67[1] = *MEMORY[0x263EF8340];
  id v52 = a3;
  id v53 = a4;
  if (!v52 || !v53 || ![v52 count] || !objc_msgSend(v53, "count"))
  {
    if (!a5) {
      goto LABEL_13;
    }
    long long v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v66 = *MEMORY[0x263F08320];
    uint64_t v23 = [NSString stringWithFormat:@"At least one query input (parameterTypes, semanticQuery) was empty."];
    v67[0] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v67 forKeys:&v66 count:1];
    *a5 = [v22 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v24];

    goto LABEL_12;
  }
  if (!+[AMDatabase checkDatabaseReadAccess:a5]) {
    goto LABEL_8;
  }
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v52];
  id v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"acoustic absorption", @"acoustic scattering", @"acoustic sound reduction index", 0);
  uint64_t v10 = [v8 setWithArray:v9];
  char v11 = [v7 isSubsetOfSet:v10];

  if ((v11 & 1) == 0)
  {
    if (!a5) {
      goto LABEL_13;
    }
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v64 = *MEMORY[0x263F08320];
    v27 = [NSString stringWithFormat:@"At least one requested acoustic parameter type not found in database."];
    v65 = v27;
    v28 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    *a5 = [v26 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v28];

    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x263EFFA08];
  v13 = [v53 allKeys];
  v14 = [v12 setWithArray:v13];
  v15 = (void *)MEMORY[0x263EFFA08];
  v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"visual material", @"ARMeshMaterial", @"object", @"ARMeshClassification", 0);
  v17 = [v15 setWithArray:v16];
  char v18 = [v14 isSubsetOfSet:v17];

  if ((v18 & 1) == 0)
  {
    if (!a5) {
      goto LABEL_13;
    }
    v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v62 = *MEMORY[0x263F08320];
    v50 = [NSString stringWithFormat:@"At least one requested semantic type not found in database."];
    v63 = v50;
    v51 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    *a5 = [v49 errorWithDomain:@"com.apple.acousticmaterials.ErrorDomain" code:11 userInfo:v51];

LABEL_12:
    a5 = 0;
    goto LABEL_13;
  }
LABEL_8:
  unint64_t v60 = 255;
  long long v19 = [v53 objectForKey:@"visual material"];

  if (v19)
  {
    BOOL v20 = (void *)SemanticsTableCached;
    uint64_t v21 = [v53 objectForKey:@"visual material"];
    [v20 getARMeshMaterialID:v21 ARMeshMaterialID:&v60];
  }
  else
  {
    v29 = [v53 objectForKey:@"ARMeshMaterial"];

    if (v29)
    {
      v30 = [v53 objectForKey:@"ARMeshMaterial"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unint64_t v60 = [v30 longValue];
      }
    }
  }
  unint64_t v59 = 255;
  v31 = [v53 objectForKey:@"object"];
  BOOL v32 = v31 == 0;

  if (!v32)
  {
    v33 = (void *)SemanticsTableCached;
    v34 = [v53 objectForKey:@"object"];
    [v33 getARMeshClassificationID:v34 ARMeshClassificationID:&v59];
LABEL_24:

    goto LABEL_25;
  }
  v47 = [v53 objectForKey:@"ARMeshClassification"];
  BOOL v48 = v47 == 0;

  if (!v48)
  {
    v34 = [v53 objectForKey:@"ARMeshClassification"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v59 = [v34 longValue];
    }
    goto LABEL_24;
  }
LABEL_25:
  v58[0] = v60;
  v58[1] = v59;
  if (v60 >= v59) {
    unint64_t v35 = v60 + v60 * v60 + v59;
  }
  else {
    unint64_t v35 = v60 + v59 * v59;
  }
  v58[2] = v35;
  a5 = (id *)[(id)SemanticsTableCached getMaterialsForPair:v58];
  if (a5)
  {
    id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v37 = v52;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v55 != v39) {
            objc_enumerationMutation(v37);
          }
          v41 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          char v42 = [v41 isEqualToString:@"acoustic absorption"];
          v43 = a5;
          v44 = @"acoustic absorption";
          if ((v42 & 1) == 0)
          {
            char v45 = objc_msgSend(v41, "isEqualToString:", @"acoustic scattering", @"acoustic absorption");
            v43 = a5 + 1;
            v44 = @"acoustic scattering";
            if ((v45 & 1) == 0)
            {
              int v46 = objc_msgSend(v41, "isEqualToString:", @"acoustic sound reduction index", @"acoustic scattering");
              v43 = a5 + 2;
              v44 = @"acoustic sound reduction index";
              if (!v46) {
                continue;
              }
            }
          }
          [v36 setObject:*v43 forKey:v44];
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v38);
    }

    a5 = (id *)[v36 copy];
  }
LABEL_13:

  return a5;
}

@end