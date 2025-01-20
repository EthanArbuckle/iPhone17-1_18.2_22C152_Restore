void sub_224F94474()
{
  IMAVHandler *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t vars8;

  v0 = objc_alloc_init(IMAVHandler);
  v1 = (void *)qword_26AB79678;
  qword_26AB79678 = (uint64_t)v0;

  objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v2, v3, v4, v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_listener(v14, v6, v7, v8, v9);
  objc_msgSend_addHandler_(v10, v11, qword_26AB79678, v12, v13);
}

void sub_224F975AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224F975E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend__timings(*(void **)(a1 + 32), a2, a3, a4, a5);
  objc_msgSend_stopTimingForKey_(v7, v8, @"incoming-network-check", v9, v10);

  v11 = sub_224FB12A0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    IMTimeOfDay();
    double v13 = v12 - *(double *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    double v77 = v13;
    _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "Network check complete (Took %f seconds)", buf, 0xCu);
  }

  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    unsigned int v22 = objc_msgSend_state(*(void **)(a1 + 32), v18, v19, v20, v21);
    v23 = sub_224FB12A0();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22 > 4)
    {
      if (v24)
      {
        double v63 = *(double *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        double v77 = v63;
        _os_log_impl(&dword_224F93000, v23, OS_LOG_TYPE_DEFAULT, "*** not notifying for chat, already ended: %@", buf, 0xCu);
      }

      if (WeakRetained) {
        objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 40) + 16), v64, (uint64_t)WeakRetained, v65, v66);
      }
      objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 40) + 8), v64, *(void *)(a1 + 32), v65, v66);
    }
    else
    {
      if (v24)
      {
        double v25 = *(double *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        double v77 = v25;
        _os_log_impl(&dword_224F93000, v23, OS_LOG_TYPE_DEFAULT, "Notifying for chat: %@", buf, 0xCu);
      }

      objc_msgSend__notifyOfIncomingInvitationFor_notifyInvitationListeners_(*(void **)(a1 + 40), v26, *(void *)(a1 + 32), 1, v27);
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v28 = *(id *)(*(void *)(a1 + 40) + 8);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v71, (uint64_t)v80, 16);
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v72 != v32) {
              objc_enumerationMutation(v28);
            }
            v34 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            v35 = sub_224FB12A0();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v36 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              double v77 = *(double *)&v34;
              __int16 v78 = 2112;
              uint64_t v79 = v36;
              _os_log_impl(&dword_224F93000, v35, OS_LOG_TYPE_DEFAULT, "Comparing thisChat %@ and chat %@", buf, 0x16u);
            }

            if (*(void **)(a1 + 32) != v34)
            {
              v38 = sub_224FB12A0();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                double v77 = *(double *)&v34;
                _os_log_impl(&dword_224F93000, v38, OS_LOG_TYPE_DEFAULT, "Declining other chat: %@", buf, 0xCu);
              }

              objc_msgSend_declineInvitationWithResponse_(v34, v39, 2, v40, v41);
            }
          }
          uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v37, (uint64_t)&v71, (uint64_t)v80, 16);
        }
        while (v31);
      }

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v42 = *(id *)(*(void *)(a1 + 40) + 16);
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v67, (uint64_t)v75, 16);
      if (v44)
      {
        uint64_t v49 = v44;
        uint64_t v50 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v68 != v50) {
              objc_enumerationMutation(v42);
            }
            id v52 = *(id *)(*((void *)&v67 + 1) + 8 * j);
            if (v52 != WeakRetained) {
              objc_msgSend_cancel(v52, v45, v46, v47, v48);
            }
          }
          uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v67, (uint64_t)v75, 16);
        }
        while (v49);
      }

      v53 = sub_224FB12A0();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v53, OS_LOG_TYPE_DEFAULT, "Flushing queue", buf, 2u);
      }

      objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 40) + 16), v54, v55, v56, v57);
      objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 40) + 8), v58, v59, v60, v61);
    }
  }
  else
  {
    v62 = *(void **)(a1 + 32);
    if ((*(unsigned char *)(a1 + 64) & 2) != 0) {
      objc_msgSend_declineInvitationWithResponse_(v62, v14, 4, v15, v16);
    }
    else {
      objc_msgSend_declineInvitationWithResponse_(v62, v14, 5, v15, v16);
    }
  }
}

BOOL sub_224F99C7C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (objc_msgSend_capabilities(a1, a2, a3, a4, a5) & 0x1FF0000) == 0;
}

void sub_224F9A7D4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int buf, long long a12, uint64_t a13, long long a14)
{
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(a1);
    v17 = sub_224FB12A0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = @"NO";
      buf = 138413058;
      WORD2(a12) = 2112;
      if (v15) {
        v18 = @"YES";
      }
      *(void *)((char *)&a12 + 6) = v18;
      HIWORD(a12) = 2112;
      LOWORD(a14) = 2112;
      *(void *)((char *)&a14 + 2) = v16;
      _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] -[IMAVChat initIncomingFrom:%@ isVideo:%@ callerProperties:%@] threw exception %@", (uint8_t *)&buf, 0x2Au);
    }

    objc_end_catch();
    JUMPOUT(0x224F9A77CLL);
  }
  _Unwind_Resume(a1);
}

void sub_224FA106C(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v7 = objc_msgSend_remoteICEData(v17, v3, v4, v5, v6);
  if (v7)
  {
    double v12 = (void *)v7;
    double v13 = objc_msgSend_localICEData(v17, v8, v9, v10, v11);

    if (!v13) {
      objc_msgSend_addObject_(*(void **)(a1 + 32), v14, (uint64_t)v17, v15, v16);
    }
  }
}

void sub_224FA11A0(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v7 = objc_msgSend_remoteICEData(v17, v3, v4, v5, v6);
  if (v7)
  {
  }
  else
  {
    double v12 = objc_msgSend_localICEData(v17, v8, v9, v10, v11);

    uint64_t v16 = v17;
    if (!v12) {
      goto LABEL_6;
    }
    objc_msgSend_addObject_(*(void **)(a1 + 32), v13, (uint64_t)v17, v14, v15);
  }
  uint64_t v16 = v17;
LABEL_6:
}

void sub_224FA24F4(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    int v21 = 138412290;
    unsigned int v22 = v3;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "_hangupCallLaterIfReinitiateFailsForCallInfo is firing for call info %@", (uint8_t *)&v21, 0xCu);
  }

  if (objc_msgSend_state(*(void **)(a1 + 32), v4, v5, v6, v7) <= 2)
  {
    v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = objc_msgSend_avChat(*(void **)(a1 + 40), v9, v10, v11, v12);
      int v21 = 138412290;
      unsigned int v22 = v13;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Reinitiate call info still has not connected. Ending chat: %@", (uint8_t *)&v21, 0xCu);
    }
    v18 = objc_msgSend_avChat(*(void **)(a1 + 40), v14, v15, v16, v17);
    objc_msgSend__endChatWithReason_andError_(v18, v19, 7, 32001, v20);
  }
}

uint64_t sub_224FA37C4()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_26AB796F0;
  qword_26AB796F0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_224FA3C7C()
{
  id v0 = objc_alloc_init(IMAVController);
  uint64_t v1 = qword_26AB796C8;
  qword_26AB796C8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_224FA3DBC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_ensureHandlerSetup(IMAVHandler, a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v5, v6, v7, v8);
  objc_msgSend_setUsesPowerNotifications_(v9, v10, 1, v11, v12);

  uint64_t v17 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v13, v14, v15, v16);
  objc_msgSend_setWatchesScreenLightState_(v17, v18, 1, v19, v20);

  int v21 = IMGetMainBundleIdentifier();
  int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v21, v22, @"com.apple.TelephonyUtilities", v23, v24);

  v26 = IMGetMainBundleIdentifier();
  int v30 = objc_msgSend_isEqualToIgnoringCase_(v26, v27, @"com.apple.TelephonyUtilities", v28, v29);

  int v35 = *MEMORY[0x263F4A648];
  if (!isEqualToIgnoringCase) {
    int v35 = 0;
  }
  int v36 = v35 | *MEMORY[0x263F4A640];
  unsigned int v37 = *MEMORY[0x263F4A650];
  if (!v30) {
    unsigned int v37 = 0;
  }
  uint64_t v38 = v36 | v37;
  objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v31, v32, v33, v34);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addListenerID_capabilities_(v41, v39, @"@\"com.apple.imavcore.imavcontroller\"", v38, v40);
}

void sub_224FA6104(void *a1, _DWORD *a2, int *a3, unsigned char *a4)
{
  id v7 = a1;
  unint64_t v89 = 0;
  uint64_t v12 = objc_msgSend_domain(v7, v8, v9, v10, v11);
  int isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)off_2680BE6F0, v14, v15);

  if (isEqualToString)
  {
    uint64_t v21 = objc_msgSend_code(v7, v17, v18, v19, v20);
    sub_224FA66E4(v21, (char *)&v89 + 4, (int *)&v89, v22, v23);
    if (HIDWORD(v89))
    {
LABEL_52:
      int v66 = v89;
      if (v89 == 7000)
      {
        unint64_t v89 = 0x1800001B58;
        int v66 = 7000;
      }
      goto LABEL_54;
    }
  }
  uint64_t v24 = objc_msgSend_domain(v7, v17, v18, v19, v20);
  uint64_t v25 = *MEMORY[0x263F4A298];
  int v29 = objc_msgSend_isEqualToString_(v24, v26, *MEMORY[0x263F4A298], v27, v28);

  if (v29)
  {
    uint64_t v34 = objc_msgSend_userInfo(v7, v30, v31, v32, v33);
    if (!objc_msgSend_count(v34, v35, v36, v37, v38))
    {
LABEL_16:

      goto LABEL_17;
    }
    id v42 = objc_msgSend_objectForKey_(v34, v39, @"internalCode", v40, v41);
    int v47 = objc_msgSend_integerValue(v42, v43, v44, v45, v46);
    int v48 = 0;
    if (v47 <= 5056)
    {
      int v49 = 0;
      switch(v47)
      {
        case 5000:
        case 5006:
        case 5011:
        case 5012:
        case 5029:
        case 5032:
        case 5033:
          int v48 = 24;
          goto LABEL_14;
        case 5001:
          int v49 = 32000;
          int v48 = 15;
          break;
        case 5002:
        case 5003:
        case 5004:
        case 5007:
        case 5008:
        case 5009:
        case 5013:
        case 5015:
        case 5016:
        case 5017:
        case 5031:
          int v48 = 15;
          goto LABEL_14;
        case 5005:
        case 5030:
          int v48 = 23;
          goto LABEL_14;
        default:
          goto LABEL_15;
      }
      goto LABEL_15;
    }
    if ((v47 - 5085) >= 3)
    {
      int v49 = 0;
      if (v47 != 10000)
      {
LABEL_15:
        unint64_t v89 = __PAIR64__(v48, v49);

        goto LABEL_16;
      }
      int v48 = 6600;
    }
    else
    {
      int v48 = 28;
    }
LABEL_14:
    int v49 = v47;
    goto LABEL_15;
  }
LABEL_17:
  if (HIDWORD(v89)) {
    goto LABEL_52;
  }
  uint64_t v50 = objc_msgSend_domain(v7, v30, v31, v32, v33);
  int v54 = objc_msgSend_isEqualToString_(v50, v51, v25, v52, v53);

  if (!v54) {
    goto LABEL_52;
  }
  uint64_t v59 = objc_msgSend_code(v7, v55, v56, v57, v58);
  int v64 = -1;
  int v65 = 6;
  switch(v59)
  {
    case 0:
      goto LABEL_31;
    case 1:
      int v64 = 3000;
      goto LABEL_23;
    case 2:
      int v64 = 3001;
LABEL_23:
      int v65 = 16;
      goto LABEL_31;
    case 3:
      int v64 = 3002;
      int v65 = 18;
      goto LABEL_31;
    case 4:
      int v64 = 3003;
      int v65 = 17;
      goto LABEL_31;
    case 5:
      int v64 = 3004;
      int v65 = 19;
      goto LABEL_31;
    case 6:
      int v64 = 3005;
      int v65 = 20;
      goto LABEL_31;
    case 7:
      int v64 = 8000;
      goto LABEL_31;
    case 8:
      int v64 = 8005;
      goto LABEL_31;
    case 9:
      int v64 = 8006;
LABEL_31:
      unint64_t v89 = __PAIR64__(v65, v64);
      long long v67 = objc_msgSend_userInfo(v7, v60, v61, v62, v63);
      if (objc_msgSend_count(v67, v68, v69, v70, v71))
      {
        v75 = objc_msgSend_objectForKey_(v67, v72, @"internalCode", v73, v74);
        uint64_t v79 = objc_msgSend_objectForKey_(v67, v76, @"internalErrorDomain", v77, v78);
        v83 = v79;
        if (v75)
        {
          if (objc_msgSend_isEqualToString_(v79, v80, *MEMORY[0x263F08570], v81, v82))
          {
            switch(objc_msgSend_intValue(v75, v84, v85, v86, v87))
            {
              case 0xFFFFFC04:
              case 0xFFFFFC06:
              case 0xFFFFFC12:
              case 0xFFFFFC14:
              case 0xFFFFFC15:
                int v88 = 6700;
                break;
              case 0xFFFFFC07:
              case 0xFFFFFC08:
              case 0xFFFFFC09:
              case 0xFFFFFC0A:
              case 0xFFFFFC0D:
                int v88 = 6701;
                break;
              case 0xFFFFFC0F:
              case 0xFFFFFC16:
              case 0xFFFFFC18:
                int v88 = 6600;
                break;
              case 0xFFFFFC13:
                int v88 = 6500;
                break;
              case 0xFFFFFC17:
                int v88 = 1002;
                break;
              default:
                goto LABEL_36;
            }
            LODWORD(v89) = v88;
          }
          else
          {
LABEL_36:
            LODWORD(v89) = objc_msgSend_intValue(v75, v84, v85, v86, v87);
          }
        }
      }
      goto LABEL_52;
    case 10:
      int v66 = 3006;
      goto LABEL_43;
    case 11:
      int v66 = 3007;
      goto LABEL_43;
    case 12:
      int v66 = 3008;
      goto LABEL_43;
    case 13:
      int v66 = 3009;
      goto LABEL_43;
    case 14:
      int v66 = 3010;
      goto LABEL_43;
    case 15:
      int v66 = 3011;
      goto LABEL_43;
    default:
      int v66 = 0;
LABEL_43:
      HIDWORD(v89) = 0;
      break;
  }
LABEL_54:
  if (a2) {
    *a2 = HIDWORD(v89);
  }
  if (a3) {
    *a3 = v66;
  }
  if (a4) {
    *a4 = isEqualToString;
  }
}

BOOL sub_224FA6654(int a1)
{
  return a1 < 1;
}

BOOL sub_224FA6660(int a1)
{
  return (a1 - 1000) < 0x3E8;
}

BOOL sub_224FA6670(int a1)
{
  return (a1 - 32000) < 0x3E8;
}

BOOL sub_224FA6684(int a1)
{
  return (a1 - 3000) < 0x3E8;
}

BOOL sub_224FA6694(int a1)
{
  return (a1 - 6000) < 0x3E8;
}

BOOL sub_224FA66A8(int a1)
{
  return (a1 - 7000) < 0x3E8;
}

BOOL sub_224FA66BC(int a1)
{
  return (a1 - 8000) < 0x3E8;
}

BOOL sub_224FA66D0(int a1)
{
  return (a1 - 5000) < 0x3E8;
}

void sub_224FA66E4(uint64_t a1, char *a2, int *a3, uint64_t a4, uint64_t a5)
{
  int v7 = a1;
  if ((unint64_t)(a1 - 32000) >= 0x18) {
    int v8 = 15;
  }
  else {
    int v8 = dword_224FD2830[a1 - 32000];
  }
  objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], a2, (uint64_t)a3, a4, a5);
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  int valid = objc_msgSend_validNetworkActive(v45, v9, v10, v11, v12);
  int v18 = objc_msgSend_validNetworkEnabled(v45, v14, v15, v16, v17);
  int v23 = objc_msgSend_validNetworkReachable(v45, v19, v20, v21, v22);
  if ((objc_msgSend_allowAnyNetwork(v45, v24, v25, v26, v27) & 1) != 0
    || (objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v28, v29, v30, v31),
        uint64_t v32 = objc_claimAutoreleasedReturnValue(),
        int v37 = objc_msgSend_nonWifiFaceTimeAvailable(v32, v33, v34, v35, v36),
        v32,
        v37))
  {
    int v38 = v18 & valid;
    int v39 = 6600;
  }
  else
  {
    int v38 = v18 & valid;
    int v39 = 6000;
  }
  if (v23) {
    int v40 = v7;
  }
  else {
    int v40 = 6500;
  }
  if (v23) {
    int v41 = v8;
  }
  else {
    int v41 = 7;
  }
  BOOL v42 = v38 == 1;
  if (v38 == 1) {
    int v43 = v40;
  }
  else {
    int v43 = v39;
  }
  if (v42) {
    int v44 = v41;
  }
  else {
    int v44 = 7;
  }
  if (a2) {
    *(_DWORD *)a2 = v44;
  }
  if (a3) {
    *a3 = v43;
  }
}

void sub_224FA9330(char a1)
{
  if (qword_2680BEF80 != -1) {
    dispatch_once(&qword_2680BEF80, &unk_26D85A590);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FA9418;
  block[3] = &unk_264710C40;
  char v3 = a1;
  dispatch_async((dispatch_queue_t)qword_2680BEF78, block);
}

uint64_t sub_224FA93D8()
{
  dispatch_queue_t v0 = dispatch_queue_create("IMAVCoreSetEnableNetworkingFlagsQueue", 0);
  uint64_t v1 = qword_2680BEF78;
  qword_2680BEF78 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_224FA9418(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(unsigned __int8 *)(a1 + 32);
  if (byte_2680BEF70 != v5)
  {
    byte_2680BEF70 = *(unsigned char *)(a1 + 32);
    int v7 = off_2680BEF88;
    if (!off_2680BEF88)
    {
      int v7 = (void *)MEMORY[0x22A628620]("SBSSpringBoardServerPort", @"SpringBoardServices");
      off_2680BEF88 = v7;
    }
    int v8 = off_2680BEF90;
    if (!off_2680BEF90)
    {
      int v8 = (void *)MEMORY[0x22A628620]("SBSetApplicationNetworkFlags", @"SpringBoardServices");
      off_2680BEF90 = v8;
      int v7 = off_2680BEF88;
    }
    if (v8) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      uint64_t v10 = ((uint64_t (*)(void))v7)();
      ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v10, v5, v5);
    }
    uint64_t v11 = (void *)qword_2680BEF98;
    if (!qword_2680BEF98)
    {
      uint64_t v11 = (void *)MEMORY[0x22A628610](@"UIApplication", @"UIKit");
      qword_2680BEF98 = (uint64_t)v11;
    }
    objc_msgSend_sharedApplication(v11, a2, a3, a4, a5);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsesBackgroundNetwork_(v15, v12, *(unsigned __int8 *)(a1 + 32), v13, v14);
  }
}

uint64_t sub_224FA958C()
{
  dispatch_queue_t v0 = objc_alloc_init(IMAVTelephonyManager);
  uint64_t v1 = qword_26AB796D0;
  qword_26AB796D0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t ShouldAutoAcceptInvitations()
{
  return MEMORY[0x270F3CAC8](@"com.apple.conference", @"autoAcceptInvitations");
}

BOOL IsIMAVChatEndedReasonACallFailure(unsigned int a1)
{
  return a1 > 5 && a1 - 12 < 0xFFFFFFFC && a1 - 23 < 0xFFFFFFFE && a1 != 27 && (a1 & 0xFFFFFFFD) != 29;
}

__CFString *_NSStringDescriptionForIMAVResponse(unsigned int a1)
{
  if (a1 > 0xB) {
    return 0;
  }
  else {
    return off_264710C60[a1];
  }
}

__CFString *_NSStringDescriptionForIMAVChatState(unsigned int a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_264710DC0[a1];
  }
}

