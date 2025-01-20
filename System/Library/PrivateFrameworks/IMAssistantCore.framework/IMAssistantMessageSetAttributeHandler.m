@interface IMAssistantMessageSetAttributeHandler
- (void)handleSetMessageAttribute:(id)a3 completion:(id)a4;
@end

@implementation IMAssistantMessageSetAttributeHandler

- (void)handleSetMessageAttribute:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  v9 = _IMAssistantCoreGeneralSignpostLogHandle();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "handleSetMessageAttributeIntent", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "Handling SetMessageAttribute intent: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22C1D2BC0;
  block[3] = &unk_264912B90;
  id v16 = v6;
  os_signpost_id_t v17 = v8;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

@end