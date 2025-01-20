@interface DOCSidebarItemCell
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (void)ejectionStateDidChange;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation DOCSidebarItemCell

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BF244((uint64_t)v5);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BD080(v4);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  if (!swift_unknownObjectWeakLoadStrong()) {
    return 0;
  }
  if (*(void *)((char *)self + qword_1006196B0) || (*((unsigned char *)self + qword_100619698) & 1) != 0) {
    char v4 = 1;
  }
  else {
    char v4 = *((unsigned char *)self + qword_1006196A0);
  }
  swift_unknownObjectRelease();
  return v4;
}

- (void)ejectionStateDidChange
{
  v2 = self;
  sub_1000BB014();
}

@end