@interface _INPBReportIncidentIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAdditionalDetails;
- (BOOL)hasIncidentType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasIsClear;
- (BOOL)hasStartTime;
- (BOOL)hasUserLocation;
- (BOOL)isClear;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)userLocation;
- (_INPBReportIncidentIntent)initWithCoder:(id)a3;
- (_INPBString)additionalDetails;
- (_INPBSupportedTrafficIncidentType)incidentType;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalDetails:(id)a3;
- (void)setHasIsClear:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setIncidentType:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setIsClear:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setUserLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBReportIncidentIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_incidentType, 0);

  objc_storeStrong((id *)&self->_additionalDetails, 0);
}

- (_INPBLocation)userLocation
{
  return self->_userLocation;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)isClear
{
  return self->_isClear;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBSupportedTrafficIncidentType)incidentType
{
  return self->_incidentType;
}

- (_INPBString)additionalDetails
{
  return self->_additionalDetails;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBReportIncidentIntent *)self additionalDetails];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"additionalDetails"];

  v6 = [(_INPBReportIncidentIntent *)self incidentType];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"incidentType"];

  v8 = [(_INPBReportIncidentIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBReportIncidentIntent *)self hasIsClear])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBReportIncidentIntent isClear](self, "isClear"));
    [v3 setObject:v10 forKeyedSubscript:@"isClear"];
  }
  if ([(_INPBReportIncidentIntent *)self hasStartTime])
  {
    v11 = NSNumber;
    [(_INPBReportIncidentIntent *)self startTime];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"startTime"];
  }
  v13 = [(_INPBReportIncidentIntent *)self userLocation];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"userLocation"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_additionalDetails hash];
  unint64_t v4 = [(_INPBSupportedTrafficIncidentType *)self->_incidentType hash];
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBReportIncidentIntent *)self hasIsClear]) {
    uint64_t v6 = 2654435761 * self->_isClear;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBReportIncidentIntent *)self hasStartTime])
  {
    double startTime = self->_startTime;
    double v8 = -startTime;
    if (startTime >= 0.0) {
      double v8 = self->_startTime;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v11 += (unint64_t)v10;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ [(_INPBLocation *)self->_userLocation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  unint64_t v5 = [(_INPBReportIncidentIntent *)self additionalDetails];
  uint64_t v6 = [v4 additionalDetails];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(_INPBReportIncidentIntent *)self additionalDetails];
  if (v7)
  {
    double v8 = (void *)v7;
    long double v9 = [(_INPBReportIncidentIntent *)self additionalDetails];
    double v10 = [v4 additionalDetails];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReportIncidentIntent *)self incidentType];
  uint64_t v6 = [v4 incidentType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(_INPBReportIncidentIntent *)self incidentType];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBReportIncidentIntent *)self incidentType];
    v15 = [v4 incidentType];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReportIncidentIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v17 = [(_INPBReportIncidentIntent *)self intentMetadata];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBReportIncidentIntent *)self intentMetadata];
    v20 = [v4 intentMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  int v22 = [(_INPBReportIncidentIntent *)self hasIsClear];
  if (v22 != [v4 hasIsClear]) {
    goto LABEL_30;
  }
  if ([(_INPBReportIncidentIntent *)self hasIsClear])
  {
    if ([v4 hasIsClear])
    {
      int isClear = self->_isClear;
      if (isClear != [v4 isClear]) {
        goto LABEL_30;
      }
    }
  }
  int v24 = [(_INPBReportIncidentIntent *)self hasStartTime];
  if (v24 != [v4 hasStartTime]) {
    goto LABEL_30;
  }
  if ([(_INPBReportIncidentIntent *)self hasStartTime])
  {
    if ([v4 hasStartTime])
    {
      double startTime = self->_startTime;
      [v4 startTime];
      if (startTime != v26) {
        goto LABEL_30;
      }
    }
  }
  unint64_t v5 = [(_INPBReportIncidentIntent *)self userLocation];
  uint64_t v6 = [v4 userLocation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBReportIncidentIntent *)self userLocation];
    if (!v27)
    {

LABEL_33:
      BOOL v32 = 1;
      goto LABEL_31;
    }
    v28 = (void *)v27;
    v29 = [(_INPBReportIncidentIntent *)self userLocation];
    v30 = [v4 userLocation];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_29:
  }
LABEL_30:
  BOOL v32 = 0;
LABEL_31:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBReportIncidentIntent allocWithZone:](_INPBReportIncidentIntent, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_additionalDetails copyWithZone:a3];
  [(_INPBReportIncidentIntent *)v5 setAdditionalDetails:v6];

  id v7 = [(_INPBSupportedTrafficIncidentType *)self->_incidentType copyWithZone:a3];
  [(_INPBReportIncidentIntent *)v5 setIncidentType:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBReportIncidentIntent *)v5 setIntentMetadata:v8];

  if ([(_INPBReportIncidentIntent *)self hasIsClear]) {
    [(_INPBReportIncidentIntent *)v5 setIsClear:[(_INPBReportIncidentIntent *)self isClear]];
  }
  if ([(_INPBReportIncidentIntent *)self hasStartTime])
  {
    [(_INPBReportIncidentIntent *)self startTime];
    -[_INPBReportIncidentIntent setStartTime:](v5, "setStartTime:");
  }
  id v9 = [(_INPBLocation *)self->_userLocation copyWithZone:a3];
  [(_INPBReportIncidentIntent *)v5 setUserLocation:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBReportIncidentIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBReportIncidentIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBReportIncidentIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBReportIncidentIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBReportIncidentIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(_INPBReportIncidentIntent *)self additionalDetails];

  if (v4)
  {
    unint64_t v5 = [(_INPBReportIncidentIntent *)self additionalDetails];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBReportIncidentIntent *)self incidentType];

  if (v6)
  {
    uint64_t v7 = [(_INPBReportIncidentIntent *)self incidentType];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBReportIncidentIntent *)self intentMetadata];

  if (v8)
  {
    id v9 = [(_INPBReportIncidentIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBReportIncidentIntent *)self hasIsClear]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBReportIncidentIntent *)self hasStartTime]) {
    PBDataWriterWriteDoubleField();
  }
  double v10 = [(_INPBReportIncidentIntent *)self userLocation];

  int v11 = v13;
  if (v10)
  {
    uint64_t v12 = [(_INPBReportIncidentIntent *)self userLocation];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReportIncidentIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUserLocation
{
  return self->_userLocation != 0;
}

- (void)setUserLocation:(id)a3
{
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double startTime = a3;
}

- (void)setHasIsClear:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsClear
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsClear:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isClear = a3;
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasIncidentType
{
  return self->_incidentType != 0;
}

- (void)setIncidentType:(id)a3
{
}

- (BOOL)hasAdditionalDetails
{
  return self->_additionalDetails != 0;
}

- (void)setAdditionalDetails:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end