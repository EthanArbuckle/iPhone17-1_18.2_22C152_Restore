@interface VoiceOverManager
- (void)announcementFinished:(id)a3;
@end

@implementation VoiceOverManager

- (void)announcementFinished:(id)a3
{
  uint64_t v4 = sub_2347ED1C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2347ED1B0();
  self->isAnnouncingNewScanItems[0] = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end