id _NSStringDescriptionForIMAVChatError(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = a1;
  uint64_t v6 = objc_msgSend_stringWithFormat_(NSString, a2, @"Unknown Error %d", a4, a5, a1);
  if (v5 <= 5999)
  {
    if (v5 > 2999)
    {
      switch(v5)
      {
        case 5000:
          int v7 = @"Unauthenticated";
          goto LABEL_154;
        case 5001:
        case 5035:
        case 5036:
        case 5037:
        case 5038:
        case 5039:
        case 5040:
        case 5041:
        case 5042:
        case 5043:
        case 5044:
        case 5045:
        case 5046:
        case 5047:
        case 5048:
        case 5049:
        case 5050:
        case 5051:
        case 5052:
        case 5053:
        case 5054:
        case 5055:
        case 5056:
        case 5057:
        case 5058:
        case 5065:
        case 5066:
        case 5067:
        case 5068:
        case 5069:
        case 5070:
        case 5071:
        case 5072:
        case 5073:
        case 5074:
        case 5075:
        case 5076:
        case 5077:
        case 5078:
        case 5079:
        case 5080:
        case 5081:
        case 5082:
        case 5083:
        case 5084:
          goto LABEL_155;
        case 5002:
          int v7 = @"Version Mismatch";
          goto LABEL_154;
        case 5003:
          int v7 = @"Bad Request";
          goto LABEL_154;
        case 5004:
          int v7 = @"Server Too Busy";
          goto LABEL_154;
        case 5005:
          int v7 = @"No Such Player ID";
          goto LABEL_154;
        case 5006:
          int v7 = @"Bad Push Token";
          goto LABEL_154;
        case 5007:
          int v7 = @"No Such Achievement";
          goto LABEL_154;
        case 5008:
          int v7 = @"Missing Required Key";
          goto LABEL_154;
        case 5009:
          int v7 = @"Missing Required Header";
          goto LABEL_154;
        case 5010:
          int v7 = @"Unrecognized Game Descriptor Headers";
          goto LABEL_154;
        case 5011:
          int v7 = @"Must Accept Terms of Service";
          goto LABEL_154;
        case 5012:
          int v7 = @"Invalid Name or Password";
          goto LABEL_154;
        case 5013:
          int v7 = @"Cancelled by User";
          goto LABEL_154;
        case 5014:
          int v7 = @"No Such Friend Relationship";
          goto LABEL_154;
        case 5015:
          int v7 = @"No Such Alias";
          goto LABEL_154;
        case 5016:
          int v7 = @"Email Not in Network";
          goto LABEL_154;
        case 5017:
          int v7 = @"Request Disallowed";
          goto LABEL_154;
        case 5018:
          int v7 = @"No Such RID";
          goto LABEL_154;
        case 5019:
          int v7 = @"No Such Game";
          goto LABEL_154;
        case 5020:
          int v7 = @"DSError";
          goto LABEL_154;
        case 5021:
          int v7 = @"Profile Exists";
          goto LABEL_154;
        case 5022:
          int v7 = @"Alias Exists";
          goto LABEL_154;
        case 5023:
          int v7 = @"Account Name Not Email Address";
          goto LABEL_154;
        case 5024:
          int v7 = @"Alias Too Long";
          goto LABEL_154;
        case 5025:
          int v7 = @"Alias Too Frequent Updates";
          goto LABEL_154;
        case 5026:
          int v7 = @"Player Status Not Allowed";
          goto LABEL_154;
        case 5027:
          int v7 = @"Player Status Too Long";
          goto LABEL_154;
        case 5028:
          int v7 = @"No Such Bucket ID";
          goto LABEL_154;
        case 5029:
          int v7 = @"Authenticated Not Authorized";
          goto LABEL_154;
        case 5030:
          int v7 = @"No Push Token for ID";
          goto LABEL_154;
        case 5031:
          int v7 = @"Push Payload Too Big";
          goto LABEL_154;
        case 5032:
          int v7 = @"Bad Signature";
          goto LABEL_154;
        case 5033:
          int v7 = @"New Signature Required";
          goto LABEL_154;
        case 5034:
          int v7 = @"New Registration Required";
          goto LABEL_154;
        case 5059:
          int v7 = @"Phone Number Too Short";
          goto LABEL_154;
        case 5060:
          int v7 = @"Phone Number Too Long";
          goto LABEL_154;
        case 5061:
          int v7 = @"Phone Number Bad Country Code";
          goto LABEL_154;
        case 5062:
          int v7 = @"Phone Number Malformed";
          goto LABEL_154;
        case 5063:
          int v7 = @"Bad Invitation Context";
          goto LABEL_154;
        case 5064:
          int v7 = @"Unpromotable Phone Number";
          goto LABEL_154;
        case 5085:
          int v7 = @"Bad Cert";
          goto LABEL_154;
        case 5086:
          int v7 = @"Bad Nonce";
          goto LABEL_154;
        case 5087:
          int v7 = @"Bad Nonce Timestamp";
          goto LABEL_154;
        default:
          switch(v5)
          {
            case 3000:
              int v7 = @"Invitation Failed";
              goto LABEL_154;
            case 3001:
              int v7 = @"Counter Proposal Failed";
              goto LABEL_154;
            case 3002:
              int v7 = @"Cancel Failed";
              goto LABEL_154;
            case 3003:
              int v7 = @"Response Failed";
              goto LABEL_154;
            case 3004:
              int v7 = @"VCUpdate Failed";
              goto LABEL_154;
            case 3005:
              int v7 = @"AVMessage Failed";
              goto LABEL_154;
            case 3006:
              int v7 = @"Request AVInfo Failed";
              goto LABEL_154;
            case 3007:
              int v7 = @"Request Audio Reflector Failed";
              goto LABEL_154;
            case 3008:
              int v7 = @"Request Video Still Failed";
              goto LABEL_154;
            case 3009:
              int v7 = @"Provide AVInfo Failed";
              goto LABEL_154;
            case 3010:
              int v7 = @"Provide Video Still Failed";
              goto LABEL_154;
            case 3011:
              int v7 = @"Set AVManager Client URL Failed";
              goto LABEL_154;
            default:
              goto LABEL_155;
          }
      }
      goto LABEL_155;
    }
    if (v5 > 999)
    {
      switch(v5)
      {
        case 1000:
          int v7 = @"VCChannel Auth Failed";
          goto LABEL_154;
        case 1001:
          int v7 = @"VCChannel Connection Failed";
          goto LABEL_154;
        case 1002:
          int v7 = @"NetworkTimeout";
          goto LABEL_154;
        case 1003:
          int v7 = @"Insufficient Bandwidth";
          goto LABEL_154;
        case 1004:
          int v7 = @"Local Video Error";
          goto LABEL_154;
        case 1005:
          int v7 = @"No Packets";
          goto LABEL_154;
        case 1006:
          int v7 = @"Local Cert Not Trusted";
          goto LABEL_154;
        case 1007:
          int v7 = @"Invalid Security";
          goto LABEL_154;
        case 1008:
          int v7 = @"Timeout";
          goto LABEL_154;
        case 1009:
          int v7 = @"Cancel During Connect";
          goto LABEL_154;
        case 1010:
          int v7 = @"Invalid Remote Size";
          goto LABEL_154;
        case 1011:
          int v7 = @"Invalid Local Size";
          goto LABEL_154;
        case 1012:
          int v7 = @"Invalid IP Addr or Port";
          goto LABEL_154;
        case 1013:
          int v7 = @"Invalid State";
          goto LABEL_154;
        case 1014:
          int v7 = @"Expired Framework";
          goto LABEL_154;
        case 1015:
          int v7 = @"Remote Party Declined";
          goto LABEL_154;
        case 1016:
          int v7 = @"Remote Party is Busy";
          goto LABEL_154;
        case 1017:
          int v7 = @"Caller Cancelled";
          goto LABEL_154;
        default:
          goto LABEL_155;
      }
      goto LABEL_155;
    }
    if (v5 == -2)
    {
      int v7 = @"Generic Error";
    }
    else if (v5 == -1)
    {
      int v7 = @"Unknown Error";
    }
    else
    {
      if (v5) {
        goto LABEL_155;
      }
      int v7 = @"No Error";
    }
LABEL_154:

    uint64_t v6 = v7;
    goto LABEL_155;
  }
  if (v5 <= 31999)
  {
    if (v5 > 6899)
    {
      if (v5 <= 7001)
      {
        switch(v5)
        {
          case 6900:
            int v7 = @"System needs update";
            break;
          case 7000:
            int v7 = @"Not Registered";
            break;
          case 7001:
            int v7 = @"Region info needs update";
            break;
          default:
            goto LABEL_155;
        }
      }
      else
      {
        switch(v5)
        {
          case 8000:
            int v7 = @"Relay Invitation Failed";
            goto LABEL_154;
          case 8001:
            int v7 = @"Relay Not Found";
            goto LABEL_154;
          case 8002:
            int v7 = @"Relay Connection Failed";
            goto LABEL_154;
          case 8003:
            int v7 = @"Relay Authorization Failed";
            goto LABEL_154;
          case 8004:
            int v7 = @"Relay Disconnected";
            goto LABEL_154;
          case 8005:
            int v7 = @"Relay Update Failed";
            goto LABEL_154;
          case 8006:
            int v7 = @"Relay Cancel Failed";
            goto LABEL_154;
          default:
            if (v5 != 7002) {
              goto LABEL_155;
            }
            int v7 = @"Region info not sufficient";
            break;
        }
      }
    }
    else if (v5 <= 6599)
    {
      if (v5 <= 6099)
      {
        if (v5 == 6000)
        {
          int v7 = @"No Local Wifi";
        }
        else
        {
          if (v5 != 6001) {
            goto LABEL_155;
          }
          int v7 = @"No Remote Wifi";
        }
      }
      else
      {
        switch(v5)
        {
          case 6100:
            int v7 = @"Could not create AVConference";
            break;
          case 6400:
            int v7 = @"Invalid remote ID";
            break;
          case 6500:
            int v7 = @"Network Disconnected";
            break;
          default:
            goto LABEL_155;
        }
      }
    }
    else if (v5 > 6700)
    {
      switch(v5)
      {
        case 6701:
          int v7 = @"Bad Server Response";
          break;
        case 6800:
          int v7 = @"Feature Disabled";
          break;
        case 6801:
          int v7 = @"Not Allowed";
          break;
        default:
          goto LABEL_155;
      }
    }
    else
    {
      switch(v5)
      {
        case 6600:
          int v7 = @"No Local Network";
          break;
        case 6601:
          int v7 = @"No Remote Network";
          break;
        case 6700:
          int v7 = @"Server Not Found";
          break;
        default:
          goto LABEL_155;
      }
    }
    goto LABEL_154;
  }
  switch(v5)
  {
    case 32000:
      int v7 = @"Internal Error";
      goto LABEL_154;
    case 32001:
      int v7 = @"No Remote Packets Error";
      goto LABEL_154;
    case 32002:
      int v7 = @"Unable to Connect Error";
      goto LABEL_154;
    case 32003:
      int v7 = @"Remote Participant Hangup Error";
      goto LABEL_154;
    case 32004:
      int v7 = @"Invalid Call ID Error";
      goto LABEL_154;
    case 32005:
      int v7 = @"Audio Unavailable Error";
      goto LABEL_154;
    case 32006:
      int v7 = @"Uninitialized Client Error";
      goto LABEL_154;
    case 32007:
      int v7 = @"Client Missing Required Methods Error";
      goto LABEL_154;
    case 32008:
      int v7 = @"Remote Participant Busy Error";
      goto LABEL_154;
    case 32009:
      int v7 = @"Remote Participant Cancelled Error";
      goto LABEL_154;
    case 32010:
      int v7 = @"Remote Participant Response Invalid Error";
      goto LABEL_154;
    case 32011:
      int v7 = @"Remote Participant Declined Invite Error";
      goto LABEL_154;
    case 32012:
      int v7 = @"Method Currently Invalid Error";
      goto LABEL_154;
    case 32013:
      int v7 = @"Network Configuration Error";
      goto LABEL_154;
    case 32014:
      int v7 = @"Unsupported Remote Version Error";
      goto LABEL_154;
    case 32015:
      int v7 = @"Out of Memory Error";
      goto LABEL_154;
    case 32016:
      int v7 = @"Invalid Parameter Error";
      goto LABEL_154;
    case 32017:
      int v7 = @"Video Unavailable Error";
      goto LABEL_154;
    case 32018:
      int v7 = @"SRTP Encryption Setup Error";
      goto LABEL_154;
    case 32019:
      int v7 = @"Network Relay Configuration Error";
      goto LABEL_154;
    case 32020:
      int v7 = @"Bad Network Conditions Error";
      goto LABEL_154;
    case 32021:
      int v7 = @"No Local Identity Error";
      goto LABEL_154;
    case 32022:
      int v7 = @"Relay Channel Error";
      goto LABEL_154;
    default:
      break;
  }
LABEL_155:
  return v6;
}

__CFString *_NSStringDescriptionForIMAVChatEndedReason(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 0x20)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"Unknown Reason %d", a4, a5, a1);
    int v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v5 = off_264710CC0[(int)a1];
  }
  return v5;
}

__CFString *_NSStringDescriptionForIMAVChatParticipantState(unsigned int a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_264710DC0[a1];
  }
}

__CFString *sub_224FAA424(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = a3;
  int v7 = objc_msgSend_count(a1, a2, a3, a4, a5);
  if (v7)
  {
    int v8 = (void *)MEMORY[0x263F086E0];
    uint64_t v9 = objc_opt_class();
    uint64_t v13 = objc_msgSend_bundleForClass_(v8, v10, v9, v11, v12);
    int v18 = v13;
    if (v7 == 2)
    {
      uint64_t v21 = NSString;
      uint64_t v22 = objc_msgSend_localizedStringForKey_value_table_(v13, v14, @"%@ and %@", (uint64_t)&stru_26D85AF10, @"IMAVCoreLocalizable");
      uint64_t v27 = objc_msgSend___imFirstObject(a1, v23, v24, v25, v26);
      uint64_t v31 = objc_msgSend_objectAtIndex_(a1, v28, 1, v29, v30);
      objc_msgSend_stringWithFormat_(v21, v32, (uint64_t)v22, v33, v34, v27, v31);
      uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 == 1)
      {
        objc_msgSend_lastObject(a1, v14, v15, v16, v17);
        uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        goto LABEL_16;
      }
      if (v5 < 3 || (int v35 = v7 - v5, v7 <= v5))
      {
        uint64_t v36 = v7 - 1;
        BOOL v42 = NSString;
        int v38 = objc_msgSend_localizedStringForKey_value_table_(v13, v14, @", and %@", (uint64_t)&stru_26D85AF10, @"IMAVCoreLocalizable");
        int v47 = objc_msgSend_lastObject(a1, v43, v44, v45, v46);
        uint64_t v22 = objc_msgSend_stringWithFormat_(v42, v48, (uint64_t)v38, v49, v50, v47);
      }
      else
      {
        uint64_t v36 = (v5 - 1);
        int v37 = NSString;
        int v38 = objc_msgSend_localizedStringForKey_value_table_(v13, v14, @", and %d others", (uint64_t)&stru_26D85AF10, @"IMAVCoreLocalizable");
        uint64_t v22 = objc_msgSend_stringWithFormat_(v37, v39, (uint64_t)v38, v40, v41, (v35 + 1));
      }

      uint64_t v53 = objc_msgSend_subarrayWithRange_(a1, v51, 0, v36, v52);
      uint64_t v55 = objc_msgSend_localizedStringForKey_value_table_(v18, v54, @", ", (uint64_t)&stru_26D85AF10, @"IMAVCoreLocalizable");
      uint64_t v27 = objc_msgSend_componentsJoinedByString_(v53, v56, (uint64_t)v55, v57, v58);

      objc_msgSend_stringByAppendingString_(v27, v59, (uint64_t)v22, v60, v61);
      uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }
  uint64_t v20 = sub_224FB12A0();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Can't join 0 items!", buf, 2u);
  }

  uint64_t v19 = &stru_26D85AF10;
LABEL_16:
  return v19;
}

void sub_224FAA6D8(void *a1)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v2, v3, v4, v5);
  int v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v83 = 138412290;
    v84 = v1;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "************ %@ *************", (uint8_t *)&v83, 0xCu);
  }

  int v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_allowAnyNetwork(v6, v9, v10, v11, v12)) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    int v83 = 138412290;
    v84 = v13;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Allow any network: %@", (uint8_t *)&v83, 0xCu);
  }

  uint64_t v14 = sub_224FB12A0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v15, v16, v17, v18);
    if (objc_msgSend_supportsNonWiFiFaceTime(v19, v20, v21, v22, v23)) {
      uint64_t v24 = @"YES";
    }
    else {
      uint64_t v24 = @"NO";
    }
    int v83 = 138412290;
    v84 = v24;
    _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "Supports non WiFi: %@", (uint8_t *)&v83, 0xCu);
  }
  uint64_t v25 = sub_224FB12A0();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB20], v26, v27, v28, v29);
    if (objc_msgSend_faceTimeNonWiFiEntitled(v30, v31, v32, v33, v34)) {
      int v35 = @"YES";
    }
    else {
      int v35 = @"NO";
    }
    int v83 = 138412290;
    v84 = v35;
    _os_log_impl(&dword_224F93000, v25, OS_LOG_TYPE_DEFAULT, "Entitled non WiFi: %@", (uint8_t *)&v83, 0xCu);
  }
  uint64_t v36 = sub_224FB12A0();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v37, v38, v39, v40);
    if (objc_msgSend_nonWifiFaceTimeAvailable(v41, v42, v43, v44, v45)) {
      uint64_t v46 = @"YES";
    }
    else {
      uint64_t v46 = @"NO";
    }
    int v83 = 138412290;
    v84 = v46;
    _os_log_impl(&dword_224F93000, v36, OS_LOG_TYPE_DEFAULT, "Allowed non WiFi: %@", (uint8_t *)&v83, 0xCu);
  }
  int v47 = sub_224FB12A0();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v52 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB68], v48, v49, v50, v51);
    if (objc_msgSend_cellularFaceTimeEnabled(v52, v53, v54, v55, v56)) {
      uint64_t v57 = @"YES";
    }
    else {
      uint64_t v57 = @"NO";
    }
    int v83 = 138412290;
    v84 = v57;
    _os_log_impl(&dword_224F93000, v47, OS_LOG_TYPE_DEFAULT, "User enabled non WiFi: %@", (uint8_t *)&v83, 0xCu);
  }
  uint64_t v58 = sub_224FB12A0();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_validNetworkEnabled(v6, v59, v60, v61, v62)) {
      uint64_t v63 = @"YES";
    }
    else {
      uint64_t v63 = @"NO";
    }
    int v83 = 138412290;
    v84 = v63;
    _os_log_impl(&dword_224F93000, v58, OS_LOG_TYPE_DEFAULT, "Is Network Enabled: %@", (uint8_t *)&v83, 0xCu);
  }

  int v64 = sub_224FB12A0();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_validNetworkActive(v6, v65, v66, v67, v68)) {
      uint64_t v69 = @"YES";
    }
    else {
      uint64_t v69 = @"NO";
    }
    int v83 = 138412290;
    v84 = v69;
    _os_log_impl(&dword_224F93000, v64, OS_LOG_TYPE_DEFAULT, "Is Network Active: %@", (uint8_t *)&v83, 0xCu);
  }

  uint64_t v70 = sub_224FB12A0();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_validNetworkReachable(v6, v71, v72, v73, v74)) {
      v75 = @"YES";
    }
    else {
      v75 = @"NO";
    }
    int v83 = 138412290;
    v84 = v75;
    _os_log_impl(&dword_224F93000, v70, OS_LOG_TYPE_DEFAULT, "Is Network Reachable: %@", (uint8_t *)&v83, 0xCu);
  }

  v76 = sub_224FB12A0();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_willSearchForNetwork(v6, v77, v78, v79, v80)) {
      uint64_t v81 = @"YES";
    }
    else {
      uint64_t v81 = @"NO";
    }
    int v83 = 138412290;
    v84 = v81;
    _os_log_impl(&dword_224F93000, v76, OS_LOG_TYPE_DEFAULT, "Will Search for Wifi: %@", (uint8_t *)&v83, 0xCu);
  }

  uint64_t v82 = sub_224FB12A0();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v83) = 0;
    _os_log_impl(&dword_224F93000, v82, OS_LOG_TYPE_DEFAULT, "**********************************", (uint8_t *)&v83, 2u);
  }
}

uint64_t sub_224FAAB90(int a1, int a2)
{
  uint64_t v2 = a2 | a1;
  if (a1 && a2)
  {
    if ((a2 | a1))
    {
      char v3 = 0;
    }
    else
    {
      char v3 = 0;
      int v4 = a1;
      do
      {
        a1 = v4 >> 1;
        a2 >>= 1;
        ++v3;
        int v5 = a2 | (v4 >> 1);
        v4 >>= 1;
      }
      while ((v5 & 1) == 0);
    }
    do
    {
      int v6 = a1;
      a1 >>= 1;
    }
    while ((v6 & 1) == 0);
    do
    {
      do
      {
        int v7 = a2;
        a2 >>= 1;
      }
      while ((v7 & 1) == 0);
      unsigned int v9 = v6 - v7;
      BOOL v8 = v6 - v7 < 0;
      if (v6 >= v7) {
        int v6 = v7;
      }
      if (v8) {
        unsigned int v10 = -v9;
      }
      else {
        unsigned int v10 = v9;
      }
      a2 = v10 >> 1;
    }
    while (v10 > 1);
    return (v6 << v3);
  }
  return v2;
}

id sub_224FAAC04(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = objc_msgSend_copyStringGUID(NSString, a2, a3, a4, a5);
  return v5;
}

id sub_224FAAC34()
{
  id v0 = [NSString alloc];
  int v5 = objc_msgSend_stringGUID(NSString, v1, v2, v3, v4);
  unsigned int v9 = objc_msgSend_initWithFormat_(v0, v6, @"ConferenceID:%@", v7, v8, v5);

  return v9;
}

__CFString *sub_224FAACA8(unsigned int a1)
{
  if (a1 > 5) {
    return @"Unknown";
  }
  else {
    return off_264710DF0[a1];
  }
}

uint64_t sub_224FAAD20()
{
  id v0 = objc_alloc_init(IMAVCallManager);
  uint64_t v1 = qword_26AB796D8;
  qword_26AB796D8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_224FAB03C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  char shouldRunConferences = objc_msgSend__shouldRunConferences(v7, v8, v9, v10, v11);

  if ((shouldRunConferences & 1) == 0)
  {
    uint64_t v16 = *(void **)(a1 + 32);
    objc_msgSend__setAVCallState_(v16, v13, a3, v14, v15);
  }
}

void sub_224FAB0B4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  char shouldRunACConferences = objc_msgSend__shouldRunACConferences(v7, v8, v9, v10, v11);

  if ((shouldRunACConferences & 1) == 0)
  {
    uint64_t v16 = *(void **)(a1 + 32);
    objc_msgSend__setACCallState_(v16, v13, a3, v14, v15);
  }
}

void *sub_224FAC8C0()
{
  result = (void *)MEMORY[0x22A628620]("PLLogRegisteredEvent", @"PowerLog");
  off_26AB79660 = result;
  return result;
}

void *sub_224FAC8F0()
{
  result = (void *)MEMORY[0x22A628620]("PLLogRegisteredEvent", @"PowerLog");
  off_26AB794E8 = result;
  return result;
}

void sub_224FAE05C(void *a1, void *a2, char a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  uint64_t v11 = a5;
  uint64_t v16 = objc_msgSend_copy(a4, v12, v13, v14, v15);
  if (!v11)
  {
    uint64_t v11 = dispatch_get_global_queue(0, 0);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_224FB0268;
  v20[3] = &unk_264710F18;
  char v24 = a3;
  char v25 = 0;
  id v22 = v10;
  id v23 = v16;
  id v21 = v9;
  id v17 = v10;
  id v18 = v16;
  id v19 = v9;
  dispatch_async(v11, v20);
}

void sub_224FAE17C(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  objc_msgSend_conferenceID(v9, v12, v13, v14, v15);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  sub_224FAE21C(a2, a3, (uint64_t)v11, v10, v16, *(void **)(a1 + 40));
}

void sub_224FAE21C(int a1, int a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v269 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v17 = objc_msgSend__avChatWithGUID_(IMAVChat, v14, a3, v15, v16);
  id v21 = objc_msgSend_participantWithID_(v17, v18, (uint64_t)v13, v19, v20);

  id v22 = sub_224FB12A0();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = @"NO";
    if (a1) {
      id v23 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v264 = v23;
    _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "Found WiFi: %@", buf, 0xCu);
  }

  char v24 = sub_224FB12A0();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    char v25 = @"NO";
    if (a2) {
      char v25 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v264 = v25;
    _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "Found Network: %@", buf, 0xCu);
  }

  sub_224FAA6D8(@"Done");
  if ((a2 & 1) == 0)
  {
    v249 = sub_224FB12A0();
    if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v249, OS_LOG_TYPE_DEFAULT, "  => Failing, no valid network", buf, 2u);
    }

    v250 = sub_224FB12A0();
    if (!os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v251 = "[WARN] Failed invite! network is not good";
    goto LABEL_53;
  }
  uint64_t v30 = objc_msgSend__timings(v17, v26, v27, v28, v29);
  objc_msgSend_stopTimingForKey_(v30, v31, @"time-to-av-fetch-ice-data-start-gather", v32, v33);

  uint64_t v34 = sub_224FB0970(v17, v21, v12);
  uint64_t v39 = (__CFString *)objc_msgSend_mutableCopy(v34, v35, v36, v37, v38);

  if (!v39)
  {
    v252 = sub_224FB12A0();
    if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v252, OS_LOG_TYPE_DEFAULT, "  => Failing, missing invitees info (Missing ICE Data)", buf, 2u);
    }

    v250 = sub_224FB12A0();
    if (!os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_54;
    }
    *(_WORD *)buf = 0;
    v251 = "[WARN] Failed invite! Invitees info returned nil (Missing ICE Data)";
LABEL_53:
    _os_log_impl(&dword_224F93000, v250, OS_LOG_TYPE_DEFAULT, v251, buf, 2u);
