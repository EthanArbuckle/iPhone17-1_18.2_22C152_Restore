@interface DBAudioNotificationManager
- (BOOL)_shouldShowNotificationForService:(id)a3;
- (BOOL)shouldSuspendNotification;
- (DBAudioNotificationManager)initWithWindow:(id)a3 viewController:(id)a4 car:(id)a5;
- (DBAudioWindow)audioWindow;
- (_TtC9DashBoard33DBAudioNotificationViewController)audioViewController;
- (void)setAudioViewController:(id)a3;
- (void)setAudioWindow:(id)a3;
- (void)setShouldSuspendNotification:(BOOL)a3;
- (void)updateObserversForCar:(id)a3;
- (void)volumeService:(id)a3 didUpdateVolume:(unsigned __int8)a4;
@end

@implementation DBAudioNotificationManager

- (DBAudioNotificationManager)initWithWindow:(id)a3 viewController:(id)a4 car:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DBAudioNotificationManager;
  v12 = [(DBAudioNotificationManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioWindow, a3);
    objc_storeStrong((id *)&v13->_audioViewController, a4);
    [(DBAudioNotificationManager *)v13 updateObserversForCar:v11];
  }

  return v13;
}

- (void)updateObserversForCar:(id)a3
{
  v4 = [a3 audioSettings];
  v5 = [v4 volumes];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__DBAudioNotificationManager_updateObserversForCar___block_invoke;
  v6[3] = &unk_2649B4020;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

uint64_t __52__DBAudioNotificationManager_updateObserversForCar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 registerObserver:*(void *)(a1 + 32)];
}

- (void)setShouldSuspendNotification:(BOOL)a3
{
  self->_shouldSuspendNotification = a3;
  if (a3)
  {
    id v3 = [(DBAudioNotificationManager *)self audioViewController];
    [v3 hideNotification];
  }
}

- (void)volumeService:(id)a3 didUpdateVolume:(unsigned __int8)a4
{
  int v4 = a4;
  *(void *)&v11[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(DBAudioNotificationManager *)self _shouldShowNotificationForService:v6];
  v8 = DBLogForCategory(0);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v10 = 67109378;
      v11[0] = v4;
      LOWORD(v11[1]) = 2112;
      *(void *)((char *)&v11[1] + 2) = v6;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Volume updated to: %hhu, for service: %@", (uint8_t *)&v10, 0x12u);
    }

    [(DBAudioWindow *)self->_audioWindow setHidden:0];
    [(DBAudioNotificationViewController *)self->_audioViewController updateForService:v6];
  }
  else
  {
    if (v9)
    {
      int v10 = 138412290;
      *(void *)id v11 = v6;
      _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Can't show audio notification for service: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)_shouldShowNotificationForService:(id)a3
{
  int v4 = [a3 car];
  v5 = [v4 audioSettings];
  char v6 = [v5 receivedAllValues];

  if ((v6 & 1) == 0)
  {
    BOOL v7 = DBLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "AudioSettings has not received all values";
      BOOL v9 = buf;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if ([(DBAudioNotificationManager *)self shouldSuspendNotification])
  {
    BOOL v7 = DBLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      v8 = "Volume notification should be suspended";
      BOOL v9 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)shouldSuspendNotification
{
  return self->_shouldSuspendNotification;
}

- (DBAudioWindow)audioWindow
{
  return self->_audioWindow;
}

- (void)setAudioWindow:(id)a3
{
}

- (_TtC9DashBoard33DBAudioNotificationViewController)audioViewController
{
  return self->_audioViewController;
}

- (void)setAudioViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioViewController, 0);
  objc_storeStrong((id *)&self->_audioWindow, 0);
}

@end