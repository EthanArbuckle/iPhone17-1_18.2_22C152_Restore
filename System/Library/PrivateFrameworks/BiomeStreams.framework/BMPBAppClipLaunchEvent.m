@interface BMPBAppClipLaunchEvent
- (BOOL)hasAppBundleID;
- (BOOL)hasClipBundleID;
- (BOOL)hasFullURL;
- (BOOL)hasLaunchReason;
- (BOOL)hasReferrerBundleID;
- (BOOL)hasReferrerURL;
- (BOOL)hasURLHash;
- (BOOL)hasWebAppBundleID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appBundleID;
- (NSString)clipBundleID;
- (NSString)fullURL;
- (NSString)launchReason;
- (NSString)referrerBundleID;
- (NSString)referrerURL;
- (NSString)uRLHash;
- (NSString)webAppBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleID:(id)a3;
- (void)setClipBundleID:(id)a3;
- (void)setFullURL:(id)a3;
- (void)setLaunchReason:(id)a3;
- (void)setReferrerBundleID:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setURLHash:(id)a3;
- (void)setWebAppBundleID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBAppClipLaunchEvent

- (BOOL)hasURLHash
{
  return self->_uRLHash != 0;
}

- (BOOL)hasClipBundleID
{
  return self->_clipBundleID != 0;
}

- (BOOL)hasAppBundleID
{
  return self->_appBundleID != 0;
}

- (BOOL)hasWebAppBundleID
{
  return self->_webAppBundleID != 0;
}

- (BOOL)hasLaunchReason
{
  return self->_launchReason != 0;
}

- (BOOL)hasFullURL
{
  return self->_fullURL != 0;
}

- (BOOL)hasReferrerURL
{
  return self->_referrerURL != 0;
}

