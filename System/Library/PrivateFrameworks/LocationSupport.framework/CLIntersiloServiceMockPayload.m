@interface CLIntersiloServiceMockPayload
- (BOOL)inUse;
- (CLIntersiloServiceMockPayload)initWithExpectation:(id)a3 inputDictionary:(id)a4;
- (NSDictionary)inputDictionary;
- (NSDictionary)outputDictionary;
- (XCTestExpectation)expectation;
- (void)setInUse:(BOOL)a3;
- (void)setOutput:(id)a3 forKey:(id)a4;
@end

@implementation CLIntersiloServiceMockPayload

- (CLIntersiloServiceMockPayload)initWithExpectation:(id)a3 inputDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLIntersiloServiceMockPayload;
  v9 = [(CLIntersiloServiceMockPayload *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expectation, a3);
    objc_storeStrong((id *)&v10->_inputDictionary, a4);
    uint64_t v11 = objc_opt_new();
    outputDictionary = v10->_outputDictionary;
    v10->_outputDictionary = (NSDictionary *)v11;
  }
  return v10;
}

- (void)setOutput:(id)a3 forKey:(id)a4
{
}

- (void)setInUse:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_inUse)
  {
    v3 = sub_1A4558D84();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      uint64_t v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_inUse";
      _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Payloads can't be reused!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v4 = sub_1A4558D84();
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      uint64_t v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_inUse";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Payloads can't be reused!", "{\"msg%{public}.0s\":\"Payloads can't be reused!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v5 = sub_1A4558D84();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      uint64_t v11 = "assert";
      __int16 v12 = 2081;
      v13 = "!_inUse";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Payloads can't be reused!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  self->_inUse = a3;
}

- (XCTestExpectation)expectation
{
  return self->_expectation;
}

- (NSDictionary)inputDictionary
{
  return self->_inputDictionary;
}

- (NSDictionary)outputDictionary
{
  return self->_outputDictionary;
}

- (BOOL)inUse
{
  return self->_inUse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDictionary, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
  objc_storeStrong((id *)&self->_expectation, 0);
}

@end