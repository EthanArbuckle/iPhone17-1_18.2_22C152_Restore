@interface LSClaimBinding
+ (BOOL)supportsSecureCoding;
+ (id)_claimBindingsForBindingEvaluator:(const void *)a3 error:(id *)a4;
+ (id)claimBindingsWithConfiguration:(id)a3 error:(id *)a4;
+ (id)claimBindingsWithTypeIdentifier:(id)a3 error:(id *)a4;
+ (id)claimBindingsWithURL:(id)a3 error:(id *)a4;
+ (id)new;
- (LSBundleRecord)bundleRecord;
- (LSClaimBinding)init;
- (LSClaimBinding)initWithCoder:(id)a3;
- (LSClaimBinding)initWithConfiguration:(id)a3 error:(id *)a4;
- (LSClaimBinding)initWithTypeIdentifier:(id)a3 error:(id *)a4;
- (LSClaimBinding)initWithURL:(id)a3 error:(id *)a4;
- (LSClaimRecord)claimRecord;
- (UTTypeRecord)typeRecord;
- (id)_initWithBindingEvaluator:(const void *)a3 error:(id *)a4;
- (id)_initWithClaimRecord:(id)a3 typeRecord:(id)a4 bundleRecord:(id)a5;
- (id)_initWithContext:(LSContext *)a3 binding:(const LSBinding *)a4 coreTypesBundleRecord:(id *)a5 typeRecord:(id)a6 error:(id *)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)detach;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSClaimBinding

+ (id)new
{
}

- (LSClaimBinding)init
{
}

- (LSClaimBinding)initWithTypeIdentifier:(id)a3 error:(id *)a4
{
  v8[21] = *MEMORY[0x1E4F143B8];
  LaunchServices::BindingEvaluator::CreateWithUTI((LaunchServices::BindingEvaluator *)a3, 0, (LaunchServices::BindingEvaluator *)v8);
  v6 = [(LSClaimBinding *)self _initWithBindingEvaluator:v8 error:a4];
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithTypeIdentifier:(id)a3 error:(id *)a4
{
  v8[21] = *MEMORY[0x1E4F143B8];
  LaunchServices::BindingEvaluator::CreateWithUTI((LaunchServices::BindingEvaluator *)a3, 0, (LaunchServices::BindingEvaluator *)v8);
  v6 = [a1 _claimBindingsForBindingEvaluator:v8 error:a4];
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);

  return v6;
}

- (LSClaimBinding)initWithURL:(id)a3 error:(id *)a4
{
  v8[21] = *(FSNode **)MEMORY[0x1E4F143B8];
  LaunchServices::BindingEvaluator::CreateWithURL((LaunchServices::BindingEvaluator *)a3, v8);
  v6 = [(LSClaimBinding *)self _initWithBindingEvaluator:v8 error:a4];
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithURL:(id)a3 error:(id *)a4
{
  v8[21] = *(FSNode **)MEMORY[0x1E4F143B8];
  LaunchServices::BindingEvaluator::CreateWithURL((LaunchServices::BindingEvaluator *)a3, v8);
  v6 = [a1 _claimBindingsForBindingEvaluator:v8 error:a4];
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);

  return v6;
}

- (id)_initWithClaimRecord:(id)a3 typeRecord:(id)a4 bundleRecord:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)LSClaimBinding;
  v8 = [(LSClaimBinding *)&v11 init];
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_claimRecord, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  return p_isa;
}

- (id)_initWithContext:(LSContext *)a3 binding:(const LSBinding *)a4 coreTypesBundleRecord:(id *)a5 typeRecord:(id)a6 error:(id *)a7
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_22:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LSClaimRecord.mm", 239, @"Invalid parameter not satisfying: %@", @"binding != NULL" object file lineNumber description];

    if (!self) {
      goto LABEL_23;
    }
    goto LABEL_4;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"LSClaimRecord.mm", 238, @"Invalid parameter not satisfying: %@", @"ctx != NULL" object file lineNumber description];

  if (!a4) {
    goto LABEL_22;
  }
