@interface LNBundleMetadata
+ (BOOL)supportsSecureCoding;
+ (int64_t)latestMetadataVersion;
- (BOOL)isEqual:(id)a3;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13 assistantIntents:(id)a14 assistantIntentNegativePhrases:(id)a15;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13 assistantIntents:(id)a14 assistantIntentNegativePhrases:(id)a15 assistantEntities:(id)a16;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 version:(int64_t)a9 generator:(id)a10;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcuts:(id)a7 version:(int64_t)a8 generator:(id)a9;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 version:(int64_t)a7;
- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 version:(int64_t)a7 generator:(id)a8;
- (LNBundleMetadata)initWithArray:(id)a3;
- (LNBundleMetadata)initWithBundle:(id)a3 usingEffectiveBundleIdentifier:(id)a4 error:(id *)a5;
- (LNBundleMetadata)initWithCoder:(id)a3;
- (LNBundleMetadataGeneratorDescription)generator;
- (NSArray)assistantEntities;
- (NSArray)assistantIntentNegativePhrases;
- (NSArray)assistantIntents;
- (NSArray)autoShortcuts;
- (NSArray)examplePhrases;
- (NSArray)negativePhrases;
- (NSDictionary)actions;
- (NSDictionary)entities;
- (NSDictionary)enums;
- (NSDictionary)queries;
- (NSString)autoShortcutProviderMangledName;
- (id)_initWithMetadataFileURL:(id)a3 bundleURL:(id)a4 effectiveBundleIdentifier:(id)a5 error:(id *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)verboseDescription;
- (int64_t)shortcutTileColor;
- (int64_t)version;
- (unint64_t)hash;
- (void)applyAttributionBundleIdentifier:(id)a3 icon:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNBundleMetadata

- (NSString)autoShortcutProviderMangledName
{
  return self->_autoShortcutProviderMangledName;
}

+ (int64_t)latestMetadataVersion
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantEntities, 0);
  objc_storeStrong((id *)&self->_assistantIntentNegativePhrases, 0);
  objc_storeStrong((id *)&self->_assistantIntents, 0);
  objc_storeStrong((id *)&self->_examplePhrases, 0);
  objc_storeStrong((id *)&self->_negativePhrases, 0);
  objc_storeStrong((id *)&self->_autoShortcutProviderMangledName, 0);
  objc_storeStrong((id *)&self->_autoShortcuts, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_enums, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (NSDictionary)enums
{
  return self->_enums;
}

- (NSDictionary)entities
{
  return self->_entities;
}

- (id)_initWithMetadataFileURL:(id)a3 bundleURL:(id)a4 effectiveBundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EC016120);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_19CBBF280();
  MEMORY[0x1F4188790](v11);
  sub_19CBBF240();
  if (a4)
  {
    sub_19CBBF240();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, v12, 1, v11);
  id v13 = a5;
  LNBundleMetadata.init(metadataFileURL:bundleURL:effectiveBundleIdentifier:)();
  return result;
}

- (LNBundleMetadata)initWithBundle:(id)a3 usingEffectiveBundleIdentifier:(id)a4 error:(id *)a5
{
  return (LNBundleMetadata *)LNBundleMetadata.init(bundle:using:)(a3, a4);
}

- (NSArray)assistantEntities
{
  return self->_assistantEntities;
}

- (NSArray)assistantIntentNegativePhrases
{
  return self->_assistantIntentNegativePhrases;
}

- (NSArray)assistantIntents
{
  return self->_assistantIntents;
}

- (NSArray)examplePhrases
{
  return self->_examplePhrases;
}

- (NSArray)negativePhrases
{
  return self->_negativePhrases;
}

- (int64_t)shortcutTileColor
{
  return self->_shortcutTileColor;
}

- (NSArray)autoShortcuts
{
  return self->_autoShortcuts;
}

