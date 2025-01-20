@interface _HKSampleIteratorQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKSampleIteratorQueryCursor)queryCursor;
- (_HKSampleIteratorQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setQueryCursor:(id)a3;
@end

@implementation _HKSampleIteratorQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKSampleIteratorQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setQueryCursor:self->_queryCursor];
  [v4 setLimit:self->_limit];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKSampleIteratorQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKSampleIteratorQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryCursor"];
    queryCursor = v5->_queryCursor;
    v5->_queryCursor = (HKSampleIteratorQueryCursor *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKSampleIteratorQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, @"limit", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_queryCursor forKey:@"queryCursor"];
}

- (HKSampleIteratorQueryCursor)queryCursor
{
  return self->_queryCursor;
}

- (void)setQueryCursor:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
}

@end