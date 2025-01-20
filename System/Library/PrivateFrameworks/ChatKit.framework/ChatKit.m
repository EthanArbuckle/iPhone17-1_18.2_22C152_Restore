uint64_t start()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    v1 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Starting up…", v5, 2u);
    }
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10000C380);
  v2 = +[CKCompanionMessagesDaemon sharedDaemon];
  [v2 registerForActivities];

  v3 = +[NSRunLoop currentRunLoop];
  [v3 run];

  return 0;
}

void sub_100002F68(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, "Notification");
    if (!strcmp(string, "com.apple.TextInput.RemoveAllDynamicDictionariesNotification"))
    {
      if (IMOSLoggingEnabled())
      {
        v4 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Requesting removal of dynamic dictionaries", v6, 2u);
        }
      }
      v5 = +[CKCompanionMessagesDaemon sharedDaemon];
      [v5 requestDynamicDictionariesRemoval];
    }
  }
}

uint64_t NanoMessagesProtoChatMuteDidChangeReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LODWORD(v6) = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    int v13 = (unsigned __int16)(v6 >> 3);
    if (v13 == 2)
    {
      *(unsigned char *)(a1 + 24) |= 1u;
      unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        uint64_t v17 = 0;
      }
      *(void *)(a1 + 8) = v17;
    }
    else if (v13 == 1)
    {
      uint64_t v14 = PBReaderReadString();
      v15 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t NanoMessagesProtoSyncDeviceSaltReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LODWORD(v6) = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 & 0x7FFF8) == 8)
    {
      uint64_t v12 = PBReaderReadData();
      int v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL NanoMessagesProtoFetchCurrentLocationReadFrom(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t NanoMessagesProtoDidFetchCurrentLocationReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        LODWORD(v6) = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((unsigned __int16)(v6 >> 3))
    {
      case 1u:
        *(_WORD *)(a1 + 88) |= 8u;
        unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v13 <= 0xFFFFFFFFFFFFFFF7 && v13 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v31 = 32;
        goto LABEL_72;
      case 2u:
        *(_WORD *)(a1 + 88) |= 0x10u;
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v31 = 40;
        goto LABEL_72;
      case 3u:
        *(_WORD *)(a1 + 88) |= 1u;
        unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v17 <= 0xFFFFFFFFFFFFFFF7 && v17 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v31 = 8;
        goto LABEL_72;
      case 4u:
        *(_WORD *)(a1 + 88) |= 4u;
        unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v18 <= 0xFFFFFFFFFFFFFFF7 && v18 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v31 = 24;
        goto LABEL_72;
      case 5u:
        *(_WORD *)(a1 + 88) |= 0x80u;
        unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v31 = 64;
        goto LABEL_72;
      case 6u:
        *(_WORD *)(a1 + 88) |= 2u;
        unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v31 = 16;
        goto LABEL_72;
      case 7u:
        *(_WORD *)(a1 + 88) |= 0x20u;
        unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v31 = 48;
        goto LABEL_72;
      case 8u:
        *(_WORD *)(a1 + 88) |= 0x40u;
        unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v31 = 56;
LABEL_72:
        *(void *)(a1 + v31) = v14;
        continue;
      case 9u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(_WORD *)(a1 + 88) |= 0x100u;
        break;
      case 0xAu:
        uint64_t v29 = PBReaderReadString();
        v30 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = v29;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      uint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v27 = v26 + 1;
      if (v26 == -1 || v27 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v28 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v27;
      v25 |= (unint64_t)(v28 & 0x7F) << v23;
      if ((v28 & 0x80) == 0) {
        goto LABEL_53;
      }
      v23 += 7;
      BOOL v10 = v24++ >= 9;
      if (v10)
      {
        LODWORD(v25) = 0;
        goto LABEL_55;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_53:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v25) = 0;
    }
LABEL_55:
    *(_DWORD *)(a1 + 72) = v25;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL NanoMessagesProtoRemoveDynamicDictionariesReadFrom(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void sub_100005C24(id a1)
{
  qword_100011BC0 = objc_alloc_init(CKCompanionMessagesDaemon);

  _objc_release_x1();
}

void sub_100005D6C(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Syncing device salt", (uint8_t *)&v12, 2u);
      }
    }
    if (xpc_activity_set_state(v2, 4))
    {
      unint64_t v7 = +[CKCompanionMessagesDaemon sharedDaemon];
      unsigned __int8 v8 = [v7 syncDeviceSalt];

      if ((v8 & 1) == 0 && IMOSLoggingEnabled())
      {
        char v9 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to read device salt, or one hasn't been created yet", (uint8_t *)&v12, 2u);
        }
      }
      BOOL v10 = xpc_activity_set_state(v2, 5);
      int v11 = IMOSLoggingEnabled();
      if (v10)
      {
        if (v11)
        {
          char v4 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            LOWORD(v12) = 0;
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Finished syncing device salt", (uint8_t *)&v12, 2u);
          }
          goto LABEL_25;
        }
      }
      else if (v11)
      {
        char v4 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Failed to finish xpc_activity after syncing device salt", (uint8_t *)&v12, 2u);
        }
        goto LABEL_25;
      }
    }
  }
  else if (!state && IMOSLoggingEnabled())
  {
    char v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      xpc_object_t v5 = xpc_activity_copy_criteria(v2);
      int v12 = 138412290;
      xpc_object_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Check-in, criteria: %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_25:
  }
}

