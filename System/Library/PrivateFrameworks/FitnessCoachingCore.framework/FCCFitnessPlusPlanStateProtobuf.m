@interface FCCFitnessPlusPlanStateProtobuf
- (BOOL)hasWorkoutScheduledToday;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasWorkoutScheduledToday:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCFitnessPlusPlanStateProtobuf

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCFitnessPlusPlanStateProtobuf;
  v4 = [(FCCFitnessPlusPlanStateProtobuf *)&v8 description];
  v5 = [(FCCFitnessPlusPlanStateProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithBool:self->_hasWorkoutScheduledToday];
  [v3 setObject:v4 forKey:@"hasWorkoutScheduledToday"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCFitnessPlusPlanStateProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 8) = self->_hasWorkoutScheduledToday;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_hasWorkoutScheduledToday;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (self->_hasWorkoutScheduledToday) {
      BOOL v5 = v4[8] != 0;
    }
    else {
      BOOL v5 = v4[8] == 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_hasWorkoutScheduledToday;
}

- (void)mergeFrom:(id)a3
{
  self->_hasWorkoutScheduledToday = *((unsigned char *)a3 + 8);
}

- (BOOL)hasWorkoutScheduledToday
{
  return self->_hasWorkoutScheduledToday;
}

- (void)setHasWorkoutScheduledToday:(BOOL)a3
{
  self->_hasWorkoutScheduledToday = a3;
}

@end