LABEL_54:

    sub_224FB08DC(v17);
    goto LABEL_58;
  }
  uint64_t v44 = objc_msgSend_inviteesInfo(v17, v40, v41, v42, v43);
  uint64_t v49 = objc_msgSend_count(v44, v45, v46, v47, v48);

  if (v49)
  {
    uint64_t v54 = objc_msgSend_inviteesInfo(v17, v50, v51, v52, v53);
    objc_msgSend_addEntriesFromDictionary_(v39, v55, (uint64_t)v54, v56, v57);
  }
  uint64_t v58 = objc_msgSend_imHandle(v21, v50, v51, v52, v53);
  uint64_t v63 = objc_msgSend_callerProperties(v17, v59, v60, v61, v62);
  Mutable = (__CFString *)objc_msgSend_mutableCopy(v63, v64, v65, v66, v67);

  if (!Mutable) {
    Mutable = (__CFString *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  uint64_t v73 = NSNumber;
  uint64_t v74 = objc_msgSend_sessionID(v17, v69, v70, v71, v72);
  uint64_t v78 = objc_msgSend_numberWithUnsignedInt_(v73, v75, v74, v76, v77);
  uint64_t v79 = *MEMORY[0x263F4A740];
  objc_msgSend_setObject_forKey_(v39, v80, (uint64_t)v78, *MEMORY[0x263F4A740], v81);

  uint64_t v86 = objc_msgSend_plistData(v39, v82, v83, v84, v85);
  objc_msgSend_setObject_forKey_(Mutable, v87, (uint64_t)v86, *MEMORY[0x263F4A6B8], v88);

  unint64_t v89 = NSNumber;
  int isVideo = objc_msgSend_isVideo(v17, v90, v91, v92, v93);
  v98 = objc_msgSend_numberWithBool_(v89, v95, isVideo ^ 1u, v96, v97);
  objc_msgSend_setObject_forKey_(Mutable, v99, (uint64_t)v98, *MEMORY[0x263F4A6A0], v100);

  v101 = NSNumber;
  uint64_t v106 = objc_msgSend_sessionID(v17, v102, v103, v104, v105);
  v110 = objc_msgSend_numberWithUnsignedInt_(v101, v107, v106, v108, v109);
  objc_msgSend_setObject_forKey_(Mutable, v111, (uint64_t)v110, v79, v112);

  if (v11)
  {
    objc_msgSend_setObject_forKey_(Mutable, v113, (uint64_t)v11, *MEMORY[0x263F4A6F0], v116);
    v120 = objc_msgSend_numberWithBool_(NSNumber, v117, 1, v118, v119);
    objc_msgSend_setObject_forKey_(Mutable, v121, (uint64_t)v120, *MEMORY[0x263F4A6B0], v122);
  }
  v123 = objc_msgSend__extraServerContext(v17, v113, v114, v115, v116);
  if (objc_msgSend_count(v123, v124, v125, v126, v127)) {
    objc_msgSend_addEntriesFromDictionary_(Mutable, v128, (uint64_t)v123, v130, v131);
  }
  if (objc_msgSend_isActive(v17, v128, v129, v130, v131))
  {
    id v261 = v11;
    objc_msgSend_setState_(v12, v132, 1, v133, v134);
    v135 = sub_224FB12A0();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_ID(v58, v136, v137, v138, v139);
      v140 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v264 = v140;
      _os_log_impl(&dword_224F93000, v135, OS_LOG_TYPE_DEFAULT, "Sending VC invite for %@ to service", buf, 0xCu);
    }
    v141 = sub_224FB12A0();
    v262 = v58;
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_conferenceID(v17, v142, v143, v144, v145);
      v146 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v151 = objc_msgSend_account(v58, v147, v148, v149, v150);
      *(_DWORD *)buf = 138412802;
      v264 = v146;
      __int16 v265 = 2112;
      v266 = v151;
      __int16 v267 = 2112;
      v268 = v262;
      _os_log_impl(&dword_224F93000, v141, OS_LOG_TYPE_DEFAULT, "Conference ID: %@     Account: %@    Handle: %@", buf, 0x20u);

      uint64_t v58 = v262;
    }

    v152 = sub_224FB12A0();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      v157 = objc_msgSend_account(v58, v153, v154, v155, v156);
      objc_msgSend_loginStatusMessage(v157, v158, v159, v160, v161);
      v162 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v264 = v162;
      _os_log_impl(&dword_224F93000, v152, OS_LOG_TYPE_DEFAULT, "    Account login status: %@", buf, 0xCu);

      uint64_t v58 = v262;
    }

    v163 = sub_224FB12A0();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      v168 = objc_msgSend_account(v58, v164, v165, v166, v167);
      if (objc_msgSend_isActive(v168, v169, v170, v171, v172)) {
        v173 = @"YES";
      }
      else {
        v173 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v264 = v173;
      _os_log_impl(&dword_224F93000, v163, OS_LOG_TYPE_DEFAULT, "          Account active: %@", buf, 0xCu);
    }
    v174 = sub_224FB12A0();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
    {
      v179 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v175, v176, v177, v178);
      if (objc_msgSend_isConnected(v179, v180, v181, v182, v183)) {
        v184 = @"YES";
      }
      else {
        v184 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v264 = v184;
      _os_log_impl(&dword_224F93000, v174, OS_LOG_TYPE_DEFAULT, "        Daemon Connected: %@", buf, 0xCu);
    }
    v185 = sub_224FB12A0();
    if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v264 = Mutable;
      _os_log_impl(&dword_224F93000, v185, OS_LOG_TYPE_DEFAULT, "              Properties: %@", buf, 0xCu);
    }

    v186 = sub_224FB12A0();
    if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v264 = v39;
      _os_log_impl(&dword_224F93000, v186, OS_LOG_TYPE_DEFAULT, "           Invitees Info: %@", buf, 0xCu);
    }
    id v260 = v12;

    v191 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v187, v188, v189, v190);
    char isConnected = objc_msgSend_isConnected(v191, v192, v193, v194, v195);

    if ((isConnected & 1) == 0)
    {
      v201 = sub_224FB12A0();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224F93000, v201, OS_LOG_TYPE_DEFAULT, "[WARN] Daemon was disconnected, we're connecting here....", buf, 2u);
      }

      v206 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v202, v203, v204, v205);
      objc_msgSend_connectToDaemon(v206, v207, v208, v209, v210);
    }
    v211 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v197, v198, v199, v200, v123);
    uint64_t v58 = v262;
    v216 = objc_msgSend_ID(v262, v212, v213, v214, v215);
    v221 = objc_msgSend_conferenceID(v17, v217, v218, v219, v220);
    v226 = objc_msgSend_account(v262, v222, v223, v224, v225);
    v231 = objc_msgSend_uniqueID(v226, v227, v228, v229, v230);
    objc_msgSend_requestVCWithPerson_properties_conference_account_(v211, v232, (uint64_t)v216, (uint64_t)Mutable, (uint64_t)v221, v231);

    v237 = objc_msgSend__timings(v17, v233, v234, v235, v236);
    objc_msgSend_startTimingForKey_(v237, v238, @"invitation-delivery-time", v239, v240);

    v245 = objc_msgSend__timings(v17, v241, v242, v243, v244);
    objc_msgSend_startTimingForKey_(v245, v246, @"time-to-response", v247, v248);
    id v12 = v260;
    id v11 = v261;
    v123 = v259;
  }
  else
  {
    v245 = sub_224FB12A0();
    if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v257 = objc_msgSend_state(v17, v253, v254, v255, v256);
      _NSStringDescriptionForIMAVChatState(v257);
      v258 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v264 = v258;
      _os_log_impl(&dword_224F93000, v245, OS_LOG_TYPE_DEFAULT, "Chat state is %@, not sending invite to daemon", buf, 0xCu);
    }
  }

LABEL_58:
}

void sub_224FAED38(uint64_t a1, int a2, int a3, uint64_t a4, void *a5)
{
}

void sub_224FAF2CC(uint64_t a1, int a2, int a3, uint64_t a4, void *a5)
{
}

void sub_224FAF2F0(int a1, int a2, int a3, int a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v308 = *MEMORY[0x263EF8340];
  id v13 = a7;
  id v14 = a6;
  id v18 = objc_msgSend__avChatWithGUID_(IMAVChat, v15, a5, v16, v17);
  objc_msgSend_participantWithID_(v18, v19, (uint64_t)v14, v20, v21);
  id v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v23 = sub_224FB12A0();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v303) = a1;
    _os_log_impl(&dword_224F93000, v23, OS_LOG_TYPE_DEFAULT, "Send response processing complete for: %d", buf, 8u);
  }

  char v24 = sub_224FB12A0();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    char v25 = @"NO";
    if (a2) {
      char v25 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v303 = v25;
    _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "  Needs Network: %@", buf, 0xCu);
  }

  uint64_t v26 = sub_224FB12A0();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = @"NO";
    if (a3) {
      uint64_t v27 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v303 = v27;
    _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "     Found WiFi: %@", buf, 0xCu);
  }

  uint64_t v28 = sub_224FB12A0();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = @"NO";
    if (a4) {
      uint64_t v29 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v303 = v29;
    _os_log_impl(&dword_224F93000, v28, OS_LOG_TYPE_DEFAULT, "  Found Network: %@", buf, 0xCu);
  }

  if (v13
    || (objc_msgSend__callInfosWaitingForAcceptAction(v22, v30, v31, v32, v33),
        uint64_t v34 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend___imFirstObject(v34, v35, v36, v37, v38),
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v34,
        v13))
  {
    if (a2) {
      goto LABEL_18;
    }
LABEL_33:
    uint64_t v44 = (__CFString *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    goto LABEL_34;
  }
  uint64_t v53 = sub_224FB12A0();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v58 = objc_msgSend__participantsCallInfo(v22, v54, v55, v56, v57);
    *(_DWORD *)buf = 138412546;
    v303 = v22;
    __int16 v304 = 2112;
    v305 = v58;
    _os_log_impl(&dword_224F93000, v53, OS_LOG_TYPE_DEFAULT, "[WARN] No Call info found for participant: %@  (All: %@)", buf, 0x16u);
  }
  id v13 = 0;
  if (!a2) {
    goto LABEL_33;
  }
LABEL_18:
  sub_224FAA6D8(@"Done");
  if ((a4 & 1) == 0)
  {
    uint64_t v52 = sub_224FB12A0();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v52, OS_LOG_TYPE_DEFAULT, "  => Failing, no valid network", buf, 2u);
    }

    uint64_t v50 = sub_224FB12A0();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    uint64_t v51 = "[WARN] Failed invite! network is not good";
    goto LABEL_28;
  }
  uint64_t v39 = sub_224FB0970(v18, v22, v13);
  uint64_t v44 = (__CFString *)objc_msgSend_mutableCopy(v39, v40, v41, v42, v43);

  if (v44)
  {
LABEL_34:
    if (!objc_msgSend_isActive(v18, v45, v46, v47, v48))
    {
      v262 = sub_224FB12A0();
      if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v267 = objc_msgSend_state(v18, v263, v264, v265, v266);
        _NSStringDescriptionForIMAVChatState(v267);
        v268 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v303 = v268;
        _os_log_impl(&dword_224F93000, v262, OS_LOG_TYPE_DEFAULT, "Chat state is %@, not sending response to daemon", buf, 0xCu);
      }
      goto LABEL_78;
    }
    uint64_t v63 = objc_msgSend_imHandle(v22, v59, v60, v61, v62);
    int v64 = (void *)v63;
    if (a1 == 1)
    {
      uint64_t v269 = sub_224FB12A0();
      if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_ID(v64, v270, v271, v272, v273);
        v274 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v303 = v274;
        _os_log_impl(&dword_224F93000, v269, OS_LOG_TYPE_DEFAULT, "Dealloc: Declining current chat with: %@", buf, 0xCu);
      }
      id v261 = objc_msgSend_sharedInstance(IMAVController, v275, v276, v277, v278);
      v283 = objc_msgSend_callerProperties(v18, v279, v280, v281, v282);
      v288 = objc_msgSend_account(v64, v284, v285, v286, v287);
      v293 = objc_msgSend_conferenceID(v18, v289, v290, v291, v292);
      objc_msgSend_declineVCRequestWithBuddy_response_vcProps_forAccount_conferenceID_(v261, v294, (uint64_t)v64, 1, (uint64_t)v283, v288, v293);
    }
    else
    {
      if (a1)
      {
LABEL_77:

LABEL_78:
        goto LABEL_79;
      }
      v297 = (void *)v63;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_224FB0D30;
      block[3] = &unk_264710F68;
      v295 = v22;
      v299 = v295;
      id v65 = v13;
      id v300 = v65;
      id v66 = v18;
      id v301 = v66;
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_msgSend_setState_(v65, v67, 1, v68, v69);
      uint64_t v74 = objc_msgSend_callerProperties(v66, v70, v71, v72, v73);
      Mutable = (__CFString *)objc_msgSend_mutableCopy(v74, v75, v76, v77, v78);

      uint64_t v80 = NSNumber;
      uint64_t v85 = objc_msgSend_sessionID(v66, v81, v82, v83, v84);
      unint64_t v89 = objc_msgSend_numberWithUnsignedInt_(v80, v86, v85, v87, v88);
      uint64_t v90 = *MEMORY[0x263F4A740];
      objc_msgSend_setObject_forKey_(v44, v91, (uint64_t)v89, *MEMORY[0x263F4A740], v92);

      uint64_t v97 = objc_msgSend_remoteICEData(v65, v93, v94, v95, v96);
      if (v97) {
        CFDictionarySetValue((CFMutableDictionaryRef)v44, (const void *)*MEMORY[0x263F4A6F8], v97);
      }

      v102 = objc_msgSend_remoteNATType(v65, v98, v99, v100, v101);
      if (v102) {
        CFDictionarySetValue((CFMutableDictionaryRef)v44, (const void *)*MEMORY[0x263F4A710], v102);
      }

      v107 = objc_msgSend_remoteNATIP(v65, v103, v104, v105, v106);
      if (v107) {
        CFDictionarySetValue((CFMutableDictionaryRef)v44, (const void *)*MEMORY[0x263F4A708], v107);
      }

      if (!Mutable) {
        Mutable = (__CFString *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      }
      objc_msgSend_removeObjectForKey_(Mutable, v108, *MEMORY[0x263F4A720], v109, v110);
      v111 = NSNumber;
      int isVideo = objc_msgSend_isVideo(v66, v112, v113, v114, v115);
      v120 = objc_msgSend_numberWithBool_(v111, v117, isVideo ^ 1u, v118, v119);
      objc_msgSend_setObject_forKey_(Mutable, v121, (uint64_t)v120, *MEMORY[0x263F4A6A0], v122);

      v123 = NSNumber;
      uint64_t v128 = objc_msgSend_sessionID(v66, v124, v125, v126, v127);
      v132 = objc_msgSend_numberWithUnsignedInt_(v123, v129, v128, v130, v131);
      objc_msgSend_setObject_forKey_(Mutable, v133, (uint64_t)v132, v90, v134);

      uint64_t v139 = objc_msgSend_plistData(v44, v135, v136, v137, v138);
      objc_msgSend_setObject_forKey_(Mutable, v140, (uint64_t)v139, *MEMORY[0x263F4A730], v141);

      v142 = NSNumber;
      uint64_t hasReinitiateCapability = objc_msgSend_hasReinitiateCapability(v295, v143, v144, v145, v146);
      v151 = objc_msgSend_numberWithInt_(v142, v148, hasReinitiateCapability, v149, v150);
      objc_msgSend_setObject_forKey_(Mutable, v152, (uint64_t)v151, *MEMORY[0x263F4A6C0], v153);

      v158 = objc_msgSend__extraServerContext(v66, v154, v155, v156, v157);
      if (objc_msgSend_count(v158, v159, v160, v161, v162)) {
        objc_msgSend_addEntriesFromDictionary_(Mutable, v163, (uint64_t)v158, v164, v165);
      }
      v296 = v158;
      uint64_t v166 = objc_msgSend_numberWithInt_(NSNumber, v163, 0, v164, v165);
      objc_msgSend_setObject_forKey_(Mutable, v167, (uint64_t)v166, *MEMORY[0x263F4A728], v168);

      v169 = sub_224FB12A0();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_conferenceID(v66, v170, v171, v172, v173);
        v174 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v179 = objc_msgSend_account(v297, v175, v176, v177, v178);
        *(_DWORD *)buf = 138412802;
        v303 = v174;
        __int16 v304 = 2112;
        v305 = v179;
        __int16 v306 = 2112;
        v307 = v297;
        _os_log_impl(&dword_224F93000, v169, OS_LOG_TYPE_DEFAULT, "Conference ID: %@     Account: %@    Handle: %@", buf, 0x20u);
      }
      v180 = sub_224FB12A0();
      if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
      {
        v185 = objc_msgSend_account(v297, v181, v182, v183, v184);
        objc_msgSend_loginStatusMessage(v185, v186, v187, v188, v189);
        uint64_t v190 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v303 = v190;
        _os_log_impl(&dword_224F93000, v180, OS_LOG_TYPE_DEFAULT, "        Account login status: %@", buf, 0xCu);
      }
      v191 = sub_224FB12A0();
      if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
      {
        v196 = objc_msgSend_account(v297, v192, v193, v194, v195);
        if (objc_msgSend_isActive(v196, v197, v198, v199, v200)) {
          v201 = @"YES";
        }
        else {
          v201 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v303 = v201;
        _os_log_impl(&dword_224F93000, v191, OS_LOG_TYPE_DEFAULT, "        Account active: %@", buf, 0xCu);
      }
      v202 = sub_224FB12A0();
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
      {
        v207 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v203, v204, v205, v206);
        if (objc_msgSend_isConnected(v207, v208, v209, v210, v211)) {
          v212 = @"YES";
        }
        else {
          v212 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v303 = v212;
        _os_log_impl(&dword_224F93000, v202, OS_LOG_TYPE_DEFAULT, "        Daemon Connected: %@", buf, 0xCu);
      }
      uint64_t v213 = sub_224FB12A0();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v303 = Mutable;
        _os_log_impl(&dword_224F93000, v213, OS_LOG_TYPE_DEFAULT, "                Response: %@", buf, 0xCu);
      }

      uint64_t v214 = sub_224FB12A0();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v303 = v44;
        _os_log_impl(&dword_224F93000, v214, OS_LOG_TYPE_DEFAULT, "                Invitees: %@", buf, 0xCu);
      }

      uint64_t v219 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v215, v216, v217, v218);
      char isConnected = objc_msgSend_isConnected(v219, v220, v221, v222, v223);

      if ((isConnected & 1) == 0)
      {
        uint64_t v229 = sub_224FB12A0();
        if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224F93000, v229, OS_LOG_TYPE_DEFAULT, "[WARN] Daemon was disconnected, we're connecting here....", buf, 2u);
        }

        uint64_t v234 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v230, v231, v232, v233);
        objc_msgSend_connectToDaemon(v234, v235, v236, v237, v238);
      }
      uint64_t v239 = objc_msgSend_sharedInstance(MEMORY[0x263F4A568], v225, v226, v227, v228);
      uint64_t v244 = objc_msgSend_ID(v297, v240, v241, v242, v243);
      v249 = objc_msgSend_conferenceID(v66, v245, v246, v247, v248);
      uint64_t v254 = objc_msgSend_account(v297, v250, v251, v252, v253);
      v259 = objc_msgSend_uniqueID(v254, v255, v256, v257, v258);
      objc_msgSend_respondToVCInvitationWithPerson_properties_conference_account_(v239, v260, (uint64_t)v244, (uint64_t)Mutable, (uint64_t)v249, v259);

      int v64 = v297;
      id v261 = v299;
    }

    goto LABEL_77;
  }
  uint64_t v49 = sub_224FB12A0();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v49, OS_LOG_TYPE_DEFAULT, "  => Failing, missing invitees info (Missing ICE Data)", buf, 2u);
  }

  uint64_t v50 = sub_224FB12A0();
  if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_29;
  }
  *(_WORD *)buf = 0;
  uint64_t v51 = "[WARN] Failed invite! Invitees info returned nil (Missing ICE Data)";
LABEL_28:
  _os_log_impl(&dword_224F93000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 2u);
LABEL_29:

  sub_224FB08DC(v18);
LABEL_79:
}

void sub_224FB0268(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  int v6 = objc_msgSend__avChatWithGUID_(IMAVChat, a2, *(void *)(a1 + 32), a4, a5);
  sub_224FAA6D8(@"Network");
  id v11 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v7, v8, v9, v10);
  if (objc_msgSend_allowAnyNetwork(v11, v12, v13, v14, v15))
  {
    uint64_t v16 = sub_224FB12A0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_224F93000, v16, OS_LOG_TYPE_DEFAULT, "We're allowed to use any network, bypassing check", (uint8_t *)&buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    sub_224FA9330(1);
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = 5;
    }
    BOOL v22 = *(unsigned char *)(a1 + 57) == 0;
    id v23 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v17, v18, v19, v20);
    int v28 = objc_msgSend_nonWifiFaceTimeAvailable(v23, v24, v25, v26, v27);

    if ((v28 & v22) != 0) {
      uint64_t v33 = v21;
    }
    else {
      uint64_t v33 = v21 | 2;
    }
    if (v28) {
      double v34 = 7.0;
    }
    else {
      double v34 = 30.0;
    }
    if (v28) {
      uint64_t v35 = 3;
    }
    else {
      uint64_t v35 = 1;
    }
    uint64_t v36 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v29, v30, v31, v32);
    int isScreenLit = objc_msgSend_isScreenLit(v36, v37, v38, v39, v40);

    if (isScreenLit)
    {
      id v42 = objc_alloc_init(MEMORY[0x263EFF910]);
      uint64_t v47 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v43, v44, v45, v46);
      uint64_t v52 = objc_msgSend_dateScreenLightLastChanged(v47, v48, v49, v50, v51);

      objc_msgSend_timeIntervalSinceDate_(v42, v53, (uint64_t)v52, v54, v55);
      double v57 = v56;
      uint64_t v58 = sub_224FB12A0();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = v57;
        _os_log_impl(&dword_224F93000, v58, OS_LOG_TYPE_DEFAULT, "Time since lights on: %f", (uint8_t *)&buf, 0xCu);
      }

      double v59 = 0.0;
      if (v57 < v34) {
        double v59 = v34 - v57;
      }
      if (v57 > 0.0) {
        double v34 = v59;
      }
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v90 = 0x2020000000;
    uint64_t v91 = 0;
    IMTimeOfDay();
    uint64_t v61 = v60;
    id v66 = objc_msgSend__timings(v6, v62, v63, v64, v65);
    objc_msgSend_startTimingForKey_(v66, v67, @"network-check", v68, v69);

    uint64_t v70 = sub_224FB12A0();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v85 = 134218240;
      uint64_t v86 = 0x404E000000000000;
      __int16 v87 = 2048;
      double v88 = v34;
      _os_log_impl(&dword_224F93000, v70, OS_LOG_TYPE_DEFAULT, "Starting availability check with network timeout: %fs   wifi timeout: %fs", v85, 0x16u);
    }

    id v71 = objc_alloc(MEMORY[0x263F4A5C8]);
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = sub_224FB0668;
    v79[3] = &unk_264710EF0;
    id v72 = *(id *)(a1 + 32);
    uint64_t v84 = v61;
    id v80 = v72;
    p_long long buf = &buf;
    id v82 = *(id *)(a1 + 48);
    id v81 = *(id *)(a1 + 40);
    uint64_t v74 = objc_msgSend_initWithFlags_options_timeout_wifiTimeout_completionBlock_(v71, v73, v35, v33, (uint64_t)v79, 60.0, v34);
    objc_msgSend_start(v74, v75, v76, v77, v78);

    _Block_object_dispose(&buf, 8);
  }
}

void sub_224FB0640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224FB0668(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend__avChatWithGUID_(IMAVChat, a2, *(void *)(a1 + 32), a4, a5);
  if (objc_msgSend_isActive(v7, v8, v9, v10, v11))
  {
    uint64_t v16 = objc_msgSend__timings(v7, v12, v13, v14, v15);
    objc_msgSend_stopTimingForKey_(v16, v17, @"network-check", v18, v19);

    uint64_t v20 = sub_224FB12A0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      IMTimeOfDay();
      double v22 = v21 - *(double *)(a1 + 64);
      int v35 = 134217984;
      double v36 = v22;
      _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "      * Network check complete  (Took %f seconds)", (uint8_t *)&v35, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
    uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    char v24 = sub_224FB12A0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      if (v23) {
        uint64_t v25 = @"YES";
      }
      else {
        uint64_t v25 = @"NO";
      }
      int v35 = 138412290;
      double v36 = *(double *)&v25;
      _os_log_impl(&dword_224F93000, v24, OS_LOG_TYPE_DEFAULT, "     Found Usable Network: %@", (uint8_t *)&v35, 0xCu);
    }

    uint64_t v26 = sub_224FB12A0();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (v23) {
        uint64_t v27 = @"YES";
      }
      else {
        uint64_t v27 = @"NO";
      }
      int v35 = 138412290;
      double v36 = *(double *)&v27;
      _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "        Found Active WiFi: %@", (uint8_t *)&v35, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v28 = sub_224FB12A0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v33 = objc_msgSend_state(v7, v29, v30, v31, v32);
      double v34 = _NSStringDescriptionForIMAVChatState(v33);
      int v35 = 138412290;
      double v36 = *(double *)&v34;
      _os_log_impl(&dword_224F93000, v28, OS_LOG_TYPE_DEFAULT, "Chat state is %@, not finishing operation", (uint8_t *)&v35, 0xCu);
    }
  }
}

