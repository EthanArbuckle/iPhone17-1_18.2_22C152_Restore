@interface HDSimpleGraphObject
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (HDSimpleGraphObject)init;
- (HDSimpleGraphObject)initWithRowID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6;
- (id)description;
- (int64_t)rowID;
- (int64_t)version;
- (unint64_t)hash;
- (unint64_t)slots;
@end

@implementation HDSimpleGraphObject

- (HDSimpleGraphObject)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSimpleGraphObject)initWithRowID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HDSimpleGraphObject;
  result = [(HDSimpleGraphObject *)&v11 init];
  if (result)
  {
    result->_rowID = a3;
    result->_version = a4;
    result->_slots = a5;
    result->_deleted = a6;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_deleted) {
    v5 = @": deleted";
  }
  else {
    v5 = &stru_1F1728D60;
  }
  return (id)[v3 stringWithFormat:@"%@:%p:%lld:%lld:%llX%@", v4, self, *(_OWORD *)&self->_rowID, self->_slots, v5];
}

- (unint64_t)hash
{
  return self->_rowID ^ [(id)objc_opt_class() hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDSimpleGraphObject *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(HDSimpleGraphObject *)self rowID];
      uint64_t v7 = [(HDSimpleGraphObject *)v5 rowID];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (int64_t)version
{
  return self->_version;
}

- (unint64_t)slots
{
  return self->_slots;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

@end