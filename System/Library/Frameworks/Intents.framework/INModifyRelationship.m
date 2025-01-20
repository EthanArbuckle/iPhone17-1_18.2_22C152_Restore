@interface INModifyRelationship
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INModifyRelationship)initWithCoder:(id)a3;
- (INModifyRelationship)initWithTargetRelationship:(id)a3 isRemoval:(id)a4;
- (NSNumber)isRemoval;
- (NSString)description;
- (NSString)targetRelationship;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INModifyRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isRemoval, 0);

  objc_storeStrong((id *)&self->_targetRelationship, 0);
}

- (NSNumber)isRemoval
{
  return self->_isRemoval;
}

- (NSString)targetRelationship
{
  return self->_targetRelationship;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"targetRelationship";
  targetRelationship = self->_targetRelationship;
  v4 = targetRelationship;
  if (!targetRelationship)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"isRemoval";
  v10[0] = v4;
  isRemoval = self->_isRemoval;
  v6 = isRemoval;
  if (!isRemoval)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (isRemoval)
  {
    if (targetRelationship) {
      goto LABEL_7;
    }
  }
  else
  {

    if (targetRelationship) {
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
  v11.super_class = (Class)INModifyRelationship;
  v6 = [(INModifyRelationship *)&v11 description];
  v7 = [(INModifyRelationship *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INModifyRelationship *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_targetRelationship];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"targetRelationship");

  v9 = [v6 encodeObject:self->_isRemoval];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"isRemoval");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  targetRelationship = self->_targetRelationship;
  id v5 = a3;
  [v5 encodeObject:targetRelationship forKey:@"targetRelationship"];
  [v5 encodeObject:self->_isRemoval forKey:@"isRemoval"];
}

- (INModifyRelationship)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetRelationship"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRemoval"];

  v7 = [(INModifyRelationship *)self initWithTargetRelationship:v5 isRemoval:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INModifyRelationship *)a3;
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
      targetRelationship = self->_targetRelationship;
      BOOL v8 = 0;
      if (targetRelationship == v5->_targetRelationship
        || -[NSString isEqual:](targetRelationship, "isEqual:"))
      {
        isRemoval = self->_isRemoval;
        if (isRemoval == v5->_isRemoval || -[NSNumber isEqual:](isRemoval, "isEqual:")) {
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
  NSUInteger v3 = [(NSString *)self->_targetRelationship hash];
  return [(NSNumber *)self->_isRemoval hash] ^ v3;
}

- (INModifyRelationship)initWithTargetRelationship:(id)a3 isRemoval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INModifyRelationship;
  BOOL v8 = [(INModifyRelationship *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    targetRelationship = v8->_targetRelationship;
    v8->_targetRelationship = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    isRemoval = v8->_isRemoval;
    v8->_isRemoval = (NSNumber *)v11;
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
    v10 = [v8 objectForKeyedSubscript:@"targetRelationship"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"isRemoval"];
    v13 = (void *)[objc_alloc((Class)a1) initWithTargetRelationship:v11 isRemoval:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end