void sub_224FB08DC(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FB0CC0;
  block[3] = &unk_264710F40;
  id v4 = v1;
  id v2 = v1;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

id sub_224FB0970(void *a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v62 = 138412290;
    id v63 = v6;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Getting network data for: %@", (uint8_t *)&v62, 0xCu);
  }

  if (v7)
  {
    uint64_t v13 = objc_msgSend__timings(v5, v9, v10, v11, v12);
    objc_msgSend_startTimingForKey_(v13, v14, @"ice-data-query", v15, v16);

    int v20 = objc_msgSend__generateCallInfo_(v6, v17, (uint64_t)v7, v18, v19);
    double v21 = sub_224FB12A0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = @"NO";
      if (v20) {
        double v22 = @"YES";
      }
      int v62 = 138412546;
      id v63 = v7;
      __int16 v64 = 2112;
      uint64_t v65 = v22;
      _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "   Got call info: %@  (Success: %@)", (uint8_t *)&v62, 0x16u);
    }

    uint64_t v27 = objc_msgSend_localICEData(v7, v23, v24, v25, v26);
    uint64_t v32 = objc_msgSend_localNATIP(v7, v28, v29, v30, v31);
    uint64_t v37 = objc_msgSend_localNATType(v7, v33, v34, v35, v36);
    id v42 = objc_msgSend_localSKEData(v7, v38, v39, v40, v41);
    uint64_t v47 = objc_msgSend__timings(v5, v43, v44, v45, v46);
    objc_msgSend_stopTimingForKey_(v47, v48, @"ice-data-query", v49, v50);

    id v51 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (objc_msgSend_length(v27, v52, v53, v54, v55))
    {
      objc_msgSend_setObject_forKey_(v51, v56, (uint64_t)v27, *MEMORY[0x263F4A6C8], v57);
      if (v32) {
        objc_msgSend_setObject_forKey_(v51, v58, (uint64_t)v32, *MEMORY[0x263F4A6E0], v59);
      }
      if (v37) {
        objc_msgSend_setObject_forKey_(v51, v58, (uint64_t)v37, *MEMORY[0x263F4A6E8], v59);
      }
      if (v42) {
        objc_msgSend_setObject_forKey_(v51, v58, (uint64_t)v42, *MEMORY[0x263F4A738], v59);
      }
    }
    else
    {
      uint64_t v60 = sub_224FB12A0();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = 138412290;
        id v63 = v6;
        _os_log_impl(&dword_224F93000, v60, OS_LOG_TYPE_DEFAULT, "[WARN] Could not gather ICE Data for participant: %@", (uint8_t *)&v62, 0xCu);
      }

      id v51 = 0;
    }
  }
  else
  {
    uint64_t v27 = sub_224FB12A0();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v62 = 138412290;
      id v63 = v6;
      _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "[WARN]  *** No CallInfo passed into network check for: %@", (uint8_t *)&v62, 0xCu);
    }
    id v51 = 0;
  }

  return v51;
}

uint64_t sub_224FB0CC0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], a2, a3, a4, a5);
  int v11 = objc_msgSend_nonWifiFaceTimeAvailable(v6, v7, v8, v9, v10);

  uint64_t v14 = *(void **)(a1 + 32);
  if (v11) {
    uint64_t v15 = 6600;
  }
  else {
    uint64_t v15 = 6000;
  }
  return objc_msgSend__endChatWithReason_andError_(v14, v12, 12, v15, v13);
}

void sub_224FB0D30(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend__callInfoWithState_(a1[4], a2, 3, a4, a5);
  uint64_t v10 = v6;
  if (v6)
  {
    objc_msgSend_setIsBeingHandedOff_(v6, v7, 1, v8, v9);
    objc_msgSend_setIsReinitiate_(a1[5], v11, 1, v12, v13);
    uint64_t v18 = objc_msgSend_sharedInstance(IMAVInterface, v14, v15, v16, v17);
    uint64_t v19 = (uint64_t)a1[6];
    unsigned int v24 = objc_msgSend_callID(v10, v20, v21, v22, v23);
    objc_msgSend_endAVConferenceWithChat_callID_(v18, v25, v19, v24, v26);

    uint64_t v27 = sub_224FB12A0();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v56 = 138412290;
      uint64_t v57 = v10;
      _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "Officially stopping the call we're handing off from %@", (uint8_t *)&v56, 0xCu);
    }

    int v28 = a1[6];
    unsigned int v33 = objc_msgSend_vcPartyID(a1[4], v29, v30, v31, v32);
    objc_msgSend_conferencePersonWithID_mediaDidStall_(v28, v34, (uint64_t)v33, 1, v35);

    objc_msgSend__setIsAudioInterrupted_(a1[6], v36, 1, v37, v38);
    objc_msgSend__setIsVideoInterrupted_(a1[6], v39, 1, v40, v41);
  }
  else
  {
    uint64_t v46 = sub_224FB12A0();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = a1[4];
      uint64_t v52 = objc_msgSend__participantsCallInfo(v51, v47, v48, v49, v50);
      int v56 = 138412546;
      uint64_t v57 = v51;
      __int16 v58 = 2112;
      uint64_t v59 = v52;
      _os_log_impl(&dword_224F93000, v46, OS_LOG_TYPE_DEFAULT, "No connected call info found for participant: %@  (All: %@)", (uint8_t *)&v56, 0x16u);
    }
  }
  uint64_t v53 = objc_msgSend_sharedInstance(IMAVInterface, v42, v43, v44, v45);
  objc_msgSend_avChat_prepareConnectionWithCallInfo_(v53, v54, (uint64_t)a1[6], (uint64_t)a1[5], v55);
}

id sub_224FB12A0()
{
  if (qword_26AB794F8 != -1) {
    dispatch_once(&qword_26AB794F8, &unk_26D85A630);
  }
  id v0 = (void *)qword_26AB794F0;
  return v0;
}

uint64_t sub_224FB12F4()
{
  os_log_t v0 = os_log_create("com.apple.imavcore", "Default");
  uint64_t v1 = qword_26AB794F0;
  qword_26AB794F0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_224FB1C34(uint64_t a1, const char *a2)
{
  objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], a2, *(void *)(a1 + 32), (uint64_t)sel__connectionTimeout_, 0, 0, *(double *)(*(void *)(a1 + 32) + 272));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setConnectionTimeoutTimer_(*(void **)(a1 + 32), v3, (uint64_t)v6, v4, v5);
}

void sub_224FB1FCC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = objc_msgSend_date(MEMORY[0x263EFF910], a2, a3, a4, a5);
  objc_msgSend__setInviteTimeoutTimerStart_(*(void **)(a1 + 32), v7, (uint64_t)v6, v8, v9);

  objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], v10, *(void *)(a1 + 32), (uint64_t)sel__invitationTimeout_, 0, 0, *(double *)(*(void *)(a1 + 32) + 280));
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setInviteTimeoutTimer_(*(void **)(a1 + 32), v11, (uint64_t)v14, v12, v13);
}

void sub_224FB23FC(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = 0x4008000000000000;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "Setting first frame timeout timer for %f seconds", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x263EFFA20], v3, *(void *)(a1 + 32), (uint64_t)sel__firstFrameTimeout_, 0, 0, 3.0);
  objc_msgSend__setFirstFrameTimeoutTimer_(*(void **)(a1 + 32), v5, (uint64_t)v4, v6, v7);
}

void sub_224FB45F0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), a2, 2, a4, a5);
  if (v9
    || (objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 3, v7, v8),
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = sub_224FB12A0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_224F93000, v13, OS_LOG_TYPE_DEFAULT, "Connection started, passing relay initiate along", buf, 2u);
    }

    uint64_t v18 = objc_msgSend_sharedInstance(IMAVInterface, v14, v15, v16, v17);
    objc_msgSend_handleRelayInitate_fromParticipant_callInfo_(v18, v19, *(void *)(a1 + 40), *(void *)(a1 + 32), (uint64_t)v9);

    int v28 = objc_msgSend_state(*(void **)(a1 + 48), v20, v21, v22, v23);
    uint64_t v29 = *(void **)(a1 + 48);
    if (v28 == 3)
    {
      objc_msgSend__clearInvitationTimeoutTimer(v29, v24, v25, v26, v27);
      objc_msgSend__setConnectionTimeoutTimer(*(void **)(a1 + 48), v30, v31, v32, v33);
    }
    else if (objc_msgSend_state(v29, v24, v25, v26, v27) == 4)
    {
      objc_msgSend__clearConnectionTimeoutTimer(*(void **)(a1 + 48), v34, v35, v36, v37);
      objc_msgSend__clearInvitationTimeoutTimer(*(void **)(a1 + 48), v38, v39, v40, v41);
    }
  }
  else
  {
    id v42 = objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v10, 1, v11, v12);
    if (v42)
    {
      uint64_t v9 = v42;
      objc_msgSend_setRelayInitiate_(v42, v43, *(void *)(a1 + 40), v44, v45);
    }
    else
    {
      uint64_t v46 = sub_224FB12A0();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v47 = 0;
        _os_log_impl(&dword_224F93000, v46, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping relay initiate, no call info found", v47, 2u);
      }

      uint64_t v9 = 0;
    }
  }
}

void sub_224FB4964(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), a2, 2, a4, a5);
  if (v10
    || (objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 3, v8, v9),
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v11 = objc_msgSend_state(*(void **)(a1 + 40), v6, v7, v8, v9);
    uint64_t v12 = sub_224FB12A0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 >= 3)
    {
      if (v13)
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "Connection started, passing relay update along", (uint8_t *)&v27, 2u);
      }

      uint64_t v18 = objc_msgSend_sharedInstance(IMAVInterface, v14, v15, v16, v17);
      objc_msgSend_handleRelayUpdate_fromParticipant_callInfo_(v18, v19, *(void *)(a1 + 48), *(void *)(a1 + 32), (uint64_t)v10);

      goto LABEL_11;
    }
    if (!v13)
    {
LABEL_10:

      objc_msgSend_setRelayUpdate_(v10, v23, *(void *)(a1 + 48), v24, v25);
      goto LABEL_11;
    }
    int v27 = 138412290;
    int v28 = v10;
    int v20 = "Connection has not yet started, but participant call info has: %@";
    uint64_t v21 = v12;
    uint32_t v22 = 12;
LABEL_9:
    _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, v22);
    goto LABEL_10;
  }
  uint64_t v10 = objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 1, v8, v9);
  uint64_t v12 = sub_224FB12A0();
  BOOL v26 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v26) {
      goto LABEL_10;
    }
    LOWORD(v27) = 0;
    int v20 = "Connection has not yet started, holding onto relay update";
    uint64_t v21 = v12;
    uint32_t v22 = 2;
    goto LABEL_9;
  }
  if (v26)
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping relay update, no call info found", (uint8_t *)&v27, 2u);
  }
  uint64_t v10 = v12;
LABEL_11:
}

void sub_224FB4CE4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), a2, 2, a4, a5);
  if (v10
    || (objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 3, v8, v9),
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (objc_msgSend_state(*(void **)(a1 + 40), v6, v7, v8, v9) < 3)
    {
      objc_msgSend_setRelayCancel_(v10, v11, *(void *)(a1 + 48), v12, v13);
      uint64_t v21 = sub_224FB12A0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v27 = 0;
        _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "Connection has not yet started, holding onto relay cancel", v27, 2u);
      }
    }
    else
    {
      id v14 = sub_224FB12A0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_224F93000, v14, OS_LOG_TYPE_DEFAULT, "Connection started, passing relay cancel along", buf, 2u);
      }

      uint64_t v19 = objc_msgSend_sharedInstance(IMAVInterface, v15, v16, v17, v18);
      objc_msgSend_handleRelayCancel_fromParticipant_callInfo_(v19, v20, *(void *)(a1 + 48), *(void *)(a1 + 32), (uint64_t)v10);
    }
  }
  else
  {
    uint32_t v22 = objc_msgSend__callInfoWithState_(*(void **)(a1 + 32), v6, 1, v8, v9);
    if (v22)
    {
      uint64_t v10 = v22;
      objc_msgSend_setRelayCancel_(v22, v23, *(void *)(a1 + 48), v24, v25);
    }
    else
    {
      uint64_t v10 = sub_224FB12A0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v26 = 0;
        _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping relay cancel, no call info found", v26, 2u);
      }
    }
  }
}

uint64_t sub_224FB8978()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08AE0]);
  uint64_t v1 = qword_26AB79658;
  qword_26AB79658 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_224FBB12C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_applicationProxyForIdentifier_(MEMORY[0x263F01868], a2, @"com.apple.facetime", a4, a5);
  uint64_t v10 = objc_msgSend_machOUUIDs(v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_firstObject(v10, v11, v12, v13, v14);
  uint64_t v16 = (void *)qword_2680BEFE0;
  qword_2680BEFE0 = v15;

  if (!qword_2680BEFE0)
  {
    uint64_t v17 = sub_224FB12A0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      uint64_t v19 = @"com.apple.facetime";
      _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not determine UUID for %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

uint64_t sub_224FBB888(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "Could not create AVConference for avChat %@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend__endChatWithReason_andError_(*(void **)(a1 + 32), v4, 15, 6100, v5);
}

void sub_224FBE4C8(void **a1)
{
  uint64_t v186 = *MEMORY[0x263EF8340];
  CFPreferencesAppSynchronize(@"com.apple.conference");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"disablePeerCerts", @"com.apple.conference", 0);
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"disableKeyExchange", @"com.apple.conference", 0) == 0;
  id v4 = objc_alloc_init((Class)qword_26AB79648);
  objc_msgSend_setIsKeyExchangeEnabled_(v4, v5, v3, v6, v7);
  objc_msgSend_setIsAudioEnabled_(v4, v8, 1, v9, v10);
  uint64_t isVideo = objc_msgSend_isVideo(a1[4], v11, v12, v13, v14);
  objc_msgSend_setIsVideoEnabled_(v4, v16, isVideo, v17, v18);
  BOOL v19 = CFPreferencesGetAppBooleanValue(@"forceRelay", @"com.apple.conference", 0) != 0;
  objc_msgSend_setIsRelayForced_(v4, v20, v19, v21, v22);
  BOOL v23 = CFPreferencesGetAppBooleanValue(@"disableRelay", @"com.apple.conference", 0) == 0;
  objc_msgSend_setIsRelayEnabled_(v4, v24, v23, v25, v26);
  uint64_t v30 = objc_msgSend__deviceRoleForAVChat_(a1[5], v27, (uint64_t)a1[4], v28, v29);
  objc_msgSend_setDeviceRole_(v4, v31, v30, v32, v33);
  if (IMGetAppBoolForKey()) {
    objc_msgSend_setIsAudioPausedToStart_(v4, v34, 1, v35, v36);
  }
  if (IMGetAppBoolForKey()) {
    objc_msgSend_setIsVideoPausedToStart_(v4, v37, 1, v39, v40);
  }
  if ((objc_msgSend_isVideo(a1[4], v37, v38, v39, v40) & 1) == 0)
  {
    objc_msgSend_setIsVideoPausedToStart_(v4, v41, 1, v43, v44);
    objc_msgSend_setIsVideoEnabled_(v4, v45, 0, v46, v47);
  }
  unsigned int v48 = objc_msgSend_callID(a1[6], v41, v42, v43, v44);
  uint64_t v49 = sub_224FB12A0();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = a1[4];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v183 = (uint64_t)v50;
    __int16 v184 = 1024;
    LODWORD(v185) = v48;
    _os_log_impl(&dword_224F93000, v49, OS_LOG_TYPE_DEFAULT, "chat: %@  callID: %d", buf, 0x12u);
  }
  uint64_t v51 = v48;

  int v56 = objc_msgSend_peerCN(a1[6], v52, v53, v54, v55);
  if (objc_msgSend_isReinitiate(a1[6], v57, v58, v59, v60))
  {
    uint64_t v65 = a1[7];
    uint64_t v66 = objc_msgSend_localParticipant(a1[4], v61, v62, v63, v64);
    uint64_t isVideoPaused = objc_msgSend_isVideoPaused(v66, v67, v68, v69, v70);
    unsigned int v76 = objc_msgSend_callID(a1[6], v72, v73, v74, v75);
    objc_msgSend_setPauseVideo_callID_error_(v65, v77, isVideoPaused, v76, 0);
  }
  if (!AppBooleanValue)
  {
    uint64_t v78 = sub_224FB12A0();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v183 = (uint64_t)v56;
      _os_log_impl(&dword_224F93000, v78, OS_LOG_TYPE_DEFAULT, "Setting peer CN to: %@", buf, 0xCu);
    }

    uint64_t v83 = objc_msgSend__timings(a1[4], v79, v80, v81, v82);
    objc_msgSend_startTimingForKey_(v83, v84, @"setting-peer-cn-time", v85, v86);

    objc_msgSend_setPeerCN_callID_(a1[7], v87, (uint64_t)v56, v51, v88);
    uint64_t v93 = objc_msgSend__timings(a1[4], v89, v90, v91, v92);
    objc_msgSend_stopTimingForKey_(v93, v94, @"setting-peer-cn-time", v95, v96);
  }
  uint64_t v97 = objc_msgSend_peerProtocolVersion(a1[6], v61, v62, v63, v64);
  unint64_t v102 = objc_msgSend_integerValue(v97, v98, v99, v100, v101);

  BOOL v103 = v102 > 1;
  objc_msgSend_setPeerProtocolVersion_forCallID_(a1[7], v104, v103, v51, v105);
  uint64_t v106 = sub_224FB12A0();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v183) = v103;
    _os_log_impl(&dword_224F93000, v106, OS_LOG_TYPE_DEFAULT, "Setting peer protocol version %d", buf, 8u);
  }

  v107 = sub_224FBEB5C(a1[6]);
  uint64_t v108 = sub_224FB12A0();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v183 = v51;
    __int16 v184 = 2112;
    id v185 = v4;
    _os_log_impl(&dword_224F93000, v108, OS_LOG_TYPE_DEFAULT, "Calling startConnectionWithCallID with callID %ld capabilities %@", buf, 0x16u);
  }

  v117 = objc_msgSend_relayInitiate(a1[6], v109, v110, v111, v112);
  if (v117)
  {
    uint64_t v118 = objc_msgSend_relayInitiate(a1[6], v113, v114, v115, v116);
    uint64_t v119 = sub_224FBECC0(v118);
  }
  else
  {
    uint64_t v119 = 0;
  }

  v120 = sub_224FB12A0();
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v125 = objc_msgSend_localParticipant(a1[4], v121, v122, v123, v124);
    uint64_t v130 = objc_msgSend_vcPartyID(v125, v126, v127, v128, v129);
    v135 = objc_msgSend_vcPartyID(a1[8], v131, v132, v133, v134);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v183 = (uint64_t)v130;
    __int16 v184 = 2112;
    id v185 = v135;
    _os_log_impl(&dword_224F93000, v120, OS_LOG_TYPE_DEFAULT, "Calling startConnection for: %@ <=> %@", buf, 0x16u);
  }
  v140 = objc_msgSend__timings(a1[4], v136, v137, v138, v139);
  objc_msgSend_startTimingForKey_(v140, v141, @"start-connection-time", v142, v143);

  uint64_t v144 = a1[7];
  uint64_t isCaller = objc_msgSend_isCaller(a1[4], v145, v146, v147, v148);
  id v181 = 0;
  char v151 = objc_msgSend_startConnectionWithCallID_usingInviteData_isCaller_relayResponseDict_didOriginateRelayRequest_capabilities_error_(v144, v150, v51, (uint64_t)v107, isCaller, v119, 0, v4, &v181);
  id v152 = v181;
  uint64_t v157 = objc_msgSend__timings(a1[4], v153, v154, v155, v156);
  objc_msgSend_stopTimingForKey_(v157, v158, @"start-connection-time", v159, v160);

  objc_msgSend_setRelayInitiate_(a1[6], v161, 0, v162, v163);
  objc_msgSend_setState_(a1[6], v164, 2, v165, v166);
  objc_msgSend__setConnectionStarted_(a1[4], v167, 1, v168, v169);
  if ((v151 & 1) == 0)
  {
    uint64_t v170 = sub_224FB12A0();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v183 = (uint64_t)v152;
      _os_log_impl(&dword_224F93000, v170, OS_LOG_TYPE_DEFAULT, "[WARN]         startConnectionWithParticipantID error: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FBF408;
  block[3] = &unk_264710F90;
  char v180 = v151;
  id v171 = a1[6];
  uint64_t v172 = a1[5];
  id v175 = v171;
  uint64_t v176 = v172;
  id v177 = a1[8];
  id v178 = a1[4];
  id v179 = v152;
  id v173 = v152;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

id sub_224FBEB5C(void *a1)
{
  id v5 = a1;
  if (!qword_2680BEFD0)
  {
    uint64_t v6 = (void **)MEMORY[0x22A628620]("AVConferenceInviteDataConnectionBlob", @"AVConference");
    if (v6) {
      uint64_t v7 = *v6;
    }
    else {
      uint64_t v7 = 0;
    }
    objc_storeStrong((id *)&qword_2680BEFD0, v7);
  }
  if (!qword_2680BEFD8)
  {
    uint64_t v8 = (void **)MEMORY[0x22A628620]("AVConferenceInviteDataSKEBlob", @"AVConference");
    if (v8) {
      uint64_t v9 = *v8;
    }
    else {
      uint64_t v9 = 0;
    }
    objc_storeStrong((id *)&qword_2680BEFD8, v9);
  }
  uint64_t v10 = objc_msgSend_remoteSKEData(v5, v1, v2, v3, v4);
  if (v10)
  {
  }
  else
  {
    Mutable = objc_msgSend_remoteICEData(v5, v11, v12, v13, v14);

    if (!Mutable) {
      goto LABEL_19;
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v20 = objc_msgSend_remoteSKEData(v5, v16, v17, v18, v19);
  if (v20) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, (const void *)qword_2680BEFD8, v20);
  }

  uint64_t v25 = objc_msgSend_remoteICEData(v5, v21, v22, v23, v24);
  if (v25) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, (const void *)qword_2680BEFD0, v25);
  }

LABEL_19:
  return Mutable;
}

