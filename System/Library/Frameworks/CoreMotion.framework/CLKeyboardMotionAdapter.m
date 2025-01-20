@interface CLKeyboardMotionAdapter
- (void)eventUpdateForDevice:(id)a3 event:(id)a4;
- (void)inputReportForDevice:(id)a3 report:(char *)a4 length:(int64_t)a5;
- (void)monitorUpdateForDevice:(id)a3 added:(BOOL)a4;
- (void)smartCoverStateDidChange:(int64_t)a3;
@end

@implementation CLKeyboardMotionAdapter

- (void)inputReportForDevice:(id)a3 report:(char *)a4 length:(int64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BF298 != -1) {
    dispatch_once(&qword_1EB3BF298, &unk_1EDFD1BC0);
  }
  uint64_t v8 = qword_1EB3BF290;
  if (*(id *)(qword_1EB3BF290 + 48) == a3)
  {
    if (a5 == 30)
    {
      __int16 v10 = *(_WORD *)(a4 + 7);
      char v11 = a4[17];
      int v12 = *(_DWORD *)(a4 + 26);
      *(void *)buf = *(void *)(a4 + 9);
      *(_WORD *)&buf[20] = v10;
      char v38 = v11;
      *(void *)&buf[8] = *(void *)(a4 + 18);
      *(_DWORD *)&buf[16] = v12;
      sub_1902D8D34(*(unint64_t *)buf);
      v13 = buf;
      uint64_t v14 = v8;
      uint64_t v15 = 0;
      uint64_t v16 = 23;
LABEL_15:
      sub_1902D8BCC(v14, v15, (uint64_t)v13, v16);
      return;
    }
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
    }
    v19 = qword_1EB3BE830;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 30;
      _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_FAULT, "Bad motion report input %ld, expected %lu", buf, 0x16u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 == -1)
    {
LABEL_31:
      int v33 = 134218240;
      int64_t v34 = a5;
      __int16 v35 = 2048;
      uint64_t v36 = 30;
LABEL_72:
      v29 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "void CLKeyboardMotionNotifier::onIoHidReportBounce(CLHidDevice *, uint8_t *, CFIndex)", "CoreLocation: %s\n", v29);
      if (v29 != buf) {
        free(v29);
      }
      return;
    }
LABEL_80:
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
    goto LABEL_31;
  }
  if (*(id *)(qword_1EB3BF290 + 40) == a3)
  {
    if (!a5)
    {
      if (qword_1EB3BE838 != -1) {
        dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
      }
      v20 = qword_1EB3BE830;
      if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_FAULT, "Empty keyboard device report input", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB3BE838 != -1) {
          dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
        }
        LOWORD(v33) = 0;
        goto LABEL_72;
      }
      return;
    }
    int v17 = *a4;
    if (v17 == 196)
    {
      if (a5 == 3)
      {
        unsigned int v21 = a4[1] & 2;
        if (*(unsigned __int8 *)(qword_1EB3BF290 + 88) != v21 >> 1)
        {
          if (qword_1EB3BE838 != -1) {
            dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
          }
          v22 = qword_1EB3BE830;
          if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_INFO))
          {
            v23 = "entered";
            if (!v21) {
              v23 = "dismissed";
            }
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v23;
            _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_INFO, "Accessory Hall Effect sensor detected tablet mode %s", buf, 0xCu);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1EB3BE838 != -1) {
              dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
            }
            v30 = "entered";
            if (!v21) {
              v30 = "dismissed";
            }
            int v33 = 136315138;
            int64_t v34 = (int64_t)v30;
            v31 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "void CLKeyboardMotionNotifier::onIoHidReportBounce(CLHidDevice *, uint8_t *, CFIndex)", "CoreLocation: %s\n", v31);
            if (v31 != buf) {
              free(v31);
            }
          }
          if (v21) {
            char v24 = 3;
          }
          else {
            char v24 = 4;
          }
          LOBYTE(v33) = v24;
          uint64_t v25 = mach_absolute_time();
          sub_1902D8D34(v25);
          sub_1902D8BCC(v8, 4, (uint64_t)&v33, 1);
        }
        *(unsigned char *)(v8 + 88) = v21 >> 1;
      }
      else
      {
        if (qword_1EB3BE838 != -1) {
          dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
        }
        v27 = qword_1EB3BE830;
        if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = a5;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 3;
          _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_FAULT, "Bad motion report input state %ld, expected %lu", buf, 0x16u);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EB3BE838 != -1) {
            dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
          }
          int v33 = 134218240;
          int64_t v34 = a5;
          __int16 v35 = 2048;
          uint64_t v36 = 3;
          goto LABEL_72;
        }
      }
      return;
    }
    if (v17 != 1) {
      return;
    }
    if (a5 == 30)
    {
      *(void *)buf = *(void *)a4;
      *(_WORD *)&buf[8] = *((_WORD *)a4 + 4);
      BOOL v18 = 1;
      if (buf[0] == 1 && !buf[1] && !buf[2])
      {
        if (*(_DWORD *)&buf[3] | *(unsigned __int16 *)&buf[7]) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = buf[9] != 0;
        }
      }
      BOOL v32 = v18;
      uint64_t v28 = mach_absolute_time();
      sub_1902D8D34(v28);
      v13 = &v32;
      uint64_t v14 = v8;
      uint64_t v15 = 1;
      uint64_t v16 = 1;
      goto LABEL_15;
    }
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
    }
    v26 = qword_1EB3BE830;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 30;
      _os_log_impl(&dword_1902AF000, v26, OS_LOG_TYPE_FAULT, "Bad motion report input %ld, expected %lu", buf, 0x16u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 == -1) {
      goto LABEL_31;
    }
    goto LABEL_80;
  }
  if (qword_1EB3BE838 != -1) {
    dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
  }
  v9 = qword_1EB3BE830;
  if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_FAULT, "received bad hid report", buf, 2u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
    }
    LOWORD(v33) = 0;
    goto LABEL_72;
  }
}

