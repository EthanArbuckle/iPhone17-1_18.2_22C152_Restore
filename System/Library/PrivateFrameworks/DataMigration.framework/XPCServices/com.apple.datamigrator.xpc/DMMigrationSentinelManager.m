@interface DMMigrationSentinelManager
- (BOOL)isSentinelPresent;
- (DMMigrationSentinelManager)initWithFileManager:(id)a3;
- (DMMigrationSentinelManager)initWithFileManager:(id)a3 sentinelPath:(id)a4;
- (void)removeSentinelIfPresent;
@end

@implementation DMMigrationSentinelManager

- (DMMigrationSentinelManager)initWithFileManager:(id)a3
{
  return [(DMMigrationSentinelManager *)self initWithFileManager:a3 sentinelPath:@"/private/var/datamigrator/migrate"];
}

- (DMMigrationSentinelManager)initWithFileManager:(id)a3 sentinelPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMMigrationSentinelManager;
  v9 = [(DMMigrationSentinelManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    objc_storeStrong((id *)&v10->_sentinelPath, a4);
  }

  return v10;
}

- (BOOL)isSentinelPresent
{
  return [(NSFileManager *)self->_fileManager fileExistsAtPath:self->_sentinelPath];
}

- (void)removeSentinelIfPresent
{
  fileManager = self->_fileManager;
  sentinelPath = self->_sentinelPath;
  id v9 = 0;
  unsigned __int8 v4 = [(NSFileManager *)fileManager removeItemAtPath:sentinelPath error:&v9];
  id v5 = v9;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    id v7 = [v5 domain];
    if ([v7 isEqualToString:NSCocoaErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)4) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    _DMLogFunc();
  }
LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentinelPath, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end