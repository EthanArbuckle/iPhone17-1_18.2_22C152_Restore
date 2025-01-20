@interface INActivity
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INActivity)initWithActivityType:(id)a3 activityDescriptors:(id)a4;
- (INActivity)initWithCoder:(id)a3;
- (NSArray)activityDescriptors;
- (NSString)activityType;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDescriptors, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

- (NSArray)activityDescriptors
{
  return self->_activityDescriptors;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"activityType";
  activityType = self->_activityType;
  v4 = activityType;
  if (!activityType)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"activityDescriptors";
  v10[0] = v4;
  activityDescriptors = self->_activityDescriptors;
  v6 = activityDescriptors;
  if (!activityDescriptors)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (activityDescriptors)
  {
    if (activityType) {
      goto LABEL_7;
    }
  }
  else
  {

    if (activityType) {
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
  v11.super_class = (Class)INActivity;
  v6 = [(INActivity *)&v11 description];
  v7 = [(INActivity *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INActivity *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_activityType];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"activityType");

  v9 = [v6 encodeObject:self->_activityDescriptors];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"activityDescriptors");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  activityType = self->_activityType;
  id v5 = a3;
  [v5 encodeObject:activityType forKey:@"activityType"];
  [v5 encodeObject:self->_activityDescriptors forKey:@"activityDescriptors"];
}

- (INActivity)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"activityDescriptors"];

  v10 = [(INActivity *)self initWithActivityType:v5 activityDescriptors:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INActivity *)a3;
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
      activityType = self->_activityType;
      BOOL v8 = 0;
      if (activityType == v5->_activityType || -[NSString isEqual:](activityType, "isEqual:"))
      {
        activityDescriptors = self->_activityDescriptors;
        if (activityDescriptors == v5->_activityDescriptors
          || -[NSArray isEqual:](activityDescriptors, "isEqual:"))
        {
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
  NSUInteger v3 = [(NSString *)self->_activityType hash];
  return [(NSArray *)self->_activityDescriptors hash] ^ v3;
}

- (INActivity)initWithActivityType:(id)a3 activityDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INActivity;
  BOOL v8 = [(INActivity *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    activityType = v8->_activityType;
    v8->_activityType = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    activityDescriptors = v8->_activityDescriptors;
    v8->_activityDescriptors = (NSArray *)v11;
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
    v10 = [v8 objectForKeyedSubscript:@"activityType"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"activityDescriptors"];
    objc_super v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    v15 = (void *)[objc_alloc((Class)a1) initWithActivityType:v11 activityDescriptors:v14];
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