@interface TFApplication
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFApplication

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TFApplication;
  v3 = [(TFApplication *)&v7 description];
  v4 = [(TFApplication *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:self->_applicationAdamId];
    [v3 setObject:v4 forKey:@"applicationAdamId"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  cfBundleShortVersionString = self->_cfBundleShortVersionString;
  if (cfBundleShortVersionString) {
    [v3 setObject:cfBundleShortVersionString forKey:@"cfBundleShortVersionString"];
  }
  cfBundleVersion = self->_cfBundleVersion;
  if (cfBundleVersion) {
    [v3 setObject:cfBundleVersion forKey:@"cfBundleVersion"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t platform = self->_platform;
    if (platform >= 4)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_platform];
    }
    else
    {
      v9 = *(&off_10052DA40 + platform);
    }
    [v3 setObject:v9 forKey:@"platform"];
  }
  gitBranch = self->_gitBranch;
  if (gitBranch) {
    [v3 setObject:gitBranch forKey:@"gitBranch"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = +[NSNumber numberWithUnsignedLongLong:self->_uptimeMillis];
    [v3 setObject:v12 forKey:@"uptimeMillis"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v13 = +[NSNumber numberWithBool:self->_isAppClip];
    [v3 setObject:v13 forKey:@"isAppClip"];
  }
  ciBuildGroup = self->_ciBuildGroup;
  if (ciBuildGroup) {
    [v3 setObject:ciBuildGroup forKey:@"ciBuildGroup"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10042745C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_cfBundleShortVersionString) {
    PBDataWriterWriteStringField();
  }
  if (self->_cfBundleVersion) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_gitBranch) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_ciBuildGroup) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_applicationAdamId;
    *((unsigned char *)v5 + 72) |= 1u;
  }
  id v7 = [(NSString *)self->_bundleId copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSString *)self->_cfBundleShortVersionString copyWithZone:a3];
  v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = [(NSString *)self->_cfBundleVersion copyWithZone:a3];
  v12 = (void *)v6[5];
  v6[5] = v11;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6[2] = self->_uptimeMillis;
    *((unsigned char *)v6 + 72) |= 2u;
  }
  id v13 = [(NSString *)self->_gitBranch copyWithZone:a3];
  v14 = (void *)v6[7];
  v6[7] = v13;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v6 + 68) = self->_isAppClip;
    *((unsigned char *)v6 + 72) |= 8u;
  }
  id v15 = [(NSString *)self->_ciBuildGroup copyWithZone:a3];
  v16 = (void *)v6[6];
  v6[6] = v15;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_platform;
    *((unsigned char *)v6 + 72) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_applicationAdamId != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_36;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 3) && !-[NSString isEqual:](bundleId, "isEqual:")) {
    goto LABEL_36;
  }
  cfBundleShortVersionString = self->_cfBundleShortVersionString;
  if ((unint64_t)cfBundleShortVersionString | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](cfBundleShortVersionString, "isEqual:")) {
      goto LABEL_36;
    }
  }
  cfBundleVersion = self->_cfBundleVersion;
  if ((unint64_t)cfBundleVersion | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](cfBundleVersion, "isEqual:")) {
      goto LABEL_36;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 72);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_uptimeMillis != *((void *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_36;
  }
  gitBranch = self->_gitBranch;
  if ((unint64_t)gitBranch | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](gitBranch, "isEqual:")) {
      goto LABEL_36;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 72);
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_36;
    }
    if (self->_isAppClip)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_36;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_36;
  }
  ciBuildGroup = self->_ciBuildGroup;
  if (!((unint64_t)ciBuildGroup | *((void *)v4 + 6))) {
    goto LABEL_32;
  }
  if (!-[NSString isEqual:](ciBuildGroup, "isEqual:"))
  {
LABEL_36:
    BOOL v12 = 0;
    goto LABEL_37;
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 72);
LABEL_32:
  BOOL v12 = (v9 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_platform != *((_DWORD *)v4 + 16)) {
      goto LABEL_36;
    }
    BOOL v12 = 1;
  }
LABEL_37:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_applicationAdamId;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_bundleId hash];
  NSUInteger v5 = [(NSString *)self->_cfBundleShortVersionString hash];
  NSUInteger v6 = [(NSString *)self->_cfBundleVersion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v7 = 2654435761u * self->_uptimeMillis;
  }
  else {
    unint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_gitBranch hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v9 = 2654435761 * self->_isAppClip;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_ciBuildGroup hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_platform;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gitBranch, 0);
  objc_storeStrong((id *)&self->_ciBuildGroup, 0);
  objc_storeStrong((id *)&self->_cfBundleVersion, 0);
  objc_storeStrong((id *)&self->_cfBundleShortVersionString, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end