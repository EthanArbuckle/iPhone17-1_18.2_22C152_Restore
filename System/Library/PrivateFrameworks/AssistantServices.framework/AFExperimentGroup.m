@interface AFExperimentGroup
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFExperimentGroup)init;
- (AFExperimentGroup)initWithBuilder:(id)a3;
- (AFExperimentGroup)initWithCoder:(id)a3;
- (AFExperimentGroup)initWithDictionaryRepresentation:(id)a3;
- (AFExperimentGroup)initWithIdentifier:(id)a3 allocation:(unint64_t)a4 properties:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)properties;
- (NSString)description;
- (NSString)identifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)allocation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFExperimentGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (unint64_t)allocation
{
  return self->_allocation;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_allocation];
  [v4 setObject:v6 forKey:@"allocation"];

  properties = self->_properties;
  if (properties) {
    [v4 setObject:properties forKey:@"properties"];
  }
  v8 = (void *)[v4 copy];

  return v8;
}

- (AFExperimentGroup)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v9 = [v5 objectForKey:@"allocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    uint64_t v11 = [v10 unsignedIntegerValue];
    v12 = [v5 objectForKey:@"properties"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    self = [(AFExperimentGroup *)self initWithIdentifier:v7 allocation:v11 properties:v13];
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
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"AFExperimentGroup::identifier"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_allocation];
  [v6 encodeObject:v5 forKey:@"AFExperimentGroup::allocation"];

  [v6 encodeObject:self->_properties forKey:@"AFExperimentGroup::properties"];
}

- (AFExperimentGroup)initWithCoder:(id)a3
{
  id v3 = a3;
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentGroup::identifier"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentGroup::allocation"];
  uint64_t v19 = [v4 unsignedIntegerValue];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v18, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v15 = [v3 decodeObjectOfClasses:v14 forKey:@"AFExperimentGroup::properties"];

  v16 = [(AFExperimentGroup *)self initWithIdentifier:v20 allocation:v19 properties:v15];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFExperimentGroup *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t allocation = self->_allocation;
      if (allocation == [(AFExperimentGroup *)v5 allocation])
      {
        uint64_t v7 = [(AFExperimentGroup *)v5 identifier];
        identifier = self->_identifier;
        if (identifier == v7 || [(NSString *)identifier isEqual:v7])
        {
          uint64_t v9 = [(AFExperimentGroup *)v5 properties];
          properties = self->_properties;
          BOOL v11 = properties == v9 || [(NSDictionary *)properties isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_allocation];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(NSDictionary *)self->_properties hash];

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFExperimentGroup;
  uint64_t v5 = [(AFExperimentGroup *)&v8 description];
  unint64_t v6 = (void *)[v4 initWithFormat:@"%@ {identifier = %@, allocation = %llu, properties = %@}", v5, self->_identifier, self->_allocation, self->_properties];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFExperimentGroup *)self _descriptionWithIndent:0];
}

- (AFExperimentGroup)initWithIdentifier:(id)a3 allocation:(unint64_t)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__AFExperimentGroup_initWithIdentifier_allocation_properties___block_invoke;
  v14[3] = &unk_1E5925468;
  id v16 = v9;
  unint64_t v17 = a4;
  id v15 = v8;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = [(AFExperimentGroup *)self initWithBuilder:v14];

  return v12;
}

void __62__AFExperimentGroup_initWithIdentifier_allocation_properties___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setIdentifier:v3];
  [v4 setAllocation:a1[6]];
  [v4 setProperties:a1[5]];
}

- (AFExperimentGroup)init
{
  return [(AFExperimentGroup *)self initWithBuilder:0];
}

- (AFExperimentGroup)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFExperimentGroupMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFExperimentGroup;
  uint64_t v5 = [(AFExperimentGroup *)&v15 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFExperimentGroupMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFExperimentGroupMutation *)v7 isDirty])
    {
      id v8 = [(_AFExperimentGroupMutation *)v7 getIdentifier];
      uint64_t v9 = [v8 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      v6->_unint64_t allocation = [(_AFExperimentGroupMutation *)v7 getAllocation];
      id v11 = [(_AFExperimentGroupMutation *)v7 getProperties];
      uint64_t v12 = [v11 copy];
      properties = v6->_properties;
      v6->_properties = (NSDictionary *)v12;
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
  id v4 = (void (**)(id, _AFExperimentGroupMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFExperimentGroupMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFExperimentGroupMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFExperimentGroup);
      uint64_t v7 = [(_AFExperimentGroupMutation *)v5 getIdentifier];
      uint64_t v8 = [v7 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      v6->_unint64_t allocation = [(_AFExperimentGroupMutation *)v5 getAllocation];
      id v10 = [(_AFExperimentGroupMutation *)v5 getProperties];
      uint64_t v11 = [v10 copy];
      properties = v6->_properties;
      v6->_properties = (NSDictionary *)v11;
    }
    else
    {
      unint64_t v6 = (AFExperimentGroup *)[(AFExperimentGroup *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFExperimentGroup *)[(AFExperimentGroup *)self copy];
  }

  return v6;
}

@end