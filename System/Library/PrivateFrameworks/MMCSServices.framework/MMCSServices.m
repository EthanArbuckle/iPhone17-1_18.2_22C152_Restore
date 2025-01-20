uint64_t sub_23C2618A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t vars8;

  MMCSEngineCancelRequests();
  v2 = *(void *)(*(void *)(a1 + 32) + 32);
  return MEMORY[0x270F49468](v2);
}

void sub_23C261C2C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x23C261BF0);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_23C262134(void *a1, const char *a2, _DWORD *a3, void *a4, uint64_t a5)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v10 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, a5);
  dispatch_assert_queue_V2(v10);
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v46 = 134219008;
      v47 = a1;
      __int16 v48 = 2048;
      v49 = a2;
      __int16 v50 = 2048;
      v51 = a3;
      __int16 v52 = 2048;
      v53 = a4;
      __int16 v54 = 2048;
      uint64_t v55 = a5;
      _os_log_impl(&dword_23C260000, v14, OS_LOG_TYPE_INFO, "_MMCSGetFileDescriptorAndContentTypeFromItemCallback:   context: %p   item id: %qx   fd: %p   itemTypePtr: %p   errorPtr: %p", (uint8_t *)&v46, 0x34u);
    }
  }
  if (!a1)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v41 = OSLogHandleForIMFoundationCategory();
    uint64_t result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v46) = 0;
    v42 = " no controller found, failing";
    goto LABEL_38;
  }
  v15 = objc_msgSend__registeredTransferForItemID_(a1, v11, (uint64_t)a2, v12, v13);
  v20 = v15;
  if (!v15)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v41 = OSLogHandleForIMFoundationCategory();
    uint64_t result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v46) = 0;
    v42 = "  Couldn't find registered transfer for get request";
    goto LABEL_38;
  }
  if (!a3)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v41 = OSLogHandleForIMFoundationCategory();
    uint64_t result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v46) = 0;
    v42 = "  Empty file descriptor pointer passed in, failing";
    goto LABEL_38;
  }
  v21 = objc_msgSend_localPath(v15, v16, v17, v18, v19);
  if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v46 = 138412290;
      v47 = v20;
      _os_log_impl(&dword_23C260000, v26, OS_LOG_TYPE_INFO, "   => found transfer: %@", (uint8_t *)&v46, 0xCu);
    }
  }
  *a3 = -1;
  if (!v21)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v41 = OSLogHandleForIMFoundationCategory();
    uint64_t result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v46) = 0;
    v42 = "   => No local path found!";
    goto LABEL_38;
  }
  v27 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v22, v23, v24, v25);
  if ((objc_msgSend_fileExistsAtPath_(v27, v28, (uint64_t)v21, v29, v30) & 1) == 0)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v43 = OSLogHandleForIMFoundationCategory();
    uint64_t result = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    int v46 = 138412290;
    v47 = v21;
    v42 = "   => Failing, file doesn't exist at path: %@";
    v44 = v43;
    uint32_t v45 = 12;
LABEL_39:
    _os_log_impl(&dword_23C260000, v44, OS_LOG_TYPE_INFO, v42, (uint8_t *)&v46, v45);
    return 0;
  }
  v35 = (const char *)objc_msgSend_fileSystemRepresentation(v21, v31, v32, v33, v34);
  if (!v35)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v41 = OSLogHandleForIMFoundationCategory();
    uint64_t result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v46) = 0;
    v42 = "   => failed finding path";
    goto LABEL_38;
  }
  uint64_t v36 = open(v35, 0);
  if (v36 == -1)
  {
    uint64_t result = IMOSLoggingEnabled();
    if (!result) {
      return result;
    }
    v41 = OSLogHandleForIMFoundationCategory();
    uint64_t result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v46) = 0;
    v42 = "   => could not open file";
LABEL_38:
    v44 = v41;
    uint32_t v45 = 2;
    goto LABEL_39;
  }
  *a3 = v36;
  objc_msgSend_setFd_(v20, v37, v36, v38, v39);
  if (a4) {
    *a4 = @"fxd";
  }
  return 1;
}

void sub_23C262548(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v12 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v12);
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v28 = 134219266;
      uint64_t v29 = (uint64_t)a1;
      __int16 v30 = 2048;
      v31 = a2;
      __int16 v32 = 2048;
      uint64_t v33 = a3;
      __int16 v34 = 2112;
      v35 = sub_23C267F30(a4, v13, v14, v15, v16);
      __int16 v36 = 2048;
      double v37 = a6;
      __int16 v38 = 2112;
      uint64_t v39 = a5;
      _os_log_impl(&dword_23C260000, v17, OS_LOG_TYPE_INFO, "_MMCSGetItemProgressCallback:   context: %p   item id: %qx   sig: %p   state: %@   progress: %f  error: %@", (uint8_t *)&v28, 0x3Eu);
    }
  }
  if (a1 && (uint64_t v18 = objc_msgSend_controller(a1, v13, v14, v15, v16), (v22 = v18) != 0))
  {
    uint64_t v23 = objc_msgSend__registeredTransferForItemID_(v18, v19, (uint64_t)a2, v20, v21);
    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        uint64_t v29 = v23;
        _os_log_impl(&dword_23C260000, v25, OS_LOG_TYPE_INFO, "   => found transfer: %@", (uint8_t *)&v28, 0xCu);
      }
    }
    if (v23)
    {
      objc_msgSend__getItemUpdated_progress_state_error_(v22, v24, v23, a4, a5, a6);
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        v27 = "  couldn't find transfer for get progress update";
LABEL_17:
        _os_log_impl(&dword_23C260000, v26, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v28, 2u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      v27 = " no controller found, bailing";
      goto LABEL_17;
    }
  }
}

