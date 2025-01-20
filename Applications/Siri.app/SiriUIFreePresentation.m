@interface SiriUIFreePresentation
- (BOOL)shouldDismissForIdling;
- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3;
- (BOOL)supportsVisualPresentationForConversationItem:(id)a3;
- (SiriUIFreePresentation)initWithDelegate:(id)a3 dataSource:(id)a4;
- (SiriUIFreePresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6;
- (SiriUIPresentationDataSource)dataSource;
- (SiriUIPresentationDelegate)delegate;
- (double)idleTimerInterval;
- (int64_t)options;
- (void)_didPresentItemsAtIndexPaths:(id)a3;
- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4;
- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4;
- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldSuppressErrorTTS:(BOOL)a3;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriDidDeactivate;
- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4;
- (void)siriRequestWillStartWithRequestOptions:(id)a3;
@end

@implementation SiriUIFreePresentation

- (SiriUIFreePresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  return [(SiriUIFreePresentation *)self initWithNibName:0 bundle:0 delegate:a3 dataSource:a4];
}

- (SiriUIFreePresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v13.receiver = self;
  v13.super_class = (Class)SiriUIFreePresentation;
  v10 = [(SiriUIFreePresentation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(SiriUIFreePresentation *)v10 setDelegate:v8];
    [(SiriUIFreePresentation *)v11 setDataSource:v9];
    v11->_idleTimeoutInSec = 9.0;
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (!self->_hasReportedPresentation)
    {
      v6 = [(SiriUIFreePresentation *)self delegate];
      [v6 siriPresentationDidPresentUserInterface:self];

      v5 = obj;
      self->_hasReportedPresentation = 1;
    }
  }
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  id v5 = +[AFUISiriSession availabilityState];
  if (v5 && !self->_shouldSuppressErrorTTS)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = v8;
    if (v5 == (id)2)
    {
      v10 = +[NSBundle afui_assistantUIFrameworkBundle];
      uint64_t v11 = [v10 siriUILocalizedStringForKey:@"ASSISTANT_FIRST_UNLOCK_TITLE" value:@"Enter Passcode to Use Siri" table:0];
    }
    else
    {
      v10 = [v8 siriUILocalizedStringForKey:@"ASSISTANT_NOT_AVAILABLE_TITLE"];
      v12 = [(SiriUIFreePresentation *)self delegate];
      [v12 siriPresentation:self synthesizeSpeechWithText:v10 completion:0];

      if (v5 == (id)3)
      {
        v14 = +[UIDevice currentDevice];
        unsigned int v15 = [v14 sf_isChinaRegionCellularDevice];

        if (v15) {
          CFStringRef v13 = @"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION_CHINA";
        }
        else {
          CFStringRef v13 = @"ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION";
        }
      }
      else
      {
        if (v5 != (id)1)
        {
LABEL_15:
          v17 = [(SiriUIFreePresentation *)self delegate];
          [v17 siriPresentation:self synthesizeSpeechWithText:v10 completion:0];

          goto LABEL_16;
        }
        CFStringRef v13 = @"ASSISTANT_NO_NETWORK_SUBTITLE";
      }
      uint64_t v11 = [v9 siriUILocalizedStringForKey:v13];
    }
    v16 = (void *)v11;

    v10 = v16;
    goto LABEL_15;
  }
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL shouldSuppressErrorTTS = self->_shouldSuppressErrorTTS;
    int v19 = 136315906;
    v20 = "-[SiriUIFreePresentation siriDidActivateFromSource:]";
    __int16 v21 = 2048;
    int64_t v22 = a3;
    __int16 v23 = 2048;
    id v24 = v5;
    __int16 v25 = 1024;
    BOOL v26 = shouldSuppressErrorTTS;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Suppressing error TTS. source : %ld, availability : %lu, _shouldSuppressErrorTTS : %d", (uint8_t *)&v19, 0x26u);
  }
