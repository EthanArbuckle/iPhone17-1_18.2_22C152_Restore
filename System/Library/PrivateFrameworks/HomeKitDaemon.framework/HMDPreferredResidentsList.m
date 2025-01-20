@interface HMDPreferredResidentsList
- (BOOL)isEqual:(id)a3;
- (HMDPreferredResidentsList)initWithResidentIDSIdentifiers:(id)a3 modifiedTimestamp:(id)a4;
- (NSArray)residentIDSIdentifiers;
- (NSDate)modifiedTimestamp;
- (id)description;
- (unint64_t)hash;
@end

@implementation HMDPreferredResidentsList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedTimestamp, 0);
  objc_storeStrong((id *)&self->_residentIDSIdentifiers, 0);
}

- (NSDate)modifiedTimestamp
{
  return self->_modifiedTimestamp;
}

- (NSArray)residentIDSIdentifiers
{
  return self->_residentIDSIdentifiers;
}

- (id)description
{
  v3 = [(HMDPreferredResidentsList *)self residentIDSIdentifiers];
  unint64_t v4 = [v3 count];

  v5 = [(HMDPreferredResidentsList *)self residentIDSIdentifiers];
  v6 = v5;
  if (v4 >= 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v4;
  }
  v8 = objc_msgSend(v5, "subarrayWithRange:", 0, v7);

  v9 = NSString;
  v10 = [(HMDPreferredResidentsList *)self modifiedTimestamp];
  v11 = [v10 localTimeDescription];
  v12 = [v9 stringWithFormat:@"modifiedTimestamp %@ residentIDSIdentifiers (%lu) %@", v11, v4, v8];

  return v12;
}

- (unint64_t)hash
{
  v2 = [(HMDPreferredResidentsList *)self residentIDSIdentifiers];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMDPreferredResidentsList *)self residentIDSIdentifiers];
    v8 = [v6 residentIDSIdentifiers];
    if ([v7 isEqualToArray:v8])
    {
      v9 = [(HMDPreferredResidentsList *)self modifiedTimestamp];
      v10 = [v6 modifiedTimestamp];
      char v11 = [v9 isEqualToDate:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (HMDPreferredResidentsList)initWithResidentIDSIdentifiers:(id)a3 modifiedTimestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDPreferredResidentsList;
  v8 = [(HMDPreferredResidentsList *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    residentIDSIdentifiers = v8->_residentIDSIdentifiers;
    v8->_residentIDSIdentifiers = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_modifiedTimestamp, a4);
  }

  return v8;
}

@end