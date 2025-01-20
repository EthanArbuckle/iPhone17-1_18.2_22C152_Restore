@interface DOCHistoryNavigationButtonItem
- (BOOL)isEnabled;
- (_TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem)init;
- (_TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem)initWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation DOCHistoryNavigationButtonItem

- (_TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem_direction) = 2;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem_canEnable) = 1;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem_canPerformShiftAction) = 0;
  id v4 = a3;

  result = (_TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (_TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem)init
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem_direction) = 2;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem_canEnable) = 1;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service30DOCHistoryNavigationButtonItem_canPerformShiftAction) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCHistoryNavigationButtonItem();
  return [(DOCHistoryNavigationButtonItem *)&v3 init];
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCHistoryNavigationButtonItem();
  return [(DOCHistoryNavigationButtonItem *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCHistoryNavigationButtonItem();
  [(DOCHistoryNavigationButtonItem *)&v4 setEnabled:v3];
}

@end