id sub_224FBECC0(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = *MEMORY[0x263F4A2E8];
  uint64_t v7 = objc_msgSend_objectForKey_(v1, v4, *MEMORY[0x263F4A2E8], v5, v6);

  if (v7)
  {
    unsigned int v11 = objc_msgSend_objectForKey_(v1, v8, v3, v9, v10);
    objc_msgSend_setObject_forKey_(v2, v12, (uint64_t)v11, qword_26AB795A0, v13);
  }
  uint64_t v14 = *MEMORY[0x263F4A308];
  uint64_t v15 = objc_msgSend_objectForKey_(v1, v8, *MEMORY[0x263F4A308], v9, v10);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_objectForKey_(v1, v16, v14, v17, v18);
    objc_msgSend_setObject_forKey_(v2, v20, (uint64_t)v19, qword_26AB79608, v21);
  }
  uint64_t v22 = *MEMORY[0x263F4A2F8];
  uint64_t v23 = objc_msgSend_objectForKey_(v1, v16, *MEMORY[0x263F4A2F8], v17, v18);

  if (v23)
  {
    int v27 = objc_msgSend_objectForKey_(v1, v24, v22, v25, v26);
    objc_msgSend_setObject_forKey_(v2, v28, (uint64_t)v27, qword_26AB795F8, v29);
  }
  uint64_t v30 = *MEMORY[0x263F4A300];
  uint64_t v31 = objc_msgSend_objectForKey_(v1, v24, *MEMORY[0x263F4A300], v25, v26);

  if (v31)
  {
    uint64_t v35 = objc_msgSend_objectForKey_(v1, v32, v30, v33, v34);
    objc_msgSend_setObject_forKey_(v2, v36, (uint64_t)v35, qword_26AB79600, v37);
  }
  uint64_t v38 = *MEMORY[0x263F4A2B0];
  uint64_t v39 = objc_msgSend_objectForKey_(v1, v32, *MEMORY[0x263F4A2B0], v33, v34);

  if (v39)
  {
    uint64_t v43 = objc_msgSend_objectForKey_(v1, v40, v38, v41, v42);
    objc_msgSend_setObject_forKey_(v2, v44, (uint64_t)v43, qword_26AB795C0, v45);
  }
  uint64_t v46 = *MEMORY[0x263F4A2C0];
  uint64_t v47 = objc_msgSend_objectForKey_(v1, v40, *MEMORY[0x263F4A2C0], v41, v42);

  if (v47)
  {
    uint64_t v51 = objc_msgSend_objectForKey_(v1, v48, v46, v49, v50);
    objc_msgSend_setObject_forKey_(v2, v52, (uint64_t)v51, qword_26AB795C8, v53);
  }
  uint64_t v54 = *MEMORY[0x263F4A2A8];
  uint64_t v55 = objc_msgSend_objectForKey_(v1, v48, *MEMORY[0x263F4A2A8], v49, v50);

  if (v55)
  {
    uint64_t v59 = objc_msgSend_objectForKey_(v1, v56, v54, v57, v58);
    objc_msgSend_setObject_forKey_(v2, v60, (uint64_t)v59, qword_26AB795B0, v61);
  }
  uint64_t v62 = *MEMORY[0x263F4A2B8];
  uint64_t v63 = objc_msgSend_objectForKey_(v1, v56, *MEMORY[0x263F4A2B8], v57, v58);

  if (v63)
  {
    uint64_t v67 = objc_msgSend_objectForKey_(v1, v64, v62, v65, v66);
    objc_msgSend_setObject_forKey_(v2, v68, (uint64_t)v67, qword_26AB795B8, v69);
  }
  uint64_t v70 = *MEMORY[0x263F4A340];
  id v71 = objc_msgSend_objectForKey_(v1, v64, *MEMORY[0x263F4A340], v65, v66);

  if (v71)
  {
    uint64_t v75 = objc_msgSend_objectForKey_(v1, v72, v70, v73, v74);
    objc_msgSend_setObject_forKey_(v2, v76, (uint64_t)v75, qword_26AB79640, v77);
  }
  uint64_t v78 = *MEMORY[0x263F4A2A0];
  uint64_t v79 = objc_msgSend_objectForKey_(v1, v72, *MEMORY[0x263F4A2A0], v73, v74);

  if (v79)
  {
    uint64_t v83 = objc_msgSend_objectForKey_(v1, v80, v78, v81, v82);
    objc_msgSend_setObject_forKey_(v2, v84, (uint64_t)v83, qword_26AB795A8, v85);
  }
  uint64_t v86 = *MEMORY[0x263F4A338];
  __int16 v87 = objc_msgSend_objectForKey_(v1, v80, *MEMORY[0x263F4A338], v81, v82);

  if (v87)
  {
    uint64_t v91 = objc_msgSend_objectForKey_(v1, v88, v86, v89, v90);
    objc_msgSend_setObject_forKey_(v2, v92, (uint64_t)v91, qword_26AB79638, v93);
  }
  uint64_t v94 = *MEMORY[0x263F4A330];
  uint64_t v95 = objc_msgSend_objectForKey_(v1, v88, *MEMORY[0x263F4A330], v89, v90);

  if (v95)
  {
    uint64_t v99 = objc_msgSend_objectForKey_(v1, v96, v94, v97, v98);
    objc_msgSend_setObject_forKey_(v2, v100, (uint64_t)v99, qword_26AB79630, v101);
  }
  uint64_t v102 = *MEMORY[0x263F4A2C8];
  BOOL v103 = objc_msgSend_objectForKey_(v1, v96, *MEMORY[0x263F4A2C8], v97, v98);

  if (v103)
  {
    v107 = objc_msgSend_objectForKey_(v1, v104, v102, v105, v106);
    objc_msgSend_setObject_forKey_(v2, v108, (uint64_t)v107, qword_26AB795D0, v109);
  }
  uint64_t v110 = *MEMORY[0x263F4A2E0];
  uint64_t v111 = objc_msgSend_objectForKey_(v1, v104, *MEMORY[0x263F4A2E0], v105, v106);

  if (v111)
  {
    uint64_t v115 = objc_msgSend_objectForKey_(v1, v112, v110, v113, v114);
    objc_msgSend_setObject_forKey_(v2, v116, (uint64_t)v115, qword_26AB795E8, v117);
  }
  uint64_t v118 = *MEMORY[0x263F4A310];
  uint64_t v119 = objc_msgSend_objectForKey_(v1, v112, *MEMORY[0x263F4A310], v113, v114);

  if (v119)
  {
    uint64_t v123 = objc_msgSend_objectForKey_(v1, v120, v118, v121, v122);
    objc_msgSend_setObject_forKey_(v2, v124, (uint64_t)v123, qword_26AB79610, v125);
  }
  uint64_t v126 = *MEMORY[0x263F4A328];
  uint64_t v127 = objc_msgSend_objectForKey_(v1, v120, *MEMORY[0x263F4A328], v121, v122);

  if (v127)
  {
    uint64_t v131 = objc_msgSend_objectForKey_(v1, v128, v126, v129, v130);
    objc_msgSend_setObject_forKey_(v2, v132, (uint64_t)v131, qword_26AB79628, v133);
  }
  uint64_t v134 = *MEMORY[0x263F4A318];
  v135 = objc_msgSend_objectForKey_(v1, v128, *MEMORY[0x263F4A318], v129, v130);

  if (v135)
  {
    uint64_t v139 = objc_msgSend_objectForKey_(v1, v136, v134, v137, v138);
    objc_msgSend_setObject_forKey_(v2, v140, (uint64_t)v139, qword_26AB79618, v141);
  }
  uint64_t v142 = *MEMORY[0x263F4A320];
  uint64_t v143 = objc_msgSend_objectForKey_(v1, v136, *MEMORY[0x263F4A320], v137, v138);

  if (v143)
  {
    uint64_t v147 = objc_msgSend_objectForKey_(v1, v144, v142, v145, v146);
    objc_msgSend_setObject_forKey_(v2, v148, (uint64_t)v147, qword_26AB79620, v149);
  }
  uint64_t v150 = *MEMORY[0x263F4A2D0];
  char v151 = objc_msgSend_objectForKey_(v1, v144, *MEMORY[0x263F4A2D0], v145, v146);

  if (v151)
  {
    uint64_t v155 = objc_msgSend_objectForKey_(v1, v152, v150, v153, v154);
    objc_msgSend_setObject_forKey_(v2, v156, (uint64_t)v155, qword_26AB795D8, v157);
  }
  uint64_t v158 = *MEMORY[0x263F4A2D8];
  uint64_t v159 = objc_msgSend_objectForKey_(v1, v152, *MEMORY[0x263F4A2D8], v153, v154);

  if (v159)
  {
    uint64_t v163 = objc_msgSend_objectForKey_(v1, v160, v158, v161, v162);
    objc_msgSend_setObject_forKey_(v2, v164, (uint64_t)v163, qword_26AB795E0, v165);
  }
  if (qword_26AB795F0)
  {
    uint64_t v166 = *MEMORY[0x263F4A2F0];
    uint64_t v167 = objc_msgSend_objectForKey_(v1, v160, *MEMORY[0x263F4A2F0], v161, v162);

    if (v167)
    {
      id v171 = objc_msgSend_objectForKey_(v1, v168, v166, v169, v170);
      objc_msgSend_setObject_forKey_(v2, v172, (uint64_t)v171, qword_26AB795F0, v173);
    }
  }

  return v2;
}

void sub_224FBF408(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v10 = objc_msgSend_relayInitiate(*(void **)(a1 + 32), a2, a3, a4, a5);
    if (v10)
    {
      unsigned int v11 = sub_224FB12A0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_224F93000, v11, OS_LOG_TYPE_DEFAULT, "Also passing along a pending relay initate", buf, 2u);
      }

      objc_msgSend_handleRelayInitate_fromParticipant_callInfo_(*(void **)(a1 + 40), v12, (uint64_t)v10, *(void *)(a1 + 48), *(void *)(a1 + 32));
      objc_msgSend_setRelayInitiate_(*(void **)(a1 + 32), v13, 0, v14, v15);
    }
    uint64_t v16 = objc_msgSend_relayUpdate(*(void **)(a1 + 32), v6, v7, v8, v9);

    if (v16)
    {
      uint64_t v21 = sub_224FB12A0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "Also passing along a pending relay update", v35, 2u);
      }

      objc_msgSend_handleRelayUpdate_fromParticipant_callInfo_(*(void **)(a1 + 40), v22, (uint64_t)v16, *(void *)(a1 + 48), *(void *)(a1 + 32));
      objc_msgSend_setRelayUpdate_(*(void **)(a1 + 32), v23, 0, v24, v25);
    }
    uint64_t v26 = objc_msgSend_relayCancel(*(void **)(a1 + 32), v17, v18, v19, v20);

    if (v26)
    {
      int v27 = sub_224FB12A0();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_224F93000, v27, OS_LOG_TYPE_DEFAULT, "Also passing along a pending relay cancel", v34, 2u);
      }

      objc_msgSend_handleRelayCancel_fromParticipant_callInfo_(*(void **)(a1 + 40), v28, (uint64_t)v26, *(void *)(a1 + 48), *(void *)(a1 + 32));
      objc_msgSend_setRelayCancel_(*(void **)(a1 + 32), v29, 0, v30, v31);
    }
  }
  else
  {
    uint64_t v32 = *(void **)(a1 + 56);
    uint64_t v33 = *(void *)(a1 + 64);
    objc_msgSend__handleAVError_(v32, a2, v33, a4, a5);
  }
}

void sub_224FBF8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_224FBF910(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_224FBF920(uint64_t a1)
{
}

void sub_224FBF928(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v191 = *MEMORY[0x263EF8340];
  uint64_t v179 = 0;
  char v180 = &v179;
  uint64_t v181 = 0x3032000000;
  uint64_t v182 = sub_224FBF910;
  uint64_t v183 = sub_224FBF920;
  id v184 = 0;
  uint64_t v6 = objc_msgSend_localParticipant(*(void **)(a1 + 32), a2, a3, a4, a5);
  unsigned int v11 = objc_msgSend__timings(*(void **)(a1 + 32), v7, v8, v9, v10);
  objc_msgSend_startTimingForKey_(v11, v12, @"initialize-new-call-time", v13, v14);

  uint64_t v18 = objc_msgSend__deviceRoleForAVChat_(*(void **)(a1 + 40), v15, *(void *)(a1 + 32), v16, v17);
  uint64_t v22 = objc_msgSend_initializeNewCallWithDeviceRole_(*(void **)(a1 + 48), v19, v18, v20, v21);
  objc_msgSend_setCallID_(*(void **)(a1 + 56), v23, v22, v24, v25);
  uint64_t v30 = objc_msgSend__timings(*(void **)(a1 + 32), v26, v27, v28, v29);
  objc_msgSend_stopTimingForKey_(v30, v31, @"initialize-new-call-time", v32, v33);

  uint64_t v34 = sub_224FB12A0();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v186 = v22;
    __int16 v187 = 1024;
    LODWORD(v188) = v18;
    _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, "Created call ID %ld with device role %d", buf, 0x12u);
  }

  uint64_t v35 = sub_224FB12A0();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = *(void **)(a1 + 32);
    uint64_t v41 = *(void *)(a1 + 64);
    int v42 = objc_msgSend__bustedCallID(v40, v36, v37, v38, v39);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v186 = (uint64_t)v40;
    __int16 v187 = 2112;
    uint64_t v188 = v41;
    __int16 v189 = 1024;
    int v190 = v42;
    _os_log_impl(&dword_224F93000, v35, OS_LOG_TYPE_DEFAULT, "chat: %@  handle: %@ callID: %d", buf, 0x1Cu);
  }

  uint64_t v43 = sub_224FB12A0();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v48 = objc_msgSend_vcPartyID(v6, v44, v45, v46, v47);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v186 = (uint64_t)v48;
    _os_log_impl(&dword_224F93000, v43, OS_LOG_TYPE_DEFAULT, "Getting connection data for: %@", buf, 0xCu);
  }
  uint64_t v49 = sub_224FB12A0();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v54 = *(void **)(a1 + 32);
    uint64_t v55 = *(void *)(a1 + 64);
    int v56 = objc_msgSend__bustedCallID(v54, v50, v51, v52, v53);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v186 = (uint64_t)v54;
    __int16 v187 = 2112;
    uint64_t v188 = v55;
    __int16 v189 = 1024;
    int v190 = v56;
    _os_log_impl(&dword_224F93000, v49, OS_LOG_TYPE_DEFAULT, "chat: %@  handle: %@ callID: %d", buf, 0x1Cu);
  }

  sub_224FAA6D8(@"AVConference Configuration");
  uint64_t v61 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB18], v57, v58, v59, v60);
  int v66 = objc_msgSend_nonWifiFaceTimeAvailable(v61, v62, v63, v64, v65);

  if (v66) {
    objc_msgSend_setRequiresWifi_(*(void **)(a1 + 48), v67, 0, v68, v69);
  }
  uint64_t v70 = sub_224FB12A0();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    id v71 = @"YES";
    if (v66) {
      id v71 = @"NO";
    }
    *(_DWORD *)long long buf = 138412290;
    uint64_t v186 = (uint64_t)v71;
    _os_log_impl(&dword_224F93000, v70, OS_LOG_TYPE_DEFAULT, "setRequiresWiFi: %@ after checking network availability", buf, 0xCu);
  }

  unsigned int v76 = objc_msgSend__timings(*(void **)(a1 + 32), v72, v73, v74, v75);
  objc_msgSend_stopTimingForKey_(v76, v77, @"time-to-connection-data-gathering", v78, v79);

  uint64_t v84 = objc_msgSend__timings(*(void **)(a1 + 32), v80, v81, v82, v83);
  objc_msgSend_startTimingForKey_(v84, v85, @"connection-data-time", v86, v87);

  dispatch_semaphore_t v88 = dispatch_semaphore_create(0);
  uint64_t v93 = objc_msgSend_peerCN(*(void **)(a1 + 56), v89, v90, v91, v92);

  if (v93)
  {
    uint64_t v98 = *(void **)(a1 + 48);
    uint64_t v99 = objc_msgSend_peerCN(*(void **)(a1 + 56), v94, v95, v96, v97);
    unsigned int v104 = objc_msgSend_callID(*(void **)(a1 + 56), v100, v101, v102, v103);
    objc_msgSend_setPeerCN_callID_(v98, v105, (uint64_t)v99, v104, v106);
  }
  v107 = sub_224FB12A0();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_224F93000, v107, OS_LOG_TYPE_DEFAULT, "Calling inviteDictionaryForCallID", buf, 2u);
  }

  v173[0] = MEMORY[0x263EF8330];
  v173[1] = 3221225472;
  v173[2] = sub_224FC0118;
  v173[3] = &unk_264710FE0;
  uint64_t v108 = *(void **)(a1 + 56);
  uint64_t v109 = *(void *)(a1 + 80);
  uint64_t v176 = *(void *)(a1 + 72);
  id v177 = &v179;
  uint64_t v178 = v109;
  id v174 = v108;
  uint64_t v110 = v88;
  id v175 = v110;
  uint64_t v111 = (void *)MEMORY[0x22A628A90](v173);
  uint64_t v112 = sub_224FBEB5C(*(void **)(a1 + 56));
  uint64_t v113 = *(void **)(a1 + 48);
  uint64_t v114 = dispatch_get_global_queue(2, 0);
  objc_msgSend_inviteDictionaryForCallID_remoteInviteDictionary_nonCellularCandidateTimeout_block_queue_(v113, v115, v22, (uint64_t)v112, (uint64_t)v111, v114, 0.0);

  dispatch_time_t v116 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v110, v116))
  {
    uint64_t v121 = sub_224FB12A0();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v186 = 0x4024000000000000;
      _os_log_impl(&dword_224F93000, v121, OS_LOG_TYPE_DEFAULT, "*** Timed out gathering connection data **** (%f seconds)", buf, 0xCu);
    }
  }
  uint64_t v122 = objc_msgSend__timings(*(void **)(a1 + 32), v117, v118, v119, v120);
  objc_msgSend_stopTimingForKey_(v122, v123, @"connection-data-time", v124, v125);

  uint64_t v126 = sub_224FB12A0();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v131 = objc_msgSend__timings(*(void **)(a1 + 32), v127, v128, v129, v130);
    objc_msgSend_totalTimeForKey_(v131, v132, @"connection-data-time", v133, v134);
    *(_DWORD *)long long buf = 134217984;
    uint64_t v186 = v135;
    _os_log_impl(&dword_224F93000, v126, OS_LOG_TYPE_DEFAULT, "Connection data gathering took %f", buf, 0xCu);
  }
  if (!objc_msgSend_length(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v136, v137, v138, v139))
  {
    uint64_t v143 = sub_224FB12A0();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_224F93000, v143, OS_LOG_TYPE_DEFAULT, "*** Empty connection data ***", buf, 2u);
    }

    uint64_t v144 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v145 = *(void **)(v144 + 40);
    *(void *)(v144 + 40) = 0;
  }
  uint64_t v146 = v180[5];
  if (v146) {
    objc_msgSend__handleAVError_(*(void **)(a1 + 32), v140, v146, v141, v142);
  }
  if (objc_msgSend_state(*(void **)(a1 + 32), v140, v146, v141, v142) == 5)
  {
    objc_msgSend_endConferenceForAVChat_(*(void **)(a1 + 40), v147, *(void *)(a1 + 32), v148, v149);
    uint64_t v150 = *(void *)(*(void *)(a1 + 72) + 8);
    char v151 = *(void **)(v150 + 40);
    *(void *)(v150 + 40) = 0;
  }
  uint64_t v152 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v152)
  {
    objc_msgSend_setLocalICEData_(*(void **)(a1 + 56), v147, v152, v148, v149);
    uint64_t v153 = *(void **)(a1 + 56);
    uint64_t v157 = objc_msgSend_getNatIPFromICEData_(*(void **)(a1 + 40), v154, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v155, v156);
    objc_msgSend_setLocalNATIP_(v153, v158, (uint64_t)v157, v159, v160);

    uint64_t v161 = *(void **)(a1 + 56);
    uint64_t v165 = objc_msgSend_natTypeForAVChat_(*(void **)(a1 + 40), v162, *(void *)(a1 + 32), v163, v164);
    objc_msgSend_setLocalNATType_(v161, v166, (uint64_t)v165, v167, v168);

    uint64_t v172 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v172) {
      objc_msgSend_setLocalSKEData_(*(void **)(a1 + 56), v169, v172, v170, v171);
    }
  }

  _Block_object_dispose(&v179, 8);
}

void sub_224FC00AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224FC0118(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 138412546;
    id v41 = v5;
    __int16 v42 = 2112;
    id v43 = v6;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "   AV Response: %@   Error: %@", (uint8_t *)&v40, 0x16u);
  }

  if (!qword_2680BEFD0)
  {
    unsigned int v11 = (void **)MEMORY[0x22A628620]("AVConferenceInviteDataConnectionBlob", @"AVConference");
    if (v11) {
      uint64_t v12 = *v11;
    }
    else {
      uint64_t v12 = 0;
    }
    objc_storeStrong((id *)&qword_2680BEFD0, v12);
  }
  if (qword_2680BEFD8
    || ((uint64_t v13 = (void **)MEMORY[0x22A628620]("AVConferenceInviteDataSKEBlob", @"AVConference")) == 0
      ? (uint64_t v14 = 0)
      : (uint64_t v14 = *v13),
        objc_storeStrong((id *)&qword_2680BEFD8, v14),
        qword_2680BEFD8))
  {
    uint64_t v15 = objc_msgSend_objectForKey_(v5, v8, qword_2680BEFD0, v9, v10);
    char v16 = 0;
  }
  else
  {
    uint64_t v15 = 0;
    char v16 = 1;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v15);
  if ((v16 & 1) == 0) {

  }
  uint64_t v17 = sub_224FB12A0();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v40 = 134217984;
    id v41 = v18;
    _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, "Got connection data: %p", (uint8_t *)&v40, 0xCu);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v22 = sub_224FB12A0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v40 = 138412290;
      id v41 = v23;
      _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Connection data error: %@", (uint8_t *)&v40, 0xCu);
    }
  }
  uint64_t v24 = qword_2680BEFD8;
  if (qword_2680BEFD8)
  {
    uint64_t v25 = objc_msgSend_objectForKey_(v5, v19, qword_2680BEFD8, v20, v21);
  }
  else
  {
    uint64_t v25 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v25);
  if (v24) {

  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v30 = objc_msgSend_remoteSKEData(*(void **)(a1 + 32), v26, v27, v28, v29);
    if (v30)
    {
    }
    else
    {
      uint64_t v36 = objc_msgSend_remoteICEData(*(void **)(a1 + 32), v31, v32, v33, v34);

      if (v36) {
        goto LABEL_35;
      }
    }
    uint64_t v35 = sub_224FB12A0();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_224F93000, v35, OS_LOG_TYPE_DEFAULT, "[WARN] skeData was nil", (uint8_t *)&v40, 2u);
    }
  }
LABEL_35:
  uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v38 = *(void **)(v37 + 40);
  *(void *)(v37 + 40) = v6;
  id v39 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_224FC05E8(uint64_t a1)
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v162 = v4;
    __int16 v163 = 1024;
    *(_DWORD *)uint64_t v164 = v3;
    *(_WORD *)&v164[4] = 2112;
    *(void *)&v164[6] = v5;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "conference: %@  didStartSession: %d  withUserInfo: %@", buf, 0x1Cu);
  }

  if (qword_26AB79548)
  {
    uint64_t v9 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_26AB79548, v7, v8);
    uint64_t v14 = objc_msgSend_integerValue(v9, v10, v11, v12, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (qword_26AB79550)
  {
    uint64_t v15 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_26AB79550, v7, v8);
    uint64_t v20 = objc_msgSend_integerValue(v15, v16, v17, v18, v19);
  }
  else
  {
    uint64_t v20 = 0;
  }
  if (qword_26AB79558)
  {
    uint64_t v21 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_26AB79558, v7, v8);
  }
  else
  {
    uint64_t v21 = 0;
  }
  if (qword_26AB79560)
  {
    uint64_t v22 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_26AB79560, v7, v8);
    uint64_t v27 = objc_msgSend_integerValue(v22, v23, v24, v25, v26);
  }
  else
  {
    uint64_t v27 = 0;
  }
  if (qword_26AB79568)
  {
    uint64_t v28 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_26AB79568, v7, v8);
    uint64_t v33 = objc_msgSend_integerValue(v28, v29, v30, v31, v32);
  }
  else
  {
    uint64_t v33 = 0;
  }
  uint64_t v34 = sub_224FB12A0();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134219010;
    uint64_t v162 = v14;
    __int16 v163 = 2112;
    *(void *)uint64_t v164 = v21;
    *(_WORD *)&v164[8] = 1024;
    *(_DWORD *)&v164[10] = v20;
    __int16 v165 = 1024;
    int v166 = v27;
    __int16 v167 = 1024;
    int v168 = v33;
    _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, "User info callID: %ld error: %@ type: %d local: %d  remote: %d", buf, 0x28u);
  }

  uint64_t v36 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v35, *(void *)(a1 + 32), v14, @"didStartSession");
  int v40 = objc_msgSend_participantWithAVConferenceCallID_(v36, v37, v14, v38, v39);
  uint64_t v44 = objc_msgSend__callInfoForCallID_(v40, v41, v14, v42, v43);
  objc_msgSend_setWaitingToConnect_(v40, v45, 0, v46, v47);
  if (*(unsigned char *)(a1 + 56))
  {
    unsigned int v160 = v20;
    objc_msgSend__setConnectionType_(v36, v48, v20, v49, v50);
    uint64_t v51 = NSNumber;
    uint64_t v56 = objc_msgSend_natType(*(void **)(a1 + 32), v52, v53, v54, v55);
    uint64_t v60 = objc_msgSend_numberWithUnsignedInt_(v51, v57, v56, v58, v59);
    objc_msgSend__setNatType_(v36, v61, (uint64_t)v60, v62, v63);

    if (v33)
    {
      uint64_t v67 = 1;
      objc_msgSend__setRemoteNetworkConnectionType_(v36, v64, 1, v65, v66);
    }
    else
    {
      uint64_t v67 = 2;
      objc_msgSend__setRemoteNetworkConnectionType_(v36, v64, 2, v65, v66);
    }
    if (v27)
    {
      uint64_t v71 = 1;
      objc_msgSend__setLocalNetworkConnectionType_(v36, v68, 1, v69, v70);
    }
    else
    {
      uint64_t v71 = 2;
      objc_msgSend__setLocalNetworkConnectionType_(v36, v68, 2, v69, v70);
    }
    if (objc_msgSend_isReinitiate(v44, v72, v73, v74, v75))
    {
      objc_msgSend__setIsAudioInterrupted_(v36, v76, 0, v78, v79);
      objc_msgSend__setIsVideoInterrupted_(v36, v80, 0, v81, v82);
      objc_msgSend_conference_withCallID_remoteMediaStalled_(*(void **)(a1 + 48), v83, *(void *)(a1 + 32), v14, 0);
      objc_msgSend_conference_videoQualityNotificationForCallID_isDegraded_isRemote_(*(void **)(a1 + 48), v84, *(void *)(a1 + 32), v14, 0, 1);
    }
    uint64_t v85 = objc_msgSend_isSendingVideoExpected(*(void **)(a1 + 48), v76, v77, v78, v79);

    if (v85)
    {
      uint64_t v159 = v21;
      uint64_t v86 = sub_224FB12A0();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v91 = objc_msgSend_isSendingVideoExpected(*(void **)(a1 + 48), v87, v88, v89, v90);
        int v96 = objc_msgSend_BOOLValue(v91, v92, v93, v94, v95);
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v162) = v96;
        _os_log_impl(&dword_224F93000, v86, OS_LOG_TYPE_DEFAULT, "Session started and has sendingVideoExpected value %d, updating AVConference's pauseVideo", buf, 8u);
      }
      uint64_t v97 = *(void **)(a1 + 48);
      uint64_t v98 = *(void *)(a1 + 32);
      uint64_t v103 = objc_msgSend_isSendingVideoExpected(v97, v99, v100, v101, v102);
      int v108 = objc_msgSend_BOOLValue(v103, v104, v105, v106, v107);
      objc_msgSend_conference_callID_setPauseVideo_(v97, v109, v98, v14, v108 ^ 1u);

      objc_msgSend_setSendingVideoExpected_(*(void **)(a1 + 48), v110, 0, v111, v112);
      uint64_t v21 = v159;
    }
    uint64_t v113 = sub_224FB12A0();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v162 = (uint64_t)v44;
      _os_log_impl(&dword_224F93000, v113, OS_LOG_TYPE_DEFAULT, "Telling the call info %@ that we are connected", buf, 0xCu);
    }

    objc_msgSend_setState_(v44, v114, 3, v115, v116);
    objc_msgSend_setLocalConnectionType_(v44, v117, v71, v118, v119);
    objc_msgSend_setRemoteConnectionType_(v44, v120, v67, v121, v122);
    objc_msgSend__cleanupOrphanedCallInfos(v40, v123, v124, v125, v126);
    if (MarcoShouldLog())
    {
      uint64_t v131 = sub_224FAACA8(v160);
      MarcoLogCallInfo();

      uint64_t v132 = NSNumber;
      uint64_t v137 = objc_msgSend_natType(*(void **)(a1 + 32), v133, v134, v135, v136);
      uint64_t v141 = objc_msgSend_numberWithUnsignedInt_(v132, v138, v137, v139, v140);
      uint64_t v146 = objc_msgSend_stringValue(v141, v142, v143, v144, v145);
      MarcoLogCallInfo();

      MarcoLogCallInfo();
      MarcoLogCallInfo();
    }
    if ((objc_msgSend_isVideo(v36, v127, v128, v129, v130, v159) & 1) == 0)
    {
      char v151 = objc_msgSend_dateConnected(v36, v147, v148, v149, v150);

      if (!v151)
      {
        objc_msgSend__setDateConnected(v36, v147, v152, v153, v150);
        objc_msgSend__submitCallConnectedLogging(v36, v154, v155, v156, v157);
      }
    }
  }
  else
  {
    objc_msgSend_setState_(v44, v48, 4, v49, v50);
    if (v21) {
      objc_msgSend__handleAVError_(v36, v147, (uint64_t)v21, v158, v150);
    }
  }
  objc_msgSend_conferenceAVConferenceCallID_didConnect_(v36, v147, v14, *(unsigned __int8 *)(a1 + 56), v150);
}

