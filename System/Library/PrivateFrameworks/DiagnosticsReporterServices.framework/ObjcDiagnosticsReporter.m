@interface ObjcDiagnosticsReporter
+ (void)launchAppWith:(int64_t)a3 options:(id)a4 completion:(id)a5;
- (ObjcDiagnosticsReporter)init;
@end

@implementation ObjcDiagnosticsReporter

+ (void)launchAppWith:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v7);
  id v9 = a4;
  sub_22B56A5B4(a3, v9, ObjCClassMetadata, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
}

- (ObjcDiagnosticsReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiagnosticsReporter();
  return [(ObjcDiagnosticsReporter *)&v3 init];
}

@end