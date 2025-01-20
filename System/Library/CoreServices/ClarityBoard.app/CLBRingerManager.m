@interface CLBRingerManager
- (BOOL)isMuted;
- (CLBRingerManager)init;
- (void)_updateAVSystemController;
- (void)setIsMuted:(BOOL)a3;
@end

@implementation CLBRingerManager

- (CLBRingerManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)CLBRingerManager;
  v2 = [(CLBRingerManager *)&v17 init];
  if (v2)
  {
    v3 = +[CLFSettings sharedInstance];
    unsigned __int8 v4 = [v3 silentModeToggleEnabled];

    if (v4)
    {
      if (AXDeviceIsRingerSwitchAvailable())
      {
        v2->_BOOL isMuted = BKSHIDServicesGetRingerState() == 0;
        v5 = +[CLFLog commonLog];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          BOOL isMuted = v2->_isMuted;
          *(_DWORD *)buf = 67109120;
          BOOL v19 = isMuted;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initial ringer switch state is muted: %i", buf, 8u);
        }
LABEL_18:

        goto LABEL_19;
      }
      if (AXDeviceHasStaccato())
      {
        v9 = +[AVSystemController sharedAVSystemController];
        p_BOOL isMuted = &v2->_isMuted;
        id v16 = 0;
        unsigned __int8 v11 = [v9 getSilentMode:&v2->_isMuted error:&v16];
        v5 = v16;

        if ((v11 & 1) == 0)
        {
          v12 = +[CLFLog commonLog];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1000FFE34((uint64_t)v5, v12);
          }

          *p_BOOL isMuted = 0;
        }
        v13 = +[CLFLog commonLog];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v14 = *p_isMuted;
          *(_DWORD *)buf = 67109120;
          BOOL v19 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Initial silent mode state (for action button) is muted: %i", buf, 8u);
        }

        goto LABEL_18;
      }
      v7 = +[CLFLog commonLog];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "No ringer switch or action button. Unmuting.";
        goto LABEL_8;
      }
    }
    else
    {
      v7 = +[CLFLog commonLog];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Toggling Silent Mode is not allowed. Unmuting.";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      }
    }

    v2->_BOOL isMuted = 0;
LABEL_19:
    [(CLBRingerManager *)v2 _updateAVSystemController];
  }
  return v2;
}

- (void)setIsMuted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[CLFSettings sharedInstance];
  unsigned __int8 v6 = [v5 silentModeToggleEnabled];

  if ((v6 & 1) == 0)
  {
    v7 = +[CLFLog commonLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1000FFEAC(v7);
    }
  }
  if (self->_isMuted != v3)
  {
    self->_BOOL isMuted = v3;
    [(CLBRingerManager *)self _updateAVSystemController];
  }
}

- (void)_updateAVSystemController
{
  id v3 = +[AVSystemController sharedAVSystemController];
  [v3 setSilentMode:self->_isMuted untilTime:0 reason:@"ClarityBoard-CLBRingerManager" clientType:4];
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

@end