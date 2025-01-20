@interface AFApplicationContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFApplicationContext)init;
- (AFApplicationContext)initWithAssociatedBundleIdentifier:(id)a3 bulletin:(id)a4 aceContext:(id)a5 contextDictionary:(id)a6 aceContexts:(id)a7;
- (AFApplicationContext)initWithBuilder:(id)a3;
- (AFApplicationContext)initWithCoder:(id)a3;
- (AFBulletin)bulletin;
- (AceObject)aceContext;
- (BOOL)isEqual:(id)a3;
- (NSArray)aceContexts;
- (NSDictionary)contextDictionary;
- (NSString)associatedBundleIdentifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFApplicationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceContexts, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_aceContext, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, 0);
}

- (NSArray)aceContexts
{
  return self->_aceContexts;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (AceObject)aceContext
{
  return self->_aceContext;
}

- (AFBulletin)bulletin
{
  return self->_bulletin;
}

- (NSString)associatedBundleIdentifier
{
  return self->_associatedBundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  associatedBundleIdentifier = self->_associatedBundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:associatedBundleIdentifier forKey:@"AFApplicationContext::associatedBundleIdentifier"];
  [v5 encodeObject:self->_bulletin forKey:@"AFApplicationContext::bulletin"];
  [v5 encodeObject:self->_aceContext forKey:@"AFApplicationContext::aceContext"];
  [v5 encodeObject:self->_contextDictionary forKey:@"AFApplicationContext::contextDictionary"];
  [v5 encodeObject:self->_aceContexts forKey:@"AFApplicationContext::aceContexts"];
}

- (AFApplicationContext)initWithCoder:(id)a3
{
  id v3 = a3;
  v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFApplicationContext::associatedBundleIdentifier"];
  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFApplicationContext::bulletin"];
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFApplicationContext::aceContext"];
  v22 = (void *)MEMORY[0x1E4F1CAD0];
  v23 = (void *)v4;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v22, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v15 = [v3 decodeObjectOfClasses:v14 forKey:@"AFApplicationContext::contextDictionary"];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v19 = [v3 decodeObjectOfClasses:v18 forKey:@"AFApplicationContext::aceContexts"];

  v20 = [(AFApplicationContext *)self initWithAssociatedBundleIdentifier:v25 bulletin:v24 aceContext:v23 contextDictionary:v15 aceContexts:v19];
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AFApplicationContext *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(AFApplicationContext *)v5 associatedBundleIdentifier];
      associatedBundleIdentifier = self->_associatedBundleIdentifier;
      if (associatedBundleIdentifier == v6
        || [(NSString *)associatedBundleIdentifier isEqual:v6])
      {
        uint64_t v8 = [(AFApplicationContext *)v5 bulletin];
        bulletin = self->_bulletin;
        if (bulletin == v8 || [(AFBulletin *)bulletin isEqual:v8])
        {
          uint64_t v10 = [(AFApplicationContext *)v5 aceContext];
          aceContext = self->_aceContext;
          if (aceContext == v10 || [(AceObject *)aceContext isEqual:v10])
          {
            uint64_t v12 = [(AFApplicationContext *)v5 contextDictionary];
            contextDictionary = self->_contextDictionary;
            if (contextDictionary == v12 || [(NSDictionary *)contextDictionary isEqual:v12])
            {
              v14 = [(AFApplicationContext *)v5 aceContexts];
              aceContexts = self->_aceContexts;
              BOOL v16 = aceContexts == v14 || [(NSArray *)aceContexts isEqual:v14];
            }
            else
            {
              BOOL v16 = 0;
            }
          }
          else
          {
            BOOL v16 = 0;
          }
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_associatedBundleIdentifier hash];
  uint64_t v4 = [(AFBulletin *)self->_bulletin hash] ^ v3;
  uint64_t v5 = [(AceObject *)self->_aceContext hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDictionary *)self->_contextDictionary hash];
  return v6 ^ [(NSArray *)self->_aceContexts hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFApplicationContext;
  uint64_t v5 = [(AFApplicationContext *)&v8 description];
  uint64_t v6 = (void *)[v4 initWithFormat:@"%@ {associatedBundleIdentifier = %@, bulletin = %@, aceContext = %@, contextDictionary = %@, aceContexts = %@}", v5, self->_associatedBundleIdentifier, self->_bulletin, self->_aceContext, self->_contextDictionary, self->_aceContexts];

  return v6;
}

