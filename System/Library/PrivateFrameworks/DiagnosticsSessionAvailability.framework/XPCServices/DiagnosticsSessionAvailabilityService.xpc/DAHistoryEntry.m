@interface DAHistoryEntry
+ (BOOL)supportsSecureCoding;
- (ASTSuiteResult)results;
- (BOOL)skipped;
- (DAHistoryEntry)init;
- (DAHistoryEntry)initWithCoder:(id)a3;
- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5;
- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5 results:(id)a6;
- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4;
- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4 results:(id)a5;
- (NSDate)date;
- (NSString)testSuiteName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAHistoryEntry

- (DAHistoryEntry)init
{
  return [(DAHistoryEntry *)self initWithTestSuiteName:&stru_1000149E0 skipped:0];
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[NSDate date];
  v8 = [(DAHistoryEntry *)self initWithTestSuiteName:v6 date:v7 skipped:v4];

  return v8;
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4 results:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSDate date];
  v11 = [(DAHistoryEntry *)self initWithTestSuiteName:v9 date:v10 skipped:v5 results:v8];

  return v11;
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5
{
  return [(DAHistoryEntry *)self initWithTestSuiteName:a3 date:a4 skipped:a5 results:0];
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5 results:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DAHistoryEntry;
  v14 = [(DAHistoryEntry *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_testSuiteName, a3);
    objc_storeStrong((id *)&v15->_date, a4);
    v15->_skipped = a5;
    objc_storeStrong((id *)&v15->_results, a6);
  }

  return v15;
}

- (DAHistoryEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DAHistoryEntry *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testSuiteName"];
    testSuiteName = v5->_testSuiteName;
    v5->_testSuiteName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_skipped = [v4 decodeBoolForKey:@"skipped"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"results"];
    results = v5->_results;
    v5->_results = (ASTSuiteResult *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DAHistoryEntry *)self testSuiteName];
  [v4 encodeObject:v5 forKey:@"testSuiteName"];

  uint64_t v6 = [(DAHistoryEntry *)self date];
  [v4 encodeObject:v6 forKey:@"date"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DAHistoryEntry skipped](self, "skipped"), @"skipped");
  id v7 = [(DAHistoryEntry *)self results];
  [v4 encodeObject:v7 forKey:@"results"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(NSString *)self->_testSuiteName copyWithZone:a3];
  id v7 = [(NSDate *)self->_date copyWithZone:a3];
  id v8 = [v5 initWithTestSuiteName:v6 date:v7 skipped:self->_skipped];

  return v8;
}

- (id)description
{
  v3 = [(DAHistoryEntry *)self testSuiteName];
  id v4 = [(DAHistoryEntry *)self date];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"testSuiteName: %@; date: %@; skipped: %d",
    v3,
    v4,
  id v5 = [(DAHistoryEntry *)self skipped]);

  return v5;
}

- (NSString)testSuiteName
{
  return self->_testSuiteName;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)skipped
{
  return self->_skipped;
}

- (ASTSuiteResult)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_testSuiteName, 0);
}

@end