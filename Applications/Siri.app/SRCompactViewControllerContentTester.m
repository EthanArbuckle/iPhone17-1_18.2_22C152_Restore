@interface SRCompactViewControllerContentTester
- (BOOL)hasContentForState:(id)a3;
@end

@implementation SRCompactViewControllerContentTester

- (BOOL)hasContentForState:(id)a3
{
  id v3 = a3;
  if ([v3 keyboardHasContent])
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      v5 = "%s #compact:Returning YES because the keyboard has content";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, 0xCu);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  if ([v3 navigationStackIsPopping]
    && (([v3 deviceIsPad] & 1) != 0
     || [v3 navigationBarHasContent]))
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      v5 = "%s #compact:Returning YES because snippet is being popped from the view stack";
      goto LABEL_29;
    }
LABEL_30:
    unsigned __int8 v8 = 1;
    goto LABEL_31;
  }
  if ((uint64_t)[v3 navigationStackSize] < 2)
  {
    if ([v3 editableUtteranceViewHasContent])
    {
      v4 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because point is in tap2edit view";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if ([v3 compactViewHasContent])
    {
      v4 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because point is in Compact View";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if ([v3 siriViewControllerIsEditing])
    {
      v4 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because a siri view controller is editing";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    unsigned int v9 = [v3 contextMenuIsPresented];
    v4 = AFSiriLogContextConnection;
    BOOL v10 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        int v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because a UIContextMenu is currently present";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if (v10)
    {
      int v12 = 136315138;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #compact:Returning NO because point is outside Siri content", (uint8_t *)&v12, 0xCu);
    }
    unsigned __int8 v8 = 0;
  }
  else
  {
    if (([v3 deviceIsPad] & 1) == 0
      && [v3 navigationBarHasContent])
    {
      v4 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        v5 = "%s #compact:Returning YES because point is in the navigation bar for multilevel content in phone";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      int v12 = 136315394;
      v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      __int16 v14 = 1024;
      unsigned int v15 = [v3 multiLevelViewHasContent];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact:Returning %d because pointis in multi level card", (uint8_t *)&v12, 0x12u);
    }
    unsigned __int8 v8 = [v3 multiLevelViewHasContent];
  }
LABEL_31:

  return v8;
}

@end