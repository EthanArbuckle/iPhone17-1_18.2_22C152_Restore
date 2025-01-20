@interface NicknameTextField.Coordinator
- (BOOL)nicknameShouldBeginEditing;
- (_TtCV12GameCenterUIP33_3C5A4F43D1BCC319589942A954EC7ED117NicknameTextField11Coordinator)init;
- (_TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator)init;
- (void)dealloc;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)nicknameDidBecomeFirstResponder;
- (void)nicknameDidResignFirstResponder;
- (void)nicknameTextDidChangeWithMessage:(id)a3;
- (void)nicknameUpdateAvatarImage:(id)a3;
- (void)nicknameUpdateRequestCompletedWithStatus:(id)a3 error:(id)a4;
- (void)nicknameWillbeginUpdating;
@end

@implementation NicknameTextField.Coordinator

- (void)dealloc
{
  v2 = self;
  sub_1AF632F6C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator_nicknameController));

  swift_release();
}

- (void)keyboardWillShow:(id)a3
{
}

- (void)keyboardWillHide:(id)a3
{
}

- (BOOL)nicknameShouldBeginEditing
{
  v2 = self;
  char v3 = sub_1AF633398();

  return v3 & 1;
}

- (void)nicknameDidBecomeFirstResponder
{
  v2 = self;
  sub_1AF633458();
}

- (void)nicknameDidResignFirstResponder
{
  v2 = self;
  sub_1AF633534();
}

- (void)nicknameWillbeginUpdating
{
  v2 = self;
  sub_1AF6337BC();
}

- (void)nicknameUpdateAvatarImage:(id)a3
{
  sub_1AF7AE0E0();
  v4 = self;
  sub_1AF39DC7C();
  swift_bridgeObjectRelease();
}

- (void)nicknameUpdateRequestCompletedWithStatus:(id)a3 error:(id)a4
{
  if (a3)
  {
    uint64_t v6 = sub_1AF7AE0E0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a4;
  v10 = self;
  sub_1AF633868(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)nicknameTextDidChangeWithMessage:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AF7AE0E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  sub_1AF634100(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtCV12GameCenterUIP33_3C5A4F43D1BCC319589942A954EC7ED117NicknameTextField11Coordinator)init
{
}

- (_TtCV12GameCenterUIP33_71E88C93E9376CB5FC37AECD01F72ACD17NicknameTextField11Coordinator)init
{
}

@end