LABEL_3:
  if (!self)
  {
LABEL_23:

    if (a7)
    {
      uint64_t v30 = *MEMORY[0x1E4F28228];
      v31[0] = @"The claim record was bound to an unknown bundle record.";
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10817, (uint64_t)"-[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:]", 279, v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = 0;
    id v15 = 0;
    goto LABEL_26;
  }
LABEL_4:
  bundleData = a4->bundleData;
  if (!bundleData) {
    goto LABEL_23;
  }
  if (bundleData->_clas == 11)
  {
    id v15 = *a5;
    if (v15) {
      goto LABEL_12;
    }
    v16 = +[LSBundleRecord coreTypesBundleRecord];
    objc_storeStrong(a5, v16);
  }
  else
  {
    v17 = (objc_class *)objc_opt_class();
    if (a4->bundleData->_clas == 2) {
      v17 = (objc_class *)objc_opt_class();
    }
    v16 = (void *)[[v17 alloc] _initWithNode:0 bundleIdentifier:0 context:a3 tableID:a3->db->schema.bundleTable unitID:a4->bundle bundleBaseData:a4->bundleData error:a7];
  }
  id v15 = v16;
  if (!v16)
  {

LABEL_20:
    v20 = 0;
LABEL_26:
    id v21 = 0;
    goto LABEL_27;
  }
LABEL_12:
  if (!a4->claimData)
  {
    v20 = 0;
    goto LABEL_16;
  }
  v18 = [(LSRecord *)[LSClaimRecord alloc] _initWithContext:a3 tableID:a3->db->schema.claimTable unitID:a4->claim];
  v19 = v18;
  if (!v18)
  {

    if (a7)
    {
      uint64_t v28 = *MEMORY[0x1E4F28228];
      v29 = @"Unable to find this claim record in the Launch Services database.";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10810, (uint64_t)"-[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:]", 292, v22);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_20;
  }
  objc_storeWeak(v18 + 4, v15);
  v20 = v19;
LABEL_16:
  id v21 = [(LSClaimBinding *)self _initWithClaimRecord:v20 typeRecord:a6 bundleRecord:v15];
LABEL_27:
  id v26 = v21;

  return v26;
}

+ (id)_claimBindingsForBindingEvaluator:(const void *)a3 error:(id *)a4
{
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)a1);
  id v26 = 0;
  char v27 = 0;
  id v28 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v7 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v6, 0);

  if (v7)
  {
    v23 = 0;
    id v24 = 0;
    LaunchServices::BindingEvaluator::evaluateBindings((LaunchServices::BindingEvaluator *)a3, v7, &v23, a4, &v21);
    if (v21 == v22)
    {
      v13 = 0;
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = v21;
      for (uint64_t i = v22; v9 != i; v9 += 48)
      {
        objc_super v11 = [LSClaimBinding alloc];
        id v12 = [(LSClaimBinding *)v11 _initWithContext:v7 binding:v9 coreTypesBundleRecord:&v24 typeRecord:v23 error:0];
        if (v12) {
          [v8 addObject:v12];
        }
      }
      v13 = (void *)[v8 copy];
    }
    v29 = (void **)&v21;
    std::vector<LSBinding>::__destroy_vector::operator()[abi:nn180100](&v29);
  }
  else if (a4)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v14, 0);

    if (v15) {
      id v16 = 0;
    }
    else {
      id v16 = v28;
    }
    v13 = 0;
    *a4 = v16;
  }
  else
  {
    v13 = 0;
  }
  id v17 = v13;
  if (CurrentContext && v27) {
    _LSContextDestroy(CurrentContext);
  }
  id v18 = v26;
  CurrentContext = 0;
  id v26 = 0;

  char v27 = 0;
  id v19 = v28;
  id v28 = 0;

  return v17;
}

