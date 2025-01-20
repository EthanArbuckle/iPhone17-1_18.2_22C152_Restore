@interface AMSTreatment
+ (BOOL)supportsSecureCoding;
- (AMSTreatment)initWithCoder:(id)a3;
- (AMSTreatment)initWithEndDate:(id)a3 identifier:(id)a4 startDate:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (int64_t)participationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setParticipationType:(int64_t)a3;
@end

@implementation AMSTreatment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSTreatment *)self endDate];
  [v4 encodeObject:v5 forKey:@"endDate"];

  v6 = [(AMSTreatment *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSTreatment participationType](self, "participationType"), @"participationType");
  id v7 = [(AMSTreatment *)self startDate];
  [v4 encodeObject:v7 forKey:@"startDate"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (AMSTreatment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v8 = [(AMSTreatment *)self initWithEndDate:v5 identifier:v6 startDate:v7];
  if (v8) {
    v8->_participationType = [v4 decodeIntegerForKey:@"participationType"];
  }

  return v8;
}

- (AMSTreatment)initWithEndDate:(id)a3 identifier:(id)a4 startDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSTreatment;
  v12 = [(AMSTreatment *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endDate, a3);
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_participationType = -2;
    objc_storeStrong((id *)&v13->_startDate, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(AMSTreatment *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AMSTreatment *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;

      if (!v7
        || (int64_t v8 = [(AMSTreatment *)self participationType],
            v8 != [(AMSTreatment *)v7 participationType]))
      {
        char v10 = 0;
        goto LABEL_10;
      }
      v6 = [(AMSTreatment *)self identifier];
      id v9 = [(AMSTreatment *)v7 identifier];
      char v10 = [(AMSTreatment *)v6 isEqualToString:v9];
    }
    else
    {
      id v7 = 0;
      char v10 = 0;
    }

LABEL_10:
    goto LABEL_11;
  }
  char v10 = 1;
LABEL_11:

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"endDate";
  unint64_t v3 = [(AMSTreatment *)self endDate];
  v10[0] = v3;
  v9[1] = @"identifier";
  id v4 = [(AMSTreatment *)self identifier];
  v10[1] = v4;
  v9[2] = @"participationType";
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSTreatment participationType](self, "participationType"));
  v10[2] = v5;
  v9[3] = @"startDate";
  v6 = [(AMSTreatment *)self startDate];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (int64_t)participationType
{
  return self->_participationType;
}

- (void)setParticipationType:(int64_t)a3
{
  self->_participationType = a3;
}

@end