@interface ScreeningSoundAndHapticsManager
- (void)announcementFinishedNotification:(id)a3;
@end

@implementation ScreeningSoundAndHapticsManager

- (void)announcementFinishedNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  ScreeningSoundAndHapticsManager.announcementFinishedNotification(_:)(v3);

  swift_release();
}

@end