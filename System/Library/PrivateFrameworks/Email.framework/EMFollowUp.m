@interface EMFollowUp
+ (BOOL)supportsSecureCoding;
- (BOOL)containsDate:(id)a3;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (EFPair)pair;
- (EMFollowUp)initWithCoder:(id)a3;
- (EMFollowUp)initWithStartDate:(id)a3 endDate:(id)a4 jsonStringForModelEvaluationForSuggestions:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (NSString)ef_publicDescription;
- (NSString)jsonStringForModelEvaluationForSuggestions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMFollowUp

- (EMFollowUp)initWithStartDate:(id)a3 endDate:(id)a4 jsonStringForModelEvaluationForSuggestions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EMFollowUp;
  v11 = [(EMFollowUp *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F60DF0] pairWithFirst:v8 second:v9];
    pair = v11->_pair;
    v11->_pair = (EFPair *)v12;

    objc_storeStrong((id *)&v11->_jsonStringForModelEvaluationForSuggestions, a5);
  }

  return v11;
}

- (NSString)description
{
  v2 = [(EMFollowUp *)self pair];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSDate)startDate
{
  v2 = [(EMFollowUp *)self pair];
  v3 = [v2 first];

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  v2 = [(EMFollowUp *)self pair];
  v3 = [v2 second];

  return (NSDate *)v3;
}

- (BOOL)isActive
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(self) = [(EMFollowUp *)self containsDate:v3];

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EMFollowUp *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(EMFollowUp *)self pair];
      v6 = [(EMFollowUp *)v4 pair];
      char v7 = [v5 isEqualToPair:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(EMFollowUp *)self pair];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)ef_publicDescription
{
  unint64_t v3 = NSString;
  v4 = [(EMFollowUp *)self startDate];
  v5 = [(EMFollowUp *)self endDate];
  v6 = [v3 stringWithFormat:@"startDate:%@, endDate:%@, isActive:%d", v4, v5, -[EMFollowUp isActive](self, "isActive")];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMFollowUp)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_startDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_endDate"];
  char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_jsonStringForModelEvaluationForSuggestions"];
  id v8 = [(EMFollowUp *)self initWithStartDate:v5 endDate:v6 jsonStringForModelEvaluationForSuggestions:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(EMFollowUp *)self startDate];
  [v7 encodeObject:v4 forKey:@"EFPropertyKey_startDate"];

  v5 = [(EMFollowUp *)self endDate];
  [v7 encodeObject:v5 forKey:@"EFPropertyKey_endDate"];

  v6 = [(EMFollowUp *)self jsonStringForModelEvaluationForSuggestions];
  [v7 encodeObject:v6 forKey:@"EFPropertyKey_jsonStringForModelEvaluationForSuggestions"];
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(EMFollowUp *)self startDate];
    if (objc_msgSend(v5, "ef_isEarlierThanOrEqualDate:", v4))
    {
      v6 = [(EMFollowUp *)self endDate];
      int v7 = objc_msgSend(v6, "ef_isEarlierThanOrEqualDate:", v4) ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (NSString)jsonStringForModelEvaluationForSuggestions
{
  return self->_jsonStringForModelEvaluationForSuggestions;
}

- (EFPair)pair
{
  return self->_pair;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pair, 0);
  objc_storeStrong((id *)&self->_jsonStringForModelEvaluationForSuggestions, 0);
}

@end