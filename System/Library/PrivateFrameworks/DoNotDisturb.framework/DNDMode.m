@interface DNDMode
+ (BOOL)supportsSecureCoding;
+ (NSString)defaultTintColorName;
+ (id)defaultMode;
+ (id)defaultReduceInterruptionsMode;
+ (id)placeholderModeFromMode:(id)a3;
+ (unint64_t)maxUIAddableModes;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (DNDMode)initWithCoder:(id)a3;
- (DNDMode)initWithName:(id)a3 modeIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 semanticType:(int64_t)a7;
- (DNDMode)initWithName:(id)a3 modeIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 symbolDescriptor:(id)a7 semanticType:(int64_t)a8 visibility:(unint64_t)a9 identifier:(id)a10;
- (DNDModeSymbolDescriptor)symbolDescriptor;
- (NSString)modeIdentifier;
- (NSString)name;
- (NSString)symbolImageName;
- (NSString)tintColorName;
- (NSURL)settingsURL;
- (NSURL)setupURL;
- (NSUUID)identifier;
- (id)_initWithMode:(id)a3;
- (id)_name;
- (id)_symbolImageName;
- (id)_tintColorName;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)semanticType;
- (unint64_t)hash;
- (unint64_t)visibility;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDMode

- (BOOL)isPlaceholder
{
  return self->_visibility - 1 < 2;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSString)name
{
  v3 = DNDModeLocalizedNameKeyForSemanticType([(DNDMode *)self semanticType]);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F28B50], "dnd_doNotDisturbLocalizationBundle");
    v5 = [v4 localizedStringForKey:v3 value:&stru_1EEDCFB98 table:0];
  }
  else
  {
    v5 = self->_name;
  }

  return v5;
}

- (int64_t)semanticType
{
  return self->_semanticType;
}

