@interface DROnenessDragMonitorConnection
- (BOOL)_shouldNotifyForSession:(id)a3;
@end

@implementation DROnenessDragMonitorConnection

- (BOOL)_shouldNotifyForSession:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DROnenessDragMonitorConnection;
  if (![(DRDragMonitorConnection *)&v11 _shouldNotifyForSession:v4]) {
    goto LABEL_7;
  }
  if ([v4 originatedFromContinuityDisplay])
  {
    BOOL v5 = 1;
    goto LABEL_8;
  }
  if (qword_1000645F8 != -1) {
    dispatch_once(&qword_1000645F8, &stru_100054D40);
  }
  if (!byte_100064600)
  {
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }
  if (qword_100064608 != -1) {
    dispatch_once(&qword_100064608, &stru_100054D60);
  }
  v7 = (unsigned char *)&unk_100064000;
  if ((byte_100064610 & 1) == 0)
  {
    v8 = sub_100028320();
    v9 = [v8 objectForKey:@"NotifyPhoneMirroringOutsideContinuityShell"];
    v10 = v9;
    if (v9) {
      LOBYTE(v9) = [v9 BOOLValue];
    }
    byte_100064611 = (char)v9;
    byte_100064610 = 1;

    v7 = &unk_100064000;
  }
  BOOL v5 = v7[1553] != 0;
LABEL_8:

  return v5;
}

@end