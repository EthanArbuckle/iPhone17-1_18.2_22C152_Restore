@interface HDFreezeSeriesOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDFreezeSeriesOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDFreezeSeriesOperation

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v6 = [(objc_class *)self->_entityClass freezeSeriesWithIdentifier:self->_identifier metadata:self->_metadata profile:a3 error:a5];
  frozenIdentifier = self->_frozenIdentifier;
  self->_frozenIdentifier = v6;

  return v6 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDFreezeSeriesOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDFreezeSeriesOperation;
  v5 = [(HDFreezeSeriesOperation *)&v19 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = v5->_identifier;
  v5->_identifier = (NSUUID *)v6;

  v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"metadata"];
  metadata = v5->_metadata;
  v5->_metadata = (NSDictionary *)v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entity_class"];
  v12 = v11;
  if (!v11
    || (NSClassFromString(v11),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        Class entityClass = v5->_entityClass,
        v5->_Class entityClass = (Class)v13,
        entityClass,
        v5->_entityClass))
  {

LABEL_5:
    v15 = v5;
    goto LABEL_6;
  }
  v17 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_fault_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_FAULT, "_entityClass != Nil", v18, 2u);
  }

  v15 = 0;
LABEL_6:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_metadata forKey:@"metadata"];
  NSStringFromClass(self->_entityClass);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"entity_class"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenIdentifier, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end