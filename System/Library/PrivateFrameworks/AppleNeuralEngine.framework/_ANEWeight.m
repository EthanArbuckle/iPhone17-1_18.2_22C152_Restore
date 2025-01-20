@interface _ANEWeight
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (id)weightWithSymbolAndURL:(id)a3 weightURL:(id)a4;
+ (id)weightWithSymbolAndURLSHA:(id)a3 weightURL:(id)a4 SHACode:(id)a5;
- (NSData)SHACode;
- (NSString)sandboxExtension;
- (NSString)weightSymbol;
- (NSURL)weightURL;
- (_ANEWeight)init;
- (_ANEWeight)initWithCoder:(id)a3;
- (_ANEWeight)initWithWeightSymbolAndURL:(id)a3 weightURL:(id)a4;
- (_ANEWeight)initWithWeightSymbolAndURLSHA:(id)a3 weightURL:(id)a4 SHACode:(id)a5 sandboxExtension:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSandboxExtension:(id)a3;
@end

@implementation _ANEWeight

+ (id)weightWithSymbolAndURL:(id)a3 weightURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithWeightSymbolAndURL:v7 weightURL:v6];

  return v8;
}

+ (id)weightWithSymbolAndURLSHA:(id)a3 weightURL:(id)a4 SHACode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithWeightSymbolAndURLSHA:v10 weightURL:v9 SHACode:v8 sandboxExtension:0];

  return v11;
}

+ (id)new
{
  return 0;
}

- (_ANEWeight)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(_ANEWeight *)self weightSymbol];
  id v7 = [(_ANEWeight *)self weightURL];
  id v8 = [(_ANEWeight *)self SHACode];
  id v9 = [(_ANEWeight *)self sandboxExtension];
  id v10 = [v3 stringWithFormat:@"%@: { weightSymbol=%@ : weightURL=%@ : SHACode=%@ : sandboxExtension=%@} ", v5, v6, v7, v8, v9];

  return v10;
}

- (_ANEWeight)initWithWeightSymbolAndURL:(id)a3 weightURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANEWeight;
  id v9 = [(_ANEWeight *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_weightURL, a4);
    objc_storeStrong((id *)&v10->_weightSymbol, a3);
  }

  return v10;
}

- (_ANEWeight)initWithWeightSymbolAndURLSHA:(id)a3 weightURL:(id)a4 SHACode:(id)a5 sandboxExtension:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_ANEWeight;
  v15 = [(_ANEWeight *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_weightURL, a4);
    objc_storeStrong((id *)&v16->_weightSymbol, a3);
    objc_storeStrong((id *)&v16->_SHACode, a5);
    objc_storeStrong((id *)&v16->_sandboxExtension, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_ANEWeight *)self weightURL];
  [v4 encodeObject:v5 forKey:@"url"];

  id v6 = [(_ANEWeight *)self weightSymbol];
  [v4 encodeObject:v6 forKey:@"weightSymbol"];

  id v7 = [(_ANEWeight *)self SHACode];
  [v4 encodeObject:v7 forKey:@"SHACode"];

  id v8 = [(_ANEWeight *)self sandboxExtension];
  [v4 encodeObject:v8 forKey:@"sandboxExtension"];
}

- (_ANEWeight)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weightSymbol"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHACode"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtension"];

  id v9 = [(_ANEWeight *)self initWithWeightSymbolAndURLSHA:v6 weightURL:v5 SHACode:v7 sandboxExtension:v8];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_ANELog common];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[_ANEProcedureData copyWithZone:](a2, v4);
  }

  return 0;
}

- (NSString)weightSymbol
{
  return self->_weightSymbol;
}

- (NSURL)weightURL
{
  return self->_weightURL;
}

- (NSData)SHACode
{
  return self->_SHACode;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void)setSandboxExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_SHACode, 0);
  objc_storeStrong((id *)&self->_weightURL, 0);
  objc_storeStrong((id *)&self->_weightSymbol, 0);
}

@end