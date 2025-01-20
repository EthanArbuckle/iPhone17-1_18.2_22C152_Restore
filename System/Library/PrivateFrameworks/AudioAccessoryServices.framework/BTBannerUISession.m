@interface BTBannerUISession
- (BTBannerUISession)init;
- (NSString)bannerAppID;
- (NSString)centerContentItemsIcon;
- (NSString)centerContentItemsText;
- (NSString)centerContentText;
- (NSString)identifier;
- (NSString)label;
- (NSString)leadingAccessoryImageName;
- (NSString)leadingAccessoryImagePath;
- (NSString)trailingAccessoryImageName;
- (NSString)trailingAccessoryImagePath;
- (NSString)trailingAccessoryText;
- (OS_dispatch_queue)dispatchQueue;
- (double)batteryLevelInfo;
- (double)lowBatteryLevel;
- (double)timeoutSeconds;
- (id)actionHandler;
- (int)backgroundColor;
- (unsigned)bannerType;
- (unsigned)leadingAccessoryImagePID;
- (void)_activate;
- (void)_xpcCompleted:(id)a3;
- (void)_xpcConnectionMessage:(id)a3;
- (void)_xpcEvent:(id)a3;
- (void)_xpcSendMessage;
- (void)_xpcSendReplyError:(id)a3 request:(id)a4;
- (void)_xpcStart;
- (void)activate;
- (void)encodeWithXPCObject:(id)a3;
- (void)invalidate;
- (void)setActionHandler:(id)a3;
- (void)setBackgroundColor:(int)a3;
- (void)setBannerAppID:(id)a3;
- (void)setBannerType:(unsigned int)a3;
- (void)setBatteryLevelInfo:(double)a3;
- (void)setCenterContentItemsIcon:(id)a3;
- (void)setCenterContentItemsText:(id)a3;
- (void)setCenterContentText:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLeadingAccessoryImageName:(id)a3;
- (void)setLeadingAccessoryImagePID:(unsigned int)a3;
- (void)setLeadingAccessoryImagePath:(id)a3;
- (void)setLowBatteryLevel:(double)a3;
- (void)setTimeoutSeconds:(double)a3;
- (void)setTrailingAccessoryImageName:(id)a3;
- (void)setTrailingAccessoryImagePath:(id)a3;
- (void)setTrailingAccessoryText:(id)a3;
@end

@implementation BTBannerUISession

- (BTBannerUISession)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTBannerUISession;
  v2 = [(BTBannerUISession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__BTBannerUISession_activate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__BTBannerUISession_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_BTBannerUISession <= 50)
  {
    if (gLogCategory_BTBannerUISession != -1 || (result = _LogCategory_Initialize(), result)) {
      result = LogPrintF();
    }
  }
  uint64_t v2 = *(void *)(v1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = 1;
    v3 = *(void **)(v1 + 32);
    return [v3 _activate];
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__BTBannerUISession_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__BTBannerUISession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x24C581450](*(void *)(*(void *)(a1 + 32) + 48));
  v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, 3, 0);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  objc_super v6 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v6)
  {
    v9 = v6;
    xpc_connection_cancel(v9);
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0;
  }
}

- (void)_activate
{
  [(BTBannerUISession *)self _xpcStart];
  if (self->_xpcConnection)
  {
    [(BTBannerUISession *)self _xpcSendMessage];
  }
}

