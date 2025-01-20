@interface FBKFilePromiseStub
+ (id)entityName;
+ (id)fetchRequest;
- (BOOL)canDelete;
- (BOOL)canDownload;
- (NSString)filename;
- (NSString)localizedDownloadErrorString;
- (unint64_t)downloadState;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKFilePromiseStub

+ (id)entityName
{
  return @"FilePromiseStub";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"status_enum"];
  FBKNilIfNSNull(v5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  -[FBKFilePromiseStub setStatusEnum:](self, "setStatusEnum:", [v12 longValue]);
  v6 = [v4 objectForKeyedSubscript:@"created_at"];
  v7 = FBKDateFromServerString(v6);
  [(FBKFilePromiseStub *)self setCreatedAt:v7];

  v8 = [v4 objectForKeyedSubscript:@"uuid"];
  v9 = FBKNilIfNSNull(v8);
  [(FBKFilePromiseStub *)self setUuid:v9];

  v10 = [v4 objectForKeyedSubscript:@"name"];

  v11 = FBKNilIfNSNull(v10);
  [(FBKFilePromiseStub *)self setName:v11];
}

- (unint64_t)downloadState
{
  v3 = [(FBKFilePromiseStub *)self UUID];
  int64_t v4 = [(FBKFilePromiseStub *)self status];
  v5 = [(FBKFilePromiseStub *)self createdAt];
  v6 = [(FBKFilePromiseStub *)self formResponseStub];
  v7 = [v6 contentItem];
  unint64_t v8 = +[FBKFilePromise downloadStateWithUUID:v3 state:v4 creationDate:v5 contentItem:v7];

  return v8;
}

- (NSString)filename
{
  v2 = [(FBKFilePromiseStub *)self name];
  v3 = v2;
  if (!v2) {
    v2 = &stru_26DDF6A30;
  }
  int64_t v4 = v2;

  return v4;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"FilePromiseStub"];
}

- (BOOL)canDownload
{
  return [(FBKFilePromiseStub *)self downloadState] == 2;
}

- (BOOL)canDelete
{
  return [(FBKFilePromiseStub *)self downloadState] == 2;
}

- (NSString)localizedDownloadErrorString
{
  unint64_t v2 = [(FBKFilePromiseStub *)self downloadState];

  return (NSString *)+[FBKFilePromise localizedDownloadErrorStringForState:v2];
}

@end