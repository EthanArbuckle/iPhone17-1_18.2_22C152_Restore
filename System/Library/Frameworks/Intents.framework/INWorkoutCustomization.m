@interface INWorkoutCustomization
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INWorkoutCustomization)initWithCoder:(id)a3;
- (INWorkoutCustomization)initWithFocus:(id)a3 environment:(id)a4;
- (NSString)description;
- (NSString)environment;
- (NSString)focus;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INWorkoutCustomization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_focus, 0);
}

- (NSString)environment
{
  return self->_environment;
}

- (NSString)focus
{
  return self->_focus;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"focus";
  focus = self->_focus;
  v4 = focus;
  if (!focus)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"environment";
  v10[0] = v4;
  environment = self->_environment;
  v6 = environment;
  if (!environment)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (environment)
  {
    if (focus) {
      goto LABEL_7;
    }
  }
  else
  {

    if (focus) {
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
  v11.super_class = (Class)INWorkoutCustomization;
  v6 = [(INWorkoutCustomization *)&v11 description];
  v7 = [(INWorkoutCustomization *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INWorkoutCustomization *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_focus];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"focus");

  v9 = [v6 encodeObject:self->_environment];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"environment");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  focus = self->_focus;
  id v5 = a3;
  [v5 encodeObject:focus forKey:@"focus"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
}

- (INWorkoutCustomization)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"focus"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"environment"];

  v13 = [(INWorkoutCustomization *)self initWithFocus:v8 environment:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INWorkoutCustomization *)a3;
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
      focus = self->_focus;
      BOOL v8 = 0;
      if (focus == v5->_focus || -[NSString isEqual:](focus, "isEqual:"))
      {
        environment = self->_environment;
        if (environment == v5->_environment || -[NSString isEqual:](environment, "isEqual:")) {
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
  NSUInteger v3 = [(NSString *)self->_focus hash];
  return [(NSString *)self->_environment hash] ^ v3;
}

- (INWorkoutCustomization)initWithFocus:(id)a3 environment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INWorkoutCustomization;
  BOOL v8 = [(INWorkoutCustomization *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    focus = v8->_focus;
    v8->_focus = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    environment = v8->_environment;
    v8->_environment = (NSString *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKeyedSubscript:@"focus"];
    BOOL v8 = [v6 objectForKeyedSubscript:@"environment"];
    uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithFocus:v7 environment:v8];
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