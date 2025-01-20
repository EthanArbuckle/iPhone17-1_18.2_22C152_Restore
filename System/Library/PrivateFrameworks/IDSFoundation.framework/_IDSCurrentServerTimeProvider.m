@interface _IDSCurrentServerTimeProvider
- (BOOL)isAccurate;
- (_IDSCurrentServerTimeProvider)init;
- (id)apsConnection;
- (unint64_t)serverTimeInNanoSeconds;
@end

@implementation _IDSCurrentServerTimeProvider

- (_IDSCurrentServerTimeProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)_IDSCurrentServerTimeProvider;
  v2 = [(_IDSCurrentServerTimeProvider *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)sub_19DB69B70());
    if (qword_1E944F378 != -1) {
      dispatch_once(&qword_1E944F378, &unk_1EEFCE878);
    }
    uint64_t v4 = qword_1E944F388;
    id v5 = (id)qword_1E944F370;
    if (v4 != -1) {
      dispatch_once(&qword_1E944F388, &unk_1EEFCE8D8);
    }
    id v6 = (id)qword_1E944F380;
    v7 = im_primary_queue();
    uint64_t v10 = objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v3, v8, (uint64_t)v5, v9, v6, v7);
    id apsConnection = v2->_apsConnection;
    v2->_id apsConnection = (id)v10;
  }
  return v2;
}

- (BOOL)isAccurate
{
  return objc_msgSend_isConnected(self->_apsConnection, a2, v2, v3);
}

- (unint64_t)serverTimeInNanoSeconds
{
  if (sub_19DB69B70())
  {
    id v5 = sub_19DB69B70();
    return objc_msgSend_serverTimeInNanoSeconds(v5, v6, v7, v8);
  }
  else
  {
    uint64_t v10 = objc_msgSend_utilities(IDSFoundationLog, v2, v3, v4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_19DB82A4C(v10);
    }

    v14 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v11, v12, v13);
    objc_msgSend_timeIntervalSince1970(v14, v15, v16, v17);
    unint64_t v19 = (unint64_t)v18;

    return v19;
  }
}

- (id)apsConnection
{
  return self->_apsConnection;
}

- (void).cxx_destruct
{
}

@end