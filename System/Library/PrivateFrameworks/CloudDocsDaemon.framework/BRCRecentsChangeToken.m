@interface BRCRecentsChangeToken
+ (BOOL)supportsSecureCoding;
+ (id)changeTokenFromData:(id)a3;
- (id)description;
- (id)toData;
- (unint64_t)databaseID;
- (unint64_t)notifRank;
- (void)setDatabaseID:(unint64_t)a3;
- (void)setNotifRank:(unint64_t)a3;
@end

@implementation BRCRecentsChangeToken

+ (id)changeTokenFromData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    if ([v3 length] == 16)
    {
      [v4 getBytes:&v9 length:16];
      v5 = objc_opt_new();
      [v5 setNotifRank:v9];
      [v5 setDatabaseID:v10];
      goto LABEL_8;
    }
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid change token format: %@%@", buf, 0x16u);
    }
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)toData
{
  long long v4 = *(_OWORD *)&self->_notifRank;
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:16];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"dbID:%llu rank:%llu", self->_databaseID, self->_notifRank);
}

- (unint64_t)notifRank
{
  return self->_notifRank;
}

- (void)setNotifRank:(unint64_t)a3
{
  self->_notifRank = a3;
}

- (unint64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(unint64_t)a3
{
  self->_databaseID = a3;
}

@end