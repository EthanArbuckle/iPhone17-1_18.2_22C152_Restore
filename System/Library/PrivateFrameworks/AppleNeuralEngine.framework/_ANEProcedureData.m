@interface _ANEProcedureData
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (id)procedureDataWithSymbol:(id)a3 weightArray:(id)a4;
- (NSArray)weightArray;
- (NSString)procedureSymbol;
- (_ANEProcedureData)init;
- (_ANEProcedureData)initWithCoder:(id)a3;
- (_ANEProcedureData)initWithProcedure:(id)a3 weightArray:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ANEProcedureData

+ (id)procedureDataWithSymbol:(id)a3 weightArray:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithProcedure:v7 weightArray:v6];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(_ANEProcedureData *)self procedureSymbol];
  id v7 = [v3 stringWithFormat:@"%@: { procedureSymbol=%@ }", v5, v6];

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEProcedureData)init
{
  return 0;
}

- (_ANEProcedureData)initWithProcedure:(id)a3 weightArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANEProcedureData;
  v9 = [(_ANEProcedureData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_procedureSymbol, a3);
    objc_storeStrong((id *)&v10->_weightArray, a4);
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
  id v6 = +[_ANELog common];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_ANEProcedureData encodeWithCoder:](a2, self);
  }

  id v7 = [(_ANEProcedureData *)self procedureSymbol];
  [v5 encodeObject:v7 forKey:@"procedureSymbol"];

  id v8 = [(_ANEProcedureData *)self weightArray];
  [v5 encodeObject:v8 forKey:@"weightArray"];
}

- (_ANEProcedureData)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"procedureSymbol"];
  id v7 = +[_ANELog common];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_ANEProcedureData initWithCoder:](a2);
  }

  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v5 decodeObjectOfClasses:v10 forKey:@"weightArray"];
  objc_super v12 = [(_ANEProcedureData *)self initWithProcedure:v6 weightArray:v11];

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

- (NSString)procedureSymbol
{
  return self->_procedureSymbol;
}

- (NSArray)weightArray
{
  return self->_weightArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightArray, 0);
  objc_storeStrong((id *)&self->_procedureSymbol, 0);
}

- (void)encodeWithCoder:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  v3 = NSStringFromSelector(a1);
  v10 = [a2 procedureSymbol];
  OUTLINED_FUNCTION_0_2(&dword_1DB8AB000, v4, v5, "%@: procedureSymbol=%@", v6, v7, v8, v9, 2u);
}

- (void)initWithCoder:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_2(&dword_1DB8AB000, v2, v3, "%@: procedureSymbol=%@", v4, v5, v6, v7, 2u);
}

- (void)copyWithZone:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1DB8AB000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);
}

@end