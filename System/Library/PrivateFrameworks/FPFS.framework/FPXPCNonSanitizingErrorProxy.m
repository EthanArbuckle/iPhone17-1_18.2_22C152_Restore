@interface FPXPCNonSanitizingErrorProxy
+ (BOOL)sanitizeErrors;
- (_TtC9libfssync28FPXPCNonSanitizingErrorProxy)init;
- (_TtC9libfssync28FPXPCNonSanitizingErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7;
- (_TtC9libfssync28FPXPCNonSanitizingErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8;
- (_TtC9libfssync28FPXPCNonSanitizingErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8 requestDidBegin:(id)a9;
@end

@implementation FPXPCNonSanitizingErrorProxy

+ (BOOL)sanitizeErrors
{
  return 0;
}

- (_TtC9libfssync28FPXPCNonSanitizingErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8
{
  _Block_copy(a8);
  swift_unknownObjectRetain();
  id v10 = a4;
  id v11 = a5;
  result = (_TtC9libfssync28FPXPCNonSanitizingErrorProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9libfssync28FPXPCNonSanitizingErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7 requestWillBegin:(id)a8 requestDidBegin:(id)a9
{
  _Block_copy(a8);
  _Block_copy(a9);
  swift_unknownObjectRetain();
  id v11 = a4;
  id v12 = a5;
  result = (_TtC9libfssync28FPXPCNonSanitizingErrorProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9libfssync28FPXPCNonSanitizingErrorProxy)initWithConnection:(id)a3 protocol:(id)a4 orError:(id)a5 name:(id)a6 requestPid:(int)a7
{
  swift_unknownObjectRetain();
  id v9 = a4;
  id v10 = a5;
  result = (_TtC9libfssync28FPXPCNonSanitizingErrorProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9libfssync28FPXPCNonSanitizingErrorProxy)init
{
  result = (_TtC9libfssync28FPXPCNonSanitizingErrorProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end