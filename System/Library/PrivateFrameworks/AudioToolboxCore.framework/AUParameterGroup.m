@interface AUParameterGroup
+ (BOOL)supportsSecureCoding;
- (AUParameterGroup)initWithChildren:(id)a3;
- (AUParameterGroup)initWithCoder:(id)a3;
- (AUParameterGroup)initWithID:(id)a3 name:(id)a4 children:(id)a5;
- (AUParameterGroup)initWithTemplate:(id)a3 identifier:(id)a4 name:(id)a5 addressOffset:(unint64_t)a6;
- (BOOL)isGroup;
- (NSArray)allParameters;
- (NSArray)children;
- (NSMutableDictionary)childIndicesByIdentifier;
- (id)copyNodeWithOffset:(unint64_t)a3;
- (id)valueForKey:(id)a3;
- (void)_deserialize:(CADeserializer *)a3 fromSetFullState:(BOOL)a4;
- (void)_indexChildren;
- (void)_observersChanged:(BOOL)a3 deltaCount:(int)a4;
- (void)_serialize:(CASerializer *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setChildIndicesByIdentifier:(id)a3;
@end

@implementation AUParameterGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childIndicesByIdentifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

- (void)setChildIndicesByIdentifier:(id)a3
{
}

- (NSMutableDictionary)childIndicesByIdentifier
{
  return self->_childIndicesByIdentifier;
}

- (NSArray)children
{
  return self->_children;
}

- (void)_deserialize:(CADeserializer *)a3 fromSetFullState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  if (a4) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 0;
  }
  while (1)
  {
    unsigned __int8 v18 = 0;
    CADeserializer::Read(a3, &v18);
    if (v18 == 255) {
      break;
    }
    if (v18 >= 2u)
    {
      v9 = (void *)MEMORY[0x1E4F1CA00];
      v10 = [(AUParameterNode *)self keyPath];
      [v9 raise:v7, @"Archive under %@: corrupt type: %d", v10, v18 format];
    }
    CFTypeRef cf = 0;
    operator>>();
    v11 = [(AUParameterGroup *)self valueForKey:cf];
    if (cf) {
      CFRelease(cf);
    }
    if (v11)
    {
      int v12 = v18;
      if (v12 != [v11 isGroup])
      {
        v13 = (void *)MEMORY[0x1E4F1CA00];
        v14 = [v11 keyPath];
        [v13 raise:v7, @"Is-group inconsistency in archive for %@", v14 format];
      }
      if (v18)
      {
        [v11 _deserialize:a3 fromSetFullState:v4];
      }
      else
      {
        int v16 = 0;
        CADeserializer::Read(a3, &v16);
        LODWORD(v15) = v16;
        [v11 setValue:v8 originator:v15];
      }
    }
  }
}

- (void)_serialize:(CASerializer *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(AUParameterGroup *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v12 = 0;
        char v12 = [v8 isGroup];
        CASerializer::Write(a3, &v12);
        v9 = [v8 identifier];
        v11 = v9;
        operator<<();

        if (v12)
        {
          [v8 _serialize:a3];
        }
        else
        {
          LODWORD(v11) = 0;
          objc_msgSend(v8, "value", v11);
          LODWORD(v11) = v10;
          CASerializer::Write(a3, &v11);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  LOBYTE(v11) = -1;
  CASerializer::Write(a3, &v11);
}

- (AUParameterGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    long long v14 = self;
    long long v15 = self;
    long long v16 = self;
    -[AUParameterGroup initWithCoder:]::childIndexClasses = objc_msgSend(v13, "initWithObjects:", v14, v15, v16, 0);
  }
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v18 = self;
    v19 = self;
    v20 = self;
    v21 = self;
    v22 = self;
    -[AUParameterGroup initWithCoder:]::childrenClasses = objc_msgSend(v17, "initWithObjects:", v18, v19, v20, v21, v22, 0);
  }
  uint64_t v5 = self;
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"id"];

  uint64_t v7 = self;
  uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"name"];

  v23.receiver = self;
  v23.super_class = (Class)AUParameterGroup;
  v9 = [(AUParameterNode *)&v23 initWithID:v6 name:v8];
  if (v9)
  {
    int v10 = [v4 decodeObjectOfClasses:-[AUParameterGroup initWithCoder:]::childIndexClasses forKey:@"childIndex"];
    objc_storeStrong((id *)&v9->_childIndicesByIdentifier, v10);

    v11 = [v4 decodeObjectOfClasses:-[AUParameterGroup initWithCoder:]::childrenClasses forKey:@"children"];
    objc_storeStrong((id *)&v9->_children, v11);

    [(AUParameterGroup *)v9 _indexChildren];
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(AUParameterNode *)self identifier];
  [v7 encodeObject:v4 forKey:@"id"];

  uint64_t v5 = [(AUParameterNode *)self displayName];
  [v7 encodeObject:v5 forKey:@"name"];

  [v7 encodeObject:self->_childIndicesByIdentifier forKey:@"childIndex"];
  uint64_t v6 = [(AUParameterGroup *)self children];
  [v7 encodeObject:v6 forKey:@"children"];
}

