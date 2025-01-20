@interface BGTaskRequest
+ (id)_requestFromActivity:(id)a3;
- (NSDate)earliestBeginDate;
- (NSString)identifier;
- (id)_initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEarliestBeginDate:(NSDate *)earliestBeginDate;
@end

@implementation BGTaskRequest

- (id)_initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BGTaskRequest;
  v6 = [(BGTaskRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

+ (id)_requestFromActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 launchReason];
  char v5 = [v4 isEqualToString:*MEMORY[0x263F3B028]];

  if (v5)
  {
    v6 = off_2644217A0;
LABEL_11:
    v15 = [(__objc2_class *)*v6 _requestFromActivity:v3];
    goto LABEL_12;
  }
  v7 = [v3 launchReason];
  char v8 = [v7 isEqualToString:*MEMORY[0x263F3B048]];

  if (v8)
  {
    v6 = off_264421790;
    goto LABEL_11;
  }
  objc_super v9 = [v3 launchReason];
  char v10 = [v9 isEqualToString:*MEMORY[0x263F3B038]];

  if (v10)
  {
    v6 = off_264421780;
    goto LABEL_11;
  }
  v11 = [v3 launchReason];
  char v12 = [v11 isEqualToString:*MEMORY[0x263F3B040]];

  if (v12)
  {
    v6 = &off_264421840;
    goto LABEL_11;
  }
  v13 = [v3 launchReason];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F3B030]];

  if (v14)
  {
    v6 = off_264421770;
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  char v5 = [(BGTaskRequest *)self identifier];
  v6 = (void *)[v4 _initWithIdentifier:v5];

  return v6;
}

- (NSDate)earliestBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEarliestBeginDate:(NSDate *)earliestBeginDate
{
}

@end