- (void)monitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  BOOL v4 = a4;
  if (qword_1EB3BF298 != -1) {
    dispatch_once(&qword_1EB3BF298, &unk_1EDFD1BC0);
  }
  uint64_t v6 = qword_1EB3BF290;
  if (*(id *)(qword_1EB3BF290 + 40) == a3)
  {
    BOOL v14 = v4;
    uint64_t v10 = mach_absolute_time();
    sub_1902D8D34(v10);
    sub_1902D8BCC(v6, 2, (uint64_t)&v14, 1);
    *(unsigned char *)(v6 + 91) = v14;
    if (v4)
    {
      int v11 = sub_1904DF584();
      if (*(unsigned __int8 *)(v6 + 89) != v11)
      {
        char v13 = v11;
        v15[0] = -60;
        v15[1] = v11;
        if (objc_msgSend_setReport_payload_length_(*(void **)(v6 + 40), v12, 196, v15, 2)) {
          *(unsigned char *)(v6 + 89) = v13;
        }
      }
    }
    else
    {
      *(unsigned char *)(v6 + 89) = 0;
    }
  }
  else if (*(id *)(qword_1EB3BF290 + 48) == a3)
  {
    if (v4)
    {
      int v7 = sub_1904DF274();
      if (*(unsigned __int8 *)(v6 + 90) != v7)
      {
        char v9 = v7;
        v16[0] = 105;
        v16[1] = v7;
        if (objc_msgSend_setReport_payload_length_(*(void **)(v6 + 48), v8, 105, v16, 2)) {
          *(unsigned char *)(v6 + 90) = v9;
        }
      }
    }
    else
    {
      *(unsigned char *)(qword_1EB3BF290 + 90) = 0;
    }
  }
}

- (void)eventUpdateForDevice:(id)a3 event:(id)a4
{
  if (qword_1EB3BF298 != -1) {
    dispatch_once(&qword_1EB3BF298, &unk_1EDFD1BC0);
  }
  uint64_t v4 = qword_1EB3BF290;
  if (IOHIDEventConformsTo())
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      CFArrayRef v6 = Children;
      CFIndex Count = CFArrayGetCount(Children);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0; i != v8; ++i)
        {
          CFArrayGetValueAtIndex(v6, i);
          if (IOHIDEventGetType() == 11)
          {
            int v10 = IOHIDEventGetIntegerValue() == 1;
            if (*(unsigned __int8 *)(v4 + 72) != v10)
            {
              char v11 = v10;
              sub_1904DC8A8(v4, 3, (uint64_t)&v11, 1);
              *(unsigned char *)(v4 + 72) = v10;
            }
          }
        }
      }
    }
  }
}

- (void)smartCoverStateDidChange:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1EB3BF298 != -1) {
    dispatch_once(&qword_1EB3BF298, &unk_1EDFD1BC0);
  }
  uint64_t v4 = qword_1EB3BF290;
  if (*(unsigned char *)(qword_1EB3BF290 + 91))
  {
    if (a3 == 1)
    {
      char v5 = 2;
    }
    else
    {
      if (a3 != 3) {
        return;
      }
      char v5 = 1;
    }
    char v9 = v5;
    if (qword_1EB3BE838 != -1) {
      dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
    }
    CFArrayRef v6 = qword_1EB3BE830;
    if (os_log_type_enabled((os_log_t)qword_1EB3BE830, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = off_1EC20D460(a3);
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_INFO, "iPad Hall Effect sensor detected the cover was, %@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB3BE838 != -1) {
        dispatch_once(&qword_1EB3BE838, &unk_1EDFD2F80);
      }
      int v10 = 138412290;
      uint64_t v11 = off_1EC20D460(a3);
      CFIndex v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "void CLKeyboardMotionNotifier::onSmartCoverOpened(SBSSmartCoverState)", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    uint64_t v7 = mach_absolute_time();
    sub_1902D8D34(v7);
    sub_1902D8BCC(v4, 4, (uint64_t)&v9, 1);
  }
}

@end