- (NSString)tintColorName
{
  symbolDescriptor = self->_symbolDescriptor;
  if (symbolDescriptor
    && ([(DNDModeSymbolDescriptor *)symbolDescriptor primaryTintColorName],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = [(DNDModeSymbolDescriptor *)self->_symbolDescriptor primaryTintColorName];
  }
  else if (DNDSupportedSemanticType(self->_semanticType))
  {
    v5 = self->_tintColorName;
  }
  else
  {
    DNDSystemColorNameForModeSemanticType(self->_semanticType);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSString)symbolImageName
{
  symbolDescriptor = self->_symbolDescriptor;
  if (symbolDescriptor
    && ([(DNDModeSymbolDescriptor *)symbolDescriptor imageName],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = [(DNDModeSymbolDescriptor *)self->_symbolDescriptor imageName];
  }
  else if (DNDSupportedSemanticType(self->_semanticType))
  {
    v5 = self->_symbolImageName;
  }
  else
  {
    DNDSystemImageNameForModeSemanticType(self->_semanticType);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (unint64_t)maxUIAddableModes
{
  return 10;
}

+ (id)defaultMode
{
  v2 = DNDModeSemanticTypeToString(0);
  v3 = DNDSystemImageNameForModeSemanticType(0);
  v4 = [DNDMode alloc];
  v5 = +[DNDMode defaultTintColorName];
  v6 = [(DNDMode *)v4 initWithName:v2 modeIdentifier:@"com.apple.donotdisturb.mode.default" symbolImageName:v3 tintColorName:v5 semanticType:0];

  return v6;
}

+ (id)defaultReduceInterruptionsMode
{
  v2 = DNDModeSemanticTypeToString(9);
  v3 = DNDSystemImageNameForModeSemanticType(0);
  v4 = DNDSystemColorNameForModeSemanticType(0);
  v5 = DNDSystemImageNameForModeSemanticType(9);
  v6 = DNDSystemColorNamesForModeSemanticType(9);
  v7 = [[DNDMutableModeSymbolDescriptor alloc] initWithTintStyle:1 tintColorNames:v6 imageName:v5];
  v8 = [[DNDMode alloc] initWithName:v2 modeIdentifier:@"com.apple.focus.reduce-interruptions" symbolImageName:v3 tintColorName:v4 symbolDescriptor:v7 semanticType:9 visibility:0 identifier:0];

  return v8;
}

+ (id)placeholderModeFromMode:(id)a3
{
  id v3 = a3;
  v4 = [DNDMode alloc];
  v5 = [v3 name];
  v6 = [v3 modeIdentifier];
  v7 = [v3 symbolImageName];
  v8 = [v3 tintColorName];
  v9 = [v3 symbolDescriptor];
  uint64_t v10 = [v3 semanticType];
  v11 = [v3 identifier];

  v12 = [(DNDMode *)v4 initWithName:v5 modeIdentifier:v6 symbolImageName:v7 tintColorName:v8 symbolDescriptor:v9 semanticType:v10 visibility:1 identifier:v11];
  return v12;
}

- (DNDMode)initWithName:(id)a3 modeIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 semanticType:(int64_t)a7
{
  return [(DNDMode *)self initWithName:a3 modeIdentifier:a4 symbolImageName:a5 tintColorName:a6 symbolDescriptor:0 semanticType:a7 visibility:0 identifier:0];
}

- (DNDMode)initWithName:(id)a3 modeIdentifier:(id)a4 symbolImageName:(id)a5 tintColorName:(id)a6 symbolDescriptor:(id)a7 semanticType:(int64_t)a8 visibility:(unint64_t)a9 identifier:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)DNDMode;
  v22 = [(DNDMode *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    name = v22->_name;
    v22->_name = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    modeIdentifier = v22->_modeIdentifier;
    v22->_modeIdentifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    symbolImageName = v22->_symbolImageName;
    v22->_symbolImageName = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    tintColorName = v22->_tintColorName;
    v22->_tintColorName = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    symbolDescriptor = v22->_symbolDescriptor;
    v22->_symbolDescriptor = (DNDModeSymbolDescriptor *)v31;

    v22->_semanticType = a8;
    v22->_visibility = a9;
    if (v21) {
      v33 = (NSUUID *)v21;
    }
    else {
      v33 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    }
    identifier = v22->_identifier;
    v22->_identifier = v33;
  }
  return v22;
}

- (id)_initWithMode:(id)a3
{
  id v4 = a3;
  v5 = [v4 _name];
  v6 = [v4 modeIdentifier];
  v7 = [v4 _symbolImageName];
  v8 = [v4 _tintColorName];
  v9 = [v4 symbolDescriptor];
  uint64_t v10 = [v4 semanticType];
  uint64_t v11 = [v4 visibility];
  v12 = [v4 identifier];

  v13 = [(DNDMode *)self initWithName:v5 modeIdentifier:v6 symbolImageName:v7 tintColorName:v8 symbolDescriptor:v9 semanticType:v10 visibility:v11 identifier:v12];
  return v13;
}

+ (NSString)defaultTintColorName
{
  return (NSString *)@"systemIndigoColor";
}

- (NSURL)settingsURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [(DNDMode *)self modeIdentifier];
  id v4 = objc_msgSend(v2, "dnd_settingsURLWithModeIdentifier:", v3);

  return (NSURL *)v4;
}

- (NSURL)setupURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  int64_t v3 = [(DNDMode *)self semanticType];
  return (NSURL *)objc_msgSend(v2, "dnd_setupURLWithSemanticType:", v3);
}

- (id)_name
{
  return self->_name;
}

- (id)_symbolImageName
{
  return self->_symbolImageName;
}

- (id)_tintColorName
{
  return self->_tintColorName;
}

- (unint64_t)hash
{
  int64_t v3 = [(DNDMode *)self _name];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDMode *)self modeIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDMode *)self _symbolImageName];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDMode *)self _tintColorName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(DNDMode *)self symbolDescriptor];
  uint64_t v12 = [v11 hash];
  int64_t v13 = v12 ^ [(DNDMode *)self semanticType];
  unint64_t v14 = v10 ^ v13 ^ [(DNDMode *)self visibility];
  v15 = [(DNDMode *)self identifier];
  unint64_t v16 = v14 ^ [v15 hash];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDMode *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DNDMode *)self _name];
      v7 = [(DNDMode *)v5 _name];
      if (v6 != v7)
      {
        v85 = [(DNDMode *)self _name];
        if (!v85)
        {
          char v10 = 0;
          goto LABEL_67;
        }
        v83 = [(DNDMode *)v5 _name];
        if (!v83)
        {
          char v10 = 0;
LABEL_66:

          goto LABEL_67;
        }
        uint64_t v8 = [(DNDMode *)self _name];
        v9 = [(DNDMode *)v5 _name];
        if (![v8 isEqual:v9])
        {
          char v10 = 0;
LABEL_65:

          goto LABEL_66;
        }
        v81 = v9;
        v82 = v8;
      }
      uint64_t v11 = [(DNDMode *)self modeIdentifier];
      v84 = [(DNDMode *)v5 modeIdentifier];
      if (v11 != v84)
      {
        uint64_t v12 = [(DNDMode *)self modeIdentifier];
        if (v12)
        {
          int64_t v13 = (void *)v12;
          uint64_t v14 = [(DNDMode *)v5 modeIdentifier];
          if (v14)
          {
            v79 = (void *)v14;
            v15 = [(DNDMode *)self modeIdentifier];
            unint64_t v16 = [(DNDMode *)v5 modeIdentifier];
            if ([v15 isEqual:v16])
            {
              v75 = v16;
              v77 = v15;
              v76 = v13;
              goto LABEL_16;
            }
          }
        }

LABEL_63:
        char v10 = 0;
        goto LABEL_64;
      }