void sub_224FC0D68(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v33 = 138413058;
    uint64_t v34 = v4;
    __int16 v35 = 1024;
    int v36 = v3;
    __int16 v37 = 2112;
    uint64_t v38 = v5;
    __int16 v39 = 2112;
    uint64_t v40 = v6;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "conference: %@  didStopWithCallID: %d   error: %@   callMetadata: %@", (uint8_t *)&v33, 0x26u);
  }

  uint64_t v8 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 56), v7, *(void *)(a1 + 32), *(void *)(a1 + 64), @"didStopWithCallID");
  uint64_t v12 = objc_msgSend_participantWithAVConferenceCallID_(v8, v9, *(void *)(a1 + 64), v10, v11);
  char v16 = objc_msgSend__callInfoForCallID_(v12, v13, *(void *)(a1 + 64), v14, v15);
  int isBeingHandedOff = objc_msgSend_isBeingHandedOff(v16, v17, v18, v19, v20);
  uint64_t v24 = *(void *)(a1 + 48);
  uint64_t v23 = *(void **)(a1 + 56);
  if (isBeingHandedOff)
  {
    objc_msgSend_updateAVChat_withCallMetadata_isFinalUpdate_(v23, v21, (uint64_t)v8, v24, 0);
    uint64_t v25 = sub_224FB12A0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 64);
      int v33 = 67109120;
      LODWORD(v34) = v26;
      _os_log_impl(&dword_224F93000, v25, OS_LOG_TYPE_DEFAULT, "call is being handed off, only cleaning this call ID: %d", (uint8_t *)&v33, 8u);
    }

    objc_msgSend_endAVConferenceWithChat_callID_(*(void **)(a1 + 56), v27, (uint64_t)v8, *(void *)(a1 + 64), v28);
  }
  else
  {
    objc_msgSend_updateAVChat_withCallMetadata_isFinalUpdate_(v23, v21, (uint64_t)v8, v24, 1);
    uint64_t v29 = sub_224FB12A0();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 64);
      int v33 = 67109120;
      LODWORD(v34) = v30;
      _os_log_impl(&dword_224F93000, v29, OS_LOG_TYPE_DEFAULT, "tearing down normally for call ID: %d", (uint8_t *)&v33, 8u);
    }

    objc_msgSend_conferenceDidStopWithCallID_error_(v8, v31, *(void *)(a1 + 64), *(void *)(a1 + 40), v32);
  }
}

void sub_224FC1060(uint64_t a1, const char *a2)
{
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), 0, @"updateInputFrequencyLevel");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_localParticipant(v11, v3, v4, v5, v6);
  objc_msgSend_setInFrequencyLevel_(v7, v8, *(void *)(a1 + 48), v9, v10);
}

void sub_224FC11B0(uint64_t a1, const char *a2)
{
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), 0, @"updateOutputFrequencyLevel");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_localParticipant(v11, v3, v4, v5, v6);
  objc_msgSend_setOutFrequencyLevel_(v7, v8, *(void *)(a1 + 48), v9, v10);
}

void sub_224FC1360(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v35 = 138412546;
    uint64_t v36 = v3;
    __int16 v37 = 1024;
    int v38 = v4;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  receivedFirstRemoteFrameForCallID: %d", (uint8_t *)&v35, 0x12u);
  }

  uint64_t v6 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v5, *(void *)(a1 + 32), *(void *)(a1 + 48), @"receivedFirstRemoteFrameForCallID");
  objc_msgSend__noteFirstFrame(v6, v7, v8, v9, v10);
  objc_msgSend__clearFirstFrameTimeoutTimer(v6, v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_remoteParticipants(v6, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_count(v19, v20, v21, v22, v23);

  if (v24)
  {
    uint64_t v29 = objc_msgSend_remoteParticipants(v6, v25, v26, v27, v28);
    uint64_t v34 = objc_msgSend___imFirstObject(v29, v30, v31, v32, v33);
  }
  else
  {
    uint64_t v34 = 0;
  }
  sub_224FC14B0(@"__kIMAVChatParticipantReceivedFirstFrameNotification", v34, 0);
}

void sub_224FC14B0(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = sub_224FB12A0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Posting notification name: %@  object: %@  userInfo: %@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v13 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v9, v10, v11, v12);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v13, v14, (uint64_t)v5, (uint64_t)v6, (uint64_t)v7);
}

void sub_224FC16F8(uint64_t a1)
{
  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v6 = *(unsigned __int8 *)(a1 + 96);
  if (!*(unsigned char *)(a1 + 96)
    && (*(unsigned char *)(a1 + 97) || *(unsigned char *)(a1 + 98) || *(unsigned char *)(a1 + 99) || *(unsigned char *)(a1 + 100)))
  {
    goto LABEL_10;
  }
  id v7 = objc_msgSend_numberWithInteger_(NSNumber, v2, *(unsigned int *)(a1 + 88), v4, v5);
  if (v7) {
    CFDictionarySetValue(theDict, @"__kIMAVChatCameraTypeKey", v7);
  }

  if (v6)
  {
LABEL_10:
    if (!*(unsigned char *)(a1 + 100)) {
      goto LABEL_16;
    }
    char v8 = 0;
  }
  else
  {
    char v8 = 1;
  }
  uint64_t v9 = objc_msgSend_valueWithRect_(MEMORY[0x263F08D40], v2, v3, v4, v5, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (v9) {
    CFDictionarySetValue(theDict, @"__kIMAVChatCameraContentRectKey", v9);
  }

  if (v8)
  {
    char v10 = 1;
    goto LABEL_18;
  }
LABEL_16:
  if (!*(unsigned char *)(a1 + 97)) {
    goto LABEL_22;
  }
  char v10 = 0;
LABEL_18:
  uint64_t v11 = objc_msgSend_numberWithInteger_(NSNumber, v2, *(unsigned int *)(a1 + 92), v4, v5);
  if (v11) {
    CFDictionarySetValue(theDict, @"__kIMAVChatCameraOrientationKey", v11);
  }

  if (v10)
  {
    char v12 = 1;
    goto LABEL_24;
  }
LABEL_22:
  if (!*(unsigned char *)(a1 + 98)) {
    goto LABEL_27;
  }
  char v12 = 0;
LABEL_24:
  uint64_t v13 = objc_msgSend_valueWithSize_(MEMORY[0x263F08D40], v2, v3, v4, v5, *(double *)(a1 + 72), *(double *)(a1 + 80));
  if (v13) {
    CFDictionarySetValue(theDict, @"__kIMAVChatCameraAspectRatioKey", v13);
  }

  if ((v12 & 1) == 0)
  {
LABEL_27:
    if (!*(unsigned char *)(a1 + 99)) {
      goto LABEL_29;
    }
  }
  CFDictionarySetValue(theDict, @"__kIMAVChatCameraWillChangeKey", &unk_26D863908);
LABEL_29:
  sub_224FC14B0(@"__kIMAVChatParticipantMediaPropertiesChangedNotification", *(void **)(a1 + 32), theDict);
}

void sub_224FC19E0(uint64_t a1)
{
  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (*(unsigned char *)(a1 + 60))
  {
    if (!*(unsigned char *)(a1 + 61)) {
      goto LABEL_12;
    }
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 61))
  {
LABEL_5:
    char v6 = 0;
    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 62) || *(unsigned char *)(a1 + 63)) {
    goto LABEL_12;
  }
  char v6 = 1;
LABEL_6:
  id v7 = objc_msgSend_numberWithInteger_(NSNumber, v2, *(unsigned int *)(a1 + 56), v4, v5);
  if (v7) {
    CFDictionarySetValue(theDict, @"__kIMAVChatCameraOrientationKey", v7);
  }

  if ((v6 & 1) == 0)
  {
LABEL_12:
    if (!*(unsigned char *)(a1 + 62)) {
      goto LABEL_16;
    }
  }
  char v8 = objc_msgSend_valueWithSize_(MEMORY[0x263F08D40], v2, v3, v4, v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  if (v8) {
    CFDictionarySetValue(theDict, @"__kIMAVChatCameraAspectRatioKey", v8);
  }

LABEL_16:
  sub_224FC14B0(@"__kIMAVChatParticipantScreenPropertiesChangedNotification", *(void **)(a1 + 32), theDict);
}

void sub_224FC1BE8(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v55 = v3;
    __int16 v56 = 1024;
    int v57 = v4;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d", buf, 0x12u);
  }

  sub_224FC1DC0(*(void **)(a1 + 40));
  char v6 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v5, *(void *)(a1 + 32), *(void *)(a1 + 56), @"remoteScreenAttributesChanged");
  uint64_t v11 = objc_msgSend_remoteParticipants(v6, v7, v8, v9, v10);
  id v16 = objc_msgSend_lastObject(v11, v12, v13, v14, v15);

  uint64_t v21 = objc_msgSend_camera(*(void **)(a1 + 40), v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_orientation(*(void **)(a1 + 40), v22, v23, v24, v25);
  objc_msgSend_ratio(*(void **)(a1 + 40), v27, v28, v29, v30);
  double v32 = v31;
  double v34 = v33;
  objc_msgSend_localAspectRatioForCameraOrientation_cameraType_(v16, v35, v26, v21, v36);
  BOOL v43 = v34 != v42 || v32 != v41;
  int v44 = objc_msgSend__screenOrientation(v16, v37, v38, v39, v40);
  int v48 = v44;
  if (v43 || v44 != v26)
  {
    objc_msgSend__setScreenOrientation_(v16, v45, v26, v46, v47);
    if (v26 > 1) {
      objc_msgSend__setRemotePIPLandscapeOrientation_(v16, v49, v50, v51, v52, v32, v34);
    }
    else {
      objc_msgSend__setRemotePIPPortraitOrientation_(v16, v49, v50, v51, v52, v32, v34);
    }
    objc_msgSend__postParticipantScreenAttributesChangeNotification_cameraChanged_orientationChanged_aspectChanged_cameraWillSwitch_camera_orentation_aspect_(IMAVConferenceInterface, v53, (uint64_t)v16, 0, v48 != v26, v43, 0, v21, v32, v34, v26);
  }
}

void sub_224FC1DC0(void *a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v6 = objc_msgSend_camera(v1, v2, v3, v4, v5);
  int v11 = objc_msgSend_orientation(v1, v7, v8, v9, v10);
  objc_msgSend_ratio(v1, v12, v13, v14, v15);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  int v24 = objc_msgSend_cameraSwitching(v1, v20, v21, v22, v23);
  objc_msgSend_contentsRect(v1, v25, v26, v27, v28);
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  __int16 v37 = sub_224FB12A0();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 138412290;
    uint64_t v47 = v1;
    _os_log_impl(&dword_224F93000, v37, OS_LOG_TYPE_DEFAULT, "    Attributes: %@", (uint8_t *)&v46, 0xCu);
  }

  uint64_t v38 = sub_224FB12A0();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 67109120;
    LODWORD(v47) = v6;
    _os_log_impl(&dword_224F93000, v38, OS_LOG_TYPE_DEFAULT, "          Camera: %d", (uint8_t *)&v46, 8u);
  }

  uint64_t v39 = sub_224FB12A0();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 67109120;
    LODWORD(v47) = v11;
    _os_log_impl(&dword_224F93000, v39, OS_LOG_TYPE_DEFAULT, "     Orientation: %d", (uint8_t *)&v46, 8u);
  }

  uint64_t v40 = sub_224FB12A0();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v49.width = v17;
    v49.height = v19;
    NSStringFromSize(v49);
    double v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v46 = 138412290;
    uint64_t v47 = v41;
    _os_log_impl(&dword_224F93000, v40, OS_LOG_TYPE_DEFAULT, "          Aspect: %@", (uint8_t *)&v46, 0xCu);
  }
  double v42 = sub_224FB12A0();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v50.origin.x = v30;
    v50.origin.y = v32;
    v50.size.width = v34;
    v50.size.height = v36;
    NSStringFromRect(v50);
    BOOL v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v46 = 138412290;
    uint64_t v47 = v43;
    _os_log_impl(&dword_224F93000, v42, OS_LOG_TYPE_DEFAULT, "    Content Rect: %@", (uint8_t *)&v46, 0xCu);
  }
  int v44 = sub_224FB12A0();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = @"NO";
    if (v24) {
      uint64_t v45 = @"YES";
    }
    int v46 = 138412290;
    uint64_t v47 = v45;
    _os_log_impl(&dword_224F93000, v44, OS_LOG_TYPE_DEFAULT, "   Camera switch: %@", (uint8_t *)&v46, 0xCu);
  }
}

void sub_224FC219C(uint64_t a1)
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v128 = v3;
    __int16 v129 = 1024;
    int v130 = v4;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d", buf, 0x12u);
  }

  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v128) = v6;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Informed about video attributes change for call ID: %d", buf, 8u);
  }

  uint64_t v124 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v7, *(void *)(a1 + 32), *(void *)(a1 + 56), @"remoteVideoAttributesChanged");
  char v12 = objc_msgSend_remoteParticipants(v124, v8, v9, v10, v11);
  CGFloat v17 = objc_msgSend_lastObject(v12, v13, v14, v15, v16);

  uint64_t v22 = objc_msgSend_camera(*(void **)(a1 + 48), v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_orientation(*(void **)(a1 + 48), v23, v24, v25, v26);
  objc_msgSend_ratio(*(void **)(a1 + 48), v28, v29, v30, v31);
  double v33 = v32;
  double v35 = v34;
  unsigned int v126 = objc_msgSend_cameraSwitching(*(void **)(a1 + 48), v36, v37, v38, v39);
  objc_msgSend_contentsRect(*(void **)(a1 + 48), v40, v41, v42, v43);
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  sub_224FC1DC0(*(void **)(a1 + 48));
  int v56 = objc_msgSend_cameraType(v17, v52, v53, v54, v55);
  int v61 = objc_msgSend_cameraOrientation(v17, v57, v58, v59, v60);
  objc_msgSend_aspectRatioForCameraOrientation_cameraType_(v17, v62, v27, v22, v63);
  BOOL v67 = v33 != v66;
  if (v35 != v68) {
    BOOL v67 = 1;
  }
  BOOL v125 = v67;
  objc_msgSend_contentRectForCameraOrientation_cameraType_(v17, v64, v27, v22, v65);
  BOOL v75 = 1;
  if (v49 != v76 || v51 != v74) {
    goto LABEL_22;
  }
  BOOL v75 = v47 != v73 || v45 != v72;
  if (v17) {
    BOOL v77 = v22 == v56;
  }
  else {
    BOOL v77 = 0;
  }
  BOOL v78 = v77 && v27 == v61;
  int v79 = v125;
  if (!v78) {
    int v79 = 1;
  }
  if (((v79 | v126) & 1) != 0 || v75)
  {
LABEL_22:
    objc_msgSend__setCameraOrientation_(v17, v69, v27, v70, v71);
    objc_msgSend__setCameraType_(v17, v80, v22, v81, v82);
    if (v27 > 1)
    {
      objc_msgSend__setRemoteLandscapeOrientation_(v17, v83, v84, v85, v86, v33, v35);
      objc_msgSend__setRemoteLandscapeContentRect_(v17, v95, v96, v97, v98, v45, v47, v49, v51);
    }
    else
    {
      objc_msgSend__setRemotePortraitOrientation_(v17, v83, v84, v85, v86, v33, v35);
      objc_msgSend__setRemotePortraitContentRect_(v17, v87, v88, v89, v90, v45, v47, v49, v51);
    }
    if (v126) {
      sub_224FC14B0(@"__kIMAVChatParticipantCameraWillChangeNotification", v17, 0);
    }
    if (v27 != v61)
    {
      uint64_t v99 = NSDictionary;
      uint64_t v100 = objc_msgSend_numberWithInt_(NSNumber, v91, v27, v93, v94);
      unsigned int v104 = objc_msgSend_dictionaryWithObjectsAndKeys_(v99, v101, (uint64_t)v100, v102, v103, @"__kIMAVChatCameraOrientationKey", 0);
      sub_224FC14B0(@"__kIMAVChatParticipantCameraOrientationChangedNotification", v17, v104);
    }
    if (v22 != v56)
    {
      uint64_t v105 = NSDictionary;
      uint64_t v106 = objc_msgSend_numberWithInt_(NSNumber, v91, v22, v93, v94);
      uint64_t v110 = objc_msgSend_dictionaryWithObjectsAndKeys_(v105, v107, (uint64_t)v106, v108, v109, @"__kIMAVChatCameraTypeKey", 0);
      sub_224FC14B0(@"__kIMAVChatParticipantCameraDidChangeNotification", v17, v110);
    }
    if (v75)
    {
      uint64_t v111 = NSDictionary;
      uint64_t v112 = objc_msgSend_valueWithRect_(MEMORY[0x263F08D40], v91, v92, v93, v94, v45, v47, v49, v51);
      uint64_t v116 = objc_msgSend_dictionaryWithObjectsAndKeys_(v111, v113, (uint64_t)v112, v114, v115, @"__kIMAVChatCameraContentRectKey", 0);
      sub_224FC14B0(@"__kIMAVChatParticipantContentRectChangedNotification", v17, v116);
    }
    int v117 = v125;
    if (v27 != v61) {
      int v117 = 1;
    }
    if (v117 == 1)
    {
      uint64_t v118 = NSDictionary;
      uint64_t v119 = objc_msgSend_valueWithSize_(MEMORY[0x263F08D40], v91, v92, v93, v94, v33, v35);
      uint64_t v123 = objc_msgSend_dictionaryWithObjectsAndKeys_(v118, v120, (uint64_t)v119, v121, v122, @"__kIMAVChatCameraAspectRatioKey", 0);
      sub_224FC14B0(@"__kIMAVChatParticipantAspectRatioChangedNotification", v17, v123);
    }
    objc_msgSend__postParticipantMediaChangeNotification_cameraChanged_orientationChanged_aspectChanged_contentRectChanged_cameraWillSwitch_camera_orentation_aspect_contentRect_(IMAVConferenceInterface, v91, (uint64_t)v17, v22 != v56, v27 != v61, v125, v75, v126, v33, v35, v45, v47, v49, v51, __PAIR64__(v27, v22));
  }
}

void sub_224FC278C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10))
  {

LABEL_4:
    uint64_t v21 = sub_224FB12A0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(NSObject **)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      int v66 = 138412802;
      BOOL v67 = v23;
      __int16 v68 = 1024;
      int v69 = v22;
      __int16 v70 = 2112;
      uint64_t v71 = v24;
      _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d parameters: %@", (uint8_t *)&v66, 0x1Cu);
    }

    uint64_t v25 = sub_224FC2ABC(*(void **)(a1 + 40));
    uint64_t v27 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v26, *(void *)(a1 + 32), *(void *)(a1 + 56), @"inititiateRelayRequest");
    uint64_t v31 = objc_msgSend_participantWithAVConferenceCallID_(v27, v28, *(void *)(a1 + 56), v29, v30);
    double v35 = objc_msgSend_objectForKey_(v25, v32, *MEMORY[0x263F4A2F0], v33, v34);
    objc_msgSend__setRelayRemotePrimaryIdentifier_(v27, v36, (uint64_t)v35, v37, v38);
    uint64_t v39 = sub_224FB12A0();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      double v44 = objc_msgSend_vcPartyID(v31, v40, v41, v42, v43);
      int v66 = 138412290;
      BOOL v67 = v44;
      _os_log_impl(&dword_224F93000, v39, OS_LOG_TYPE_DEFAULT, "Instructed to initiate relay request to: %@", (uint8_t *)&v66, 0xCu);
    }
    double v48 = objc_msgSend_natTypeForAVChat_(*(void **)(a1 + 48), v45, (uint64_t)v27, v46, v47);
    if (v48) {
      CFDictionarySetValue((CFMutableDictionaryRef)v25, (const void *)*MEMORY[0x263F4A308], v48);
    }

    uint64_t v53 = objc_msgSend_properties(v31, v49, v50, v51, v52);
    int v57 = objc_msgSend_objectForKey_(v53, v54, *MEMORY[0x263F4A6E8], v55, v56);

    if (v57) {
      CFDictionarySetValue((CFMutableDictionaryRef)v25, (const void *)*MEMORY[0x263F4A2C0], v57);
    }

    uint64_t v58 = sub_224FB12A0();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      int v66 = 138412290;
      BOOL v67 = v25;
      _os_log_impl(&dword_224F93000, v58, OS_LOG_TYPE_DEFAULT, "Built new relay parameters: %@", (uint8_t *)&v66, 0xCu);
    }

    uint64_t v63 = objc_msgSend_vcPartyID(v31, v59, v60, v61, v62);
    objc_msgSend_conferencePersonWithID_sendRelayRequest_(v27, v64, (uint64_t)v63, (uint64_t)v25, v65);

    goto LABEL_15;
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  char shouldRunACConferences = objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19);

  if (shouldRunACConferences) {
    goto LABEL_4;
  }
  uint64_t v25 = sub_224FB12A0();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v66) = 0;
    _os_log_impl(&dword_224F93000, v25, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", (uint8_t *)&v66, 2u);
  }
LABEL_15:
}

