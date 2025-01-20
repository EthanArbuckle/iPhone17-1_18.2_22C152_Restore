@interface MXSessionSecure
+ (BOOL)isNonSerializedCopyProperty:(id)a3;
+ (BOOL)isNonSerializedSetProperty:(id)a3;
+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3;
+ (id)getSetPropertiesOrder;
+ (void)initialize;
- (MXSessionSecure)initWithOptions:(id)a3;
- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4;
- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4;
- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4;
- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5;
- (void)dealloc;
- (void)logDebugInfo;
@end

@implementation MXSessionSecure

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sNonSerializedCopyProperties_0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"AudioBehaviour", @"AudioCategory", @"AudioMode", @"AudioToolboxIsPlaying", @"AuditToken", @"ClientName", @"ClientPID", @"ClientPriority", @"AudioSessionID", @"CoreSessionID", @"CurrentInputSampleRate", @"MXSessionID", @"ReporterIDs", 0);
    sNonSerializedSetProperties_0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"AuditToken", @"ClientName", @"ReporterIDs", 0);
    sNonSerializedSetPropertiesWhenSessionIsInactive_0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"AudioCategory", @"AudioMode", @"ClientPID", @"AudioSessionID", 0);
    sOrderedMXSessionSecureProperties = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAA0]), "initWithObjects:", @"ClientName", @"AudioSessionID", @"AudioCategory", @"AudioMode", 0);
  }
}

+ (BOOL)isNonSerializedCopyProperty:(id)a3
{
  return [(id)sNonSerializedCopyProperties_0 containsObject:a3];
}

+ (BOOL)isNonSerializedSetProperty:(id)a3
{
  return [(id)sNonSerializedSetProperties_0 containsObject:a3];
}

+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3
{
  return [(id)sNonSerializedSetPropertiesWhenSessionIsInactive_0 containsObject:a3];
}

+ (id)getSetPropertiesOrder
{
  return (id)sOrderedMXSessionSecureProperties;
}

- (MXSessionSecure)initWithOptions:(id)a3
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MXSessionSecure;
  v4 = [(MXSessionBase *)&v8 init];
  if (v4)
  {
    if (a3
      && (v5 = [[MXCoreSessionSecure alloc] initWithOptions:a3]) != 0)
    {
      [(MXSessionBase *)v4 setParentCoreSession:v5];

      objc_initWeak(location, v4);
      [(MXCoreSessionBase *)[(MXSessionBase *)v4 parentCoreSession] addMXSessionSecure:objc_loadWeak(location)];
      objc_destroyWeak(location);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  [(MXCoreSessionBase *)[(MXSessionBase *)self parentCoreSession] addMXSessionSecure:0];
  v3.receiver = self;
  v3.super_class = (Class)MXSessionSecure;
  [(MXSessionBase *)&v3 dealloc];
}

- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && a4)
  {
    if ([a3 isEqualToString:@"AudioToolboxIsPlaying"])
    {
      v7 = (NSNumber *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithBool:0];
LABEL_8:
      *a4 = v7;
      return 0;
    }
    if ([a3 isEqualToString:@"MXSessionID"])
    {
      v7 = [(MXSessionBase *)self ID];
      goto LABEL_8;
    }
    v9 = [(MXSessionBase *)self parentCoreSession];
    return [(MXCoreSessionBase *)v9 copyPropertyForKey:a3 valueOut:a4];
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v8 = [(MXSessionBase *)self parentCoreSession];
    return [(MXCoreSessionBase *)v8 setPropertyForKey:a3 value:a4];
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4
{
  v6 = [(MXSessionBase *)self parentCoreSession];
  return [(MXCoreSessionBase *)v6 _beginInterruptionWithSecTask:a3 andFlags:a4];
}

- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4
{
  v6 = [(MXSessionBase *)self parentCoreSession];
  return [(MXCoreSessionBase *)v6 _endInterruptionWithSecTask:a3 andStatus:a4];
}

- (void)logDebugInfo
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359ED0)
    {
      objc_super v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1E9359ED0)
      {
        v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1E9359ED0)
        {
          v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
  }
}

@end