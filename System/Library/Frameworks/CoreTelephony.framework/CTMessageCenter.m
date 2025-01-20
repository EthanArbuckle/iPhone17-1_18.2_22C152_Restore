@interface CTMessageCenter
+ (id)sharedMessageCenter;
- ($2825F4736939C4A6D3AD43837233062D)isDeliveryReportsEnabled:(BOOL *)a3;
- ($2825F4736939C4A6D3AD43837233062D)isMmsEnabledForSub:(id)a3 enabled:(BOOL *)a4;
- ($2825F4736939C4A6D3AD43837233062D)send:(id)a3;
- ($2825F4736939C4A6D3AD43837233062D)send:(id)a3 withMoreToFollow:(BOOL)a4;
- ($2825F4736939C4A6D3AD43837233062D)sendMMS:(id)a3;
- ($2825F4736939C4A6D3AD43837233062D)sendMMSFromData:(id)a3 messageId:(unsigned int)a4 subSlot:(int64_t)a5;
- ($2825F4736939C4A6D3AD43837233062D)sendSMS:(id)a3 withMoreToFollow:(BOOL)a4 trackingID:(unsigned int *)a5;
- (BOOL)getCharacterCount:(int64_t *)a3 andMessageSplitThreshold:(int64_t *)a4 forSmsText:(id)a5;
- (BOOL)getCharacterCountForSub:(id)a3 count:(int64_t *)a4 andMessageSplitThreshold:(int64_t *)a5 forSmsText:(id)a6;
- (BOOL)isMmsConfigured;
- (BOOL)isMmsConfiguredForSub:(id)a3;
- (BOOL)isMmsEnabled;
- (BOOL)sendBinarySMS:(id)a3 trackingID:(unsigned int *)a4;
- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5;
- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 trackingID:(unsigned int *)a6;
- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 withID:(unsigned int)a6;
- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 withMoreToFollow:(BOOL)a6 withID:(unsigned int)a7;
- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6;
- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 trackingID:(unsigned int *)a7;
- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 withID:(unsigned int)a7;
- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 withMoreToFollow:(BOOL)a7 withID:(unsigned int)a8;
- (BOOL)simulateDeferredMessage;
- (BOOL)simulateSmsReceived:(id)a3;
- (CTMessageCenter)init;
- (id)allIncomingMessages;
- (id)decodeMessage:(id)a3;
- (id)encodeMessage:(id)a3;
- (id)incomingMessageWithId:(unsigned int)a3;
- (int)incomingMessageCount;
- (void)acknowledgeIncomingMessageWithId:(unsigned int)a3;
- (void)acknowledgeOutgoingMessageWithId:(unsigned int)a3;
- (void)addMessageOfType:(int)a3 toArray:(id)a4 withIdsFromArray:(id)a5;
- (void)allIncomingMessages;
- (void)dealloc;
- (void)emergencySessionIntentEnd:(id)a3;
- (void)emergencySessionIntentStart:(id)a3;
- (void)incomingMessageCount;
- (void)sendMessageAsSmsToShortCodeRecipients:(id)a3 andReplaceData:(id *)a4;
- (void)simulateDeferredMessage;
@end

@implementation CTMessageCenter

- (BOOL)isMmsConfiguredForSub:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!_messageCenterServerConnection)
  {
    v11 = CTLogMessageCenter();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter isMmsConfiguredForSub:]();
    }
    LOBYTE(v12) = 0;
    return v12;
  }
  xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
  xpc::dict_creator::operator()<char const*>("kSmsIsMmsConfigured", (xpc_object_t *)object, "kRequest", &v27);
  xpc_release(*(xpc_object_t *)object);
  xpc_object_t v4 = v27;
  xpc_object_t v28 = v27;
  xpc_object_t v27 = xpc_null_create();
  xpc_release(v27);
  if (a3)
  {
    uint64_t v5 = [a3 slotID];
    v6 = CTLogMessageCenter();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    v7 = CTSubscriptionSlotAsString(v5);
    *(_DWORD *)object = 136315138;
    *(void *)&object[4] = v7;
    v8 = "MMS configured check requested for slot %s";
    v9 = v6;
    uint32_t v10 = 12;
  }
  else
  {
    v13 = CTLogMessageCenter();
    uint64_t v5 = 1;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    *(_WORD *)object = 0;
    v8 = "MMS configured check slot forced to CTSubscriptionSlotOne";
    uint64_t v5 = 1;
    v9 = v13;
    uint32_t v10 = 2;
  }
  _os_log_impl(&dword_18444A000, v9, OS_LOG_TYPE_INFO, v8, object, v10);
LABEL_11:
  xpc_object_t v14 = xpc_int64_create(v5);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, "kSmsSubInstance", v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (-[CTMessageCenter isMmsConfiguredForSub:]::kOnceToken != -1) {
    dispatch_once(&-[CTMessageCenter isMmsConfiguredForSub:]::kOnceToken, &__block_literal_global_2);
  }
  if (-[CTMessageCenter isMmsConfiguredForSub:]::kMaxRetries) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 1;
  }
  uint64_t v17 = MEMORY[0x1E4F14590];
  while (1)
  {
    xpc_object_t v27 = 0;
    xpc_object_t v27 = xpc_null_create();
    unint64_t v18 = SendXpcMessage(_messageCenterServerConnection, &v28, &v27);
    int v19 = v18;
    unint64_t v20 = HIDWORD(v18);
    if (!HIDWORD(v18) && MEMORY[0x1853203E0](v27) == v17) {
      break;
    }
    v21 = CTLogMessageCenter();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)object = 136315650;
      *(void *)&object[4] = "kSmsIsMmsConfigured";
      *(_WORD *)&object[12] = 1024;
      *(_DWORD *)&object[14] = v19;
      *(_WORD *)&object[18] = 1024;
      *(_DWORD *)&object[20] = v20;
      _os_log_error_impl(&dword_18444A000, v21, OS_LOG_TYPE_ERROR, "MMS configured check for slot %s failed (%d, %d) retrying...", object, 0x18u);
    }
    xpc_release(v27);
    if (!--v16)
    {
      LOBYTE(v12) = 0;
      goto LABEL_30;
    }
  }
  *(void *)object = &v27;
  *(void *)&object[8] = "kSmsMmsIsConfigured";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v26);
  int v12 = xpc::dyn_cast_or_default((xpc *)&v26, 0);
  xpc_release(v26);
  v22 = CTLogMessageCenter();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = CTSubscriptionSlotAsString(v5);
    v24 = "NO";
    if (v12) {
      v24 = "YES";
    }
    *(_DWORD *)object = 136315394;
    *(void *)&object[4] = v23;
    *(_WORD *)&object[12] = 2080;
    *(void *)&object[14] = v24;
    _os_log_impl(&dword_18444A000, v22, OS_LOG_TYPE_INFO, "MMS configured check for slot %s: %s", object, 0x16u);
  }
  xpc_release(v27);
LABEL_30:
  xpc_release(v28);
  return v12;
}

- (BOOL)isMmsConfigured
{
  v3 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];

  return [(CTMessageCenter *)self isMmsConfiguredForSub:v3];
}

void __41__CTMessageCenter_isMmsConfiguredForSub___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CFStringRef theString1 = 0;
  *(void *)buf = MGCopyAnswer();
  ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&theString1, (CFTypeRef *)buf);
  if (CFEqual(theString1, @"iPhone")) {
    -[CTMessageCenter isMmsConfiguredForSub:]::kMaxRetries = 1;
  }
  v0 = sMsgCtrLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v1 = 3;
    if (!-[CTMessageCenter isMmsConfiguredForSub:]::kMaxRetries) {
      uint64_t v1 = 1;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v1;
    _os_log_impl(&dword_18444A000, v0, OS_LOG_TYPE_DEFAULT, "Configuring max \"is MMS configured\" retries as %zu", buf, 0xCu);
  }
  if (theString1) {
    CFRelease(theString1);
  }
}

