@interface _ANEModelInstanceParameters
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (id)withProcedureData:(id)a3 procedureArray:(id)a4;
- (NSArray)procedureArray;
- (NSString)instanceName;
- (_ANEModelInstanceParameters)init;
- (_ANEModelInstanceParameters)initWithCoder:(id)a3;
- (_ANEModelInstanceParameters)initWithProcedureData:(id)a3 procedureArray:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ANEModelInstanceParameters

+ (id)withProcedureData:(id)a3 procedureArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithProcedureData:v7 procedureArray:v6];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(_ANEModelInstanceParameters *)self instanceName];
  id v7 = [v3 stringWithFormat:@"%@: { instanceName=%@ }", v5, v6];

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEModelInstanceParameters)init
{
  return 0;
}

- (_ANEModelInstanceParameters)initWithProcedureData:(id)a3 procedureArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANEModelInstanceParameters;
  v9 = [(_ANEModelInstanceParameters *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_instanceName, a3);
    objc_storeStrong((id *)&v10->_procedureArray, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [(_ANEModelInstanceParameters *)self instanceName];
  [v5 encodeObject:v6 forKey:@"instanceName"];

  id v7 = +[_ANELog common];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_ANEModelInstanceParameters encodeWithCoder:](a2, self);
  }

  id v8 = [(_ANEModelInstanceParameters *)self procedureArray];
  [v5 encodeObject:v8 forKey:@"procedureArray"];
}

- (_ANEModelInstanceParameters)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"instanceName"];
  id v7 = +[_ANELog common];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_ANEModelInstanceParameters initWithCoder:](a2);
  }

  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v5 decodeObjectOfClasses:v10 forKey:@"procedureArray"];
  objc_super v12 = [(_ANEModelInstanceParameters *)self initWithProcedureData:v6 procedureArray:v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_ANELog common];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_ANEProcedureData copyWithZone:](a2, v4);
  }

  return 0;
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (NSArray)procedureArray
{
  return self->_procedureArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_procedureArray, 0);
  objc_storeStrong((id *)&self->_instanceName, 0);
}

- (void)encodeWithCoder:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  v3 = NSStringFromSelector(a1);
  v10 = [a2 instanceName];
  OUTLINED_FUNCTION_0_2(&dword_1DB8AB000, v4, v5, "%@: instanceName=%@", v6, v7, v8, v9, 2u);
}

- (void)initWithCoder:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_2(&dword_1DB8AB000, v2, v3, "%@: instanceName=%@", v4, v5, v6, v7, 2u);
}

@end