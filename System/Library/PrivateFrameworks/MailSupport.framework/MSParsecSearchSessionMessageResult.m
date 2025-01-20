@interface MSParsecSearchSessionMessageResult
+ (id)resultWithIdentifier:(id)a3;
+ (id)resultWithIdentifier:(id)a3 date:(id)a4;
- (NSString)resultID;
- (id)feedbackResult;
- (id)initResultWithIdentifier:(id)a3 date:(id)a4;
- (int64_t)messageAge;
@end

@implementation MSParsecSearchSessionMessageResult

+ (id)resultWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initResultWithIdentifier:v4 date:0];

  return v5;
}

+ (id)resultWithIdentifier:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initResultWithIdentifier:v6 date:v7];

  return v8;
}

- (id)initResultWithIdentifier:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSParsecSearchSessionMessageResult;
  v9 = [(MSParsecSearchSessionMessageResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultID, a3);
    v10->_messageAge = [MEMORY[0x1E4F60E00] bucketedMessageAgeSinceDate:v8 leadingDigits:2];
  }

  return v10;
}

- (id)feedbackResult
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
  id v4 = [(MSParsecSearchSessionMessageResult *)self resultID];
  [v3 setIdentifier:v4];

  id v8 = @"messageAgeInDays";
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[MSParsecSearchSessionMessageResult messageAge](self, "messageAge"));
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 setLocalFeatures:v6];

  [v3 setType:2];
  return v3;
}

- (NSString)resultID
{
  return self->_resultID;
}

- (int64_t)messageAge
{
  return self->_messageAge;
}

- (void).cxx_destruct
{
}

@end