+ (id)sharedMessageCenter
{
  id result = (id)_sharedMessageCenter;
  if (!_sharedMessageCenter)
  {
    id result = objc_alloc_init(CTMessageCenter);
    _sharedMessageCenter = (uint64_t)result;
  }
  return result;
}

- (CTMessageCenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)CTMessageCenter;
  v2 = [(CTMessageCenter *)&v9 init];
  if (v2)
  {
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v4 = getprogname();
    CFStringRef v5 = CFStringCreateWithFormat(v3, 0, @"%s-CTMessageCenter", v4);
    if (v5) {
      CFRelease(v5);
    }
  }
  return v2;
}

- (BOOL)getCharacterCount:(int64_t *)a3 andMessageSplitThreshold:(int64_t *)a4 forSmsText:(id)a5
{
  objc_super v9 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];

  return [(CTMessageCenter *)self getCharacterCountForSub:v9 count:a3 andMessageSplitThreshold:a4 forSmsText:a5];
}

- (BOOL)getCharacterCountForSub:(id)a3 count:(int64_t *)a4 andMessageSplitThreshold:(int64_t *)a5 forSmsText:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!_messageCenterServerConnection) {
    return 0;
  }
  int v7 = 0;
  if (a5 && a4 && a6)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kSmsGetCharacterCountAndThresholdForMessage", (xpc_object_t *)&object, "kRequest", &v23);
    xpc_release((xpc_object_t)object);
    xpc_object_t v11 = v23;
    xpc_object_t v24 = v23;
    xpc_object_t v23 = xpc_null_create();
    xpc_release(v23);
    xpc_object_t v23 = xpc_null_create();
    ctu::cf_to_xpc((uint64_t *)&value, (ctu *)a6, v12);
    xpc_dictionary_set_value(v11, "kSmsMessageBody", value);
    xpc_object_t v13 = value;
    xpc_object_t value = xpc_null_create();
    xpc_release(v13);
    xpc_release(value);
    xpc_object_t value = 0;
    if (a3)
    {
      uint64_t v14 = [a3 slotID];
      xpc_object_t v15 = CTLogMessageCenter();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = CTSubscriptionSlotAsString(v14);
        LODWORD(object) = 136315138;
        *(void *)((char *)&object + 4) = v16;
        _os_log_impl(&dword_18444A000, v15, OS_LOG_TYPE_INFO, "Character count requested for Slot %s", (uint8_t *)&object, 0xCu);
      }
    }
    else
    {
      unint64_t v18 = CTLogMessageCenter();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter getCharacterCountForSub:count:andMessageSplitThreshold:forSmsText:]();
      }
      uint64_t v14 = 1;
    }
    xpc_object_t v19 = xpc_int64_create(v14);
    if (!v19) {
      xpc_object_t v19 = xpc_null_create();
    }
    xpc_dictionary_set_value(v11, "kSmsSubInstance", v19);
    xpc_object_t v20 = xpc_null_create();
    xpc_release(v19);
    xpc_release(v20);
    if (!((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v24, &v23) >> 32)
      && MEMORY[0x1853203E0](v23) == MEMORY[0x1E4F14590])
    {
      *(void *)&long long object = &v23;
      *((void *)&object + 1) = "kDidSucceed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v21);
      int v7 = xpc::dyn_cast_or_default((xpc *)&v21, 0);
      xpc_release(v21);
      if (v7)
      {
        *(void *)&long long object = &v23;
        *((void *)&object + 1) = "kSmsCharacterCount";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v21);
        *a4 = xpc::dyn_cast_or_default((xpc *)&v21, 0);
        xpc_release(v21);
        *(void *)&long long object = &v23;
        *((void *)&object + 1) = "kSmsThreshold";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v21);
        *a5 = xpc::dyn_cast_or_default((xpc *)&v21, 0);
        xpc_release(v21);
        int v7 = 1;
      }
    }
    else
    {
      int v7 = 0;
    }
    xpc_release(v23);
    xpc_release(v24);
  }
  return v7 != 0;
}

- (void)dealloc
{
  if (_messageCenterServerConnection) {
    CFRelease((CFTypeRef)_messageCenterServerConnection);
  }
  v3.receiver = self;
  v3.super_class = (Class)CTMessageCenter;
  [(CTMessageCenter *)&v3 dealloc];
}