LABEL_16:
      id v17 = [(DNDMode *)self _symbolImageName];
      id v18 = [(DNDMode *)v5 _symbolImageName];
      v80 = v17;
      if (v17 == v18) {
        goto LABEL_23;
      }
      uint64_t v19 = [(DNDMode *)self _symbolImageName];
      if (v19)
      {
        id v20 = (void *)v19;
        uint64_t v21 = [(DNDMode *)v5 _symbolImageName];
        if (v21)
        {
          v22 = v18;
          uint64_t v23 = v20;
          v74 = (void *)v21;
          v24 = [(DNDMode *)self _symbolImageName];
          uint64_t v25 = [(DNDMode *)v5 _symbolImageName];
          if ([v24 isEqual:v25])
          {
            v69 = v24;
            v73 = v23;
            id v18 = v22;
            id v17 = v25;
LABEL_23:
            v26 = [(DNDMode *)self _tintColorName];
            v78 = [(DNDMode *)v5 _tintColorName];
            if (v26 == v78) {
              goto LABEL_31;
            }
            uint64_t v27 = [(DNDMode *)self _tintColorName];
            if (v27)
            {
              v70 = (void *)v27;
              uint64_t v28 = [(DNDMode *)v5 _tintColorName];
              if (v28)
              {
                v65 = (void *)v28;
                v66 = v17;
                uint64_t v29 = [(DNDMode *)self _tintColorName];
                v30 = [(DNDMode *)v5 _tintColorName];
                if ([v29 isEqual:v30])
                {
                  v62 = v30;
                  v63 = v29;
                  id v17 = v66;
LABEL_31:
                  uint64_t v31 = [(DNDMode *)self symbolDescriptor];
                  v71 = [(DNDMode *)v5 symbolDescriptor];
                  v72 = (void *)v31;
                  if ((void *)v31 == v71)
                  {
                    v68 = v26;
                    goto LABEL_43;
                  }
                  uint64_t v32 = [(DNDMode *)self symbolDescriptor];
                  if (v32)
                  {
                    v64 = (void *)v32;
                    v33 = [(DNDMode *)v5 symbolDescriptor];
                    if (v33)
                    {
                      v67 = v17;
                      id v61 = v33;
                      v34 = [(DNDMode *)self symbolDescriptor];
                      v35 = [(DNDMode *)v5 symbolDescriptor];
                      v60 = v34;
                      if ([v34 isEqual:v35])
                      {
                        v59 = v35;
                        v68 = v26;
                        id v17 = v67;
LABEL_43:
                        int64_t v36 = [(DNDMode *)self semanticType];
                        if (v36 == [(DNDMode *)v5 semanticType]
                          && (unint64_t v37 = [(DNDMode *)self visibility],
                              v37 == [(DNDMode *)v5 visibility]))
                        {
                          v38 = [(DNDMode *)self identifier];
                          uint64_t v39 = [(DNDMode *)v5 identifier];
                          if (v38 != (void *)v39)
                          {
                            v58 = (void *)v39;
                            uint64_t v40 = [(DNDMode *)self identifier];
                            v41 = v68;
                            if (v40)
                            {
                              v57 = (void *)v40;
                              v42 = [(DNDMode *)v5 identifier];
                              if (v42)
                              {
                                v56 = v42;
                                v55 = [(DNDMode *)self identifier];
                                [(DNDMode *)v5 identifier];
                                v44 = v43 = v38;
                                char v10 = [v55 isEqual:v44];

                                v38 = v43;
                                v41 = v68;

                                v42 = v56;
                              }
                              else
                              {
                                char v10 = 0;
                              }
                            }
                            else
                            {

                              char v10 = 0;
                            }
                            v45 = v71;
                            BOOL v46 = v72 == v71;
                            goto LABEL_51;
                          }

                          char v10 = 1;
                        }
                        else
                        {
                          char v10 = 0;
                        }
                        v45 = v71;
                        BOOL v46 = v72 == v71;
                        v41 = v68;
LABEL_51:
                        v47 = v73;
                        if (v46)
                        {
                        }
                        else
                        {
                          v48 = v17;
                          v49 = v45;

                          id v17 = v48;
                          v47 = v73;
                        }

                        if (v41 != v78)
                        {
                        }
                        if (v80 != v18)
                        {
                        }
                        if (v11 != v84)
                        {
                        }
LABEL_64:
                        v9 = v81;
                        uint64_t v8 = v82;
                        if (v6 != v7) {
                          goto LABEL_65;
                        }
LABEL_67:

                        goto LABEL_68;
                      }

                      v33 = v61;
                      id v17 = v67;
                    }
                    v54 = v17;
                  }
                  else
                  {
                    v54 = v17;
                  }

                  if (v26 != v78)
                  {
                  }
                  v52 = v77;
                  if (v80 != v18)
                  {
                  }
                  v51 = v84;
                  if (v11 == v84) {
                    goto LABEL_62;
                  }
                  goto LABEL_61;
                }

                v50 = v80;
                if (v80 != v18)
                {

                  goto LABEL_58;
                }
                goto LABEL_59;
              }
            }
            v50 = v80;
            if (v80 != v18)
            {

LABEL_58:
              goto LABEL_60;
            }
LABEL_59:

LABEL_60:
            v51 = v84;
            v52 = v77;
            if (v11 == v84)
            {
LABEL_62:

              goto LABEL_63;
            }
LABEL_61:

            goto LABEL_62;
          }

LABEL_39:
          if (v11 == v84)
          {
          }
          else
          {
          }
          goto LABEL_63;
        }
      }
      goto LABEL_39;
    }
    char v10 = 0;
  }
