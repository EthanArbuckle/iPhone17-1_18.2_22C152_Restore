@interface INTaskList
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSpeakableString)groupName;
- (INSpeakableString)title;
- (INTaskList)init;
- (INTaskList)initWithCoder:(id)a3;
- (INTaskList)initWithTitle:(INSpeakableString *)title tasks:(NSArray *)tasks groupName:(INSpeakableString *)groupName createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier;
- (INTaskList)initWithTitle:(id)a3 tasks:(id)a4 groupName:(id)a5 taskListType:(int64_t)a6 createdDateComponents:(id)a7 modifiedDateComponents:(id)a8 identifier:(id)a9;
- (NSArray)tasks;
- (NSDateComponents)createdDateComponents;
- (NSDateComponents)modifiedDateComponents;
- (NSString)description;
- (NSString)identifier;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)taskListType;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTaskList

- (int64_t)taskListType
{
  return 0;
}

- (INTaskList)initWithTitle:(id)a3 tasks:(id)a4 groupName:(id)a5 taskListType:(int64_t)a6 createdDateComponents:(id)a7 modifiedDateComponents:(id)a8 identifier:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [[INSpeakableString alloc] initWithSpokenPhrase:v20];

  v22 = [[INSpeakableString alloc] initWithSpokenPhrase:v18];
  v23 = [(INTaskList *)self initWithTitle:v21 tasks:v19 groupName:v22 createdDateComponents:v17 modifiedDateComponents:v16 identifier:v15];

  return v23;
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INTaskList *)self title];
  v7 = objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v5);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedDateComponents, 0);
  objc_storeStrong((id *)&self->_createdDateComponents, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_tasks, 0);

  objc_storeStrong((id *)&self->_title, 0);
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

- (NSArray)tasks
{
  return self->_tasks;
}

- (INSpeakableString)title
{
  return self->_title;
}

- (id)_dictionaryRepresentation
{
  v27[6] = *MEMORY[0x1E4F143B8];
  v21 = @"title";
  title = self->_title;
  uint64_t v4 = (uint64_t)title;
  if (!title)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  id v20 = (void *)v4;
  v27[0] = v4;
  v22 = @"tasks";
  tasks = self->_tasks;
  uint64_t v6 = (uint64_t)tasks;
  if (!tasks)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  id v19 = (void *)v6;
  v27[1] = v6;
  v23 = @"groupName";
  groupName = self->_groupName;
  uint64_t v8 = (uint64_t)groupName;
  if (!groupName)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v8;
  v27[2] = v8;
  v24 = @"createdDateComponents";
  createdDateComponents = self->_createdDateComponents;
  v10 = createdDateComponents;
  if (!createdDateComponents)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v19, v20, v21, v22, v23, v24);
  }
  v27[3] = v10;
  v25 = @"modifiedDateComponents";
  modifiedDateComponents = self->_modifiedDateComponents;
  v12 = modifiedDateComponents;
  if (!modifiedDateComponents)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[4] = v12;
  v26 = @"identifier";
  identifier = self->_identifier;
  v14 = identifier;
  if (!identifier)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v14;
  id v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v21, 6, v17);
  if (identifier)
  {
    if (modifiedDateComponents) {
      goto LABEL_15;
    }
  }
  else
  {

    if (modifiedDateComponents)
    {
LABEL_15:
      if (createdDateComponents) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }

  if (createdDateComponents)
  {
LABEL_16:
    if (groupName) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:

  if (groupName)
  {
LABEL_17:
    if (tasks) {
      goto LABEL_18;
    }
LABEL_26:

    if (title) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
LABEL_25:

  if (!tasks) {
    goto LABEL_26;
  }
LABEL_18:
  if (title) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:

  return v15;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INTaskList;
  uint64_t v6 = [(INTaskList *)&v11 description];
  v7 = [(INTaskList *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INTaskList *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_title];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"title");

  v9 = [v6 encodeObject:self->_tasks];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"tasks");

  v10 = [v6 encodeObject:self->_groupName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"groupName");

  objc_super v11 = [v6 encodeObject:self->_createdDateComponents];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"createdDateComponents");

  v12 = [v6 encodeObject:self->_modifiedDateComponents];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"modifiedDateComponents");

  v13 = [v6 encodeObject:self->_identifier];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"identifier");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_tasks forKey:@"tasks"];
  [v5 encodeObject:self->_groupName forKey:@"groupName"];
  [v5 encodeObject:self->_createdDateComponents forKey:@"createdDateComponents"];
  [v5 encodeObject:self->_modifiedDateComponents forKey:@"modifiedDateComponents"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (INTaskList)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tasks"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdDateComponents"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedDateComponents"];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"identifier"];

  uint64_t v17 = [(INTaskList *)self initWithTitle:v5 tasks:v9 groupName:v10 createdDateComponents:v11 modifiedDateComponents:v12 identifier:v16];
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INTaskList *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      title = self->_title;
      BOOL v12 = 0;
      if (title == v5->_title || -[INSpeakableString isEqual:](title, "isEqual:"))
      {
        tasks = self->_tasks;
        if (tasks == v5->_tasks || -[NSArray isEqual:](tasks, "isEqual:"))
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
                if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:")) {
                  BOOL v12 = 1;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakableString *)self->_title hash];
  uint64_t v4 = [(NSArray *)self->_tasks hash] ^ v3;
  unint64_t v5 = [(INSpeakableString *)self->_groupName hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDateComponents *)self->_createdDateComponents hash];
  uint64_t v7 = [(NSDateComponents *)self->_modifiedDateComponents hash];
  return v6 ^ v7 ^ [(NSString *)self->_identifier hash];
}

- (INTaskList)initWithTitle:(INSpeakableString *)title tasks:(NSArray *)tasks groupName:(INSpeakableString *)groupName createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier
{
  uint64_t v14 = title;
  id v15 = tasks;
  id v16 = groupName;
  uint64_t v17 = createdDateComponents;
  id v18 = modifiedDateComponents;
  id v19 = identifier;
  v34.receiver = self;
  v34.super_class = (Class)INTaskList;
  id v20 = [(INTaskList *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [(INSpeakableString *)v14 copy];
    v22 = v20->_title;
    v20->_title = (INSpeakableString *)v21;

    uint64_t v23 = [(NSArray *)v15 copy];
    v24 = v20->_tasks;
    v20->_tasks = (NSArray *)v23;

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

- (INTaskList)init
{
  v3.receiver = self;
  v3.super_class = (Class)INTaskList;
  return [(INTaskList *)&v3 init];
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"title"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"tasks"];
    uint64_t v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    uint64_t v15 = objc_opt_class();
    id v16 = [v8 objectForKeyedSubscript:@"groupName"];
    uint64_t v17 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v18 = objc_opt_class();
    id v19 = [v8 objectForKeyedSubscript:@"createdDateComponents"];
    id v20 = [v7 decodeObjectOfClass:v18 from:v19];

    uint64_t v21 = objc_opt_class();
    v22 = [v8 objectForKeyedSubscript:@"modifiedDateComponents"];
    uint64_t v23 = [v7 decodeObjectOfClass:v21 from:v22];

    v24 = [v8 objectForKeyedSubscript:@"identifier"];
    uint64_t v25 = (void *)[objc_alloc((Class)a1) initWithTitle:v11 tasks:v14 groupName:v17 createdDateComponents:v20 modifiedDateComponents:v23 identifier:v24];
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = [(INTaskList *)self tasks];
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
  id v4 = [(INTaskList *)self tasks];
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

@end