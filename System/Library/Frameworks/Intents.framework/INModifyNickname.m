@interface INModifyNickname
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INModifyNickname)initWithCoder:(id)a3;
- (INModifyNickname)initWithTargetNickname:(id)a3 isRemoval:(id)a4;
- (NSNumber)isRemoval;
- (NSString)description;
- (NSString)targetNickname;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INModifyNickname

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isRemoval, 0);

  objc_storeStrong((id *)&self->_targetNickname, 0);
}

- (NSNumber)isRemoval
{
  return self->_isRemoval;
}

- (NSString)targetNickname
{
  return self->_targetNickname;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"targetNickname";
  targetNickname = self->_targetNickname;
  v4 = targetNickname;
  if (!targetNickname)
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
    if (targetNickname) {
      goto LABEL_7;
    }
  }
  else
  {

    if (targetNickname) {
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
  v11.super_class = (Class)INModifyNickname;
  v6 = [(INModifyNickname *)&v11 description];
  v7 = [(INModifyNickname *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INModifyNickname *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_targetNickname];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"targetNickname");

  v9 = [v6 encodeObject:self->_isRemoval];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"isRemoval");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  targetNickname = self->_targetNickname;
  id v5 = a3;
  [v5 encodeObject:targetNickname forKey:@"targetNickname"];
  [v5 encodeObject:self->_isRemoval forKey:@"isRemoval"];
}

- (INModifyNickname)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetNickname"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRemoval"];

  v7 = [(INModifyNickname *)self initWithTargetNickname:v5 isRemoval:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INModifyNickname *)a3;
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
      targetNickname = self->_targetNickname;
      BOOL v8 = 0;
      if (targetNickname == v5->_targetNickname || -[NSString isEqual:](targetNickname, "isEqual:"))
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
  NSUInteger v3 = [(NSString *)self->_targetNickname hash];
  return [(NSNumber *)self->_isRemoval hash] ^ v3;
}

- (INModifyNickname)initWithTargetNickname:(id)a3 isRemoval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INModifyNickname;
  BOOL v8 = [(INModifyNickname *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    targetNickname = v8->_targetNickname;
    v8->_targetNickname = (NSString *)v9;

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
    v10 = [v8 objectForKeyedSubscript:@"targetNickname"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"isRemoval"];
    v13 = (void *)[objc_alloc((Class)a1) initWithTargetNickname:v11 isRemoval:v12];
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