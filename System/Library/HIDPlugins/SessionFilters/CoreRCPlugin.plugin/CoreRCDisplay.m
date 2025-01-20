@interface CoreRCDisplay
- (BOOL)sleepDisplay:(BOOL)a3;
- (BOOL)wakeDisplay;
- (CoreRCDisplay)initWithCECBus:(id)a3 onQueue:(id)a4 displayAsleep:(BOOL)a5;
- (id)addCECDeviceToBus:(id)a3 error:(id *)a4;
- (id)cecBus;
- (void)bus:(id)a3 deviceHasBeenRemoved:(id)a4;
- (void)cecBus:(id)a3 linkStateHasBeenUpdated:(BOOL)a4;
- (void)cecDevice:(id)a3 activeSourceStatusHasChanged:(BOOL)a4;
- (void)cecDeviceShouldAssertActiveSource:(id)a3;
- (void)removeBus;
@end

@implementation CoreRCDisplay

- (id)cecBus
{
  return self->_cecBus;
}

- (CoreRCDisplay)initWithCECBus:(id)a3 onQueue:(id)a4 displayAsleep:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_queue, a4);
  self->_isDisplayAsleep = a5;
  objc_storeStrong((id *)&self->_cecBus, a3);
  [(CoreCECBus *)self->_cecBus setDelegate:self];
  v11 = CoreRCPluginLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    cecBus = self->_cecBus;
    *(_DWORD *)buf = 138412290;
    v26 = cecBus;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "CEC bus has been added (%@)", buf, 0xCu);
  }

  v13 = self->_cecBus;
  id v24 = 0;
  v14 = [(CoreRCDisplay *)self addCECDeviceToBus:v13 error:&v24];
  id v15 = v24;
  if (v14)
  {
    queue = self->_queue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_6B18;
    v22[3] = &unk_C398;
    v23 = self;
    dispatch_async(queue, v22);
    v17 = CoreRCPluginLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Successfully added CEC device (%@)", buf, 0xCu);
    }

    p_super = &v23->super;
  }
  else
  {
    p_super = CoreRCPluginLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_8AE0();
    }
  }

  v19 = +[NSUserDefaults cecUserDefaults];
  self->_cecActiveSourceRecentlySentDuration = (unint64_t)[v19 cecActiveSourceRecentlySentDuration];

  v20 = self;
  return v20;
}

- (void)removeBus
{
  if (self->_cecDevice)
  {
    v3 = CoreRCPluginLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      cecDevice = self->_cecDevice;
      int v7 = 138412290;
      v8 = cecDevice;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Removing CEC device (%@)", (uint8_t *)&v7, 0xCu);
    }

    [(CoreCECDevice *)self->_cecDevice setDelegate:0];
    v5 = self->_cecDevice;
    self->_cecDevice = 0;
  }
  [(CoreCECBus *)self->_cecBus setDelegate:0];
  cecBus = self->_cecBus;
  self->_cecBus = 0;
}

- (BOOL)sleepDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = CoreRCPluginLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Putting TV to standby (%@)", buf, 0xCu);
  }

  *(_WORD *)&self->_isDisplayAsleep = 1;
  self->_recentDisplayWake = 0;
  if (v3)
  {
    v13 = CoreRCPluginLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "Not sendings standby because it is disabled";
LABEL_18:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
LABEL_19:
    id v10 = 0;
LABEL_20:

    BOOL v11 = 0;
    goto LABEL_9;
  }
  if (!self->_cecBus)
  {
    v13 = CoreRCPluginLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_8B48(v13, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_19;
  }
  cecDevice = self->_cecDevice;
  if (!cecDevice)
  {
    v13 = CoreRCPluginLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_8B80(v13, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_19;
  }
  [(CoreCECDevice *)cecDevice setPowerStatus:2 error:0];
  if (([(CoreCECDevice *)self->_cecDevice isActiveSource] & 1) == 0)
  {
    v13 = CoreRCPluginLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "Not currently active source, not sending standby";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  int v7 = self->_cecDevice;
  id v29 = 0;
  unsigned __int8 v8 = [(CoreCECDevice *)v7 performStandbyWithTargetDevice:0 error:&v29];
  id v9 = v29;
  id v10 = v9;
  BOOL v11 = 1;
  if ((v8 & 1) == 0 && v9)
  {
    v13 = CoreRCPluginLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_8BB8();
    }
    goto LABEL_20;
  }
LABEL_9:

  return v11;
}

- (BOOL)wakeDisplay
{
  BOOL v3 = CoreRCPluginLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Waking TV (%@)", buf, 0xCu);
  }

  self->_isDisplayAsleep = 0;
  if (!self->_recentDisplayWake)
  {
    self->_recentDisplayWake = 1;
    dispatch_time_t v4 = dispatch_time(0, 1000000000 * self->_cecActiveSourceRecentlySentDuration);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_70D0;
    block[3] = &unk_C398;
    block[4] = self;
    dispatch_after(v4, queue, block);
  }
  cecBus = self->_cecBus;
  if (!cecBus || ([(CoreCECBus *)cecBus hasLink] & 1) == 0)
  {
    v12 = CoreRCPluginLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "HDMI cable is not plugged in yet or TV is not ready, try again on HPD high.", buf, 2u);
    }
    goto LABEL_15;
  }
  cecDevice = self->_cecDevice;
  if (!cecDevice)
  {
    v12 = CoreRCPluginLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_8B80(v12, v13, v14, v15, v16, v17, v18, v19);
    }
LABEL_15:
    id v10 = 0;
