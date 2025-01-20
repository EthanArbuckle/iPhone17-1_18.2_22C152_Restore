@interface RecentItemContactsViewControllerDelegate
- (_TtC15ConversationKit40RecentItemContactsViewControllerDelegate)init;
- (void)contactViewController:(id)a3 didExecuteBlockAndReportContactAction:(id)a4;
@end

@implementation RecentItemContactsViewControllerDelegate

- (void)contactViewController:(id)a3 didExecuteBlockAndReportContactAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  RecentItemContactsViewControllerDelegate.contactViewController(_:didExecuteBlockAndReportContactAction:)((CNContactViewController_optional *)v8, v10);
}

- (_TtC15ConversationKit40RecentItemContactsViewControllerDelegate)init
{
}

- (void).cxx_destruct
{
  outlined destroy of RecentsCallItem((uint64_t)self + OBJC_IVAR____TtC15ConversationKit40RecentItemContactsViewControllerDelegate_callItemToBlock, (void (*)(void))type metadata accessor for RecentsCallItem);
  swift_release();
}

@end