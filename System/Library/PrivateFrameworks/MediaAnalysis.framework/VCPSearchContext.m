@interface VCPSearchContext
+ (BOOL)supportsSecureCoding;
- (VCPSearchContext)init;
- (VCPSearchContext)initWithCoder:(id)a3;
- (VCPSearchContext)initWithEntities:(id)a3;
- (id)entities;
- (void)addIdentifiers:(id)a3 forType:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifiers:(id)a3 forType:(int64_t)a4;
@end

@implementation VCPSearchContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VCPSearchContext)initWithCoder:(id)a3
{
  v13[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPSearchContext;
  v5 = [(VCPSearchContext *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:8];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Entities"];
    entities = v5->_entities;
    v5->_entities = (NSMutableDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (VCPSearchContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)VCPSearchContext;
  v2 = [(VCPSearchContext *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    entities = v2->_entities;
    v2->_entities = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (VCPSearchContext)initWithEntities:(id)a3
{
  id v4 = a3;
  v5 = [(VCPSearchContext *)self init];
  if (v5)
  {
    if ([v4 count]) {
      [(NSMutableDictionary *)v5->_entities addEntriesFromDictionary:v4];
    }
    v6 = v5;
  }

  return v5;
}

- (void)addIdentifiers:(id)a3 forType:(int64_t)a4
{
  id v10 = a3;
  if ([v10 count])
  {
    v6 = [NSNumber numberWithInteger:a4];
    objc_super v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v10];
    v8 = [(NSMutableDictionary *)self->_entities objectForKeyedSubscript:v6];

    if (v8)
    {
      uint64_t v9 = [(NSMutableDictionary *)self->_entities objectForKeyedSubscript:v6];
      [v7 addObjectsFromArray:v9];
    }
    [(NSMutableDictionary *)self->_entities setObject:v7 forKey:v6];
  }
}

- (void)setIdentifiers:(id)a3 forType:(int64_t)a4
{
  id v8 = a3;
  if ([v8 count])
  {
    v6 = [NSNumber numberWithInteger:a4];
    objc_super v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
    [(NSMutableDictionary *)self->_entities setObject:v7 forKey:v6];
  }
}

- (id)entities
{
  return self->_entities;
}

- (void).cxx_destruct
{
}

@end