- (void)_xpcStart
{
  mach_service = xpc_connection_create_mach_service("com.apple.BluetoothUIService", (dispatch_queue_t)self->_dispatchQueue, 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = mach_service;

  v5 = self->_xpcConnection;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __30__BTBannerUISession__xpcStart__block_invoke;
  handler[3] = &unk_26523FA58;
  handler[4] = self;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_activate(self->_xpcConnection);
}

uint64_t __30__BTBannerUISession__xpcStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcEvent:a2];
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5 = [(NSString *)self->_label UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "BUISKeyLabel", v5);
  }
  double timeoutSeconds = self->_timeoutSeconds;
  if (timeoutSeconds != 0.0) {
    xpc_dictionary_set_double(v4, "BUISKeyBannerTimeout", timeoutSeconds);
  }
  centerContentText = self->_centerContentText;
  id v8 = v4;
  v9 = [(NSString *)centerContentText UTF8String];
  if (v9) {
    xpc_dictionary_set_string(v8, "BUISKeyCCText", v9);
  }

  centerContentItemsIcon = self->_centerContentItemsIcon;
  id v11 = v8;
  v12 = [(NSString *)centerContentItemsIcon UTF8String];
  if (v12) {
    xpc_dictionary_set_string(v11, "BUISKeyCCItemsIcon", v12);
  }

  centerContentItemsText = self->_centerContentItemsText;
  id v14 = v11;
  v15 = [(NSString *)centerContentItemsText UTF8String];
  if (v15) {
    xpc_dictionary_set_string(v14, "BUISKeyCCItemsText", v15);
  }

  identifier = self->_identifier;
  id v17 = v14;
  v18 = [(NSString *)identifier UTF8String];
  if (v18) {
    xpc_dictionary_set_string(v17, "BUISKeyIdentifier", v18);
  }

  leadingAccessoryImagePath = self->_leadingAccessoryImagePath;
  id v20 = v17;
  v21 = [(NSString *)leadingAccessoryImagePath UTF8String];
  if (v21) {
    xpc_dictionary_set_string(v20, "BUISKeyLAImagePath", v21);
  }

  leadingAccessoryImageName = self->_leadingAccessoryImageName;
  id v23 = v20;
  v24 = [(NSString *)leadingAccessoryImageName UTF8String];
  if (v24) {
    xpc_dictionary_set_string(v23, "BUISKeyLAImageName", v24);
  }

  uint64_t leadingAccessoryImagePID = self->_leadingAccessoryImagePID;
  if (leadingAccessoryImagePID) {
    xpc_dictionary_set_uint64(v23, "BUISKeyLAProductID", leadingAccessoryImagePID);
  }
  trailingAccessoryImagePath = self->_trailingAccessoryImagePath;
  id v27 = v23;
  v28 = [(NSString *)trailingAccessoryImagePath UTF8String];
  if (v28) {
    xpc_dictionary_set_string(v27, "BUISKeyTAImagePath", v28);
  }

  trailingAccessoryImageName = self->_trailingAccessoryImageName;
  id v30 = v27;
  v31 = [(NSString *)trailingAccessoryImageName UTF8String];
  if (v31) {
    xpc_dictionary_set_string(v30, "BUISKeyTAImageName", v31);
  }

  trailingAccessoryText = self->_trailingAccessoryText;
  id v33 = v30;
  v34 = [(NSString *)trailingAccessoryText UTF8String];
  if (v34) {
    xpc_dictionary_set_string(v33, "BUISKeyTAText", v34);
  }

  int64_t backgroundColor = self->_backgroundColor;
  if (backgroundColor) {
    xpc_dictionary_set_int64(v33, "BUISKeyBackgroundColor", backgroundColor);
  }
  double lowBatteryLevel = self->_lowBatteryLevel;
  if (lowBatteryLevel != 0.0) {
    xpc_dictionary_set_double(v33, "BUISKeyLowBatteryLevel", lowBatteryLevel);
  }
  double batteryLevelInfo = self->_batteryLevelInfo;
  if (batteryLevelInfo != 0.0) {
    xpc_dictionary_set_double(v33, "BUISKeyBatteryLevel", batteryLevelInfo);
  }
  uint64_t bannerType = self->_bannerType;
  if (bannerType) {
    xpc_dictionary_set_uint64(v33, "BUISKeyBannerType", bannerType);
  }
  bannerAppID = self->_bannerAppID;
  xpc_object_t xdict = v33;
  v40 = [(NSString *)bannerAppID UTF8String];
  if (v40) {
    xpc_dictionary_set_string(xdict, "BUISKeyBannerAppID", v40);
  }
}

