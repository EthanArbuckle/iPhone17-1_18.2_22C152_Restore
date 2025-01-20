@interface IMDPlainTextTapbackInterpreter
- (IMDPlainTextTapbackInterpreter)init;
- (id)interpretMessageItem:(id)a3 inChat:(id)a4;
@end

@implementation IMDPlainTextTapbackInterpreter

- (IMDPlainTextTapbackInterpreter)init
{
  sub_1D98BC9A8();
  return result;
}

- (id)interpretMessageItem:(id)a3 inChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  IMDPlainTextTapbackInterpreter.interpretMessageItem(_:in:)(v6, v7);
  v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end