@interface FCCFitnessPlusPlanPostNotificationRequest
- (BOOL)force;
- (FCCFitnessPlusPlanPostNotificationRequest)initWithTransportData:(id)a3;
- (FCCFitnessPlusPlanPostNotificationRequest)initWithType:(id)a3;
- (FCCFitnessPlusPlanPostNotificationRequest)initWithType:(id)a3 force:(BOOL)a4;
- (NSString)description;
- (NSString)type;
- (id)transportData;
@end

@implementation FCCFitnessPlusPlanPostNotificationRequest

- (FCCFitnessPlusPlanPostNotificationRequest)initWithType:(id)a3
{
  return [(FCCFitnessPlusPlanPostNotificationRequest *)self initWithType:a3 force:0];
}

- (FCCFitnessPlusPlanPostNotificationRequest)initWithType:(id)a3 force:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCCFitnessPlusPlanPostNotificationRequest;
  v8 = [(FCCFitnessPlusPlanPostNotificationRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_type, a3);
    v9->_force = a4;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"FCCFitnessPlusPlanPostNotificationRequest: type: %@, force: %{BOOL}d", self->_type, self->_force];
}

- (FCCFitnessPlusPlanPostNotificationRequest)initWithTransportData:(id)a3
{
  id v4 = a3;
  v5 = [[FCCFitnessPlusPlanPostNotificationRequestProtobuf alloc] initWithData:v4];

  v6 = [(FCCFitnessPlusPlanPostNotificationRequestProtobuf *)v5 type];
  if ([(FCCFitnessPlusPlanPostNotificationRequestProtobuf *)v5 hasForce]) {
    uint64_t v7 = [(FCCFitnessPlusPlanPostNotificationRequestProtobuf *)v5 force];
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [(FCCFitnessPlusPlanPostNotificationRequest *)self initWithType:v6 force:v7];

  return v8;
}

- (id)transportData
{
  v3 = objc_alloc_init(FCCFitnessPlusPlanPostNotificationRequestProtobuf);
  [(FCCFitnessPlusPlanPostNotificationRequestProtobuf *)v3 setType:self->_type];
  [(FCCFitnessPlusPlanPostNotificationRequestProtobuf *)v3 setForce:self->_force];
  id v4 = [(FCCFitnessPlusPlanPostNotificationRequestProtobuf *)v3 data];

  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)force
{
  return self->_force;
}

- (void).cxx_destruct
{
}

@end