- (LNBundleMetadataGeneratorDescription)generator
{
  return self->_generator;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDictionary)actions
{
  return self->_actions;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNBundleMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_78:

      goto LABEL_79;
    }
    v7 = [(LNBundleMetadata *)self actions];
    uint64_t v8 = [(LNBundleMetadata *)v6 actions];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_76;
      }
      int v15 = [v9 isEqualToDictionary:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_77:

        goto LABEL_78;
      }
    }
    v16 = [(LNBundleMetadata *)self entities];
    v17 = [(LNBundleMetadata *)v6 entities];
    id v14 = v16;
    id v18 = v17;
    id v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_75;
      }
      int v21 = [v14 isEqualToDictionary:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_76:

        goto LABEL_77;
      }
    }
    v22 = [(LNBundleMetadata *)self queries];
    v23 = [(LNBundleMetadata *)v6 queries];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    id v108 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_74;
      }
      LODWORD(v12) = [v20 isEqualToDictionary:v24];

      if (!v12) {
        goto LABEL_75;
      }
    }
    v107 = v19;
    v26 = [(LNBundleMetadata *)self enums];
    v27 = [(LNBundleMetadata *)v6 enums];
    id v28 = v26;
    id v29 = v27;
    v105 = v29;
    id v106 = v28;
    if (v28 == v29)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v107;
        goto LABEL_72;
      }
      v30 = v29;
      v19 = v107;
      if (!v29)
      {
LABEL_72:

        goto LABEL_73;
      }
      int v31 = [v28 isEqualToDictionary:v29];

      if (!v31) {
        goto LABEL_36;
      }
    }
    int64_t v32 = [(LNBundleMetadata *)self version];
    if (v32 != [(LNBundleMetadata *)v6 version])
    {
LABEL_36:
      LOBYTE(v12) = 0;
      v19 = v107;
LABEL_73:
      v25 = v105;
      id v20 = v106;
LABEL_74:

      id v20 = v108;
LABEL_75:

      goto LABEL_76;
    }
    v33 = [(LNBundleMetadata *)self generator];
    v34 = [(LNBundleMetadata *)v6 generator];
    id v28 = v33;
    id v35 = v34;
    id v103 = v28;
    v104 = v35;
    if (v28 == v35)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v36 = v35;
        goto LABEL_70;
      }
      v36 = v35;
      v19 = v107;
      if (!v35)
      {
LABEL_71:

        id v28 = v103;
        v30 = v104;
        goto LABEL_72;
      }
      int v37 = [v28 isEqual:v35];

      if (!v37)
      {
        LOBYTE(v12) = 0;
        v19 = v107;
        v30 = v104;
        goto LABEL_72;
      }
    }
    v38 = [(LNBundleMetadata *)self autoShortcuts];
    v39 = [(LNBundleMetadata *)v6 autoShortcuts];
    id v40 = v38;
    id v41 = v39;
    id v42 = v41;
    if (v40 == v41)
    {
      id v102 = v41;

      id v101 = v40;
    }
    else
    {
      LOBYTE(v12) = 0;
      v43 = v41;
      id v44 = v40;
      if (!v40 || !v41) {
        goto LABEL_66;
      }
      v45 = v41;
      v46 = v40;
      int v47 = [v40 isEqualToArray:v41];
      id v102 = v45;

      id v101 = v46;
      if (!v47) {
        goto LABEL_67;
      }
    }
    int64_t v48 = [(LNBundleMetadata *)self shortcutTileColor];
    if (v48 != [(LNBundleMetadata *)v6 shortcutTileColor])
    {
LABEL_67:
      LOBYTE(v12) = 0;
      goto LABEL_68;
    }
    v49 = [(LNBundleMetadata *)self negativePhrases];
    v50 = [(LNBundleMetadata *)v6 negativePhrases];

    if (v49 != v50)
    {
      uint64_t v12 = [(LNBundleMetadata *)self negativePhrases];
      if (!v12) {
        goto LABEL_68;
      }
      v51 = [(LNBundleMetadata *)v6 negativePhrases];

      if (!v51) {
        goto LABEL_67;
      }
      v52 = (void *)MEMORY[0x1E4F1CAD0];
      v96 = [(LNBundleMetadata *)self negativePhrases];
      v53 = [v52 setWithArray:v96];
      v54 = (void *)MEMORY[0x1E4F1CAD0];
      v55 = [(LNBundleMetadata *)v6 negativePhrases];
      v56 = [v54 setWithArray:v55];
      int v92 = [v53 isEqualToSet:v56];

      if (!v92) {
        goto LABEL_67;
      }
    }
    v57 = [(LNBundleMetadata *)self examplePhrases];
    v58 = [(LNBundleMetadata *)v6 examplePhrases];

    if (v57 != v58)
    {
      uint64_t v12 = [(LNBundleMetadata *)self examplePhrases];
      if (!v12) {
        goto LABEL_68;
      }
      v59 = [(LNBundleMetadata *)v6 examplePhrases];

      if (!v59) {
        goto LABEL_67;
      }
      v60 = (void *)MEMORY[0x1E4F1CAD0];
      v97 = [(LNBundleMetadata *)self examplePhrases];
      v61 = [v60 setWithArray:v97];
      v62 = (void *)MEMORY[0x1E4F1CAD0];
      v63 = [(LNBundleMetadata *)v6 examplePhrases];
      v64 = [v62 setWithArray:v63];
      int v93 = [v61 isEqualToSet:v64];

      if (!v93) {
        goto LABEL_67;
      }
    }
    v65 = [(LNBundleMetadata *)self assistantIntents];
    v66 = [(LNBundleMetadata *)v6 assistantIntents];

    if (v65 != v66)
    {
      uint64_t v12 = [(LNBundleMetadata *)self assistantIntents];
      if (!v12) {
        goto LABEL_68;
      }
      v67 = [(LNBundleMetadata *)v6 assistantIntents];

      if (!v67) {
        goto LABEL_67;
      }
      v68 = (void *)MEMORY[0x1E4F1CAD0];
      v98 = [(LNBundleMetadata *)self assistantIntents];
      v69 = [v68 setWithArray:v98];
      v70 = (void *)MEMORY[0x1E4F1CAD0];
      v71 = [(LNBundleMetadata *)v6 assistantIntents];
      v72 = [v70 setWithArray:v71];
      int v94 = [v69 isEqualToSet:v72];

      if (!v94) {
        goto LABEL_67;
      }
    }
    v73 = [(LNBundleMetadata *)self assistantIntentNegativePhrases];
    v74 = [(LNBundleMetadata *)v6 assistantIntentNegativePhrases];

    if (v73 != v74)
    {
      uint64_t v12 = [(LNBundleMetadata *)self assistantIntentNegativePhrases];
      if (!v12) {
        goto LABEL_68;
      }
      v75 = [(LNBundleMetadata *)v6 assistantIntentNegativePhrases];

      if (!v75) {
        goto LABEL_67;
      }
      v76 = (void *)MEMORY[0x1E4F1CAD0];
      v99 = [(LNBundleMetadata *)self assistantIntentNegativePhrases];
      v77 = [v76 setWithArray:v99];
      v78 = (void *)MEMORY[0x1E4F1CAD0];
      v79 = [(LNBundleMetadata *)v6 assistantIntentNegativePhrases];
      v80 = [v78 setWithArray:v79];
      int v95 = [v77 isEqualToSet:v80];

      if (!v95) {
        goto LABEL_67;
      }
    }
    v81 = [(LNBundleMetadata *)self assistantEntities];
    v82 = [(LNBundleMetadata *)v6 assistantEntities];

    if (v81 == v82)
    {
      LOBYTE(v12) = 1;
      goto LABEL_68;
    }
    uint64_t v12 = [(LNBundleMetadata *)self assistantEntities];
    if (v12)
    {
      v83 = [(LNBundleMetadata *)v6 assistantEntities];

      if (v83)
      {
        v84 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v100 = [(LNBundleMetadata *)self assistantEntities];
        v85 = [v84 setWithArray:v100];
        v86 = (void *)MEMORY[0x1E4F1CAD0];
        v87 = [(LNBundleMetadata *)v6 assistantEntities];
        v88 = [v86 setWithArray:v87];
        LOBYTE(v12) = [v85 isEqualToSet:v88];

        v43 = v85;
        id v44 = (id)v100;
        id v40 = v101;
        id v42 = v102;
LABEL_66:
        v89 = v42;
        v90 = v44;

        v36 = v89;
        id v28 = v40;
LABEL_70:
        v19 = v107;
        goto LABEL_71;
      }
      goto LABEL_67;
    }