id sub_224FC2ABC(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v6 = objc_msgSend_objectForKey_(v1, v3, qword_26AB795A0, v4, v5);

  if (v6)
  {
    uint64_t v10 = objc_msgSend_objectForKey_(v1, v7, qword_26AB795A0, v8, v9);
    objc_msgSend_setObject_forKey_(v2, v11, (uint64_t)v10, *MEMORY[0x263F4A2E8], v12);
  }
  uint64_t v13 = objc_msgSend_objectForKey_(v1, v7, qword_26AB79608, v8, v9);

  if (v13)
  {
    uint64_t v17 = objc_msgSend_objectForKey_(v1, v14, qword_26AB79608, v15, v16);
    objc_msgSend_setObject_forKey_(v2, v18, (uint64_t)v17, *MEMORY[0x263F4A308], v19);
  }
  uint64_t v20 = objc_msgSend_objectForKey_(v1, v14, qword_26AB795F8, v15, v16);

  if (v20)
  {
    uint64_t v24 = objc_msgSend_objectForKey_(v1, v21, qword_26AB795F8, v22, v23);
    objc_msgSend_setObject_forKey_(v2, v25, (uint64_t)v24, *MEMORY[0x263F4A2F8], v26);
  }
  uint64_t v27 = objc_msgSend_objectForKey_(v1, v21, qword_26AB79600, v22, v23);

  if (v27)
  {
    uint64_t v31 = objc_msgSend_objectForKey_(v1, v28, qword_26AB79600, v29, v30);
    objc_msgSend_setObject_forKey_(v2, v32, (uint64_t)v31, *MEMORY[0x263F4A300], v33);
  }
  uint64_t v34 = objc_msgSend_objectForKey_(v1, v28, qword_26AB795C0, v29, v30);

  if (v34)
  {
    uint64_t v38 = objc_msgSend_objectForKey_(v1, v35, qword_26AB795C0, v36, v37);
    objc_msgSend_setObject_forKey_(v2, v39, (uint64_t)v38, *MEMORY[0x263F4A2B0], v40);
  }
  uint64_t v41 = objc_msgSend_objectForKey_(v1, v35, qword_26AB795C8, v36, v37);

  if (v41)
  {
    double v45 = objc_msgSend_objectForKey_(v1, v42, qword_26AB795C8, v43, v44);
    objc_msgSend_setObject_forKey_(v2, v46, (uint64_t)v45, *MEMORY[0x263F4A2C0], v47);
  }
  double v48 = objc_msgSend_objectForKey_(v1, v42, qword_26AB795B0, v43, v44);

  if (v48)
  {
    uint64_t v52 = objc_msgSend_objectForKey_(v1, v49, qword_26AB795B0, v50, v51);
    objc_msgSend_setObject_forKey_(v2, v53, (uint64_t)v52, *MEMORY[0x263F4A2A8], v54);
  }
  uint64_t v55 = objc_msgSend_objectForKey_(v1, v49, qword_26AB795B8, v50, v51);

  if (v55)
  {
    uint64_t v59 = objc_msgSend_objectForKey_(v1, v56, qword_26AB795B8, v57, v58);
    objc_msgSend_setObject_forKey_(v2, v60, (uint64_t)v59, *MEMORY[0x263F4A2B8], v61);
  }
  uint64_t v62 = objc_msgSend_objectForKey_(v1, v56, qword_26AB79640, v57, v58);

  if (v62)
  {
    int v66 = objc_msgSend_objectForKey_(v1, v63, qword_26AB79640, v64, v65);
    objc_msgSend_setObject_forKey_(v2, v67, (uint64_t)v66, *MEMORY[0x263F4A340], v68);
  }
  int v69 = objc_msgSend_objectForKey_(v1, v63, qword_26AB795A8, v64, v65);

  if (v69)
  {
    double v73 = objc_msgSend_objectForKey_(v1, v70, qword_26AB795A8, v71, v72);
    objc_msgSend_setObject_forKey_(v2, v74, (uint64_t)v73, *MEMORY[0x263F4A2A0], v75);
  }
  double v76 = objc_msgSend_objectForKey_(v1, v70, qword_26AB79638, v71, v72);

  if (v76)
  {
    uint64_t v80 = objc_msgSend_objectForKey_(v1, v77, qword_26AB79638, v78, v79);
    objc_msgSend_setObject_forKey_(v2, v81, (uint64_t)v80, *MEMORY[0x263F4A338], v82);
  }
  uint64_t v83 = objc_msgSend_objectForKey_(v1, v77, qword_26AB79630, v78, v79);

  if (v83)
  {
    uint64_t v87 = objc_msgSend_objectForKey_(v1, v84, qword_26AB79630, v85, v86);
    objc_msgSend_setObject_forKey_(v2, v88, (uint64_t)v87, *MEMORY[0x263F4A330], v89);
  }
  uint64_t v90 = objc_msgSend_objectForKey_(v1, v84, qword_26AB795D0, v85, v86);

  if (v90)
  {
    uint64_t v94 = objc_msgSend_objectForKey_(v1, v91, qword_26AB795D0, v92, v93);
    objc_msgSend_setObject_forKey_(v2, v95, (uint64_t)v94, *MEMORY[0x263F4A2C8], v96);
  }
  uint64_t v97 = objc_msgSend_objectForKey_(v1, v91, qword_26AB795E8, v92, v93);

  if (v97)
  {
    uint64_t v101 = objc_msgSend_objectForKey_(v1, v98, qword_26AB795E8, v99, v100);
    objc_msgSend_setObject_forKey_(v2, v102, (uint64_t)v101, *MEMORY[0x263F4A2E0], v103);
  }
  unsigned int v104 = objc_msgSend_objectForKey_(v1, v98, qword_26AB79610, v99, v100);

  if (v104)
  {
    uint64_t v108 = objc_msgSend_objectForKey_(v1, v105, qword_26AB79610, v106, v107);
    objc_msgSend_setObject_forKey_(v2, v109, (uint64_t)v108, *MEMORY[0x263F4A310], v110);
  }
  uint64_t v111 = objc_msgSend_objectForKey_(v1, v105, qword_26AB79628, v106, v107);

  if (v111)
  {
    uint64_t v115 = objc_msgSend_objectForKey_(v1, v112, qword_26AB79628, v113, v114);
    objc_msgSend_setObject_forKey_(v2, v116, (uint64_t)v115, *MEMORY[0x263F4A328], v117);
  }
  uint64_t v118 = objc_msgSend_objectForKey_(v1, v112, qword_26AB79618, v113, v114);

  if (v118)
  {
    uint64_t v122 = objc_msgSend_objectForKey_(v1, v119, qword_26AB79618, v120, v121);
    objc_msgSend_setObject_forKey_(v2, v123, (uint64_t)v122, *MEMORY[0x263F4A318], v124);
  }
  BOOL v125 = objc_msgSend_objectForKey_(v1, v119, qword_26AB79620, v120, v121);

  if (v125)
  {
    __int16 v129 = objc_msgSend_objectForKey_(v1, v126, qword_26AB79620, v127, v128);
    objc_msgSend_setObject_forKey_(v2, v130, (uint64_t)v129, *MEMORY[0x263F4A320], v131);
  }
  uint64_t v132 = objc_msgSend_objectForKey_(v1, v126, qword_26AB795D8, v127, v128);

  if (v132)
  {
    uint64_t v136 = objc_msgSend_objectForKey_(v1, v133, qword_26AB795D8, v134, v135);
    objc_msgSend_setObject_forKey_(v2, v137, (uint64_t)v136, *MEMORY[0x263F4A2D0], v138);
  }
  uint64_t v139 = objc_msgSend_objectForKey_(v1, v133, qword_26AB795E0, v134, v135);

  if (v139)
  {
    uint64_t v143 = objc_msgSend_objectForKey_(v1, v140, qword_26AB795E0, v141, v142);
    objc_msgSend_setObject_forKey_(v2, v144, (uint64_t)v143, *MEMORY[0x263F4A2D8], v145);
  }
  if (qword_26AB795F0)
  {
    uint64_t v146 = objc_msgSend_objectForKey_(v1, v140, qword_26AB795F0, v141, v142);

    if (v146)
    {
      uint64_t v150 = objc_msgSend_objectForKey_(v1, v147, qword_26AB795F0, v148, v149);
      objc_msgSend_setObject_forKey_(v2, v151, (uint64_t)v150, *MEMORY[0x263F4A2F0], v152);
    }
  }

  return v2;
}

void sub_224FC328C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10))
  {

LABEL_4:
    uint64_t v21 = sub_224FB12A0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      int v45 = 138412802;
      uint64_t v46 = v23;
      __int16 v47 = 1024;
      int v48 = v22;
      __int16 v49 = 2112;
      uint64_t v50 = v24;
      _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d parameters: %@", (uint8_t *)&v45, 0x1Cu);
    }

    uint64_t v26 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v25, *(void *)(a1 + 32), *(void *)(a1 + 56), @"sendRelayUpdate");
    uint64_t v30 = objc_msgSend_participantWithAVConferenceCallID_(v26, v27, *(void *)(a1 + 56), v28, v29);
    uint64_t v31 = sub_224FB12A0();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = objc_msgSend_vcPartyID(v30, v32, v33, v34, v35);
      int v45 = 138412290;
      uint64_t v46 = v36;
      _os_log_impl(&dword_224F93000, v31, OS_LOG_TYPE_DEFAULT, "Instructed to send relay update to: %@", (uint8_t *)&v45, 0xCu);
    }
    uint64_t v41 = objc_msgSend_vcPartyID(v30, v37, v38, v39, v40);
    uint64_t v42 = sub_224FC2ABC(*(void **)(a1 + 40));
    objc_msgSend_conferencePersonWithID_sendRelayUpdate_(v26, v43, (uint64_t)v41, (uint64_t)v42, v44);

    goto LABEL_9;
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  char shouldRunACConferences = objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19);

  if (shouldRunACConferences) {
    goto LABEL_4;
  }
  uint64_t v26 = sub_224FB12A0();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v45) = 0;
    _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", (uint8_t *)&v45, 2u);
  }
LABEL_9:
}

void sub_224FC35A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sharedInstance(IMAVController, a2, a3, a4, a5);
  if (objc_msgSend__shouldRunConferences(v6, v7, v8, v9, v10))
  {

LABEL_4:
    uint64_t v21 = sub_224FB12A0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = *(void *)(a1 + 40);
      int v45 = 138412802;
      uint64_t v46 = v23;
      __int16 v47 = 1024;
      int v48 = v22;
      __int16 v49 = 2112;
      uint64_t v50 = v24;
      _os_log_impl(&dword_224F93000, v21, OS_LOG_TYPE_DEFAULT, "vc: %@  callID: %d parameters: %@", (uint8_t *)&v45, 0x1Cu);
    }

    uint64_t v26 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 48), v25, *(void *)(a1 + 32), *(void *)(a1 + 56), @"cancelRelayReqest");
    uint64_t v30 = objc_msgSend_participantWithAVConferenceCallID_(v26, v27, *(void *)(a1 + 56), v28, v29);
    uint64_t v31 = sub_224FB12A0();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = objc_msgSend_vcPartyID(v30, v32, v33, v34, v35);
      int v45 = 138412290;
      uint64_t v46 = v36;
      _os_log_impl(&dword_224F93000, v31, OS_LOG_TYPE_DEFAULT, "Instructed to send relay cancel to: %@", (uint8_t *)&v45, 0xCu);
    }
    uint64_t v41 = objc_msgSend_vcPartyID(v30, v37, v38, v39, v40);
    uint64_t v42 = sub_224FC2ABC(*(void **)(a1 + 40));
    objc_msgSend_conferencePersonWithID_sendRelayCancel_(v26, v43, (uint64_t)v41, (uint64_t)v42, v44);

    goto LABEL_9;
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMAVController, v11, v12, v13, v14);
  char shouldRunACConferences = objc_msgSend__shouldRunACConferences(v15, v16, v17, v18, v19);

  if (shouldRunACConferences) {
    goto LABEL_4;
  }
  uint64_t v26 = sub_224FB12A0();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v45) = 0;
    _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "Returning because we are not the VC host", (uint8_t *)&v45, 2u);
  }
LABEL_9:
}

void sub_224FC38A4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    int v13 = 138412802;
    uint64_t v14 = v3;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  call ID: %d   isNetworkBad: %d", (uint8_t *)&v13, 0x18u);
  }

  id v7 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v6, *(void *)(a1 + 32), *(void *)(a1 + 48), @"networkHint");
  uint64_t v12 = v7;
  if (*(unsigned char *)(a1 + 56)) {
    objc_msgSend__submitCallInterruptionBeganLogging(v7, v8, v9, v10, v11);
  }
  else {
    objc_msgSend__submitCallInterruptionEndedLogging(v7, v8, v9, v10, v11);
  }
}

void sub_224FC3A7C(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    int v6 = *(unsigned __int8 *)(a1 + 57);
    *(_DWORD *)long long buf = 138413058;
    uint64_t v37 = v3;
    __int16 v38 = 1024;
    int v39 = v4;
    __int16 v40 = 1024;
    int v41 = v5;
    __int16 v42 = 1024;
    int v43 = v6;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  call ID: %d   isDegraded: %d   isRemote: %d", buf, 0x1Eu);
  }

  uint64_t v8 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v7, *(void *)(a1 + 32), *(void *)(a1 + 48), @"videoQualityChanged");
  int v13 = v8;
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v14 = objc_msgSend_remoteParticipants(v8, v9, v10, v11, v12);
    uint64_t v19 = objc_msgSend_lastObject(v14, v15, v16, v17, v18);
  }
  else
  {
    uint64_t v19 = objc_msgSend_localParticipant(v8, v9, v10, v11, v12);
  }
  uint64_t v24 = objc_msgSend_vcPartyID(v19, v20, v21, v22, v23);
  objc_msgSend_conferencePersonWithID_didDegrade_(v13, v25, (uint64_t)v24, *(unsigned __int8 *)(a1 + 56), v26);

  uint64_t v27 = NSDictionary;
  uint64_t v31 = objc_msgSend_numberWithBool_(NSNumber, v28, *(unsigned __int8 *)(a1 + 56), v29, v30);
  uint64_t v35 = objc_msgSend_dictionaryWithObjectsAndKeys_(v27, v32, (uint64_t)v31, v33, v34, @"__kIMAVChatVideoDegradedKey", 0);
  sub_224FC14B0(@"__kIMAVChatParticipantVideoQualityChangedNotification", v19, v35);
}

void sub_224FC3D18(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v42 = v3;
    __int16 v43 = 1024;
    int v44 = v4;
    __int16 v45 = 1024;
    int v46 = v5;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@  call ID: %d   remoteMediaStalled: %d", buf, 0x18u);
  }

  id v7 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v6, *(void *)(a1 + 32), *(void *)(a1 + 48), @"remoteMediaStalled");
  uint64_t v12 = objc_msgSend_remoteParticipants(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_lastObject(v12, v13, v14, v15, v16);

  uint64_t v22 = objc_msgSend_vcPartyID(v17, v18, v19, v20, v21);
  objc_msgSend_conferencePersonWithID_mediaDidStall_(v7, v23, (uint64_t)v22, *(unsigned __int8 *)(a1 + 56), v24);

  uint64_t v25 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend__setIsAudioInterrupted_(v7, v26, v25, v27, v28);
  objc_msgSend__setIsVideoInterrupted_(v7, v29, v25, v30, v31);
  double v32 = NSDictionary;
  uint64_t v36 = objc_msgSend_numberWithBool_(NSNumber, v33, *(unsigned __int8 *)(a1 + 56), v34, v35);
  __int16 v40 = objc_msgSend_dictionaryWithObjectsAndKeys_(v32, v37, (uint64_t)v36, v38, v39, @"__kIMAVChatMediaStalledKey", 0);
  sub_224FC14B0(@"__kIMAVChatParticipantMediaStalledChangedNotification", v17, v40);
}

void sub_224FC4010(uint64_t a1, const char *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), @"reinitializeCallForCallID");
  uint64_t v7 = objc_msgSend_participantWithAVConferenceCallID_(v3, v4, *(unsigned int *)(a1 + 48), v5, v6);
  uint64_t v11 = (void *)v7;
  if (v3) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    int v13 = sub_224FB12A0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *(_DWORD *)(a1 + 48);
      int v15 = 138412802;
      uint64_t v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 1024;
      int v20 = v14;
      _os_log_impl(&dword_224F93000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Unknown chat (%@) or participant(%@) for callID %d", (uint8_t *)&v15, 0x1Cu);
    }
  }
  objc_msgSend_reinitializeCallForCallID_(v11, v8, *(unsigned int *)(a1 + 48), v9, v10);
}

void sub_224FC42A4(uint64_t a1, const char *a2)
{
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), @"didPauseAudio");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_conferenceDidPauseAudioWithCallID_didPauseAudio_(v5, v3, *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), v4);
}

void sub_224FC44E4(uint64_t a1, const char *a2)
{
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), @"remoteAudioPaused");
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_participantWithAVConferenceCallID_(v23, v3, *(void *)(a1 + 48), v4, v5);
  uint64_t v11 = objc_msgSend_vcPartyID(v6, v7, v8, v9, v10);
  objc_msgSend_conferencePersonWithID_didMute_(v23, v12, (uint64_t)v11, *(unsigned __int8 *)(a1 + 56), v13);

  int v14 = NSDictionary;
  uint64_t v18 = objc_msgSend_numberWithBool_(NSNumber, v15, *(unsigned __int8 *)(a1 + 56), v16, v17);
  uint64_t v22 = objc_msgSend_dictionaryWithObjectsAndKeys_(v14, v19, (uint64_t)v18, v20, v21, @"__kIMAVChatMuteStateKey", 0);
  sub_224FC14B0(@"__kIMAVChatParticipantMuteChangedNotification", v6, v22);
}

void sub_224FC47BC(uint64_t a1, const char *a2)
{
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), @"remoteVideoPaused");
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_remoteParticipants(v29, v3, v4, v5, v6);
  BOOL v12 = objc_msgSend_lastObject(v7, v8, v9, v10, v11);

  uint64_t v17 = objc_msgSend_vcPartyID(v12, v13, v14, v15, v16);
  objc_msgSend_conferencePersonWithID_didPause_(v29, v18, (uint64_t)v17, *(unsigned __int8 *)(a1 + 56), v19);

  uint64_t v20 = NSDictionary;
  uint64_t v24 = objc_msgSend_numberWithBool_(NSNumber, v21, *(unsigned __int8 *)(a1 + 56), v22, v23);
  uint64_t v28 = objc_msgSend_dictionaryWithObjectsAndKeys_(v20, v25, (uint64_t)v24, v26, v27, @"__kIMAVChatPauseStateKey", 0);
  sub_224FC14B0(@"__kIMAVChatParticipantPauseChangedNotification", v12, v28);
}

void sub_224FC4A94(uint64_t a1, const char *a2)
{
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 56), @"localIPChange");
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_remoteParticipants(v20, v3, v4, v5, v6);
  BOOL v12 = objc_msgSend_lastObject(v7, v8, v9, v10, v11);

  uint64_t v17 = objc_msgSend_vcPartyID(v12, v13, v14, v15, v16);
  objc_msgSend_conferencePersonWithID_localIPDidChange_(v20, v18, (uint64_t)v17, *(void *)(a1 + 48), v19);
}

void sub_224FC4C84(uint64_t a1, const char *a2)
{
  objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), @"didChangeLocalVariablesForCallID");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__clearCache(v15, v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_sharedInstance(IMAVCallManager, v6, v7, v8, v9);
  objc_msgSend__sendProxyUpdate(v10, v11, v12, v13, v14);
}

void sub_224FC4DB4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "vc: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v5 = objc_msgSend__avChatForConference_callID_errorString_(*(void **)(a1 + 40), v4, *(void *)(a1 + 32), 0, @"serverDiedForConference");
  uint64_t v6 = sub_224FB12A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v11 = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_224F93000, v6, OS_LOG_TYPE_DEFAULT, "Informed about server crash for: %@  (Chat: %@)", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend_endChatWithReason_(v5, v8, 30, v9, v10);
}

void sub_224FC5710(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_msgSend_callID(*(void **)(a1 + 40), a2, a3, a4, a5);
  sub_224FBECC0(*(void **)(a1 + 48));
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t isLocalParticipant = objc_msgSend_isLocalParticipant(*(void **)(a1 + 56), v8, v9, v10, v11);
  objc_msgSend_processRelayRequestResponse_responseDict_didOriginateRequest_(v6, v13, v7, (uint64_t)v14, isLocalParticipant);
}

void sub_224FC5A98(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_msgSend_callID(*(void **)(a1 + 40), a2, a3, a4, a5);
  sub_224FBECC0(*(void **)(a1 + 48));
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t isLocalParticipant = objc_msgSend_isLocalParticipant(*(void **)(a1 + 56), v8, v9, v10, v11);
  objc_msgSend_processRelayUpdate_updateDict_didOriginateRequest_(v6, v13, v7, (uint64_t)v14, isLocalParticipant);
}

void sub_224FC5E20(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_msgSend_callID(*(void **)(a1 + 40), a2, a3, a4, a5);
  sub_224FBECC0(*(void **)(a1 + 48));
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t isLocalParticipant = objc_msgSend_isLocalParticipant(*(void **)(a1 + 56), v8, v9, v10, v11);
  objc_msgSend_processCancelRelayRequest_cancelDict_didOriginateRequest_(v6, v13, v7, (uint64_t)v14, isLocalParticipant);
}

void sub_224FC6118(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  objc_msgSend_avChat(*(void **)(a1 + 48), a2, a3, a4, a5);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend__bustedCallID(v14, v7, v8, v9, v10);
  objc_msgSend_processRemoteIPChange_callID_(v5, v12, v6, v11, v13);
}

void sub_224FC6350(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  qword_26AB79648 = MEMORY[0x22A628610](@"VCCapabilities", @"AVConference");
  id v2 = objc_alloc_init((Class)qword_26AB79648);
  uint64_t v6 = objc_msgSend__deviceRoleForAVChat_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  objc_msgSend_setDeviceRole_(v2, v7, v6, v8, v9);
  uint64_t v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    int v20 = 138412546;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = v2;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Updating capabilities for conference %@ to %@", (uint8_t *)&v20, 0x16u);
  }

  uint64_t v12 = *(void **)(a1 + 48);
  uint64_t v17 = objc_msgSend__bustedCallID(*(void **)(a1 + 40), v13, v14, v15, v16);
  objc_msgSend_updateCapabilities_forCallID_(v12, v18, (uint64_t)v2, v17, v19);
}

