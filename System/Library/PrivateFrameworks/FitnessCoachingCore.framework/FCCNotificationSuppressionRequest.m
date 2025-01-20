@interface FCCNotificationSuppressionRequest
- (FCCNotificationSuppressionRequest)initWithIdentifier:(id)a3;
- (FCCNotificationSuppressionRequest)initWithIdentifier:(id)a3 expirationDate:(id)a4;
- (FCCNotificationSuppressionRequest)initWithTransportData:(id)a3;
- (NSDate)expirationDate;
- (NSString)description;
- (NSString)identifier;
- (id)transportData;
@end

@implementation FCCNotificationSuppressionRequest

- (FCCNotificationSuppressionRequest)initWithIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [v6 dateByAddingTimeInterval:3600.0];
  v8 = [(FCCNotificationSuppressionRequest *)self initWithIdentifier:v5 expirationDate:v7];

  return v8;
}

- (FCCNotificationSuppressionRequest)initWithIdentifier:(id)a3 expirationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCNotificationSuppressionRequest;
  v9 = [(FCCNotificationSuppressionRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_expirationDate, a4);
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"FCCNotificationSuppressionRequest: identifier: %@, expirationDate: %@", self->_identifier, self->_expirationDate];
}

- (FCCNotificationSuppressionRequest)initWithTransportData:(id)a3
{
  id v4 = a3;
  id v5 = [[FCCNotificationSuppressionRequestProtobuf alloc] initWithData:v4];

  v6 = [(FCCNotificationSuppressionRequestProtobuf *)v5 identifier];
  if ([(FCCNotificationSuppressionRequestProtobuf *)v5 hasExpirationDate])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [(FCCNotificationSuppressionRequestProtobuf *)v5 expirationDate];
    id v8 = objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v8 = 0;
  }
  v9 = [(FCCNotificationSuppressionRequest *)self initWithIdentifier:v6 expirationDate:v8];

  return v9;
}

- (id)transportData
{
  v3 = objc_alloc_init(FCCNotificationSuppressionRequestProtobuf);
  [(FCCNotificationSuppressionRequestProtobuf *)v3 setIdentifier:self->_identifier];
  [(NSDate *)self->_expirationDate timeIntervalSinceReferenceDate];
  -[FCCNotificationSuppressionRequestProtobuf setExpirationDate:](v3, "setExpirationDate:");
  id v4 = [(FCCNotificationSuppressionRequestProtobuf *)v3 data];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end