LABEL_68:
    v19 = v107;
    id v28 = v101;
    v36 = v102;
    goto LABEL_71;
  }
  LOBYTE(v12) = 1;
LABEL_79:

  return (char)v12;
}

- (unint64_t)hash
{
  v27 = [(LNBundleMetadata *)self actions];
  uint64_t v3 = [v27 hash];
  v26 = [(LNBundleMetadata *)self entities];
  uint64_t v4 = [v26 hash] ^ v3;
  v25 = [(LNBundleMetadata *)self queries];
  uint64_t v5 = [v25 hash];
  v6 = [(LNBundleMetadata *)self enums];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  uint64_t v8 = [(LNBundleMetadata *)self autoShortcuts];
  uint64_t v9 = [v8 hash];
  int64_t v10 = v9 ^ [(LNBundleMetadata *)self shortcutTileColor];
  int64_t v11 = v7 ^ v10 ^ [(LNBundleMetadata *)self version];
  uint64_t v12 = [(LNBundleMetadata *)self generator];
  uint64_t v13 = [v12 hash];
  id v14 = [(LNBundleMetadata *)self negativePhrases];
  uint64_t v15 = v13 ^ [v14 hash];
  v16 = [(LNBundleMetadata *)self examplePhrases];
  uint64_t v17 = v15 ^ [v16 hash];
  id v18 = [(LNBundleMetadata *)self assistantIntents];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  id v20 = [(LNBundleMetadata *)self assistantIntentNegativePhrases];
  uint64_t v21 = [v20 hash];
  v22 = [(LNBundleMetadata *)self assistantEntities];
  unint64_t v23 = v19 ^ v21 ^ [v22 hash];

  return v23;
}

