@interface _PFChangeInfo
- (BOOL)isEqual:(id)a3;
- (NSManagedObject)object;
- (_PFChangeInfo)initWithObject:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _PFChangeInfo

- (void)dealloc
{
  self->_startIndexPath = 0;
  self->_finalIndexPath = 0;

  self->_startSectionInfo = 0;
  self->_finalSectionInfo = 0;

  self->_object = 0;
  v3.receiver = self;
  v3.super_class = (Class)_PFChangeInfo;
  [(_PFChangeInfo *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(NSManagedObject *)[(_PFChangeInfo *)self object] objectID];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "object"), "objectID");

  return [(NSManagedObjectID *)v5 isEqual:v6];
}

- (unint64_t)hash
{
  v2 = [(NSManagedObject *)[(_PFChangeInfo *)self object] objectID];

  return [(NSManagedObjectID *)v2 hash];
}

- (NSManagedObject)object
{
  return self->_object;
}

- (_PFChangeInfo)initWithObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_PFChangeInfo;
  v4 = [(_PFChangeInfo *)&v6 init];
  if (v4)
  {
    v4->_object = (NSManagedObject *)a3;
    v4->_changeType = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

- (id)description
{
  unint64_t v3 = self->_changeType - 1;
  if (v3 > 3) {
    v4 = @"Unset";
  }
  else {
    v4 = off_1E544FCF0[v3];
  }
  v5 = NSString;
  objc_super v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  object = self->_object;
  if (self->_startIndexPath) {
    v9 = (__CFString *)[NSString stringWithFormat:@", startIndex: %@", self->_startIndexPath];
  }
  else {
    v9 = &stru_1ED787880;
  }
  if (self->_finalIndexPath) {
    v10 = (__CFString *)[NSString stringWithFormat:@", finalIndex: %@", self->_finalIndexPath];
  }
  else {
    v10 = &stru_1ED787880;
  }
  return (id)[v5 stringWithFormat:@"<%@: %p> { object: %p, type: %@%@%@ }", v7, self, object, v4, v9, v10];
}

@end