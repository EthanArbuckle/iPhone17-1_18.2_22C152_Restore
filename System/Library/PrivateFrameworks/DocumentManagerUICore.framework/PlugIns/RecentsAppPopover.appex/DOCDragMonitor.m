@interface DOCDragMonitor
- (BOOL)isItemCollectionDragActive;
- (_TtC17RecentsAppPopover14DOCDragMonitor)init;
- (void)setIsItemCollectionDragActive:(BOOL)a3;
@end

@implementation DOCDragMonitor

- (BOOL)isItemCollectionDragActive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover14DOCDragMonitor_isItemCollectionDragActive);
}

- (void)setIsItemCollectionDragActive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover14DOCDragMonitor_isItemCollectionDragActive) = a3;
}

- (_TtC17RecentsAppPopover14DOCDragMonitor)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover14DOCDragMonitor_isItemCollectionDragActive) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCDragMonitor();
  return [(DOCDragMonitor *)&v3 init];
}

@end