- (id)verboseDescription
{
  uint64_t v19 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v23 = NSStringFromClass(v3);
  id v18 = [(LNBundleMetadata *)self actions];
  v22 = [(LNBundleMetadata *)self entities];
  id v24 = [(LNBundleMetadata *)self queries];
  uint64_t v21 = [(LNBundleMetadata *)self enums];
  uint64_t v4 = [(LNBundleMetadata *)self autoShortcuts];
  int64_t v5 = [(LNBundleMetadata *)self shortcutTileColor];
  if ((unint64_t)(v5 - 1) > 0xD) {
    v6 = @"red";
  }
  else {
    v6 = off_1E590D750[v5 - 1];
  }
  uint64_t v7 = v6;
  int64_t v8 = [(LNBundleMetadata *)self version];
  uint64_t v9 = @"1.0";
  if (!v8) {
    uint64_t v9 = @"0.0";
  }
  int64_t v10 = v9;
  uint64_t v17 = [(LNBundleMetadata *)self generator];
  int64_t v11 = [(LNBundleMetadata *)self negativePhrases];
  uint64_t v12 = [(LNBundleMetadata *)self examplePhrases];
  uint64_t v13 = [(LNBundleMetadata *)self assistantIntents];
  id v14 = [(LNBundleMetadata *)self assistantIntentNegativePhrases];
  uint64_t v15 = [(LNBundleMetadata *)self assistantEntities];
  id v20 = [v19 stringWithFormat:@"<%@: %p, actions: %@, entities: %@, queries: %@, enums: %@, autoShortcuts: %@, shortcutTileColor: %@, version: %@, generator: %@>, negativePhrases: %@ examplePhrases: %@, assistantIntents: %@, assistantIntentNegativePhrases: %@, assistantEntities: %@>", v23, self, v18, v22, v24, v21, v4, v7, v10, v17, v11, v12, v13, v14, v15];

  return v20;
}

