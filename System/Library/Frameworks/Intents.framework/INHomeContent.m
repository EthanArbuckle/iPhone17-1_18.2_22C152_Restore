@interface INHomeContent
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INHomeContent)initWithCoder:(id)a3;
- (INHomeContent)initWithFilter:(id)a3 actions:(id)a4;
- (INHomeFilter)filter;
- (NSArray)actions;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_filter, 0);
}

- (NSArray)actions
{
  return self->_actions;
}

- (INHomeFilter)filter
{
  return self->_filter;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"filter";
  filter = self->_filter;
  v4 = filter;
  if (!filter)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"actions";
  v10[0] = v4;
  actions = self->_actions;
  v6 = actions;
  if (!actions)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (actions)
  {
    if (filter) {
      goto LABEL_7;
    }
  }
  else
  {

    if (filter) {
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
  v11.super_class = (Class)INHomeContent;
  v6 = [(INHomeContent *)&v11 description];
  v7 = [(INHomeContent *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INHomeContent *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_filter];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"filter");

  v9 = [v6 encodeObject:self->_actions];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"actions");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  filter = self->_filter;
  id v5 = a3;
  [v5 encodeObject:filter forKey:@"filter"];
  [v5 encodeObject:self->_actions forKey:@"actions"];
}

- (INHomeContent)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filter"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"actions"];

  v10 = [(INHomeContent *)self initWithFilter:v5 actions:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INHomeContent *)a3;
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
      filter = self->_filter;
      BOOL v8 = 0;
      if (filter == v5->_filter || -[INHomeFilter isEqual:](filter, "isEqual:"))
      {
        actions = self->_actions;
        if (actions == v5->_actions || -[NSArray isEqual:](actions, "isEqual:")) {
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
  unint64_t v3 = [(INHomeFilter *)self->_filter hash];
  return [(NSArray *)self->_actions hash] ^ v3;
}

- (INHomeContent)initWithFilter:(id)a3 actions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INHomeContent;
  BOOL v8 = [(INHomeContent *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    filter = v8->_filter;
    v8->_filter = (INHomeFilter *)v9;

    uint64_t v11 = [v7 copy];
    actions = v8->_actions;
    v8->_actions = (NSArray *)v11;
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
    v10 = [v8 objectForKeyedSubscript:@"filter"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"actions"];
    objc_super v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    v15 = (void *)[objc_alloc((Class)a1) initWithFilter:v11 actions:v14];
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