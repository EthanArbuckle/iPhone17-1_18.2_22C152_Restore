@interface CBORString
- (CBORString)initWith:(id)a3;
- (id)getLabel;
- (int)fieldType;
- (int64_t)compare:(id)a3;
- (void)write:(id)a3;
@end

@implementation CBORString

- (int)fieldType
{
  return 3;
}

- (CBORString)initWith:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBORString;
  v5 = [(CBORString *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [[NSString alloc] initWithString:v4];
    m_data = v5->m_data;
    v5->m_data = (NSString *)v6;
  }
  return v5;
}

- (void)write:(id)a3
{
  m_data = self->m_data;
  id v5 = a3;
  [(CBORValue *)self encodeStartItems:[(NSString *)m_data length] output:v5];
  id v6 = [(NSString *)self->m_data dataUsingEncoding:4];
  objc_msgSend(v5, "appendBytes:length:", objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
}

- (int64_t)compare:(id)a3
{
  id v4 = (id *)a3;
  NSUInteger v5 = [(NSString *)self->m_data length];
  unint64_t v6 = [v4[1] length];
  if (v5 >= v6)
  {
    if (v5 > v6) {
      NSComparisonResult v7 = NSOrderedDescending;
    }
    else {
      NSComparisonResult v7 = [(NSString *)self->m_data compare:v4[1]];
    }
  }
  else
  {
    NSComparisonResult v7 = NSOrderedAscending;
  }

  return v7;
}

- (id)getLabel
{
  return self->m_data;
}

- (void).cxx_destruct
{
}

@end