- ($2825F4736939C4A6D3AD43837233062D)sendSMS:(id)a3 withMoreToFollow:(BOOL)a4 trackingID:(unsigned int *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (_messageCenterServerConnection)
  {
    BOOL v6 = a4;
    if ([a3 messageType] == 1)
    {
      if (objc_msgSend((id)objc_msgSend(a3, "items"), "count"))
      {
        if (objc_msgSend((id)objc_msgSend(a3, "recipients"), "count") == 1)
        {
          if ([a3 context])
          {
            int64_t v8 = objc_msgSend((id)objc_msgSend(a3, "context"), "slotID");
          }
          else
          {
            xpc_object_t v13 = CTLogMessageCenter();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.6(v13);
            }
            int64_t v8 = 1;
          }
          uint64_t v14 = +[CTMMSEncoder encodeSms:a3];
          if (v14)
          {
            xpc_object_t xdict = 0;
            xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
            xpc::dict_creator::operator()<char const*>("kSmsSendMessage", (xpc_object_t *)object, "kRequest", &v45);
            xpc_release(*(xpc_object_t *)object);
            xpc_object_t xdict = v45;
            xpc_object_t v45 = xpc_null_create();
            xpc_release(v45);
            xpc_object_t v15 = xpc_int64_create([a3 messageId]);
            if (!v15) {
              xpc_object_t v15 = xpc_null_create();
            }
            xpc_dictionary_set_value(xdict, "kSmsMessageID", v15);
            xpc_object_t v16 = xpc_null_create();
            xpc_release(v15);
            xpc_release(v16);
            xpc_object_t v17 = xpc_int64_create(1);
            if (!v17) {
              xpc_object_t v17 = xpc_null_create();
            }
            xpc_dictionary_set_value(xdict, "kSmsMessageType", v17);
            xpc_object_t v18 = xpc_null_create();
            xpc_release(v17);
            xpc_release(v18);
            ctu::cf_to_xpc((uint64_t *)&value, v14, v19);
            xpc_dictionary_set_value(xdict, "kSmsMessageBody", value);
            xpc_object_t v20 = value;
            xpc_object_t value = xpc_null_create();
            xpc_release(v20);
            xpc_release(value);
            xpc_object_t value = 0;
            xpc_object_t v21 = xpc_BOOL_create(v6);
            if (!v21) {
              xpc_object_t v21 = xpc_null_create();
            }
            xpc_dictionary_set_value(xdict, "kSmsMoreMessages", v21);
            xpc_object_t v22 = xpc_null_create();
            xpc_release(v21);
            xpc_release(v22);
            xpc_object_t v23 = xpc_BOOL_create([a3 bypassSupportedMessageModesCheck]);
            if (!v23) {
              xpc_object_t v23 = xpc_null_create();
            }
            xpc_dictionary_set_value(xdict, "kBypassSupportedMessageModesCheck", v23);
            xpc_object_t v24 = xpc_null_create();
            xpc_release(v23);
            xpc_release(v24);
            xpc_object_t v25 = xpc_int64_create(v8);
            if (!v25) {
              xpc_object_t v25 = xpc_null_create();
            }
            xpc_dictionary_set_value(xdict, "kSmsSubInstance", v25);
            xpc_object_t v26 = xpc_null_create();
            xpc_release(v25);
            xpc_release(v26);
            xpc_object_t v27 = xpc_int64_create([a3 smsType]);
            if (!v27) {
              xpc_object_t v27 = xpc_null_create();
            }
            xpc_dictionary_set_value(xdict, "kSmsType", v27);
            xpc_object_t v28 = xpc_null_create();
            xpc_release(v27);
            xpc_release(v28);
            v29 = CTLogMessageCenter();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              uint64_t v30 = CTSubscriptionSlotAsString(v8);
              unsigned int v31 = [a3 messageId];
              uint64_t v32 = [(ctu *)v14 length];
              *(_DWORD *)long long object = 136315906;
              *(void *)&object[4] = v30;
              *(_WORD *)&object[12] = 2048;
              *(void *)&object[14] = v31;
              if (v6) {
                v33 = "true";
              }
              else {
                v33 = "false";
              }
              __int16 v48 = 2048;
              uint64_t v49 = v32;
              __int16 v50 = 2080;
              v51 = v33;
              _os_log_impl(&dword_18444A000, v29, OS_LOG_TYPE_INFO, "SMS info context:[%s] Id:[%lu] Length:[%lu] more:[%s]", object, 0x2Au);
            }
            xpc_object_t v45 = 0;
            xpc_object_t v45 = xpc_null_create();
            unint64_t v34 = SendXpcMessage(_messageCenterServerConnection, &xdict, &v45);
            if (MEMORY[0x1853203E0](v45) == MEMORY[0x1E4F14590])
            {
              if (xpc_dictionary_get_value(v45, "kSmsMessageResult"))
              {
                *(void *)long long object = &v45;
                *(void *)&object[8] = "kSmsMessageResult";
                xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v43);
                int v35 = xpc::dyn_cast_or_default((xpc *)&v43, 0);
                xpc_release(v43);
              }
              else
              {
                int v35 = 0;
              }
              if (a5)
              {
                *(void *)long long object = &v45;
                *(void *)&object[8] = "kSmsMessageID";
                xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v43);
                *a5 = xpc::dyn_cast_or_default((xpc *)&v43, (const object *)0xFFFFFFFFLL);
                xpc_release(v43);
              }
            }
            else
            {
              int v35 = 0;
            }
            unint64_t v37 = HIDWORD(v34);
            if (HIDWORD(v34) | v35)
            {
              if (!HIDWORD(v34))
              {
                v39 = CTLogMessageCenter();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  int v40 = [a3 messageId];
                  *(_DWORD *)long long object = 67109120;
                  *(_DWORD *)&object[4] = v40;
                  _os_log_impl(&dword_18444A000, v39, OS_LOG_TYPE_INFO, "Queued messageId %u", object, 8u);
                }
                LODWORD(v37) = 0;
LABEL_58:
                xpc_release(v45);
                xpc_release(xdict);
                return ($2825F4736939C4A6D3AD43837233062D)(v34 | ((unint64_t)v37 << 32));
              }
            }
            else
            {
              v41 = CTLogMessageCenter();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.5(object, [a3 messageId], v41);
              }
              LODWORD(v37) = -1;
            }
            v42 = CTLogMessageCenter();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.4();
            }
            LODWORD(v34) = 2;
            goto LABEL_58;
          }
          v36 = CTLogMessageCenter();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:]();
          }
        }
        else
        {
          int v12 = CTLogMessageCenter();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.7();
          }
        }
      }
      else
      {
        xpc_object_t v11 = CTLogMessageCenter();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:]();
        }
      }
    }
    else
    {
      uint32_t v10 = CTLogMessageCenter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.8(a3, v10);
      }
    }
  }
  else
  {
    objc_super v9 = CTLogMessageCenter();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:]();
    }
  }
  LODWORD(v37) = -1;
  LODWORD(v34) = 2;
  return ($2825F4736939C4A6D3AD43837233062D)(v34 | ((unint64_t)v37 << 32));
}

- ($2825F4736939C4A6D3AD43837233062D)sendMMSFromData:(id)a3 messageId:(unsigned int)a4 subSlot:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (_messageCenterServerConnection)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kSmsSendMessage", (xpc_object_t *)object, "kRequest", &xdict);
    xpc_release(*(xpc_object_t *)object);
    xpc_object_t v8 = xdict;
    xpc_object_t v31 = xdict;
    xpc_object_t xdict = xpc_null_create();
    xpc_release(xdict);
    xpc_object_t v9 = xpc_int64_create(a4);
    if (!v9) {
      xpc_object_t v9 = xpc_null_create();
    }
    xpc_dictionary_set_value(v8, "kSmsMessageID", v9);
    xpc_object_t v10 = xpc_null_create();
    xpc_release(v9);
    xpc_release(v10);
    xpc_object_t v11 = xpc_int64_create(2);
    if (!v11) {
      xpc_object_t v11 = xpc_null_create();
    }
    xpc_dictionary_set_value(v8, "kSmsMessageType", v11);
    xpc_object_t v12 = xpc_null_create();
    xpc_release(v11);
    xpc_release(v12);
    ctu::cf_to_xpc((uint64_t *)&value, (ctu *)a3, v13);
    xpc_dictionary_set_value(v8, "kSmsMessageBody", value);
    xpc_object_t v14 = value;
    xpc_object_t value = xpc_null_create();
    xpc_release(v14);
    xpc_release(value);
    xpc_object_t value = 0;
    xpc_object_t v15 = xpc_BOOL_create(0);
    if (!v15) {
      xpc_object_t v15 = xpc_null_create();
    }
    xpc_dictionary_set_value(v8, "kSmsMoreMessages", v15);
    xpc_object_t v16 = xpc_null_create();
    xpc_release(v15);
    xpc_release(v16);
    xpc_object_t v17 = xpc_int64_create(a5);
    if (!v17) {
      xpc_object_t v17 = xpc_null_create();
    }
    xpc_dictionary_set_value(v8, "kSmsSubInstance", v17);
    xpc_object_t v18 = xpc_null_create();
    xpc_release(v17);
    xpc_release(v18);
    xpc_object_t v19 = CTLogMessageCenter();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      xpc_object_t v20 = CTSubscriptionSlotAsString(a5);
      uint64_t v21 = [a3 length];
      *(_DWORD *)long long object = 136315906;
      *(void *)&object[4] = v20;
      *(_WORD *)&object[12] = 2048;
      *(void *)&object[14] = a4;
      __int16 v33 = 2048;
      uint64_t v34 = v21;
      __int16 v35 = 2080;
      v36 = "false";
      _os_log_impl(&dword_18444A000, v19, OS_LOG_TYPE_INFO, "MMS info context:[%s] Id:[%lu] Length:[%lu] more:[%s]", object, 0x2Au);
    }
    xpc_object_t xdict = xpc_null_create();
    unint64_t v22 = SendXpcMessage(_messageCenterServerConnection, &v31, &xdict);
    if (MEMORY[0x1853203E0](xdict) == MEMORY[0x1E4F14590] && xpc_dictionary_get_value(xdict, "kSmsMessageResult"))
    {
      *(void *)long long object = &xdict;
      *(void *)&object[8] = "kSmsMessageResult";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v28);
      int v23 = xpc::dyn_cast_or_default((xpc *)&v28, 0);
      xpc_release(v28);
    }
    else
    {
      int v23 = 0;
    }
    unint64_t v25 = HIDWORD(v22);
    if (HIDWORD(v22))
    {
      xpc_object_t v26 = CTLogMessageCenter();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter sendMMSFromData:messageId:subSlot:]();
      }
      LODWORD(v22) = 2;
    }
    else
    {
      if (v23) {
        LODWORD(v25) = 0;
      }
      else {
        LODWORD(v25) = -1;
      }
      if (!v23) {
        LODWORD(v22) = 2;
      }
    }
    xpc_release(xdict);
    xpc_release(v31);
  }
  else
  {
    xpc_object_t v24 = CTLogMessageCenter();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter sendMMSFromData:messageId:subSlot:]();
    }
    LODWORD(v22) = 2;
    LODWORD(v25) = -1;
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v22 | ((unint64_t)v25 << 32));
}