- (id)_initWithBindingEvaluator:(const void *)a3 error:(id *)a4
{
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v22 = 0;
  char v23 = 0;
  id v24 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v8 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v7, 0);

  if (v8)
  {
    id v19 = 0;
    id v20 = 0;
    LaunchServices::BindingEvaluator::getBestBinding(v17, (LaunchServices::BindingEvaluator *)a3, v8, &v19, a4);
    if (v18)
    {
      id v9 = [(LSClaimBinding *)self _initWithContext:v8 binding:v17 coreTypesBundleRecord:&v20 typeRecord:v19 error:a4];
    }
    else
    {

      id v9 = 0;
    }
    if (v18)
    {
    }
  }
  else
  {

    if (a4)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v10, 0);

      if (v11) {
        id v12 = 0;
      }
      else {
        id v12 = v24;
      }
      id v9 = 0;
      *a4 = v12;
    }
    else
    {
      id v9 = 0;
    }
  }
  id v13 = v9;
  if (CurrentContext && v23) {
    _LSContextDestroy(CurrentContext);
  }
  id v14 = v22;
  CurrentContext = 0;
  id v22 = 0;

  char v23 = 0;
  id v15 = v24;
  id v24 = 0;

  return v13;
}

- (void)detach
{
  [(LSRecord *)self->_claimRecord detach];
  [(LSRecord *)self->_typeRecord detach];
  bundleRecord = self->_bundleRecord;

  [(LSRecord *)bundleRecord detach];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_claimRecord forKey:@"claimRecord"];
  [a3 encodeObject:self->_typeRecord forKey:@"typeRecord"];
  bundleRecord = self->_bundleRecord;

  [a3 encodeObject:bundleRecord forKey:@"bundleRecord"];
}

- (LSClaimBinding)initWithCoder:(id)a3
{
  v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"claimRecord");
  v6 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"typeRecord");
  v7 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleRecord");
  id v8 = [(LSClaimBinding *)self _initWithClaimRecord:v5 typeRecord:v6 bundleRecord:v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[LSClaimRecord copyWithZone:](self->_claimRecord, "copyWithZone:");
  id v6 = [(LSRecord *)self->_typeRecord copyWithZone:a3];
  id v7 = [(LSBundleRecord *)self->_bundleRecord copyWithZone:a3];
  id v8 = [+[LSClaimBinding allocWithZone:a3] _initWithClaimRecord:v5 typeRecord:v6 bundleRecord:v7];

  return v8;
}

- (LSClaimRecord)claimRecord
{
  return (LSClaimRecord *)objc_getProperty(self, a2, 8, 1);
}

- (UTTypeRecord)typeRecord
{
  return (UTTypeRecord *)objc_getProperty(self, a2, 16, 1);
}

- (LSBundleRecord)bundleRecord
{
  return (LSBundleRecord *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleRecord, 0);
  objc_storeStrong((id *)&self->_typeRecord, 0);

  objc_storeStrong((id *)&self->_claimRecord, 0);
}

- (LSClaimBinding)initWithConfiguration:(id)a3 error:(id *)a4
{
  v8[21] = *MEMORY[0x1E4F143B8];
  CreateBindingEvaluatorWithConfiguration((LSClaimBindingConfiguration *)a3, (LaunchServices::BindingEvaluator *)v8);
  id v6 = [(LSClaimBinding *)self _initWithBindingEvaluator:v8 error:a4];
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithConfiguration:(id)a3 error:(id *)a4
{
  v8[21] = *MEMORY[0x1E4F143B8];
  CreateBindingEvaluatorWithConfiguration((LSClaimBindingConfiguration *)a3, (LaunchServices::BindingEvaluator *)v8);
  id v6 = [a1 _claimBindingsForBindingEvaluator:v8 error:a4];
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);

  return v6;
}

@end