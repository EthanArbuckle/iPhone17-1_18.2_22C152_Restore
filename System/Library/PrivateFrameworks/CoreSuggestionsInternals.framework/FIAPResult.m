@interface FIAPResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithHistoricalDataRequests:(id)a3 error:(id)a4;
+ (id)success;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResult:(id)a3;
- (FIAPResult)init;
- (FIAPResult)initWithCoder:(id)a3;
- (FIAPResult)initWithHistoricalDataRequests:(id)a3 error:(id)a4;
- (NSArray)historicalDataRequests;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FIAPResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_historicalDataRequests, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)historicalDataRequests
{
  return self->_historicalDataRequests;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  historicalDataRequests = self->_historicalDataRequests;
  v7 = (NSArray *)*((id *)v4 + 1);
  if (historicalDataRequests == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = historicalDataRequests;
    char v10 = [(NSArray *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_error;
  v13 = v12;
  if (v12 == (NSError *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSError isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FIAPResult *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(FIAPResult *)self isEqualToResult:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc((Class)objc_opt_class());
  if (v5)
  {
    uint64_t v6 = [(NSArray *)self->_historicalDataRequests copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSError *)self->_error copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  historicalDataRequests = self->_historicalDataRequests;
  id v5 = a3;
  [v5 encodeObject:historicalDataRequests forKey:@"hdr"];
  [v5 encodeObject:self->_error forKey:@"err"];
}

- (FIAPResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79B230]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"hdr"];
  char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"err"];
  char v11 = [(FIAPResult *)self initWithHistoricalDataRequests:v9 error:v10];

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_historicalDataRequests hash];
  return [(NSError *)self->_error hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<FIAPResult h:%@ e:%@>", self->_historicalDataRequests, self->_error];
  return v2;
}

- (FIAPResult)initWithHistoricalDataRequests:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FIAPResult;
  v9 = [(FIAPResult *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_historicalDataRequests, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (FIAPResult)init
{
  return [(FIAPResult *)self initWithHistoricalDataRequests:0 error:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)resultWithHistoricalDataRequests:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[FIAPResult alloc] initWithHistoricalDataRequests:v6 error:v5];

  return v7;
}

+ (id)success
{
  return +[FIAPResult resultWithHistoricalDataRequests:0 error:0];
}

@end