LABEL_18:

    self->_needToSendActiveSource = 1;
    return 0;
  }
  id v20 = 0;
  BOOL v8 = 1;
  unsigned int v9 = [(CoreCECDevice *)cecDevice makeActiveSourceWithTVMenus:1 error:&v20];
  id v10 = v20;
  [(CoreCECDevice *)self->_cecDevice setPowerStatus:1 error:0];
  if (!v9 || v10)
  {
    v12 = CoreRCPluginLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_8C20();
    }
    goto LABEL_18;
  }
  return v8;
}

- (void)cecBus:(id)a3 linkStateHasBeenUpdated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = CoreRCPluginLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = "NO";
    if (v4) {
      BOOL v8 = "YES";
    }
    *(_DWORD *)buf = 136315394;
    *(void *)uint64_t v21 = v8;
    *(_WORD *)&v21[8] = 2112;
    *(void *)uint64_t v22 = self;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Link state %s (%@)\n", buf, 0x16u);
  }

  if (v4)
  {
    if (self->_cecDevice)
    {
      id v9 = 0;
    }
    else
    {
      id v19 = 0;
      id v10 = [(CoreRCDisplay *)self addCECDeviceToBus:v6 error:&v19];
      id v9 = v19;
      cecDevice = self->_cecDevice;
      self->_cecDevice = v10;

      if (!self->_cecDevice) {
        goto LABEL_15;
      }
    }
    if (self->_needToSendActiveSource && self->_recentDisplayWake)
    {
      BOOL isDisplayAsleep = self->_isDisplayAsleep;
      uint64_t v13 = CoreRCPluginLog();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (isDisplayAsleep)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Display is asleep, don't wake up TV", buf, 2u);
        }
      }
      else
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "sending active source", buf, 2u);
        }

        [(CoreRCDisplay *)self wakeDisplay];
      }
      self->_BOOL needToSendActiveSource = 0;
LABEL_22:

      goto LABEL_23;
    }
LABEL_15:
    uint64_t v15 = CoreRCPluginLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL needToSendActiveSource = self->_needToSendActiveSource;
      BOOL recentDisplayWake = self->_recentDisplayWake;
      uint64_t v18 = self->_cecDevice;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)uint64_t v21 = needToSendActiveSource;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = recentDisplayWake;
      *(_WORD *)uint64_t v22 = 2112;
      *(void *)&v22[2] = v18;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Not sending active source _needToSendActiveSource: %d, _recentDisplayWake: %d, cecDevice: %@, err: %@", buf, 0x22u);
    }

    goto LABEL_22;
  }
LABEL_23:
}

- (void)cecDeviceShouldAssertActiveSource:(id)a3
{
  id v4 = a3;
  if (!self->_isDisplayAsleep)
  {
    v5 = CoreRCPluginLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      id v7 = v4;
      __int16 v8 = 2112;
      id v9 = self;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "cecDeviceShouldAssertActiveSource sending active source from device %@ (%@)", (uint8_t *)&v6, 0x16u);
    }

    [v4 makeActiveSourceWithTVMenus:1 error:0];
  }
}

- (void)cecDevice:(id)a3 activeSourceStatusHasChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = CoreRCPluginLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = "NO";
    int v10 = 136315650;
    if (v4) {
      __int16 v8 = "YES";
    }
    BOOL v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = self;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "CECDeviceActiveSourceStatus changed to %s, %@ (%@)\n", (uint8_t *)&v10, 0x20u);
  }

  if (self->_recentDisplayWake && !v4)
  {
    id v9 = CoreRCPluginLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Active source incorrectly switched away from us", (uint8_t *)&v10, 2u);
    }

    *(_WORD *)&self->_BOOL needToSendActiveSource = 1;
  }
}

- (void)bus:(id)a3 deviceHasBeenRemoved:(id)a4
{
  v5 = (CoreCECDevice *)a4;
  if (self->_cecDevice == v5)
  {
    id v6 = CoreRCPluginLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      BOOL v11 = self;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "CEC device has been removed %@ (%@)", (uint8_t *)&v8, 0x16u);
    }

    cecDevice = self->_cecDevice;
    self->_cecDevice = 0;

    [(CoreCECDevice *)v5 setDelegate:0];
  }
}

- (id)addCECDeviceToBus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = CoreCECDeviceSourceRCProfileWithSupportedMenuCommands();
  LOBYTE(v19) = 0;
  int v8 = +[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:2 otherTypes:0 features:537703 rcProfile:v7 vendorID:kCoreCECVendorIDApple version:kCoreCECVersion2_0 active:v19];

  id v21 = 0;
  id v9 = [v6 addDeviceWithAttributes:v8 error:&v21];
  id v10 = v21;
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    [v9 setDelegate:self];
    objc_storeStrong((id *)&self->_cecDevice, v9);
    id v20 = 0;
    unsigned int v12 = [v6 setOSDName:@"Apple" error:&v20];
    id v13 = v20;
    id v16 = v13;
    if (v12)
    {
      __int16 v14 = 0;
      if (!v13)
      {
        if (!a4) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    uint64_t v17 = CoreRCPluginLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_8CF0();
    }
  }
  else
  {
    id v16 = v10;
    self->_BOOL needToSendActiveSource = 1;
    uint64_t v17 = CoreRCPluginLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_8C88();
    }
  }

  __int16 v14 = v16;
  if (a4) {
LABEL_9:
  }
    *a4 = v14;
LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cecDevice, 0);
  objc_storeStrong((id *)&self->_cecBus, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end