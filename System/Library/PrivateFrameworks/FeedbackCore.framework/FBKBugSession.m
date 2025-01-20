@interface FBKBugSession
+ (id)bugSessionWithDEDBugSession:(id)a3 inContext:(id)a4;
+ (id)entityName;
- (BOOL)hasNumberOfBytesToUpload;
- (id)deviceFromManager:(id)a3;
@end

@implementation FBKBugSession

- (id)deviceFromManager:(id)a3
{
  id v4 = a3;
  v5 = [(FBKBugSession *)self deviceIdentifier];
  v6 = deviceWithIdentifier(v5, v4);

  return v6;
}

- (BOOL)hasNumberOfBytesToUpload
{
  v3 = [(FBKBugSession *)self bytesToUpload];
  if (v3)
  {
    id v4 = [(FBKBugSession *)self bytesToUpload];
    BOOL v5 = [v4 integerValue] > 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)bugSessionWithDEDBugSession:(id)a3 inContext:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF240];
  id v7 = a4;
  id v8 = a3;
  v9 = [a1 entityName];
  v10 = [v6 insertNewObjectForEntityForName:v9 inManagedObjectContext:v7];

  v11 = [v8 identifier];
  [v10 setIdentifier:v11];

  v12 = [v8 deviceIdentifier];

  [v10 setDeviceIdentifier:v12];
  [v10 setState:0];

  return v10;
}

+ (id)entityName
{
  return @"BugSession";
}

@end