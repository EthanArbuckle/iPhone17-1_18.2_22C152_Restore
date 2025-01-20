@interface DaemonStartupTask
- (id)perform;
@end

@implementation DaemonStartupTask

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E12C;
  v4[3] = &unk_1000385C8;
  v4[4] = self;
  v2 = [(DaemonStartupTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

@end