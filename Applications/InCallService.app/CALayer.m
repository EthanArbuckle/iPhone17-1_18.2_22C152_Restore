@interface CALayer
+ (void)load;
- (void)_debugSetNeedsLayout;
@end

@implementation CALayer

+ (void)load
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000838A4;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100326110 != -1) {
    dispatch_once(&qword_100326110, block);
  }
}

- (void)_debugSetNeedsLayout
{
  if (!+[NSThread isMainThread])
  {
    v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1001EADC8(v3);
    }
  }
  [(CALayer *)self _debugSetNeedsLayout];
}

@end