void sub_23C2627D4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v11 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v11);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = "";
      *(_DWORD *)buf = 134219010;
      if (a4) {
        uint64_t v13 = (const char *)a4;
      }
      uint64_t v54 = (uint64_t)a1;
      __int16 v55 = 2048;
      uint64_t v56 = (uint64_t)a2;
      __int16 v57 = 2048;
      uint64_t v58 = a3;
      __int16 v59 = 2080;
      v60 = v13;
      __int16 v61 = 2112;
      uint64_t v62 = a5;
      _os_log_impl(&dword_23C260000, v12, OS_LOG_TYPE_INFO, "_MMCSGetItemDoneCallback:   context: %p   item id: %qx   sig: %p   path: %s  error: %@", buf, 0x34u);
    }
  }
  v47 = a1;
  uint64_t v44 = a5;
  uint64_t v45 = a4;
  if (a6)
  {
    CFRetain(a6);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, v14, (uint64_t)&v48, (uint64_t)v52, 16);
    if (v15)
    {
      uint64_t v16 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(a6);
          }
          uint64_t v18 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            uint64_t v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = objc_msgSend_objectForKey_(a6, v19, v18, v21, v22);
              *(_DWORD *)buf = 138412546;
              uint64_t v54 = v18;
              __int16 v55 = 2112;
              uint64_t v56 = v23;
              _os_log_impl(&dword_23C260000, v20, OS_LOG_TYPE_INFO, "_MMCSGetItemDoneCallback with key: %@,  value: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, v19, (uint64_t)&v48, (uint64_t)v52, 16);
      }
      while (v15);
    }
    CFRelease(a6);
    int v28 = v47;
  }
  else
  {
    int v28 = a1;
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C260000, v29, OS_LOG_TYPE_INFO, "Got back NULL results _MMCSGetItemDoneCallback", buf, 2u);
      }
    }
  }
  if (v28 && (__int16 v30 = objc_msgSend_controller(v28, v24, v25, v26, v27), (v34 = v30) != 0))
  {
    uint64_t v35 = objc_msgSend__registeredTransferForItemID_(v30, v31, (uint64_t)a2, v32, v33);
    if (IMOSLoggingEnabled())
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = v35;
        _os_log_impl(&dword_23C260000, v39, OS_LOG_TYPE_INFO, "   => found transfer: %@", buf, 0xCu);
      }
    }
    if (v35)
    {
      if (v45)
      {
        uint64_t v40 = objc_msgSend_stringWithUTF8String_(NSString, v36, v45, v37, v38);
        objc_msgSend__getItemCompleted_path_error_(v34, v41, v35, v40, v44, v44);
      }
      else
      {
        objc_msgSend__getItemCompleted_path_error_(v34, v36, v35, 0, v44, v44);
      }
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v43 = "  couldn't find transfer for get completion";
        goto LABEL_32;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v43 = " no controller found, bailing";
LABEL_32:
      _os_log_impl(&dword_23C260000, v42, OS_LOG_TYPE_INFO, v43, buf, 2u);
    }
  }
}

void sub_23C262C3C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  CFDictionaryRef Value = (const __CFDictionary *)a5;
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v12 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v12);
  if (Value) {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x263F53568]);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v28 = 134219266;
      uint64_t v29 = (uint64_t)a1;
      __int16 v30 = 2048;
      v31 = a2;
      __int16 v32 = 2048;
      uint64_t v33 = a3;
      __int16 v34 = 2112;
      uint64_t v35 = sub_23C267D40(a4, v13, v14, v15, v16);
      __int16 v36 = 2048;
      double v37 = a6;
      __int16 v38 = 2112;
      CFDictionaryRef v39 = Value;
      _os_log_impl(&dword_23C260000, v17, OS_LOG_TYPE_INFO, "_MMCSPutItemProgressCallback:   context: %p   item id: %qx   sig: %p   state: %@   progress: %f  error: %@", (uint8_t *)&v28, 0x3Eu);
    }
  }
  if (a1 && (uint64_t v18 = objc_msgSend_controller(a1, v13, v14, v15, v16), (v22 = v18) != 0))
  {
    uint64_t v23 = objc_msgSend__registeredTransferForItemID_(v18, v19, (uint64_t)a2, v20, v21);
    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        uint64_t v29 = v23;
        _os_log_impl(&dword_23C260000, v25, OS_LOG_TYPE_INFO, "   => found transfer: %@", (uint8_t *)&v28, 0xCu);
      }
    }
    if (v23)
    {
      objc_msgSend__putItemUpdated_progress_state_error_(v22, v24, v23, a4, (uint64_t)Value, a6);
      return;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        uint64_t v27 = "  couldn't find transfer for put progress update";
LABEL_19:
        _os_log_impl(&dword_23C260000, v26, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v28, 2u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      uint64_t v27 = " no controller found, bailing";
      goto LABEL_19;
    }
  }
}

void sub_23C262EE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFDictionaryRef Value = (const __CFDictionary *)a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  v9 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v9);
  if (Value) {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x263F53568]);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v34 = 134218754;
      uint64_t v35 = (uint64_t)a1;
      __int16 v36 = 2048;
      double v37 = (void *)a2;
      __int16 v38 = 2048;
      uint64_t v39 = a3;
      __int16 v40 = 2112;
      CFDictionaryRef v41 = Value;
      _os_log_impl(&dword_23C260000, v14, OS_LOG_TYPE_INFO, "_MMCSPutItemDoneCallback:   context: %p   item id: %qx   sig: %p   error: %@", (uint8_t *)&v34, 0x2Au);
    }
  }
  if (!a1 || (v15 = objc_msgSend_controller(a1, v10, v11, v12, v13), (uint64_t v19 = v15) == 0))
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v33 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v34) = 0;
    __int16 v30 = " no controller found, bailing";
LABEL_21:
    v31 = v33;
    uint32_t v32 = 2;
    goto LABEL_22;
  }
  uint64_t v20 = objc_msgSend__registeredTransferForItemID_(v15, v16, (uint64_t)a2, v17, v18);
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v34 = 138412290;
      uint64_t v35 = (uint64_t)v20;
      _os_log_impl(&dword_23C260000, v23, OS_LOG_TYPE_INFO, "   => found transfer: %@", (uint8_t *)&v34, 0xCu);
    }
  }
  if (!v20)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v33 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v34) = 0;
    __int16 v30 = "  couldn't find transfer for put completion";
    goto LABEL_21;
  }
  objc_msgSend__putItemCompleted_error_(v19, v21, (uint64_t)v20, (uint64_t)Value, v22);
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = objc_msgSend_localPath(v20, v25, v26, v27, v28);
      int v34 = 138412546;
      uint64_t v35 = v29;
      __int16 v36 = 2112;
      double v37 = Value;
      __int16 v30 = "[=MMCS-Timing=] Put Item completed for path: %@  (error: %@)";
      v31 = v24;
      uint32_t v32 = 22;
LABEL_22:
      _os_log_impl(&dword_23C260000, v31, OS_LOG_TYPE_INFO, v30, (uint8_t *)&v34, v32);
    }
  }
}

