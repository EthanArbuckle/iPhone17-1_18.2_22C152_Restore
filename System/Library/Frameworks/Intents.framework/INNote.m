@interface INNote
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INNote)init;
- (INNote)initWithCoder:(id)a3;
- (INNote)initWithTitle:(INSpeakableString *)title contents:(NSArray *)contents groupName:(INSpeakableString *)groupName createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier;
- (INNote)initWithTitle:(id)a3 contents:(id)a4 groupName:(id)a5 createdDateComponents:(id)a6 modifiedDateComponents:(id)a7 identifier:(id)a8 accountIdentifier:(id)a9;
- (INSpeakableString)groupName;
- (INSpeakableString)title;
- (NSArray)contents;
- (NSDateComponents)createdDateComponents;
- (NSDateComponents)modifiedDateComponents;
- (NSString)accountIdentifier;
- (NSString)description;
- (NSString)identifier;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)_setContents:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INNote

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INNote *)self title];
  v7 = objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v5);

  return v7;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)[(INNote *)self copy];
    v9 = [(INNote *)self contents];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__INNote_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E5518908;
      v10[4] = v8;
      id v11 = v7;
      [v9 _injectProxiesForImages:v6 completion:v10];
    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }
  }
}

uint64_t __68__INNote_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setContents:a2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(INNote *)self contents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_intents_cacheableObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(INNote *)self contents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        [v3 unionSet:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    long long v10 = v3;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedDateComponents, 0);
  objc_storeStrong((id *)&self->_createdDateComponents, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_contents, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDateComponents)modifiedDateComponents
{
  return self->_modifiedDateComponents;
}

- (NSDateComponents)createdDateComponents
{
  return self->_createdDateComponents;
}

- (INSpeakableString)groupName
{
  return self->_groupName;
}

- (void)_setContents:(id)a3
{
}

- (NSArray)contents
{
  return self->_contents;
}

- (INSpeakableString)title
{
  return self->_title;
}

- (id)_dictionaryRepresentation
{
  v24[7] = *MEMORY[0x1E4F143B8];
  uint64_t title = (uint64_t)self->_title;
  uint64_t v22 = title;
  v23[0] = @"title";
  if (!title)
  {
    uint64_t title = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)title;
  v24[0] = title;
  v23[1] = @"contents";
  contents = self->_contents;
  uint64_t v5 = (uint64_t)contents;
  if (!contents)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v5;
  v24[1] = v5;
  v23[2] = @"groupName";
  groupName = self->_groupName;
  uint64_t v7 = (uint64_t)groupName;
  if (!groupName)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v7;
  v24[2] = v7;
  v23[3] = @"createdDateComponents";
  createdDateComponents = self->_createdDateComponents;
  uint64_t v9 = (uint64_t)createdDateComponents;
  if (!createdDateComponents)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = (void *)v9;
  v24[3] = v9;
  v23[4] = @"modifiedDateComponents";
  modifiedDateComponents = self->_modifiedDateComponents;
  id v11 = modifiedDateComponents;
  if (!modifiedDateComponents)
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v11;
  v23[5] = @"identifier";
  identifier = self->_identifier;
  long long v13 = identifier;
  if (!identifier)
  {
    long long v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v13;
  v23[6] = @"accountIdentifier";
  accountIdentifier = self->_accountIdentifier;
  long long v15 = accountIdentifier;
  if (!accountIdentifier)
  {
    long long v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[6] = v15;
  long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];
  if (accountIdentifier)
  {
    if (identifier) {
      goto LABEL_17;
    }
  }
  else
  {

    if (identifier)
    {
LABEL_17:
      if (modifiedDateComponents) {
        goto LABEL_18;
      }
      goto LABEL_28;
    }
  }

  if (modifiedDateComponents)
  {
LABEL_18:
    if (createdDateComponents) {
      goto LABEL_19;
    }
    goto LABEL_29;
  }
LABEL_28:

  if (createdDateComponents)
  {
LABEL_19:
    if (groupName) {
      goto LABEL_20;
    }
LABEL_30:

    if (contents) {
      goto LABEL_21;
    }
    goto LABEL_31;
  }
LABEL_29:

  if (!groupName) {
    goto LABEL_30;
  }
LABEL_20:
  if (contents) {
    goto LABEL_21;
  }
LABEL_31:

LABEL_21:
  if (!v22) {

  }
  return v16;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INNote;
  uint64_t v6 = [(INNote *)&v11 description];
  uint64_t v7 = [(INNote *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INNote *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_title];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"title");

  uint64_t v9 = [v6 encodeObject:self->_contents];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"contents");

  long long v10 = [v6 encodeObject:self->_groupName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"groupName");

  objc_super v11 = [v6 encodeObject:self->_createdDateComponents];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"createdDateComponents");

  long long v12 = [v6 encodeObject:self->_modifiedDateComponents];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"modifiedDateComponents");

  long long v13 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"identifier");

  long long v14 = [v6 encodeObject:self->_accountIdentifier];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"accountIdentifier");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_contents forKey:@"contents"];
  [v5 encodeObject:self->_groupName forKey:@"groupName"];
  [v5 encodeObject:self->_createdDateComponents forKey:@"createdDateComponents"];
  [v5 encodeObject:self->_modifiedDateComponents forKey:@"modifiedDateComponents"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
}

