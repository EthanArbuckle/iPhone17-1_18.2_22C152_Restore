@interface FBKFilePromise
+ (id)displaySortDescriptors;
+ (id)entityName;
+ (id)localizedDownloadErrorStringForState:(unint64_t)a3;
+ (unint64_t)downloadStateWithUUID:(id)a3 state:(int64_t)a4 creationDate:(id)a5 contentItem:(id)a6;
- (BOOL)canDelete;
- (BOOL)canDownload;
- (NSString)filename;
- (NSString)localizedDownloadErrorString;
- (int64_t)state;
- (int64_t)status;
- (unint64_t)downloadState;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation FBKFilePromise

+ (id)entityName
{
  return @"FilePromise";
}

- (int64_t)state
{
  [(FBKFilePromise *)self willAccessValueForKey:@"state"];
  v3 = [(FBKFilePromise *)self statusEnum];
  int64_t v4 = [v3 integerValue];

  [(FBKFilePromise *)self didAccessValueForKey:@"state"];
  return v4;
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v20 = a3;
  int64_t v4 = [v20 objectForKeyedSubscript:@"status_enum"];
  v5 = FBKNilIfNSNull(v4);

  if (v5) {
    [(FBKFilePromise *)self setStatusEnum:v5];
  }
  v6 = [v20 objectForKeyedSubscript:@"device_id"];
  v7 = FBKNilIfNSNull(v6);

  if (v7) {
    [(FBKFilePromise *)self setDeviceID:v7];
  }
  v8 = [v20 objectForKeyedSubscript:@"uuid"];
  v9 = FBKNilIfNSNull(v8);

  if (v9) {
    [(FBKFilePromise *)self setUuid:v9];
  }
  v10 = [v20 objectForKeyedSubscript:@"name"];
  v11 = FBKNilIfNSNull(v10);

  if (v11) {
    [(FBKFilePromise *)self setName:v11];
  }
  v12 = [v20 objectForKeyedSubscript:@"size"];
  v13 = FBKNilIfNSNull(v12);

  if (v13) {
    -[FBKFilePromise setSize:](self, "setSize:", [v13 unsignedLongLongValue]);
  }
  v14 = [v20 objectForKeyedSubscript:@"created_at"];
  v15 = FBKNilIfNSNull(v14);

  if (v15)
  {
    v16 = FBKDateFromServerString(v15);
    [(FBKFilePromise *)self setCreatedAt:v16];
  }
  v17 = [v20 objectForKeyedSubscript:@"updated_at"];
  v18 = FBKNilIfNSNull(v17);

  if (v18)
  {
    v19 = FBKDateFromServerString(v18);
    [(FBKFilePromise *)self setUpdatedAt:v19];
  }
}

+ (unint64_t)downloadStateWithUUID:(id)a3 state:(int64_t)a4 creationDate:(id)a5 contentItem:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = v11;
  if (v11 && ![v11 canDownloadFiles])
  {
    unint64_t v14 = 3;
  }
  else
  {
    if (v9) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = a4 == 3;
    }
    unint64_t v14 = v13;
    if (v9)
    {
      if (a4 == 8)
      {
        unint64_t v14 = 2;
      }
      else
      {
        v15 = [MEMORY[0x263EFF910] date];
        [v15 timeIntervalSinceDate:v10];
        double v17 = v16;

        uint64_t v18 = 1;
        if (a4 >= 5) {
          uint64_t v18 = 4 * ((unint64_t)(a4 - 13) < 3);
        }
        if (v17 <= 86400.0) {
          unint64_t v14 = v18;
        }
        else {
          unint64_t v14 = 0;
        }
      }
    }
  }

  return v14;
}

+ (id)localizedDownloadErrorStringForState:(unint64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0uLL:
      int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"CommonStrings";
      v7 = @"FILE_DOWNLOAD_UNAVAILABLE_FOREVER_MESSAGE";
      goto LABEL_5;
    case 1uLL:
      int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"CommonStrings";
      v7 = @"FILE_DOWNLOAD_UNAVAILABLE_MESSAGE";
      goto LABEL_5;
    case 3uLL:
      int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"CommonStrings";
      v7 = @"FILE_DOWNLOAD_UNAVAILABLE_TEAM_FORBIDDEN";
LABEL_5:
      v8 = &stru_26DDF6A30;
      goto LABEL_7;
    case 4uLL:
      int64_t v4 = [MEMORY[0x263F086E0] FeedbackCore];
      v5 = v4;
      v7 = @"FILE_DOWNLOAD_UNAVAILABLE_TEAM_DELETED";
      v8 = @"This file has been deleted.";
      v6 = 0;
LABEL_7:
      v3 = [v4 localizedStringForKey:v7 value:v8 table:v6];

      break;
    default:
      break;
  }

  return v3;
}

+ (id)displaySortDescriptors
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"status" ascending:1];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
  v6[0] = v2;
  v6[1] = v3;
  int64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (NSString)filename
{
  v2 = [(FBKFilePromise *)self name];
  v3 = v2;
  if (!v2) {
    v2 = &stru_26DDF6A30;
  }
  int64_t v4 = v2;

  return v4;
}

- (int64_t)status
{
  v2 = [(FBKFilePromise *)self statusEnum];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)canDownload
{
  return [(FBKFilePromise *)self downloadState] == 2;
}

- (BOOL)canDelete
{
  return [(FBKFilePromise *)self downloadState] == 2;
}

- (unint64_t)downloadState
{
  int64_t v3 = objc_opt_class();
  int64_t v4 = [(FBKFilePromise *)self uuid];
  int64_t v5 = [(FBKFilePromise *)self state];
  v6 = [(FBKFilePromise *)self createdAt];
  v7 = [(FBKFilePromise *)self feedbackFollowup];
  v8 = [v7 feedback];
  id v9 = [v8 contentItem];
  unint64_t v10 = [v3 downloadStateWithUUID:v4 state:v5 creationDate:v6 contentItem:v9];

  return v10;
}

- (NSString)localizedDownloadErrorString
{
  unint64_t v2 = [(FBKFilePromise *)self downloadState];
  int64_t v3 = objc_opt_class();

  return (NSString *)[v3 localizedDownloadErrorStringForState:v2];
}

- (void)setState:(int64_t)a3
{
  self->state = a3;
}

@end