- (id)description
{
  return [(AFApplicationContext *)self _descriptionWithIndent:0];
}

- (AFApplicationContext)initWithAssociatedBundleIdentifier:(id)a3 bulletin:(id)a4 aceContext:(id)a5 contextDictionary:(id)a6 aceContexts:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __109__AFApplicationContext_initWithAssociatedBundleIdentifier_bulletin_aceContext_contextDictionary_aceContexts___block_invoke;
  v24[3] = &unk_1E592B018;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  v22 = [(AFApplicationContext *)self initWithBuilder:v24];

  return v22;
}

void __109__AFApplicationContext_initWithAssociatedBundleIdentifier_bulletin_aceContext_contextDictionary_aceContexts___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setAssociatedBundleIdentifier:v3];
  [v4 setBulletin:a1[5]];
  [v4 setAceContext:a1[6]];
  [v4 setContextDictionary:a1[7]];
  [v4 setAceContexts:a1[8]];
}

- (AFApplicationContext)init
{
  return [(AFApplicationContext *)self initWithBuilder:0];
}

- (AFApplicationContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFApplicationContextMutation *))a3;
  v24.receiver = self;
  v24.super_class = (Class)AFApplicationContext;
  uint64_t v5 = [(AFApplicationContext *)&v24 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFApplicationContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFApplicationContextMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFApplicationContextMutation *)v7 getAssociatedBundleIdentifier];
      uint64_t v9 = [v8 copy];
      associatedBundleIdentifier = v6->_associatedBundleIdentifier;
      v6->_associatedBundleIdentifier = (NSString *)v9;

      uint64_t v11 = [(_AFApplicationContextMutation *)v7 getBulletin];
      uint64_t v12 = [v11 copy];
      bulletin = v6->_bulletin;
      v6->_bulletin = (AFBulletin *)v12;

      id v14 = [(_AFApplicationContextMutation *)v7 getAceContext];
      uint64_t v15 = [v14 copy];
      aceContext = v6->_aceContext;
      v6->_aceContext = (AceObject *)v15;

      id v17 = [(_AFApplicationContextMutation *)v7 getContextDictionary];
      uint64_t v18 = [v17 copy];
      contextDictionary = v6->_contextDictionary;
      v6->_contextDictionary = (NSDictionary *)v18;

      id v20 = [(_AFApplicationContextMutation *)v7 getAceContexts];
      uint64_t v21 = [v20 copy];
      aceContexts = v6->_aceContexts;
      v6->_aceContexts = (NSArray *)v21;
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
  id v4 = (void (**)(id, _AFApplicationContextMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFApplicationContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFApplicationContextMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFApplicationContext);
      uint64_t v7 = [(_AFApplicationContextMutation *)v5 getAssociatedBundleIdentifier];
      uint64_t v8 = [v7 copy];
      associatedBundleIdentifier = v6->_associatedBundleIdentifier;
      v6->_associatedBundleIdentifier = (NSString *)v8;

      uint64_t v10 = [(_AFApplicationContextMutation *)v5 getBulletin];
      uint64_t v11 = [v10 copy];
      bulletin = v6->_bulletin;
      v6->_bulletin = (AFBulletin *)v11;

      id v13 = [(_AFApplicationContextMutation *)v5 getAceContext];
      uint64_t v14 = [v13 copy];
      aceContext = v6->_aceContext;
      v6->_aceContext = (AceObject *)v14;

      id v16 = [(_AFApplicationContextMutation *)v5 getContextDictionary];
      uint64_t v17 = [v16 copy];
      contextDictionary = v6->_contextDictionary;
      v6->_contextDictionary = (NSDictionary *)v17;

      id v19 = [(_AFApplicationContextMutation *)v5 getAceContexts];
      uint64_t v20 = [v19 copy];
      aceContexts = v6->_aceContexts;
      v6->_aceContexts = (NSArray *)v20;
    }
    else
    {
      uint64_t v6 = (AFApplicationContext *)[(AFApplicationContext *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFApplicationContext *)[(AFApplicationContext *)self copy];
  }

  return v6;
}

@end