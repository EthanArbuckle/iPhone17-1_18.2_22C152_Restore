@interface IMDSpotlightIndexDelegate
+ (id)sharedInstance;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation IMDSpotlightIndexDelegate

+ (id)sharedInstance
{
  if (qword_1EBE2B7F8 != -1) {
    dispatch_once(&qword_1EBE2B7F8, &unk_1F3392460);
  }
  if (qword_1EBE2B908 != -1) {
    dispatch_once(&qword_1EBE2B908, &unk_1F3392480);
  }
  if (qword_1EBE2B918 != -1) {
    dispatch_once(&qword_1EBE2B918, &unk_1F33924A0);
  }
  v2 = (void *)qword_1EBE2BA48;

  return v2;
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(void))a4;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Got the callback for reindex", v8, 2u);
    }
  }
  IMDCoreSpotlightSetNeedsMessageReindex();
  if (v6) {
    v6[2](v6);
  }
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Got the callback for reindex", v11, 2u);
    }
  }
  IMDCoreSpotlightSetNeedsMessageReindex();
  if (v9) {
    v9[2](v9);
  }
}

@end