- (id)description
{
  v27 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v3);
  v30 = [(LNBundleMetadata *)self actions];
  uint64_t v23 = [v30 count];
  id v29 = [(LNBundleMetadata *)self entities];
  uint64_t v22 = [v29 count];
  id v28 = [(LNBundleMetadata *)self queries];
  uint64_t v21 = [v28 count];
  v26 = [(LNBundleMetadata *)self enums];
  uint64_t v20 = [v26 count];
  id v24 = [(LNBundleMetadata *)self autoShortcuts];
  uint64_t v18 = [v24 count];
  int64_t v4 = [(LNBundleMetadata *)self version];
  int64_t v5 = @"1.0";
  if (!v4) {
    int64_t v5 = @"0.0";
  }
  v6 = v5;
  uint64_t v17 = [(LNBundleMetadata *)self generator];
  uint64_t v19 = [(LNBundleMetadata *)self negativePhrases];
  uint64_t v7 = [v19 count];
  int64_t v8 = [(LNBundleMetadata *)self examplePhrases];
  uint64_t v9 = [v8 count];
  int64_t v10 = [(LNBundleMetadata *)self assistantIntents];
  uint64_t v11 = [v10 count];
  uint64_t v12 = [(LNBundleMetadata *)self assistantIntentNegativePhrases];
  uint64_t v13 = [v12 count];
  id v14 = [(LNBundleMetadata *)self assistantEntities];
  uint64_t v15 = [v27 stringWithFormat:@"<%@: %p, actions: %lu, entities: %lu, queries: %lu, enums: %lu, autoShortcuts: %lu, version: %@, generator: %@>, negativePhrases: %lu examplePhrases: %lu, assistantIntents: %lu, assistantIntentNegativePhrases: %lu, assistantEntities: %lu", v25, self, v23, v22, v21, v20, v18, v6, v17, v7, v9, v11, v13, objc_msgSend(v14, "count")];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = [LNBundleMetadata alloc];
  uint64_t v21 = [(LNBundleMetadata *)self actions];
  int64_t v4 = [(LNBundleMetadata *)self entities];
  int64_t v5 = [(LNBundleMetadata *)self queries];
  uint64_t v20 = [(LNBundleMetadata *)self enums];
  uint64_t v17 = [v20 allValues];
  v16 = [(LNBundleMetadata *)self autoShortcutProviderMangledName];
  uint64_t v15 = [(LNBundleMetadata *)self autoShortcuts];
  int64_t v6 = [(LNBundleMetadata *)self shortcutTileColor];
  int64_t v7 = [(LNBundleMetadata *)self version];
  id v14 = [(LNBundleMetadata *)self generator];
  int64_t v8 = [(LNBundleMetadata *)self negativePhrases];
  uint64_t v9 = [(LNBundleMetadata *)self examplePhrases];
  int64_t v10 = [(LNBundleMetadata *)self assistantIntents];
  uint64_t v11 = [(LNBundleMetadata *)self assistantIntentNegativePhrases];
  uint64_t v12 = [(LNBundleMetadata *)self assistantEntities];
  uint64_t v19 = [(LNBundleMetadata *)v18 initWithActions:v21 entities:v4 queries:v5 enums:v17 autoShortcutProviderMangledName:v16 autoShortcuts:v15 shortcutTileColor:v6 version:v7 generator:v14 negativePhrases:v8 examplePhrases:v9 assistantIntents:v10 assistantIntentNegativePhrases:v11 assistantEntities:v12];

  return v19;
}

