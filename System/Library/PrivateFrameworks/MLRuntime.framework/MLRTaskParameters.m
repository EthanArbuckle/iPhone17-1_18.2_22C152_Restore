@interface MLRTaskParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLValueForKey:(id)a3 defaultValue:(BOOL)a4;
- (MLRTaskParameters)initWithCoder:(id)a3;
- (MLRTaskParameters)initWithDESRecipe:(id)a3;
- (MLRTaskParameters)initWithParametersDict:(id)a3;
- (MLRTaskParameters)initWithURL:(id)a3 error:(id *)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)recipeUserInfo;
- (double)doubleValueForKey:(id)a3 defaultValue:(double)a4;
- (float)floatValueForKey:(id)a3 defaultValue:(float)a4;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (id)stringValueForKey:(id)a3 defaultValue:(id)a4;
- (int64_t)integerValueForKey:(id)a3 defaultValue:(int64_t)a4;
- (unint64_t)count;
- (unint64_t)unsignedIntegerValueForKey:(id)a3 defaultValue:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLRTaskParameters

- (MLRTaskParameters)initWithParametersDict:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLRTaskParameters;
  v5 = [(MLRTaskParameters *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    recipeUserInfo = v5->_recipeUserInfo;
    v5->_recipeUserInfo = (NSDictionary *)v6;
  }
  return v5;
}

- (MLRTaskParameters)initWithDESRecipe:(id)a3
{
  if (a3)
  {
    id v4 = [a3 recipeUserInfo];
    self = [(MLRTaskParameters *)self initWithParametersDict:v4];

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MLRTaskParameters)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Nil fileURL" userInfo:0];
    objc_exception_throw(v12);
  }
  v7 = v6;
  v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6 options:8 error:a4];
  if (v8)
  {
    objc_super v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:a4];
    if (v9)
    {
      self = [(MLRTaskParameters *)self initWithParametersDict:v9];
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@(%@)", v5, self->_recipeUserInfo];

  return v6;
}

- (float)floatValueForKey:(id)a3 defaultValue:(float)a4
{
  -[NSDictionary mlr_floatValueForKey:defaultValue:](self->_recipeUserInfo, "mlr_floatValueForKey:defaultValue:", a3);
  return result;
}

- (double)doubleValueForKey:(id)a3 defaultValue:(double)a4
{
  [(NSDictionary *)self->_recipeUserInfo mlr_doubleValueForKey:a3 defaultValue:a4];
  return result;
}

- (BOOL)BOOLValueForKey:(id)a3 defaultValue:(BOOL)a4
{
  return [(NSDictionary *)self->_recipeUserInfo mlr_BOOLValueForKey:a3 defaultValue:a4];
}

- (int64_t)integerValueForKey:(id)a3 defaultValue:(int64_t)a4
{
  return [(NSDictionary *)self->_recipeUserInfo mlr_integerValueForKey:a3 defaultValue:a4];
}

- (unint64_t)unsignedIntegerValueForKey:(id)a3 defaultValue:(unint64_t)a4
{
  return [(NSDictionary *)self->_recipeUserInfo mlr_unsignedIntegerValueForKey:a3 defaultValue:a4];
}

- (id)stringValueForKey:(id)a3 defaultValue:(id)a4
{
  return [(NSDictionary *)self->_recipeUserInfo mlr_stringValueForKey:a3 defaultValue:a4];
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:a3];
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = (void *)[(NSDictionary *)self->_recipeUserInfo copy];

  return (NSDictionary *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MLRTaskParameters)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = [v5 decodeObjectOfClasses:v10 forKey:@"recipeUserInfo"];

  if (v11)
  {
    self = [(MLRTaskParameters *)self initWithParametersDict:v11];
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSDictionary)recipeUserInfo
{
  return self->_recipeUserInfo;
}

- (void).cxx_destruct
{
}

@end