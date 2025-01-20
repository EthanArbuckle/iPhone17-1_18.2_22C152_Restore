@interface KeyboardObserver
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
@end

@implementation KeyboardObserver

- (void)keyboardWillShow:(id)a3
{
  uint64_t v3 = sub_2180CF4F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180CF4D0();
  swift_retain();
  sub_2180C1DC8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)keyboardWillHide:(id)a3
{
  uint64_t v3 = sub_2180CF4F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2180CF4D0();
  swift_getKeyPath();
  swift_getKeyPath();
  v7[1] = 0;
  swift_retain();
  sub_2180CF730();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end