- (void)_xpcEvent:(id)a3
{
  id v16 = a3;
  if (MEMORY[0x24C581700]() == MEMORY[0x263EF8708])
  {
    [(BTBannerUISession *)self _xpcConnectionMessage:v16];
  }
  else if (v16 == (id)MEMORY[0x263EF86A8])
  {
    if (gLogCategory_BTBannerUISession <= 30
      && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v8 = MEMORY[0x24C581450](self->_actionHandler);
    v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 4, 0);
    }

    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  else if (v16 == (id)MEMORY[0x263EF86A0])
  {
    if (gLogCategory_BTBannerUISession <= 30
      && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v11 = MEMORY[0x24C581450](self->_actionHandler);
    v12 = (void *)v11;
    if (v11) {
      (*(void (**)(uint64_t, uint64_t, void))(v11 + 16))(v11, 3, 0);
    }

    v13 = self->_xpcConnection;
    if (v13)
    {
      id v14 = v13;
      xpc_connection_cancel(v14);
      v15 = self->_xpcConnection;
      self->_xpcConnection = 0;
    }
  }
  else
  {
    id v4 = CUXPCDecodeNSErrorIfNeeded();
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      NSErrorF();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v7 = v6;

    if (gLogCategory_BTBannerUISession <= 90
      && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_xpcSendMessage
{
  if (self->_xpcConnection)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "BUISKeyType", "BUISKeyArgType");
    [(BTBannerUISession *)self encodeWithXPCObject:v3];
    dispatchQueue = self->_dispatchQueue;
    xpcConnection = self->_xpcConnection;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __36__BTBannerUISession__xpcSendMessage__block_invoke;
    handler[3] = &unk_26523FA58;
    handler[4] = self;
    xpc_connection_send_message_with_reply(xpcConnection, v3, dispatchQueue, handler);
  }
  else if (gLogCategory_BTBannerUISession <= 90 {
         && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __36__BTBannerUISession__xpcSendMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcCompleted:a2];
}

- (void)_xpcCompleted:(id)a3
{
  id v10 = a3;
  id v4 = CUXPCDecodeNSErrorIfNeeded();
  if (v4)
  {
    id v8 = (id)NSErrorF();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5)
    {
      if (gLogCategory_BTBannerUISession <= 30
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v6 = MEMORY[0x24C581450](self->_actionHandler);
      uint64_t v7 = (void *)v6;
      if (v6) {
        (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, 4, 0);
      }
    }
    else
    {
      id v9 = (id)NSErrorF();
    }
  }
}

- (void)_xpcConnectionMessage:(id)a3
{
  id v14 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v14, "BUISKeyType");
  switch(int64)
  {
    case 0:
      if (gLogCategory_BTBannerUISession <= 90
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v5 = xpc_dictionary_expects_reply();
      id v6 = v14;
      if (v5)
      {
        uint64_t v7 = NSErrorF();
        -[BTBannerUISession _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v7, v14, 0);

        goto LABEL_17;
      }
      goto LABEL_34;
    case 1:
      if (gLogCategory_BTBannerUISession <= 50
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v9 = MEMORY[0x24C581450](self->_actionHandler);
      id v8 = (void *)v9;
      if (!v9) {
        break;
      }
      id v10 = *(void (**)(void))(v9 + 16);
      goto LABEL_32;
    case 2:
      if (gLogCategory_BTBannerUISession <= 50
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v11 = MEMORY[0x24C581450](self->_actionHandler);
      id v8 = (void *)v11;
      if (!v11) {
        break;
      }
      id v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_32;
    case 3:
      if (gLogCategory_BTBannerUISession <= 50
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v12 = MEMORY[0x24C581450](self->_actionHandler);
      id v8 = (void *)v12;
      if (!v12) {
        break;
      }
      id v10 = *(void (**)(void))(v12 + 16);
LABEL_32:
      v10();
      break;
    default:
LABEL_17:
      if (gLogCategory_BTBannerUISession <= 90
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v5 = xpc_dictionary_expects_reply();
      id v6 = v14;
      if (!v5) {
        goto LABEL_34;
      }
      int64_t v13 = int64;
      id v8 = NSErrorF();
      -[BTBannerUISession _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v8, v14, v13);
      break;
  }

  id v6 = v14;
LABEL_34:

  MEMORY[0x270F9A758](v5, v6);
}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = self->_xpcConnection;
  if (v7)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      CUXPCEncodeNSError();
      xpc_connection_send_message(v7, reply);
    }
    else if (gLogCategory_BTBannerUISession <= 90 {
           && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_BTBannerUISession <= 90 {
         && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (int)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(int)a3
{
  self->_int64_t backgroundColor = a3;
}

- (NSString)bannerAppID
{
  return self->_bannerAppID;
}

- (void)setBannerAppID:(id)a3
{
}

- (unsigned)bannerType
{
  return self->_bannerType;
}

- (void)setBannerType:(unsigned int)a3
{
  self->_uint64_t bannerType = a3;
}

- (NSString)centerContentText
{
  return self->_centerContentText;
}

- (void)setCenterContentText:(id)a3
{
}

- (NSString)centerContentItemsIcon
{
  return self->_centerContentItemsIcon;
}

- (void)setCenterContentItemsIcon:(id)a3
{
}

- (NSString)centerContentItemsText
{
  return self->_centerContentItemsText;
}

- (void)setCenterContentItemsText:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)leadingAccessoryImageName
{
  return self->_leadingAccessoryImageName;
}

- (void)setLeadingAccessoryImageName:(id)a3
{
}

- (NSString)leadingAccessoryImagePath
{
  return self->_leadingAccessoryImagePath;
}

- (void)setLeadingAccessoryImagePath:(id)a3
{
}

- (unsigned)leadingAccessoryImagePID
{
  return self->_leadingAccessoryImagePID;
}

- (void)setLeadingAccessoryImagePID:(unsigned int)a3
{
  self->_uint64_t leadingAccessoryImagePID = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_double timeoutSeconds = a3;
}

- (NSString)trailingAccessoryImageName
{
  return self->_trailingAccessoryImageName;
}

- (void)setTrailingAccessoryImageName:(id)a3
{
}

- (NSString)trailingAccessoryImagePath
{
  return self->_trailingAccessoryImagePath;
}

- (void)setTrailingAccessoryImagePath:(id)a3
{
}

- (NSString)trailingAccessoryText
{
  return self->_trailingAccessoryText;
}

- (void)setTrailingAccessoryText:(id)a3
{
}

- (double)lowBatteryLevel
{
  return self->_lowBatteryLevel;
}

- (void)setLowBatteryLevel:(double)a3
{
  self->_double lowBatteryLevel = a3;
}

- (double)batteryLevelInfo
{
  return self->_batteryLevelInfo;
}

- (void)setBatteryLevelInfo:(double)a3
{
  self->_double batteryLevelInfo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessoryText, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryImagePath, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryImageName, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryImagePath, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryImageName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_centerContentItemsText, 0);
  objc_storeStrong((id *)&self->_centerContentItemsIcon, 0);
  objc_storeStrong((id *)&self->_centerContentText, 0);
  objc_storeStrong((id *)&self->_bannerAppID, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end