- (void)sendMessageAsSmsToShortCodeRecipients:(id)a3 andReplaceData:(id *)a4
{
  if (a3)
  {
    int v7 = (void *)[a3 recipients];
    unint64_t v8 = [v7 count];
    if (v8 >= 2)
    {
      xpc_object_t v9 = (void *)[v7 objectEnumerator];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (!v10) {
        return;
      }
      xpc_object_t v11 = v10;
      xpc_object_t v19 = a4;
      uint64_t v12 = [v9 nextObject];
      if (v12)
      {
        xpc_object_t v13 = (void *)v12;
        do
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v13 isShortCode])
            {
              [v11 addObject:v13];
              xpc_object_t v14 = objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 0);
              if (!objc_msgSend((id)objc_msgSend(v14, "contentType"), "caseInsensitiveCompare:", @"text/plain")
                || (xpc_object_t v14 = objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 1),
                    !objc_msgSend((id)objc_msgSend(v14, "contentType"), "caseInsensitiveCompare:", @"text/plain")))
              {
                if (v14)
                {
                  if ([v11 count] == v8) {
                    uint64_t v15 = [a3 messageId];
                  }
                  else {
                    uint64_t v15 = 999999999;
                  }
                  xpc_object_t v16 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend((id)objc_msgSend(v14, "data"), "bytes"), objc_msgSend((id)objc_msgSend(v14, "data"), "length"), 4);
                  -[CTMessageCenter sendSMSWithText:text:serviceCenter:toAddress:withID:](self, "sendSMSWithText:text:serviceCenter:toAddress:withID:", [a3 context], v16, 0, objc_msgSend(v13, "canonicalFormat"), v15);
                }
              }
            }
          }
          xpc_object_t v13 = (void *)[v9 nextObject];
        }
        while (v13);
      }
      if ([v11 count]) {
        [a3 removeRecipientsInArray:v11];
      }

      a4 = v19;
    }
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "recipients"), "count");
    if (v17 != v8)
    {
      if (a4 && v17)
      {

        id v18 = +[CTMMSEncoder encodeMessage:a3];
LABEL_26:
        *a4 = v18;
        return;
      }
      if (!v17)
      {
        [a3 setMessageType:1];
        if (a4)
        {

          id v18 = 0;
          goto LABEL_26;
        }
      }
    }
  }
}

- ($2825F4736939C4A6D3AD43837233062D)sendMMS:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v20 = +[CTMMSEncoder encodeMessage:](CTMMSEncoder, "encodeMessage:");
  if (!v20)
  {
    uint64_t v12 = CTLogMessageCenter();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter sendMMS:]();
    }
    return ($2825F4736939C4A6D3AD43837233062D)0;
  }
  CFStringRef MobileUser = (const __CFString *)_CFStringGetMobileUser();
  CFPropertyListRef v6 = CFPreferencesCopyValue(@"SendTextMMSToShortCodeAsSMS", @"com.apple.carrier_1", MobileUser, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v6)
  {
    int v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CFBooleanGetTypeID() && CFEqual(v7, (CFTypeRef)*MEMORY[0x1E4F1CFD0]))
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "items"), "count");
      id v10 = (void *)[a3 items];
      if (v9 == 1)
      {
        xpc_object_t v11 = (void *)[v10 objectAtIndex:0];
      }
      else
      {
        if ([v10 count] != 2) {
          goto LABEL_13;
        }
        xpc_object_t v13 = objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 0);
        uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 1);
        if (objc_msgSend((id)objc_msgSend(v13, "contentType"), "caseInsensitiveCompare:", @"application/smil")) {
          goto LABEL_13;
        }
        xpc_object_t v11 = (void *)v14;
      }
      if (!objc_msgSend((id)objc_msgSend(v11, "contentType"), "caseInsensitiveCompare:", @"text/plain")) {
        [(CTMessageCenter *)self sendMessageAsSmsToShortCodeRecipients:a3 andReplaceData:&v20];
      }
    }
LABEL_13:
    CFRelease(v7);
    if (v20) {
      goto LABEL_14;
    }
    return ($2825F4736939C4A6D3AD43837233062D)0;
  }
LABEL_14:
  if ([a3 context])
  {
    uint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "context"), "slotID");
  }
  else
  {
    uint64_t v17 = CTLogMessageCenter();
    uint64_t v15 = 1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = 1;
      id v18 = CTSubscriptionSlotAsString(1);
      *(_DWORD *)buf = 136315138;
      unint64_t v22 = v18;
      _os_log_impl(&dword_18444A000, v17, OS_LOG_TYPE_INFO, "Forcing MMS to:%s", buf, 0xCu);
    }
  }
  $2825F4736939C4A6D3AD43837233062D v16 = -[CTMessageCenter sendMMSFromData:messageId:subSlot:](self, "sendMMSFromData:messageId:subSlot:", v20, [a3 messageId], v15);

  return v16;
}

- ($2825F4736939C4A6D3AD43837233062D)send:(id)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)[(CTMessageCenter *)self send:a3 withMoreToFollow:0];
}

- ($2825F4736939C4A6D3AD43837233062D)send:(id)a3 withMoreToFollow:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 messageId] == -1)
  {
    v8.var0 = 0;
    unint64_t v9 = 0xFFFFFFFF00000000;
  }
  else
  {
    if (![a3 messageType])
    {
      if (objc_msgSend((id)objc_msgSend(a3, "items"), "count") == 1
        && !objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 0), "contentType"), "caseInsensitiveCompare:", @"text/plain"))
      {
        [a3 setMessageType:1];
      }
      if (![a3 messageType]) {
        [a3 setMessageType:2];
      }
    }
    int v7 = [a3 messageType];
    if (v7)
    {
      if (v7 == 2)
      {
        $2825F4736939C4A6D3AD43837233062D v8 = [(CTMessageCenter *)self sendMMS:a3];
        goto LABEL_17;
      }
      if (v7 == 1)
      {
        $2825F4736939C4A6D3AD43837233062D v8 = [(CTMessageCenter *)self sendSMS:a3 withMoreToFollow:v4 trackingID:0];
LABEL_17:
        unint64_t v9 = *(void *)&v8 & 0xFFFFFFFF00000000;
        return ($2825F4736939C4A6D3AD43837233062D)(v8.var0 | v9);
      }
    }
    else
    {
      id v10 = CTLogMessageCenter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter send:withMoreToFollow:]();
      }
    }
    unint64_t v9 = 0;
    v8.var0 = 0;
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v8.var0 | v9);
}

