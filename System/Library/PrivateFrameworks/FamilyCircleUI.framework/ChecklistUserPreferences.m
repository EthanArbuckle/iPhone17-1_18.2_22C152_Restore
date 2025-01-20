@interface ChecklistUserPreferences
- (void)handleChangeWithNotification:(id)a3;
@end

@implementation ChecklistUserPreferences

- (void)handleChangeWithNotification:(id)a3
{
  uint64_t v3 = sub_218CAC618();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218CAC608();
  swift_retain();
  sub_218A53BF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end