void sub_23C2631C8(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v7);
  if (a2)
  {
    CFRetain(a2);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v59 = 134217984;
        *(void *)&v59[4] = a1;
        _os_log_impl(&dword_23C260000, v8, OS_LOG_TYPE_INFO, "MMCSRequestCompletedCallback with requestorContext: %p", v59, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = objc_msgSend_objectForKey_(a2, v9, @"metricObject", v11, v12);
        *(_DWORD *)__int16 v59 = 138412290;
        *(void *)&v59[4] = v14;
        _os_log_impl(&dword_23C260000, v13, OS_LOG_TYPE_INFO, "MMCSRequestCompletedCallback with metric: %@", v59, 0xCu);
      }
    }
    uint64_t v15 = objc_msgSend_stringByExpandingTildeInPath(@"/var/mobile/Library/SMS/prewarm.db", v9, v10, v11, v12);
    id v16 = objc_alloc(MEMORY[0x263F4A290]);
    uint64_t v18 = objc_msgSend_initWithPath_storeName_dataProtectionClass_(v16, v17, v15, @"MMCSServices", 0);
    uint64_t v21 = objc_msgSend_dataForKey_error_(v18, v19, @"MMCSContainerStateRefreshTime", 0, v20);
    uint64_t v25 = v21;
    double v58 = 0.0;
    if (v21)
    {
      objc_msgSend_getBytes_length_(v21, v22, (uint64_t)&v58, 8, v24);
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x263EFF910], v26, v27, v28, v29);
      double v31 = v30 - v58;
    }
    else
    {
      double v31 = 0.0;
    }
    uint64_t v33 = objc_msgSend_objectForKey_(a2, v22, *MEMORY[0x263F53590], v23, v24);
    if (v33)
    {
      BOOL v35 = v31 > 86400.0 || v25 == 0;
      int v36 = IMOSLoggingEnabled();
      if (v35)
      {
        if (v36)
        {
          __int16 v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            uint64_t v42 = objc_msgSend_length(v33, v37, v39, v40, v41);
            *(_DWORD *)__int16 v59 = 134217984;
            *(void *)&v59[4] = v42;
            _os_log_impl(&dword_23C260000, v38, OS_LOG_TYPE_INFO, "Store or upate MMCSContainerState.  And MMCSContainserState length:%lu", v59, 0xCu);
          }
        }
        objc_msgSend_persistData_forKey_error_(v18, v37, (uint64_t)v33, @"MMCSContainerState", 0);
        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x263EFF910], v43, v44, v45, v46);
        *(void *)__int16 v59 = v47;
        uint64_t v50 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v48, (uint64_t)v59, 8, v49);
        objc_msgSend_persistData_forKey_error_(v18, v51, v50, @"MMCSContainerStateRefreshTime", 0);
        goto LABEL_33;
      }
      if (v36)
      {
        __int16 v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int16 v59 = 0;
          v53 = "ContainerState in MMCSRequestCompeletedCallBack,  but skip this time restore to avoid frequent update";
          goto LABEL_32;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v59 = 0;
        v53 = "No ContainerState in MMCSRequestCompeletedCallBack";
LABEL_32:
        _os_log_impl(&dword_23C260000, v52, OS_LOG_TYPE_INFO, v53, v59, 2u);
      }
    }
LABEL_33:

    if (a1)
    {
      objc_msgSend__removeFromController(a1, v54, v55, v56, v57);
    }
    CFRelease(a2);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    uint32_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v59 = 0;
      _os_log_impl(&dword_23C260000, v32, OS_LOG_TYPE_INFO, "_MMCSRequestCompletedCallback got back NULL results", v59, 2u);
    }
  }
}

void sub_23C26396C(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v7);
  if (a2)
  {
    CFRetain(a2);
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(a2, v8, *MEMORY[0x263F53538], v9, v10);
    uint64_t v12 = *MEMORY[0x263F53568];
    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(a2, v13, *MEMORY[0x263F53568], v14, v15);
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(a2, v17, *MEMORY[0x263F53520], v18, v19);
    Object = objc_msgSend_firstObject(v20, v21, v22, v23, v24);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(Object, v26, v12, v27, v28);
    if (Object) {
      BOOL v33 = v29 == 0;
    }
    else {
      BOOL v33 = 0;
    }
    if (v33)
    {
      uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(Object, v30, *MEMORY[0x263F534E0], v31, v32);
      uint64_t v51 = objc_msgSend_unsignedIntegerValue(v46, v47, v48, v49, v50);
      uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(Object, v52, *MEMORY[0x263F53580], v53, v54);
      uint64_t v60 = objc_msgSend_bytes(v55, v56, v57, v58, v59);
      v64 = (void *)v60;
      if (v60)
      {
        v65 = (void *)MEMORY[0x263EFF8F8];
        uint64_t v66 = MEMORY[0x23ECDED40](v60);
        uint64_t v69 = objc_msgSend_dataWithBytes_length_(v65, v67, (uint64_t)v64, v66, v68);
        v64 = (void *)MMCSSignatureCopyData();
      }
      else
      {
        uint64_t v69 = 0;
      }
      objc_msgSend_setMMCSError_(a1, v61, v16, v62, v63);
      if (!v16)
      {
        objc_msgSend_setFileHash_(a1, v70, v69, v72, v73);
        objc_msgSend_setProtocolFileSize_(a1, v74, v51, v75, v76);
        objc_msgSend_setAuthRequestData_(a1, v77, v11, v78, v79);
        objc_msgSend_setSignature_(a1, v80, (uint64_t)v64, v81, v82);
      }
      uint64_t v83 = objc_msgSend_registrationBlock(a1, v70, v71, v72, v73);
      v88 = objc_msgSend_serialControllerQueue(MMCSController, v84, v85, v86, v87);
      dispatch_assert_queue_V2(v88);
      if (v83) {
        (*(void (**)(uint64_t, BOOL))(v83 + 16))(v83, v16 == 0);
      }
    }
    else
    {
      if (v29) {
        uint64_t v34 = v29;
      }
      else {
        uint64_t v34 = v16;
      }
      if (!v34) {
        uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, *MEMORY[0x263F534D8], 30, 0);
      }
      objc_msgSend_setMMCSError_(a1, v30, v34, v31, v32);
      uint64_t v39 = objc_msgSend_registrationBlock(a1, v35, v36, v37, v38);
      uint64_t v44 = objc_msgSend_serialControllerQueue(MMCSController, v40, v41, v42, v43);
      dispatch_assert_queue_V2(v44);
      if (v39) {
        (*(void (**)(uint64_t, void))(v39 + 16))(v39, 0);
      }
    }
    CFRelease(a2);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v89 = 0;
      _os_log_impl(&dword_23C260000, v45, OS_LOG_TYPE_INFO, "_registerMMCSPutFileCompletedCallback got back NULL results", v89, 2u);
    }
  }
}