LABEL_16:
  v18 = [(SiriUIFreePresentation *)self delegate];
  [v18 enableIdleTimerForSiriPresentation:self];
}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  self->_shouldResumeMediaOnIdle = 0;
  id v4 = [a3 requestSource];
  if (v4 == (id)42 || v4 == (id)26)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      v7 = "-[SiriUIFreePresentation siriRequestWillStartWithRequestOptions:]";
      __int16 v8 = 2048;
      uint64_t v9 = 0x4000000000000000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #uifree Adjusting ui free idle timer to %f seconds for user interaction request source", (uint8_t *)&v6, 0x16u);
    }
    self->_idleTimeoutInSec = 2.0;
  }
  self->_shouldPauseAutoDismissal = 0;
}

- (void)siriDidDeactivate
{
  id v3 = [(SiriUIFreePresentation *)self delegate];
  [v3 disableIdleTimerForSiriPresentation:self];
}

- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  int v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    __int16 v8 = "-[SiriUIFreePresentation conversation:didInsertItemsAtIndexPaths:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  [(SiriUIFreePresentation *)self _didPresentItemsAtIndexPaths:v5];
}

- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4
{
}

- (void)_didPresentItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUIFreePresentation *)self dataSource];
  int v6 = [v5 conversationIdentifiersForSiriPresentation:self];
  int v7 = [v6 lastObject];

  __int16 v8 = [(SiriUIFreePresentation *)self dataSource];
  uint64_t v9 = [v8 siriPresentation:self conversationWithIdentifier:v7];

  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      unsigned int v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [v9 itemAtIndexPath:*(void *)(*((void *)&v19 + 1) + 8 * (void)v15) v19];
        v17 = [v16 identifier];
        [v10 addObject:v17];

        unsigned int v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  v18 = [(SiriUIFreePresentation *)self delegate];
  [v18 siriPresentation:self didPresentConversationItemsWithIdentifiers:v10];
}

- (double)idleTimerInterval
{
  return self->_idleTimeoutInSec;
}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  id v5 = a3;
  if ([v5 premptivelyResumeMedia])
  {
    int v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[SiriUIFreePresentation handleRequestEndBehavior:isAttending:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Presentation will resume media on idle", (uint8_t *)&v13, 0xCu);
    }
    self->_shouldResumeMediaOnIdle = 1;
  }
  int v7 = [v5 minimumAutoDismissalTimeInMs];

  if (v7)
  {
    __int16 v8 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      v10 = [v5 minimumAutoDismissalTimeInMs];
      id v11 = [v10 longValue];
      int v13 = 136315394;
      uint64_t v14 = "-[SiriUIFreePresentation handleRequestEndBehavior:isAttending:]";
      __int16 v15 = 2048;
      id v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Setting delay dismissal for ui free presentation by %ld milliseconds.", (uint8_t *)&v13, 0x16u);
    }
    id v12 = [v5 minimumAutoDismissalTimeInMs];
    self->_idleTimeoutInSec = (double)(uint64_t)[v12 longValue] / 1000.0;
  }
}

- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  return self->_shouldResumeMediaOnIdle;
}

- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4
{
  switch(a4)
  {
    case 13:
      int v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #uifree Speech was mitigated as side speech, dismissing", (uint8_t *)&v9, 0xCu);
      }
      self->_shouldPauseAutoDismissal = 0;
      int v7 = [(SiriUIFreePresentation *)self delegate];
      [v7 dismissSiriPresentation:self withReason:46];

      break;
    case 12:
      __int16 v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #uifree Speech directed siri speech detected, unpausing auto dismissal", (uint8_t *)&v9, 0xCu);
      }
      self->_shouldPauseAutoDismissal = 0;
      break;
    case 11:
      id v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #uifree Speech start detected, pausing auto dismissal", (uint8_t *)&v9, 0xCu);
      }
      self->_shouldPauseAutoDismissal = 1;
      break;
  }
}

- (BOOL)shouldDismissForIdling
{
  return !self->_shouldPauseAutoDismissal;
}

- (void)setShouldSuppressErrorTTS:(BOOL)a3
{
  self->_BOOL shouldSuppressErrorTTS = a3;
}

- (int64_t)options
{
  return 4;
}

- (BOOL)supportsVisualPresentationForConversationItem:(id)a3
{
  return 0;
}

- (SiriUIPresentationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SiriUIPresentationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (SiriUIPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriUIPresentationDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end