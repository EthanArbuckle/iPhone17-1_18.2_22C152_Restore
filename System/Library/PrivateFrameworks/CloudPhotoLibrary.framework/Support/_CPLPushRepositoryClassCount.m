@interface _CPLPushRepositoryClassCount
- (id)description;
- (unint64_t)adds;
- (unint64_t)deletes;
- (unint64_t)modifies;
- (unint64_t)trashed;
- (void)setAdds:(unint64_t)a3;
- (void)setDeletes:(unint64_t)a3;
- (void)setModifies:(unint64_t)a3;
- (void)setTrashed:(unint64_t)a3;
@end

@implementation _CPLPushRepositoryClassCount

- (id)description
{
  unint64_t trashed = self->_trashed;
  id v4 = objc_alloc((Class)NSString);
  unint64_t adds = self->_adds;
  if (trashed) {
    id v6 = objc_msgSend(v4, "initWithFormat:", @"+%lu/%lu/-%lu (%lu trashed)", adds, self->_modifies, self->_deletes, self->_trashed);
  }
  else {
    id v6 = objc_msgSend(v4, "initWithFormat:", @"+%lu/%lu/-%lu", adds, self->_modifies, self->_deletes, v8);
  }
  return v6;
}

- (unint64_t)adds
{
  return self->_adds;
}

- (void)setAdds:(unint64_t)a3
{
  self->_unint64_t adds = a3;
}

- (unint64_t)modifies
{
  return self->_modifies;
}

- (void)setModifies:(unint64_t)a3
{
  self->_modifies = a3;
}

- (unint64_t)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(unint64_t)a3
{
  self->_deletes = a3;
}

- (unint64_t)trashed
{
  return self->_trashed;
}

- (void)setTrashed:(unint64_t)a3
{
  self->_unint64_t trashed = a3;
}

@end