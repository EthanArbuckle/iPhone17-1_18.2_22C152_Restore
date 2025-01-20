@interface CPSClipEntryPointRecord
- (CPSClipEntryPointRecord)initWithSQLiteRow:(id)a3;
- (NSString)appClipBundleID;
- (NSString)webClipIdentifier;
- (double)lastABRFetchTime;
- (void)setAppClipBundleID:(id)a3;
- (void)setLastABRFetchTime:(double)a3;
- (void)setWebClipIdentifier:(id)a3;
@end

@implementation CPSClipEntryPointRecord

- (CPSClipEntryPointRecord)initWithSQLiteRow:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSClipEntryPointRecord;
  v5 = [(CPSClipEntryPointRecord *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringAtIndex:0];
    appClipBundleID = v5->_appClipBundleID;
    v5->_appClipBundleID = (NSString *)v6;

    uint64_t v8 = [v4 stringAtIndex:1];
    webClipIdentifier = v5->_webClipIdentifier;
    v5->_webClipIdentifier = (NSString *)v8;

    [v4 doubleAtIndex:2];
    v5->_lastABRFetchTime = v10;
    v11 = v5;
  }

  return v5;
}

- (NSString)appClipBundleID
{
  return self->_appClipBundleID;
}

- (void)setAppClipBundleID:(id)a3
{
}

- (NSString)webClipIdentifier
{
  return self->_webClipIdentifier;
}

- (void)setWebClipIdentifier:(id)a3
{
}

- (double)lastABRFetchTime
{
  return self->_lastABRFetchTime;
}

- (void)setLastABRFetchTime:(double)a3
{
  self->_lastABRFetchTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClipIdentifier, 0);

  objc_storeStrong((id *)&self->_appClipBundleID, 0);
}

@end