- (id)valueForKey:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_childIndicesByIdentifier objectForKey:a3];
  uint64_t v5 = v4;
  if (v4
    && (unint64_t v6 = [v4 unsignedIntegerValue],
        [(AUParameterGroup *)self children],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6 < v8))
  {
    v9 = [(AUParameterGroup *)self children];
    int v10 = [v9 objectAtIndexedSubscript:v6];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)_observersChanged:(BOOL)a3 deltaCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v6 = self->_children;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_observersChanged:deltaCount:", v5, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)allParameters
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_children;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isGroup", (void)v11))
        {
          uint64_t v9 = [v8 allParameters];
          [v3 addObjectsFromArray:v9];
        }
        else
        {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isGroup
{
  return 1;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AUParameterGroup;
  [(AUParameterNode *)&v2 dealloc];
}

- (AUParameterGroup)initWithTemplate:(id)a3 identifier:(id)a4 name:(id)a5 addressOffset:(unint64_t)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AUParameterGroup;
  long long v11 = [(AUParameterNode *)&v26 initWithID:a4 name:a5];
  if (v11)
  {
    long long v12 = [v10 children];
    long long v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
    objc_storeStrong((id *)&v11->_children, v13);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v17), "copyNodeWithOffset:", a6, (void)v22);
          [v13 addObject:v18];
          [v18 setParentNode:v11];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v15);
    }

    uint64_t v19 = [v10 childIndicesByIdentifier];
    childIndicesByIdentifier = v11->_childIndicesByIdentifier;
    v11->_childIndicesByIdentifier = (NSMutableDictionary *)v19;
  }
  return v11;
}

- (AUParameterGroup)initWithChildren:(id)a3
{
  return [(AUParameterGroup *)self initWithID:&stru_1EDFA53D0 name:&stru_1EDFA53D0 children:a3];
}

- (AUParameterGroup)initWithID:(id)a3 name:(id)a4 children:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AUParameterGroup;
  long long v11 = [(AUParameterNode *)&v14 initWithID:v8 name:v9];
  long long v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_children, a5);
    [(AUParameterGroup *)v12 _indexChildren];
  }

  return v12;
}

- (id)copyNodeWithOffset:(unint64_t)a3
{
  uint64_t v5 = [AUParameterGroup alloc];
  uint64_t v6 = [(AUParameterNode *)self identifier];
  uint64_t v7 = [(AUParameterNode *)self displayName];
  id v8 = [(AUParameterGroup *)v5 initWithTemplate:self identifier:v6 name:v7 addressOffset:a3];

  return v8;
}

- (void)_indexChildren
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  childIndicesByIdentifier = self->_childIndicesByIdentifier;
  if (!childIndicesByIdentifier)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v5 = self->_childIndicesByIdentifier;
    self->_childIndicesByIdentifier = v4;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_children;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        [v10 setIndexInGroup:v7 + i];
        if (!childIndicesByIdentifier)
        {
          long long v11 = [v10 identifier];
          long long v12 = v11;
          if (v11 && [v11 length])
          {
            long long v13 = [(NSMutableDictionary *)self->_childIndicesByIdentifier objectForKeyedSubscript:v12];
            BOOL v14 = v13 == 0;

            if (!v14)
            {
              uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v17 = [NSString stringWithFormat:@"Multiple nodes with identifier '%@'", v12];
              id v18 = [v16 exceptionWithName:@"AUInvalidNodeInfoException" reason:v17 userInfo:0];

              objc_exception_throw(v18);
            }
            uint64_t v15 = [NSNumber numberWithUnsignedInteger:v7 + i];
            [(NSMutableDictionary *)self->_childIndicesByIdentifier setObject:v15 forKeyedSubscript:v12];
          }
        }
        [v10 setParentNode:self];
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      v7 += i;
    }
    while (v6);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end