- (LNBundleMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  int64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  int64_t v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  uint64_t v8 = [v3 decodeObjectOfClasses:v7 forKey:@"actions"];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  uint64_t v12 = [v3 decodeObjectOfClasses:v11 forKey:@"autoShortcuts"];

  uint64_t v56 = [v3 decodeIntegerForKey:@"shortcutTileColor"];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  uint64_t v67 = [v3 decodeObjectOfClasses:v16 forKey:@"entities"];

  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
  uint64_t v65 = [v3 decodeObjectOfClasses:v20 forKey:@"queries"];

  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  uint64_t v24 = [v3 decodeObjectOfClasses:v23 forKey:@"enums"];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  uint64_t v60 = [v3 decodeObjectOfClasses:v27 forKey:@"negativePhrases"];

  id v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  uint64_t v66 = [v3 decodeObjectOfClasses:v30 forKey:@"examplePhrases"];

  int v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  uint64_t v59 = [v3 decodeObjectOfClasses:v33 forKey:@"assistantIntents"];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  int v37 = [v3 decodeObjectOfClasses:v36 forKey:@"assistantIntentNegativePhrases"];

  v38 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v39 = objc_opt_class();
  id v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  uint64_t v41 = [v3 decodeObjectOfClasses:v40 forKey:@"assistantEntities"];

  id v42 = 0;
  v63 = v3;
  v64 = (void *)v8;
  v62 = (void *)v24;
  if (!v8)
  {
    v51 = (void *)v60;
    v52 = self;
    v49 = (void *)v41;
    v43 = (void *)v66;
    id v44 = (void *)v67;
    v46 = (void *)v65;
    v50 = (void *)v59;
    goto LABEL_11;
  }
  v57 = (void *)v41;
  v58 = v37;
  v43 = (void *)v66;
  if (!v12)
  {
    v52 = self;
    id v44 = (void *)v67;
    goto LABEL_8;
  }
  id v44 = (void *)v67;
  if (!v67) {
    goto LABEL_7;
  }
  v45 = (void *)v24;
  v46 = (void *)v65;
  if (!v65)
  {
    v52 = self;
    goto LABEL_10;
  }
  if (!v45)
  {
LABEL_7:
    v52 = self;
LABEL_8:
    v46 = (void *)v65;
LABEL_10:
    v50 = (void *)v59;
    v51 = (void *)v60;
    v49 = v57;
    int v37 = v58;
    goto LABEL_11;
  }
  v54 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"autoShortcutProviderMangledName"];
  uint64_t v55 = [v3 decodeIntegerForKey:@"version"];
  int v47 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"generator"];
  int64_t v48 = [v45 allValues];
  v49 = v57;
  int v37 = v58;
  v50 = (void *)v59;
  v51 = (void *)v60;
  v46 = (void *)v65;
  v52 = [(LNBundleMetadata *)self initWithActions:v8 entities:v67 queries:v65 enums:v48 autoShortcutProviderMangledName:v54 autoShortcuts:v12 shortcutTileColor:v56 version:v55 generator:v47 negativePhrases:v60 examplePhrases:v66 assistantIntents:v59 assistantIntentNegativePhrases:v58 assistantEntities:v57];

  v43 = (void *)v66;
  id v44 = (void *)v67;

  id v42 = v52;
LABEL_11:

  return v42;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LNBundleMetadata *)self actions];
  [v4 encodeObject:v5 forKey:@"actions"];

  uint64_t v6 = [(LNBundleMetadata *)self autoShortcutProviderMangledName];
  [v4 encodeObject:v6 forKey:@"autoShortcutProviderMangledName"];

  int64_t v7 = [(LNBundleMetadata *)self autoShortcuts];
  [v4 encodeObject:v7 forKey:@"autoShortcuts"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNBundleMetadata shortcutTileColor](self, "shortcutTileColor"), @"shortcutTileColor");
  uint64_t v8 = [(LNBundleMetadata *)self entities];
  [v4 encodeObject:v8 forKey:@"entities"];

  uint64_t v9 = [(LNBundleMetadata *)self queries];
  [v4 encodeObject:v9 forKey:@"queries"];

  uint64_t v10 = [(LNBundleMetadata *)self enums];
  [v4 encodeObject:v10 forKey:@"enums"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNBundleMetadata version](self, "version"), @"version");
  uint64_t v11 = [(LNBundleMetadata *)self generator];
  [v4 encodeObject:v11 forKey:@"generator"];

  uint64_t v12 = [(LNBundleMetadata *)self negativePhrases];
  [v4 encodeObject:v12 forKey:@"negativePhrases"];

  uint64_t v13 = [(LNBundleMetadata *)self examplePhrases];
  [v4 encodeObject:v13 forKey:@"examplePhrases"];

  uint64_t v14 = [(LNBundleMetadata *)self assistantIntents];
  [v4 encodeObject:v14 forKey:@"assistantIntents"];

  uint64_t v15 = [(LNBundleMetadata *)self assistantIntentNegativePhrases];
  [v4 encodeObject:v15 forKey:@"assistantIntentNegativePhrases"];

  id v16 = [(LNBundleMetadata *)self assistantEntities];
  [v4 encodeObject:v16 forKey:@"assistantEntities"];
}

- (void)applyAttributionBundleIdentifier:(id)a3 icon:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  id obj = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int64_t v7 = [(LNBundleMetadata *)self actions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * v11);
        uint64_t v13 = [(LNBundleMetadata *)self actions];
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];
        uint64_t v15 = [v14 actionMetadataWithAttributionBundleIdentifier:v6 icon:v27];
        [obj setObject:v15 forKeyedSubscript:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)&self->_actions, obj);
  id v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = [(LNBundleMetadata *)self entities];
  uint64_t v17 = [v26 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v26);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * v20);
        uint64_t v22 = [(LNBundleMetadata *)self entities];
        uint64_t v23 = [v22 objectForKeyedSubscript:v21];
        uint64_t v24 = [v23 entityMetadataWithAttributionBundleIdentifier:v6];
        [(NSDictionary *)v16 setObject:v24 forKeyedSubscript:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v26 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  entities = self->_entities;
  self->_entities = v16;
}