void sub_23C264364(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend__registerPowerAssertionIfNeeded(*(void **)(a1 + 32), a2, a3, a4, a5);
    objc_msgSend__schedulePowerAssertionTimer(*(void **)(a1 + 32), v6, v7, v8, v9);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v12 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v12);
  if (v10)
  {
    uint64_t v13 = *(void (**)(uint64_t, BOOL))(v10 + 16);
    v13(v10, v11 != 0);
  }
}

void sub_23C2643F8(uint64_t a1, uint64_t a2)
{
}

void sub_23C264408(uint64_t a1)
{
}

void sub_23C264414(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = (int)a2;
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v7);
  id Weak = objc_loadWeak((id *)(a1 + 56));
  id v9 = objc_loadWeak((id *)(a1 + 64));
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v10 + 24)) {
    char v11 = v5;
  }
  else {
    char v11 = 0;
  }
  *(unsigned char *)(v10 + 24) = v11;
  int v12 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v12)
    {
      uint64_t v13 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        uint64_t v35 = (uint64_t)v9;
        _os_log_impl(&dword_23C260000, v13, OS_LOG_TYPE_INFO, "Registered mmcs put transfer: %@", (uint8_t *)&v34, 0xCu);
      }
    }
  }
  else
  {
    if (v12)
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412802;
        uint64_t v35 = objc_opt_class();
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)v9;
        __int16 v38 = 2112;
        uint64_t v39 = objc_msgSend_mmcsError(v9, v15, v16, v17, v18);
        _os_log_impl(&dword_23C260000, v14, OS_LOG_TYPE_INFO, "%@ - %@ Could not compute signature for asset. Ignoring.  Error: %@", (uint8_t *)&v34, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = objc_msgSend_mmcsError(v9, v19, v20, v21, v22);
        int v34 = 138412546;
        uint64_t v35 = (uint64_t)v9;
        __int16 v36 = 2112;
        uint64_t v37 = v24;
        _os_log_impl(&dword_23C260000, v23, OS_LOG_TYPE_INFO, "Failed to register mmcs transfer: %@ error: %@", (uint8_t *)&v34, 0x16u);
      }
    }
    uint64_t v25 = objc_msgSend_transfers(Weak, v19, v20, v21, v22);
    uint64_t v30 = objc_msgSend_guid(v9, v26, v27, v28, v29);
    objc_msgSend_removeObjectForKey_(v25, v31, v30, v32, v33);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

uint64_t sub_23C26501C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t result = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, a2, (uint64_t)&v22, (uint64_t)v26, 16);
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(a1);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
        objc_msgSend_setRequestorID_(v15, v9, (uint64_t)a2, v10, v11);
        objc_msgSend_setRequestURL_(v15, v16, a3, v17, v18);
        objc_msgSend_setAuthToken_(v15, v19, a4, v20, v21);
        ++v14;
      }
      while (v12 != v14);
      uint64_t result = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, v9, (uint64_t)&v22, (uint64_t)v26, 16);
      uint64_t v12 = result;
    }
    while (result);
  }
  return result;
}

uint64_t sub_23C265138(void *a1, char *a2, void *a3, uint64_t a4, uint64_t a5)
{
  int v10 = objc_msgSend_count(a1, a2, (uint64_t)a3, a4, a5);
  int v15 = v10;
  size_t v16 = 8 * v10;
  if (a2)
  {
    uint64_t v17 = malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = 0;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v19 = 0;
    goto LABEL_8;
  }
  uint64_t v17 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = malloc_type_malloc(v16, 0x10040436913F5uLL);
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v19 = malloc_type_malloc(v16, 0xC0040B8AA526DuLL);
LABEL_8:
  uint64_t v68 = (void *)a4;
  uint64_t v69 = (void *)a5;
  if (a3) {
    uint64_t v20 = malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  }
  else {
    uint64_t v20 = 0;
  }
  if (v15 < 1 || !v17 || !v18 || !v19) {
    goto LABEL_51;
  }
  if (!objc_msgSend_count(a1, v11, v12, v13, v14))
  {
LABEL_24:
    if (a2) {
      *(void *)a2 = v17;
    }
    if (a3) {
      *a3 = v20;
    }
    if (v68) {
      *uint64_t v68 = v18;
    }
    if (v69) {
      *uint64_t v69 = v19;
    }
    return 1;
  }
  uint64_t v24 = 0;
  while (1)
  {
    long long v25 = objc_msgSend_objectAtIndex_(a1, v21, v24, v22, v23, v68);
    if (!objc_msgSend_authToken(v25, v26, v27, v28, v29))
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_51;
      }
      uint64_t v62 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_INFO)) {
        goto LABEL_51;
      }
      __int16 v73 = 0;
      uint64_t v63 = " => No auth token supplied, failing";
      v64 = (uint8_t *)&v73;
LABEL_42:
      _os_log_impl(&dword_23C260000, v62, OS_LOG_TYPE_INFO, v63, v64, 2u);
      goto LABEL_51;
    }
    if (!objc_msgSend_signature(v25, v30, v31, v32, v33))
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_51;
      }
      uint64_t v62 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_INFO)) {
        goto LABEL_51;
      }
      __int16 v72 = 0;
      uint64_t v63 = " => Empty signature for transfer, failing";
      v64 = (uint8_t *)&v72;
      goto LABEL_42;
    }
    if (!objc_msgSend_itemID(v25, v34, v35, v36, v37))
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_51;
      }
      uint64_t v62 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_INFO)) {
        goto LABEL_51;
      }
      *(_WORD *)buf = 0;
      uint64_t v63 = " => Item ID is 0, failing";
      v64 = buf;
      goto LABEL_42;
    }
    objc_msgSend_signature(v25, v38, v39, v40, v41);
    uint64_t v42 = MMCSSignatureCreateWithData();
    if (!v42) {
      break;
    }
    uint64_t v47 = v42;
    v17[v24] = objc_msgSend_itemID(v25, v43, v44, v45, v46);
    v18[v24] = v47;
    __int16 v52 = objc_msgSend_authToken(v25, v48, v49, v50, v51);
    v19[v24] = objc_msgSend_UTF8String(v52, v53, v54, v55, v56);
    if (v20) {
      v20[v24] = objc_msgSend_encryptionBehavior(v25, v57, v58, v59, v60) != 1;
    }
    if (++v24 >= (unint64_t)objc_msgSend_count(a1, v57, v58, v59, v60)) {
      goto LABEL_24;
    }
  }
  if (IMOSLoggingEnabled())
  {
    v65 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v70 = 0;
      _os_log_impl(&dword_23C260000, v65, OS_LOG_TYPE_INFO, " => Could not generate signature, failing", v70, 2u);
    }
  }
  if (v24)
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      v67 = (void *)v18[i];
      if (v67) {
        free(v67);
      }
    }
  }
