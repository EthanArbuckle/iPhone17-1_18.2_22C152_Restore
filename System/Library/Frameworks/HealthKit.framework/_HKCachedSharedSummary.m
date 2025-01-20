@interface _HKCachedSharedSummary
- (BOOL)isEqual:(id)a3;
- (HKSharedSummary)summary;
- (_HKCachedSharedSummary)initWithSummary:(id)a3;
- (unint64_t)hash;
@end

@implementation _HKCachedSharedSummary

- (_HKCachedSharedSummary)initWithSummary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKCachedSharedSummary;
  v6 = [(_HKCachedSharedSummary *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_summary, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(HKSharedSummary *)self->_summary package];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKSharedSummary *)self->_summary name];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(HKSharedSummary *)self->_summary UUID];
    unint64_t v6 = [v4 summary];
    v7 = [v6 UUID];
    if ([v5 isEqual:v7])
    {
      char v8 = 1;
    }
    else
    {
      objc_super v9 = [(HKSharedSummary *)self->_summary name];
      v10 = [v4 summary];
      v11 = [v10 name];
      if ([v9 isEqualToString:v11])
      {
        v12 = [(HKSharedSummary *)self->_summary package];
        v13 = [v4 summary];
        [v13 package];
        v14 = v16 = v9;
        char v8 = [v12 isEqualToString:v14];

        objc_super v9 = v16;
      }
      else
      {
        char v8 = 0;
      }
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (HKSharedSummary)summary
{
  return self->_summary;
}

- (void).cxx_destruct
{
}

@end