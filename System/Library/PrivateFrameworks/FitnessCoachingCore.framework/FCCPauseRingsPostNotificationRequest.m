@interface FCCPauseRingsPostNotificationRequest
- (BOOL)force;
- (FCCPauseRingsPostNotificationRequest)initWithForce:(BOOL)a3;
- (FCCPauseRingsPostNotificationRequest)initWithTransportData:(id)a3;
- (NSString)description;
- (id)transportData;
@end

@implementation FCCPauseRingsPostNotificationRequest

- (FCCPauseRingsPostNotificationRequest)initWithForce:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCCPauseRingsPostNotificationRequest;
  result = [(FCCPauseRingsPostNotificationRequest *)&v5 init];
  if (result) {
    result->_force = a3;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"FCCPauseRingsPostNotificationRequest: force: %{BOOL}d", self->_force);
}

- (FCCPauseRingsPostNotificationRequest)initWithTransportData:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[FCCPauseRingsPostNotificationRequestProtobuf alloc] initWithData:v4];

  if ([(FCCPauseRingsPostNotificationRequestProtobuf *)v5 hasForce]) {
    uint64_t v6 = [(FCCPauseRingsPostNotificationRequestProtobuf *)v5 force];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [(FCCPauseRingsPostNotificationRequest *)self initWithForce:v6];

  return v7;
}

- (id)transportData
{
  v3 = objc_alloc_init(FCCPauseRingsPostNotificationRequestProtobuf);
  [(FCCPauseRingsPostNotificationRequestProtobuf *)v3 setForce:self->_force];
  id v4 = [(FCCPauseRingsPostNotificationRequestProtobuf *)v3 data];

  return v4;
}

- (BOOL)force
{
  return self->_force;
}

@end