LABEL_68:

  return v10;
}

- (id)description
{
  id v17 = NSString;
  uint64_t v16 = objc_opt_class();
  int64_t v3 = [(DNDMode *)self _name];
  uint64_t v4 = [(DNDMode *)self modeIdentifier];
  v5 = [(DNDMode *)self _symbolImageName];
  uint64_t v6 = [(DNDMode *)self _tintColorName];
  v7 = [(DNDMode *)self symbolDescriptor];
  int64_t v8 = [(DNDMode *)self semanticType];
  unint64_t v9 = [(DNDMode *)self visibility];
  char v10 = [(DNDMode *)self identifier];
  uint64_t v11 = [v10 UUIDString];
  BOOL v12 = [(DNDMode *)self isPlaceholder];
  int64_t v13 = @"NO";
  if (v12) {
    int64_t v13 = @"YES";
  }
  objc_msgSend(v17, "stringWithFormat:", @"<%@: %p; name: %@; modeIdentifier: %@; symbolImageName: %@; tintColorName: %@; symbolDescriptor: %@; semanticType: %zd; visibility: %lu; identifier: %@; isPlaceHolder: %@>",
    v16,
    self,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v11,
  uint64_t v14 = v13);

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDMutableMode alloc];
  return [(DNDMode *)v4 _initWithMode:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDMode)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolImageName"];
  int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColorName"];
  unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolDescriptor"];
  if ([v4 containsValueForKey:@"semanticType"]) {
    uint64_t v10 = [v4 decodeIntegerForKey:@"semanticType"];
  }
  else {
    uint64_t v10 = 0;
  }
  if ([v4 containsValueForKey:@"visibility"]) {
    uint64_t v11 = [v4 decodeIntegerForKey:@"visibility"];
  }
  else {
    uint64_t v11 = 0;
  }
  if ([v4 containsValueForKey:@"identifier"])
  {
    BOOL v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  }
  else
  {
    BOOL v12 = 0;
  }
  int64_t v13 = [(DNDMode *)self initWithName:v5 modeIdentifier:v6 symbolImageName:v7 tintColorName:v8 symbolDescriptor:v9 semanticType:v10 visibility:v11 identifier:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DNDMode *)self _name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(DNDMode *)self modeIdentifier];
  [v4 encodeObject:v6 forKey:@"modeIdentifier"];

  v7 = [(DNDMode *)self _symbolImageName];
  [v4 encodeObject:v7 forKey:@"symbolImageName"];

  int64_t v8 = [(DNDMode *)self _tintColorName];
  [v4 encodeObject:v8 forKey:@"tintColorName"];

  unint64_t v9 = [(DNDMode *)self symbolDescriptor];
  [v4 encodeObject:v9 forKey:@"symbolDescriptor"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDMode semanticType](self, "semanticType"), @"semanticType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDMode visibility](self, "visibility"), @"visibility");
  id v10 = [(DNDMode *)self identifier];
  [v4 encodeObject:v10 forKey:@"identifier"];
}

- (DNDModeSymbolDescriptor)symbolDescriptor
{
  return self->_symbolDescriptor;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_symbolDescriptor, 0);
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end