LABEL_51:
  if (a2) {
    *(void *)a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (v68) {
    *uint64_t v68 = 0;
  }
  if (v69) {
    *uint64_t v69 = 0;
  }
  free(v17);
  free(v20);
  free(v18);
  free(v19);
  return 0;
}

void sub_23C2654E4(void *a1, const char *a2, void **a3, void ***a4, void **a5)
{
  LODWORD(v9) = objc_msgSend_count(a1, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  if (a2 && *(void *)a2)
  {
    free(*(void **)a2);
    *(void *)a2 = 0;
  }
  if (a3 && *a3)
  {
    free(*a3);
    *a3 = 0;
  }
  if (a4)
  {
    int v10 = *a4;
    if (*a4)
    {
      if ((int)v9 >= 1)
      {
        if (v9 <= 1uLL) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = v9;
        }
        do
        {
          if (*v10) {
            free(*v10);
          }
          ++v10;
          --v9;
        }
        while (v9);
        int v10 = *a4;
      }
      free(v10);
      *a4 = 0;
    }
  }
  if (a5)
  {
    if (*a5)
    {
      free(*a5);
      *a5 = 0;
    }
  }
}

void sub_23C265D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23C265D74(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result)
  {
    uint64_t result = MMCSEngineIsActive();
    BOOL v3 = result != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void sub_23C265E9C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a1 + 40))
  {
    char v5 = (char)a2;
    uint64_t v7 = objc_msgSend_replyQueue(*(void **)(a1 + 32), a2, a3, a4, a5);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_23C265F30;
    v8[3] = &unk_264E3AE08;
    v8[4] = *(void *)(a1 + 40);
    char v9 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t sub_23C265F30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_23C265F48(void *a1)
{
  return MEMORY[0x270F9A6D0](a1[4], sel__registerFiles_preauthenticate_completionBlock_, a1[5], 0, a1[6]);
}

void sub_23C266040(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a1 + 40))
  {
    char v5 = (char)a2;
    uint64_t v7 = objc_msgSend_replyQueue(*(void **)(a1 + 32), a2, a3, a4, a5);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_23C2660D4;
    v8[3] = &unk_264E3AE08;
    v8[4] = *(void *)(a1 + 40);
    char v9 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t sub_23C2660D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_23C2660EC(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__registerFiles_preauthenticate_completionBlock_, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
}

void sub_23C2661DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23C2661F4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4, a5))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend__unregisterTransfers_(*(void **)(a1 + 40), v6, *(void *)(a1 + 32), v7, v8);
  }
  else if (IMOSLoggingEnabled())
  {
    char v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_23C260000, v9, OS_LOG_TYPE_INFO, "Empty files array supplied to unregister, failing", v10, 2u);
    }
  }
}

dispatch_queue_t sub_23C266300()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.MMCSController", v0);
  qword_26AEE39E8 = (uint64_t)result;
  return result;
}

void sub_23C266370()
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C260000, v4, OS_LOG_TYPE_INFO, "MMCS prewarm is called", buf, 2u);
    }
  }
  uint64_t v5 = objc_msgSend_stringByExpandingTildeInPath(@"/var/mobile/Library/SMS/prewarm.db", v0, v1, v2, v3);
  id v6 = objc_alloc(MEMORY[0x263F4A290]);
  uint64_t v8 = objc_msgSend_initWithPath_storeName_dataProtectionClass_(v6, v7, v5, @"MMCSServices", 0);
  uint64_t v11 = objc_msgSend_dataForKey_error_(v8, v9, @"MMCSContainerState", 0, v10);
  size_t v16 = objc_msgSend_date(MEMORY[0x263EFF910], v12, v13, v14, v15);
  objc_msgSend_timeIntervalSinceReferenceDate(v16, v17, v18, v19, v20);
  if (!v11 || (byte_26AEE39D0 & 1) != 0 || v21 - *(double *)&qword_26AEE39D8 <= 30.0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C260000, v39, OS_LOG_TYPE_INFO, "There is no ContainerState from prewarm database or prewarm happened just now,  and skip prewarm", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = objc_msgSend_length(v11, v22, v24, v25, v26);
        *(_DWORD *)buf = 134217984;
        uint64_t v43 = v27;
        _os_log_impl(&dword_23C260000, v23, OS_LOG_TYPE_INFO, "Read from prewarm database about ContainerState and length is: %lu.  Preform MMCS   prewarm", buf, 0xCu);
      }
    }
    uint64_t v40 = *MEMORY[0x263F53590];
    uint64_t v41 = v11;
    uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v22, (uint64_t)&v41, (uint64_t)&v40, 1);
    uint64_t v33 = objc_msgSend_date(MEMORY[0x263EFF910], v29, v30, v31, v32);
    objc_msgSend_timeIntervalSinceReferenceDate(v33, v34, v35, v36, v37);
    qword_26AEE39D8 = v38;
    byte_26AEE39D0 = 1;
    MEMORY[0x23ECDED80](0, v28, sub_23C2665F4);
  }
}

void sub_23C2665F4(int a1, CFTypeRef cf, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (cf) {
    CFRetain(cf);
  }
  id v6 = objc_msgSend_serialControllerQueue(MMCSController, (const char *)cf, a3, a4, a5);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23C268F44;
  block[3] = &unk_264E3B050;
  block[4] = cf;
  dispatch_async(v6, block);
}

void sub_23C266788(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a1 + 40))
  {
    char v6 = a3;
    char v9 = objc_msgSend_replyQueue(*(void **)(a1 + 32), a2, a3, a4, a5);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_23C266830;
    v11[3] = &unk_264E3AEF0;
    uint64_t v10 = *(void *)(a1 + 40);
    v11[5] = a4;
    v11[6] = v10;
    char v12 = v6;
    v11[4] = a2;
    dispatch_async(v9, v11);
  }
}

uint64_t sub_23C266830(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t sub_23C26684C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4, a5))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_23C266974;
    v11[3] = &unk_264E3AF40;
    v11[4] = v7;
    long long v8 = *(_OWORD *)(a1 + 56);
    long long v12 = *(_OWORD *)(a1 + 40);
    long long v13 = v8;
    long long v14 = *(_OWORD *)(a1 + 72);
    return objc_msgSend__registerTransfers_preauthenticate_completionBlock_((void *)v12, v6, v7, 0, (uint64_t)v11);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C260000, v10, OS_LOG_TYPE_INFO, "Empty files array supplied to get, failing", buf, 2u);
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

