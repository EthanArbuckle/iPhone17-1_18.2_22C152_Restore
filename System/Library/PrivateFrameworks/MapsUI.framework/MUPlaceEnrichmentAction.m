@interface MUPlaceEnrichmentAction
- (BOOL)isEqual:(id)a3;
- (MUPlaceEnrichmentAction)initWithActionType:(unint64_t)a3 isValidated:(BOOL)a4 mkActionType:(unint64_t)a5;
- (MUPlaceEnrichmentAction)initWithActionType:(unint64_t)a3 isValidated:(BOOL)a4 mkActionType:(unint64_t)a5 metadata:(id)a6;
- (NSDictionary)enrichmentAction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)actionType;
- (unint64_t)mkActionType;
@end

@implementation MUPlaceEnrichmentAction

- (MUPlaceEnrichmentAction)initWithActionType:(unint64_t)a3 isValidated:(BOOL)a4 mkActionType:(unint64_t)a5
{
  BOOL v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceEnrichmentAction;
  result = [(MUPlaceEnrichmentAction *)&v9 init];
  if (result) {
    return [(MUPlaceEnrichmentAction *)result initWithActionType:a3 isValidated:v6 mkActionType:a5 metadata:0];
  }
  return result;
}

- (MUPlaceEnrichmentAction)initWithActionType:(unint64_t)a3 isValidated:(BOOL)a4 mkActionType:(unint64_t)a5 metadata:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MUPlaceEnrichmentAction;
  v10 = [(MUPlaceEnrichmentAction *)&v28 init];
  if (!v10) {
    goto LABEL_17;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"actionType", @"isValidated", 0);
  id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (a3 - 1 > 0xD) {
    v13 = @"Unknown";
  }
  else {
    v13 = off_1E574F790[a3 - 1];
  }
  v14 = NSStringFromBOOL();
  v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, 0);

  if (a3 != 12)
  {
    if (a3 != 13 || !v9) {
      goto LABEL_12;
    }
    v17 = @"subActions";
    goto LABEL_11;
  }
  v16 = [v9 objectForKeyedSubscript:@"appCategory"];

  if (v16)
  {
    v17 = @"appCategory";
LABEL_11:
    [v11 addObject:v17];
    v18 = [v9 objectForKeyedSubscript:v17];
    [v15 addObject:v18];
  }
LABEL_12:
  v10->_actionType = a3;
  v19 = (void *)MEMORY[0x1E4F1C9E8];
  v20 = (void *)[v15 copy];
  v21 = (void *)[v11 copy];
  uint64_t v22 = [v19 dictionaryWithObjects:v20 forKeys:v21];
  enrichmentAction = v10->_enrichmentAction;
  v10->_enrichmentAction = (NSDictionary *)v22;

  v10->_mkActionType = a5;
  if (qword_1EB4F7128 != -1) {
    dispatch_once(&qword_1EB4F7128, &__block_literal_global_11);
  }
  v24 = (void *)_MergedGlobals_118;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_118, OS_LOG_TYPE_DEBUG))
  {
    v25 = v24;
    v26 = [(MUPlaceEnrichmentAction *)v10 description];
    *(_DWORD *)buf = 138412290;
    v30 = v26;
    _os_log_impl(&dword_1931EA000, v25, OS_LOG_TYPE_DEBUG, "Initialized action: %@", buf, 0xCu);
  }
LABEL_17:

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(MUPlaceEnrichmentAction *)self enrichmentAction];
  v5 = (void *)v4;
  unint64_t v6 = self->_actionType - 1;
  if (v6 > 0xD) {
    v7 = @"Unknown";
  }
  else {
    v7 = off_1E574F790[v6];
  }
  v8 = [v3 stringWithFormat:@"%@, Type: %@", v4, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong(v4 + 1, v5->_enrichmentAction);
  objc_sync_exit(v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MUPlaceEnrichmentAction *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    uint64_t v7 = [(MUPlaceEnrichmentAction *)v6 actionType];
    if (v7 == [(MUPlaceEnrichmentAction *)self actionType])
    {
      v8 = [(MUPlaceEnrichmentAction *)v6 enrichmentAction];
      id v9 = [(MUPlaceEnrichmentAction *)self enrichmentAction];
      char v10 = [v8 isEqualToDictionary:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSDictionary)enrichmentAction
{
  return self->_enrichmentAction;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (unint64_t)mkActionType
{
  return self->_mkActionType;
}

- (void).cxx_destruct
{
}

@end