- (BOOL)hasReferrerBundleID
{
  return self->_referrerBundleID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBAppClipLaunchEvent;
  v4 = [(BMPBAppClipLaunchEvent *)&v8 description];
  v5 = [(BMPBAppClipLaunchEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uRLHash = self->_uRLHash;
  if (uRLHash) {
    [v3 setObject:uRLHash forKey:@"URLHash"];
  }
  clipBundleID = self->_clipBundleID;
  if (clipBundleID) {
    [v4 setObject:clipBundleID forKey:@"clipBundleID"];
  }
  appBundleID = self->_appBundleID;
  if (appBundleID) {
    [v4 setObject:appBundleID forKey:@"appBundleID"];
  }
  webAppBundleID = self->_webAppBundleID;
  if (webAppBundleID) {
    [v4 setObject:webAppBundleID forKey:@"webAppBundleID"];
  }
  launchReason = self->_launchReason;
  if (launchReason) {
    [v4 setObject:launchReason forKey:@"launchReason"];
  }
  fullURL = self->_fullURL;
  if (fullURL) {
    [v4 setObject:fullURL forKey:@"fullURL"];
  }
  referrerURL = self->_referrerURL;
  if (referrerURL) {
    [v4 setObject:referrerURL forKey:@"referrerURL"];
  }
  referrerBundleID = self->_referrerBundleID;
  if (referrerBundleID) {
    [v4 setObject:referrerBundleID forKey:@"referrerBundleID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAppClipLaunchEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uRLHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clipBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_appBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_webAppBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_launchReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fullURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_referrerURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_referrerBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uRLHash)
  {
    objc_msgSend(v4, "setURLHash:");
    id v4 = v5;
  }
  if (self->_clipBundleID)
  {
    objc_msgSend(v5, "setClipBundleID:");
    id v4 = v5;
  }
  if (self->_appBundleID)
  {
    objc_msgSend(v5, "setAppBundleID:");
    id v4 = v5;
  }
  if (self->_webAppBundleID)
  {
    objc_msgSend(v5, "setWebAppBundleID:");
    id v4 = v5;
  }
  if (self->_launchReason)
  {
    objc_msgSend(v5, "setLaunchReason:");
    id v4 = v5;
  }
  if (self->_fullURL)
  {
    objc_msgSend(v5, "setFullURL:");
    id v4 = v5;
  }
  if (self->_referrerURL)
  {
    objc_msgSend(v5, "setReferrerURL:");
    id v4 = v5;
  }
  if (self->_referrerBundleID)
  {
    objc_msgSend(v5, "setReferrerBundleID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uRLHash copyWithZone:a3];
  v7 = (void *)v5[7];
  v5[7] = v6;

  uint64_t v8 = [(NSString *)self->_clipBundleID copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_appBundleID copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_webAppBundleID copyWithZone:a3];
  v13 = (void *)v5[8];
  v5[8] = v12;

  uint64_t v14 = [(NSString *)self->_launchReason copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  uint64_t v16 = [(NSString *)self->_fullURL copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  uint64_t v18 = [(NSString *)self->_referrerURL copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  uint64_t v20 = [(NSString *)self->_referrerBundleID copyWithZone:a3];
  v21 = (void *)v5[5];
  v5[5] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uRLHash = self->_uRLHash, !((unint64_t)uRLHash | v4[7]))
     || -[NSString isEqual:](uRLHash, "isEqual:"))
    && ((clipBundleID = self->_clipBundleID, !((unint64_t)clipBundleID | v4[2]))
     || -[NSString isEqual:](clipBundleID, "isEqual:"))
    && ((appBundleID = self->_appBundleID, !((unint64_t)appBundleID | v4[1]))
     || -[NSString isEqual:](appBundleID, "isEqual:"))
    && ((webAppBundleID = self->_webAppBundleID, !((unint64_t)webAppBundleID | v4[8]))
     || -[NSString isEqual:](webAppBundleID, "isEqual:"))
    && ((launchReason = self->_launchReason, !((unint64_t)launchReason | v4[4]))
     || -[NSString isEqual:](launchReason, "isEqual:"))
    && ((fullURL = self->_fullURL, !((unint64_t)fullURL | v4[3]))
     || -[NSString isEqual:](fullURL, "isEqual:"))
    && ((referrerURL = self->_referrerURL, !((unint64_t)referrerURL | v4[6]))
     || -[NSString isEqual:](referrerURL, "isEqual:")))
  {
    referrerBundleID = self->_referrerBundleID;
    if ((unint64_t)referrerBundleID | v4[5]) {
      char v13 = -[NSString isEqual:](referrerBundleID, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uRLHash hash];
  NSUInteger v4 = [(NSString *)self->_clipBundleID hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_appBundleID hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_webAppBundleID hash];
  NSUInteger v7 = [(NSString *)self->_launchReason hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_fullURL hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_referrerURL hash];
  return v9 ^ [(NSString *)self->_referrerBundleID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[7]) {
    -[BMPBAppClipLaunchEvent setURLHash:](self, "setURLHash:");
  }
  if (v4[2]) {
    -[BMPBAppClipLaunchEvent setClipBundleID:](self, "setClipBundleID:");
  }
  if (v4[1]) {
    -[BMPBAppClipLaunchEvent setAppBundleID:](self, "setAppBundleID:");
  }
  if (v4[8]) {
    -[BMPBAppClipLaunchEvent setWebAppBundleID:](self, "setWebAppBundleID:");
  }
  if (v4[4]) {
    -[BMPBAppClipLaunchEvent setLaunchReason:](self, "setLaunchReason:");
  }
  if (v4[3]) {
    -[BMPBAppClipLaunchEvent setFullURL:](self, "setFullURL:");
  }
  if (v4[6]) {
    -[BMPBAppClipLaunchEvent setReferrerURL:](self, "setReferrerURL:");
  }
  if (v4[5]) {
    -[BMPBAppClipLaunchEvent setReferrerBundleID:](self, "setReferrerBundleID:");
  }
}

- (NSString)uRLHash
{
  return self->_uRLHash;
}

- (void)setURLHash:(id)a3
{
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (void)setClipBundleID:(id)a3
{
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSString)webAppBundleID
{
  return self->_webAppBundleID;
}

- (void)setWebAppBundleID:(id)a3
{
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
}

- (NSString)fullURL
{
  return self->_fullURL;
}

- (void)setFullURL:(id)a3
{
}

- (NSString)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void)setReferrerBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAppBundleID, 0);
  objc_storeStrong((id *)&self->_uRLHash, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_fullURL, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);

  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end