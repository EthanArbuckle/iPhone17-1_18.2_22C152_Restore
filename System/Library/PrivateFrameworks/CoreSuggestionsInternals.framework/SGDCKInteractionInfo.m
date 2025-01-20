@interface SGDCKInteractionInfo
- (BOOL)hasIntentResponseUserActivityString;
- (BOOL)hasInteractionBundleId;
- (BOOL)hasInteractionGroupId;
- (BOOL)hasInteractionId;
- (BOOL)hasInteractionTeamId;
- (BOOL)hasReservationContainerReference;
- (BOOL)hasReservationItemReferences;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)reservationContainerReference;
- (NSData)reservationItemReferences;
- (NSString)intentResponseUserActivityString;
- (NSString)interactionBundleId;
- (NSString)interactionGroupId;
- (NSString)interactionId;
- (NSString)interactionTeamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIntentResponseUserActivityString:(id)a3;
- (void)setInteractionBundleId:(id)a3;
- (void)setInteractionGroupId:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setInteractionTeamId:(id)a3;
- (void)setReservationContainerReference:(id)a3;
- (void)setReservationItemReferences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGDCKInteractionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationItemReferences, 0);
  objc_storeStrong((id *)&self->_reservationContainerReference, 0);
  objc_storeStrong((id *)&self->_interactionTeamId, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_interactionGroupId, 0);
  objc_storeStrong((id *)&self->_interactionBundleId, 0);
  objc_storeStrong((id *)&self->_intentResponseUserActivityString, 0);
}

- (void)setInteractionTeamId:(id)a3
{
}

- (NSString)interactionTeamId
{
  return self->_interactionTeamId;
}

- (void)setIntentResponseUserActivityString:(id)a3
{
}

- (NSString)intentResponseUserActivityString
{
  return self->_intentResponseUserActivityString;
}

- (void)setReservationContainerReference:(id)a3
{
}

- (NSData)reservationContainerReference
{
  return self->_reservationContainerReference;
}

- (void)setReservationItemReferences:(id)a3
{
}

- (NSData)reservationItemReferences
{
  return self->_reservationItemReferences;
}

- (void)setInteractionBundleId:(id)a3
{
}

- (NSString)interactionBundleId
{
  return self->_interactionBundleId;
}

- (void)setInteractionGroupId:(id)a3
{
}

