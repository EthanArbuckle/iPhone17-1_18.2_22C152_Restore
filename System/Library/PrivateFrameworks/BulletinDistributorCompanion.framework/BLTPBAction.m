@interface BLTPBAction
- (BLTPBAppearance)appearance;
- (BOOL)hasBehavior;
- (BOOL)hasBehaviorParameters;
- (BOOL)hasBehaviorParametersNulls;
- (BOOL)hasIdentifier;
- (BOOL)hasLaunchURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)behaviorParameters;
- (NSData)behaviorParametersNulls;
- (NSString)identifier;
- (NSString)launchURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)activationMode;
- (int)behavior;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationMode:(int)a3;
- (void)setAppearance:(id)a3;
- (void)setBehavior:(int)a3;
- (void)setBehaviorParameters:(id)a3;
- (void)setBehaviorParametersNulls:(id)a3;
- (void)setHasBehavior:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBAction

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasLaunchURL
{
  return self->_launchURL != 0;
}

- (void)setBehavior:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_behavior = a3;
}

- (void)setHasBehavior:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBehavior
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBehaviorParameters
{
  return self->_behaviorParameters != 0;
}

- (BOOL)hasBehaviorParametersNulls
{
  return self->_behaviorParametersNulls != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBAction;
  v4 = [(BLTPBAction *)&v8 description];
  v5 = [(BLTPBAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  appearance = self->_appearance;
  if (appearance)
  {
    v7 = [(BLTPBAppearance *)appearance dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"appearance"];
  }
  objc_super v8 = [NSNumber numberWithInt:self->_activationMode];
  [v4 setObject:v8 forKey:@"activationMode"];

  launchURL = self->_launchURL;
  if (launchURL) {
    [v4 setObject:launchURL forKey:@"launchURL"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithInt:self->_behavior];
    [v4 setObject:v10 forKey:@"behavior"];
  }
  behaviorParameters = self->_behaviorParameters;
  if (behaviorParameters) {
    [v4 setObject:behaviorParameters forKey:@"behaviorParameters"];
  }
  behaviorParametersNulls = self->_behaviorParametersNulls;
  if (behaviorParametersNulls) {
    [v4 setObject:behaviorParametersNulls forKey:@"behaviorParametersNulls"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (!self->_appearance) {
    -[BLTPBAction writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  if (self->_launchURL) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v4 = v5;
  if (self->_behaviorParameters)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_behaviorParametersNulls)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  if (self->_identifier) {
    objc_msgSend(v5, "setIdentifier:");
  }
  [v5 setAppearance:self->_appearance];
  v4 = v5;
  v5[2] = self->_activationMode;
  if (self->_launchURL)
  {
    objc_msgSend(v5, "setLaunchURL:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_behavior;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_behaviorParameters)
  {
    objc_msgSend(v5, "setBehaviorParameters:");
    v4 = v5;
  }
  if (self->_behaviorParametersNulls)
  {
    objc_msgSend(v5, "setBehaviorParametersNulls:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  id v8 = [(BLTPBAppearance *)self->_appearance copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  *(_DWORD *)(v5 + 8) = self->_activationMode;
  uint64_t v10 = [(NSString *)self->_launchURL copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_behavior;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v12 = [(NSData *)self->_behaviorParameters copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSData *)self->_behaviorParametersNulls copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  appearance = self->_appearance;
  if ((unint64_t)appearance | *((void *)v4 + 2))
  {
    if (!-[BLTPBAppearance isEqual:](appearance, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (self->_activationMode != *((_DWORD *)v4 + 2)) {
    goto LABEL_18;
  }
  launchURL = self->_launchURL;
  if ((unint64_t)launchURL | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](launchURL, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_behavior != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_18:
    char v10 = 0;
    goto LABEL_19;
  }
  behaviorParameters = self->_behaviorParameters;
  if ((unint64_t)behaviorParameters | *((void *)v4 + 4)
    && !-[NSData isEqual:](behaviorParameters, "isEqual:"))
  {
    goto LABEL_18;
  }
  behaviorParametersNulls = self->_behaviorParametersNulls;
  if ((unint64_t)behaviorParametersNulls | *((void *)v4 + 5)) {
    char v10 = -[NSData isEqual:](behaviorParametersNulls, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(BLTPBAppearance *)self->_appearance hash];
  uint64_t activationMode = self->_activationMode;
  NSUInteger v6 = [(NSString *)self->_launchURL hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_behavior;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v4 ^ v3 ^ v6 ^ v7 ^ [(NSData *)self->_behaviorParameters hash] ^ (2654435761 * activationMode);
  return v8 ^ [(NSData *)self->_behaviorParametersNulls hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (int *)a3;
  uint64_t v7 = v4;
  if (*((void *)v4 + 6))
  {
    -[BLTPBAction setIdentifier:](self, "setIdentifier:");
    unint64_t v4 = v7;
  }
  appearance = self->_appearance;
  uint64_t v6 = *((void *)v4 + 2);
  if (appearance)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[BLTPBAppearance mergeFrom:](appearance, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[BLTPBAction setAppearance:](self, "setAppearance:");
  }
  unint64_t v4 = v7;
LABEL_9:
  self->_uint64_t activationMode = v4[2];
  if (*((void *)v4 + 7))
  {
    -[BLTPBAction setLaunchURL:](self, "setLaunchURL:");
    unint64_t v4 = v7;
  }
  if (v4[16])
  {
    self->_behavior = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[BLTPBAction setBehaviorParameters:](self, "setBehaviorParameters:");
    unint64_t v4 = v7;
  }
  if (*((void *)v4 + 5)) {
    -[BLTPBAction setBehaviorParametersNulls:](self, "setBehaviorParametersNulls:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BLTPBAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (int)activationMode
{
  return self->_activationMode;
}

- (void)setActivationMode:(int)a3
{
  self->_uint64_t activationMode = a3;
}

- (NSString)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

- (int)behavior
{
  return self->_behavior;
}

- (NSData)behaviorParameters
{
  return self->_behaviorParameters;
}

- (void)setBehaviorParameters:(id)a3
{
}

- (NSData)behaviorParametersNulls
{
  return self->_behaviorParametersNulls;
}

- (void)setBehaviorParametersNulls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_behaviorParametersNulls, 0);
  objc_storeStrong((id *)&self->_behaviorParameters, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBAction writeTo:]", "BLTPBAction.m", 184, "self->_appearance != nil");
}

@end