void sub_224FC6C58(uint64_t a1)
{
  id v5 = *(id *)(a1 + 32);
  if (!v5)
  {
    objc_msgSend_callMetadataForCallID_(*(void **)(a1 + 40), v2, *(void *)(a1 + 56), v3, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FC6D28;
  block[3] = &unk_2647111C0;
  id v6 = *(id *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 64);
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void sub_224FC6D28(uint64_t a1)
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v177 = v4;
    __int16 v178 = 1024;
    int v179 = v3;
    __int16 v180 = 2112;
    uint64_t v181 = v5;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "Updating chat %@ with call metadata (isFinalUpdate: %d): %@", buf, 0x1Cu);
  }

  if (*(void *)(a1 + 40))
  {
    if (!qword_2680BEFA0)
    {
      id v9 = (void **)MEMORY[0x22A628620]("AVConferenceFrontCaptureTime", @"AVConference");
      if (v9) {
        id v10 = *v9;
      }
      else {
        id v10 = 0;
      }
      objc_storeStrong((id *)&qword_2680BEFA0, v10);
    }
    if (!qword_2680BEFA8)
    {
      char v11 = (void **)MEMORY[0x22A628620]("AVConferenceBackCaptureTime", @"AVConference");
      if (v11) {
        uint64_t v12 = *v11;
      }
      else {
        uint64_t v12 = 0;
      }
      objc_storeStrong((id *)&qword_2680BEFA8, v12);
    }
    if (!qword_2680BEFB0)
    {
      uint64_t v13 = (void **)MEMORY[0x22A628620]("AVConferenceSessionBitRate", @"AVConference");
      if (v13) {
        uint64_t v14 = *v13;
      }
      else {
        uint64_t v14 = 0;
      }
      objc_storeStrong((id *)&qword_2680BEFB0, v14);
    }
    if (!qword_2680BEFB8)
    {
      uint64_t v15 = (void **)MEMORY[0x22A628620]("AVConferenceSessionSentBytes", @"AVConference");
      if (v15) {
        uint64_t v16 = *v15;
      }
      else {
        uint64_t v16 = 0;
      }
      objc_storeStrong((id *)&qword_2680BEFB8, v16);
    }
    if (!qword_2680BEFC0)
    {
      uint64_t v17 = (void **)MEMORY[0x22A628620]("AVConferenceSessionReceivedBytes", @"AVConference");
      if (v17) {
        uint64_t v18 = *v17;
      }
      else {
        uint64_t v18 = 0;
      }
      objc_storeStrong((id *)&qword_2680BEFC0, v18);
    }
    if (!qword_2680BEFC8)
    {
      uint64_t v19 = (void **)MEMORY[0x22A628620]("AVConferenceSessionConnectionType", @"AVConference");
      if (v19) {
        int v20 = *v19;
      }
      else {
        int v20 = 0;
      }
      objc_storeStrong((id *)&qword_2680BEFC8, v20);
    }
    uint64_t v21 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, qword_2680BEFA0, v7, v8);
    uint64_t v25 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v22, qword_2680BEFA8, v23, v24);
    id v29 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v26, qword_2680BEFB0, v27, v28);
    uint64_t v33 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v30, qword_2680BEFB8, v31, v32);
    id v175 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v34, qword_2680BEFC0, v35, v36);
    uint64_t v37 = *(void **)(a1 + 32);
    uint64_t v38 = NSNumber;
    __int16 v43 = objc_msgSend__frontCameraCaptureTime(v37, v39, v40, v41, v42);
    uint64_t v48 = objc_msgSend_integerValue(v43, v44, v45, v46, v47);
    uint64_t v53 = objc_msgSend_integerValue(v21, v49, v50, v51, v52);
    uint64_t v57 = objc_msgSend_numberWithInteger_(v38, v54, v53 + v48, v55, v56);
    objc_msgSend__setFrontCameraCaptureTime_(v37, v58, (uint64_t)v57, v59, v60);

    uint64_t v61 = *(void **)(a1 + 32);
    uint64_t v62 = NSNumber;
    BOOL v67 = objc_msgSend__backCameraCaptureTime(v61, v63, v64, v65, v66);
    uint64_t v72 = objc_msgSend_integerValue(v67, v68, v69, v70, v71);
    uint64_t v77 = objc_msgSend_integerValue(v25, v73, v74, v75, v76);
    uint64_t v81 = objc_msgSend_numberWithInteger_(v62, v78, v77 + v72, v79, v80);
    objc_msgSend__setBackCameraCaptureTime_(v61, v82, (uint64_t)v81, v83, v84);

    objc_msgSend_setDataRate_(*(void **)(a1 + 32), v85, (uint64_t)v29, v86, v87);
    uint64_t v88 = *(void **)(a1 + 32);
    uint64_t v89 = NSNumber;
    uint64_t v94 = objc_msgSend_dataUploaded(v88, v90, v91, v92, v93);
    uint64_t v99 = objc_msgSend_integerValue(v94, v95, v96, v97, v98);
    uint64_t v104 = objc_msgSend_integerValue(v33, v100, v101, v102, v103);
    uint64_t v108 = objc_msgSend_numberWithInteger_(v89, v105, v104 + v99, v106, v107);
    objc_msgSend_setDataUploaded_(v88, v109, (uint64_t)v108, v110, v111);

    uint64_t v112 = *(void **)(a1 + 32);
    uint64_t v113 = NSNumber;
    uint64_t v118 = objc_msgSend_dataDownloaded(v112, v114, v115, v116, v117);
    uint64_t v123 = objc_msgSend_integerValue(v118, v119, v120, v121, v122);
    uint64_t v128 = objc_msgSend_integerValue(v175, v124, v125, v126, v127);
    uint64_t v132 = objc_msgSend_numberWithInteger_(v113, v129, v128 + v123, v130, v131);
    objc_msgSend_setDataDownloaded_(v112, v133, (uint64_t)v132, v134, v135);

    if (qword_2680BEFC8)
    {
      uint64_t v139 = *(void **)(a1 + 32);
      uint64_t v140 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v136, qword_2680BEFC8, v137, v138);
      uint64_t v145 = objc_msgSend_intValue(v140, v141, v142, v143, v144);
      objc_msgSend__setConnectionType_(v139, v146, v145, v147, v148);
    }
    if (qword_26AB79560)
    {
      uint64_t v149 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v136, qword_26AB79560, v137, v138);
      uint64_t v154 = v149;
      if (v149)
      {
        uint64_t v155 = *(void **)(a1 + 32);
        if (objc_msgSend_integerValue(v149, v150, v151, v152, v153)) {
          objc_msgSend__setLocalNetworkConnectionType_(v155, v156, 1, v157, v158);
        }
        else {
          objc_msgSend__setLocalNetworkConnectionType_(v155, v156, 2, v157, v158);
        }
      }
    }
    uint64_t v159 = qword_26AB79568;
    if (qword_26AB79568)
    {
      unsigned int v160 = objc_msgSend_objectForKey_(*(void **)(a1 + 40), v136, qword_26AB79568, v137, v138);
      __int16 v165 = v160;
      if (v160)
      {
        int v166 = *(void **)(a1 + 32);
        if (objc_msgSend_integerValue(v160, v161, v162, v163, v164)) {
          objc_msgSend__setRemoteNetworkConnectionType_(v166, v167, 1, v168, v169);
        }
        else {
          objc_msgSend__setRemoteNetworkConnectionType_(v166, v167, 2, v168, v169);
        }
      }
    }
    if (*(unsigned char *)(a1 + 48)) {
      objc_msgSend_setMetadataFinalized(*(void **)(a1 + 32), v136, v159, v137, v138);
    }
    uint64_t v170 = objc_msgSend_sharedInstance(IMAVCallManager, v136, v159, v137, v138);
    objc_msgSend__sendProxyUpdate(v170, v171, v172, v173, v174);
  }
}

uint64_t sub_224FC7584()
{
  id v0 = objc_alloc_init(IMAVLocalPreviewClient);
  uint64_t v1 = qword_26AB796E0;
  qword_26AB796E0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_224FC97E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__updatePreviewState(*(void **)(a1 + 32), a2, a3, a4, a5);
}

uint64_t sub_224FCA718()
{
  id v0 = objc_alloc_init(IMAVDaemonController);
  uint64_t v1 = qword_26AB796E8;
  qword_26AB796E8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_224FCAAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_224FCAAE8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = objc_msgSend_isValid(*(void **)(*(void *)(a1 + 32) + 16), a2, a3, a4, a5);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_224FCAC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_224FCAC20(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = objc_msgSend_isValid(*(void **)(*(void *)(a1 + 32) + 8), a2, a3, a4, a5);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_224FCAE58(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) != 0;
  return result;
}

uint64_t sub_224FCAF34(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16) != 0;
  return result;
}

void sub_224FCAFC4(uint64_t a1)
{
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up LOCAL object", v12, 2u);
  }

  objc_msgSend_setTarget_(*(void **)(*(void *)(a1 + 32) + 16), v3, 0, v4, v5);
  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 16), v6, v7, v8, v9);
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = 0;
}

void sub_224FCB0D0(uint64_t a1)
{
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up REMOTE object", v9, 2u);
  }

  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 8), v3, v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = 0;
}

void sub_224FCB2A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_224FCB2C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = objc_msgSend_count(*(void **)(*(void *)(a1 + 32) + 40), a2, a3, a4, a5);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_224FCB454(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v11 = 138412290;
    uint64_t v12 = v6;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Adding listener with ID: %@", (uint8_t *)&v11, 0xCu);
  }

  return objc_msgSend_addObject_(*(void **)(*(void *)(a1 + 32) + 40), v7, *(void *)(a1 + 40), v8, v9);
}

uint64_t sub_224FCB5FC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = objc_msgSend_containsObject_(*(void **)(a1[4] + 40), a2, a1[5], a4, a5);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void sub_224FCB7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224FCB7C8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v6 = objc_msgSend_containsObject_(*(void **)(a1[4] + 40), a2, a1[5], a4, a5);
  uint64_t v7 = sub_224FB12A0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = a1[5];
      int v15 = 138412290;
      uint64_t v16 = v9;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Removing listener with ID: %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend_removeObject_(*(void **)(a1[4] + 40), v10, a1[5], v11, v12);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (v8)
    {
      uint64_t v13 = a1[5];
      uint64_t v14 = *(void *)(a1[4] + 40);
      int v15 = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring we don't have a listener with ID: %@   (%@)", (uint8_t *)&v15, 0x16u);
    }
  }
}

void sub_224FCBC44(uint64_t a1)
{
  id v1 = *(id *)(a1 + 48);
  _IMGetAVAgentRemoteObject();
}

void sub_224FCBCEC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_msgSend__remoteObjectCleanup(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(NSObject **)(v11 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FCC018;
  block[3] = &unk_264710AF8;
  void block[4] = v11;
  id v13 = v5;
  id v47 = v13;
  dispatch_sync(v12, block);
  uint64_t v14 = *(void *)(a1 + 32);
  int v15 = *(NSObject **)(v14 + 80);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = sub_224FCC024;
  v45[3] = &unk_264710F40;
  v45[4] = v14;
  dispatch_sync(v15, v45);
  objc_msgSend__localObjectCleanup(*(void **)(a1 + 32), v16, v17, v18, v19);
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(NSObject **)(v20 + 80);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_224FCC08C;
  v43[3] = &unk_264710AF8;
  v43[4] = v20;
  id v22 = v13;
  id v44 = v22;
  dispatch_sync(v21, v43);
  if (objc_msgSend_remoteObjectExists(*(void **)(a1 + 32), v23, v24, v25, v26))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(NSObject **)(v27 + 64);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_224FCC11C;
    v42[3] = &unk_264710F40;
    v42[4] = v27;
    dispatch_sync(v28, v42);
    uint64_t v29 = *(void *)(a1 + 32);
    uint64_t v30 = *(NSObject **)(v29 + 80);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = sub_224FCC200;
    v41[3] = &unk_264710F40;
    v41[4] = v29;
    dispatch_sync(v30, v41);
    objc_msgSend_setupComplete_info_(*(void **)(*(void *)(a1 + 32) + 24), v31, 1, (uint64_t)v6, v32);
  }
  else
  {
    uint64_t v33 = sub_224FB12A0();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v49 = v34;
      _os_log_impl(&dword_224F93000, v33, OS_LOG_TYPE_DEFAULT, "  Failed to build remote object for listener: %@", buf, 0xCu);
    }

    uint64_t v35 = sub_224FB12A0();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_224F93000, v35, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to launch and connect to daemon", buf, 2u);
    }

    objc_msgSend__localObjectCleanup(*(void **)(a1 + 32), v36, v37, v38, v39);
  }
  uint64_t v40 = *(void *)(a1 + 40);
  if (v40) {
    (*(void (**)(void))(v40 + 16))();
  }
}

void sub_224FCC018(uint64_t a1)
{
}

void sub_224FCC024(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v7, v6, *(void *)(a1 + 32), *MEMORY[0x263F4A4B8], *(void *)(*(void *)(a1 + 32) + 16));
}

void sub_224FCC08C(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F4A598]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  objc_msgSend_connection(*(void **)(a1 + 40), v4, v5, v6, v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_initWithTarget_connection_protocol_(v2, v8, v3, (uint64_t)v12, (uint64_t)&unk_26D8724A8);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v9;
}

void sub_224FCC11C(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "  Built object: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v4, v5, v6, v7);
  objc_msgSend_addObserver_selector_name_object_(v8, v9, *(void *)(a1 + 32), (uint64_t)sel_remoteObjectDiedNotification_, *MEMORY[0x263F4A4E0], *(void *)(*(void *)(a1 + 32) + 8));
}

void sub_224FCC200(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v7, v6, *(void *)(a1 + 32), (uint64_t)sel_localObjectDiedNotification_, *MEMORY[0x263F4A4B8], *(void *)(*(void *)(a1 + 32) + 16));
}

void sub_224FCC270(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_mainThread(MEMORY[0x263F08B88], a2, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___im_performBlock_afterDelay_modes_(v7, v5, (uint64_t)&unk_26D85A6F0, *MEMORY[0x263F4A4F0], v6, 0.0);
}

id sub_224FCC2D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = (id)objc_msgSend_standardControls(MEMORY[0x263F4A5D8], a2, a3, a4, a5);
  return (id)objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v6, v7, v8, v9);
}

void sub_224FCC5BC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 97) = 0;
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72));
  if (objc_msgSend_remoteObjectExists(*(void **)(a1 + 32), v2, v3, v4, v5))
  {
    objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v6, v7, v8, v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v12, v10, @"__kIMAVDaemonDidConnectNotification", 0, v11);
  }
}

uint64_t sub_224FCC990(uint64_t a1)
{
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, " ...auto reconnecting", v8, 2u);
  }

  return objc_msgSend__listenerSetUpdated(*(void **)(a1 + 32), v3, v4, v5, v6);
}

void sub_224FCCCF4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = (const char *)objc_msgSend_selector(v7, v3, v4, v5, v6);
    uint64_t v9 = NSStringFromSelector(v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "Not connected to the avDaemon, not forwarding invocation: (invocation %@,  selector  %@,  remoteObject %@)", (uint8_t *)&v11, 0x20u);
  }
}

void sub_224FCCDD8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char isLocalObjectValidOnQueue = objc_msgSend___isLocalObjectValidOnQueue_(*(void **)(a1 + 32), a2, *(void *)(*(void *)(a1 + 32) + 80), a4, a5);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_224FCCE80;
  block[3] = &unk_2647111C0;
  char v11 = isLocalObjectValidOnQueue;
  void block[4] = v7;
  id v10 = *(id *)(a1 + 40);
  dispatch_sync(v8, block);
}

void sub_224FCCE80(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = objc_msgSend_listener(*(void **)(a1 + 32), a2, a3, a4, a5);
    int isSetupComplete = objc_msgSend_isSetupComplete(v6, v7, v8, v9, v10);

    if (isSetupComplete)
    {
      if (objc_msgSend___isRemoteObjectValidOnQueue_(*(void **)(a1 + 32), v12, 0, v13, v14))
      {
        __int16 v15 = sub_224FB12A0();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void **)(a1 + 40);
          uint64_t v21 = (const char *)objc_msgSend_selector(v20, v16, v17, v18, v19);
          id v22 = NSStringFromSelector(v21);
          uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
          int v34 = 138412802;
          uint64_t v35 = v20;
          __int16 v36 = 2112;
          uint64_t v37 = v22;
          __int16 v38 = 2112;
          uint64_t v39 = v23;
          _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "Forwarding invocation to avDaemon: (invocation %@,  selector  %@,  remoteObject %@)", (uint8_t *)&v34, 0x20u);
        }
        uint64_t v28 = objc_msgSend_defaultBroadcaster(MEMORY[0x263F4A5E8], v24, v25, v26, v27);
        uint64_t v30 = objc_msgSend_broadcastProxyForTarget_messageContext_protocol_(v28, v29, *(void *)(*(void *)(a1 + 32) + 8), 0, (uint64_t)&unk_26D872570);

        if (v30) {
          objc_msgSend_invokeWithTarget_(*(void **)(a1 + 40), v31, (uint64_t)v30, v32, v33);
        }
      }
    }
  }
}

void sub_224FCD4F8()
{
}

uint64_t sub_224FCD528(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 >= 7)
  {
    id v2 = sub_224FB12A0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = a1;
      _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "[WARN] AVConferenceConnType unknown/unhandled type: %d", (uint8_t *)v4, 8u);
    }
  }
  return a1;
}

uint64_t sub_224FCD5D8(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 >= 7 && (a1 - 128) >= 7)
  {
    uint64_t v3 = sub_224FB12A0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = a1;
      _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] AVConferenceNATType unknown/unhandled type: %d", (uint8_t *)v4, 8u);
    }
  }
  return a1;
}

uint64_t sub_224FCD698(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 >= 0x20)
  {
    id v2 = sub_224FB12A0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = a1;
      _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVChatEndedReason unknown/unhandled reason: %d", (uint8_t *)v4, 8u);
    }
  }
  return a1;
}

uint64_t sub_224FCD748(int a1)
{
  if (a1 == -2) {
    return 1;
  }
  else {
    return 2 * (a1 == -1);
  }
}

uint64_t sub_224FCD760(int a1)
{
  if ((a1 - 1000) >= 0x12) {
    return 0;
  }
  else {
    return (a1 - 999);
  }
}

uint64_t sub_224FCD774(int a1)
{
  if ((a1 - 32000) >= 0x18) {
    return 0;
  }
  else {
    return (a1 - 31999);
  }
}

uint64_t sub_224FCD790(int a1)
{
  if ((a1 - 3000) >= 0xC) {
    return 0;
  }
  else {
    return (a1 - 2999);
  }
}

uint64_t sub_224FCD7A4(int a1)
{
  if (a1 > 6600)
  {
    if (a1 == 6900) {
      int v6 = 10;
    }
    else {
      int v6 = 0;
    }
    if (a1 == 6801) {
      int v7 = 9;
    }
    else {
      int v7 = v6;
    }
    if (a1 == 6800) {
      unsigned int v8 = 8;
    }
    else {
      unsigned int v8 = v7;
    }
    if (a1 == 6701) {
      int v9 = 7;
    }
    else {
      int v9 = 0;
    }
    if (a1 == 6700) {
      int v10 = 6;
    }
    else {
      int v10 = v9;
    }
    if (a1 == 6601) {
      unsigned int v11 = 5;
    }
    else {
      unsigned int v11 = v10;
    }
    if (a1 <= 6799) {
      return v11;
    }
    else {
      return v8;
    }
  }
  else
  {
    if (a1 == 6600) {
      unsigned int v1 = 4;
    }
    else {
      unsigned int v1 = 0;
    }
    if (a1 == 6500) {
      unsigned int v1 = 3;
    }
    if (a1 == 6400) {
      unsigned int v1 = 11;
    }
    if (a1 == 6100) {
      int v2 = 12;
    }
    else {
      int v2 = 0;
    }
    if (a1 == 6001) {
      int v3 = 2;
    }
    else {
      int v3 = v2;
    }
    if (a1 == 6000) {
      unsigned int v4 = 1;
    }
    else {
      unsigned int v4 = v3;
    }
    if (a1 <= 6399) {
      return v4;
    }
    else {
      return v1;
    }
  }
}

uint64_t sub_224FCD88C(int a1)
{
  if ((a1 - 7000) >= 3) {
    return 0;
  }
  else {
    return (a1 - 6999);
  }
}

uint64_t sub_224FCD8A8(int a1)
{
  if ((a1 - 8000) >= 7) {
    return 0;
  }
  else {
    return (a1 - 7999);
  }
}

uint64_t sub_224FCD8C4(int a1)
{
  if ((a1 - 5000) > 0x57) {
    return 0;
  }
  else {
    return dword_224FD28C8[a1 - 5000];
  }
}

uint64_t sub_224FCD8EC(unint64_t a1)
{
  int v1 = a1;
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 < 4) {
    return (a1 + 1);
  }
  int v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] IMAVInterfaceNetworkCheckResult unknown/unhandled result: %d", (uint8_t *)v4, 8u);
  }

  return 0;
}

uint64_t sub_224FCF320(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 40) != 32001)
  {
    uint64_t v41 = sub_224FB12A0();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v51) = 0;
      _os_log_impl(&dword_224F93000, v41, OS_LOG_TYPE_DEFAULT, " => Will not run network check", (uint8_t *)&v51, 2u);
    }

    goto LABEL_17;
  }
  int v6 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB58], a2, a3, a4, a5);
  objc_msgSend_objectForKey_(v6, v7, @"gk-p2p-post-connectivity-check", v8, v9);
  int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  int v15 = objc_msgSend_intValue(v10, v11, v12, v13, v14);
  uint64_t v16 = sub_224FB12A0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v51 = 138412290;
    uint64_t v52 = v10;
    _os_log_impl(&dword_224F93000, v16, OS_LOG_TYPE_DEFAULT, "Bag value key for connectivity check: %@", (uint8_t *)&v51, 0xCu);
  }

  uint64_t v17 = sub_224FB12A0();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = @"NO";
    if (v15 > 0) {
      uint64_t v18 = @"YES";
    }
    int v51 = 138412290;
    uint64_t v52 = v18;
    _os_log_impl(&dword_224F93000, v17, OS_LOG_TYPE_DEFAULT, " => Will run check: %@", (uint8_t *)&v51, 0xCu);
  }

  if (v15 < 1)
  {
LABEL_17:
    objc_msgSend__setNetworkCheckResult_(*(void **)(a1 + 32), v19, -1, v20, v21);
    goto LABEL_18;
  }
  id v22 = sub_224FB12A0();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v51) = 0;
    _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "Running network connectivity check", (uint8_t *)&v51, 2u);
  }

  BOOL v27 = objc_msgSend__localNetworkConnectionType(*(void **)(a1 + 32), v23, v24, v25, v26) == 2;
  uint64_t v32 = objc_msgSend_sharedInstance(IMAVInterface, v28, v29, v30, v31);
  int v35 = objc_msgSend__checkNetworkForChat_requiresWifi_(v32, v33, *(void *)(a1 + 32), v27, v34);

  __int16 v36 = sub_224FB12A0();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    int v51 = 67109120;
    LODWORD(v52) = v35;
    _os_log_impl(&dword_224F93000, v36, OS_LOG_TYPE_DEFAULT, " => Done with result: %d", (uint8_t *)&v51, 8u);
  }

LABEL_18:
  uint64_t v42 = objc_msgSend_sharedInstance(IMAVInterface, v37, v38, v39, v40);
  objc_msgSend__runPingTestForChat_(v42, v43, *(void *)(a1 + 32), v44, v45);

  objc_msgSend___sendEndCallMetricToAWDWithReason_andError_(*(void **)(a1 + 32), v46, *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 40), v47);
  return objc_msgSend___sendEndCallMetricToViceroyWithReason_andError_(*(void **)(a1 + 32), v48, *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 40), v49);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

uint64_t FTAWDLogCallConnected()
{
  return MEMORY[0x270F28168]();
}

uint64_t FTAWDLogCallEnded()
{
  return MEMORY[0x270F28178]();
}

uint64_t FTAWDLogCallEndedViceroy()
{
  return MEMORY[0x270F28180]();
}

uint64_t FTAWDLogCallFailed()
{
  return MEMORY[0x270F28188]();
}

uint64_t FTAWDLogCallInterruptionBegan()
{
  return MEMORY[0x270F28190]();
}

uint64_t FTAWDLogCallInterruptionEnded()
{
  return MEMORY[0x270F28198]();
}

uint64_t FTAWDLogCallStarted()
{
  return MEMORY[0x270F281D0]();
}

uint64_t FTAWDSetSubmissionDate()
{
  return MEMORY[0x270F281D8]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x270F3CAC0]();
}

uint64_t IMGetDomainIntForKey()
{
  return MEMORY[0x270F3CAD0]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x270F3CAD8]();
}

uint64_t IMGetMainBundleIdentifier()
{
  return MEMORY[0x270F3CAE0]();
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x270F3CAF0]();
}

uint64_t IMLogSimulateCrashForException()
{
  return MEMORY[0x270F3CAF8]();
}

uint64_t IMOperationalAccountForService()
{
  return MEMORY[0x270F3CB10]();
}

uint64_t IMPerformPingTest()
{
  return MEMORY[0x270F3CB18]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x270F3CB90]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x270F3CBA0]();
}

uint64_t IMTimeOfDay()
{
  return MEMORY[0x270F3CBB8]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CBC0]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x270F3CBC8]();
}

uint64_t MarcoLogCallInfo()
{
  return MEMORY[0x270F496C0]();
}

uint64_t MarcoShouldLog()
{
  return MEMORY[0x270F496E0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x270EF2C40]((__n128)aSize, *(__n128 *)&aSize.height);
}

uint64_t SecureRandomUInt()
{
  return MEMORY[0x270F3CBD8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _FTAreIDsEquivalent()
{
  return MEMORY[0x270F281E8]();
}

uint64_t _IMGetAVAgentRemoteObject()
{
  return MEMORY[0x270F3CBE0]();
}

uint64_t _IMLoggingSetFailureReason()
{
  return MEMORY[0x270F3CBE8]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x270F3CBF8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x270F3CC00]();
}

uint64_t im_main_thread()
{
  return MEMORY[0x270F3CC08]();
}

uint64_t im_notify_register_dispatch()
{
  return MEMORY[0x270F3CC10]();
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  unsigned int v4 = (const char *)MEMORY[0x270F9AAC8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}