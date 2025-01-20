@interface INContactRelationship
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INContactRelationship)initWithCoder:(id)a3;
- (INContactRelationship)initWithName:(id)a3 relation:(id)a4;
- (NSString)description;
- (NSString)name;
- (NSString)relation;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INContactRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relation, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)relation
{
  return self->_relation;
}

- (NSString)name
{
  return self->_name;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"name";
  name = self->_name;
  v4 = name;
  if (!name)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"relation";
  v10[0] = v4;
  relation = self->_relation;
  v6 = relation;
  if (!relation)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (relation)
  {
    if (name) {
      goto LABEL_7;
    }
  }
  else
  {

    if (name) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INContactRelationship;
  v6 = [(INContactRelationship *)&v11 description];
  v7 = [(INContactRelationship *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INContactRelationship *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_name];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"name");

  v9 = [v6 encodeObject:self->_relation];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"relation");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_relation forKey:@"relation"];
}

- (INContactRelationship)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"name"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"relation"];

  v13 = [(INContactRelationship *)self initWithName:v8 relation:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INContactRelationship *)a3;
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
      name = self->_name;
      BOOL v8 = 0;
      if (name == v5->_name || -[NSString isEqual:](name, "isEqual:"))
      {
        relation = self->_relation;
        if (relation == v5->_relation || -[NSString isEqual:](relation, "isEqual:")) {
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
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_relation hash] ^ v3;
}

- (INContactRelationship)initWithName:(id)a3 relation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INContactRelationship;
  BOOL v8 = [(INContactRelationship *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    relation = v8->_relation;
    v8->_relation = (NSString *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKeyedSubscript:@"name"];
    BOOL v8 = [v6 objectForKeyedSubscript:@"relation"];
    uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithName:v7 relation:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end