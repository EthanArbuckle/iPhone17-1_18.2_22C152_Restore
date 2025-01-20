@interface HDCodableStartWorkoutAppRequest
- (BOOL)hasApplicationIdentifier;
- (BOOL)hasRequestIdentifier;
- (BOOL)hasWorkoutConfiguration;
- (BOOL)hasWorkoutPlanData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableWorkoutConfiguration)workoutConfiguration;
- (NSData)workoutPlanData;
- (NSString)applicationIdentifier;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setWorkoutConfiguration:(id)a3;
- (void)setWorkoutPlanData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableStartWorkoutAppRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (BOOL)hasWorkoutConfiguration
{
  return self->_workoutConfiguration != 0;
}

- (BOOL)hasWorkoutPlanData
{
  return self->_workoutPlanData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableStartWorkoutAppRequest;
  v4 = [(HDCodableStartWorkoutAppRequest *)&v8 description];
  v5 = [(HDCodableStartWorkoutAppRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v3 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier) {
    [v4 setObject:applicationIdentifier forKey:@"applicationIdentifier"];
  }
  workoutConfiguration = self->_workoutConfiguration;
  if (workoutConfiguration)
  {
    objc_super v8 = [(HDCodableWorkoutConfiguration *)workoutConfiguration dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"workoutConfiguration"];
  }
  workoutPlanData = self->_workoutPlanData;
  if (workoutPlanData) {
    [v4 setObject:workoutPlanData forKey:@"workoutPlanData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableStartWorkoutAppRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_applicationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_workoutConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_workoutPlanData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_applicationIdentifier)
  {
    objc_msgSend(v5, "setApplicationIdentifier:");
    id v4 = v5;
  }
  if (self->_workoutConfiguration)
  {
    objc_msgSend(v5, "setWorkoutConfiguration:");
    id v4 = v5;
  }
  if (self->_workoutPlanData)
  {
    objc_msgSend(v5, "setWorkoutPlanData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_applicationIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(HDCodableWorkoutConfiguration *)self->_workoutConfiguration copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSData *)self->_workoutPlanData copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[2]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:"))
    && ((applicationIdentifier = self->_applicationIdentifier, !((unint64_t)applicationIdentifier | v4[1]))
     || -[NSString isEqual:](applicationIdentifier, "isEqual:"))
    && ((workoutConfiguration = self->_workoutConfiguration, !((unint64_t)workoutConfiguration | v4[3]))
     || -[HDCodableWorkoutConfiguration isEqual:](workoutConfiguration, "isEqual:")))
  {
    workoutPlanData = self->_workoutPlanData;
    if ((unint64_t)workoutPlanData | v4[4]) {
      char v9 = -[NSData isEqual:](workoutPlanData, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_applicationIdentifier hash] ^ v3;
  unint64_t v5 = [(HDCodableWorkoutConfiguration *)self->_workoutConfiguration hash];
  return v4 ^ v5 ^ [(NSData *)self->_workoutPlanData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HDCodableStartWorkoutAppRequest setRequestIdentifier:](self, "setRequestIdentifier:");
    NSUInteger v4 = v7;
  }
  if (v4[1])
  {
    -[HDCodableStartWorkoutAppRequest setApplicationIdentifier:](self, "setApplicationIdentifier:");
    NSUInteger v4 = v7;
  }
  workoutConfiguration = self->_workoutConfiguration;
  uint64_t v6 = v4[3];
  if (workoutConfiguration)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableWorkoutConfiguration mergeFrom:](workoutConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    [(HDCodableStartWorkoutAppRequest *)self setWorkoutConfiguration:"setWorkoutConfiguration:"];
  }
  NSUInteger v4 = v7;
LABEL_11:
  if (v4[4])
  {
    [(HDCodableStartWorkoutAppRequest *)self setWorkoutPlanData:"setWorkoutPlanData:"];
    NSUInteger v4 = v7;
  }
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (HDCodableWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
}

- (NSData)workoutPlanData
{
  return self->_workoutPlanData;
}

- (void)setWorkoutPlanData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutPlanData, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end