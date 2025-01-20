@interface BMDSLKeyPathSelector
+ (BOOL)supportsSecureCoding;
+ (id)withKeyPaths:(id)a3;
- (BMDSLKeyPathSelector)initWithCoder:(id)a3;
- (BMDSLKeyPathSelector)initWithKeyPaths:(id)a3;
- (BMDSLKeyPathSelector)initWithName:(id)a3 version:(unsigned int)a4 keyPaths:(id)a5;
- (NSArray)keyPaths;
- (id)argumentsFromInput:(id)a3 combinedState:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLKeyPathSelector

- (BMDSLKeyPathSelector)initWithName:(id)a3 version:(unsigned int)a4 keyPaths:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLKeyPathSelector;
  v9 = [(BMDSLBaseCodable *)&v13 initWithName:a3 version:v5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    keyPaths = v9->_keyPaths;
    v9->_keyPaths = (NSArray *)v10;
  }
  return v9;
}

- (BMDSLKeyPathSelector)initWithKeyPaths:(id)a3
{
  return [(BMDSLKeyPathSelector *)self initWithName:@"keyPathSelector" version:1 keyPaths:a3];
}

+ (id)withKeyPaths:(id)a3
{
  id v3 = a3;
  v4 = [[BMDSLKeyPathSelector alloc] initWithKeyPaths:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BMDSLKeyPathSelector;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(BMDSLKeyPathSelector *)self keyPaths];
  [v4 encodeObject:v5 forKey:@"keyPathSelector"];
}

- (BMDSLKeyPathSelector)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMDSLKeyPathSelector;
  uint64_t v5 = [(BMDSLBaseCodable *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = +[BMDSLClasses allowed];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"keyPathSelector"];

    id v8 = [(BMDSLBaseCodable *)v5 name];
    uint64_t v5 = [(BMDSLKeyPathSelector *)v5 initWithName:v8 version:[(BMDSLBaseCodable *)v5 version] keyPaths:v7];
  }
  return v5;
}

- (id)argumentsFromInput:(id)a3 combinedState:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BMDSLKeyPathSelector *)self keyPaths];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = v6;
    v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = [(BMDSLKeyPathSelector *)self keyPaths];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v18 = BMDSLValueForKeyPath(v7, v17);
          if (v18)
          {
            [v11 addObject:v18];
          }
          else
          {
            v19 = BMDSLValueForKeyPath(v10, v17);
            if (v19) {
              [v11 addObject:v19];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    if ([v11 count]) {
      v20 = v11;
    }
    else {
      v20 = v10;
    }
    v21 = (void *)[v20 copy];
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (void).cxx_destruct
{
}

@end