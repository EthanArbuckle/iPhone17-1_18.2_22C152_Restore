@interface QLThumbnailAdditionEntry
+ (BOOL)supportsSecureCoding;
- (NSData)vol_uuid;
- (NSDate)lastHitDate;
- (NSString)unparsedVolumeUUID;
- (NSURL)lastSeenURL;
- (QLThumbnailAdditionEntry)initWithCoder:(id)a3;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (int64_t)size;
- (unint64_t)documentID;
- (void)encodeWithCoder:(id)a3;
- (void)setDocumentID:(unint64_t)a3;
- (void)setLastHitDate:(id)a3;
- (void)setLastSeenURL:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setVol_uuid:(id)a3;
@end

@implementation QLThumbnailAdditionEntry

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(QLThumbnailAdditionEntry *)self lastHitDate];
  [v4 encodeObject:v5 forKey:@"date"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[QLThumbnailAdditionEntry documentID](self, "documentID"), @"docId");
  objc_msgSend(v4, "encodeInt64:forKey:", -[QLThumbnailAdditionEntry size](self, "size"), @"size");
  v6 = [(QLThumbnailAdditionEntry *)self lastSeenURL];
  [v4 encodeObject:v6 forKey:@"url"];

  id v7 = [(QLThumbnailAdditionEntry *)self vol_uuid];
  [v4 encodeObject:v7 forKey:@"vol_uuid"];
}

- (QLThumbnailAdditionEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLThumbnailAdditionEntry;
  v5 = [(QLThumbnailAdditionEntry *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    [(QLThumbnailAdditionEntry *)v5 setLastHitDate:v6];

    -[QLThumbnailAdditionEntry setDocumentID:](v5, "setDocumentID:", [v4 decodeInt64ForKey:@"docId"]);
    -[QLThumbnailAdditionEntry setSize:](v5, "setSize:", [v4 decodeInt64ForKey:@"size"]);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    [(QLThumbnailAdditionEntry *)v5 setLastSeenURL:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vol_uuid"];
    [(QLThumbnailAdditionEntry *)v5 setVol_uuid:v8];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)unparsedVolumeUUID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)v6 = 0;
  v2 = [(QLThumbnailAdditionEntry *)self vol_uuid];
  [v2 getBytes:uu length:16];

  uuid_unparse_upper(uu, v5);
  v3 = [NSString stringWithUTF8String:v5];

  return (NSString *)v3;
}

- (unint64_t)documentID
{
  return self->_documentID;
}

- (void)setDocumentID:(unint64_t)a3
{
  self->_documentID = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSDate)lastHitDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastHitDate:(id)a3
{
}

- (NSURL)lastSeenURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastSeenURL:(id)a3
{
}

- (NSData)vol_uuid
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVol_uuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vol_uuid, 0);
  objc_storeStrong((id *)&self->_lastSeenURL, 0);

  objc_storeStrong((id *)&self->_lastHitDate, 0);
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)QLThumbnailAdditionEntry;
  id v7 = [(QLThumbnailAdditionEntry *)&v15 init];
  if (!v7)
  {
LABEL_6:
    v13 = v7;
    goto LABEL_7;
  }
  if ([v6 columns] == 5 || objc_msgSend(v6, "columns") == 4)
  {
    -[QLThumbnailAdditionEntry setDocumentID:](v7, "setDocumentID:", [v6 unsignedLongLongAtIndex:0]);
    uint64_t v8 = [v6 dataAtIndex:1];
    [(QLThumbnailAdditionEntry *)v7 setVol_uuid:v8];

    v9 = [v6 dateAtIndex:2];
    [(QLThumbnailAdditionEntry *)v7 setLastHitDate:v9];

    objc_super v10 = (void *)MEMORY[0x1E4F1CB10];
    v11 = [v6 stringAtIndex:3];
    v12 = [v10 fileURLWithPath:v11];
    [(QLThumbnailAdditionEntry *)v7 setLastSeenURL:v12];

    if ([v6 columns] == 5) {
      -[QLThumbnailAdditionEntry setSize:](v7, "setSize:", [v6 unsignedLongLongAtIndex:4]);
    }
    goto LABEL_6;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithSqliteCode:20 andMessage:@"This result set should have four or five columns"];
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_7:

  return v13;
}

@end