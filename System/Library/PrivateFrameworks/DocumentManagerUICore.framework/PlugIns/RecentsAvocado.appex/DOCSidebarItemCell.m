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
  sub_1000B46D8((uint64_t)v5);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000B25A4(v4);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  if (!swift_unknownObjectWeakLoadStrong()) {
    return 0;
  }
  if (*(void *)((char *)self + qword_100629CB0) || (*((unsigned char *)self + qword_100629C98) & 1) != 0) {
    char v4 = 1;
  }
  else {
    char v4 = *((unsigned char *)self + qword_100629CA0);
  }
  swift_unknownObjectRelease();
  return v4;
}

- (void)ejectionStateDidChange
{
  v2 = self;
  sub_1000B0538();
}

@end