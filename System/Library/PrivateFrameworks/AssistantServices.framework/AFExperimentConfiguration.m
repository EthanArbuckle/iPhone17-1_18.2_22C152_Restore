@interface AFExperimentConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFExperimentConfiguration)init;
- (AFExperimentConfiguration)initWithBuilder:(id)a3;
- (AFExperimentConfiguration)initWithCoder:(id)a3;
- (AFExperimentConfiguration)initWithDictionaryRepresentation:(id)a3;
- (AFExperimentConfiguration)initWithType:(int64_t)a3 identifier:(id)a4 version:(id)a5 controlGroup:(id)a6 experimentGroups:(id)a7 salt:(id)a8;
- (AFExperimentGroup)controlGroup;
- (BOOL)isEqual:(id)a3;
- (NSArray)experimentGroups;
- (NSString)description;
- (NSString)identifier;
- (NSString)salt;
- (NSString)version;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFExperimentConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_experimentGroups, 0);
  objc_storeStrong((id *)&self->_controlGroup, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)salt
{
  return self->_salt;
}

- (NSArray)experimentGroups
{
  return self->_experimentGroups;
}

- (AFExperimentGroup)controlGroup
{
  return self->_controlGroup;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (id)buildDictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t type = self->_type;
  if (type > 2) {
    v5 = @"(unknown)";
  }
  else {
    v5 = off_1E5925410[type];
  }
  v6 = v5;
  [v3 setObject:v6 forKey:@"type"];

  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  version = self->_version;
  if (version) {
    [v3 setObject:version forKey:@"version"];
  }
  controlGroup = self->_controlGroup;
  if (controlGroup)
  {
    v10 = [(AFExperimentGroup *)controlGroup buildDictionaryRepresentation];
    [v3 setObject:v10 forKey:@"controlGroup"];
  }
  if (self->_experimentGroups)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_experimentGroups, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v12 = self->_experimentGroups;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "buildDictionaryRepresentation", (void)v22);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    v18 = (void *)[v11 copy];
    [v3 setObject:v18 forKey:@"experimentGroups"];
  }
  salt = self->_salt;
  if (salt) {
    [v3 setObject:salt forKey:@"salt"];
  }
  v20 = objc_msgSend(v3, "copy", (void)v22);

  return v20;
}

- (AFExperimentConfiguration)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = AFExperimentConfigurationTypeGetFromName(v6);
    }
    else {
      uint64_t v7 = 0;
    }

    v9 = [v5 objectForKey:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v11 = [v5 objectForKey:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    uint64_t v13 = [v5 objectForKey:@"controlGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = [[AFExperimentGroup alloc] initWithDictionaryRepresentation:v13];
    }
    else {
      v31 = 0;
    }

    uint64_t v14 = [v5 objectForKey:@"experimentGroups"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = v12;
      id v29 = v10;
      uint64_t v30 = v7;
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v27 = v14;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(id *)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v22 = [[AFExperimentGroup alloc] initWithDictionaryRepresentation:v21];

              if (v22) {
                [v15 addObject:v22];
              }
            }
            else
            {

              long long v22 = 0;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v18);
      }

      long long v23 = (void *)[v15 copy];
      uint64_t v7 = v30;
      id v12 = v28;
      id v10 = v29;
      uint64_t v14 = v27;
    }
    else
    {
      long long v23 = 0;
    }

    long long v24 = [v5 objectForKey:@"salt"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v25 = v24;
    }
    else {
      id v25 = 0;
    }

    self = [(AFExperimentConfiguration *)self initWithType:v7 identifier:v10 version:v12 controlGroup:v31 experimentGroups:v23 salt:v25];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t type = self->_type;
  id v7 = a3;
  v6 = [v4 numberWithInteger:type];
  [v7 encodeObject:v6 forKey:@"AFExperimentConfiguration::type"];

  [v7 encodeObject:self->_identifier forKey:@"AFExperimentConfiguration::identifier"];
  [v7 encodeObject:self->_version forKey:@"AFExperimentConfiguration::version"];
  [v7 encodeObject:self->_controlGroup forKey:@"AFExperimentConfiguration::controlGroup"];
  [v7 encodeObject:self->_experimentGroups forKey:@"AFExperimentConfiguration::experimentGroups"];
  [v7 encodeObject:self->_salt forKey:@"AFExperimentConfiguration::salt"];
}

