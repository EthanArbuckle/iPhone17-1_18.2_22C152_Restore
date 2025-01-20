@interface CTPendingPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTPendingPlan)initWithCoder:(id)a3;
- (CTPendingPlan)initWithSmdpURL:(id)a3 matchingID:(id)a4;
- (NSString)matchingID;
- (NSString)smdpURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTPendingPlan

- (CTPendingPlan)initWithSmdpURL:(id)a3 matchingID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTPendingPlan;
  v9 = [(CTPendingPlan *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_smdpURL, a3);
    objc_storeStrong((id *)&v10->_matchingID, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", smdpURL=%@", self->_smdpURL];
  if (self->_matchingID) {
    [v3 appendFormat:@", matchingID=%@", self->_matchingID];
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTPendingPlan;
  if ([(CTPlan *)&v15 isEqual:v6])
  {
    id v7 = [(CTPendingPlan *)self smdpURL];
    id v8 = [v6 smdpURL];
    if (v7 == v8
      || ([(CTPendingPlan *)self smdpURL],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 smdpURL],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v10 = [(CTPendingPlan *)self matchingID];
      v11 = [v6 matchingID];
      if (v10 == v11)
      {
        char v9 = 1;
      }
      else
      {
        objc_super v12 = [(CTPendingPlan *)self matchingID];
        v13 = [v6 matchingID];
        char v9 = [v12 isEqual:v13];
      }
      if (v7 == v8) {
        goto LABEL_11;
      }
    }
    else
    {
      char v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  char v9 = 0;
LABEL_12:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = (void *)[(NSString *)self->_smdpURL copyWithZone:a3];
  id v7 = (void *)[(NSString *)self->_matchingID copyWithZone:a3];
  id v8 = (void *)[v5 initWithSmdpURL:v6 matchingID:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPendingPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPendingPlan;
  v5 = [(CTPlan *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smdpURL"];
    smdpURL = v5->_smdpURL;
    v5->_smdpURL = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchingID"];
    matchingID = v5->_matchingID;
    v5->_matchingID = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CTPendingPlan;
  [(CTPlan *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_smdpURL forKey:@"smdpURL"];
  matchingID = self->_matchingID;
  if (matchingID) {
    [v4 encodeObject:matchingID forKey:@"matchingID"];
  }
}

- (NSString)smdpURL
{
  return self->_smdpURL;
}

- (NSString)matchingID
{
  return self->_matchingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingID, 0);

  objc_storeStrong((id *)&self->_smdpURL, 0);
}

@end