- (id)incomingMessageWithId:(unsigned int)a3
{
  if (_messageCenterServerConnection)
  {
    uint64_t v3 = *(void *)&a3;
    xpc_object_t xdict = 0;
    xpc_object_t v29 = xpc_null_create();
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kSmsRetrieveMessage", &object, "kRequest", &v27);
    xpc_release(object);
    xpc_object_t xdict = v27;
    xpc_object_t v27 = xpc_null_create();
    xpc_release(v27);
    xpc_object_t v4 = xpc_int64_create(v3);
    if (!v4) {
      xpc_object_t v4 = xpc_null_create();
    }
    xpc_dictionary_set_value(xdict, "kSmsMessageID", v4);
    xpc_object_t v5 = xpc_null_create();
    xpc_release(v4);
    xpc_release(v5);
    if ((unint64_t)SendXpcMessage(_messageCenterServerConnection, &xdict, &v29) >> 32)
    {
      uint64_t v12 = CTLogMessageCenter();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter incomingMessageWithId:]();
      }
      xpc_object_t v7 = 0;
      CFDataRef v8 = 0;
      goto LABEL_41;
    }
    xpc_object_t object = &v29;
    xpc_object_t v26 = "kSmsReplyEnabled";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v27);
    uint64_t v6 = xpc::dyn_cast_or_default((xpc *)&v27, 0);
    xpc_release(v27);
    if (MEMORY[0x1853203E0](v29) == MEMORY[0x1E4F14590])
    {
      xpc_object_t value = (ctu *)xpc_dictionary_get_value(v29, "kSmsMessageBody");
      ctu::xpc_to_cf((uint64_t *)&v27, value, v14);
      ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&object, (CFTypeRef *)&v27);
      CFDataRef v8 = (const __CFData *)object;
      xpc_object_t object = 0;
      if (v27) {
        CFRelease(v27);
      }
      uint64_t v15 = (ctu *)xpc_dictionary_get_value(v29, "kSmsMobileCountryCode");
      ctu::xpc_to_cf((uint64_t *)&v27, v15, v16);
      ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&object, (CFTypeRef *)&v27);
      xpc_object_t v7 = object;
      xpc_object_t object = 0;
      if (v27) {
        CFRelease(v27);
      }
      xpc_object_t object = &v29;
      xpc_object_t v26 = "kSmsMessageType";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v27);
      int v9 = xpc::dyn_cast_or_default((xpc *)&v27, 0);
      xpc_release(v27);
    }
    else
    {
      xpc_object_t v7 = 0;
      CFDataRef v8 = 0;
      int v9 = 0;
    }
    if (v8) {
      uint64_t v17 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      uint64_t v17 = 0;
    }
    if (!v17)
    {
      xpc_object_t v19 = CTLogMessageCenter();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter incomingMessageWithId:]();
      }
      goto LABEL_41;
    }
    if (!CFDataGetLength(v8))
    {
      id v20 = CTLogMessageCenter();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter incomingMessageWithId:]();
      }
      goto LABEL_41;
    }
    if (xpc_dictionary_get_value(v29, "kSmsSubInstance"))
    {
      xpc_object_t object = &v29;
      xpc_object_t v26 = "kSmsSubInstance";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v27);
      uint64_t v18 = xpc::dyn_cast_or_default((xpc *)&v27, 0);
      xpc_release(v27);
      if (!v8) {
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v18 = 0;
      if (!v8) {
        goto LABEL_41;
      }
    }
    if (v9 == 1)
    {
      id v21 = +[CTMMSEncoder decodeSmsFromData:[[CTXPCServiceSubscriptionContext alloc] initWithSlot:v18] data:v8];
      xpc_object_t v11 = v21;
      if (!v21)
      {
        uint64_t v23 = CTLogMessageCenter();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[CTMessageCenter incomingMessageWithId:].cold.5();
        }
        goto LABEL_41;
      }
      goto LABEL_36;
    }
    if (v9 == 2)
    {
      id v21 = +[CTMMSEncoder decodeMessageFromData:[[CTXPCServiceSubscriptionContext alloc] initWithSlot:v18] data:v8];
      xpc_object_t v11 = v21;
      if (!v21)
      {
        unint64_t v22 = CTLogMessageCenter();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[CTMessageCenter incomingMessageWithId:].cold.4();
        }
        goto LABEL_41;
      }
LABEL_36:
      [v21 setReplyEnabled:v6];
      [v11 setCountryCode:v7];
      [v11 setMessageId:v3];
LABEL_42:
      xpc_release(xdict);
      xpc_release(v29);
      if (v7) {
        CFRelease(v7);
      }
      if (v8) {
        CFRelease(v8);
      }
      return v11;
    }
LABEL_41:
    xpc_object_t v11 = 0;
    goto LABEL_42;
  }
  id v10 = CTLogMessageCenter();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CTMessageCenter incomingMessageWithId:]();
  }
  return 0;
}

- (int)incomingMessageCount
{
  if (_messageCenterServerConnection)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kSmsGetIncomingMessageCount", object, "kRequest", &v8);
    xpc_release(object[0]);
    xpc_object_t v9 = v8;
    xpc_object_t v8 = xpc_null_create();
    xpc_release(v8);
    xpc_object_t v8 = xpc_null_create();
    if ((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v9, &v8) >> 32)
    {
      v2 = CTLogMessageCenter();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter incomingMessageCount]();
      }
      int v3 = -1;
    }
    else if (MEMORY[0x1853203E0](v8) == MEMORY[0x1E4F14590])
    {
      object[0] = &v8;
      object[1] = "kSmsIncomingMessageCount";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v7);
      int v3 = xpc::dyn_cast_or_default((xpc *)&v7, 0);
      xpc_release(v7);
    }
    else
    {
      int v3 = 0;
    }
    xpc_release(v8);
    xpc_release(v9);
  }
  else
  {
    xpc_object_t v4 = CTLogMessageCenter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter incomingMessageCount]();
    }
    return 0;
  }
  return v3;
}

- (void)addMessageOfType:(int)a3 toArray:(id)a4 withIdsFromArray:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  xpc_object_t v8 = (void *)[a5 objectEnumerator];
  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    xpc_object_t v11 = (void *)v9;
    if (a3 == 2) {
      uint64_t v12 = "mms";
    }
    else {
      uint64_t v12 = "sms";
    }
    *(void *)&long long v10 = 134218498;
    long long v16 = v10;
    do
    {
      id v13 = -[CTMessageCenter incomingMessageWithId:](self, "incomingMessageWithId:", objc_msgSend(v11, "intValue", v16));
      if (v13)
      {
        [a4 addObject:v13];
      }
      else
      {
        uint64_t v14 = CTLogMessageCenter();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = [v11 integerValue];
          *(_DWORD *)buf = v16;
          uint64_t v18 = v15;
          __int16 v19 = 1024;
          int v20 = a3;
          __int16 v21 = 2080;
          unint64_t v22 = v12;
          _os_log_error_impl(&dword_18444A000, v14, OS_LOG_TYPE_ERROR, "couldn't get message %ld, type %d (%s)", buf, 0x1Cu);
        }
      }
      xpc_object_t v11 = (void *)[v8 nextObject];
    }
    while (v11);
  }
}

- (id)allIncomingMessages
{
  if (_messageCenterServerConnection)
  {
    xpc_object_t object = 0;
    int v3 = (xpc_object_t *)xpc::dict_creator::dict_creator((xpc::dict_creator *)&v18);
    xpc::dict_creator::operator()<char const*>("kSmsGetRecievedMessageIds", v3, "kRequest", (xpc_object_t *)&v16);
    xpc_release(v18);
    xpc_object_t object = (xpc_object_t)v16;
    CFTypeRef v16 = xpc_null_create();
    xpc_release((xpc_object_t)v16);
    xpc_object_t v18 = 0;
    xpc_object_t v18 = xpc_null_create();
    if (!((unint64_t)SendXpcMessage(_messageCenterServerConnection, &object, &v18) >> 32)
      && MEMORY[0x1853203E0](v18) == MEMORY[0x1E4F14590])
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      CFTypeRef v16 = 0;
      xpc_object_t value = (ctu *)xpc_dictionary_get_value(v18, "kSmsRecievedSmsMessageIds");
      ctu::xpc_to_cf((uint64_t *)&cf, value, v9);
      ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&v16, &cf);
      if (cf) {
        CFRelease(cf);
      }
      if (v16) {
        long long v10 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
      }
      else {
        long long v10 = 0;
      }
      if (v10) {
        -[CTMessageCenter addMessageOfType:toArray:withIdsFromArray:](self, "addMessageOfType:toArray:withIdsFromArray:", 1, v7);
      }
      CFTypeRef cf = 0;
      xpc_object_t v11 = (ctu *)xpc_dictionary_get_value(v18, "kSmsRecievedMmsMessageIds");
      ctu::xpc_to_cf((uint64_t *)&v14, v11, v12);
      ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&cf, &v14);
      if (v14) {
        CFRelease(v14);
      }
      if (cf) {
        id v13 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
      }
      else {
        id v13 = 0;
      }
      if (v13) {
        -[CTMessageCenter addMessageOfType:toArray:withIdsFromArray:](self, "addMessageOfType:toArray:withIdsFromArray:", 2, v7);
      }
      id v4 = v7;
      if (cf) {
        CFRelease(cf);
      }
      if (v16) {
        CFRelease(v16);
      }
    }
    else
    {
      id v4 = (id)[MEMORY[0x1E4F1CA48] array];
    }
    xpc_release(v18);
    xpc_release(object);
  }
  else
  {
    xpc_object_t v5 = CTLogMessageCenter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter allIncomingMessages]();
    }
    return (id)[MEMORY[0x1E4F1C978] array];
  }
  return v4;
}

