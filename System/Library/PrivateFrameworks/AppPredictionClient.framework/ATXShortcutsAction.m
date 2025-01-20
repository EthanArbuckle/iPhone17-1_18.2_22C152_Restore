@interface ATXShortcutsAction
+ (BOOL)supportsSecureCoding;
- (ATXActionCriteria)criteria;
- (ATXShortcutsAction)initWithCoder:(id)a3;
- (ATXShortcutsAction)initWithContextualAction:(id)a3 criteria:(id)a4;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAction:(id)a3;
- (CSSearchableItem)searchableItem;
- (WFContextualAction)contextualAction;
- (id)contextualActionGetDirections;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXShortcutsAction

- (id)contextualActionGetDirections
{
  v3 = [(ATXShortcutsAction *)self contextualAction];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(ATXShortcutsAction *)self contextualAction];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ATXShortcutsAction)initWithContextualAction:(id)a3 criteria:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXShortcutsAction;
  v9 = [(ATXShortcutsAction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextualAction, a3);
    if (v8) {
      v11 = (ATXActionCriteria *)v8;
    }
    else {
      v11 = (ATXActionCriteria *)objc_opt_new();
    }
    criteria = v10->_criteria;
    v10->_criteria = v11;
  }
  return v10;
}

- (ATXActionCriteria)criteria
{
  criteria = self->_criteria;
  if (criteria) {
    v3 = criteria;
  }
  else {
    v3 = (ATXActionCriteria *)objc_opt_new();
  }

  return v3;
}

- (CSSearchableItem)searchableItem
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = 0;
  }
  else
  {
    v3 = [(WFContextualAction *)self->_contextualAction spotlightItem];
  }

  return (CSSearchableItem *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  contextualAction = self->_contextualAction;
  id v5 = a3;
  [v5 encodeObject:contextualAction forKey:@"KEY_CONTEXTUALACTION"];
  [v5 encodeObject:self->_criteria forKey:@"KEY_ACTION_CRITERIA"];
}

- (ATXShortcutsAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_default();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"KEY_CONTEXTUALACTION" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXShortcutsAction" errorCode:-1 logHandle:v7];

  v9 = [v4 error];

  v10 = 0;
  if (!v9 && v8)
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_default();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"KEY_ACTION_CRITERIA" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXShortcutsAction" errorCode:-1 logHandle:v13];

    v15 = [v4 error];

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      self = [(ATXShortcutsAction *)self initWithContextualAction:v8 criteria:v14];
      v10 = self;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(WFContextualAction *)self->_contextualAction displayString];
  uint64_t v4 = [v3 hash];

  id v5 = [(WFContextualAction *)self->_contextualAction uniqueIdentifier];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXShortcutsAction *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXShortcutsAction *)self isEqualToAction:v5];

  return v6;
}

- (BOOL)isEqualToAction:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContextualAction *)self->_contextualAction displayString];
  BOOL v6 = [v4 contextualAction];
  id v7 = [v6 displayString];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    v9 = [(WFContextualAction *)self->_contextualAction uniqueIdentifier];
    v10 = [v4 contextualAction];
    id v11 = [v10 uniqueIdentifier];
    char v12 = [v9 isEqual:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualAction, 0);

  objc_storeStrong((id *)&self->_criteria, 0);
}

@end