@interface DKDiagnosticParameters
+ (BOOL)supportsSecureCoding;
+ (id)diagnosticParametersWithDictionary:(id)a3;
- (DKDiagnosticParameters)initWithCoder:(id)a3;
- (DKDiagnosticParameters)initWithDictionary:(id)a3;
- (NSDictionary)parameters;
- (NSDictionary)predicates;
- (NSDictionary)specifications;
- (id)_decoderClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DKDiagnosticParameters

+ (id)diagnosticParametersWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (DKDiagnosticParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKDiagnosticParameters;
  v5 = [(DKDiagnosticParameters *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"predicates"];
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v6 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v5->_predicates, v6);
    v7 = [v4 objectForKeyedSubscript:@"specifications"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v7 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v5->_specifications, v7);
    v8 = [v4 objectForKeyedSubscript:@"parameters"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v8 = (NSDictionary *)MEMORY[0x263EFFA78];
    }
    parameters = v5->_parameters;
    v5->_parameters = v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKDiagnosticParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DKDiagnosticParameters;
  v5 = [(DKDiagnosticParameters *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(DKDiagnosticParameters *)v5 _decoderClasses];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"predicates"];
    predicates = v6->_predicates;
    v6->_predicates = (NSDictionary *)v8;

    v10 = [(DKDiagnosticParameters *)v6 _decoderClasses];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"specifications"];
    specifications = v6->_specifications;
    v6->_specifications = (NSDictionary *)v11;

    v13 = [(DKDiagnosticParameters *)v6 _decoderClasses];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"parameters"];
    parameters = v6->_parameters;
    v6->_parameters = (NSDictionary *)v14;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  predicates = self->_predicates;
  id v5 = a3;
  [v5 encodeObject:predicates forKey:@"predicates"];
  [v5 encodeObject:self->_specifications forKey:@"specifications"];
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
}

- (id)_decoderClasses
{
  if (_decoderClasses_onceToken_0 != -1) {
    dispatch_once(&_decoderClasses_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)_decoderClasses_decoderClasses_0;
  return v2;
}

uint64_t __41__DKDiagnosticParameters__decoderClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  _decoderClasses_decoderClasses_0 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_predicates copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDictionary *)self->_specifications copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSDictionary *)self->_parameters copyWithZone:a3];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (NSDictionary)predicates
{
  return self->_predicates;
}

- (NSDictionary)specifications
{
  return self->_specifications;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_specifications, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
}

@end