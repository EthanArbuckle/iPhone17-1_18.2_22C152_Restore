@interface SecCBORNegative
- (SecCBORNegative)initWith:(int64_t)a3;
- (id)getLabel;
- (int)fieldType;
- (int64_t)compare:(id)a3;
- (void)write:(id)a3;
@end

@implementation SecCBORNegative

- (id)getLabel
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->m_data);
}

- (int64_t)compare:(id)a3
{
  int64_t m_data = self->m_data;
  int64_t v4 = *((void *)a3 + 1);
  BOOL v5 = m_data <= v4;
  int64_t v6 = m_data < v4;
  if (v5) {
    return v6;
  }
  else {
    return -1;
  }
}

- (void)write:(id)a3
{
}

- (SecCBORNegative)initWith:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SecCBORNegative;
  result = [(SecCBORNegative *)&v5 init];
  if (result) {
    result->int64_t m_data = a3;
  }
  return result;
}

- (int)fieldType
{
  return 1;
}

@end