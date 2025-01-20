@interface GDPersonEntityTagFeedbackInference
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersonEntityTagFeedbackInference:(id)a3;
- (GDPersonEntityTagFeedbackInference)initWithIDValue:(int64_t)a3 tag:(int64_t)a4;
- (int64_t)idValue;
- (int64_t)tag;
- (unint64_t)hash;
@end

@implementation GDPersonEntityTagFeedbackInference

- (int64_t)idValue
{
  return self->_idValue;
}

- (int64_t)tag
{
  return self->_tag;
}

- (unint64_t)hash
{
  return self->_tag - self->_idValue + 32 * self->_idValue;
}

- (BOOL)isEqualToPersonEntityTagFeedbackInference:(id)a3
{
  v4 = (GDPersonEntityTagFeedbackInference *)a3;
  BOOL v5 = v4 == self || v4 && self->_idValue == v4->_idValue && self->_tag == v4->_tag;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GDPersonEntityTagFeedbackInference *)a3;
  if (v4 == self)
  {
    char isEqualToPersonEntityTagFeedbackInference = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToPersonEntityTagFeedbackInference = objc_msgSend_isEqualToPersonEntityTagFeedbackInference_(self, v5, (uint64_t)v4, v6, v7);
    }
    else {
      char isEqualToPersonEntityTagFeedbackInference = 0;
    }
  }

  return isEqualToPersonEntityTagFeedbackInference;
}

- (GDPersonEntityTagFeedbackInference)initWithIDValue:(int64_t)a3 tag:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GDPersonEntityTagFeedbackInference;
  result = [(GDPersonEntityTagFeedbackInference *)&v7 init];
  if (result)
  {
    result->_tag = a4;
    result->_idValue = a3;
  }
  return result;
}

@end