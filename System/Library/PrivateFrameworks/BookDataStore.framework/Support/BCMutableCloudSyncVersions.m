@interface BCMutableCloudSyncVersions
+ (BOOL)supportsSecureCoding;
- (BCMutableCloudSyncVersions)initWithCloudSyncVersions:(id)a3;
- (BCMutableCloudSyncVersions)initWithCoder:(id)a3;
- (NSPersistentHistoryToken)historyToken;
- (NSString)dataType;
- (id)description;
- (int64_t)cloudVersion;
- (int64_t)historyTokenOffset;
- (int64_t)localVersion;
- (int64_t)syncVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setCloudVersion:(int64_t)a3;
- (void)setDataType:(id)a3;
- (void)setHistoryToken:(id)a3;
- (void)setHistoryTokenOffset:(int64_t)a3;
- (void)setLocalVersion:(int64_t)a3;
- (void)setSyncVersion:(int64_t)a3;
@end

@implementation BCMutableCloudSyncVersions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_dataType, 0);
}

- (BCMutableCloudSyncVersions)initWithCloudSyncVersions:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCMutableCloudSyncVersions;
  v5 = [(BCMutableCloudSyncVersions *)&v13 init];
  if (v5)
  {
    v6 = [v4 dataType];
    v7 = (NSString *)[v6 copy];
    dataType = v5->_dataType;
    v5->_dataType = v7;

    v5->_cloudVersion = (int64_t)[v4 cloudVersion];
    v5->_localVersion = (int64_t)[v4 localVersion];
    v5->_syncVersion = (int64_t)[v4 syncVersion];
    v9 = [v4 historyToken];
    v10 = (NSPersistentHistoryToken *)[v9 copy];
    historyToken = v5->_historyToken;
    v5->_historyToken = v10;

    v5->_historyTokenOffset = (int64_t)[v4 historyTokenOffset];
  }

  return v5;
}

- (BCMutableCloudSyncVersions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCMutableCloudSyncVersions;
  v5 = [(BCMutableCloudSyncVersions *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataType"];
    [(BCMutableCloudSyncVersions *)v5 setDataType:v6];

    -[BCMutableCloudSyncVersions setCloudVersion:](v5, "setCloudVersion:", [v4 decodeInt64ForKey:@"cloudVersion"]);
    -[BCMutableCloudSyncVersions setLocalVersion:](v5, "setLocalVersion:", [v4 decodeInt64ForKey:@"localVersion"]);
    -[BCMutableCloudSyncVersions setSyncVersion:](v5, "setSyncVersion:", [v4 decodeInt64ForKey:@"syncVersion"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"historyToken"];
    [(BCMutableCloudSyncVersions *)v5 setHistoryToken:v7];

    v5->_historyTokenOffset = (int64_t)[v4 decodeInt64ForKey:@"historyTokenOffset"];
  }

  return v5;
}

- (void)setSyncVersion:(int64_t)a3
{
  self->_syncVersion = a3;
}

- (void)setLocalVersion:(int64_t)a3
{
  self->_localVersion = a3;
}

- (void)setHistoryToken:(id)a3
{
}

- (void)setDataType:(id)a3
{
}

- (void)setCloudVersion:(int64_t)a3
{
  self->_cloudVersion = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(BCMutableCloudSyncVersions *)self dataType];
  [v6 encodeObject:v4 forKey:@"dataType"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[BCMutableCloudSyncVersions cloudVersion](self, "cloudVersion"), @"cloudVersion");
  objc_msgSend(v6, "encodeInt64:forKey:", -[BCMutableCloudSyncVersions localVersion](self, "localVersion"), @"localVersion");
  objc_msgSend(v6, "encodeInt64:forKey:", -[BCMutableCloudSyncVersions syncVersion](self, "syncVersion"), @"syncVersion");
  v5 = [(BCMutableCloudSyncVersions *)self historyToken];
  [v6 encodeObject:v5 forKey:@"historyToken"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[BCMutableCloudSyncVersions historyTokenOffset](self, "historyTokenOffset"), @"historyTokenOffset");
}

- (id)description
{
  v3 = [(BCMutableCloudSyncVersions *)self dataType];
  int64_t v4 = [(BCMutableCloudSyncVersions *)self cloudVersion];
  int64_t v5 = [(BCMutableCloudSyncVersions *)self localVersion];
  int64_t v6 = [(BCMutableCloudSyncVersions *)self syncVersion];
  v7 = [(BCMutableCloudSyncVersions *)self historyToken];
  v8 = +[NSString stringWithFormat:@"dataType: %@, cloudVersion: %lld, localVersion: %lld, syncVersion: %lld historyToken:%@ historyTokenOffset=%lld", v3, v4, v5, v6, v7, [(BCMutableCloudSyncVersions *)self historyTokenOffset]];

  return v8;
}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (int64_t)historyTokenOffset
{
  return self->_historyTokenOffset;
}

- (int64_t)cloudVersion
{
  return self->_cloudVersion;
}

- (int64_t)syncVersion
{
  return self->_syncVersion;
}

- (int64_t)localVersion
{
  return self->_localVersion;
}

- (NSString)dataType
{
  return self->_dataType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setHistoryTokenOffset:(int64_t)a3
{
  self->_historyTokenOffset = a3;
}

@end