- (AFExperimentConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentConfiguration::type"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentConfiguration::identifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentConfiguration::version"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentConfiguration::controlGroup"];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"AFExperimentConfiguration::experimentGroups"];

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentConfiguration::salt"];

  uint64_t v15 = [(AFExperimentConfiguration *)self initWithType:v6 identifier:v7 version:v8 controlGroup:v9 experimentGroups:v13 salt:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFExperimentConfiguration *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t type = self->_type;
      if (type == [(AFExperimentConfiguration *)v5 type])
      {
        id v7 = [(AFExperimentConfiguration *)v5 identifier];
        identifier = self->_identifier;
        if (identifier == v7 || [(NSString *)identifier isEqual:v7])
        {
          v9 = [(AFExperimentConfiguration *)v5 version];
          version = self->_version;
          if (version == v9 || [(NSString *)version isEqual:v9])
          {
            uint64_t v11 = [(AFExperimentConfiguration *)v5 controlGroup];
            controlGroup = self->_controlGroup;
            if (controlGroup == v11 || [(AFExperimentGroup *)controlGroup isEqual:v11])
            {
              uint64_t v13 = [(AFExperimentConfiguration *)v5 experimentGroups];
              experimentGroups = self->_experimentGroups;
              if (experimentGroups == v13 || [(NSArray *)experimentGroups isEqual:v13])
              {
                uint64_t v15 = [(AFExperimentConfiguration *)v5 salt];
                salt = self->_salt;
                BOOL v17 = salt == v15 || [(NSString *)salt isEqual:v15];
              }
              else
              {
                BOOL v17 = 0;
              }
            }
            else
            {
              BOOL v17 = 0;
            }
          }
          else
          {
            BOOL v17 = 0;
          }
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_version hash];
  unint64_t v7 = v6 ^ [(AFExperimentGroup *)self->_controlGroup hash] ^ v4;
  uint64_t v8 = [(NSArray *)self->_experimentGroups hash];
  NSUInteger v9 = v7 ^ v8 ^ [(NSString *)self->_salt hash];

  return v9;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)AFExperimentConfiguration;
  NSUInteger v5 = [(AFExperimentConfiguration *)&v11 description];
  unint64_t type = self->_type;
  if (type > 2) {
    unint64_t v7 = @"(unknown)";
  }
  else {
    unint64_t v7 = off_1E5925410[type];
  }
  uint64_t v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t type = %@, identifier = %@, version = %@, controlGroup = %@, experimentGroups = %@, salt = %@}", v5, v8, self->_identifier, self->_version, self->_controlGroup, self->_experimentGroups, self->_salt];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(AFExperimentConfiguration *)self _descriptionWithIndent:0];
}

- (AFExperimentConfiguration)initWithType:(int64_t)a3 identifier:(id)a4 version:(id)a5 controlGroup:(id)a6 experimentGroups:(id)a7 salt:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __96__AFExperimentConfiguration_initWithType_identifier_version_controlGroup_experimentGroups_salt___block_invoke;
  v26[3] = &unk_1E5924C40;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v31 = v18;
  int64_t v32 = a3;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  long long v24 = [(AFExperimentConfiguration *)self initWithBuilder:v26];

  return v24;
}

void __96__AFExperimentConfiguration_initWithType_identifier_version_controlGroup_experimentGroups_salt___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[9];
  id v4 = a2;
  [v4 setType:v3];
  [v4 setIdentifier:a1[4]];
  [v4 setVersion:a1[5]];
  [v4 setControlGroup:a1[6]];
  [v4 setExperimentGroups:a1[7]];
  [v4 setSalt:a1[8]];
}

- (AFExperimentConfiguration)init
{
  return [(AFExperimentConfiguration *)self initWithBuilder:0];
}

- (AFExperimentConfiguration)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFExperimentConfigurationMutation *))a3;
  v24.receiver = self;
  v24.super_class = (Class)AFExperimentConfiguration;
  NSUInteger v5 = [(AFExperimentConfiguration *)&v24 init];
  NSUInteger v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_AFExperimentConfigurationMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFExperimentConfigurationMutation *)v7 isDirty])
    {
      v6->_unint64_t type = [(_AFExperimentConfigurationMutation *)v7 getType];
      uint64_t v8 = [(_AFExperimentConfigurationMutation *)v7 getIdentifier];
      uint64_t v9 = [v8 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      objc_super v11 = [(_AFExperimentConfigurationMutation *)v7 getVersion];
      uint64_t v12 = [v11 copy];
      version = v6->_version;
      v6->_version = (NSString *)v12;

      id v14 = [(_AFExperimentConfigurationMutation *)v7 getControlGroup];
      uint64_t v15 = [v14 copy];
      controlGroup = v6->_controlGroup;
      v6->_controlGroup = (AFExperimentGroup *)v15;

      id v17 = [(_AFExperimentConfigurationMutation *)v7 getExperimentGroups];
      uint64_t v18 = [v17 copy];
      experimentGroups = v6->_experimentGroups;
      v6->_experimentGroups = (NSArray *)v18;

      id v20 = [(_AFExperimentConfigurationMutation *)v7 getSalt];
      uint64_t v21 = [v20 copy];
      salt = v6->_salt;
      v6->_salt = (NSString *)v21;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFExperimentConfigurationMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_AFExperimentConfigurationMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFExperimentConfigurationMutation *)v5 isDirty])
    {
      NSUInteger v6 = objc_alloc_init(AFExperimentConfiguration);
      v6->_unint64_t type = [(_AFExperimentConfigurationMutation *)v5 getType];
      unint64_t v7 = [(_AFExperimentConfigurationMutation *)v5 getIdentifier];
      uint64_t v8 = [v7 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      id v10 = [(_AFExperimentConfigurationMutation *)v5 getVersion];
      uint64_t v11 = [v10 copy];
      version = v6->_version;
      v6->_version = (NSString *)v11;

      uint64_t v13 = [(_AFExperimentConfigurationMutation *)v5 getControlGroup];
      uint64_t v14 = [v13 copy];
      controlGroup = v6->_controlGroup;
      v6->_controlGroup = (AFExperimentGroup *)v14;

      id v16 = [(_AFExperimentConfigurationMutation *)v5 getExperimentGroups];
      uint64_t v17 = [v16 copy];
      experimentGroups = v6->_experimentGroups;
      v6->_experimentGroups = (NSArray *)v17;

      id v19 = [(_AFExperimentConfigurationMutation *)v5 getSalt];
      uint64_t v20 = [v19 copy];
      salt = v6->_salt;
      v6->_salt = (NSString *)v20;
    }
    else
    {
      NSUInteger v6 = (AFExperimentConfiguration *)[(AFExperimentConfiguration *)self copy];
    }
  }
  else
  {
    NSUInteger v6 = (AFExperimentConfiguration *)[(AFExperimentConfiguration *)self copy];
  }

  return v6;
}

@end