uint64_t sub_23C266974(uint64_t a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, a2, (uint64_t)&v17, (uint64_t)v22, 16);
    if (v5)
    {
      uint64_t v7 = *(void *)v18;
      *(void *)&long long v6 = 138412290;
      long long v16 = v6;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            uint64_t v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v16;
              *(void *)&uint8_t buf[4] = v9;
              _os_log_impl(&dword_23C260000, v11, OS_LOG_TYPE_INFO, "[=MMCS-Timing=]  Starting get file for: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v10, (uint64_t)&v17, (uint64_t)v22, 16);
      }
      while (v5);
    }
    *(void *)buf = 0;
    if (objc_msgSend__getTransfers_requestURL_requestorID_sourceAppID_token_error_(*(void **)(a1 + 40), v4, *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), buf, v16))return objc_msgSend__setScheduledTransfers_block_(*(void **)(a1 + 40), v12, *(void *)(a1 + 32), *(void *)(a1 + 80), v13); {
    else
    }
      return (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    uint64_t v15 = *(uint64_t (**)(void))(*(void *)(a1 + 80) + 16);
    return v15();
  }
}

void sub_23C266CB8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a1 + 40))
  {
    char v6 = a3;
    uint64_t v9 = objc_msgSend_replyQueue(*(void **)(a1 + 32), a2, a3, a4, a5);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_23C266D60;
    v11[3] = &unk_264E3AEF0;
    uint64_t v10 = *(void *)(a1 + 40);
    void v11[5] = a4;
    v11[6] = v10;
    char v12 = v6;
    v11[4] = a2;
    dispatch_async(v9, v11);
  }
}

uint64_t sub_23C266D60(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t sub_23C266D7C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4, a5))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 96);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_23C266EB0;
    v11[3] = &unk_264E3AF90;
    uint64_t v15 = *(void *)(a1 + 88);
    v11[4] = v7;
    long long v12 = *(_OWORD *)(a1 + 40);
    long long v13 = *(_OWORD *)(a1 + 56);
    long long v14 = *(_OWORD *)(a1 + 72);
    return objc_msgSend__registerTransfers_preauthenticate_completionBlock_((void *)v12, v6, v7, v8, (uint64_t)v11);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C260000, v10, OS_LOG_TYPE_INFO, "Empty files array supplied to put, failing", buf, 2u);
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

uint64_t sub_23C266EB0(uint64_t a1, const char *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, a2, (uint64_t)&v15, (uint64_t)v20, 16);
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            uint64_t v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v8;
              _os_log_impl(&dword_23C260000, v10, OS_LOG_TYPE_INFO, "[=MMCS-Timing=]  Starting put file for: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v9, (uint64_t)&v15, (uint64_t)v20, 16);
      }
      while (v5);
    }
    *(void *)buf = 0;
    if (objc_msgSend__putTransfers_requestURL_requestorID_transferID_sourceAppID_token_error_(*(void **)(a1 + 40), v4, *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), buf))return objc_msgSend__setScheduledTransfers_block_(*(void **)(a1 + 40), v11, *(void *)(a1 + 32), *(void *)(a1 + 88), v12); {
    else
    }
      return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    long long v14 = *(uint64_t (**)(void))(*(void *)(a1 + 88) + 16);
    return v14();
  }
}

uint64_t sub_23C267478(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v7;
      _os_log_impl(&dword_23C260000, v6, OS_LOG_TYPE_INFO, "Request cancel transferID %@", buf, 0xCu);
    }
  }
  objc_msgSend_lock(*(void **)(*(void *)(a1 + 40) + 104), v2, v3, v4, v5);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 96), v8, *(void *)(a1 + 32), v9, v10);
  long long v16 = objc_msgSend_copy(v11, v12, v13, v14, v15);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v21)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend__cancelRequest_(*(void **)(a1 + 40), v18, *(void *)(*((void *)&v29 + 1) + 8 * v23++), v19, v20);
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v21);
  }

  return objc_msgSend_unlock(*(void **)(*(void *)(a1 + 40) + 104), v24, v25, v26, v27);
}

void sub_23C267A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23C267A1C(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v6 = *(void **)(a1 + 32);
  if (qword_26AEE39F0 != -1) {
    dispatch_once(&qword_26AEE39F0, &unk_26EFE70A8);
  }
  uint64_t v7 = objc_msgSend__MMCSICloudRequestHeadersCopy_(v6, v2, qword_26AEE39F8, v3, v4);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v9)
  {
    uint64_t v14 = v9;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v7);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        long long v18 = NSString;
        uint64_t v19 = objc_msgSend_objectForKey_(v7, v10, v17, v12, v13);
        uint64_t v23 = objc_msgSend_stringWithFormat_(v18, v20, @"%@:%@\n", v21, v22, v17, v19);
        objc_msgSend_appendString_(v5, v24, v23, v25, v26);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }
  if (objc_msgSend_length(v5, v10, v11, v12, v13)) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v5;
  }
  else {
}
  }

__CFString *sub_23C267D40(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 8) {
    return (__CFString *)objc_msgSend_stringWithFormat_(NSString, a2, @"Unknown (%d)", a4, a5, a1);
  }
  else {
    return off_264E3B070[(int)a1];
  }
}

uint64_t sub_23C267D90(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setProgress_(*(void **)(a1 + 32), a2, a3, a4, a5, *(double *)(a1 + 40));
}

__CFString *sub_23C267F30(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 6) {
    return (__CFString *)objc_msgSend_stringWithFormat_(NSString, a2, @"Unknown (%d)", a4, a5, a1);
  }
  else {
    return off_264E3B0B0[(int)a1];
  }
}

uint64_t sub_23C267F80(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setProgress_(*(void **)(a1 + 32), a2, a3, a4, a5, *(double *)(a1 + 40));
}

