@interface LNViewAnnotations
+ (BOOL)supportsSecureCoding;
- (LNViewAnnotations)initWithCoder:(id)a3;
- (LNViewAnnotations)initWithEntities:(id)a3 intents:(id)a4;
- (NSArray)entities;
- (NSArray)intents;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNViewAnnotations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intents, 0);
  objc_storeStrong((id *)&self->_entities, 0);
}

- (NSArray)intents
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)entities
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNViewAnnotations *)self entities];
  [v4 encodeObject:v5 forKey:@"entities"];

  id v6 = [(LNViewAnnotations *)self intents];
  [v4 encodeObject:v6 forKey:@"intents"];
}

- (LNViewAnnotations)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"entities"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  uint64_t v12 = [v5 decodeObjectOfClasses:v11 forKey:@"intents"];

  if (v12 | v8)
  {
    self = [(LNViewAnnotations *)self initWithEntities:v8 intents:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (LNViewAnnotations)initWithEntities:(id)a3 intents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNViewAnnotations;
  v9 = [(LNViewAnnotations *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entities, a3);
    objc_storeStrong((id *)&v10->_intents, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end