@interface CPLLibraryState
+ (BOOL)supportsSecureCoding;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (CPLLibraryState)initWithCoder:(id)a3;
- (NSDate)deleteDate;
- (NSDate)disabledDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeleteDate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabledDate:(id)a3;
@end

@implementation CPLLibraryState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteDate, 0);
  objc_storeStrong((id *)&self->_disabledDate, 0);
}

- (void)setDeleteDate:(id)a3
{
}

- (NSDate)deleteDate
{
  return self->_deleteDate;
}

- (void)setDisabledDate:(id)a3
{
}

- (NSDate)disabledDate
{
  return self->_disabledDate;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (id)description
{
  if (!self->_disabled)
  {
    v6 = @"[enabled]";
    goto LABEL_9;
  }
  id v3 = [NSString alloc];
  disabledDate = self->_disabledDate;
  if (disabledDate)
  {
    v5 = +[CPLDateFormatter stringFromDate:self->_disabledDate];
  }
  else
  {
    v5 = @"<no disabled date";
  }
  if (self->_deleteDate)
  {
    v7 = +[CPLDateFormatter stringFromDate:](CPLDateFormatter, "stringFromDate:");
    v6 = (__CFString *)[v3 initWithFormat:@"[disabled %@ %@]", v5, v7];

    if (!disabledDate) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v6 = (__CFString *)[v3 initWithFormat:@"[disabled %@ %@]", v5, @"<no delete date>"];
  if (disabledDate) {
LABEL_8:
  }

LABEL_9:
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_disabledDate hash];
  return [(NSDate *)self->_deleteDate hash] ^ v3 ^ self->_disabled;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLLibraryState *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_disabled != v4->_disabled) {
    goto LABEL_7;
  }
  unint64_t v5 = self->_disabledDate;
  v6 = (void *)v5;
  disabledDate = v4->_disabledDate;
  if (v5 && disabledDate)
  {
    char v8 = objc_msgSend((id)v5, "isEqual:");

    if ((v8 & 1) == 0)
    {
LABEL_7:
      BOOL v9 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v11 = v5 | (unint64_t)disabledDate;

    if (v11) {
      goto LABEL_7;
    }
  }
  unint64_t v12 = self->_deleteDate;
  v13 = v4->_deleteDate;
  unint64_t v14 = (unint64_t)v13;
  BOOL v9 = v12 && v13 && ([(id)v12 isEqual:v13] & 1) != 0 || (v12 | v14) == 0;

LABEL_9:
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CPLLibraryState);
  v4->_disabled = self->_disabled;
  uint64_t v5 = [(NSDate *)self->_disabledDate copy];
  disabledDate = v4->_disabledDate;
  v4->_disabledDate = (NSDate *)v5;

  uint64_t v7 = [(NSDate *)self->_deleteDate copy];
  deleteDate = v4->_deleteDate;
  v4->_deleteDate = (NSDate *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL disabled = self->_disabled;
  id v5 = a3;
  [v5 encodeBool:disabled forKey:@"dis"];
  [v5 encodeObject:self->_disabledDate forKey:@"disDate"];
  [v5 encodeObject:self->_deleteDate forKey:@"delDate"];
}

- (CPLLibraryState)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLLibraryState;
  id v5 = [(CPLLibraryState *)&v11 init];
  if (v5)
  {
    v5->_BOOL disabled = [v4 decodeBoolForKey:@"dis"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disDate"];
    disabledDate = v5->_disabledDate;
    v5->_disabledDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delDate"];
    deleteDate = v5->_deleteDate;
    v5->_deleteDate = (NSDate *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end