@interface RunningBoardAssertion
- (_TtC16MusicRecognition21RunningBoardAssertion)init;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertionWillInvalidate:(id)a3;
@end

@implementation RunningBoardAssertion

- (void)assertionWillInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000E1FA0(v4);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1000E216C(v6, (uint64_t)a4);
}

- (_TtC16MusicRecognition21RunningBoardAssertion)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicRecognition21RunningBoardAssertion_assertion) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(RunningBoardAssertion *)&v5 init];
}

- (void).cxx_destruct
{
}

@end