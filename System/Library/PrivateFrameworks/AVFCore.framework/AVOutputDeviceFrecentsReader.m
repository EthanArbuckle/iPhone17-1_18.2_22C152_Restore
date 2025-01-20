@interface AVOutputDeviceFrecentsReader
- (AVOutputDeviceFrecentsReader)init;
- (AVOutputDeviceFrecentsReader)initWithFrecentsFilePath:(id)a3 error:(id *)a4;
- (NSArray)deviceIDs;
- (id)frecencyInfoForDeviceWithID:(id)a3;
- (void)dealloc;
@end

@implementation AVOutputDeviceFrecentsReader

- (AVOutputDeviceFrecentsReader)init
{
  return [(AVOutputDeviceFrecentsReader *)self initWithFrecentsFilePath:0 error:0];
}

- (AVOutputDeviceFrecentsReader)initWithFrecentsFilePath:(id)a3 error:(id *)a4
{
  v17[22] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AVOutputDeviceFrecentsReader;
  v17[0] = 0;
  v6 = [(AVOutputDeviceFrecentsReader *)&v16 init];
  v7 = v6;
  v8 = 0;
  if (a3)
  {
    if (v6)
    {
      v8 = (AVOutputDeviceFrecentsReader *)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3 options:0 error:v17];
      if (v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:v17];
        if (v9)
        {
          v10 = (void *)v9;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = (NSDictionary *)[v10 copy];
LABEL_14:
            v7->_frecents = v11;
            v8 = v7;
            goto LABEL_15;
          }
          if (dword_1EB2D3A40)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v14 = (objc_class *)MEMORY[0x1E4F1C9E8];
        }
        else
        {
          if (dword_1EB2D3A40)
          {
            v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v14 = (objc_class *)MEMORY[0x1E4F1C9E8];
        }
        v11 = (NSDictionary *)objc_alloc_init(v14);
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  if (a4 && !v8) {
    *a4 = (id)v17[0];
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceFrecentsReader;
  [(AVOutputDeviceFrecentsReader *)&v3 dealloc];
}

- (NSArray)deviceIDs
{
  return [(NSDictionary *)self->_frecents allKeys];
}

- (id)frecencyInfoForDeviceWithID:(id)a3
{
  id v3 = -[NSDictionary objectForKeyedSubscript:](self->_frecents, "objectForKeyedSubscript:");
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (dword_1EB2D3A40)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return 0;
    }
  }
  return v3;
}

@end