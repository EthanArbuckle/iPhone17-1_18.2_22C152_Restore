@interface _GCAssertingProfile
- (GCMotion)_motion;
- (NSString)name;
- (_GCAssertingProfile)initWithController:(id)a3;
- (id)productCategory;
- (id)valueChangedHandler;
- (unsigned)sampleRate;
- (void)_legacy_handleEvent:(__IOHIDEvent *)a3;
- (void)setButton:(id)a3 pressed:(BOOL)a4;
- (void)setButton:(id)a3 value:(double)a4;
- (void)setController:(id)a3;
- (void)setDpad:(id)a3 x:(double)a4 y:(double)a5;
- (void)setPlayerIndex:(int64_t)a3;
- (void)set_motion:(id)a3;
@end

@implementation _GCAssertingProfile

- (NSString)name
{
  id v2 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v2);
}

- (GCMotion)_motion
{
  id v2 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v2);
}

- (void)set_motion:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v4);
}

- (_GCAssertingProfile)initWithController:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v4);
}

- (void)setPlayerIndex:(int64_t)a3
{
  id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v3);
}

- (void)setController:(id)a3
{
  id v3 = a3;
  id v4 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v4);
}

- (id)valueChangedHandler
{
  id v2 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v2);
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
  id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v3);
}

- (id)productCategory
{
  id v2 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v2);
}

- (unsigned)sampleRate
{
  id v2 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v2);
}

- (void)setDpad:(id)a3 x:(double)a4 y:(double)a5
{
  id v5 = a3;
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v6);
}

- (void)setButton:(id)a3 value:(double)a4
{
  id v4 = a3;
  id v5 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v5);
}

- (void)setButton:(id)a3 pressed:(BOOL)a4
{
  id v4 = a3;
  id v5 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"GCNamedProfile method called on _GCAssertingProfile" userInfo:0];
  objc_exception_throw(v5);
}

@end