void sub_100005FEC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100005FB8);
  }
  _Unwind_Resume(a1);
}

void sub_10000622C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1000061ACLL);
  }
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_10000626C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000627C(uint64_t a1)
{
}

uint64_t sub_100006284(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) deviceSalt];

  return _objc_release_x1();
}

void sub_1000062F0(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Syncing ResponseKit data", buf, 2u);
      }
    }
    if (xpc_activity_set_state(v2, 4))
    {
      unint64_t v7 = +[CKCompanionMessagesDaemon sharedDaemon];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000064E8;
      v8[3] = &unk_10000C450;
      char v9 = v2;
      [v7 syncResponseKitData:v8];
    }
  }
  else if (!state && IMOSLoggingEnabled())
  {
    char v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      xpc_object_t v5 = xpc_activity_copy_criteria(v2);
      *(_DWORD *)buf = 138412290;
      xpc_object_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Check-in, criteria: %@", buf, 0xCu);
    }
  }
}

void sub_1000064E8(uint64_t a1)
{
  BOOL v1 = xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  int v2 = IMOSLoggingEnabled();
  if (v1)
  {
    if (!v2) {
      return;
    }
    int v3 = OSLogHandleForIMEventCategory();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    __int16 v6 = 0;
    char v4 = "Finished syncing ResponseKit data";
    xpc_object_t v5 = (uint8_t *)&v6;
    goto LABEL_8;
  }
  if (!v2) {
    return;
  }
  int v3 = OSLogHandleForIMEventCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    char v4 = "Failed to finish xpc_activity after syncing ResponseKit data";
    xpc_object_t v5 = buf;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
  }
LABEL_9:
}

void sub_100006870(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 didErrorOccur])
  {
    if (IMOSLoggingEnabled())
    {
      char v4 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Error while attempting to zip up ResponseKit data", v6, 2u);
      }
    }
  }
  else
  {
    [*(id *)(a1[4] + 8) sendResponseKitData:a1[5]];
  }
  uint64_t v5 = a1[6];
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void sub_100006BA8(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    int v2 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Finished syncing ResponseKit data during PairedSync", v4, 2u);
    }
  }
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) activeSyncSession];
  [v3 syncDidComplete];
}

id sub_1000076E0()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  BOOL v1 = [v0 lastObject];

  int v2 = [v1 stringByAppendingPathComponent:@"ResponseKit"];
  id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];

  return v3;
}

id sub_100007780(char a1)
{
  int v2 = NSTemporaryDirectory();
  v16[0] = v2;
  id v3 = +[NSUUID UUID];
  char v4 = [v3 UUIDString];
  v16[1] = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:v16 count:2];
  __int16 v6 = +[NSURL fileURLWithPathComponents:v5];

  if (a1)
  {
    unint64_t v7 = +[NSFileManager defaultManager];
    unsigned __int8 v8 = [v6 path];
    unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

    if (v9) {
      goto LABEL_6;
    }
    BOOL v10 = +[NSFileManager defaultManager];
    xpc_object_t v11 = [v6 path];
    id v15 = 0;
    [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v12 = v15;

    if (!v12)
    {
LABEL_6:
      id v13 = 0;
    }
    else
    {
      id v13 = v6;
    }
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OSLogHandleForIMEventCategory()
{
  return _OSLogHandleForIMEventCategory();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IMAlwaysLog()
{
  return __IMAlwaysLog();
}

uint64_t _IMWillLog()
{
  return __IMWillLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_activeSyncSession(void *a1, const char *a2, ...)
{
  return [a1 activeSyncSession];
}

id objc_msgSend_classAService(void *a1, const char *a2, ...)
{
  return [a1 classAService];
}

id objc_msgSend_classCService(void *a1, const char *a2, ...)
{
  return [a1 classCService];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deviceSalt(void *a1, const char *a2, ...)
{
  return [a1 deviceSalt];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_didErrorOccur(void *a1, const char *a2, ...)
{
  return [a1 didErrorOccur];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_isUnderDataProtectionLock(void *a1, const char *a2, ...)
{
  return [a1 isUnderDataProtectionLock];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_registerForActivities(void *a1, const char *a2, ...)
{
  return [a1 registerForActivities];
}

id objc_msgSend_registerForDeviceSaltSyncActivity(void *a1, const char *a2, ...)
{
  return [a1 registerForDeviceSaltSyncActivity];
}

id objc_msgSend_requestDynamicDictionariesRemoval(void *a1, const char *a2, ...)
{
  return [a1 requestDynamicDictionariesRemoval];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedCryptographer(void *a1, const char *a2, ...)
{
  return [a1 sharedCryptographer];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemon];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_syncDeviceSalt(void *a1, const char *a2, ...)
{
  return [a1 syncDeviceSalt];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_triggerWRCannedRepliesStoreDowngradeIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 triggerWRCannedRepliesStoreDowngradeIfNeeded];
}