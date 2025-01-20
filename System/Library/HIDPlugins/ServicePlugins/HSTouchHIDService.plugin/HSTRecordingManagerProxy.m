@interface HSTRecordingManagerProxy
- (BOOL)saveRecording:(id)a3;
@end

@implementation HSTRecordingManagerProxy

- (BOOL)saveRecording:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  v5 = +[NSArray arrayWithObjects:&v8 count:1];
  v6 = [(HSTRecordingManagerProxy *)self HSTRecordingManagerProxy_saveRecording:v5];

  LOBYTE(self) = [v6 BOOLValue];
  return (char)self;
}

@end