- (LNBundleMetadata)initWithArray:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v40 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v13 = [v12 actions];
        uint64_t v14 = objc_msgSend(v13, "ln_deduping:", v4);
        [v4 addEntriesFromDictionary:v14];

        uint64_t v15 = [v12 queries];
        id v16 = objc_msgSend(v15, "ln_deduping:", v6);
        [v6 addEntriesFromDictionary:v16];

        uint64_t v17 = [v12 entities];
        uint64_t v18 = objc_msgSend(v17, "ln_deduping:", v5);
        [v5 addEntriesFromDictionary:v18];

        uint64_t v19 = [v12 enums];
        uint64_t v20 = objc_msgSend(v19, "ln_deduping:", v7);
        [v7 addEntriesFromDictionary:v20];

        uint64_t v21 = [v12 autoShortcuts];
        [v47 addObjectsFromArray:v21];

        uint64_t v22 = [v12 negativePhrases];
        [v46 addObjectsFromArray:v22];

        uint64_t v23 = [v12 examplePhrases];
        [v45 addObjectsFromArray:v23];

        uint64_t v24 = [v12 assistantIntents];
        [v44 addObjectsFromArray:v24];

        v25 = [v12 assistantIntentNegativePhrases];
        [v43 addObjectsFromArray:v25];

        id v26 = [v12 assistantEntities];
        [v42 addObjectsFromArray:v26];

        if (!v10)
        {
          id v27 = [v12 autoShortcutProviderMangledName];
          id v28 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          long long v29 = [v27 stringByTrimmingCharactersInSet:v28];

          if ([v29 length]) {
            id v10 = v29;
          }
          else {
            id v10 = 0;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  long long v35 = [v7 allValues];
  uint64_t v41 = [obj firstObject];
  uint64_t v34 = [v41 shortcutTileColor];
  long long v36 = [obj firstObject];
  uint64_t v30 = [v36 version];
  long long v31 = [obj firstObject];
  long long v32 = [v31 generator];
  v38 = [(LNBundleMetadata *)self initWithActions:v4 entities:v5 queries:v6 enums:v35 autoShortcutProviderMangledName:v10 autoShortcuts:v47 shortcutTileColor:v34 version:v30 generator:v32 negativePhrases:v46 examplePhrases:v45 assistantIntents:v44 assistantIntentNegativePhrases:v43 assistantEntities:v42];

  return v38;
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13 assistantIntents:(id)a14 assistantIntentNegativePhrases:(id)a15 assistantEntities:(id)a16
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  id v75 = a5;
  id v74 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v73 = a14;
  id v28 = a15;
  id v29 = a16;
  v80.receiver = self;
  v80.super_class = (Class)LNBundleMetadata;
  uint64_t v30 = [(LNBundleMetadata *)&v80 init];
  if (v30)
  {
    uint64_t v65 = v29;
    uint64_t v66 = v27;
    uint64_t v67 = v26;
    v68 = v25;
    id v72 = v21;
    uint64_t v31 = [v21 copy];
    actions = v30->_actions;
    v30->_actions = (NSDictionary *)v31;

    uint64_t v33 = [v23 copy];
    autoShortcutProviderMangledName = v30->_autoShortcutProviderMangledName;
    v30->_autoShortcutProviderMangledName = (NSString *)v33;

    id v69 = v24;
    uint64_t v35 = [v24 copy];
    autoShortcuts = v30->_autoShortcuts;
    v30->_autoShortcuts = (NSArray *)v35;

    id v70 = v22;
    uint64_t v37 = [v22 copy];
    entities = v30->_entities;
    v30->_entities = (NSDictionary *)v37;

    uint64_t v39 = [v75 copy];
    queries = v30->_queries;
    v30->_queries = (NSDictionary *)v39;

    uint64_t v41 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v42 = v74;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v76 objects:v81 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v77 != v45) {
            objc_enumerationMutation(v42);
          }
          id v47 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          long long v48 = [v47 identifier];

          if (v48)
          {
            long long v49 = [v47 identifier];
            [(NSDictionary *)v41 setObject:v47 forKeyedSubscript:v49];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v76 objects:v81 count:16];
      }
      while (v44);
    }

    enums = v30->_enums;
    v30->_enums = v41;

    v30->_shortcutTileColor = a9;
    v30->_version = a10;
    id v25 = v68;
    uint64_t v51 = [v68 copy];
    generator = v30->_generator;
    v30->_generator = (LNBundleMetadataGeneratorDescription *)v51;

    id v26 = v67;
    uint64_t v53 = [v67 copy];
    negativePhrases = v30->_negativePhrases;
    v30->_negativePhrases = (NSArray *)v53;

    id v27 = v66;
    uint64_t v55 = [v66 copy];
    examplePhrases = v30->_examplePhrases;
    v30->_examplePhrases = (NSArray *)v55;

    uint64_t v57 = [v73 copy];
    assistantIntents = v30->_assistantIntents;
    v30->_assistantIntents = (NSArray *)v57;

    uint64_t v59 = [v28 copy];
    assistantIntentNegativePhrases = v30->_assistantIntentNegativePhrases;
    v30->_assistantIntentNegativePhrases = (NSArray *)v59;

    id v29 = v65;
    uint64_t v61 = [v65 copy];
    assistantEntities = v30->_assistantEntities;
    v30->_assistantEntities = (NSArray *)v61;

    v63 = v30;
    id v22 = v70;
    id v21 = v72;
    id v24 = v69;
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6
{
  return [(LNBundleMetadata *)self initWithActions:a3 entities:a4 queries:a5 enums:a6 autoShortcuts:MEMORY[0x1E4F1CBF0] version:0 generator:0];
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 version:(int64_t)a7
{
  return [(LNBundleMetadata *)self initWithActions:a3 entities:a4 queries:a5 enums:a6 autoShortcuts:MEMORY[0x1E4F1CBF0] version:a7 generator:0];
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 version:(int64_t)a7 generator:(id)a8
{
  return [(LNBundleMetadata *)self initWithActions:a3 entities:a4 queries:a5 enums:a6 autoShortcuts:MEMORY[0x1E4F1CBF0] version:a7 generator:a8];
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcuts:(id)a7 version:(int64_t)a8 generator:(id)a9
{
  return [(LNBundleMetadata *)self initWithActions:a3 entities:a4 queries:a5 enums:a6 autoShortcutProviderMangledName:0 autoShortcuts:a7 version:a8 generator:a9];
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 version:(int64_t)a9 generator:(id)a10
{
  return [(LNBundleMetadata *)self initWithActions:a3 entities:a4 queries:a5 enums:a6 autoShortcutProviderMangledName:a7 autoShortcuts:a8 shortcutTileColor:14 version:a9 generator:a10];
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11
{
  return [(LNBundleMetadata *)self initWithActions:a3 entities:a4 queries:a5 enums:a6 autoShortcutProviderMangledName:a7 autoShortcuts:a8 shortcutTileColor:a9 version:a10 generator:a11 negativePhrases:0 examplePhrases:0 assistantIntents:0 assistantIntentNegativePhrases:0 assistantEntities:0];
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13
{
  return [(LNBundleMetadata *)self initWithActions:a3 entities:a4 queries:a5 enums:a6 autoShortcutProviderMangledName:a7 autoShortcuts:a8 shortcutTileColor:a9 version:a10 generator:a11 negativePhrases:a12 examplePhrases:a13 assistantIntents:0 assistantIntentNegativePhrases:0 assistantEntities:0];
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13 assistantIntents:(id)a14 assistantIntentNegativePhrases:(id)a15
{
  return [(LNBundleMetadata *)self initWithActions:a3 entities:a4 queries:a5 enums:a6 autoShortcutProviderMangledName:a7 autoShortcuts:a8 shortcutTileColor:a9 version:a10 generator:a11 negativePhrases:a12 examplePhrases:a13 assistantIntents:a14 assistantIntentNegativePhrases:a15 assistantEntities:0];
}

@end