@interface CLIntersiloService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLIntersiloService)init;
- (CLIntersiloService)initWithInboundProtocol:(id)a3 outboundProtocol:(id)a4;
- (CLServiceVendor)vendor;
- (CLSilo)silo;
- (NSString)debugDescription;
- (void)setSilo:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)setVendor:(id)a3;
@end

@implementation CLIntersiloService

- (BOOL)valid
{
  return self->_valid;
}

- (CLSilo)silo
{
  return self->_silo;
}

- (CLServiceVendor)vendor
{
  return self->_vendor;
}

+ (id)getSilo
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "((void *)0)";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
      }
    }
    v3 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "((void *)0)";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
      }
    }
    v4 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "((void *)0)";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
  }
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
  }
  int v6 = (void *)qword_1EB30CE68;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
  {
    __int16 v7 = v6;
    uint64_t v15 = 68289282;
    *(_WORD *)v16 = 2082;
    *(void *)&v16[2] = &unk_1A45670B7;
    *(_WORD *)&v16[10] = 2114;
    *(void *)&v16[12] = objc_opt_class();
    id v8 = *(id *)&v16[12];
    _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"-becameFatallyBlocked:index: was not overriden\", \"class\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);

    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
    }
  }
  __int16 v9 = (void *)qword_1EB30CE68;
  if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
  {
    v10 = v9;
    __int16 v11 = objc_opt_class();
    uint64_t v15 = 68289282;
    *(_WORD *)v16 = 2082;
    *(void *)&v16[2] = &unk_1A45670B7;
    *(_WORD *)&v16[10] = 2114;
    *(void *)&v16[12] = v11;
    id v12 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A4540000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "-becameFatallyBlocked:index: was not overriden", "{\"msg%{public}.0s\":\"-becameFatallyBlocked:index: was not overriden\", \"class\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
  }
  unint64_t v13 = a4 + 1;
  if (v13 < objc_msgSend(v5, "count", v15, *(_OWORD *)v16, *(void *)&v16[16]))
  {
    v14 = [v5 objectAtIndexedSubscript:v13];
    [v14 becameFatallyBlocked:v5 index:v13];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    __int16 v7 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      unint64_t v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      uint64_t v15 = "assert";
      __int16 v16 = 2081;
      uint64_t v17 = "((void *)0)";
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
      }
    }
    id v8 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      unint64_t v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      uint64_t v15 = "assert";
      __int16 v16 = 2081;
      uint64_t v17 = "((void *)0)";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
      }
    }
    __int16 v9 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v11 = 0;
      __int16 v12 = 2082;
      unint64_t v13 = &unk_1A45670B7;
      __int16 v14 = 2082;
      uint64_t v15 = "assert";
      __int16 v16 = 2081;
      uint64_t v17 = "((void *)0)";
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
  }
}

- (CLIntersiloService)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB30CE70 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      id v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      __int16 v12 = "((void *)0)";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
      }
    }
    v3 = qword_1EB30CE68;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE68))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      id v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      __int16 v12 = "((void *)0)";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
      }
    }
    v4 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      id v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      __int16 v12 = "((void *)0)";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
  }
}

- (CLIntersiloService)initWithInboundProtocol:(id)a3 outboundProtocol:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CLIntersiloService;
  id v8 = [(CLIntersiloService *)&v15 init];
  __int16 v9 = v8;
  if (v8)
  {
    if (v6 && v7)
    {
      v10 = +[CLIntersiloInterface sharedInterface];
      v17[0] = &unk_1EF7F9EC0;
      v17[1] = &unk_1EF7F97D8;
      __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      [v10 extendSelectorInfoWithProtocol:v6 bases:v11];

      __int16 v12 = +[CLIntersiloInterface sharedInterface];
      __int16 v16 = &unk_1EF7F97D8;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      [v12 extendSelectorInfoWithProtocol:v7 bases:v13];
    }
    else
    {
      __int16 v12 = v8;
      __int16 v9 = 0;
    }
  }
  return v9;
}

- (void)setSilo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (CLSilo *)a3;
  if (self->_silo)
  {
    id v5 = sub_1A4558D84();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      objc_super v15 = "!_silo";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"The silo associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v6 = sub_1A4558D84();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      objc_super v15 = "!_silo";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "The silo associated with a CLIntersiloService may not be changed once set", "{\"msg%{public}.0s\":\"The silo associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v7 = sub_1A4558D84();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      objc_super v15 = "!_silo";
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"The silo associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  self->_silo = v4;
}

- (void)setVendor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (CLServiceVendor *)a3;
  if (self->_vendor)
  {
    id v5 = sub_1A4558D84();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      objc_super v15 = "!_vendor";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"The vendor associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v6 = sub_1A4558D84();
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      objc_super v15 = "!_vendor";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "The vendor associated with a CLIntersiloService may not be changed once set", "{\"msg%{public}.0s\":\"The vendor associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v7 = sub_1A4558D84();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = &unk_1A45670B7;
      __int16 v12 = 2082;
      uint64_t v13 = "assert";
      __int16 v14 = 2081;
      objc_super v15 = "!_vendor";
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"The vendor associated with a CLIntersiloService may not be changed once set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  self->_vendor = v4;
}

+ (BOOL)isSupported
{
  return 1;
}

- (NSString)debugDescription
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CLIntersiloService;
  v4 = [(CLIntersiloService *)&v9 debugDescription];
  id v5 = [(CLIntersiloService *)self universe];
  id v6 = [v5 silo];
  id v7 = [v3 stringWithFormat:@"%@\nSilo: %@", v4, v6];

  return (NSString *)v7;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_silo, 0);
}

@end