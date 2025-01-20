@interface HDCodableWorkoutSessionConfiguration
- (BOOL)hasSourceBundleIdentifier;
- (BOOL)hasWorkoutConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableWorkoutConfiguration)workoutConfiguration;
- (NSString)sourceBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setWorkoutConfiguration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutSessionConfiguration

- (BOOL)hasWorkoutConfiguration
{
  return self->_workoutConfiguration != 0;
}

- (BOOL)hasSourceBundleIdentifier
{
  return self->_sourceBundleIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutSessionConfiguration;
  v4 = [(HDCodableWorkoutSessionConfiguration *)&v8 description];
  v5 = [(HDCodableWorkoutSessionConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  workoutConfiguration = self->_workoutConfiguration;
  if (workoutConfiguration)
  {
    v5 = [(HDCodableWorkoutConfiguration *)workoutConfiguration dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"workoutConfiguration"];
  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if (sourceBundleIdentifier) {
    [v3 setObject:sourceBundleIdentifier forKey:@"sourceBundleIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutSessionConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_workoutConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_sourceBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_workoutConfiguration)
  {
    objc_msgSend(v4, "setWorkoutConfiguration:");
    id v4 = v5;
  }
  if (self->_sourceBundleIdentifier)
  {
    objc_msgSend(v5, "setSourceBundleIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableWorkoutConfiguration *)self->_workoutConfiguration copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_sourceBundleIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((workoutConfiguration = self->_workoutConfiguration, !((unint64_t)workoutConfiguration | v4[2]))
     || -[HDCodableWorkoutConfiguration isEqual:](workoutConfiguration, "isEqual:")))
  {
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    if ((unint64_t)sourceBundleIdentifier | v4[1]) {
      char v7 = -[NSString isEqual:](sourceBundleIdentifier, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableWorkoutConfiguration *)self->_workoutConfiguration hash];
  return [(NSString *)self->_sourceBundleIdentifier hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  workoutConfiguration = self->_workoutConfiguration;
  uint64_t v6 = v4[2];
  char v7 = v4;
  if (workoutConfiguration)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableWorkoutConfiguration mergeFrom:](workoutConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    [(HDCodableWorkoutSessionConfiguration *)self setWorkoutConfiguration:"setWorkoutConfiguration:"];
  }
  id v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[HDCodableWorkoutSessionConfiguration setSourceBundleIdentifier:](self, "setSourceBundleIdentifier:");
    id v4 = v7;
  }
}

- (HDCodableWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);

  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

@end