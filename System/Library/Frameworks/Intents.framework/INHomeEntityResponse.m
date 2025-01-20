@interface INHomeEntityResponse
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INHomeEntity)entity;
- (INHomeEntityResponse)initWithCoder:(id)a3;
- (INHomeEntityResponse)initWithEntity:(id)a3 taskResponses:(id)a4;
- (NSArray)taskResponses;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeEntityResponse

- (INHomeEntityResponse)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entity"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"taskResponses"];

  v10 = [(INHomeEntityResponse *)self initWithEntity:v5 taskResponses:v9];
  return v10;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INHomeEntityResponse;
  v6 = [(INHomeEntityResponse *)&v11 description];
  v7 = [(INHomeEntityResponse *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskResponses, 0);

  objc_storeStrong((id *)&self->_entity, 0);
}

- (NSArray)taskResponses
{
  return self->_taskResponses;
}

- (INHomeEntity)entity
{
  return self->_entity;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"entity";
  entity = self->_entity;
  id v4 = entity;
  if (!entity)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"taskResponses";
  v10[0] = v4;
  taskResponses = self->_taskResponses;
  v6 = taskResponses;
  if (!taskResponses)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (taskResponses)
  {
    if (entity) {
      goto LABEL_7;
    }
  }
  else
  {

    if (entity) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (NSString)description
{
  return (NSString *)[(INHomeEntityResponse *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_entity];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"entity");

  v9 = [v6 encodeObject:self->_taskResponses];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"taskResponses");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  entity = self->_entity;
  id v5 = a3;
  [v5 encodeObject:entity forKey:@"entity"];
  [v5 encodeObject:self->_taskResponses forKey:@"taskResponses"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INHomeEntityResponse *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      entity = self->_entity;
      BOOL v8 = 0;
      if (entity == v5->_entity || -[INHomeEntity isEqual:](entity, "isEqual:"))
      {
        taskResponses = self->_taskResponses;
        if (taskResponses == v5->_taskResponses || -[NSArray isEqual:](taskResponses, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INHomeEntity *)self->_entity hash];
  return [(NSArray *)self->_taskResponses hash] ^ v3;
}

- (INHomeEntityResponse)initWithEntity:(id)a3 taskResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INHomeEntityResponse;
  BOOL v8 = [(INHomeEntityResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    entity = v8->_entity;
    v8->_entity = (INHomeEntity *)v9;

    uint64_t v11 = [v7 copy];
    taskResponses = v8->_taskResponses;
    v8->_taskResponses = (NSArray *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"entity"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"taskResponses"];
    objc_super v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    v15 = (void *)[objc_alloc((Class)a1) initWithEntity:v11 taskResponses:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end