- (INNote)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v6 = [v4 setWithArray:v5];
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"contents"];

  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"createdDateComponents"];
  long long v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedDateComponents"];
  objc_super v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  long long v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  long long v14 = [v3 decodeObjectOfClasses:v13 forKey:@"identifier"];

  long long v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  uint64_t v18 = [v3 decodeObjectOfClasses:v17 forKey:@"accountIdentifier"];

  v19 = [(INNote *)self initWithTitle:v21 contents:v7 groupName:v8 createdDateComponents:v9 modifiedDateComponents:v10 identifier:v14 accountIdentifier:v18];
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INNote *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t title = self->_title;
      BOOL v13 = 0;
      if (title == v5->_title || -[INSpeakableString isEqual:](title, "isEqual:"))
      {
        contents = self->_contents;
        if (contents == v5->_contents || -[NSArray isEqual:](contents, "isEqual:"))
        {
          groupName = self->_groupName;
          if (groupName == v5->_groupName || -[INSpeakableString isEqual:](groupName, "isEqual:"))
          {
            createdDateComponents = self->_createdDateComponents;
            if (createdDateComponents == v5->_createdDateComponents
              || -[NSDateComponents isEqual:](createdDateComponents, "isEqual:"))
            {
              modifiedDateComponents = self->_modifiedDateComponents;
              if (modifiedDateComponents == v5->_modifiedDateComponents
                || -[NSDateComponents isEqual:](modifiedDateComponents, "isEqual:"))
              {
                identifier = self->_identifier;
                if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
                {
                  accountIdentifier = self->_accountIdentifier;
                  if (accountIdentifier == v5->_accountIdentifier
                    || -[NSString isEqual:](accountIdentifier, "isEqual:"))
                  {
                    BOOL v13 = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakableString *)self->_title hash];
  uint64_t v4 = [(NSArray *)self->_contents hash] ^ v3;
  unint64_t v5 = [(INSpeakableString *)self->_groupName hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDateComponents *)self->_createdDateComponents hash];
  uint64_t v7 = [(NSDateComponents *)self->_modifiedDateComponents hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_identifier hash];
  return v6 ^ v8 ^ [(NSString *)self->_accountIdentifier hash];
}

- (INNote)initWithTitle:(id)a3 contents:(id)a4 groupName:(id)a5 createdDateComponents:(id)a6 modifiedDateComponents:(id)a7 identifier:(id)a8 accountIdentifier:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)INNote;
  uint64_t v22 = [(INNote *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    uint64_t title = v22->_title;
    v22->_uint64_t title = (INSpeakableString *)v23;

    uint64_t v25 = [v16 copy];
    contents = v22->_contents;
    v22->_contents = (NSArray *)v25;

    uint64_t v27 = [v17 copy];
    groupName = v22->_groupName;
    v22->_groupName = (INSpeakableString *)v27;

    uint64_t v29 = [v18 copy];
    createdDateComponents = v22->_createdDateComponents;
    v22->_createdDateComponents = (NSDateComponents *)v29;

    uint64_t v31 = [v19 copy];
    modifiedDateComponents = v22->_modifiedDateComponents;
    v22->_modifiedDateComponents = (NSDateComponents *)v31;

    uint64_t v33 = [v20 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    accountIdentifier = v22->_accountIdentifier;
    v22->_accountIdentifier = (NSString *)v35;
  }
  return v22;
}

- (INNote)initWithTitle:(INSpeakableString *)title contents:(NSArray *)contents groupName:(INSpeakableString *)groupName createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier
{
  long long v14 = title;
  id v15 = contents;
  id v16 = groupName;
  id v17 = createdDateComponents;
  id v18 = modifiedDateComponents;
  id v19 = identifier;
  v34.receiver = self;
  v34.super_class = (Class)INNote;
  id v20 = [(INNote *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [(INSpeakableString *)v14 copy];
    uint64_t v22 = v20->_title;
    v20->_uint64_t title = (INSpeakableString *)v21;

    uint64_t v23 = [(NSArray *)v15 copy];
    v24 = v20->_contents;
    v20->_contents = (NSArray *)v23;

    uint64_t v25 = [(INSpeakableString *)v16 copy];
    v26 = v20->_groupName;
    v20->_groupName = (INSpeakableString *)v25;

    uint64_t v27 = [(NSDateComponents *)v17 copy];
    v28 = v20->_createdDateComponents;
    v20->_createdDateComponents = (NSDateComponents *)v27;

    uint64_t v29 = [(NSDateComponents *)v18 copy];
    v30 = v20->_modifiedDateComponents;
    v20->_modifiedDateComponents = (NSDateComponents *)v29;

    uint64_t v31 = [(NSString *)v19 copy];
    v32 = v20->_identifier;
    v20->_identifier = (NSString *)v31;
  }
  return v20;
}

- (INNote)init
{
  v3.receiver = self;
  v3.super_class = (Class)INNote;
  return [(INNote *)&v3 init];
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    long long v10 = [v8 objectForKeyedSubscript:@"title"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    BOOL v13 = [v8 objectForKeyedSubscript:@"contents"];
    long long v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    uint64_t v15 = objc_opt_class();
    id v16 = [v8 objectForKeyedSubscript:@"groupName"];
    id v17 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v18 = objc_opt_class();
    id v19 = [v8 objectForKeyedSubscript:@"createdDateComponents"];
    id v20 = [v7 decodeObjectOfClass:v18 from:v19];

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [v8 objectForKeyedSubscript:@"modifiedDateComponents"];
    uint64_t v23 = [v7 decodeObjectOfClass:v21 from:v22];

    v24 = [v8 objectForKeyedSubscript:@"identifier"];
    uint64_t v25 = [v8 objectForKeyedSubscript:@"accountIdentifier"];
    v26 = (void *)[objc_alloc((Class)a1) initWithTitle:v11 contents:v14 groupName:v17 createdDateComponents:v20 modifiedDateComponents:v23 identifier:v24 accountIdentifier:v25];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end