- (void)acknowledgeIncomingMessageWithId:(unsigned int)a3
{
}

- (void)acknowledgeOutgoingMessageWithId:(unsigned int)a3
{
}

- (id)encodeMessage:(id)a3
{
  return +[CTMMSEncoder encodeMessage:a3];
}

- (id)decodeMessage:(id)a3
{
  id v4 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];

  return +[CTMMSEncoder decodeMessageFromData:v4 data:a3];
}

- ($2825F4736939C4A6D3AD43837233062D)isDeliveryReportsEnabled:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return ($2825F4736939C4A6D3AD43837233062D)0;
}

- (BOOL)isMmsEnabled
{
  int v3 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];

  return [(CTMessageCenter *)self isMmsConfiguredForSub:v3];
}

- ($2825F4736939C4A6D3AD43837233062D)isMmsEnabledForSub:(id)a3 enabled:(BOOL *)a4
{
  if (!_messageCenterServerConnection)
  {
    uint64_t v6 = CTLogMessageCenter();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter isMmsEnabledForSub:enabled:]();
    }
    unint64_t v7 = 0x3600000000;
    goto LABEL_11;
  }
  if (!a4)
  {
    xpc_object_t v8 = CTLogMessageCenter();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter isMmsEnabledForSub:enabled:]();
    }
    unint64_t v7 = 0x1600000000;
LABEL_11:
    uint64_t v9 = 1;
    return ($2825F4736939C4A6D3AD43837233062D)(v9 | v7);
  }
  if (a3) {
    int64_t v5 = [a3 slotID];
  }
  else {
    int64_t v5 = 1;
  }
  xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
  xpc::dict_creator::operator()<char const*>("kSmsIsMmsConfigured", object, "kRequest", &v17);
  xpc_release(object[0]);
  xpc_object_t v10 = v17;
  xpc_object_t v18 = v17;
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v17);
  xpc_object_t v11 = xpc_int64_create(v5);
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  xpc_dictionary_set_value(v10, "kSmsSubInstance", v11);
  xpc_object_t v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  xpc_object_t v17 = xpc_null_create();
  unint64_t v13 = SendXpcMessage(_messageCenterServerConnection, &v18, &v17);
  if (!HIDWORD(v13) && MEMORY[0x1853203E0](v17) == MEMORY[0x1E4F14590])
  {
    object[0] = &v17;
    object[1] = "kSmsMmsIsConfigured";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v16);
    *a4 = xpc::dyn_cast_or_default((xpc *)&v16, 0);
    xpc_release(v16);
  }
  xpc_release(v17);
  xpc_release(v18);
  unint64_t v7 = v13 & 0xFFFFFFFF00000000;
  uint64_t v9 = v13;
  return ($2825F4736939C4A6D3AD43837233062D)(v9 | v7);
}

- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5
{
  int v6 = -1;
  return [(CTMessageCenter *)self sendSMSWithText:a3 serviceCenter:a4 toAddress:a5 trackingID:&v6];
}

- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 && [a3 slotID] != 1)
  {
    if ([a3 slotID] != 2)
    {
      xpc_object_t v17 = CTLogMessageCenter();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18444A000, v17, OS_LOG_TYPE_INFO, "Invalid Slot context", buf, 2u);
      }
      return 0;
    }
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = 1;
  }
  xpc_object_t v12 = objc_alloc_init(CTMessage);
  unint64_t v13 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:v11];
  [(CTMessage *)v12 setContext:v13];
  int v19 = -1;
  if (!v12) {
    return 0;
  }
  if (a4) {
    [(CTMessage *)v12 addText:a4];
  }
  if (!a6)
  {

    return 0;
  }
  [(CTMessage *)v12 addRecipient:a6];
  if (a5) {
    [(CTMessage *)v12 setServiceCenter:+[CTPhoneNumber phoneNumberWithDigits:[(CTXPCServiceSubscriptionContext *)v13 slotID] digits:a5 countryCode:0]];
  }
  [(CTMessage *)v12 setMessageId:0xFFFFFFFFLL];
  [(CTMessage *)v12 setMessageType:1];
  BOOL v14 = [(CTMessageCenter *)self sendSMS:v12 withMoreToFollow:0 trackingID:&v19] == 0;

  uint64_t v15 = CTLogMessageCenter();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [a6 UTF8String];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = v16;
    __int16 v22 = 1024;
    int v23 = v19;
    _os_log_impl(&dword_18444A000, v15, OS_LOG_TYPE_INFO, "Tracking sms to destination %s with message id: %u", buf, 0x12u);
  }
  return v14;
}

- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 withID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v11 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];

  return [(CTMessageCenter *)self sendSMSWithText:v11 text:a3 serviceCenter:a4 toAddress:a5 withMoreToFollow:0 withID:v6];
}

- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 withID:(unsigned int)a7
{
  return [(CTMessageCenter *)self sendSMSWithText:a3 text:a4 serviceCenter:a5 toAddress:a6 withMoreToFollow:0 withID:*(void *)&a7];
}

- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 trackingID:(unsigned int *)a6
{
  uint64_t v11 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];

  return [(CTMessageCenter *)self sendSMSWithText:v11 text:a3 serviceCenter:a4 toAddress:a5 trackingID:a6];
}

- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 trackingID:(unsigned int *)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a7) {
    return 0;
  }
  *a7 = -1;
  unint64_t v13 = objc_alloc_init(CTMessage);
  if (!v13) {
    return 0;
  }
  BOOL v14 = v13;
  [(CTMessage *)v13 setContext:a3];
  if (a4) {
    [(CTMessage *)v14 addText:a4];
  }
  if (!a6)
  {

    return 0;
  }
  [(CTMessage *)v14 addRecipient:a6];
  if (a5) {
    -[CTMessage setServiceCenter:](v14, "setServiceCenter:", +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", [a3 slotID], a5, 0));
  }
  [(CTMessage *)v14 setMessageType:1];
  BOOL v15 = [(CTMessageCenter *)self sendSMS:v14 withMoreToFollow:0 trackingID:a7] == 0;

  uint64_t v16 = CTLogMessageCenter();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [a6 UTF8String];
    uint64_t v18 = [a5 UTF8String];
    unsigned int v19 = *a7;
    int v21 = 136315650;
    uint64_t v22 = v17;
    __int16 v23 = 2080;
    uint64_t v24 = v18;
    __int16 v25 = 1024;
    unsigned int v26 = v19;
    _os_log_impl(&dword_18444A000, v16, OS_LOG_TYPE_INFO, "Tracking sms to destination %s service center %s with message id: %u", (uint8_t *)&v21, 0x1Cu);
  }
  return v15;
}

- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 withMoreToFollow:(BOOL)a6 withID:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  unint64_t v13 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:1];

  return [(CTMessageCenter *)self sendSMSWithText:v13 text:a3 serviceCenter:a4 toAddress:a5 withMoreToFollow:v8 withID:v7];
}

- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 withMoreToFollow:(BOOL)a7 withID:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v9 = a7;
  BOOL v15 = objc_alloc_init(CTMessage);
  if (!v15) {
    return 0;
  }
  uint64_t v16 = v15;
  [(CTMessage *)v15 setContext:a3];
  if (a4) {
    [(CTMessage *)v16 addText:a4];
  }
  if (a6)
  {
    [(CTMessage *)v16 addRecipient:a6];
    if (a5) {
      -[CTMessage setServiceCenter:](v16, "setServiceCenter:", +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", [a3 slotID], a5, 0));
    }
    [(CTMessage *)v16 setMessageId:v8];
    [(CTMessage *)v16 setMessageType:1];
    BOOL v17 = [(CTMessageCenter *)self send:v16 withMoreToFollow:v9] == 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)simulateSmsReceived:(id)a3
{
  if (_messageCenterServerConnection)
  {
    int v3 = (ctu *)a3;
    if (a3)
    {
      xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
      xpc::dict_creator::operator()<char const*>("kSimulateSmsReceived", object, "kRequest", &v12);
      xpc_release(object[0]);
      xpc_object_t v4 = v12;
      xpc_object_t v13 = v12;
      xpc_object_t v12 = xpc_null_create();
      xpc_release(v12);
      xpc_object_t v12 = xpc_null_create();
      ctu::cf_to_xpc((uint64_t *)&value, v3, v5);
      xpc_dictionary_set_value(v4, "kCTSmsPdu", value);
      xpc_object_t v6 = value;
      xpc_object_t value = xpc_null_create();
      xpc_release(v6);
      xpc_release(value);
      xpc_object_t value = 0;
      if ((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v13, &v12) >> 32)
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        object[0] = &v12;
        object[1] = "kDidSucceed";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v10);
        LOBYTE(v3) = xpc::dyn_cast_or_default((xpc *)&v10, 0);
        xpc_release(v10);
      }
      xpc_release(v12);
      xpc_release(v13);
    }
  }
  else
  {
    uint64_t v7 = CTLogMessageCenter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter simulateSmsReceived:]();
    }
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (BOOL)simulateDeferredMessage
{
  if (_messageCenterServerConnection)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kSimulateDeferredMessage", object, "kRequest", &v7);
    xpc_release(object[0]);
    xpc_object_t v8 = v7;
    xpc_object_t v7 = xpc_null_create();
    xpc_release(v7);
    xpc_object_t v7 = xpc_null_create();
    if ((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v8, &v7) >> 32)
    {
      char v2 = 0;
    }
    else
    {
      object[0] = &v7;
      object[1] = "kDidSucceed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v6);
      char v2 = xpc::dyn_cast_or_default((xpc *)&v6, 0);
      xpc_release(v6);
    }
    xpc_release(v7);
    xpc_release(v8);
  }
  else
  {
    int v3 = CTLogMessageCenter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter simulateDeferredMessage]();
    }
    return 0;
  }
  return v2;
}

- (BOOL)sendBinarySMS:(id)a3 trackingID:(unsigned int *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a3 || ![a3 isValid]) {
    return 0;
  }
  if ([a3 context])
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "context"), "slotID");
    xpc_object_t v7 = CTLogMessageCenter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = CTSubscriptionSlotAsString(v6);
      xpc_object_t v8 = "sendBinarySMS requested for Slot %s";
      BOOL v9 = v7;
      uint32_t v10 = 12;
LABEL_9:
      _os_log_impl(&dword_18444A000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else
  {
    xpc_object_t v12 = CTLogMessageCenter();
    uint64_t v6 = 1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      xpc_object_t v8 = "sendBinarySMS slot forced to CTSubscriptionSlotOne";
      uint64_t v6 = 1;
      BOOL v9 = v12;
      uint32_t v10 = 2;
      goto LABEL_9;
    }
  }
  xpc::dict_creator::dict_creator((xpc::dict_creator *)buf);
  xpc::dict_creator::operator()<char const*>("kSmsSendMessage", (xpc_object_t *)buf, "kRequest", __p);
  xpc_release(*(xpc_object_t *)buf);
  xpc_object_t v13 = __p[0];
  xpc_object_t v44 = __p[0];
  __p[0] = xpc_null_create();
  xpc_release(__p[0]);
  xpc_object_t v14 = xpc_int64_create(1);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kSmsMessageType", v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  uint64_t v16 = (ctu *)[a3 payload];
  ctu::cf_to_xpc((uint64_t *)&value, v16, v17);
  xpc_dictionary_set_value(v13, "kSmsBinaryPayload", value);
  xpc_object_t v18 = value;
  xpc_object_t value = xpc_null_create();
  xpc_release(v18);
  xpc_release(value);
  xpc_object_t value = 0;
  xpc_object_t v19 = xpc_int64_create((int)[a3 srcPort]);
  if (!v19) {
    xpc_object_t v19 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kSmsApplicationSourcePort", v19);
  xpc_object_t v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  xpc_object_t v21 = xpc_int64_create((int)[a3 dstPort]);
  if (!v21) {
    xpc_object_t v21 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kSmsApplicationDestinationPort", v21);
  xpc_object_t v22 = xpc_null_create();
  xpc_release(v21);
  xpc_release(v22);
  xpc_object_t v23 = xpc_int64_create([a3 portAddressingScheme]);
  if (!v23) {
    xpc_object_t v23 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kSmsApplicationAddressingScheme", v23);
  xpc_object_t v24 = xpc_null_create();
  xpc_release(v23);
  xpc_release(v24);
  [a3 destinationAddress];
  memset(buf, 0, sizeof(buf));
  uint64_t v46 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = *(_OWORD *)buf;
  uint64_t v42 = v46;
  if (v46 >= 0) {
    __int16 v25 = __p;
  }
  else {
    __int16 v25 = *(void ***)buf;
  }
  xpc_object_t v26 = xpc_string_create((const char *)v25);
  if (!v26) {
    xpc_object_t v26 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kSmsDestinationAddress", v26);
  xpc_object_t v27 = xpc_null_create();
  xpc_release(v26);
  xpc_release(v27);
  if (SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
  [a3 smscAddress];
  memset(buf, 0, sizeof(buf));
  uint64_t v46 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = *(_OWORD *)buf;
  uint64_t v42 = v46;
  if (v46 >= 0) {
    xpc_object_t v28 = __p;
  }
  else {
    xpc_object_t v28 = *(void ***)buf;
  }
  xpc_object_t v29 = xpc_string_create((const char *)v28);
  if (!v29) {
    xpc_object_t v29 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kSmsSmscAddress", v29);
  xpc_object_t v30 = xpc_null_create();
  xpc_release(v29);
  xpc_release(v30);
  if (SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v31 = xpc_BOOL_create(1);
  if (!v31) {
    xpc_object_t v31 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kBypassSupportedMessageModesCheck", v31);
  xpc_object_t v32 = xpc_null_create();
  xpc_release(v31);
  xpc_release(v32);
  xpc_object_t v33 = xpc_int64_create(v6);
  if (!v33) {
    xpc_object_t v33 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kSmsSubInstance", v33);
  xpc_object_t v34 = xpc_null_create();
  xpc_release(v33);
  xpc_release(v34);
  xpc_object_t v35 = xpc_int64_create([a3 smsType]);
  if (!v35) {
    xpc_object_t v35 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, "kSmsType", v35);
  xpc_object_t v36 = xpc_null_create();
  xpc_release(v35);
  xpc_release(v36);
  __p[0] = xpc_null_create();
  int v37 = SendXpcMessage(_messageCenterServerConnection, &v44, __p);
  if (MEMORY[0x1853203E0](__p[0]) == MEMORY[0x1E4F14590])
  {
    *(void *)buf = __p;
    *(void *)&buf[8] = "kSmsMessageResult";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &object);
    char v38 = xpc::dyn_cast_or_default((xpc *)&object, 0);
    xpc_release(object);
    if (a4)
    {
      *(void *)buf = __p;
      *(void *)&buf[8] = "kSmsMessageID";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &object);
      *a4 = xpc::dyn_cast_or_default((xpc *)&object, (const object *)0xFFFFFFFFLL);
      xpc_release(object);
    }
  }
  else
  {
    char v38 = 0;
  }
  if (v37) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v38;
  }
  xpc_release(__p[0]);
  xpc_release(v44);
  return v11;
}

- (void)emergencySessionIntentStart:(id)a3
{
  if (a3)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kSmsEmergencyUISession", object, "kRequest", &v15);
    xpc_release(object[0]);
    xpc_object_t v4 = v15;
    xpc_object_t v16 = v15;
    xpc_object_t v15 = xpc_null_create();
    xpc_release(v15);
    xpc_object_t v5 = xpc_int64_create([a3 slotID]);
    if (!v5) {
      xpc_object_t v5 = xpc_null_create();
    }
    xpc_dictionary_set_value(v4, "kSmsSubInstance", v5);
    xpc_object_t v6 = xpc_null_create();
    xpc_release(v5);
    xpc_release(v6);
    xpc_object_t v7 = xpc_int64_create(1);
    if (!v7) {
      xpc_object_t v7 = xpc_null_create();
    }
    xpc_dictionary_set_value(v4, "kEmergencySessionStatus", v7);
    xpc_object_t v8 = xpc_null_create();
    xpc_release(v7);
    xpc_release(v8);
    xpc_object_t v15 = xpc_null_create();
    if (SendXpcMessage(_messageCenterServerConnection, &v16, &v15))
    {
      BOOL v9 = CTLogMessageCenter();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter emergencySessionIntentStart:]();
      }
    }
    else if (MEMORY[0x1853203E0](v15) == MEMORY[0x1E4F14590])
    {
      object[0] = &v15;
      object[1] = "kDidSucceed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v14);
      char v11 = xpc::dyn_cast_or_default((xpc *)&v14, 0);
      xpc_release(v14);
      if ((v11 & 1) == 0)
      {
        xpc_object_t v12 = CTLogMessageCenter();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CTMessageCenter emergencySessionIntentStart:]();
        }
      }
    }
    xpc_release(v15);
    xpc_release(v16);
  }
  else
  {
    uint32_t v10 = CTLogMessageCenter();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter emergencySessionIntentStart:]();
    }
  }
}