void sub_23C26838C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    if (_IMWillLog())
    {
      uint64_t v7 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v8 = NSURL;
      uint64_t v9 = objc_msgSend_localPath(*(void **)(a1 + 40), a2, a3, a4, a5);
      uint64_t v13 = objc_msgSend_fileURLWithPath_(v8, v10, v9, v11, v12);
      uint64_t v15 = objc_msgSend_dataWithContentsOfURL_options_error_(v7, v14, v13, 1, 0);
      uint64_t v20 = objc_msgSend_SHA1HexString(v15, v16, v17, v18, v19);
      if (IMOSLoggingEnabled())
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = objc_msgSend_localPath(*(void **)(a1 + 40), v21, v22, v23, v24);
          int v47 = 138412546;
          uint64_t v48 = v26;
          __int16 v49 = 2112;
          uint64_t v50 = v20;
          _os_log_impl(&dword_23C260000, v25, OS_LOG_TYPE_INFO, "Put file at path: %@  with hash: %@", (uint8_t *)&v47, 0x16u);
        }
      }
      goto LABEL_14;
    }
    uint64_t v6 = *(void **)(a1 + 32);
  }
  long long v27 = objc_msgSend_domain(v6, a2, a3, a4, a5);
  int isEqualToString = objc_msgSend_isEqualToString_(v27, v28, *MEMORY[0x263F534D8], v29, v30);
  uint64_t v32 = *(void **)(a1 + 32);
  if (!isEqualToString)
  {
    uint64_t v33 = objc_msgSend_domain(v32, v21, v22, v23, v24);
    if (!objc_msgSend_isEqualToString_(v33, v34, @"apple.mme", v35, v36))
    {
LABEL_14:
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      goto LABEL_15;
    }
    uint64_t v32 = *(void **)(a1 + 32);
  }
  objc_msgSend_code(v32, v21, v22, v23, v24);
  unint64_t v41 = objc_msgSend_code(*(void **)(a1 + 32), v37, v38, v39, v40);
  if (v41 >= 0x20) {
    uint64_t v42 = 0;
  }
  else {
    uint64_t v42 = (0x8080E000 >> v41) & 1;
  }
  uint64_t v43 = 1;
LABEL_15:
  uint64_t v44 = *(void *)(a1 + 32);
  if (!v44) {
    objc_msgSend_setProgress_(*(void **)(a1 + 40), v21, v22, v23, v24, 1.0);
  }
  uint64_t v45 = objc_msgSend_completionBlock(*(void **)(a1 + 40), v21, v22, v23, v24);
  if (v45)
  {
    (*(void (**)(uint64_t, void, BOOL, uint64_t, uint64_t, void))(v45 + 16))(v45, *(void *)(a1 + 40), v44 == 0, v43, v42, *(void *)(a1 + 32));
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v46 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_23C260000, v46, OS_LOG_TYPE_INFO, "No callback for put completion, just passing through", (uint8_t *)&v47, 2u);
    }
  }
}

void sub_23C26885C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    if (!v17) {
      JUMPOUT(0x23C26880CLL);
    }
    JUMPOUT(0x23C2687ACLL);
  }
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(exc_buf);
}

void sub_23C2688D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend_completionBlock(*(void **)(a1 + 32), a2, a3, a4, a5);
  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v11)
  {
    objc_msgSend_setProgress_(*(void **)(a1 + 32), v6, v7, v8, v9, 1.0);
    if (objc_msgSend_localPath(*(void **)(a1 + 32), v34, v35, v36, v37))
    {
      uint64_t v42 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v38, v39, v40, v41);
      uint64_t v43 = *(void *)(a1 + 40);
      uint64_t v48 = objc_msgSend_localPath(*(void **)(a1 + 32), v44, v45, v46, v47);
      objc_msgSend_moveItemAtPath_toPath_error_(v42, v49, v43, v48, 0);
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v31 = 1;
      goto LABEL_15;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v38, *MEMORY[0x263F4A810], 10, 0);
    if (IMOSLoggingEnabled())
    {
      uint64_t v50 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        uint64_t v55 = objc_msgSend_guid(*(void **)(a1 + 32), v51, v52, v53, v54);
        int v81 = 138412290;
        uint64_t v82 = v55;
        _os_log_impl(&dword_23C260000, v50, OS_LOG_TYPE_INFO, "MMCS: We finished the _getItemCompleted successfully, but we dont have a file transfer local path for transfer guid %@", (uint8_t *)&v81, 0xCu);
      }
    }
    goto LABEL_14;
  }
  uint64_t v12 = objc_msgSend_domain(v11, v6, v7, v8, v9);
  int isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x263F534D8], v14, v15);
  uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!isEqualToString)
  {
    uint64_t v22 = objc_msgSend_domain(v21, v16, v17, v18, v19);
    if (objc_msgSend_isEqualToString_(v22, v23, @"apple.mme", v24, v25))
    {
      uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      goto LABEL_5;
    }
LABEL_14:
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    goto LABEL_15;
  }
LABEL_5:
  objc_msgSend_code(v21, v16, v17, v18, v19);
  unint64_t v30 = objc_msgSend_code(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v26, v27, v28, v29);
  uint64_t v31 = 0;
  if (v30 >= 0x20) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = (0x8080E000 >> v30) & 1;
  }
  uint64_t v33 = 1;
LABEL_15:
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (_IMWillLog())
    {
      uint64_t v60 = (void *)MEMORY[0x263EFF8F8];
      __int16 v61 = NSURL;
      uint64_t v62 = objc_msgSend_localPath(*(void **)(a1 + 32), v56, v57, v58, v59);
      uint64_t v66 = objc_msgSend_fileURLWithPath_(v61, v63, v62, v64, v65);
      uint64_t v68 = objc_msgSend_dataWithContentsOfURL_options_error_(v60, v67, v66, 1, 0);
      uint64_t v73 = objc_msgSend_SHA1HexString(v68, v69, v70, v71, v72);
      if (IMOSLoggingEnabled())
      {
        v74 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          uint64_t v79 = objc_msgSend_localPath(*(void **)(a1 + 32), v75, v76, v77, v78);
          int v81 = 138412546;
          uint64_t v82 = v79;
          __int16 v83 = 2112;
          uint64_t v84 = v73;
          _os_log_impl(&dword_23C260000, v74, OS_LOG_TYPE_INFO, "Got file at path: %@  with hash: %@", (uint8_t *)&v81, 0x16u);
        }
      }
    }
  }
  if (v10)
  {
    (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void))(v10 + 16))(v10, *(void *)(a1 + 32), v31, v33, v32, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  else if (IMOSLoggingEnabled())
  {
    v80 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      LOWORD(v81) = 0;
      _os_log_impl(&dword_23C260000, v80, OS_LOG_TYPE_INFO, "No callback for get completion, just passing through", (uint8_t *)&v81, 2u);
    }
  }
}

void sub_23C268F30()
{
  qword_26AEE39F8 = @"com.apple.Messenger/1.0";
}

