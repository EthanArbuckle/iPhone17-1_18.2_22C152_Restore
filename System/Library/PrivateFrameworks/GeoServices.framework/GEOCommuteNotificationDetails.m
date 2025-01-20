@interface GEOCommuteNotificationDetails
+ (BOOL)supportsSecureCoding;
- (GEOCommuteNotificationDetails)init;
- (GEOCommuteNotificationDetails)initWithCoder:(id)a3;
- (GEOCommuteNotificationDetails)initWithTitle:(id)a3 message:(id)a4 commuteDetailsIdentifier:(id)a5 expirationDate:(id)a6 score:(int64_t)a7;
- (NSDate)expirationDate;
- (NSString)commuteDetailsIdentifier;
- (NSString)message;
- (NSString)title;
- (id)description;
- (int64_t)score;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOCommuteNotificationDetails

- (GEOCommuteNotificationDetails)init
{
  result = (GEOCommuteNotificationDetails *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOCommuteNotificationDetails)initWithTitle:(id)a3 message:(id)a4 commuteDetailsIdentifier:(id)a5 expirationDate:(id)a6 score:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)GEOCommuteNotificationDetails;
  v16 = [(GEOCommuteNotificationDetails *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    title = v16->_title;
    v16->_title = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    message = v16->_message;
    v16->_message = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    commuteDetailsIdentifier = v16->_commuteDetailsIdentifier;
    v16->_commuteDetailsIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v16->_expirationDate, a6);
    v16->_score = a7;
  }

  return v16;
}

- (id)description
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  title = self->_title;
  v8[0] = @"title";
  v8[1] = @"message";
  long long v10 = *(_OWORD *)&self->_message;
  v8[2] = @"identifier";
  v8[3] = @"expiration date";
  int64_t score = self->_score;
  expirationDate = self->_expirationDate;
  v8[4] = @"score";
  v9 = title;
  v4 = [NSNumber numberWithInteger:score];
  id v12 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:v8 count:5];
  v6 = [v5 description];

  return v6;
}

- (GEOCommuteNotificationDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TitleKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MessageKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CommuteDetailsIdentifierKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpirationDateKey"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"ScoreKey"];

  long long v10 = [(GEOCommuteNotificationDetails *)self initWithTitle:v5 message:v6 commuteDetailsIdentifier:v7 expirationDate:v8 score:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"TitleKey"];
  [v5 encodeObject:self->_message forKey:@"MessageKey"];
  [v5 encodeObject:self->_commuteDetailsIdentifier forKey:@"CommuteDetailsIdentifierKey"];
  [v5 encodeObject:self->_expirationDate forKey:@"ExpirationDateKey"];
  [v5 encodeInteger:self->_score forKey:@"ScoreKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)commuteDetailsIdentifier
{
  return self->_commuteDetailsIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (int64_t)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_commuteDetailsIdentifier, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end