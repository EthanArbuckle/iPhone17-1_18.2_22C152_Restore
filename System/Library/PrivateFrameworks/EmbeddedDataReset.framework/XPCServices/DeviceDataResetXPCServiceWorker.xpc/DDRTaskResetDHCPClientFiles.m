@interface DDRTaskResetDHCPClientFiles
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetDHCPClientFiles

- (void)run
{
  id v2 = +[NSArray array];
  removeSubFiles(@"/var/db/dhcpclient", v2);
}

- (double)estimatedTimeOfCompletion
{
  return 0.2;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetDHCPClientFiles";
}

@end