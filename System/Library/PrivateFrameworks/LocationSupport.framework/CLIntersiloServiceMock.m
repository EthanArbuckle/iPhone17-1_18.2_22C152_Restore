@interface CLIntersiloServiceMock
- (NSMutableDictionary)keyedPayloads;
- (id)getPayloadForKey:(id)a3;
- (id)getPayloadForSelector:(SEL)a3;
- (id)syncgetPayloadForSelector:(SEL)a3;
- (void)beginService;
- (void)endService;
- (void)removePayloadForKey:(id)a3;
- (void)removePayloadForSelector:(SEL)a3;
- (void)setKeyedPayloads:(id)a3;
- (void)setPayload:(id)a3 forKey:(id)a4;
- (void)setPayload:(id)a3 forSelector:(SEL)a4;
@end

@implementation CLIntersiloServiceMock

- (void)beginService
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(CLIntersiloServiceMock *)self setKeyedPayloads:v3];
}

- (void)endService
{
}

- (void)setPayload:(id)a3 forKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v6 = a4;
  v7 = [(CLIntersiloServiceMock *)self keyedPayloads];

  if (!v7)
  {
    v11 = sub_1A4558D84();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      v20 = &unk_1A45670B7;
      __int16 v21 = 2082;
      v22 = "assert";
      __int16 v23 = 2081;
      v24 = "self.keyedPayloads";
      _os_log_impl(&dword_1A4540000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Overrider didn't call up to super for beginService?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v12 = sub_1A4558D84();
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      v20 = &unk_1A45670B7;
      __int16 v21 = 2082;
      v22 = "assert";
      __int16 v23 = 2081;
      v24 = "self.keyedPayloads";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Overrider didn't call up to super for beginService?", "{\"msg%{public}.0s\":\"Overrider didn't call up to super for beginService?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v13 = sub_1A4558D84();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      v20 = &unk_1A45670B7;
      __int16 v21 = 2082;
      v22 = "assert";
      __int16 v23 = 2081;
      v24 = "self.keyedPayloads";
      _os_log_impl(&dword_1A4540000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Overrider didn't call up to super for beginService?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_19:

    abort_report_np();
  }
  v8 = [(CLIntersiloServiceMock *)self keyedPayloads];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    v14 = sub_1A4558D84();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      v20 = &unk_1A45670B7;
      __int16 v21 = 2082;
      v22 = "assert";
      __int16 v23 = 2081;
      v24 = "![self.keyedPayloads objectForKey:key]";
      _os_log_impl(&dword_1A4540000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Only one payload per key at at time\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v15 = sub_1A4558D84();
    if (os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      v20 = &unk_1A45670B7;
      __int16 v21 = 2082;
      v22 = "assert";
      __int16 v23 = 2081;
      v24 = "![self.keyedPayloads objectForKey:key]";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Only one payload per key at at time", "{\"msg%{public}.0s\":\"Only one payload per key at at time\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v13 = sub_1A4558D84();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v18 = 0;
      __int16 v19 = 2082;
      v20 = &unk_1A45670B7;
      __int16 v21 = 2082;
      v22 = "assert";
      __int16 v23 = 2081;
      v24 = "![self.keyedPayloads objectForKey:key]";
      _os_log_impl(&dword_1A4540000, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Only one payload per key at at time\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_19;
  }
  v10 = [(CLIntersiloServiceMock *)self keyedPayloads];
  [v10 setObject:v16 forKey:v6];

  [v16 setInUse:1];
}

- (id)getPayloadForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CLIntersiloServiceMock *)self keyedPayloads];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    v8 = sub_1A4558D84();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      id v16 = "assert";
      __int16 v17 = 2081;
      int v18 = "payload";
      _os_log_impl(&dword_1A4540000, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"A payload must be ready for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v9 = sub_1A4558D84();
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      id v16 = "assert";
      __int16 v17 = 2081;
      int v18 = "payload";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "A payload must be ready for this key", "{\"msg%{public}.0s\":\"A payload must be ready for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v10 = sub_1A4558D84();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      id v16 = "assert";
      __int16 v17 = 2081;
      int v18 = "payload";
      _os_log_impl(&dword_1A4540000, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"A payload must be ready for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }

  return v6;
}

- (void)removePayloadForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v4 = [(CLIntersiloServiceMock *)self keyedPayloads];
  v5 = [v4 objectForKey:v10];

  if (!v5)
  {
    v7 = sub_1A4558D84();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      id v16 = "assert";
      __int16 v17 = 2081;
      int v18 = "payload";
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"A payload must be around to remove for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v8 = sub_1A4558D84();
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      id v16 = "assert";
      __int16 v17 = 2081;
      int v18 = "payload";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "A payload must be around to remove for this key", "{\"msg%{public}.0s\":\"A payload must be around to remove for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v9 = sub_1A4558D84();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      id v16 = "assert";
      __int16 v17 = 2081;
      int v18 = "payload";
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"A payload must be around to remove for this key\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  id v6 = [(CLIntersiloServiceMock *)self keyedPayloads];
  [v6 removeObjectForKey:v10];
}

- (void)setPayload:(id)a3 forSelector:(SEL)a4
{
  id v6 = a3;
  NSStringFromSelector(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(CLIntersiloServiceMock *)self setPayload:v6 forKey:v7];
}

- (id)syncgetPayloadForSelector:(SEL)a3
{
  id v4 = NSStringFromSelector(a3);
  v5 = [(CLIntersiloServiceMock *)self getPayloadForKey:v4];

  return v5;
}

- (id)getPayloadForSelector:(SEL)a3
{
  id v4 = NSStringFromSelector(a3);
  v5 = [(CLIntersiloServiceMock *)self getPayloadForKey:v4];

  return v5;
}

- (void)removePayloadForSelector:(SEL)a3
{
  NSStringFromSelector(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CLIntersiloServiceMock *)self removePayloadForKey:v4];
}

- (NSMutableDictionary)keyedPayloads
{
  return self->_keyedPayloads;
}

- (void)setKeyedPayloads:(id)a3
{
}

- (void).cxx_destruct
{
}

@end