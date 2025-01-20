@interface STSizeInvestigationComponent
- (BOOL)hasPathSizingError;
- (BOOL)isAppFound;
- (BOOL)isFetched;
- (BOOL)shouldReturn;
- (NSArray)filePaths;
- (NSNumber)diff;
- (NSNumber)realSizeComputed;
- (NSNumber)reportedSize;
- (STSizeInvestigationComponent)initWithPaths:(id)a3;
- (STStorageApp)app;
- (_DirStats)realSize;
- (id)calculatedString;
- (id)reportedDiff;
- (id)reportedString;
- (id)sizeFormatter:(id)a3;
- (id)sizeFormatter:(id)a3 withSign:(BOOL)a4;
- (id)specifier;
- (void)fetchSize;
- (void)setApp:(id)a3;
- (void)setDiff:(id)a3;
- (void)setFilePaths:(id)a3;
- (void)setHasPathSizingError:(BOOL)a3;
- (void)setIsAppFound:(BOOL)a3;
- (void)setIsFetched:(BOOL)a3;
- (void)setRealSize:(_DirStats *)a3;
- (void)setRealSizeComputed:(id)a3;
- (void)setReportedSize:(id)a3;
@end

@implementation STSizeInvestigationComponent

- (STSizeInvestigationComponent)initWithPaths:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSizeInvestigationComponent;
  v6 = [(STSizeInvestigationComponent *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filePaths, a3);
    *(_WORD *)&v7->_isFetched = 0;
    v7->_hasPathSizingError = 0;
  }

  return v7;
}

- (id)sizeFormatter:(id)a3
{
  return [(STSizeInvestigationComponent *)self sizeFormatter:a3 withSign:0];
}

- (id)sizeFormatter:(id)a3 withSign:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [v5 longLongValue];
  STFormattedSize();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((uint64_t)[v5 longLongValue] >= 1 && v4)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"+%@", v6];

    v6 = (__CFString *)v7;
  }
  if (![v5 longLongValue])
  {

    v6 = @"0B";
  }

  return v6;
}

- (void)fetchSize
{
  v3 = [(STStorageApp *)self->_app appSize];
  id v4 = [v3 fixed];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_filePaths;
  v6 = (char *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        STMSizeOfFileTree();
      }
      uint64_t v7 = (char *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  self->_realSize.used_space = (int64_t)v4;
  self->_realSize.num_files = 0;
  self->_realSize.purgeable_space = 0;
  self->_realSize.num_clones = 0;
  self->_realSize.hasSizingError = 0;
  *(_DWORD *)(&self->_realSize.hasSizingError + 1) = 0;
  *((_DWORD *)&self->_realSize.hasSizingError + 1) = 0;
  v10 = +[NSNumber numberWithLongLong:v4];
  realSizeComputed = self->_realSizeComputed;
  self->_realSizeComputed = v10;

  v12 = +[NSNumber numberWithLongLong:(unsigned char *)[(NSNumber *)self->_realSizeComputed longLongValue]- (unsigned char *)[(NSNumber *)self->_reportedSize longLongValue]];
  diff = self->_diff;
  self->_diff = v12;

  self->_isFetched = 1;
}

- (BOOL)shouldReturn
{
  return self->_isFetched && self->_isAppFound;
}

- (id)specifier
{
  v3 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v3 setProperty:self forKey:@"APP_CASE"];

  return v3;
}

- (id)reportedString
{
  v3 = [(STSizeInvestigationComponent *)self sizeFormatter:self->_reportedSize];
  id v4 = +[NSNumber numberWithLongLong:[(STStorageApp *)self->_app dataContainerSize]];
  id v5 = [(STSizeInvestigationComponent *)self sizeFormatter:v4];

  v6 = +[NSNumber numberWithLongLong:[(STStorageApp *)self->_app sharedContainerSize]];
  uint64_t v7 = [(STSizeInvestigationComponent *)self sizeFormatter:v6];

  uint64_t v8 = +[NSNumber numberWithLongLong:[(STStorageApp *)self->_app externalSize]];
  objc_super v9 = [(STSizeInvestigationComponent *)self sizeFormatter:v8];

  v10 = +[NSNumber numberWithLongLong:(char *)[(STStorageApp *)self->_app dataPurgeableSize]+ (void)[(STStorageApp *)self->_app sharedPurgeableSize]+ (unint64_t)[(STStorageApp *)self->_app externalPurgeableSize]+ (void)[(STStorageApp *)self->_app assetPurgeableSize]];
  v11 = [(STSizeInvestigationComponent *)self sizeFormatter:v10];

  v12 = +[NSString stringWithFormat:@"Reported : %@ (D: %@ / S: %@ / E: %@ / P: %@)", v3, v5, v7, v9, v11];

  return v12;
}

- (id)calculatedString
{
  v3 = [(STSizeInvestigationComponent *)self sizeFormatter:self->_realSizeComputed];
  id v4 = +[NSNumber numberWithLongLong:self->_realSize.used_space];
  id v5 = [(STSizeInvestigationComponent *)self sizeFormatter:v4];

  v6 = +[NSNumber numberWithLongLong:self->_realSize.purgeable_space];
  uint64_t v7 = [(STSizeInvestigationComponent *)self sizeFormatter:v6];

  if (self->_realSize.hasSizingError) {
    CFStringRef v8 = @"/ Potential error";
  }
  else {
    CFStringRef v8 = &stru_2D2C0;
  }
  objc_super v9 = +[NSString stringWithFormat:@"Calculated : %@ (Size: %@ / FSPRG: %@ %@)", v3, v5, v7, v8];

  return v9;
}

- (id)reportedDiff
{
  return [(STSizeInvestigationComponent *)self sizeFormatter:self->_diff withSign:1];
}

- (BOOL)isFetched
{
  return self->_isFetched;
}

- (void)setIsFetched:(BOOL)a3
{
  self->_isFetched = a3;
}

- (BOOL)isAppFound
{
  return self->_isAppFound;
}

- (void)setIsAppFound:(BOOL)a3
{
  self->_isAppFound = a3;
}

- (BOOL)hasPathSizingError
{
  return self->_hasPathSizingError;
}

- (void)setHasPathSizingError:(BOOL)a3
{
  self->_hasPathSizingError = a3;
}

- (NSArray)filePaths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFilePaths:(id)a3
{
}

- (STStorageApp)app
{
  return (STStorageApp *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApp:(id)a3
{
}

- (NSNumber)reportedSize
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReportedSize:(id)a3
{
}

- (_DirStats)realSize
{
  objc_copyStruct(retstr, &self->_realSize, 40, 1, 0);
  return result;
}

- (void)setRealSize:(_DirStats *)a3
{
}

- (NSNumber)realSizeComputed
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRealSizeComputed:(id)a3
{
}

- (NSNumber)diff
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDiff:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diff, 0);
  objc_storeStrong((id *)&self->_realSizeComputed, 0);
  objc_storeStrong((id *)&self->_reportedSize, 0);
  objc_storeStrong((id *)&self->_app, 0);

  objc_storeStrong((id *)&self->_filePaths, 0);
}

@end