- (NSString)interactionGroupId
{
  return self->_interactionGroupId;
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[4]) {
    -[SGDCKInteractionInfo setInteractionId:](self, "setInteractionId:");
  }
  if (v4[3]) {
    -[SGDCKInteractionInfo setInteractionGroupId:](self, "setInteractionGroupId:");
  }
  if (v4[2]) {
    -[SGDCKInteractionInfo setInteractionBundleId:](self, "setInteractionBundleId:");
  }
  if (v4[7]) {
    -[SGDCKInteractionInfo setReservationItemReferences:](self, "setReservationItemReferences:");
  }
  if (v4[6]) {
    -[SGDCKInteractionInfo setReservationContainerReference:](self, "setReservationContainerReference:");
  }
  if (v4[1]) {
    -[SGDCKInteractionInfo setIntentResponseUserActivityString:](self, "setIntentResponseUserActivityString:");
  }
  if (v4[5]) {
    -[SGDCKInteractionInfo setInteractionTeamId:](self, "setInteractionTeamId:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_interactionId hash];
  NSUInteger v4 = [(NSString *)self->_interactionGroupId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_interactionBundleId hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_reservationItemReferences hash];
  uint64_t v7 = [(NSData *)self->_reservationContainerReference hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_intentResponseUserActivityString hash];
  return v6 ^ v8 ^ [(NSString *)self->_interactionTeamId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((interactionId = self->_interactionId, !((unint64_t)interactionId | v4[4]))
     || -[NSString isEqual:](interactionId, "isEqual:"))
    && ((interactionGroupId = self->_interactionGroupId, !((unint64_t)interactionGroupId | v4[3]))
     || -[NSString isEqual:](interactionGroupId, "isEqual:"))
    && ((interactionBundleId = self->_interactionBundleId, !((unint64_t)interactionBundleId | v4[2]))
     || -[NSString isEqual:](interactionBundleId, "isEqual:"))
    && ((reservationItemReferences = self->_reservationItemReferences,
         !((unint64_t)reservationItemReferences | v4[7]))
     || -[NSData isEqual:](reservationItemReferences, "isEqual:"))
    && ((reservationContainerReference = self->_reservationContainerReference,
         !((unint64_t)reservationContainerReference | v4[6]))
     || -[NSData isEqual:](reservationContainerReference, "isEqual:"))
    && ((intentResponseUserActivityString = self->_intentResponseUserActivityString,
         !((unint64_t)intentResponseUserActivityString | v4[1]))
     || -[NSString isEqual:](intentResponseUserActivityString, "isEqual:")))
  {
    interactionTeamId = self->_interactionTeamId;
    if ((unint64_t)interactionTeamId | v4[5]) {
      char v12 = -[NSString isEqual:](interactionTeamId, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_interactionId copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_interactionGroupId copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_interactionBundleId copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSData *)self->_reservationItemReferences copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  uint64_t v14 = [(NSData *)self->_reservationContainerReference copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  uint64_t v16 = [(NSString *)self->_intentResponseUserActivityString copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  uint64_t v18 = [(NSString *)self->_interactionTeamId copyWithZone:a3];
  v19 = (void *)v5[5];
  v5[5] = v18;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_interactionId)
  {
    objc_msgSend(v4, "setInteractionId:");
    id v4 = v5;
  }
  if (self->_interactionGroupId)
  {
    objc_msgSend(v5, "setInteractionGroupId:");
    id v4 = v5;
  }
  if (self->_interactionBundleId)
  {
    objc_msgSend(v5, "setInteractionBundleId:");
    id v4 = v5;
  }
  if (self->_reservationItemReferences)
  {
    objc_msgSend(v5, "setReservationItemReferences:");
    id v4 = v5;
  }
  if (self->_reservationContainerReference)
  {
    objc_msgSend(v5, "setReservationContainerReference:");
    id v4 = v5;
  }
  if (self->_intentResponseUserActivityString)
  {
    objc_msgSend(v5, "setIntentResponseUserActivityString:");
    id v4 = v5;
  }
  if (self->_interactionTeamId)
  {
    objc_msgSend(v5, "setInteractionTeamId:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_interactionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_interactionGroupId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_interactionBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_reservationItemReferences)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_reservationContainerReference)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_intentResponseUserActivityString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_interactionTeamId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGDCKInteractionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  interactionId = self->_interactionId;
  if (interactionId) {
    [v3 setObject:interactionId forKey:@"interactionId"];
  }
  interactionGroupId = self->_interactionGroupId;
  if (interactionGroupId) {
    [v4 setObject:interactionGroupId forKey:@"interactionGroupId"];
  }
  interactionBundleId = self->_interactionBundleId;
  if (interactionBundleId) {
    [v4 setObject:interactionBundleId forKey:@"interactionBundleId"];
  }
  reservationItemReferences = self->_reservationItemReferences;
  if (reservationItemReferences) {
    [v4 setObject:reservationItemReferences forKey:@"reservationItemReferences"];
  }
  reservationContainerReference = self->_reservationContainerReference;
  if (reservationContainerReference) {
    [v4 setObject:reservationContainerReference forKey:@"reservationContainerReference"];
  }
  intentResponseUserActivityString = self->_intentResponseUserActivityString;
  if (intentResponseUserActivityString) {
    [v4 setObject:intentResponseUserActivityString forKey:@"intentResponseUserActivityString"];
  }
  interactionTeamId = self->_interactionTeamId;
  if (interactionTeamId) {
    [v4 setObject:interactionTeamId forKey:@"interactionTeamId"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGDCKInteractionInfo;
  id v4 = [(SGDCKInteractionInfo *)&v8 description];
  id v5 = [(SGDCKInteractionInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasInteractionTeamId
{
  return self->_interactionTeamId != 0;
}

- (BOOL)hasIntentResponseUserActivityString
{
  return self->_intentResponseUserActivityString != 0;
}

- (BOOL)hasReservationContainerReference
{
  return self->_reservationContainerReference != 0;
}

- (BOOL)hasReservationItemReferences
{
  return self->_reservationItemReferences != 0;
}

- (BOOL)hasInteractionBundleId
{
  return self->_interactionBundleId != 0;
}

- (BOOL)hasInteractionGroupId
{
  return self->_interactionGroupId != 0;
}

- (BOOL)hasInteractionId
{
  return self->_interactionId != 0;
}

@end