void sub_23C268F44(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  byte_26AEE39D0 = 0;
  uint64_t v6 = objc_msgSend_date(MEMORY[0x263EFF910], a2, a3, a4, a5);
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9, v10);
  double v12 = v11;
  double v13 = *(double *)&qword_26AEE39D8;
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412546;
      uint64_t v24 = objc_msgSend_date(MEMORY[0x263EFF910], v14, v18, v15, v16);
      __int16 v25 = 2048;
      double v26 = v12 - v13;
      _os_log_impl(&dword_23C260000, v17, OS_LOG_TYPE_INFO, "MMCS prewarm comppletecallback at %@ and preward duration: %f", (uint8_t *)&v23, 0x16u);
    }
  }
  uint64_t v19 = *(void **)(a1 + 32);
  if (v19)
  {
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v19, v14, *MEMORY[0x263F53568], v15, v16);
    if (v20 && IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        uint64_t v24 = v20;
        _os_log_impl(&dword_23C260000, v21, OS_LOG_TYPE_INFO, "MMCS prewarm comppletecallback with error: %@", (uint8_t *)&v23, 0xCu);
      }
    }
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_23C260000, v22, OS_LOG_TYPE_INFO, "mmcsWarmCompleteCallback got back NULL results", (uint8_t *)&v23, 2u);
    }
  }
}

__CFArray *parseMMCSError(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v6 = (__CFArray *)objc_msgSend_initWithCapacity_(v2, v3, 8, v4, v5);
  if (a1) {
    uint64_t v7 = (__CFArray *)MMCSFlattenError();
  }
  else {
    uint64_t v7 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    double v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412546;
      uint64_t v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = a1;
      _os_log_impl(&dword_23C260000, v12, OS_LOG_TYPE_INFO, "Flattened MMCS Array from MMCS %@ using error %@", (uint8_t *)&v23, 0x16u);
    }
  }
  if (objc_msgSend_count(v7, v8, v9, v10, v11))
  {
    for (unint64_t i = 0; objc_msgSend_count(v7, v13, v14, v15, v16) > i; ++i)
    {
      if (i)
      {
        if (v6)
        {
LABEL_13:
          if (objc_msgSend_objectAtIndexedSubscript_(v7, v13, i, v15, v16))
          {
            uint64_t v18 = (const void *)objc_msgSend_objectAtIndexedSubscript_(v7, v13, i, v15, v16);
            CFArrayAppendValue(v6, v18);
          }
        }
      }
      else if (v6)
      {
        goto LABEL_13;
      }
    }
  }
  unint64_t v19 = objc_msgSend_count(v6, v13, v14, v15, v16);
  if (v19 <= 7)
  {
    do
    {
      if (v6)
      {
        if (v19) {
          uint64_t v20 = (__CFString *)&unk_26EFE7E18;
        }
        else {
          uint64_t v20 = @"NoError";
        }
        CFArrayAppendValue(v6, v20);
      }
      ++v19;
    }
    while (v19 != 8);
  }
  if (a1)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        uint64_t v24 = v6;
        _os_log_impl(&dword_23C260000, v21, OS_LOG_TYPE_INFO, "Resulting error array %@", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  return v6;
}

__CFString *failReasonStringForMMCSError(uint64_t a1)
{
  if (!a1) {
    return &stru_26EFE7428;
  }
  uint64_t v1 = parseMMCSError(a1);
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ((unint64_t)objc_msgSend_count(v1, v3, v4, v5, v6) >= 2)
  {
    uint64_t v11 = 0;
    do
    {
      double v12 = objc_msgSend_objectAtIndexedSubscript_(v1, v7, v11 + 1, v9, v10);
      int v17 = objc_msgSend_intValue(v12, v13, v14, v15, v16);
      uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v1, v18, v11, v19, v20);
      __int16 v25 = v21;
      if (!v17 && (objc_msgSend_isEqualToString_(v21, v22, @"NoError", v23, v24) & 1) != 0) {
        break;
      }
      id v26 = [NSString alloc];
      unint64_t v30 = objc_msgSend_initWithFormat_(v26, v27, @"%@:%tu;", v28, v29, v25, v17);
      uint64_t v35 = objc_msgSend_length(v30, v31, v32, v33, v34);
      if ((unint64_t)(v35 + objc_msgSend_length(v2, v36, v37, v38, v39) - 130) <= 0xFFFFFFFFFFFFFF7ELL)
      {

        break;
      }
      objc_msgSend_appendString_(v2, v40, (uint64_t)v30, v41, v42);

      unint64_t v47 = objc_msgSend_count(v1, v43, v44, v45, v46);
      unint64_t v48 = v11 + 3;
      v11 += 2;
    }
    while (v47 > v48);
  }
  uint64_t v50 = objc_msgSend_length(v2, v7, v8, v9, v10);
  uint64_t v53 = objc_msgSend_substringWithRange_(v2, v51, 0, v50 - 1, v52);

  return (__CFString *)v53;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x270F3CDD0]();
}

uint64_t IMLogSimulateCrashForProcess()
{
  return MEMORY[0x270F3CDE8]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t MMCSEngineCancelRequests()
{
  return MEMORY[0x270F49458]();
}

uint64_t MMCSEngineCreateWithTargetDispatchQueue()
{
  return MEMORY[0x270F49460]();
}

uint64_t MMCSEngineIsActive()
{
  return MEMORY[0x270F49470]();
}

uint64_t MMCSFlattenError()
{
  return MEMORY[0x270F49478]();
}

uint64_t MMCSGetItemStateIsDeterminant()
{
  return MEMORY[0x270F49480]();
}

uint64_t MMCSGetItems()
{
  return MEMORY[0x270F49488]();
}

uint64_t MMCSICloudRequestHeadersCopy()
{
  return MEMORY[0x270F49490]();
}

uint64_t MMCSPutItemStateIsDeterminant()
{
  return MEMORY[0x270F49498]();
}

uint64_t MMCSPutItems()
{
  return MEMORY[0x270F494A0]();
}

uint64_t MMCSRegisterItems()
{
  return MEMORY[0x270F494B0]();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x270F494B8]();
}

uint64_t MMCSSignatureCopyData()
{
  return MEMORY[0x270F494C0]();
}

uint64_t MMCSSignatureCreateWithData()
{
  return MEMORY[0x270F494C8]();
}

uint64_t MMCSUnregisterFile()
{
  return MEMORY[0x270F494D0]();
}

uint64_t MMCSWarm()
{
  return MEMORY[0x270F494D8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x270F3CEF8]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IMWillLog()
{
  return MEMORY[0x270F3CFB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}