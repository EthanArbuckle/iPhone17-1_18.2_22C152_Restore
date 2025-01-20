@interface NEProfilePayloadAOVPN
- (id)validatePayload;
@end

@implementation NEProfilePayloadAOVPN

- (id)validatePayload
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_large_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = [(NEProfilePayloadBase *)self payloadAtom];
    int v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "NEProfilePayloadAOVPN validatePayload: To-Do. dict %@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

@end