- (void)emergencySessionIntentEnd:(id)a3
{
  if (a3)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kSmsEmergencyUISession", &object, "kRequest", &v15);
    xpc_release(object);
    xpc_object_t v4 = v15;
    xpc_object_t v16 = v15;
    xpc_object_t v15 = xpc_null_create();
    xpc_release(v15);
    xpc_object_t v5 = xpc_int64_create([a3 slotID]);
    if (!v5) {
      xpc_object_t v5 = xpc_null_create();
    }
    xpc_dictionary_set_value(v4, "kSmsSubInstance", v5);
    xpc_object_t v6 = xpc_null_create();
    xpc_release(v5);
    xpc_release(v6);
    xpc_object_t object = &v16;
    xpc_object_t v13 = "kEmergencySessionStatus";
    xpc::dict::object_proxy::operator=((uint64_t)&object, &v14);
    xpc_release(v14);
    xpc_object_t v14 = 0;
    xpc_object_t v15 = xpc_null_create();
    if (SendXpcMessage(_messageCenterServerConnection, &v16, &v15))
    {
      xpc_object_t v7 = CTLogMessageCenter();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CTMessageCenter emergencySessionIntentEnd:]();
      }
    }
    else if (MEMORY[0x1853203E0](v15) == MEMORY[0x1E4F14590])
    {
      xpc_object_t object = &v15;
      xpc_object_t v13 = "kDidSucceed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v11);
      char v9 = xpc::dyn_cast_or_default((xpc *)&v11, 0);
      xpc_release(v11);
      if ((v9 & 1) == 0)
      {
        uint32_t v10 = CTLogMessageCenter();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CTMessageCenter emergencySessionIntentEnd:]();
        }
      }
    }
    xpc_release(v15);
    xpc_release(v16);
  }
  else
  {
    xpc_object_t v8 = CTLogMessageCenter();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CTMessageCenter emergencySessionIntentEnd:]();
    }
  }
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "No server connection...", v2, v3, v4, v5, v6);
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "No items in message", v2, v3, v4, v5, v6);
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Unable to serialize sms", v2, v3, v4, v5, v6);
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "Error sending message: %d", v2, v3, v4, v5, v6);
}

- (void)sendSMS:(uint8_t *)buf withMoreToFollow:(int)a2 trackingID:(os_log_t)log .cold.5(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "No message result for message ID: %u", buf, 8u);
}

- (void)sendSMS:(NSObject *)a1 withMoreToFollow:trackingID:.cold.6(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = CTSubscriptionSlotAsString(1);
  _os_log_error_impl(&dword_18444A000, a1, OS_LOG_TYPE_ERROR, "SMS slot forced to %s", (uint8_t *)&v2, 0xCu);
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "SMS must have exactly 1 recipient", v2, v3, v4, v5, v6);
}

- (void)sendSMS:(void *)a1 withMoreToFollow:(NSObject *)a2 trackingID:.cold.8(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 messageType];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "Sending SMS with wrong message type:%d", v3, 8u);
}

- (void)sendMMSFromData:messageId:subSlot:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "sendMMS called with no server connection", v2, v3, v4, v5, v6);
}

- (void)sendMMSFromData:messageId:subSlot:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "error sending message from data: %d", v2, v3, v4, v5, v6);
}

- (void)sendMMS:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "unable to encode message", v2, v3, v4, v5, v6);
}

- (void)send:withMoreToFollow:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "messageType is unknown", v2, v3, v4, v5, v6);
}

- (void)incomingMessageWithId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "incomingMessage called no server connection", v2, v3, v4, v5, v6);
}

- (void)incomingMessageWithId:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "Failed to retrieve message: %u", v2, v3, v4, v5, v6);
}

- (void)incomingMessageWithId:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Retrieved a message with zero length", v2, v3, v4, v5, v6);
}

- (void)incomingMessageWithId:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "decoded MMS is NULL", v2, v3, v4, v5, v6);
}

- (void)incomingMessageWithId:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "decoded SMS is NULL", v2, v3, v4, v5, v6);
}

- (void)incomingMessageCount
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "Failed to incoming message count: %d", v2, v3, v4, v5, v6);
}

- (void)allIncomingMessages
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "allIncomingMessages called with no server connection", v2, v3, v4, v5, v6);
}

- (void)isMmsConfiguredForSub:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "isMmsConfigured called with no server connection", v2, v3, v4, v5, v6);
}

- (void)isMmsEnabledForSub:enabled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "MMS configured check called with no server connection", v2, v3, v4, v5, v6);
}

- (void)isMmsEnabledForSub:enabled:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Invalid parameters for isMmsEnabledForSub", v2, v3, v4, v5, v6);
}

- (void)getCharacterCountForSub:count:andMessageSplitThreshold:forSmsText:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Character count slot forced to CTSubscriptionSlotOne", v2, v3, v4, v5, v6);
}

- (void)simulateSmsReceived:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "simulateSmsReceived called with no server connection", v2, v3, v4, v5, v6);
}

- (void)simulateDeferredMessage
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "simulateDeferredMessage called with no server connection", v2, v3, v4, v5, v6);
}

- (void)emergencySessionIntentStart:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Invalid context for early emergency session start", v2, v3, v4, v5, v6);
}

- (void)emergencySessionIntentStart:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Failed to setup Emergency session start", v2, v3, v4, v5, v6);
}

- (void)emergencySessionIntentStart:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Error handling early emergency session start", v2, v3, v4, v5, v6);
}

- (void)emergencySessionIntentEnd:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Invalid context for early emergency session end", v2, v3, v4, v5, v6);
}

- (void)emergencySessionIntentEnd:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Failed to setup Emergency session end", v2, v3, v4, v5, v6);
}

- (void)emergencySessionIntentEnd:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Error handling early emergency session end", v2, v3, v4, v5, v6);
}

@end