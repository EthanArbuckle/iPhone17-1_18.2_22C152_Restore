@interface _CKVideoMessageRecordingWindow
- (BOOL)_canAffectStatusBarAppearance;
- (_CKVideoMessageRecordingWindow)initWithFrame:(CGRect)a3;
@end

@implementation _CKVideoMessageRecordingWindow

- (_CKVideoMessageRecordingWindow)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_CKVideoMessageRecordingWindow;
  v3 = -[_CKVideoMessageRecordingWindow initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_CKVideoMessageRecordingWindow *)v3 setBecomeKeyOnOrderFront:0];
    v5 = +[CKUIBehavior sharedBehaviors];
    [v5 videoControllerWindowLevel];
    -[_CKVideoMessageRecordingWindow setWindowLevel:](v4, "setWindowLevel:");

    [(_CKVideoMessageRecordingWindow *)v4 setClipsToBounds:1];
  }
  return v4;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

@end