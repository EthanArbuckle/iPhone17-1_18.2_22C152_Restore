@interface _FPLocationAgnosticID
- (BOOL)isEqual:(id)a3;
- (_FPLocationAgnosticID)initWithItem:(id)a3;
- (_FPLocationAgnosticID)initWithItemID:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _FPLocationAgnosticID

- (_FPLocationAgnosticID)initWithItemID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FPLocationAgnosticID;
  v6 = [(_FPLocationAgnosticID *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemID, a3);
  }

  return v7;
}

- (_FPLocationAgnosticID)initWithItem:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_FPLocationAgnosticID;
  id v5 = [(_FPLocationAgnosticID *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 itemID];
    itemID = v5->_itemID;
    v5->_itemID = (FPItemID *)v6;

    uint64_t v8 = [v4 formerItemID];
    alternateID = v5->_alternateID;
    v5->_alternateID = (FPItemID *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_FPLocationAgnosticID *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  if (v4 == self)
  {
LABEL_5:
    BOOL v6 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(FPItemID *)self->_itemID isEqual:v5])
    {
      BOOL v6 = [(FPItemID *)self->_alternateID isEqual:v5];
      goto LABEL_13;
    }
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_12:
    BOOL v6 = 0;
    goto LABEL_13;
  }
  v7 = v5;
  BOOL v6 = [(FPItemID *)self->_itemID isEqual:v7->_itemID]
    || [(FPItemID *)self->_itemID isEqual:v7->_alternateID]
    || [(FPItemID *)self->_alternateID isEqual:v7->_itemID]
    || [(FPItemID *)self->_alternateID isEqual:v7->_alternateID];

LABEL_13:
  return v6;
}

- (unint64_t)hash
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"This object is not hashable"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_fault_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[_FPLocationAgnosticID hash]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/fileproviderd/action operation engine/FPActionOperationLocator.m", 365, (const char *)[v2 UTF8String]);
}

- (id)description
{
  alternateID = self->_alternateID;
  if (alternateID) {
    [NSString stringWithFormat:@"%@ alt:%@", self->_itemID, alternateID];
  }
  else {
  v3 = [(FPItemID *)self->_itemID description];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateID, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

@end