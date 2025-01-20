@interface HDSimpleGraphRelationship
- (BOOL)isEqual:(id)a3;
- (HDSimpleGraphRelationship)init;
- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 subjectID:(int64_t)a4 type:(int64_t)a5 objectID:(int64_t)a6;
- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 subjectID:(int64_t)a4 type:(int64_t)a5 objectID:(int64_t)a6 version:(int64_t)a7 slots:(unint64_t)a8;
- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6;
- (id)description;
- (int64_t)objectID;
- (int64_t)subjectID;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation HDSimpleGraphRelationship

- (HDSimpleGraphRelationship)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The -%@ method is not available on %@", v9, objc_opt_class() format];

  return 0;
}

- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 subjectID:(int64_t)a4 type:(int64_t)a5 objectID:(int64_t)a6 version:(int64_t)a7 slots:(unint64_t)a8
{
  v12.receiver = self;
  v12.super_class = (Class)HDSimpleGraphRelationship;
  result = [(HDSimpleGraphObject *)&v12 initWithRowID:a3 version:a7 slots:a8 deleted:a6 == 204];
  if (result)
  {
    result->_subjectID = a4;
    result->_type = a5;
    result->_objectID = a6;
  }
  return result;
}

- (HDSimpleGraphRelationship)initWithRowID:(int64_t)a3 subjectID:(int64_t)a4 type:(int64_t)a5 objectID:(int64_t)a6
{
  return [(HDSimpleGraphRelationship *)self initWithRowID:a3 subjectID:a4 type:a5 objectID:a6 version:0 slots:0];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HDSimpleGraphRelationship;
  uint64_t v4 = [(HDSimpleGraphObject *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ %lld (%lld) %lld>", v4, self->_subjectID, self->_type, self->_objectID];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  int64_t v4 = [(HDSimpleGraphRelationship *)self type];
  int64_t v5 = v4 ^ [(HDSimpleGraphRelationship *)self subjectID] ^ v3;
  return v5 ^ [(HDSimpleGraphRelationship *)self objectID];
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (HDSimpleGraphRelationship *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      BOOL v6 = self->_type == v5->_type && self->_subjectID == v5->_subjectID && self->_objectID == v5->_objectID;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (int64_t)subjectID
{
  return self->_subjectID;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)objectID
{
  return self->_objectID;
}

@end