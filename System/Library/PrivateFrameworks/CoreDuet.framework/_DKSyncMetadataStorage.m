@interface _DKSyncMetadataStorage
+ (id)bookmarkStreamNameWithSourceDeviceID:(uint64_t)a1;
+ (id)eventFromFetchedWindow:(void *)a3 windowStreamName:(void *)a4 transportName:;
+ (id)eventFromStartDate:(void *)a3 endDate:(void *)a4 bookmarkStreamName:(void *)a5 transportName:;
+ (id)windowStreamNameWithSourceDeviceID:(uint64_t)a1;
@end

@implementation _DKSyncMetadataStorage

+ (id)eventFromFetchedWindow:(void *)a3 windowStreamName:(void *)a4 transportName:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  self;
  v9 = +[_DKAnyStringIdentifier type];
  v10 = +[_DKEventStream eventStreamWithName:v7 valueType:v9];

  v11 = [MEMORY[0x1E4F1C9C8] date];
  v12 = -[_DKSyncWindow startDate]((uint64_t)v8);
  v13 = -[_DKSyncType urgency]((uint64_t)v8);

  v14 = +[_DKEvent eventWithStream:v10 startDate:v12 endDate:v13 identifierStringValue:v6 metadata:0];

  [v14 setCreationDate:v11];
  return v14;
}

+ (id)windowStreamNameWithSourceDeviceID:(uint64_t)a1
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v6[0] = @"/knowledge-sync-addition-window";
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [NSString pathWithComponents:v3];

  return v4;
}

+ (id)bookmarkStreamNameWithSourceDeviceID:(uint64_t)a1
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v6[0] = @"/knowledge-sync-deletion-bookmark";
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [NSString pathWithComponents:v3];

  return v4;
}

+ (id)eventFromStartDate:(void *)a3 endDate:(void *)a4 bookmarkStreamName:(void *)a5 transportName:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  self;
  v12 = +[_DKAnyStringIdentifier type];
  v13 = +[_DKEventStream eventStreamWithName:v9 valueType:v12];

  v14 = [MEMORY[0x1E4F1C9C8] date];
  v15 = +[_DKEvent eventWithStream:v13 startDate:v11 endDate:v10 identifierStringValue:v8 metadata:0];

  [v15 setCreationDate:v14];
  return v15;
}

@end