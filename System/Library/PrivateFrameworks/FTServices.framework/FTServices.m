uint64_t sub_1A7BC1F08()
{
  uint64_t result;

  qword_1EB47C7F8 = MEMORY[0x1AD0D4F50](@"MCProfileConnection", @"ManagedConfiguration");
  result = MEMORY[0x1AD0D4F50](@"MCRestrictionManager", @"ManagedConfiguration");
  qword_1EB47C800 = result;
  return result;
}

void sub_1A7BC1FC8(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  v4 = objc_msgSend_initWithObjects_(v2, v3, @"3Gvenice", @"venice", 0);
  qword_1EB47C810 = MGRegisterForUpdates();
  objc_msgSend__updateCapabilities(*(void **)(a1 + 32), v5, v6);
}

void sub_1A7BC2A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

uint64_t sub_1A7BC5F20()
{
  qword_1EB47C858 = objc_alloc_init(FTSelectedPNRSubscription);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A7BC5F5C()
{
  qword_1EB47C878 = objc_alloc_init(FTEntitlementSupport);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A7BC5F98()
{
  qword_1EB47C880 = objc_alloc_init(FTUserConfiguration);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A7BC5FD4()
{
  v0 = [FTServiceStatus alloc];
  qword_1EB47C840 = objc_msgSend_initPrivate(v0, v1, v2);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A7BC6014()
{
  qword_1EB47C850 = objc_alloc_init(FTDeviceSupport);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A7BC6050(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__registerForServiceStatusNotifications(*(void **)(a1 + 32), a2, a3);
  objc_msgSend__registerForCarrierNotifications(*(void **)(a1 + 32), v4, v5);
  objc_msgSend__registerForCapabilityNotifications(*(void **)(a1 + 32), v6, v7);
  objc_msgSend__registerForLockdownNotifications(*(void **)(a1 + 32), v8, v9);
  uint64_t v11 = *(void *)(a1 + 32);

  return MEMORY[0x1F4181798](v11, sel__registerForManagedConfigurationNotifications, v10);
}

void sub_1A7BC63D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7BC7D90(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, a3);
  objc_msgSend__correctServerTimestampForDriftOnMessage_currentDate_(v4, v7, v5, v6);

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1A7BC8108;
  v50[3] = &unk_1E5D1ABF8;
  id v51 = *(id *)(a1 + 40);
  char v57 = *(unsigned char *)(a1 + 88);
  id v52 = *(id *)(a1 + 48);
  id v53 = *(id *)(a1 + 56);
  id v54 = *(id *)(a1 + 64);
  id v55 = *(id *)(a1 + 72);
  id v56 = *(id *)(a1 + 80);
  v8 = (void (**)(void))MEMORY[0x1AD0D56D0](v50);
  if (!objc_msgSend_wantsPushSignatures(*(void **)(a1 + 40), v9, v10)
    || (objc_msgSend_ignorePushSigHeaders(*(void **)(a1 + 40), v11, v12) & 1) != 0)
  {
    goto LABEL_8;
  }
  int v15 = _os_feature_enabled_impl();
  v16 = *(void **)(a1 + 40);
  if (!v15)
  {
    int v45 = *(unsigned __int8 *)(a1 + 88);
    v29 = objc_msgSend_pushToken(v16, v13, v14);
    v32 = objc_msgSend_pushCertificate(*(void **)(a1 + 40), v30, v31);
    v35 = (__SecKey *)objc_msgSend_pushPublicKey(*(void **)(a1 + 40), v33, v34);
    v38 = (__SecKey *)objc_msgSend_pushPrivateKey(*(void **)(a1 + 40), v36, v37);
    v39 = *(void **)(a1 + 56);
    v40 = *(void **)(a1 + 64);
    v41 = *(void **)(a1 + 48);
    v44 = objc_msgSend_serverTimestamp(*(void **)(a1 + 40), v42, v43);
    sub_1A7BC875C(v45, v29, v32, v35, v38, v41, v39, v40, v44, @"push", 0, *(void **)(a1 + 72));

LABEL_8:
    v8[2](v8);
    goto LABEL_9;
  }
  v17 = *(void **)(a1 + 48);
  v18 = *(void **)(a1 + 56);
  v19 = objc_msgSend_pushToken(v16, v13, v14);
  v20 = sub_1A7BCCA54(v17, v18, v19, *(void **)(a1 + 64));

  v23 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v21, v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v20;
    _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, "Using push signing API to sign { signatureBody: %@ }", buf, 0xCu);
  }

  v24 = *(void **)(a1 + 32);
  v27 = objc_msgSend_serverTimestamp(*(void **)(a1 + 40), v25, v26);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1A7BC8A4C;
  v46[3] = &unk_1E5D1AC20;
  char v49 = *(unsigned char *)(a1 + 88);
  id v47 = *(id *)(a1 + 72);
  v48 = v8;
  objc_msgSend_signDataWithPushIdentity_serverTimestamp_withCompletion_(v24, v28, (uint64_t)v20, v27, v46);

LABEL_9:
}

uint64_t sub_1A7BC8108(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t *)(a1 + 32);
  uint64_t v5 = objc_msgSend_certDataArray(*(void **)(a1 + 32), a2, a3);
  int v110 = objc_msgSend_count(v5, v6, v7);

  uint64_t v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1A7BFD9D4(v4, v10);
  }
  v113 = (void **)v4;

  int v11 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v14 = objc_msgSend_pushToken(*(void **)(a1 + 32), v12, v13);
  v17 = objc_msgSend_IDCertificate(*(void **)(a1 + 32), v15, v16);
  v20 = (__SecKey *)objc_msgSend_identityPublicKey(*(void **)(a1 + 32), v18, v19);
  v23 = (__SecKey *)objc_msgSend_identityPrivateKey(*(void **)(a1 + 32), v21, v22);
  v24 = *(void **)(a1 + 48);
  v25 = *(void **)(a1 + 56);
  uint64_t v26 = *(void **)(a1 + 40);
  v29 = objc_msgSend_serverTimestamp(*(void **)(a1 + 32), v27, v28);
  uint64_t v116 = a1;
  v105 = (CFMutableDictionaryRef *)(a1 + 64);
  sub_1A7BC875C(v11, v14, v17, v20, v23, v26, v24, v25, v29, @"id", 0, *(void **)(a1 + 64));

  if (v110 == 1)
  {
    v32 = v113;
    uint64_t v33 = v116;
    if ((objc_msgSend_isMultipleAuthCertCapable(*v113, v30, v31) & 1) == 0)
    {
      uint64_t v34 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v30, v31);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_1A7BFD950((uint64_t)v113);
      }

      int v111 = *(unsigned __int8 *)(v116 + 80);
      uint64_t v37 = objc_msgSend_pushToken(*(void **)(v116 + 32), v35, v36);
      v114 = objc_msgSend_certDataArray(*(void **)(v116 + 32), v38, v39);
      v41 = objc_msgSend_objectAtIndex_(v114, v40, 0);
      v44 = objc_msgSend_publicKeyArray(*(void **)(v116 + 32), v42, v43);
      v46 = (__SecKey *)objc_msgSend_objectAtIndex_(v44, v45, 0);
      char v49 = objc_msgSend_privateKeyArray(*(void **)(v116 + 32), v47, v48);
      id v51 = (__SecKey *)objc_msgSend_objectAtIndex_(v49, v50, 0);
      id v53 = *(void **)(v116 + 48);
      id v52 = *(void **)(v116 + 56);
      id v54 = *(void **)(v116 + 40);
      char v57 = objc_msgSend_serverTimestamp(*(void **)(v116 + 32), v55, v56);
      sub_1A7BC875C(v111, v37, v41, v46, v51, v54, v53, v52, v57, @"auth", 0, *(void **)(v116 + 64));

      uint64_t v33 = v116;
      uint64_t v60 = objc_msgSend_userIDArray(*(void **)(v116 + 32), v58, v59);
      v62 = objc_msgSend_objectAtIndex_(v60, v61, 0);

      if (v62)
      {
        CFDictionarySetValue(*v105, @"x-auth-user-id", v62);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_1A7BFD8C4();
      }

      v101 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v102, v103);
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG)) {
        sub_1A7BFD7BC((uint64_t)v105);
      }
LABEL_30:

      return (*(uint64_t (**)(void))(*(void *)(v33 + 72) + 16))();
    }
  }
  else
  {
    v32 = v113;
    uint64_t v33 = v116;
    if (v110 > 1)
    {
LABEL_11:
      v63 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v30, v31);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
        sub_1A7BFD840((uint64_t)v32);
      }

      if (v110 >= 1)
      {
        uint64_t v66 = 0;
        uint64_t v67 = v110;
        if (v110 <= 1uLL) {
          uint64_t v67 = 1;
        }
        uint64_t v106 = v67;
        do
        {
          v68 = objc_msgSend_stringWithFormat_(NSString, v64, @"-%d", v66);
          int v112 = *(unsigned __int8 *)(v33 + 80);
          v109 = objc_msgSend_pushToken(*(void **)(v33 + 32), v69, v70);
          v115 = objc_msgSend_certDataArray(*(void **)(v33 + 32), v71, v72);
          v74 = objc_msgSend_objectAtIndex_(v115, v73, v66);
          v108 = objc_msgSend_publicKeyArray(*(void **)(v33 + 32), v75, v76);
          uint64_t v78 = objc_msgSend_objectAtIndex_(v108, v77, v66);
          v81 = objc_msgSend_privateKeyArray(*(void **)(v116 + 32), v79, v80);
          v83 = (__SecKey *)objc_msgSend_objectAtIndex_(v81, v82, v66);
          v107 = *(void **)(v116 + 48);
          v84 = *(void **)(v116 + 56);
          v85 = *(void **)(v116 + 40);
          v88 = objc_msgSend_serverTimestamp(*(void **)(v116 + 32), v86, v87);
          v89 = (__SecKey *)v78;
          uint64_t v33 = v116;
          sub_1A7BC875C(v112, v109, v74, v89, v83, v85, v107, v84, v88, @"auth", v68, *(void **)(v116 + 64));

          v90 = v68;
          v92 = objc_msgSend_stringWithFormat_(NSString, v91, @"x-auth-user-id%@", v68);
          v95 = objc_msgSend_userIDArray(*(void **)(v116 + 32), v93, v94);
          v97 = objc_msgSend_objectAtIndex_(v95, v96, v66);

          if (v97)
          {
            CFDictionarySetValue(*v105, v92, v97);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v118 = v92;
            __int16 v119 = 2080;
            v120 = "dictionary";
            _os_log_error_impl(&dword_1A7BC0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
          }

          v100 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v98, v99);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v92;
            _os_log_debug_impl(&dword_1A7BC0000, v100, OS_LOG_TYPE_DEBUG, "   adding userID: %@", buf, 0xCu);
          }

          ++v66;
        }
        while (v106 != v66);
      }
      v101 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v64, v65);
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG)) {
        sub_1A7BFD7BC((uint64_t)v105);
      }
      goto LABEL_30;
    }
  }
  if (objc_msgSend_isMultipleAuthCertCapable(*v32, v30, v31)) {
    goto LABEL_11;
  }
  return (*(uint64_t (**)(void))(*(void *)(v33 + 72) + 16))();
}

void sub_1A7BC875C(int a1, void *a2, void *a3, __SecKey *a4, __SecKey *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  id v19 = a3;
  v20 = a12;
  v21 = v20;
  if (v19 && a5 && a10 && v20)
  {
    value = v19;
    v44 = 0;
    id v45 = 0;
    uint64_t v22 = a11;
    id v23 = a10;
    _FTGenerateNonceAndSignatureFromComponents(a4, a5, a6, a7, a2, a8, a9, &v45, &v44);
    id v24 = v45;
    uint64_t v26 = v44;
    if (v22)
    {
      v27 = v22;
      objc_msgSend_stringWithFormat_(NSString, v25, @"x-%@-cert%@", v23, v22);
    }
    else
    {
      v27 = &stru_1EFE07F40;
      objc_msgSend_stringWithFormat_(NSString, v25, @"x-%@-cert%@", v23, &stru_1EFE07F40);
    uint64_t v28 = };
    v30 = objc_msgSend_stringWithFormat_(NSString, v29, @"x-%@-nonce%@", v23, v27);
    v32 = objc_msgSend_stringWithFormat_(NSString, v31, @"x-%@-sig%@", v23, v27);

    if (a1)
    {
      id v19 = value;
      CFDictionarySetValue(v21, v28, value);
      id v35 = v24;
      if (v35)
      {
        CFDictionarySetValue(v21, v30, v35);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_1A7BFDA50();
      }

      id v37 = v26;
      if (!v37)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
    else
    {
      id v19 = value;
      uint64_t v36 = objc_msgSend__FTStringFromBaseData(value, v33, v34);
      if (v36)
      {
        CFDictionarySetValue(v21, v28, v36);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_1A7BFDA50();
      }

      v40 = objc_msgSend__FTStringFromBaseData(v24, v38, v39);
      if (v40)
      {
        CFDictionarySetValue(v21, v30, v40);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_1A7BFDA50();
      }

      objc_msgSend__FTStringFromBaseData(v26, v41, v42);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
LABEL_27:
        }
          sub_1A7BFDA50();
LABEL_28:

        goto LABEL_29;
      }
    }
    CFDictionarySetValue(v21, v32, v37);
    goto LABEL_28;
  }
LABEL_29:
}

void sub_1A7BC8A4C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = v9;
  if (*(unsigned char *)(a1 + 48))
  {
    id v13 = v9;
  }
  else
  {
    objc_msgSend__FTStringFromBaseData(v9, v10, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v16 = v13;
  if (*(unsigned char *)(a1 + 48))
  {
    id v17 = v7;
  }
  else
  {
    objc_msgSend__FTStringFromBaseData(v7, v14, v15);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  id v19 = IDSPEMFormatCertificatesForPushHeader();
  v21 = objc_msgSend_base64EncodedStringWithOptions_(v19, v20, 0);

  if (v21)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"x-push-cert", v21);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A7BFDBE4();
  }

  id v22 = v16;
  if (v22)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"x-push-nonce", v22);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A7BFDB58();
  }

  id v23 = v18;
  if (v23)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"x-push-sig", v23);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A7BFDACC();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1A7BC8BF0(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v11 = a4;
  if (v7)
  {
    objc_msgSend_addEntriesFromDictionary_(*(void **)(a1 + 40), v9, (uint64_t)v7);
  }
  else
  {
    uint64_t v14 = objc_msgSend_nonce(MEMORY[0x1E4F6C3B8], v9, v10);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = *(void **)(a1 + 32);
      v18 = objc_msgSend_signingSession(v17, v15, v16);
      *(_DWORD *)buf = 138412802;
      v50 = v17;
      __int16 v51 = 2112;
      id v52 = v18;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEFAULT, "Failed to sign message {message: %@, signingSession: %@, error: %@}", buf, 0x20u);
    }
  }
  id v19 = objc_msgSend_signingDigest(v11, v12, v13);

  if (v19)
  {
    id v22 = *(void **)(a1 + 32);
    id v23 = objc_msgSend_signingDigest(v11, v20, v21);
    objc_msgSend_setBaaSigningDigest_(v22, v24, (uint64_t)v23);
  }
  if (v8)
  {
    v25 = objc_msgSend_domain(v8, v20, v21);
    int isEqualToString = objc_msgSend_isEqualToString_(v25, v26, @"IDSBAASignerErrorDomain");

    if (isEqualToString)
    {
      objc_msgSend_setBaaSigningError_(*(void **)(a1 + 32), v28, (uint64_t)v8);
    }
    else
    {
      id v42 = v11;
      id v43 = v7;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v30 = objc_msgSend_underlyingErrors(v8, v28, v29);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v44, v48, 16);
      if (v32)
      {
        uint64_t v35 = v32;
        uint64_t v36 = *(void *)v45;
        while (2)
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v45 != v36) {
              objc_enumerationMutation(v30);
            }
            v38 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            uint64_t v39 = objc_msgSend_domain(v38, v33, v34);
            int v41 = objc_msgSend_isEqualToString_(v39, v40, @"IDSBAASignerErrorDomain");

            if (v41)
            {
              objc_msgSend_setBaaSigningError_(*(void **)(a1 + 32), v33, (uint64_t)v38);
              goto LABEL_21;
            }
          }
          uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v44, v48, 16);
          if (v35) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      id v11 = v42;
      id v7 = v43;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1A7BC8E84(uint64_t a1, const char *a2, uint64_t a3)
{
  v4 = objc_msgSend_baaSigner(*(void **)(a1 + 32), a2, a3);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = objc_msgSend_serverTimestamp(*(void **)(a1 + 48), v6, v7);
  id v11 = objc_msgSend_topic(*(void **)(a1 + 48), v9, v10);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A7BC8F90;
  v13[3] = &unk_1E5D1AC70;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  objc_msgSend_headersBySigningData_serverTimestamp_topic_completion_(v4, v12, v5, v8, v11, v13);
}

void sub_1A7BC8F90(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v11 = a4;
  if (v8)
  {
    uint64_t v12 = objc_msgSend_nonce(MEMORY[0x1E4F6C3B8], v9, v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v20 = 138412546;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_DEFAULT, "Failed to baa sign message {message: %@, error: %@}", (uint8_t *)&v20, 0x16u);
    }
  }
  if (v7) {
    objc_msgSend_addEntriesFromDictionary_(*(void **)(a1 + 40), v9, (uint64_t)v7);
  }
  id v14 = objc_msgSend_signingDigest(v11, v9, v10);

  if (v14)
  {
    id v17 = *(void **)(a1 + 32);
    v18 = objc_msgSend_signingDigest(v11, v15, v16);
    objc_msgSend_setBaaSigningDigest_(v17, v19, (uint64_t)v18);
  }
  objc_msgSend_setBaaSigningError_(*(void **)(a1 + 32), v15, (uint64_t)v8);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_1A7BC9244()
{
  uint64_t result = MEMORY[0x1AD0D4F50](@"APSSignDataWithIdentityRequest", @"ApplePushService");
  qword_1E97394D0 = result;
  return result;
}

void sub_1A7BC9274(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v6 = objc_msgSend_signature(v3, v4, v5);

  if (!v6)
  {
    id v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Failed to sign with push identity", buf, 2u);
    }
  }
  uint64_t v10 = objc_msgSend_certificates(v3, v7, v8);
  uint64_t v13 = objc_msgSend_count(v10, v11, v12);

  if (!v13)
  {
    uint64_t v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Failed to retrieve push certificates", buf, 2u);
    }
  }
  id v17 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v14, v15);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = objc_msgSend_signature(v3, v18, v19);
    id v23 = objc_msgSend_debugDescription(v20, v21, v22);
    uint64_t v26 = objc_msgSend_nonce(v3, v24, v25);
    uint64_t v29 = objc_msgSend_debugDescription(v26, v27, v28);
    uint64_t v32 = objc_msgSend_certificates(v3, v30, v31);
    *(_DWORD *)buf = 138412802;
    v40 = v23;
    __int16 v41 = 2112;
    id v42 = v29;
    __int16 v43 = 2112;
    long long v44 = v32;
    _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Signed with push certs { signature: %@, nonce: %@, certs: %@", buf, 0x20u);
  }
  uint64_t v33 = im_primary_queue();
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1A7BC94FC;
  v36[3] = &unk_1E5D1ACE0;
  id v34 = *(id *)(a1 + 32);
  id v37 = v3;
  id v38 = v34;
  id v35 = v3;
  dispatch_async(v33, v36);
}

void sub_1A7BC94FC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  objc_msgSend_signature(*(void **)(a1 + 32), a2, a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend_certificates(*(void **)(a1 + 32), v5, v6);
  uint64_t v10 = objc_msgSend_nonce(*(void **)(a1 + 32), v8, v9);
  (*(void (**)(uint64_t, id, void *, void *))(v4 + 16))(v4, v11, v7, v10);
}

void sub_1A7BC9780(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1A7BC97B0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1A7BC97E8(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_1A7BC988C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](a2, sel__timeoutHit, a3);
}

void sub_1A7BCBBD4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  if (objc_msgSend_length(v5, v7, v8)) {
    objc_msgSend_appendString_(*(void **)(a1 + 32), v9, @"&");
  }
  uint64_t v10 = (void *)IMCopyURLEscapedString();
  id v11 = (void *)IMCopyURLEscapedString();

  objc_msgSend_appendFormat_(*(void **)(a1 + 32), v12, @"%@=%@", v10, v11);
}

void sub_1A7BCBC84(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  objc_msgSend_addEntriesFromDictionary_(v5, v6, (uint64_t)v4);

  uint64_t v9 = objc_msgSend_additionalMessageHeaders(*(void **)(a1 + 32), v7, v8);
  objc_msgSend_addEntriesFromDictionary_(v5, v10, (uint64_t)v9);

  objc_msgSend_setMessageHeaders_(*(void **)(a1 + 40), v11, (uint64_t)v5);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = sub_1A7BCBD80;
  int v20 = &unk_1E5D1ADA0;
  uint64_t v12 = *(void **)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 48);
  id v21 = v13;
  uint64_t v22 = v14;
  objc_msgSend_setCompletionBlock_(v12, v15, (uint64_t)&v17);
  objc_msgSend_sendMessage_(*(void **)(*(void *)(a1 + 48) + 16), v16, *(void *)(a1 + 40), v17, v18, v19, v20);
}

void sub_1A7BCBD80(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v71 = a4;
    _os_log_impl(&dword_1A7BC0000, v12, OS_LOG_TYPE_DEFAULT, "Web Tunnel Response got %ld", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v68 = a4;
    _IDSLogV();
  }
  id v15 = v9;
  if ((unint64_t)(a4 - 5200) <= 7)
  {
    if (((1 << (a4 - 80)) & 0x78) == 0) {
      objc_msgSend__enterBackOffMode(*(void **)(a1 + 40), v13, v14);
    }
    objc_msgSend_sendMessage_(*(void **)(*(void *)(a1 + 40) + 8), v13, *(void *)(a1 + 32));
    goto LABEL_25;
  }
  if (a4 == 20001)
  {
    objc_msgSend_setHasAttemptedAPSDelivery_(*(void **)(a1 + 32), v13, 0);
  }
  else if (!a4)
  {
    uint64_t v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Web Tunnel Query was successful; passing along the completion information",
        buf,
        2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    objc_msgSend_handleResponseDictionary_(*(void **)(a1 + 32), v17, (uint64_t)v11, v68);
    uint64_t v18 = *(void **)(a1 + 32);
    id v21 = objc_msgSend_responseBodyData(v15, v19, v20);
    objc_msgSend_handleResponseBody_(v18, v22, (uint64_t)v21);

    id v23 = *(void **)(a1 + 32);
    uint64_t v26 = objc_msgSend_responseHeaders(v15, v24, v25);
    objc_msgSend_handleResponseHeaders_(v23, v27, (uint64_t)v26);

    uint64_t v28 = *(void **)(a1 + 32);
    uint64_t v31 = objc_msgSend_responseCode(v15, v29, v30);
    uint64_t v34 = objc_msgSend_integerValue(v31, v32, v33);
    objc_msgSend_handleResponseStatus_(v28, v35, v34);

    objc_msgSend_completionBlock(*(void **)(a1 + 32), v36, v37);
    id v38 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDeliveryMechanism_(*(void **)(a1 + 32), v39, 1);
    v40 = *(void **)(a1 + 32);
    uint64_t v43 = objc_msgSend_sentByteCount(v15, v41, v42);
    objc_msgSend_setSentByteCount_(v40, v44, v43);
    uint64_t v45 = *(void **)(a1 + 32);
    uint64_t v48 = objc_msgSend_receivedByteCount(v15, v46, v47);
    objc_msgSend_setReceivedByteCount_(v45, v49, v48);
    v50 = *(void **)(a1 + 32);
    __int16 v53 = objc_msgSend_requestStart(v15, v51, v52);
    objc_msgSend_setRequestStart_(v50, v54, (uint64_t)v53);

    uint64_t v55 = *(void **)(a1 + 32);
    v58 = objc_msgSend_requestEnd(v15, v56, v57);
    objc_msgSend_setRequestEnd_(v55, v59, (uint64_t)v58);

    uint64_t v60 = *(void **)(a1 + 32);
    v63 = objc_msgSend_responseReceived(v15, v61, v62);
    objc_msgSend_setResponseReceived_(v60, v64, (uint64_t)v63);

    ((void (**)(void, void, id, void, id))v38)[2](v38, *(void *)(a1 + 32), v10, 0, v11);
    goto LABEL_25;
  }
  uint64_t v65 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v65, OS_LOG_TYPE_DEFAULT, "Unknown Error, Falling back to HTTP", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  objc_msgSend_sendMessage_(*(void **)(*(void *)(a1 + 40) + 8), v66, *(void *)(a1 + 32), v68);
LABEL_25:
  uint64_t v67 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BCC24C;
  block[3] = &unk_1E5D1AD78;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v67, block);
}

uint64_t sub_1A7BCC24C(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_dequeueMessageIfNeeded(*(void **)(a1 + 32), a2, a3);
}

uint64_t _FZErrorTypeFromNSError(void *a1)
{
  id v1 = a1;
  id v4 = v1;
  if (qword_1EB47C758)
  {
    if (!v1) {
      goto LABEL_23;
    }
  }
  else
  {
    id v5 = (void **)MEMORY[0x1AD0D4F60]("APSErrorDomain", @"ApplePushService");
    if (v5) {
      id v6 = *v5;
    }
    else {
      id v6 = 0;
    }
    objc_storeStrong((id *)&qword_1EB47C758, v6);
    if (!v4) {
      goto LABEL_23;
    }
  }
  id v7 = objc_msgSend_domain(v4, v2, v3);
  int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)FTErrorDomain);

  if (isEqualToString)
  {
    uint64_t v12 = objc_msgSend_code(v4, v10, v11);
    if (v12 == 20000) {
      unsigned int v13 = 8;
    }
    else {
      unsigned int v13 = 1;
    }
    if (v12 == 10000) {
      uint64_t v14 = 9;
    }
    else {
      uint64_t v14 = v13;
    }
  }
  else
  {
    id v15 = objc_msgSend_domain(v4, v10, v11);
    int v17 = objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E4F289A0]);

    if (v17)
    {
      unint64_t v20 = objc_msgSend_code(v4, v18, v19) + 1020;
      if (v20 >= 0x15)
      {
LABEL_23:
        uint64_t v14 = 1;
        goto LABEL_24;
      }
      id v21 = (unsigned int *)&unk_1A7C02F08;
    }
    else
    {
      if (!qword_1EB47C758) {
        goto LABEL_23;
      }
      uint64_t v22 = objc_msgSend_domain(v4, v18, v19);
      int v24 = objc_msgSend_isEqualToString_(v22, v23, qword_1EB47C758);

      if (!v24) {
        goto LABEL_23;
      }
      unint64_t v20 = objc_msgSend_code(v4, v25, v26) - 2;
      if (v20 >= 5) {
        goto LABEL_23;
      }
      id v21 = (unsigned int *)&unk_1A7C02F5C;
    }
    uint64_t v14 = v21[v20];
  }
LABEL_24:

  return v14;
}

uint64_t _FZErrorTypeFromResponseCodeAndError(int a1, void *a2)
{
  uint64_t result = _FZErrorTypeFromNSError(a2);
  if (result == 1)
  {
    if (a1 > 5000)
    {
      if (a1 > 5031)
      {
        switch(a1)
        {
          case 5032:
            return 12;
          case 6000:
            return 18;
          case 10000:
            return 9;
        }
      }
      else
      {
        switch(a1)
        {
          case 5001:
            return 15;
          case 5006:
            return 19;
          case 5008:
            return 17;
        }
      }
      return 4;
    }
    else
    {
      switch(a1)
      {
        case 1000:
          uint64_t result = 14;
          break;
        case 1001:
          return 17;
        case 1002:
        case 1003:
          uint64_t result = 20;
          break;
        case 1004:
        case 1005:
          uint64_t result = 13;
          break;
        default:
          if (a1 >= 2) {
            return 4;
          }
          uint64_t result = 0;
          break;
      }
    }
  }
  return result;
}

__CFDictionary *_AuthenticationDictionaryFromParameters(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    id v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = v9;
    if (a1)
    {
      uint64_t v12 = @"auth-token";
      unsigned int v13 = v5;
    }
    else
    {
      uint64_t v14 = objc_msgSend__FTDataFromBase64String(v5, v10, v11);
      id v15 = IMSingleObjectArray();

      if (v15)
      {
        CFDictionarySetValue(v8, @"sigs", v15);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_1A7BFDCB4();
      }

      uint64_t v12 = @"push-token";
      id v9 = v8;
      unsigned int v13 = v7;
    }
    CFDictionarySetValue(v9, v12, v13);
  }

  return v8;
}

__CFDictionary *_DeviceCapabilitiesFromParameters(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = v6;
  if (v5) {
    CFDictionarySetValue(v6, @"name", v5);
  }
  id v9 = objc_msgSend_numberWithInteger_(NSNumber, v7, a2);
  if (v9) {
    CFDictionarySetValue(v8, @"version", v9);
  }

  if (a3)
  {
    uint64_t v11 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v10, a3);
    if (v11) {
      CFDictionarySetValue(v8, @"flags", v11);
    }
  }

  return v8;
}

id _BindingsArrayFromURIs(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = v1;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v15, v19, 16);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(const void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v12 = v10;
        if (v9) {
          CFDictionarySetValue(v10, @"uri", v9);
        }
        objc_msgSend_addObject_(v2, v11, (uint64_t)v12, (void)v15);
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v13, (uint64_t)&v15, v19, 16);
    }
    while (v6);
  }

  return v2;
}

uint64_t _FTIDSFlagsNumber(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_sharedInstance(FTDeviceSupport, a2, a3);
  int isC2KEquipment = objc_msgSend_isC2KEquipment(v3, v4, v5);

  if (isC2KEquipment) {
    uint64_t v8 = 17;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = NSNumber;

  return objc_msgSend_numberWithUnsignedInteger_(v9, v7, v8);
}

void *_FTProfileVersionNumber()
{
  return &unk_1EFE11B68;
}

void _FTGenerateDigestForSigningFromComponents(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a6;
  sub_1A7BCCA54(a2, a3, a4, a5);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  _FTGenerateDigestForSigningFromPayload(a1, v16, v15, a7, a8);
}

id sub_1A7BCCA54(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)&v104[5] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (objc_msgSend_length(v7, v12, v13) && (objc_msgSend_length(v8, v14, v15) || objc_msgSend_length(v10, v14, v16)))
  {
    long long v17 = objc_msgSend_dataUsingEncoding_(v7, v14, 1);
    unsigned int v102 = bswap32(objc_msgSend_length(v17, v18, v19));
    uint64_t v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v104[0] = objc_msgSend_length(v17, v21, v22);
      LOWORD(v104[1]) = 2112;
      *(void *)((char *)&v104[1] + 2) = @"bag-key";
      _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, "Appending %d length header for %@ segment", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v94 = (__CFString *)objc_msgSend_length(v17, v23, v24);
      v97 = @"bag-key";
      _IDSLogV();
    }
    objc_msgSend_appendBytes_length_(v11, v23, (uint64_t)&v102, 4, v94, v97);
    if (objc_msgSend_length(v17, v25, v26))
    {
      v27 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = objc_msgSend_length(v17, v28, v29);
        *(_DWORD *)buf = 67109378;
        v104[0] = v30;
        LOWORD(v104[1]) = 2112;
        *(void *)((char *)&v104[1] + 2) = @"bag-key";
        _os_log_impl(&dword_1A7BC0000, v27, OS_LOG_TYPE_DEFAULT, "Appending %d bytes for %@ segment", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v95 = (__CFString *)objc_msgSend_length(v17, v31, v32);
        v98 = @"bag-key";
        _IDSLogV();
      }
      objc_msgSend_appendData_(v11, v31, (uint64_t)v17, v95, v98);
    }
    else
    {
      uint64_t v33 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v104 = @"bag-key";
        _os_log_impl(&dword_1A7BC0000, v33, OS_LOG_TYPE_DEFAULT, "Appending no bytes for %@ segment", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v95 = @"bag-key";
        _IDSLogV();
      }
    }

    id v35 = objc_msgSend_dataUsingEncoding_(v8, v34, 1);
    unsigned int v102 = -1431655766;
    unsigned int v102 = bswap32(objc_msgSend_length(v35, v36, v37));
    id v38 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = objc_msgSend_length(v35, v39, v40);
      *(_DWORD *)buf = 67109378;
      v104[0] = v41;
      LOWORD(v104[1]) = 2112;
      *(void *)((char *)&v104[1] + 2) = @"query-string";
      _os_log_impl(&dword_1A7BC0000, v38, OS_LOG_TYPE_DEFAULT, "Appending %d length header for %@ segment", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v95 = (__CFString *)objc_msgSend_length(v35, v42, v43);
      v98 = @"query-string";
      _IDSLogV();
    }
    objc_msgSend_appendBytes_length_(v11, v42, (uint64_t)&v102, 4, v95, v98);
    if (objc_msgSend_length(v35, v44, v45))
    {
      long long v46 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = objc_msgSend_length(v35, v47, v48);
        *(_DWORD *)buf = 67109378;
        v104[0] = v49;
        LOWORD(v104[1]) = 2112;
        *(void *)((char *)&v104[1] + 2) = @"query-string";
        _os_log_impl(&dword_1A7BC0000, v46, OS_LOG_TYPE_DEFAULT, "Appending %d bytes for %@ segment", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v96 = (__CFString *)objc_msgSend_length(v35, v50, v51);
        uint64_t v99 = @"query-string";
        _IDSLogV();
      }
      objc_msgSend_appendData_(v11, v50, (uint64_t)v35, v96, v99);
    }
    else
    {
      uint64_t v52 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v104 = @"query-string";
        _os_log_impl(&dword_1A7BC0000, v52, OS_LOG_TYPE_DEFAULT, "Appending no bytes for %@ segment", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v96 = @"query-string";
        _IDSLogV();
      }
    }

    id v53 = v10;
    unsigned int v102 = -1431655766;
    unsigned int v102 = bswap32(objc_msgSend_length(v53, v54, v55));
    uint64_t v56 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      int v59 = objc_msgSend_length(v53, v57, v58);
      *(_DWORD *)buf = 67109378;
      v104[0] = v59;
      LOWORD(v104[1]) = 2112;
      *(void *)((char *)&v104[1] + 2) = @"body";
      _os_log_impl(&dword_1A7BC0000, v56, OS_LOG_TYPE_DEFAULT, "Appending %d length header for %@ segment", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v96 = (__CFString *)objc_msgSend_length(v53, v60, v61);
      uint64_t v99 = @"body";
      _IDSLogV();
    }
    objc_msgSend_appendBytes_length_(v11, v60, (uint64_t)&v102, 4, v96, v99);
    if (objc_msgSend_length(v53, v62, v63))
    {
      v64 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        int v67 = objc_msgSend_length(v53, v65, v66);
        *(_DWORD *)buf = 67109378;
        v104[0] = v67;
        LOWORD(v104[1]) = 2112;
        *(void *)((char *)&v104[1] + 2) = @"body";
        _os_log_impl(&dword_1A7BC0000, v64, OS_LOG_TYPE_DEFAULT, "Appending %d bytes for %@ segment", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v94 = (__CFString *)objc_msgSend_length(v53, v68, v69);
        v100 = @"body";
        _IDSLogV();
      }
      objc_msgSend_appendData_(v11, v68, (uint64_t)v53, v94, v100);
    }
    else
    {
      uint64_t v70 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v104 = @"body";
        _os_log_impl(&dword_1A7BC0000, v70, OS_LOG_TYPE_DEFAULT, "Appending no bytes for %@ segment", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v94 = @"body";
        _IDSLogV();
      }
    }

    if (objc_msgSend_length(v53, v71, v72))
    {
      id v73 = v9;
      unsigned int v102 = bswap32(objc_msgSend_length(v73, v74, v75));
      uint64_t v76 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        int v79 = objc_msgSend_length(v73, v77, v78);
        *(_DWORD *)buf = 67109378;
        v104[0] = v79;
        LOWORD(v104[1]) = 2112;
        *(void *)((char *)&v104[1] + 2) = @"push-token";
        _os_log_impl(&dword_1A7BC0000, v76, OS_LOG_TYPE_DEFAULT, "Appending %d length header for %@ segment", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v94 = (__CFString *)objc_msgSend_length(v73, v80, v81);
        v100 = @"push-token";
        _IDSLogV();
      }
      objc_msgSend_appendBytes_length_(v11, v80, (uint64_t)&v102, 4, v94, v100);
      if (objc_msgSend_length(v73, v82, v83))
      {
        v84 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          int v87 = objc_msgSend_length(v73, v85, v86);
          *(_DWORD *)buf = 67109378;
          v104[0] = v87;
          LOWORD(v104[1]) = 2112;
          *(void *)((char *)&v104[1] + 2) = @"push-token";
          _os_log_impl(&dword_1A7BC0000, v84, OS_LOG_TYPE_DEFAULT, "Appending %d bytes for %@ segment", buf, 0x12u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v94 = (__CFString *)objc_msgSend_length(v73, v88, v89);
          v101 = @"push-token";
          _IDSLogV();
        }
        objc_msgSend_appendData_(v11, v88, (uint64_t)v73, v94, v101);
      }
      else
      {
        v90 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v104 = @"push-token";
          _os_log_impl(&dword_1A7BC0000, v90, OS_LOG_TYPE_DEFAULT, "Appending no bytes for %@ segment", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v94 = @"push-token";
          _IDSLogV();
        }
      }
    }
  }
  if (objc_msgSend_length(v11, v14, v15, v94)) {
    v91 = v11;
  }
  else {
    v91 = 0;
  }
  id v92 = v91;

  return v92;
}

void _FTGenerateDigestForSigningFromPayload(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (a4)
  {
    uint64_t v14 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v11, v12);
    objc_msgSend_timeIntervalSince1970(v14, v15, v16);
    double v18 = v17;

    if (v10)
    {
      objc_msgSend_doubleValue(v10, v19, v20);
      double v18 = v21 / 1000.0;
    }
    unint64_t v22 = 1000 * (unint64_t)v18;
    *(void *)&buf[9] = 0xAAAAAAAAAAAAAAAALL;
    buf[0] = 1;
    *(void *)&buf[1] = (0xE800000000000000 * (unint64_t)v18) | HIBYTE(v22) | (256000 * (unint64_t)v18) & 0xFF00000000 | (0x3E8000000 * (unint64_t)v18) & 0xFF0000000000 | (0x3E80000000000 * (unint64_t)v18) & 0xFF000000000000 | (v22 >> 40) & 0xFF00 | (v22 >> 24) & 0xFF0000 | (v22 >> 8) & 0xFF000000;
    SecureRandomBytes();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v23, (uint64_t)buf, 17);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v24;
    if (v24) {
      objc_msgSend_appendData_(v13, v11, (uint64_t)v24);
    }
  }
  if (v9) {
    objc_msgSend_appendData_(v13, v11, (uint64_t)v9);
  }
  uint64_t v25 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = objc_msgSend_length(v13, v26, v27);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v28;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v13;
    _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "Signature input is %d bytes (%@)", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_length(v13, v29, v30);
    _IDSLogV();
  }
  if (a1)
  {
    if (a1 == 2)
    {
      uint64_t v31 = objc_msgSend_SHA256Data(v13, v29, v30);
    }
    else
    {
      if (a1 != 1) {
        goto LABEL_25;
      }
      uint64_t v31 = objc_msgSend_SHA1Data(v13, v29, v30);
    }
    uint64_t v33 = (void *)v31;
    if (v31)
    {
      if (!a5) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = 0;
      _os_log_impl(&dword_1A7BC0000, v32, OS_LOG_TYPE_ERROR, "Unknown digest type provided as input to digest generation function -- returning empty digest { digestType: %ld }", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
LABEL_25:
  uint64_t v34 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = objc_msgSend_length(v13, v35, v36);
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a1;
    _os_log_impl(&dword_1A7BC0000, v34, OS_LOG_TYPE_DEFAULT, "No digest generated { signatureInputDataLength: %lu, digestType: %ld }", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_length(v13, v38, v39);
    _IDSLogV();
  }
  uint64_t v33 = 0;
  if (a5) {
LABEL_31:
  }
    *a5 = v33;
LABEL_32:
}

BOOL _FTGenerateNonceAndSignatureFromComponents(__SecKey *a1, __SecKey *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void **a9)
{
  id v14 = 0;
  _FTGenerateDigestForSigningFromComponents(1, a3, a4, a5, a6, a7, a8, &v14);
  id v11 = v14;
  BOOL v12 = sub_1A7BCDB9C(a1, a2, v11, a9);

  return v12;
}

BOOL sub_1A7BCDB9C(__SecKey *a1, __SecKey *a2, void *a3, void **a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  CFDataRef v7 = a3;
  BOOL v8 = 0;
  if (a2 && a4)
  {
    __int16 v31 = 257;
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F3BAC8];
    CFErrorRef v30 = 0;
    CFDataRef v12 = SecKeyCreateSignature(a2, v9, v7, &v30);
    if (v12)
    {
      if (!a1)
      {
LABEL_9:
        uint64_t v19 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1CA58], v10, (uint64_t)&v31, 2);
        objc_msgSend_appendData_(v19, v20, (uint64_t)v12);
        *a4 = (id)objc_msgSend_copy(v19, v21, v22);

        uint64_t v25 = objc_msgSend_security(MEMORY[0x1E4F6C350], v23, v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = (__CFError *)*a4;
          *(_DWORD *)buf = 138412290;
          CFErrorRef v33 = v26;
          _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "Succeeded signing: %@", buf, 0xCu);
        }

        BOOL v8 = objc_msgSend_length(*a4, v27, v28) != 0;
        goto LABEL_17;
      }
      int v13 = SecKeyVerifySignature(a1, v9, v7, v12, &v30);
      uint64_t v16 = objc_msgSend_security(MEMORY[0x1E4F6C350], v14, v15);
      double v17 = v16;
      if (v13)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          double v18 = (__CFError *)*a4;
          *(_DWORD *)buf = 138412290;
          CFErrorRef v33 = v18;
          _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Succeeded verifying signature for: %@", buf, 0xCu);
        }

        goto LABEL_9;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFDD50((uint64_t *)&v30, v17);
      }
    }
    else
    {
      double v17 = objc_msgSend_security(MEMORY[0x1E4F6C350], v10, v11);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v33 = v30;
        _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Failed signing  with error: %@", buf, 0xCu);
      }
    }

    BOOL v8 = 0;
    *a4 = 0;
LABEL_17:
  }
  return v8;
}

BOOL _FTGenerateNonceAndSignatureFromPayload(__SecKey *a1, __SecKey *a2, void *a3, void *a4, void *a5, void **a6)
{
  id v12 = 0;
  _FTGenerateDigestForSigningFromPayload(1, a3, a4, a5, &v12);
  id v9 = v12;
  BOOL v10 = sub_1A7BCDB9C(a1, a2, v9, a6);

  return v10;
}

uint64_t _FTAreIDsEquivalent()
{
  return MEMORY[0x1F4122D90]();
}

id sub_1A7BCDE94(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = a1;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v22, v26, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend__FZBestGuessFZIDType(v11, v6, v7, (void)v22);
        uint64_t v15 = objc_msgSend__stripFZIDPrefix(v11, v13, v14);
        double v17 = objc_msgSend__URIFromFZIDType_(v15, v16, v12);

        if (objc_msgSend_length(v17, v18, v19)) {
          objc_msgSend_addObject_(v2, v20, (uint64_t)v17);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v22, v26, 16);
    }
    while (v8);
  }

  return v2;
}

id sub_1A7BCDFFC(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a1;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, v23, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = objc_msgSend__stripFZIDPrefix(*(void **)(*((void *)&v19 + 1) + 8 * i), v6, v7, (void)v19);
        uint64_t v14 = objc_msgSend__im_normalizedURIString(v11, v12, v13);

        if (objc_msgSend_length(v14, v15, v16)) {
          objc_msgSend_addObject_(v2, v17, (uint64_t)v14);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v19, v23, 16);
    }
    while (v8);
  }

  return v2;
}

id sub_1A7BCE148(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = a1;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v21, v25, 16);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_msgSend_base64EncodedStringWithOptions_(v9, v10, 0);
LABEL_12:
          double v17 = (void *)v11;
          objc_msgSend_addObject_(v2, v12, v11, (void)v21);

          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_msgSend__FTFilteredArrayForAPS(v9, v13, v14);
          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = objc_msgSend__FTFilteredDictionaryForAPS(v9, v15, v16);
          goto LABEL_12;
        }
        objc_msgSend_addObject_(v2, v15, (uint64_t)v9, (void)v21);
LABEL_13:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v18, (uint64_t)&v21, v25, 16);
      uint64_t v6 = v19;
    }
    while (v19);
  }

  return v2;
}

id sub_1A7BCE310(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = objc_msgSend_allKeys(a1, v3, v4, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, v28, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend_objectForKey_(a1, v8, v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = objc_msgSend_base64EncodedStringWithOptions_(v13, v14, 0);
LABEL_12:
          long long v21 = (void *)v15;
          objc_msgSend_setObject_forKey_(v2, v16, v15, v12);

          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = objc_msgSend__FTFilteredDictionaryForAPS(v13, v17, v18);
          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = objc_msgSend__FTFilteredArrayForAPS(v13, v19, v20);
          goto LABEL_12;
        }
        objc_msgSend_setObject_forKey_(v2, v19, (uint64_t)v13, v12);
LABEL_13:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, v28, 16);
      uint64_t v9 = v22;
    }
    while (v22);
  }

  return v2;
}

id sub_1A7BCE500(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v4 = objc_msgSend_initWithBase64EncodedString_options_(v2, v3, a1, 0);

  return v4;
}

id sub_1A7BCE548(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_length(a1, a2, a3);
  if (v4)
  {
    unint64_t v7 = v4;
    unint64_t v8 = v4 & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v9 = (char *)malloc_type_malloc(2 * (v4 & 0xFFFFFFFFFFFFFFFELL), 0xB090F96EuLL);
    size_t v10 = v7 >> 1;
    uint64_t v11 = malloc_type_malloc(v10, 0x720A47uLL);
    objc_msgSend_getCharacters_range_(a1, v12, (uint64_t)v9, 0, v8);
    __str[2] = 0;
    if (v8)
    {
      unint64_t v13 = ((v8 - 1) >> 1) + 1;
      uint64_t v14 = v9 + 2;
      uint64_t v15 = v11;
      do
      {
        __str[0] = *(v14 - 2);
        char v16 = *v14;
        v14 += 4;
        __str[1] = v16;
        *v15++ = strtol(__str, 0, 16);
        --v13;
      }
      while (v13);
    }
    free(v9);
    uint64_t v18 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v17, (uint64_t)v11, v10, 1);
  }
  else
  {
    uint64_t v18 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v5, v6);
  }

  return v18;
}

uint64_t sub_1A7BCE660(void *a1, const char *a2)
{
  return objc_msgSend_base64EncodedStringWithOptions_(a1, a2, 0);
}

id sub_1A7BCE668(void *a1, const char *a2, uint64_t a3)
{
  if ((unint64_t)objc_msgSend_length(a1, a2, a3) >> 14)
  {
    return (id)objc_msgSend__FTCopyGzippedData(a1, v3, v4);
  }
  else
  {
    return a1;
  }
}

id sub_1A7BCE6C8(void *a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend_length(a1, a2, a3))
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    strm.msg = (char *)0xAAAAAAAAAAAAAAAALL;
    strm.state = (internal_state *)0xAAAAAAAAAAAAAAAALL;
    strm.reserved = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&strm.data_type = v3;
    *(_OWORD *)&strm.next_out = v3;
    *(_OWORD *)&strm.avail_in = v3;
    strm.uLong total_out = 0;
    memset(&strm.zalloc, 0, 24);
    id v4 = a1;
    strm.next_in = (Bytef *)objc_msgSend_bytes(v4, v5, v6);
    strm.avail_in = objc_msgSend_length(v4, v7, v8);
    id v9 = 0;
    if (!deflateInit2_(&strm, -1, 8, 31, 8, 0, "1.2.12", 112))
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1CA58]);
      uint64_t v14 = objc_msgSend_initWithLength_(v10, v11, 0x4000);
      do
      {
        uLong total_out = strm.total_out;
        if (total_out >= objc_msgSend_length(v14, v12, v13)) {
          objc_msgSend_increaseLengthBy_(v14, v16, 0x4000);
        }
        id v9 = v14;
        uint64_t v19 = objc_msgSend_mutableBytes(v9, v17, v18);
        strm.next_out = (Bytef *)(v19 + strm.total_out);
        int v22 = objc_msgSend_length(v9, v20, v21);
        strm.avail_out = v22 - LODWORD(strm.total_out);
        deflate(&strm, 4);
      }
      while (!strm.avail_out);
      objc_msgSend_setLength_(v9, v12, strm.total_out);
      deflateEnd(&strm);
    }
    return v9;
  }
  else
  {
    return a1;
  }
}

uint64_t sub_1A7BCE95C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl(&dword_1A7BC0000, v6, OS_LOG_TYPE_DEFAULT, "MG capabilities changed: %@  (%@)", (uint8_t *)&v10, 0x16u);
  }

  return objc_msgSend__updateCapabilities(*(void **)(a1 + 32), v7, v8);
}

void sub_1A7BCEA2C(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v9 = 138412290;
    *(void *)&v9[4] = a3;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "DeviceCenterRegistrationCommCenterReadyCallback: %@", v9, 0xCu);
  }

  *(void *)id v9 = 0xAAAAAAAAAAAAAAAALL;
  id v6 = objc_initWeak((id *)v9, a2);
  if (a2) {
    objc_msgSend__commCenterAlive(a2, v7, v8);
  }

  objc_destroyWeak((id *)v9);
}

void sub_1A7BCEB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void sub_1A7BCFF4C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  uint64_t v8 = objc_msgSend_hwSupport(a2, v6, v7);
  uint64_t v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v9, v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v12)
    {
      int v15 = 138412290;
      char v16 = v5;
      uint64_t v13 = "Failed to get stewie hw support { error: %@ }";
LABEL_8:
      _os_log_impl(&dword_1A7BC0000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v12)
  {
    uint64_t v14 = @"NO";
    if (v8) {
      uint64_t v14 = @"YES";
    }
    int v15 = 138412290;
    char v16 = v14;
    uint64_t v13 = "Got stewie hw support { stewieHWSupport: %@ }";
    goto LABEL_8;
  }

  *(void *)(*(void *)(a1 + 32) + 168) = v8;
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8);
}

void sub_1A7BD02CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A7BD0844(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    int v11 = 138412546;
    BOOL v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Received phone number registration ready state change callback { state: %@, context: %@ }", (uint8_t *)&v11, 0x16u);
  }

  uint64_t result = objc_msgSend_isSelectedPhoneNumberRegistrationSubscriptionContext_(*(void **)(*(void *)(a1 + 40) + 160), v7, *(void *)(a1 + 32));
  if (result) {
    return objc_msgSend__handlePotentialPhoneNumberRegistrationStateChanged(*(void **)(a1 + 40), v9, v10);
  }
  return result;
}

uint64_t sub_1A7BD09C8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Received phone number changed delegate callback { context: %@ }", (uint8_t *)&v10, 0xCu);
  }

  uint64_t result = objc_msgSend_isSelectedPhoneNumberRegistrationSubscriptionContext_(*(void **)(*(void *)(a1 + 40) + 160), v6, *(void *)(a1 + 32));
  if (result) {
    return objc_msgSend__handlePotentialPhoneNumberRegistrationStateChanged(*(void **)(a1 + 40), v8, v9);
  }
  return result;
}

uint64_t sub_1A7BD0B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__handleCarrierSettingsChanged, a3);
}

uint64_t sub_1A7BD0BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__handleCarrierSettingsChanged, a3);
}

uint64_t sub_1A7BD0C74(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v10 = 138412546;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "SIM status changed { status: %@, context: %@ }", (uint8_t *)&v10, 0x16u);
  }

  uint64_t result = objc_msgSend_isSelectedPhoneNumberRegistrationSubscriptionContext_(*(void **)(*(void *)(a1 + 48) + 160), v7, *(void *)(a1 + 40));
  if (result) {
    return objc_msgSend__handleSIMStatusChangedToStatus_(*(void **)(a1 + 48), v9, *(void *)(a1 + 32));
  }
  return result;
}

void sub_1A7BD0EE8(uint64_t a1, const char *a2, uint64_t a3)
{
  if (!*(void *)(*(void *)(a1 + 32) + 120))
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v4, v3, @"__kFaceTimeDeviceSIMRemovedNotification", 0);
  }
}

uint64_t sub_1A7BD1054(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateCapabilities(*(void **)(a1 + 32), a2, a3);
}

void sub_1A7BD1148(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  byte_1E97394A0 = 0;
  uint64_t v5 = objc_msgSend_registrationState(*(void **)(a1 + 32), a2, a3);
  uint64_t v6 = qword_1E9739498;
  if (v5) {
    BOOL v7 = qword_1E9739498 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (objc_msgSend_isEqualToDictionary_((void *)qword_1E9739498, v3, (uint64_t)v5))
    {
      uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        uint64_t v17 = (__CFString *)qword_1E9739498;
        __int16 v18 = 2112;
        uint64_t v19 = v5;
        _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "No change to phone number registration state -- not posting notification { lastState: %@, state: %@ }", (uint8_t *)&v16, 0x16u);
      }
      goto LABEL_14;
    }
    uint64_t v6 = qword_1E9739498;
  }
  if ((void *)v6 != v5) {
    objc_storeStrong((id *)&qword_1E9739498, v5);
  }
  uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    uint64_t v17 = @"__kFTCTRegistrationStatusChangedNotification";
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Phone number registration state changed -- posting notification { notification: %@, state: %@ } ", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v10, v11);
  uint64_t v14 = objc_msgSend_sharedInstance(FTEntitlementSupport, v12, v13);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v8, v15, @"__kFTCTRegistrationStatusChangedNotification", v14, v5);

LABEL_14:
}

void *sub_1A7BD1B8C()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("_CTServerConnectionCreate", @"CoreTelephony");
  off_1E9739530 = result;
  return result;
}

void *sub_1A7BD1BBC()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("_CTServerConnectionIsPhoneNumberRegistrationSupported", @"CoreTelephony");
  off_1E9739540 = result;
  return result;
}

void sub_1A7BD1F1C()
{
  v0 = (const void *)MGCopyAnswer();
  if (!v0) {
    return;
  }
  id v1 = v0;
  if (CFEqual(v0, @"AppleTV"))
  {
    uint64_t v2 = 5;
LABEL_7:
    qword_1EB47C820 = v2;
    goto LABEL_8;
  }
  if (CFEqual(v1, @"AudioAccessory"))
  {
    uint64_t v2 = 7;
    goto LABEL_7;
  }
LABEL_8:

  CFRelease(v1);
}

void *sub_1A7BD2238()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("PKCanMakePaymentsForIDS", @"PassKitCore");
  off_1E9739458 = result;
  return result;
}

void *sub_1A7BD236C()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("PKSupportsManateeForAppleCashForIDS", @"PassKitCore");
  off_1E9739478 = result;
  return result;
}

void *sub_1A7BD24A0()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("PKSupportsRegionForAppleCashForIDS", @"PassKitCore");
  off_1E9739488 = result;
  return result;
}

void *sub_1A7BD2544()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("sp_IDS_supportsIDSRegistrationPropertySupportsFMDV2", @"SPOwner");
  off_1E9739470 = result;
  return result;
}

void *sub_1A7BD27A4()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("PKShareableCredentialsSupportsHarmony", @"PassKitCore");
  off_1EB47C730 = result;
  return result;
}

void *sub_1A7BD28D8()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("isEligibleForReceivingZelkova", @"SafetyMonitor");
  off_1E97394C0 = result;
  return result;
}

uint64_t sub_1A7BD2C08(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_cpuFamily(*(void **)(a1 + 32), a2, a3);
  char v4 = 1;
  if ((int)result <= 506291072)
  {
    if ((int)result > -823913144)
    {
      if ((int)result <= -310978391)
      {
        BOOL v5 = result == -823913143;
        int v6 = -416119890;
      }
      else
      {
        BOOL v5 = result == -310978390 || result == 214503012;
        int v6 = 280134364;
      }
    }
    else if ((int)result <= -1471079479)
    {
      BOOL v5 = result == -1879695144;
      int v6 = -1777893647;
    }
    else
    {
      BOOL v5 = result == -1471079478 || result == -1439483605;
      int v6 = -1122301207;
    }
  }
  else if ((int)result <= 1418770315)
  {
    if ((int)result <= 747742333)
    {
      BOOL v5 = result == 506291073;
      int v6 = 526772277;
    }
    else
    {
      BOOL v5 = result == 747742334 || result == 933271106;
      int v6 = 1404044789;
    }
  }
  else if ((int)result > 1801080017)
  {
    BOOL v5 = result == 1801080018 || result == 2009171118;
    int v6 = 2028621756;
  }
  else
  {
    BOOL v5 = result == 1418770316 || result == 1463508716;
    int v6 = 1479463068;
  }
  if (!v5 && result != v6) {
    char v4 = 0;
  }
  byte_1E9739558 = v4;
  return result;
}

uint64_t sub_1A7BD2DEC()
{
  size_t v1 = 4;
  return sysctlbyname("hw.cpufamily", &dword_1E9739568, &v1, 0, 0);
}

uint64_t sub_1A7BD2EC0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_memorySize(*(void **)(a1 + 32), a2, a3);
  byte_1E97394B8 = result < 1610612737;
  return result;
}

uint64_t sub_1A7BD2F38()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  *(void *)uint64_t v2 = 0x1800000006;
  size_t v1 = 8;
  return sysctl(v2, 2u, &qword_1EB47C720, &v1, 0, 0);
}

void sub_1A7BD31C8()
{
  CFStringRef v0 = (const __CFString *)MGCopyAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    if (CFStringHasSuffix(v0, @"DEV")) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = CFStringHasSuffix(v1, @"dev") != 0;
    }
    byte_1E9739578 = v2;
    CFRelease(v1);
  }
}

void sub_1A7BD326C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1A7BD3DB0(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((byte_1E9739580 & 1) == 0)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = a2;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Selected subscription externally changed -- clearing cached selected phone number registration subscription { observer: %@ }", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend_invalidateCache(a2, v5, v6);
  }
}

void sub_1A7BD4278()
{
  byte_1E9739580 = 0;
}

uint64_t sub_1A7BD4F5C()
{
  uint64_t result = _CTServerConnectionCreate();
  qword_1E97394B0 = result;
  return result;
}

void sub_1A7BD5004(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1A7BD5074()
{
  qword_1EB47C860 = objc_alloc_init(FTNetworkSupport);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A7BD5E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__tryToEnableReliability, a3);
}

void sub_1A7BD66AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_msgSend__reload(WeakRetained, v2, v3);
    id WeakRetained = v4;
  }
}

uint64_t sub_1A7BD6774()
{
  CFStringRef v0 = [FTiMessageStatus alloc];
  qword_1EB47C848 = objc_msgSend_initPrivate(v0, v1, v2);

  return MEMORY[0x1F41817F8]();
}

void *sub_1A7BD6978()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("SCNetworkReachabilityCreateWithName", @"SystemConfiguration");
  off_1E9739588 = result;
  return result;
}

void *sub_1A7BD6A3C()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("SCNetworkReachabilityCreateWithAddress", @"SystemConfiguration");
  off_1EB47C778 = result;
  return result;
}

void sub_1A7BD6B9C(int a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((a1 & 0x40000) != 0) {
      int v5 = 87;
    }
    else {
      int v5 = 45;
    }
    v14[0] = 67111426;
    v14[1] = v5;
    if ((a1 & 2) != 0) {
      int v6 = 82;
    }
    else {
      int v6 = 45;
    }
    __int16 v15 = 1024;
    int v16 = v6;
    if (a1) {
      int v7 = 116;
    }
    else {
      int v7 = 45;
    }
    __int16 v17 = 1024;
    int v18 = v7;
    if ((a1 & 4) != 0) {
      int v8 = 99;
    }
    else {
      int v8 = 45;
    }
    __int16 v19 = 1024;
    int v20 = v8;
    if ((a1 & 8) != 0) {
      int v9 = 67;
    }
    else {
      int v9 = 45;
    }
    __int16 v21 = 1024;
    if ((a1 & 0x10) != 0) {
      int v10 = 105;
    }
    else {
      int v10 = 45;
    }
    int v22 = v9;
    __int16 v23 = 1024;
    if ((a1 & 0x20) != 0) {
      int v11 = 68;
    }
    else {
      int v11 = 45;
    }
    int v24 = v10;
    if ((a1 & 0x10000) != 0) {
      int v12 = 108;
    }
    else {
      int v12 = 45;
    }
    __int16 v25 = 1024;
    int v26 = v11;
    if ((a1 & 0x20000) != 0) {
      int v13 = 100;
    }
    else {
      int v13 = 45;
    }
    __int16 v27 = 1024;
    int v28 = v12;
    __int16 v29 = 1024;
    int v30 = v13;
    __int16 v31 = 2080;
    uint64_t v32 = a2;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Reachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n", (uint8_t *)v14, 0x42u);
  }
}

void *sub_1A7BD6E90()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("SCNetworkReachabilityGetFlags", @"SystemConfiguration");
  off_1E9739598 = result;
  return result;
}

void *sub_1A7BD6FA4()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("SCNetworkReachabilityGetFlags", @"SystemConfiguration");
  off_1EB47C788 = result;
  return result;
}

uint64_t sub_1A7BD7BC8()
{
  qword_1EB47C868 = objc_alloc_init(FTAuthKitManager);

  return MEMORY[0x1F41817F8]();
}

void sub_1A7BD7DCC(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v2, OS_LOG_TYPE_DEFAULT, "AuthKit - gathering headers", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
      IMLogString();
    }
  }
  int v5 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "AuthKit - gathering headers", buf, 2u);
  }

  int v7 = objc_msgSend_appleIDHeadersForRequest_(*(void **)(*(void *)(a1 + 32) + 8), v6, *(void *)(a1 + 40));
  int v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend_count(v7, v11, v12);
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v13;
    _os_log_impl(&dword_1A7BC0000, v10, OS_LOG_TYPE_DEFAULT, "AuthKit - received headers, count: %lu", buf, 0xCu);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1A7BD8038;
  v17[3] = &unk_1E5D1ACE0;
  uint64_t v14 = *(NSObject **)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v18 = v7;
  id v19 = v15;
  id v16 = v7;
  dispatch_async(v14, v17);
}

uint64_t sub_1A7BD8038(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1A7BD813C(uint64_t a1)
{
  char v12 = 0;
  uint64_t v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v2, OS_LOG_TYPE_DEFAULT, "AuthKit - handling response", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
      IMLogString();
    }
  }
  int v5 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "AuthKit - handling response", buf, 2u);
  }

  objc_msgSend_handleResponse_forRequest_shouldRetry_(*(void **)(*(void *)(a1 + 32) + 8), v6, *(void *)(a1 + 40), *(void *)(a1 + 48), &v12);
  int v7 = im_primary_queue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A7BD831C;
  v8[3] = &unk_1E5D1AFB0;
  char v10 = v12;
  id v9 = *(id *)(a1 + 56);
  dispatch_async(v7, v8);
}

uint64_t sub_1A7BD831C(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v3 = @"YES";
    }
    else {
      uint64_t v3 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1A7BC0000, v2, OS_LOG_TYPE_DEFAULT, "AuthKit - shouldRetry: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      if (*(unsigned char *)(a1 + 40)) {
        int v6 = @"YES";
      }
      else {
        int v6 = @"NO";
      }
      int v11 = v6;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      if (*(unsigned char *)(a1 + 40)) {
        int v7 = @"YES";
      }
      else {
        int v7 = @"NO";
      }
      int v11 = v7;
      IMLogString();
    }
  }
  int v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5, v11);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "AuthKit - shouldRetry: %@", buf, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double sub_1A7BD86F8(double result, uint64_t a2, uint64_t a3)
{
  if (result < 10.0)
  {
    double v3 = (double)a3 / 10.0;
    double v4 = v3 + 1.0;
    BOOL v5 = v3 <= 3.0;
    double v6 = 4.0;
    if (v5) {
      double v6 = v4;
    }
    uint64_t result = __exp10(v6);
  }
  if (result > 43200.0) {
    return 43200.0;
  }
  return result;
}

long double sub_1A7BD874C(uint64_t a1, uint64_t a2)
{
  return exp2((double)(a2 & ~(a2 >> 63))) * 60.0;
}

void sub_1A7BDA070(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  if (objc_msgSend_length(v5, v7, v8)) {
    objc_msgSend_appendString_(*(void **)(a1 + 32), v9, @"&");
  }
  char v10 = (void *)IMCopyURLEscapedString();
  int v11 = (void *)IMCopyURLEscapedString();

  objc_msgSend_appendFormat_(*(void **)(a1 + 32), v12, @"%@=%@", v10, v11);
}

id sub_1A7BDA120()
{
  if (qword_1EB47C6F0 != -1) {
    dispatch_once(&qword_1EB47C6F0, &unk_1EFE07620);
  }
  CFStringRef v0 = (void *)off_1EB47C6E0();

  return v0;
}

uint64_t sub_1A7BDA178(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A7BDA188(uint64_t a1)
{
}

void sub_1A7BDA190(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    __int16 v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v24, *(void *)(a1 + 72));
      int v28 = objc_msgSend_stringValue(v25, v26, v27);
      *(_DWORD *)buf = 138412290;
      int v49 = v28;
      _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, "Message with ID %@ not found in queue.  Abandoning anisette header collection.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      int v30 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v29, *(void *)(a1 + 72));
      uint64_t v43 = objc_msgSend_stringValue(v30, v31, v32);
      _IDSLogV();
    }
    goto LABEL_17;
  }
  id v6 = objc_msgSend_objectForKey_(*(void **)(*(void *)(a1 + 32) + 152), v4, @"anisette-headers-disabled");
  int v9 = objc_msgSend_BOOLValue(v6, v7, v8);

  int v12 = objc_msgSend_isIDSMessage(WeakRetained, v10, v11) ^ 1 | v9;
  objc_msgSend_anisetteHeadersTimeout(WeakRetained, v13, v14);
  if (v17 > 0.0 && v12 != 0)
  {
    uint64_t v33 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = (objc_class *)objc_opt_class();
      uint64_t v36 = NSStringFromClass(v35);
      *(_DWORD *)buf = 138412290;
      int v49 = v36;
      _os_log_impl(&dword_1A7BC0000, v33, OS_LOG_TYPE_DEFAULT, "anisette headers are required for messageType %@ but disabled by the server bag anisette-headers-disabled", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v37 = (objc_class *)objc_opt_class();
      long long v44 = NSStringFromClass(v37);
      _IDSLogV();
    }
LABEL_17:
    v3[2](v3);
    goto LABEL_25;
  }
  objc_msgSend_anisetteHeadersTimeout(WeakRetained, v15, v16);
  if (v21 < 0.0) {
    int v22 = 1;
  }
  else {
    int v22 = v12;
  }
  if (v22 == 1)
  {
    v3[2](v3);
  }
  else
  {
    id v38 = objc_msgSend_sharedInstance(FTAuthKitManager, v19, v20);
    uint64_t v39 = *(void *)(a1 + 48);
    uint64_t v40 = im_primary_queue();
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1A7BDA554;
    v45[3] = &unk_1E5D1B018;
    uint64_t v47 = *(void *)(a1 + 56);
    uint64_t v41 = v3;
    v45[4] = *(void *)(a1 + 32);
    id v46 = v41;
    objc_msgSend_anisetteHeadersForRequest_completionBlockQueue_completionBlock_(v38, v42, v39, v40, v45);
  }
LABEL_25:
}

void sub_1A7BDA554(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = im_primary_queue();
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v8 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BDA634;
  block[3] = &unk_1E5D1AD78;
  block[4] = a1[4];
  dispatch_async(v8, block);
}

uint64_t sub_1A7BDA634(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_busy(*(void **)(a1 + 32), a2, a3);
  if ((result & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    return objc_msgSend__dequeueIfNeeded(v7, v5, v6);
  }
  return result;
}

void sub_1A7BDA680(uint64_t a1, char a2)
{
  double v4 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BDA780;
  block[3] = &unk_1E5D1B090;
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v14 = v5;
  char v15 = a2;
  id v10 = v6;
  long long v8 = *(_OWORD *)(a1 + 64);
  id v7 = (id)v8;
  long long v13 = v8;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  dispatch_async(v4, block);
}

void sub_1A7BDA780(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  double v4 = objc_msgSend__queue(*(void **)(a1 + 32), a2, a3);
  id v73 = objc_msgSend_messageForUniqueID_(v4, v5, *(void *)(a1 + 80));

  if (!v73)
  {
    long long v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, *(void *)(a1 + 80));
      long long v13 = objc_msgSend_stringValue(v10, v11, v12);
      *(_DWORD *)buf = 138412290;
      v84 = v13;
      _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "Message with ID %@ not found in queue.  Abandoning anisette header collection.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v14 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, *(void *)(a1 + 80));
      uint64_t v71 = objc_msgSend_stringValue(v14, v15, v16);
      _IDSLogV();
    }
  }
  if (*(unsigned char *)(a1 + 88))
  {
    double v17 = objc_msgSend_URL(*(void **)(a1 + 40), v6, v7);
    uint64_t v20 = objc_msgSend_absoluteString(v17, v18, v19);

    __int16 v23 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v21, v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v20;
      _os_log_impl(&dword_1A7BC0000, v23, OS_LOG_TYPE_DEFAULT, "************* Couldn't gather Anisette headers for %@ *************", buf, 0xCu);
    }

    int v24 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v20;
      _os_log_impl(&dword_1A7BC0000, v24, OS_LOG_TYPE_DEFAULT, "************* Couldn't gather Anisette headers %@ *************", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        uint64_t v71 = v20;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        uint64_t v71 = v20;
        IMLogString();
      }
    }
  }
  else
  {
    uint64_t v25 = os_variant_allows_internal_security_policies();
    int v74 = v25;
    context = (void *)MEMORY[0x1AD0D54C0](v25);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    int v28 = objc_msgSend_allKeys(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v26, v27);
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v79, v87, 16);
    if (v32)
    {
      uint64_t v33 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v80 != v33) {
            objc_enumerationMutation(v28);
          }
          id v35 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          uint64_t v36 = objc_msgSend_baaSigner(*(void **)(a1 + 32), v30, v31, v71);
          char isBAAProtocolHeader = objc_msgSend_isBAAProtocolHeader_(v36, v37, (uint64_t)v35);

          if (isBAAProtocolHeader)
          {
            uint64_t v41 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v39, v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v35;
              _os_log_impl(&dword_1A7BC0000, v41, OS_LOG_TYPE_DEFAULT, "ignoring %@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v42 = objc_msgSend_objectForKey_(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v39, (uint64_t)v35);

            if (v42)
            {
              long long v44 = *(void **)(a1 + 40);
              uint64_t v45 = objc_msgSend_objectForKey_(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v43, (uint64_t)v35);
              objc_msgSend_setValue_forHTTPHeaderField_(v44, v46, (uint64_t)v45, v35);
            }
            uint64_t v41 = objc_msgSend_objectForKey_(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v43, (uint64_t)v35);
            int v49 = objc_msgSend_lowercaseString(v35, v47, v48);
            int v51 = objc_msgSend_containsObject_(&unk_1EFE11C28, v50, (uint64_t)v49);

            if (((v51 ^ 1 | v74) & 1) == 0)
            {

              uint64_t v41 = @"<redacted>";
            }
            id v54 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v52, v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412547;
              v84 = v35;
              __int16 v85 = 2113;
              uint64_t v86 = v41;
              _os_log_impl(&dword_1A7BC0000, v54, OS_LOG_TYPE_DEFAULT, "       %@: %{private}@", buf, 0x16u);
            }
          }
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v79, v87, 16);
      }
      while (v32);
    }

    if (objc_msgSend_wantsUDID(v73, v55, v56)) {
      objc_msgSend_ak_addDeviceUDIDHeader(*(void **)(a1 + 40), v57, v58);
    }
    if (objc_msgSend_wantsClientInfo(v73, v57, v58, v71)) {
      objc_msgSend_ak_addClientInfoHeader(*(void **)(a1 + 40), v59, v60);
    }
  }
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = sub_1A7BDAE30;
  v75[3] = &unk_1E5D1B068;
  id v76 = *(id *)(a1 + 40);
  id v61 = v73;
  id v77 = v61;
  id v78 = *(id *)(a1 + 64);
  uint64_t v62 = (void (**)(void, void))MEMORY[0x1AD0D56D0](v75);
  if ((objc_msgSend_wantsSignature(v61, v63, v64) & 1) != 0
    || objc_msgSend_wantsBAASigning(v61, v65, v66))
  {
    if (objc_msgSend_wantsBodySignature(v61, v65, v66, v71))
    {
      uint64_t v69 = *(void **)(a1 + 32);
    }
    else
    {
      int v70 = objc_msgSend_wantsBAASigning(v61, v67, v68);
      uint64_t v69 = *(void **)(a1 + 32);
      if (!v70)
      {
        objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(v69, v67, (uint64_t)v61, 0, 0, *(void *)(a1 + 56), v62);
        goto LABEL_47;
      }
    }
    objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(v69, v67, (uint64_t)v61, 0, *(void *)(a1 + 48), *(void *)(a1 + 56), v62);
  }
  else
  {
    v62[2](v62, 0);
  }
LABEL_47:
}

void sub_1A7BDAE30(id *a1, void *a2)
{
  id v3 = a2;
  double v4 = im_primary_queue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A7BDAF1C;
  v6[3] = &unk_1E5D1AF88;
  id v7 = v3;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t sub_1A7BDAF1C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  double v4 = objc_msgSend_allKeys(*(void **)(a1 + 32), a2, a3);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v51, v60, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        id v11 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), v6, v10, v45, v46);

        if (v11)
        {
          long long v13 = *(void **)(a1 + 40);
          uint64_t v14 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), v12, v10);
          objc_msgSend_setValue_forHTTPHeaderField_(v13, v15, (uint64_t)v14, v10);
        }
        uint64_t v16 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), v17, v10);
          *(_DWORD *)buf = 138412546;
          uint64_t v57 = v10;
          __int16 v58 = 2112;
          int v59 = v18;
          _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            objc_msgSend_objectForKey_(*(void **)(a1 + 32), v19, v10);
            v46 = uint64_t v45 = v10;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            objc_msgSend_objectForKey_(*(void **)(a1 + 32), v6, v10);
            v46 = uint64_t v45 = v10;
            IMLogString();
          }
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v51, v60, 16);
    }
    while (v7);
  }

  uint64_t v22 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v20, v21);
  int isInternalInstall = objc_msgSend_isInternalInstall(v22, v23, v24);

  if (isInternalInstall)
  {
    objc_msgSend_additionalInternalHeaders(*(void **)(a1 + 48), v26, v27);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v47, v55, 16);
    if (v31)
    {
      uint64_t v32 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = *(void *)(*((void *)&v47 + 1) + 8 * j);
          id v35 = objc_msgSend_objectForKey_(v28, v30, v34, v45, v46);

          if (v35)
          {
            uint64_t v37 = *(void **)(a1 + 40);
            id v38 = objc_msgSend_objectForKey_(v28, v36, v34);
            objc_msgSend_setValue_forHTTPHeaderField_(v37, v39, (uint64_t)v38, v34);
          }
          uint64_t v40 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v42 = objc_msgSend_objectForKey_(v28, v41, v34);
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = v34;
            __int16 v58 = 2112;
            int v59 = v42;
            _os_log_impl(&dword_1A7BC0000, v40, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              objc_msgSend_objectForKey_(v28, v43, v34);
              v46 = uint64_t v45 = v34;
              MarcoLog();
            }
            if (IMShouldLog())
            {
              objc_msgSend_objectForKey_(v28, v30, v34);
              v46 = uint64_t v45 = v34;
              IMLogString();
            }
          }
        }
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v47, v55, 16);
      }
      while (v31);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1A7BDB418(uint64_t a1)
{
  uint64_t v2 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BDB4A4;
  block[3] = &unk_1E5D1B0E0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void sub_1A7BDB4A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

uint64_t sub_1A7BDB4B8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1A7BDB660(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int buf, int a14, int a15, __int16 a16)
{
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(a1);
    double v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      buf = 138412546;
      a16 = 2112;
      _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_ERROR, "Exception processing result: %@   for message: %@", (uint8_t *)&buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }

    objc_end_catch();
    JUMPOUT(0x1A7BDB648);
  }
  _Unwind_Resume(a1);
}

void sub_1A7BDBA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A7BDBEB8(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1A7BDBC44);
  }
  objc_sync_exit(v2);
  _Unwind_Resume(exc_buf);
}

void sub_1A7BDBF08(uint64_t a1, void *a2)
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  v127 = a2;
  id v5 = objc_msgSend__queue(*(void **)(a1 + 32), v3, v4);
  v128 = objc_msgSend_messageForUniqueID_(v5, v6, *(void *)(a1 + 56));

  if (!v128)
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v8, *(void *)(a1 + 56));
      objc_msgSend_stringValue(v9, v10, v11);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v140 = v12;
      _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Message with ID %@ not found in queue.  Abandoning URL request.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v14 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v13, *(void *)(a1 + 56));
      v123 = objc_msgSend_stringValue(v14, v15, v16);
      _IDSLogV();
    }
  }
  double v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v140 = v127;
    __int16 v141 = 2112;
    v142 = v127;
    _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Created URL Request: %@  from URL: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v123 = v127;
    v125 = v127;
    _IDSLogV();
  }
  if (v127)
  {
    id v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(__CFString **)(a1 + 56);
      uint64_t v20 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v140 = v19;
      __int16 v141 = 2112;
      v142 = v20;
      _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_DEFAULT, "Delivering message %lu to URL: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v123 = *(void **)(a1 + 56);
        v125 = *(__CFString **)(a1 + 40);
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v123 = *(void **)(a1 + 56);
        v125 = *(__CFString **)(a1 + 40);
        IMLogString();
      }
    }
    if (objc_msgSend_payloadCanBeLogged(v128, v21, v22, v123, v125))
    {
      uint64_t v25 = *(void *)(a1 + 56);
      int v26 = objc_msgSend_description(*(void **)(a1 + 48), v23, v24);
      uint64_t v27 = IDSLoggableDescriptionForObjectOnService();

      uint64_t v133 = MEMORY[0x1E4F143A8];
      uint64_t v134 = 3221225472;
      v135 = sub_1A7BDC950;
      v136 = &unk_1E5D1B130;
      id v137 = v27;
      uint64_t v138 = v25;
      id v28 = v27;
      cut_dispatch_log_queue();
    }
    __int16 v29 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = objc_msgSend_forceCellular(v128, v30, v31);
      uint64_t v33 = @"NO";
      if (v32) {
        uint64_t v33 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v140 = v33;
      _os_log_impl(&dword_1A7BC0000, v29, OS_LOG_TYPE_DEFAULT, "Force cellular: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        int v38 = objc_msgSend_forceCellular(v128, v36, v37);
        uint64_t v39 = @"NO";
        if (v38) {
          uint64_t v39 = @"YES";
        }
        v124 = v39;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        int v40 = objc_msgSend_forceCellular(v128, v34, v35);
        uint64_t v41 = @"NO";
        if (v40) {
          uint64_t v41 = @"YES";
        }
        v124 = v41;
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 32), v34, v35, v124))
    {
      long long v44 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v42, v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = *(__CFString **)(a1 + 56);
        id v46 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v140 = v45;
        __int16 v141 = 2112;
        v142 = v46;
        _os_log_impl(&dword_1A7BC0000, v44, OS_LOG_TYPE_DEFAULT, "Delivering message %lu to URL: %@", buf, 0x16u);
      }

      long long v49 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v47, v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        int v52 = objc_msgSend_forceCellular(v128, v50, v51);
        long long v53 = @"NO";
        if (v52) {
          long long v53 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v140 = v53;
        _os_log_impl(&dword_1A7BC0000, v49, OS_LOG_TYPE_DEFAULT, "Force cellular: %@", buf, 0xCu);
      }
    }
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = sub_1A7BDCA0C;
    v129[3] = &unk_1E5D1B180;
    uint64_t v55 = *(void *)(a1 + 32);
    long long v54 = (void *)(a1 + 32);
    uint64_t v56 = v54[3];
    v129[4] = v55;
    uint64_t v132 = v56;
    uint64_t v57 = v127;
    v130 = v57;
    id v58 = v128;
    id v131 = v58;
    v126 = (void *)MEMORY[0x1AD0D56D0](v129);
    objc_msgSend_setRequest_(*(void **)(*v54 + 96), v59, (uint64_t)v57);
    objc_msgSend_setBlock_(*(void **)(*v54 + 96), v60, (uint64_t)v126);
    id v61 = *(id *)(*v54 + 152);
    uint64_t v63 = objc_msgSend_objectForKey_(v61, v62, @"do-http-pipelining");
    uint64_t v66 = objc_msgSend_BOOLValue(v63, v64, v65);

    uint64_t v68 = objc_msgSend_objectForKey_(v61, v67, @"max-concurrent-connections");
    uint64_t v71 = objc_msgSend_intValue(v68, v69, v70);

    id v73 = objc_msgSend_objectForKey_(v61, v72, @"do-http-keep-alive");
    int v76 = objc_msgSend_BOOLValue(v73, v74, v75);

    id v78 = objc_msgSend_objectForKey_(v61, v77, @"http-keep-alive-idle-timeout-wifi-millis");
    uint64_t v81 = objc_msgSend_intValue(v78, v79, v80);

    uint64_t v83 = objc_msgSend_objectForKey_(v61, v82, @"http-keep-alive-idle-timeout-cell-millis");
    uint64_t v86 = objc_msgSend_intValue(v83, v84, v85);

    objc_msgSend_setShouldUsePipelining_(*(void **)(*v54 + 96), v87, v66);
    objc_msgSend_setConcurrentConnections_(*(void **)(*v54 + 96), v88, v71);
    objc_msgSend_setDisableKeepAlive_(*(void **)(*v54 + 96), v89, v76 ^ 1u);
    objc_msgSend_setKeepAliveWifi_(*(void **)(*v54 + 96), v90, v81);
    objc_msgSend_setKeepAliveCell_(*(void **)(*v54 + 96), v91, v86);
    id v92 = *(void **)(*v54 + 96);
    v95 = objc_msgSend_dataUsageBundleIdentifier(v58, v93, v94);
    objc_msgSend_setBundleIdentifierForDataUsage_(v92, v96, (uint64_t)v95);

    v97 = *(void **)(*v54 + 96);
    uint64_t v100 = objc_msgSend_forceCellular(v58, v98, v99);
    objc_msgSend_setForceCellularIfPossible_(v97, v101, v100);
    unsigned int v102 = *(void **)(*v54 + 96);
    uint64_t v105 = objc_msgSend_wantsIDSServer(v58, v103, v104);
    objc_msgSend_setRequireIDSHost_(v102, v106, v105);
    v107 = *(void **)(*v54 + 96);
    int isIDSMessage = objc_msgSend_isIDSMessage(v58, v108, v109);
    objc_msgSend_setShouldReturnTimingData_(v107, v111, isIDSMessage ^ 1u);
    objc_msgSend_load(*(void **)(*v54 + 96), v112, v113);
  }
  else
  {
    v114 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v114, OS_LOG_TYPE_DEFAULT, "Failing message, empty url request", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    v117 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v115, v116, v123, v125);
    if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
    {
      v118 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v140 = v118;
      _os_log_impl(&dword_1A7BC0000, v117, OS_LOG_TYPE_DEFAULT, "Failing message, empty url request for URL: %@", buf, 0xCu);
    }

    __int16 v119 = *(void **)(a1 + 32);
    uint64_t v121 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v120, *MEMORY[0x1E4F289A0], -1000, 0);
    objc_msgSend__notifyDelegateAboutError_(v119, v122, (uint64_t)v121);
  }
}

void sub_1A7BDC950(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_messageDelivery_oversized(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "%lu Message body: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1A7BDCA0C(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v103 = a4;
  id v102 = a5;
  id v101 = a6;
  if (a3 == 503)
  {
    long long v13 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFE770(v13);
    }

    objc_msgSend_forceBagLoad(*(void **)(*(void *)(a1 + 32) + 152), v14, v15);
    objc_msgSend_forceBagLoad(*(void **)(*(void *)(a1 + 32) + 160), v16, v17);
  }
  id v18 = objc_msgSend_allHeaderFields(v10, v11, v12);
  uint64_t v20 = objc_msgSend_objectForKey_(v18, v19, @"x-bag-refresh");
  int v23 = objc_msgSend_intValue(v20, v21, v22);

  if ((objc_opt_respondsToSelector() & (v23 > 0)) == 1)
  {
    int v26 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v24, v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFE6F8(v23, v26);
    }

    objc_msgSend_timeIntervalSinceNow((void *)qword_1E97395A8, v27, v28);
    int v32 = (void *)qword_1E97395A8;
    if (fabs(v31) > (double)v23)
    {
      id v33 = 0;
LABEL_15:
      qword_1E97395A8 = (uint64_t)v33;

      uint64_t v37 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v35, v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v128 = v23;
        *(_WORD *)&v128[4] = 2112;
        *(void *)&v128[6] = qword_1E97395A8;
        _os_log_impl(&dword_1A7BC0000, v37, OS_LOG_TYPE_DEFAULT, "  * Sending refresh, we're outside our interval: %d  (Last date: %@)", buf, 0x12u);
      }

      objc_msgSend_forceBagLoad(*(void **)(*(void *)(a1 + 32) + 152), v38, v39);
      objc_msgSend_forceBagLoad(*(void **)(*(void *)(a1 + 32) + 160), v40, v41);
      goto LABEL_18;
    }
    if (!qword_1E97395A8)
    {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      int v32 = (void *)qword_1E97395A8;
      goto LABEL_15;
    }
    uint64_t v34 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v29, v30);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v128 = v23;
      *(_WORD *)&v128[4] = 2112;
      *(void *)&v128[6] = qword_1E97395A8;
      _os_log_impl(&dword_1A7BC0000, v34, OS_LOG_TYPE_DEFAULT, "  * Not refreshing, we're still inside our interval: %d (Laste date: %@)", buf, 0x12u);
    }
  }
LABEL_18:
  uint64_t v42 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = *(void *)(a1 + 56);
    uint64_t v44 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218240;
    *(void *)v128 = v43;
    *(_WORD *)&v128[8] = 2048;
    *(void *)&v128[10] = v44;
    _os_log_impl(&dword_1A7BC0000, v42, OS_LOG_TYPE_DEFAULT, "%lu Finished URL request: %p", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v99 = *(void *)(a1 + 56);
      uint64_t v100 = *(void *)(a1 + 40);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v99 = *(void *)(a1 + 56);
      uint64_t v100 = *(void *)(a1 + 40);
      IMLogString();
    }
  }
  uint64_t v47 = *(void *)(a1 + 56);
  uint64_t v48 = objc_msgSend_description(*(void **)(a1 + 40), v45, v46, v99, v100);
  uint64_t v121 = MEMORY[0x1E4F143A8];
  uint64_t v122 = 3221225472;
  v123 = sub_1A7BDD2AC;
  v124 = &unk_1E5D1B130;
  uint64_t v126 = v47;
  id v49 = v48;
  id v125 = v49;
  cut_dispatch_log_queue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v52 = objc_msgSend_allHeaderFields(v10, v50, v51);
    long long v54 = objc_msgSend_objectForKey_(v52, v53, @"X-Apple-Splunk-Hint");
    objc_msgSend_setSplunkHint_(*(void **)(a1 + 48), v55, (uint64_t)v54);
    if (IMShouldLog())
    {
      id v58 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v56, v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v128 = v10;
        _os_log_impl(&dword_1A7BC0000, v58, OS_LOG_TYPE_DEFAULT, "Response: %p", buf, 0xCu);
      }

      id v61 = objc_msgSend_description(v52, v59, v60);
      uint64_t v115 = MEMORY[0x1E4F143A8];
      uint64_t v116 = 3221225472;
      v117 = sub_1A7BDD368;
      v118 = &unk_1E5D1B130;
      id v119 = v61;
      uint64_t v120 = v47;
      id v62 = v61;
      cut_dispatch_log_queue();
    }
  }
  else
  {
    long long v54 = 0;
  }
  uint64_t v63 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v50, v51);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v128 = v10;
    _os_log_impl(&dword_1A7BC0000, v63, OS_LOG_TYPE_DEFAULT, "           Response: %@", buf, 0xCu);
  }

  uint64_t v66 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v64, v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v128 = a3;
    _os_log_impl(&dword_1A7BC0000, v66, OS_LOG_TYPE_DEFAULT, "       Replied Code: %d", buf, 8u);
  }

  uint64_t v69 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v67, v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    int v72 = objc_msgSend_length(v103, v70, v71);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v128 = v72;
    _os_log_impl(&dword_1A7BC0000, v69, OS_LOG_TYPE_DEFAULT, " Result Data Length: %d", buf, 8u);
  }

  uint64_t v75 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v73, v74);
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v128 = v102;
    _os_log_impl(&dword_1A7BC0000, v75, OS_LOG_TYPE_DEFAULT, "              Error: %@", buf, 0xCu);
  }

  objc_msgSend__clearRetryTimer(*(void **)(a1 + 32), v76, v77);
  id v78 = *(void **)(a1 + 48);
  uint64_t v81 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v79, v80);
  objc_msgSend_setResponseReceived_(v78, v82, (uint64_t)v81);

  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = sub_1A7BDD424;
  v105[3] = &unk_1E5D1B158;
  uint64_t v114 = a3;
  id v106 = *(id *)(a1 + 48);
  id v83 = v10;
  id v107 = v83;
  id v84 = v102;
  uint64_t v85 = *(void *)(a1 + 32);
  id v108 = v84;
  uint64_t v109 = v85;
  id v110 = *(id *)(a1 + 40);
  id v86 = v103;
  id v111 = v86;
  id v87 = v101;
  id v112 = v87;
  id v88 = v54;
  id v113 = v88;
  uint64_t v89 = (void (**)(void, void))MEMORY[0x1AD0D56D0](v105);
  if (objc_msgSend_isIDSMessage(*(void **)(a1 + 48), v90, v91)
    && (objc_msgSend_anisetteHeadersTimeout(*(void **)(a1 + 48), v92, v93), v96 > -1.0))
  {
    v97 = objc_msgSend_sharedInstance(FTAuthKitManager, v94, v95);
    objc_msgSend_handleResponse_forRequest_completionBlock_(v97, v98, (uint64_t)v83, *(void *)(a1 + 40), v89);
  }
  else
  {
    v89[2](v89, 0);
  }
}

void sub_1A7BDD2AC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_messageDelivery_oversized(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "%lu Information about finished URL request: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1A7BDD368(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_messageDelivery_oversized(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "%lu Information about response headers: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1A7BDD424(uint64_t a1, const char *a2, uint64_t a3)
{
  int context = (int)a2;
  uint64_t v324 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (uint64_t *)(a1 + 96);
  BOOL v310 = (unint64_t)(*(void *)(a1 + 96) - 400) < 0xC8;
  int isIDSMessage = objc_msgSend_isIDSMessage(*(void **)(a1 + 32), a2, a3);
  v314 = objc_msgSend_allHeaderFields((void *)*(v4 - 7), v6, v7);
  if (_os_feature_enabled_impl()
    && (uint64_t v8 = (void *)MEMORY[0x1AD0D4F50](@"IDSBAASigner", @"IDS")) != 0
    && objc_msgSend_isBAAHTTPResponseCode_(v8, v9, *v4))
  {
    v313 = objc_msgSend_numberWithInteger_(NSNumber, v10, *v4);
    long long v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v317 = v313;
      _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Noticed BAA failure in response %@", buf, 0xCu);
    }

    BOOL v310 = 0;
    int context = 0;
  }
  else
  {
    v313 = 0;
  }
  uint64_t v14 = (void **)(a1 + 48);
  int v15 = v310;
  if (*(void *)(a1 + 48)) {
    int v15 = 1;
  }
  if (((context | v15) & isIDSMessage) == 1)
  {
    uint64_t v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *v14;
      *(_DWORD *)buf = 138412290;
      *(void *)v317 = v17;
      _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Connection failed with error: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v299 = *v14;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v299 = *v14;
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v18, v19, v299))
    {
      uint64_t v22 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v20, v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = *v14;
        *(_DWORD *)buf = 138412290;
        *(void *)v317 = v23;
        _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_DEFAULT, "Connection failed with error: %@", buf, 0xCu);
      }
    }
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v20, v21))
    {
      int v26 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v24, v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFE8CC((int *)v4, (void **)(a1 + 48), v26);
      }
    }
    uint64_t v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v30 = *(_DWORD *)v4;
      objc_msgSend_domain(*v14, v28, v29);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      int v34 = objc_msgSend_code(*v14, v32, v33);
      objc_msgSend_localizedDescription(*v14, v35, v36);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      int v40 = objc_msgSend_userInfo(*v14, v38, v39);
      uint64_t v42 = objc_msgSend_objectForKey_(v40, v41, *MEMORY[0x1E4F289C0]);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v317 = v30;
      *(_WORD *)&v317[4] = 2112;
      *(void *)&v317[6] = v31;
      __int16 v318 = 1024;
      int v319 = v34;
      __int16 v320 = 2112;
      id v321 = v37;
      __int16 v322 = 2112;
      v323 = v42;
      _os_log_impl(&dword_1A7BC0000, v27, OS_LOG_TYPE_ERROR, "FTMessageDelivery failed! (HTTP Status Code: %d) Error (%@:%d): %@ %@", buf, 0x2Cu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v45 = *(unsigned int *)v4;
      uint64_t v46 = objc_msgSend_domain(*v14, v43, v44);
      uint64_t v49 = objc_msgSend_code(*v14, v47, v48);
      int v52 = objc_msgSend_localizedDescription(*v14, v50, v51);
      uint64_t v55 = objc_msgSend_userInfo(*v14, v53, v54);
      uint64_t v56 = *MEMORY[0x1E4F289C0];
      v308 = objc_msgSend_objectForKey_(v55, v57, *MEMORY[0x1E4F289C0]);
      uint64_t v301 = v45;
      _IDSWarnV();

      uint64_t v58 = *(unsigned int *)v4;
      id v61 = objc_msgSend_domain(*v14, v59, v60, v301, v46, v49, v52, v308);
      uint64_t v64 = objc_msgSend_code(*v14, v62, v63);
      int v67 = objc_msgSend_localizedDescription(*v14, v65, v66);
      uint64_t v70 = objc_msgSend_userInfo(*v14, v68, v69);
      v309 = objc_msgSend_objectForKey_(v70, v71, v56);
      uint64_t v302 = v58;
      _IDSLogV();

      uint64_t v72 = *(unsigned int *)v4;
      uint64_t v75 = objc_msgSend_domain(*v14, v73, v74, v302, v61, v64, v67, v309);
      uint64_t v78 = objc_msgSend_code(*v14, v76, v77);
      uint64_t v81 = objc_msgSend_localizedDescription(*v14, v79, v80);
      id v84 = objc_msgSend_userInfo(*v14, v82, v83);
      objc_msgSend_objectForKey_(v84, v85, v56);
      v307 = v306 = v81;
      v304 = v75;
      uint64_t v305 = v78;
      uint64_t v300 = v72;
      _IDSLogTransport();
    }
    uint64_t v86 = *v4;
    if ((unint64_t)(*v4 - 500) <= 0x63)
    {
      id v87 = objc_msgSend_URL(*(void **)(a1 + 64), v43, v44);
      v90 = objc_msgSend_absoluteString(v87, v88, v89);

      uint64_t v93 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v91, v92);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFE84C();
      }

      double v96 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v94, v95);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFE7B4();
      }

      v98 = objc_msgSend_metricWithDomain_type_error_bagURL_(MEMORY[0x1E4F6B588], v97, 2, 0, v86, v90);
      id v101 = objc_msgSend_logger(MEMORY[0x1E4F6B580], v99, v100);
      objc_msgSend_logMetric_(v101, v102, (uint64_t)v98);
    }
    id v103 = objc_msgSend_domain(*v14, v43, v44, v300, v304, v305, v306, v307);
    int isEqualToString = objc_msgSend_isEqualToString_(v103, v104, *MEMORY[0x1E4F6C280]);

    id v108 = *v14;
    if (isEqualToString)
    {
      if (objc_msgSend_code(v108, v106, v107) == -1)
      {
        if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v109, v110))
        {
          id v111 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v109, v110);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            id v112 = "... this was a remote loader crash";
LABEL_196:
            _os_log_impl(&dword_1A7BC0000, v111, OS_LOG_TYPE_DEFAULT, v112, buf, 2u);
            goto LABEL_197;
          }
          goto LABEL_197;
        }
        goto LABEL_207;
      }
LABEL_206:
      if (((v310 | context) & 1) == 0) {
        goto LABEL_211;
      }
      goto LABEL_207;
    }
    v161 = objc_msgSend_domain(v108, v106, v107);
    int v163 = objc_msgSend_isEqualToString_(v161, v162, *MEMORY[0x1E4F6B2D0]);

    v166 = *v14;
    if (v163)
    {
      uint64_t v167 = objc_msgSend_code(v166, v164, v165);
      switch(v167)
      {
        case 2:
          if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v109, v110))
          {
            id v111 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v109, v110);
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              id v112 = "... IDS message timed out";
              goto LABEL_196;
            }
            goto LABEL_197;
          }
          goto LABEL_207;
        case 1:
          if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v109, v110))
          {
            id v111 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v109, v110);
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              id v112 = "... IDS message failed sending";
              goto LABEL_196;
            }
            goto LABEL_197;
          }
          goto LABEL_207;
        case 0:
          v168 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7BC0000, v168, OS_LOG_TYPE_DEFAULT, "... no error, ignoring...", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          break;
      }
      goto LABEL_206;
    }
    v194 = objc_msgSend_domain(v166, v164, v165);
    int v196 = objc_msgSend_isEqualToString_(v194, v195, *MEMORY[0x1E4F289A0]);

    if (!v196) {
      goto LABEL_206;
    }
    uint64_t v197 = objc_msgSend_code(*v14, v109, v110);
    if (v197 <= -1023)
    {
      if (v197 != -2000 && v197 != -1200) {
        goto LABEL_202;
      }
    }
    else if (((unint64_t)(v197 + 1022) > 0x16 || ((1 << (v197 - 2)) & 0x6F6C3D) == 0) {
           && v197 != -1)
    }
    {
LABEL_202:
      if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v198, v199))
      {
        v292 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v109, v110);
        if (os_log_type_enabled(v292, OS_LOG_TYPE_DEFAULT))
        {
          int v295 = objc_msgSend_code(*v14, v293, v294);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v317 = v295;
          _os_log_impl(&dword_1A7BC0000, v292, OS_LOG_TYPE_DEFAULT, "... we're done here, code: %d", buf, 8u);
        }
      }
      goto LABEL_206;
    }
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v198, v199))
    {
      id v111 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v109, v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v112 = "... we should retry this";
        goto LABEL_196;
      }
LABEL_197:
    }
LABEL_207:
    if ((objc_msgSend_wantsCFNetworkTimeout(*(void **)(a1 + 32), v109, v110) & 1) == 0
      && objc_msgSend_wantsManagedRetries(*(void **)(a1 + 32), v109, v110))
    {
      if (objc_msgSend__tryRetryMessageWithTimeInterval_(*(void **)(a1 + 56), v109, v110, 0.0)) {
        goto LABEL_216;
      }
      goto LABEL_215;
    }
LABEL_211:
    if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v109, v110))
    {
      v298 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v296, v297);
      if (os_log_type_enabled(v298, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v298, OS_LOG_TYPE_DEFAULT, "... not going to retry, we're done", buf, 2u);
      }
    }
LABEL_215:
    objc_msgSend__informDelegatesOfMessage_result_resultCode_error_(*(void **)(a1 + 56), v296, *(void *)(a1 + 32), 0, 20000, *(void *)(a1 + 48));
    goto LABEL_216;
  }
  contexta = (void *)MEMORY[0x1AD0D54C0]();
  uint64_t v115 = objc_msgSend_statusCode(*(void **)(a1 + 40), v113, v114);
  uint64_t v116 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v317 = v314;
    _os_log_impl(&dword_1A7BC0000, v116, OS_LOG_TYPE_DEFAULT, "  headers: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v299 = v314;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v299 = v314;
      IMLogString();
    }
  }
  v117 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v317 = v115;
    _os_log_impl(&dword_1A7BC0000, v117, OS_LOG_TYPE_DEFAULT, "  status code: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v299 = (void *)v115;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v299 = (void *)v115;
      IMLogString();
    }
  }
  if (objc_msgSend_count(v314, v118, v119, v299))
  {
    uint64_t v122 = objc_msgSend_currentMessage(*(void **)(a1 + 56), v120, v121);
    BOOL v123 = v122 == 0;

    if (!v123)
    {
      v124 = objc_msgSend_currentMessage(*(void **)(a1 + 56), v120, v121);
      objc_msgSend_handleResponseHeaders_(v124, v125, (uint64_t)v314);
    }
  }
  if (v115)
  {
    uint64_t v126 = objc_msgSend_currentMessage(*(void **)(a1 + 56), v120, v121);
    objc_msgSend_handleResponseStatus_(v126, v127, v115);
  }
  if (objc_msgSend_length(*(void **)(a1 + 72), v120, v121))
  {
    v130 = objc_msgSend_currentMessage(*(void **)(a1 + 56), v128, v129);
    objc_msgSend_handleResponseBody_(v130, v131, *(void *)(a1 + 72));
  }
  uint64_t v132 = objc_msgSend_currentMessage(*(void **)(a1 + 56), v128, v129);
  if ((objc_msgSend_isIDSMessage(v132, v133, v134) & 1) == 0)
  {
    BOOL v135 = *(void *)(a1 + 80) == 0;

    if (v135) {
      goto LABEL_67;
    }
    uint64_t v132 = objc_msgSend_currentMessage(*(void **)(a1 + 56), v136, v137);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_setTimingData_(v132, v138, *(void *)(a1 + 80));
    }
  }

LABEL_67:
  v139 = objc_msgSend_currentMessage(*(void **)(a1 + 56), v136, v137);
  uint64_t v142 = objc_msgSend_length(*(void **)(a1 + 72), v140, v141);
  objc_msgSend_setReceivedByteCount_(v139, v143, v142);

  v144 = *(void **)(a1 + 56);
  uint64_t v145 = *(void *)(a1 + 72);
  uint64_t v146 = *(void *)(a1 + 32);
  id v315 = 0;
  v148 = objc_msgSend__processResultData_forMessage_error_(v144, v147, v145, v146, &v315);
  id v151 = v315;
  v152 = (void *)0x1E4F6C000;
  if (v151)
  {
    v153 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v149, v150);
    if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFEA78();
    }
  }
  v155 = objc_msgSend_objectForKey_(v148, v149, @"status");
  if (v155)
  {
    v156 = objc_msgSend_objectForKey_(v148, v154, @"status");
    int v159 = objc_msgSend_intValue(v156, v157, v158);

    uint64_t v160 = v159;
  }
  else
  {
    uint64_t v160 = 1;
  }

  int v171 = objc_msgSend_isIDSMessage(*(void **)(a1 + 32), v169, v170);
  if (v160 == 1) {
    int v173 = v171;
  }
  else {
    int v173 = 1;
  }
  if (v173) {
    uint64_t v174 = v160;
  }
  else {
    uint64_t v174 = 0;
  }
  v175 = objc_msgSend_objectForKey_(v148, v172, @"retry-interval");
  objc_msgSend_doubleValue(v175, v176, v177);
  double v179 = v178;

  v181 = objc_msgSend_objectForKey_(v148, v180, @"current-timestamp-ms");
  if (_os_feature_enabled_impl())
  {
    if (v313)
    {
      uint64_t v174 = objc_msgSend_integerValue(v313, v182, v183);
      if (v174 == 440)
      {
        v185 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v182, v184);
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v185, OS_LOG_TYPE_DEFAULT, "BAA Do Not Retry detected. Swapping status code to Do Not Retry", buf, 2u);
        }

        v187 = (void *)MEMORY[0x1AD0D4F50](@"IDSBAASigner", @"IDS");
        if (v187
          && (objc_msgSend_baaSigningError(*(void **)(a1 + 32), v182, v186),
              uint64_t v160 = objc_claimAutoreleasedReturnValue(),
              int shouldRetryError = objc_msgSend_shouldRetryError_(v187, v188, v160),
              (id)v160,
              shouldRetryError))
        {
          uint64_t v160 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v182, v190);
          if (os_log_type_enabled((os_log_t)v160, OS_LOG_TYPE_DEFAULT))
          {
            v193 = objc_msgSend_baaSigningError(*(void **)(a1 + 32), v191, v192);
            *(_DWORD *)buf = 138412290;
            *(void *)v317 = v193;
            _os_log_impl(&dword_1A7BC0000, (os_log_t)v160, OS_LOG_TYPE_DEFAULT, "Received BAA DoNotRetry, but see we should retry due to client error %@", buf, 0xCu);
          }
          uint64_t v174 = 6002;
        }
        else
        {
          uint64_t v174 = 6001;
        }
      }
    }
    v200 = objc_msgSend_objectForKey_(v314, v182, @"x-apple-server-time");
    if (v200)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v203 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
        uint64_t v160 = objc_msgSend_numberFromString_(v203, v204, (uint64_t)v200);

        v181 = (void *)v160;
      }
      if (!v181)
      {
        v205 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v201, v202);
        if (os_log_type_enabled(v205, OS_LOG_TYPE_FAULT)) {
          sub_1A7BFEA04();
        }

        v181 = 0;
      }
    }
  }
  if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v182, v183))
  {
    v208 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v206, v207);
    if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v317 = v174;
      _os_log_impl(&dword_1A7BC0000, v208, OS_LOG_TYPE_DEFAULT, "Result status code: %d", buf, 8u);
    }

    v210 = objc_msgSend_objectForKey_(v148, v209, @"message");
    v213 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v211, v212);
    if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v214 = *(void *)(a1 + 88);
      *(_DWORD *)buf = 138543362;
      *(void *)v317 = v214;
      _os_log_impl(&dword_1A7BC0000, v213, OS_LOG_TYPE_DEFAULT, "SplunkHint: %{public}@", buf, 0xCu);
    }

    v217 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v215, v216);
    if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v317 = v210;
      _os_log_impl(&dword_1A7BC0000, v217, OS_LOG_TYPE_DEFAULT, "ServerErrorDetail: %{public}@", buf, 0xCu);
    }
  }
  if (!objc_msgSend_wantsStatusCodeBasedRetries(*(void **)(a1 + 32), v206, v207)) {
    goto LABEL_143;
  }
  if (v174 > 442)
  {
    if (v174 == 443 || v174 == 6003)
    {
      if (v181)
      {
        objc_msgSend_setServerTimestamp_(*(void **)(a1 + 32), v218, (uint64_t)v181);
        v226 = NSNumber;
        v229 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v227, v228);
        objc_msgSend_timeIntervalSince1970(v229, v230, v231);
        v222 = objc_msgSend_numberWithDouble_(v226, v232, v233);

        objc_msgSend_setServerTimestampReceivedDate_(*(void **)(a1 + 32), v234, (uint64_t)v222);
        objc_msgSend_setFtMessageDeliveryServerTimestamp_(MEMORY[0x1E4F6C408], v235, (uint64_t)v181);
        objc_msgSend_setFtMessageDeliveryServerTimestampReceivedDate_(MEMORY[0x1E4F6C408], v236, (uint64_t)v222);
        if (objc_msgSend_logToRegistration(*(void **)(a1 + 56), v237, v238))
        {
          v241 = objc_msgSend_nonce(MEMORY[0x1E4F6C3B8], v239, v240);
          if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v317 = v181;
            _os_log_impl(&dword_1A7BC0000, v241, OS_LOG_TYPE_DEFAULT, "Setting server timestamp %@", buf, 0xCu);
          }
        }
        goto LABEL_158;
      }
    }
    else if (v174 == 6002)
    {
      if (v179 < 10.0) {
        double v179 = 300.0;
      }
      if (!objc_msgSend_logToRegistration(*(void **)(a1 + 56), v218, v219)) {
        goto LABEL_159;
      }
      v222 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v220, v221);
      if (!os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_158;
      }
      *(_DWORD *)buf = 134217984;
      *(double *)v317 = v179;
      v223 = "Server requested retry with delay, will retry after %f seconds";
      v224 = v222;
      uint32_t v225 = 12;
      goto LABEL_157;
    }
LABEL_143:
    v242 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
    {
      int CanBeLogged = objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 32), v243, v244);
      if (CanBeLogged)
      {
        v152 = objc_msgSend_messageBodyUsingCache(*(void **)(a1 + 32), v245, v246);
        uint64_t v160 = objc_msgSend_description(v152, v248, v249);
        IDSLoggableDescriptionForObjectOnService();
        v250 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v250 = @"(Not Loggable)";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v317 = v250;
      _os_log_impl(&dword_1A7BC0000, v242, OS_LOG_TYPE_DEFAULT, "sent dictionary: %@", buf, 0xCu);
      if (CanBeLogged)
      {
      }
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        if (objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 32), v251, v252))
        {
          v255 = objc_msgSend_messageBodyUsingCache(*(void **)(a1 + 32), v253, v254);
          v258 = objc_msgSend_description(v255, v256, v257);
          IDSLoggableDescriptionForObjectOnService();
          v303 = (__CFString *)objc_claimAutoreleasedReturnValue();
          MarcoLog();
        }
        else
        {
          v303 = @"(Not Loggable)";
          MarcoLog();
        }
      }
      if (IMShouldLog())
      {
        if (objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 32), v274, v275))
        {
          v278 = objc_msgSend_messageBodyUsingCache(*(void **)(a1 + 32), v276, v277);
          v281 = objc_msgSend_description(v278, v279, v280);
          IDSLoggableDescriptionForObjectOnService();
          v303 = (__CFString *)objc_claimAutoreleasedReturnValue();
          IMLogString();
        }
        else
        {
          v303 = @"(Not Loggable)";
          IMLogString();
        }
      }
    }
    v282 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v282, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_allKeys(v148, v283, v284);
      id v285 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)v317 = v285;
      _os_log_impl(&dword_1A7BC0000, v282, OS_LOG_TYPE_DEFAULT, "         result: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        objc_msgSend_allKeys(v148, v286, v287);
        v303 = (__CFString *)objc_claimAutoreleasedReturnValue();
        MarcoLog();
      }
      if (IMShouldLog())
      {
        objc_msgSend_allKeys(v148, v288, v289);
        v303 = (__CFString *)objc_claimAutoreleasedReturnValue();
        IMLogString();
      }
    }
    v290 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v290, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v317 = v174;
      _os_log_impl(&dword_1A7BC0000, v290, OS_LOG_TYPE_DEFAULT, "    status code: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v303 = (__CFString *)v174;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v303 = (__CFString *)v174;
        IMLogString();
      }
    }
    objc_msgSend__informDelegatesOfMessage_result_resultCode_error_(*(void **)(a1 + 56), v291, *(void *)(a1 + 32), v148, v174, *(void *)(a1 + 48), v303);
    goto LABEL_189;
  }
  if (v174 != 441)
  {
    if (v174 != 442) {
      goto LABEL_143;
    }
    if (!objc_msgSend_logToRegistration(*(void **)(a1 + 56), v218, v219)) {
      goto LABEL_159;
    }
    v222 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v220, v221);
    if (!os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_158;
    }
    *(_WORD *)buf = 0;
    v223 = "Server requested BAA cert purge, will retry";
LABEL_156:
    v224 = v222;
    uint32_t v225 = 2;
LABEL_157:
    _os_log_impl(&dword_1A7BC0000, v224, OS_LOG_TYPE_DEFAULT, v223, buf, v225);
    goto LABEL_158;
  }
  v259 = objc_msgSend_baaSigner(*(void **)(a1 + 56), v218, v219);
  v262 = objc_msgSend_topic(*(void **)(a1 + 32), v260, v261);
  objc_msgSend_purgeBAACertForTopic_(v259, v263, (uint64_t)v262);

  if (!objc_msgSend_logToRegistration(*(void **)(a1 + 56), v264, v265)) {
    goto LABEL_159;
  }
  v222 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v220, v221);
  if (os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v223 = "Server requested BAA cert purge, will retry";
    goto LABEL_156;
  }
LABEL_158:

LABEL_159:
  int v266 = objc_msgSend__tryRetryMessageWithTimeInterval_(*(void **)(a1 + 56), v220, v221, v179);
  int v269 = objc_msgSend_logToRegistration(*(void **)(a1 + 56), v267, v268);
  if (v266)
  {
    if (v269)
    {
      v272 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v270, v271);
      if (os_log_type_enabled(v272, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v272, OS_LOG_TYPE_DEFAULT, "Kicked off server retry", buf, 2u);
      }
    }
  }
  else
  {
    if (v269)
    {
      v273 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v270, v271);
      if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v273, OS_LOG_TYPE_DEFAULT, "Unable to retry this message any further", buf, 2u);
      }
    }
    objc_msgSend__informDelegatesOfMessage_result_resultCode_error_(*(void **)(a1 + 56), v270, *(void *)(a1 + 32), v148, v174, *(void *)(a1 + 48));
  }
LABEL_189:

LABEL_216:
}

void sub_1A7BDFAC4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_messageDelivery_oversized(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "%@ Message body: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1A7BDFB80(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_messageDelivery_oversized(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "%@ Message body: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1A7BDFC3C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_messageDelivery_oversized(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "%@ Message body: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1A7BDFCF8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_messageDelivery_oversized(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "%@ Message body: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1A7BDFE74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7BE0A64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7BE0C64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7BE0E24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *sub_1A7BE1304()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("_CFNetworkCopyPreferredLanguageCode", @"CFNetwork");
  off_1EB47C6E0 = result;
  return result;
}

uint64_t sub_1A7BE1398()
{
  qword_1EB47C870 = objc_alloc_init(FTMessageDelivery_APS);

  return MEMORY[0x1F41817F8]();
}

void sub_1A7BE16EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  objc_msgSend_connection(v3, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelOutgoingMessage_(v8, v7, (uint64_t)v4);
}

uint64_t sub_1A7BE174C(uint64_t a1, const char *a2, void *a3)
{
  return objc_msgSend_invalidate(a3, a2, (uint64_t)a3);
}

uint64_t sub_1A7BE1754(uint64_t a1, const char *a2, void *a3)
{
  return objc_msgSend_invalidate(a3, a2, (uint64_t)a3);
}

uint64_t sub_1A7BE22EC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__messageCompletelyTimedOut_, a2);
}

void sub_1A7BE351C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7BE364C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__messageNeedsRetry_(WeakRetained, v5, (uint64_t)v3);
  }
  else
  {
    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Self dealloced, not calling timer handler for message retry.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

void sub_1A7BE374C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__messageAckGracePeriodTimedOut_(WeakRetained, v5, (uint64_t)v3);
  }
  else
  {
    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Self dealloced, not calling timer handler for message ack grace period timeout.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

void sub_1A7BE4604(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__messageACKTimedOut_(WeakRetained, v5, (uint64_t)v3);
  }
  else
  {
    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Self dealloced, not calling timer handler for message ACK timeout.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

void sub_1A7BE4704(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend__messageSendTimedOut_(WeakRetained, v5, (uint64_t)v3);
  }
  else
  {
    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Self dealloced, not calling timer handler for message send timeout.", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

void sub_1A7BE48D0(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_msgSend__noteMessageSent_ftMessage_body_(*(void **)(a1 + 32), v3, (uint64_t)v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
    objc_msgSend__updateTopics(*(void **)(a1 + 32), v5, v6);
    int v7 = *(void **)(a1 + 40);
    uint64_t v10 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v8, v9);
    objc_msgSend_setRequestStart_(v7, v11, (uint64_t)v10);

    uint64_t v12 = (void *)MEMORY[0x1AD0D54C0]();
    int v15 = objc_msgSend_connection(*(void **)(a1 + 32), v13, v14);
    objc_msgSend_sendOutgoingMessage_(v15, v16, (uint64_t)v4);

    uint64_t v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_bagKey(*(void **)(a1 + 40), v18, v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIDString(*(void **)(a1 + 40), v21, v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      int v26 = objc_msgSend_connection(*(void **)(a1 + 32), v24, v25);
      *(_DWORD *)buf = 138413058;
      id v39 = v4;
      __int16 v40 = 2112;
      id v41 = v20;
      __int16 v42 = 2112;
      id v43 = v23;
      __int16 v44 = 2112;
      uint64_t v45 = v26;
      _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Sent outgoing message: %@ to command: %@   (Request ID: %@   Connection: %@)", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v29 = objc_msgSend_bagKey(*(void **)(a1 + 40), v27, v28);
      int v32 = objc_msgSend_uniqueIDString(*(void **)(a1 + 40), v30, v31);
      id v37 = objc_msgSend_connection(*(void **)(a1 + 32), v33, v34);
      _IDSLogV();
    }
  }
  else
  {
    uint64_t v35 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v39 = v36;
      _os_log_impl(&dword_1A7BC0000, v35, OS_LOG_TYPE_ERROR, "Could not generate APSMessage for message: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

void sub_1A7BE5B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A7BE5B74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A7BE5B84(uint64_t a1)
{
}

void sub_1A7BE5B8C(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v5 = objc_msgSend_topic(v16, v3, v4);
  if (objc_msgSend_length(v5, v6, v7))
  {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v8, (uint64_t)v5);
    if (objc_msgSend_ultraConstrainedAllowed(v16, v9, v10))
    {
      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        int v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend_addObject_(v12, v11, (uint64_t)v5);
    }
  }
}

void sub_1A7BE5C44(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v5 = objc_msgSend_topic(v16, v3, v4);
  if (objc_msgSend_length(v5, v6, v7))
  {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v8, (uint64_t)v5);
    if (objc_msgSend_ultraConstrainedAllowed(v16, v9, v10))
    {
      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        int v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend_addObject_(v12, v11, (uint64_t)v5);
    }
  }
}

void sub_1A7BE72E0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {

    objc_end_catch();
    JUMPOUT(0x1A7BE6198);
  }
  _Unwind_Resume(a1);
}

id sub_1A7BE7358()
{
  if (qword_1EB47C6F8 != -1) {
    dispatch_once(&qword_1EB47C6F8, &unk_1EFE07640);
  }
  CFStringRef v0 = (void *)off_1EB47C6E8();

  return v0;
}

void sub_1A7BE73B0(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v6 = objc_msgSend_allKeys(v3, v4, v5);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v39, v47, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v2 = objc_msgSend_objectForKey_(v3, v8, v12, v35, v37);

        if (v2)
        {
          uint64_t v14 = *(void **)(a1 + 32);
          uint64_t v2 = objc_msgSend_objectForKey_(v3, v13, v12);
          objc_msgSend_setObject_forKey_(v14, v15, (uint64_t)v2, v12);
        }
        id v16 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v2 = objc_msgSend_objectForKey_(v3, v17, v12);
          *(_DWORD *)buf = 138412546;
          uint64_t v44 = v12;
          __int16 v45 = 2112;
          uint64_t v46 = v2;
          _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v2 = objc_msgSend_objectForKey_(v3, v8, v12);
          uint64_t v35 = v12;
          id v37 = v2;
          _IDSLogV();
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v39, v47, 16);
    }
    while (v9);
  }

  id v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int CanBeLogged = objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 40), v19, v20);
    if (CanBeLogged)
    {
      uint64_t v9 = objc_msgSend_description(*(void **)(a1 + 48), v21, v22);
      uint64_t v2 = objc_msgSend_service(*(void **)(a1 + 40), v24, v25);
      IDSLoggableDescriptionForObjectOnService();
      int v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v26 = @"(Not Loggable)";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v44 = (uint64_t)v26;
    _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_DEFAULT, "Final delivery payload: %@", buf, 0xCu);
    if (CanBeLogged)
    {
    }
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if (objc_msgSend_payloadCanBeLogged(*(void **)(a1 + 40), v27, v28))
    {
      uint64_t v31 = objc_msgSend_description(*(void **)(a1 + 48), v29, v30);
      uint64_t v34 = objc_msgSend_service(*(void **)(a1 + 40), v32, v33);
      uint64_t v36 = IDSLoggableDescriptionForObjectOnService();
      _IDSLogV();
    }
    else
    {
      _IDSLogV();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1A7BE78C8(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 144);
  uint64_t v7 = objc_msgSend_uniqueIDString(*(void **)(a1 + 40), v5, v6);
  uint64_t v9 = objc_msgSend_objectForKey_(v4, v8, (uint64_t)v7);

  if (!v9)
  {
    if (!*(void *)(*(void *)(a1 + 32) + 144))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(v13 + 144);
      *(void *)(v13 + 144) = Mutable;
    }
    if (v3)
    {
      int v15 = *(void **)(a1 + 40);
      id v16 = *(__CFDictionary **)(*(void *)(a1 + 32) + 144);
      id v17 = v3;
      uint64_t v20 = (const void *)objc_msgSend_uniqueIDString(v15, v18, v19);
      CFDictionarySetValue(v16, v20, v17);
    }
  }
  if ((objc_msgSend_wantsBinaryPush(*(void **)(a1 + 40), v10, v11) & 1) == 0)
  {
    id v23 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v21, v22);
    int v26 = objc_msgSend_processName(v23, v24, v25);
    IMLogSimulateCrashForProcess();
  }
  if (objc_msgSend_wantsBinaryPush(*(void **)(a1 + 40), v21, v22))
  {
    id v29 = v3;
  }
  else
  {
    objc_msgSend__FTFilteredDictionaryForAPS(v3, v27, v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v30 = v29;
  id v31 = objc_alloc(*(Class *)(*(void *)(a1 + 32) + 104));
  uint64_t v34 = objc_msgSend_topic(*(void **)(a1 + 40), v32, v33);
  uint64_t v36 = objc_msgSend_initWithTopic_userInfo_(v31, v35, (uint64_t)v34, v30);

  if (objc_msgSend_wantsBinaryPush(*(void **)(a1 + 40), v37, v38))
  {
    long long v41 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v56 = v42;
      _os_log_impl(&dword_1A7BC0000, v41, OS_LOG_TYPE_DEFAULT, "Sending message: %@ as binary push", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v54 = *(void *)(a1 + 40);
      _IDSLogV();
    }
    objc_msgSend_setPayloadFormat_(v36, v43, 1, v54);
  }
  uint64_t v44 = objc_msgSend_uniqueID(*(void **)(a1 + 40), v39, v40);
  objc_msgSend_setIdentifier_(v36, v45, v44);
  objc_msgSend_timeout(*(void **)(a1 + 40), v46, v47);
  objc_msgSend_setTimeout_(v36, v49, (unint64_t)v48);
  if (objc_msgSend_highPriority(*(void **)(a1 + 40), v50, v51))
  {
    objc_msgSend_setCritical_(v36, v52, 1);
    objc_msgSend_setPriority_(v36, v53, 2);
  }
  else
  {
    objc_msgSend_setPriority_(v36, v52, 1);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void *sub_1A7BE7C68()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("PLLogRegisteredEvent", @"PowerLog");
  off_1EB47C7B8 = result;
  return result;
}

void sub_1A7BE803C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A7BE8078(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"YES";
    if (!v3) {
      uint64_t v5 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    int v67 = v5;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Created APSOutgoingMessage body: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v8 = @"YES";
    if (!v3) {
      id v8 = @"NO";
    }
    id v62 = v8;
    _IDSLogV();
  }
  if (objc_msgSend_count(v3, v6, v7, v62))
  {
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      int v67 = v10;
      _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Delivering message to command: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v63 = *(void *)(a1 + 32);
      _IDSLogV();
    }
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v11, v12, v63);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v15 = objc_msgSend_objectForKey_(v3, v14, @"c");

    if (v15)
    {
      id v17 = objc_msgSend_objectForKey_(v3, v16, @"c");
      objc_msgSend_setObject_forKey_(v13, v18, (uint64_t)v17, @"CommandID");
    }
    uint64_t v19 = objc_msgSend_objectForKey_(v3, v16, @"i");

    if (v19)
    {
      uint64_t v22 = objc_msgSend_objectForKey_(v3, v20, @"i");
      objc_msgSend_setObject_forKey_(v13, v23, (uint64_t)v22, @"MessageIdentifier");
    }
    uint64_t v24 = objc_msgSend_topic(*(void **)(a1 + 40), v20, v21);

    if (v24)
    {
      uint64_t v27 = objc_msgSend_topic(*(void **)(a1 + 40), v25, v26);
      objc_msgSend_setObject_forKey_(v13, v28, (uint64_t)v27, @"Topic");
    }
    id v29 = objc_msgSend_objectForKey_(v3, v25, @"U");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = (void *)MEMORY[0x1E4F1C9B8];
      int v32 = objc_msgSend_objectForKey_(v3, v30, @"U");
      uint64_t v34 = objc_msgSend__IDSDataFromBase64String_(v31, v33, (uint64_t)v32);
      JWUUIDPushObjectToString();
      uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v32 = objc_msgSend_objectForKey_(v3, v30, @"U");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = objc_msgSend_objectForKey_(v3, v40, @"U");
        JWUUIDPushObjectToString();
        uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        JWUUIDPushObjectToString();
        uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }

    if (v35)
    {
      uint64_t v42 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_topic(*(void **)(a1 + 40), v43, v44);
        __int16 v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        int v67 = v35;
        __int16 v68 = 2112;
        uint64_t v69 = v45;
        _os_log_impl(&dword_1A7BC0000, v42, OS_LOG_TYPE_DEFAULT, "OUTGOING-APS_DELIVERY:%@ SERVICE:%@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        objc_msgSend_topic(*(void **)(a1 + 40), v46, v47);
        uint64_t v65 = v64 = v35;
        _IDSLogV();
      }
      objc_msgSend_setObject_forKey_(v13, v46, (uint64_t)v35, @"MessageGUID", v64, v65);
    }
    uint64_t v48 = objc_opt_class();
    long long v50 = sub_1A7BE8888(v48, v3, (void *)*MEMORY[0x1E4F6ACC8]);
    if (v50) {
      objc_msgSend_setObject_forKey_(v13, v49, (uint64_t)v50, @"CommandContext");
    }
    uint64_t v51 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = objc_msgSend_service(*(void **)(a1 + 40), v52, v53);
      IDSLoggableDescriptionForObjectOnService();
      uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      int v67 = v55;
      __int16 v68 = 2112;
      uint64_t v69 = v35;
      _os_log_impl(&dword_1A7BC0000, v51, OS_LOG_TYPE_DEFAULT, "Message body: %@ [guid: %@]", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v58 = objc_msgSend_service(*(void **)(a1 + 40), v56, v57);
      uint64_t v64 = IDSLoggableDescriptionForObjectOnService();
      uint64_t v65 = v35;
      _IDSLogV();
    }
    int v59 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v67 = v13;
      _os_log_impl(&dword_1A7BC0000, v59, OS_LOG_TYPE_DEFAULT, "Logging outgoing push power event: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v64 = v13;
      _IDSLogV();
    }
    objc_msgSend__powerLogEvent_dictionary_(*(void **)(a1 + 48), v60, @"IDS OutgoingPushSent", v13, v64, v65);
    objc_msgSend__sendMessage_ftMessage_(*(void **)(a1 + 48), v61, (uint64_t)v3, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v36 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v36, OS_LOG_TYPE_DEFAULT, "Failing message, empty message", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    uint64_t v38 = *(void **)(a1 + 48);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v37, *MEMORY[0x1E4F289A0], -1000, 0);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v38, v39, (uint64_t)v13, 20000, *(void *)(a1 + 40));
  }
}

id sub_1A7BE8888(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = objc_msgSend_objectForKey_(a2, v6, (uint64_t)v5);
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
  }
  else
  {
    if (v7)
    {
      uint64_t v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v8, v9);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1A7BFEF80((uint64_t)v5, a1, v11);
      }
    }
    id v10 = 0;
  }

  return v10;
}

void sub_1A7BE9A04(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_activity_scope_state_s state, char a13)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1A7BE98B4);
  }
  objc_sync_exit(v13);
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(exc_buf);
}

void sub_1A7BEA330(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1A7BEA28CLL);
  }
  objc_sync_exit(v2);
  _Unwind_Resume(exc_buf);
}

void sub_1A7BEC028(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1A7BEBDD0);
  }
  _Unwind_Resume(a1);
}

void *sub_1A7BEC738()
{
  uint64_t result = (void *)MEMORY[0x1AD0D4F60]("_CFNetworkCopyPreferredLanguageCode", @"CFNetwork");
  off_1EB47C6E8 = result;
  return result;
}

id sub_1A7BECF50(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (objc_msgSend_length(v4, v5, v6))
  {
    id v8 = objc_msgSend_stringWithFormat_(NSString, v7, @"%@:b", v4);
    id v10 = objc_msgSend_objectForKey_(v3, v9, (uint64_t)v8);
    uint64_t v13 = v10;
    if (v10) {
      objc_msgSend__FTDataFromBase64String(v10, v11, v12);
    }
    else {
    uint64_t v14 = objc_msgSend_objectForKey_(v3, v11, (uint64_t)v4);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

id sub_1A7BED028(void *a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (objc_msgSend_count(v1, v2, v3))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v7 = objc_msgSend_allKeys(v1, v5, v6);
    uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v52, v56, 16);
    if (!v51) {
      goto LABEL_36;
    }
    uint64_t v9 = *(void *)v53;
    id v46 = v4;
    id v47 = v1;
    uint64_t v48 = v7;
    uint64_t v49 = *(void *)v53;
    while (1)
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v52 + 1) + 8 * i);
        if (objc_msgSend_length(v11, v12, v13))
        {
          uint64_t v15 = objc_msgSend_rangeOfString_(v11, v14, @":b");
          if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v17 = v11;
          }
          else
          {
            objc_msgSend_substringToIndex_(v11, v16, v15);
            id v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v18 = v17;
        }
        else
        {
          id v18 = 0;
        }

        uint64_t v20 = objc_msgSend_objectForKey_(v1, v19, (uint64_t)v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = sub_1A7BED028(v20);
          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v20) {
            goto LABEL_34;
          }
          uint64_t v21 = sub_1A7BECF50(v1, v18);
LABEL_30:
          id v31 = (void *)v21;
          objc_msgSend_setValue_forKey_(v4, v22, v21, v18, v46, v47);
          goto LABEL_33;
        }
        id v23 = v20;
        id v24 = v11;
        long long v50 = v23;
        if (!objc_msgSend_length(v24, v25, v26))
        {
          id v31 = 0;
          goto LABEL_32;
        }
        int hasSuffix = objc_msgSend_hasSuffix_(v24, v27, @":b");
        id v31 = objc_msgSend_mutableCopy(v23, v29, v30);
        uint64_t v34 = objc_msgSend_count(v31, v32, v33);
        if (v34 - 1 < 0) {
          goto LABEL_27;
        }
        uint64_t v36 = v34;
        do
        {
          id v37 = objc_msgSend_objectAtIndex_(v31, v35, --v36, v46, v47);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = sub_1A7BED028(v37);
LABEL_21:
            uint64_t v40 = (void *)v38;
            objc_msgSend_replaceObjectAtIndex_withObject_(v31, v39, v36, v38);

            goto LABEL_25;
          }
          if (hasSuffix)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v38 = objc_msgSend__FTDataFromBase64String(v37, v41, v42);
              goto LABEL_21;
            }
          }
LABEL_25:
        }
        while (v36 > 0);
        id v4 = v46;
        id v1 = v47;
LABEL_27:
        uint64_t v7 = v48;
LABEL_32:

        uint64_t v9 = v49;
        objc_msgSend_setValue_forKey_(v4, v43, (uint64_t)v31, v18, v46, v47);
LABEL_33:

LABEL_34:
      }
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v44, (uint64_t)&v52, v56, 16);
      if (!v51)
      {
LABEL_36:

        goto LABEL_38;
      }
    }
  }
  id v4 = v1;
LABEL_38:

  return v4;
}

void sub_1A7BEE270(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    uint64_t v13 = a2;
    __int16 v14 = 2112;
    uint64_t v15 = a3;
    _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "CT Request callback: %@: %@", (uint8_t *)&v12, 0x16u);
  }

  id v10 = objc_msgSend_sharedInstance(FTEntitlementSupport, v8, v9);
  objc_msgSend__handleCTServiceRequestName_userInfo_contextInfo_(v10, v11, (uint64_t)a2, a3, a4);
}

void sub_1A7BEE4A0(uint64_t a1, const char *a2, const __CFString *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    CFStringRef v17 = a3;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "CT Daemon ready: %@", (uint8_t *)&v16, 0xCu);
  }

  if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x1E4F23D50], 1uLL) == kCFCompareEqualTo)
  {
    uint64_t v7 = objc_msgSend_sharedInstance(FTEntitlementSupport, v5, v6);
    int v10 = objc_msgSend__setupCTServerConnection(v7, v8, v9);

    if (v10)
    {
      uint64_t v13 = objc_msgSend_sharedInstance(FTEntitlementSupport, v11, v12);
      objc_msgSend__registerForCTEntitlementNotifications(v13, v14, v15);
    }
  }
}

void sub_1A7BEECE4(uint64_t a1, const void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E4F23E88]))
    {
      id v4 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = a2;
        _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Received %@ so nuking cached values", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend__clearCaches(WeakRetained, v5, v6);
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E4F23D48]))
    {
      uint64_t v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = a2;
        _os_log_impl(&dword_1A7BC0000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ disconnecting and clearing values", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend__clearCaches(WeakRetained, v8, v9);
      WeakRetained[6] = 0;
    }
  }
}

void sub_1A7BEF93C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_object(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__clearCaches(v5, v3, v4);
}

void sub_1A7BEFB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A7BEFBBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A7BEFBCC(uint64_t a1)
{
}

void sub_1A7BEFBD4(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1AD0D5970]() == MEMORY[0x1E4F14568])
  {
    if (xpc_array_get_count(v3))
    {
      uint64_t v6 = xpc_array_get_dictionary(v3, 0);
      char WiFi_data_allowed_from_policy = network_usage_policy_get_WiFi_data_allowed_from_policy();

      id v8 = xpc_array_get_dictionary(v3, 0);
      char cell_data_allowed_from_policy = network_usage_policy_get_cell_data_allowed_from_policy();

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = WiFi_data_allowed_from_policy & cell_data_allowed_from_policy;
      uint64_t v11 = objc_msgSend_numberWithBool_(NSNumber, v10, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      __int16 v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          uint64_t v15 = @"YES";
        }
        else {
          uint64_t v15 = @"NO";
        }
        int v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = v15;
        __int16 v41 = 2112;
        id v42 = v16;
        _os_log_impl(&dword_1A7BC0000, v14, OS_LOG_TYPE_DEBUG, "Caching canUseNonBT {canUseNonBT: %@, bundle: %@}", buf, 0x16u);
      }

      uint64_t v19 = objc_msgSend_object(*(void **)(a1 + 40), v17, v18);
      uint64_t v22 = objc_msgSend_nonBTAllowedCache(v19, v20, v21);
      objc_msgSend_setObject_forKey_((void *)v22, v23, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(a1 + 32));

      id v24 = xpc_array_get_dictionary(v3, 0);
      LOBYTE(v22) = network_usage_policy_get_first_use_flow_performed_from_policy();

      if ((v22 & 1) == 0)
      {
        uint64_t v25 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(__CFString **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v40 = v26;
          _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "Showing network usage policy first alert {bundle: %@}", buf, 0xCu);
        }

        id v27 = *(id *)(a1 + 32);
        objc_msgSend_UTF8String(v27, v28, v29);
        perform_first_network_use_flow();
      }
    }
  }
  else if (MEMORY[0x1AD0D5970](v3) == MEMORY[0x1E4F145D8])
  {
    uint64_t v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v31;
      _os_log_impl(&dword_1A7BC0000, v30, OS_LOG_TYPE_DEFAULT, "Received NULL policy for canUseNonBT -- caching NO {bundle: %@}", buf, 0xCu);
    }

    uint64_t v34 = objc_msgSend_object(*(void **)(a1 + 40), v32, v33);
    id v37 = objc_msgSend_nonBTAllowedCache(v34, v35, v36);
    objc_msgSend_setObject_forKey_(v37, v38, MEMORY[0x1E4F1CC28], *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v40 = v5;
      __int16 v41 = 2112;
      id v42 = v3;
      _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_ERROR, "Unexpected network usage policy {bundle: %@, policies: %@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

id sub_1A7BF0844(void *a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (objc_msgSend_length(v3, v5, v6) && objc_msgSend_count(v4, v7, v8))
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = v4;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v36, v41, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v9);
          }
          CFStringRef v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend_regionID(v17, v12, v13);
          char isEqualToString = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)v3);

          if (isEqualToString)
          {
            id v30 = v17;
            goto LABEL_22;
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v36, v41, 16);
        if (v14) {
          continue;
        }
        break;
      }
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v21 = v9;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v32, v40, 16);
    if (v23)
    {
      uint64_t v26 = v23;
      uint64_t v27 = *(void *)v33;
LABEL_13:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v21);
        }
        uint64_t v29 = objc_msgSend_subRegions(*(void **)(*((void *)&v32 + 1) + 8 * v28), v24, v25, (void)v32);
        sub_1A7BF0844(v3, v29);
        id v30 = (id)objc_claimAutoreleasedReturnValue();

        if (v30) {
          break;
        }
        if (v26 == ++v28)
        {
          uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v32, v40, 16);
          id v30 = 0;
          if (v26) {
            goto LABEL_13;
          }
          break;
        }
      }
    }
    else
    {
      id v30 = 0;
    }
LABEL_22:
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

uint64_t sub_1A7BF0C3C()
{
  qword_1EB47C888 = objc_alloc_init(FTRegionSupport);

  return MEMORY[0x1F41817F8]();
}

void sub_1A7BF0E18(uint64_t a1, void *a2, void *a3, unint64_t a4, void *a5)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v37 = a3;
  id v35 = a5;
  if (a4 > 1)
  {
    id v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = (uint64_t)v37;
      __int16 v45 = 2048;
      unint64_t v46 = a4;
      _os_log_impl(&dword_1A7BC0000, v30, OS_LOG_TYPE_ERROR, "Failed querying regions: %@  code: %ld", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      id v32 = v37;
      unint64_t v33 = a4;
      _IDSLogTransport();
    }
    objc_msgSend_setRegions_(*(void **)(a1 + 32), v31, 0, v32, v33);
  }
  else
  {
    id v34 = v8;
    id v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Succeeded loading region information", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v12 = objc_msgSend_responseRegionInformation(v34, v10, v11);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v39, v47, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v18 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v44 = v17;
            _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_DEFAULT, "   Region info: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          uint64_t v19 = [FTRegion alloc];
          id v21 = objc_msgSend__initWithDictionary_(v19, v20, v17);
          uint64_t v22 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v44 = (uint64_t)v21;
            _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_DEFAULT, "   Loaded region: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          if (v21) {
            objc_msgSend_addObject_(v38, v23, (uint64_t)v21);
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v24, (uint64_t)&v39, v47, 16);
      }
      while (v14);
    }

    objc_msgSend_setRegions_(*(void **)(a1 + 32), v25, (uint64_t)v38);
    uint64_t v28 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v26, v27);
    objc_msgSend___mainThreadPostNotificationName_object_(v28, v29, @"__kFTRegionListFinishedLoadingNotification", *(void *)(a1 + 32));
  }
}

uint64_t sub_1A7BF1964()
{
  qword_1EB47C890 = objc_alloc_init(FTPasswordManager);

  return MEMORY[0x1F41817F8]();
}

id sub_1A7BF1AEC()
{
  if (qword_1EB47C710 != -1) {
    dispatch_once(&qword_1EB47C710, &unk_1EFE076A0);
  }
  CFStringRef v0 = (void *)qword_1EB47C708;

  return v0;
}

id sub_1A7BF1B40()
{
  if (qword_1EB47C750 != -1) {
    dispatch_once(&qword_1EB47C750, &unk_1EFE076C0);
  }
  CFStringRef v0 = (void *)qword_1EB47C748;

  return v0;
}

id sub_1A7BF221C(void *a1)
{
  id v1 = a1;
  id v4 = objc_msgSend_accountProperties(v1, v2, v3);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"profile-id");

  if (objc_msgSend_length(v6, v7, v8)) {
    goto LABEL_4;
  }
  uint64_t v11 = objc_msgSend_accountProperties(v1, v9, v10);
  uint64_t v13 = objc_msgSend_objectForKey_(v11, v12, @"profileID");

  if (objc_msgSend_length(v13, v14, v15))
  {
    uint64_t v6 = v13;
LABEL_4:
    id v16 = v6;
    uint64_t v13 = v16;
    goto LABEL_5;
  }
  id v16 = 0;
LABEL_5:

  return v16;
}

__CFString *sub_1A7BF22E4(void *a1)
{
  id v1 = a1;
  id v4 = v1;
  if (v1)
  {
    if (objc_msgSend_length(v1, v2, v3))
    {
      if ((unint64_t)objc_msgSend_length(v4, v5, v6) < 0xB)
      {
        uint64_t v11 = @"(short auth token)";
      }
      else
      {
        uint64_t v8 = NSString;
        id v9 = objc_msgSend_substringToIndex_(v4, v7, 10);
        objc_msgSend_stringWithFormat_(v8, v10, @"%@...", v9);
        uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v11 = @"(empty auth token)";
    }
  }
  else
  {
    uint64_t v11 = @"(nil auth token)";
  }

  return v11;
}

id sub_1A7BF23B0(void *a1)
{
  id v1 = a1;
  id v4 = objc_msgSend_credential(v1, v2, v3);

  if (v4)
  {
    uint64_t v7 = objc_msgSend_credential(v1, v5, v6);
    id v4 = objc_msgSend_token(v7, v8, v9);
  }

  return v4;
}

id sub_1A7BF2428(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v2, v3);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_accountProperties(v1, v4, v5);
  uint64_t v8 = objc_msgSend_objectForKey_(v6, v7, @"handles");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v1;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v8;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v28, v32, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = objc_msgSend_objectForKey_(v15, v16, @"uri");
            uint64_t v19 = objc_msgSend_objectForKey_(v15, v18, @"status");
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && objc_msgSend_integerValue(v19, v20, v21) == 5051
                && objc_msgSend_length(v17, v22, v23)
                && IMStringIsEmail())
              {
                objc_msgSend_addObject_(v27, v24, (uint64_t)v17);
              }
            }
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v16, (uint64_t)&v28, v32, 16);
      }
      while (v12);
    }

    id v1 = v26;
  }

  return v27;
}

uint64_t sub_1A7BF2C08(uint64_t a1, void *a2)
{
  return sub_1A7BF2C10(*(void **)(a1 + 32), a2);
}

uint64_t sub_1A7BF2C10(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v7 = v4;
  if (v3 && v4)
  {
    uint64_t v8 = objc_msgSend__stripFZIDPrefix(v3, v5, v6);
    uint64_t v11 = objc_msgSend_username(v7, v9, v10);
    uint64_t v14 = objc_msgSend_accountProperties(v7, v12, v13);
    id v16 = objc_msgSend_objectForKey_(v14, v15, @"originalUsername");

    uint64_t v19 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v17, v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412802;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      long long v28 = v16;
      _os_log_debug_impl(&dword_1A7BC0000, v19, OS_LOG_TYPE_DEBUG, "Comparing strippedUserName %@, accountUserName %@ and accountOriginalUserName %@", (uint8_t *)&v23, 0x20u);
    }

    if (v11 && (objc_msgSend_isEqualToIgnoringCase_(v11, v20, (uint64_t)v8) & 1) != 0)
    {
      uint64_t isEqualToIgnoringCase = 1;
    }
    else if (v16)
    {
      uint64_t isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v16, v20, (uint64_t)v8);
    }
    else
    {
      uint64_t isEqualToIgnoringCase = 0;
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1A7BFF374();
    }
    uint64_t isEqualToIgnoringCase = 0;
  }

  return isEqualToIgnoringCase;
}

uint64_t sub_1A7BF2E90(uint64_t a1, void *a2)
{
  return sub_1A7BF2C10(*(void **)(a1 + 32), a2);
}

BOOL sub_1A7BF32AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (sub_1A7BF330C(*(void **)(a1 + 32), v3))
  {
    id v4 = sub_1A7BF23B0(v3);
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t sub_1A7BF330C(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = 0;
  if (v3 && a2)
  {
    sub_1A7BF2428(a2);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v21, v25, 16);
    if (v4)
    {
      uint64_t v9 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend__stripFZIDPrefix(v3, v7, v8, (void)v21);
          if (v12)
          {
            uint64_t v13 = (void *)v12;
            uint64_t v14 = objc_msgSend__stripFZIDPrefix(v3, v7, v8);
            uint64_t v17 = objc_msgSend__stripFZIDPrefix(v11, v15, v16);
            char isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v14, v18, (uint64_t)v17);

            if (isEqualToIgnoringCase)
            {
              uint64_t v4 = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v21, v25, 16);
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v4;
}

BOOL sub_1A7BF348C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (sub_1A7BF330C(*(void **)(a1 + 32), v3))
  {
    uint64_t v6 = objc_msgSend_credential(v3, v4, v5);
    uint64_t v9 = objc_msgSend_password(v6, v7, v8);
    BOOL v12 = objc_msgSend_length(v9, v10, v11) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t sub_1A7BF350C(uint64_t a1, void *a2)
{
  return sub_1A7BF330C(*(void **)(a1 + 32), a2);
}

BOOL sub_1A7BF3968(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1A7BF221C(v3);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = sub_1A7BF221C(v3);
    if (objc_msgSend_isEqualToIgnoringCase_(v5, v7, (uint64_t)v6))
    {
      uint64_t v8 = sub_1A7BF23B0(v3);
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

BOOL sub_1A7BF3A04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1A7BF221C(v3);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = sub_1A7BF221C(v3);
    if (objc_msgSend_isEqualToIgnoringCase_(v5, v7, (uint64_t)v6))
    {
      uint64_t v10 = objc_msgSend_credential(v3, v8, v9);
      uint64_t v13 = objc_msgSend_password(v10, v11, v12);
      BOOL v16 = objc_msgSend_length(v13, v14, v15) != 0;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

uint64_t sub_1A7BF3AC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1A7BF221C(v3);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = sub_1A7BF221C(v3);
    if (objc_msgSend_isEqualToIgnoringCase_(v5, v7, (uint64_t)v6)) {
      uint64_t v8 = sub_1A7BF2C10(*(void **)(a1 + 40), v3);
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_1A7BF3B5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1A7BF221C(v3);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = sub_1A7BF221C(v3);
    uint64_t isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v5, v7, (uint64_t)v6);
  }
  else
  {
    uint64_t isEqualToIgnoringCase = 0;
  }

  return isEqualToIgnoringCase;
}

void sub_1A7BF409C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = im_primary_queue();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A7BF41AC;
  v11[3] = &unk_1E5D1B3E8;
  id v12 = v6;
  id v13 = v5;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void sub_1A7BF41AC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || (a3 = *(void *)(a1 + 40)) == 0)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF3EC();
    }
  }
  else
  {
    id v5 = objc_msgSend_accountsWithAccountType_(*(void **)(*(void *)(a1 + 48) + 16), a2, a3);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v4 = v5;
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v33, v40, 16);
    if (v8)
    {
      uint64_t v11 = v8;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v4);
          }
          uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_msgSend_length(*(void **)(a1 + 56), v9, v10)
            && sub_1A7BF2C10(*(void **)(a1 + 56), v14))
          {
            objc_msgSend_addObject_(v6, v9, (uint64_t)v14);
          }
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v9, (uint64_t)&v33, v40, 16);
      }
      while (v11);
    }

    id v17 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v15, v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v6;
      _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Updating username on accounts { accountsToUpdate : %@ }", buf, 0xCu);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v6;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v29, v37, 16);
    if (v20)
    {
      uint64_t v22 = v20;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v18);
          }
          __int16 v25 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          objc_msgSend_setUsername_(v25, v21, *(void *)(a1 + 64));
          uint64_t v26 = *(void **)(*(void *)(a1 + 48) + 16);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = sub_1A7BF4490;
          v28[3] = &unk_1E5D1B3C0;
          v28[4] = v25;
          objc_msgSend_saveVerifiedAccount_withCompletionHandler_(v26, v27, (uint64_t)v25, v28);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v29, v37, 16);
      }
      while (v22);
    }
  }
}

void sub_1A7BF4490(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (a2) {
      id v9 = @"YES";
    }
    int v13 = 138412546;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "Save completed (%@) with error: %@", (uint8_t *)&v13, 0x16u);
  }

  if (v5)
  {
    uint64_t v12 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF45C(a1, (uint64_t)v5, v12);
    }
  }
}

void sub_1A7BF4B4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BF4C4C;
  block[3] = &unk_1E5D1B438;
  id v11 = v6;
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void sub_1A7BF4C4C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1[4] || (a3 = a1[5]) == 0)
  {
    uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF4D8();
    }

    uint64_t v5 = a1[8];
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  else
  {
    id v6 = objc_msgSend_accountsWithAccountType_(*(void **)(a1[6] + 16), a2, a3);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = v6;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v48, v55, 16);
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v13 = *(void *)v49;
      uint64_t v14 = *MEMORY[0x1E4F6AC68];
      *(void *)&long long v11 = 138412290;
      long long v40 = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend_accountPropertyForKey_(v16, v10, v14, v40);

          if (v17)
          {
            uint64_t v19 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v40;
              uint64_t v54 = (uint64_t)v16;
              _os_log_impl(&dword_1A7BC0000, v19, OS_LOG_TYPE_DEFAULT, "Found candidate account for clean-up { account : %@ }", buf, 0xCu);
            }

            objc_msgSend_setAccountProperty_forKey_(v16, v20, 0, v14);
            objc_msgSend_addObject_(v7, v21, (uint64_t)v16);
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v48, v55, 16);
      }
      while (v12);
    }
    uint64_t v22 = a1;

    __int16 v25 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v23, v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v7;
      _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "Requesting save of cleaned-up accounts { accountsToSave : %@ }", buf, 0xCu);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v7;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v44, v52, 16);
    if (v28)
    {
      uint64_t v32 = v28;
      uint64_t v33 = *(void *)v45;
      *(void *)&long long v31 = 138412290;
      long long v41 = v31;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(v26);
          }
          uint64_t v35 = *(void *)(*((void *)&v44 + 1) + 8 * j);
          long long v36 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v29, v30, v41);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v41;
            uint64_t v54 = v35;
            _os_log_impl(&dword_1A7BC0000, v36, OS_LOG_TYPE_DEFAULT, "Saving account { account: %@ }", buf, 0xCu);
          }

          id v37 = *(void **)(v22[6] + 16);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = sub_1A7BF5054;
          v43[3] = &unk_1E5D1B3C0;
          v43[4] = v35;
          objc_msgSend_saveVerifiedAccount_withCompletionHandler_(v37, v38, v35, v43);
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v44, v52, 16);
      }
      while (v32);
    }

    uint64_t v39 = v22[8];
    if (v39) {
      (*(void (**)(uint64_t, uint64_t))(v39 + 16))(v39, 1);
    }
  }
}

void sub_1A7BF5054(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = @"NO";
    int v11 = 138412802;
    if (a2) {
      uint64_t v10 = @"YES";
    }
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "Save completed { account: %@, success: %@, error: %@ }", (uint8_t *)&v11, 0x20u);
  }
}

void sub_1A7BF5348(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BF5494;
  block[3] = &unk_1E5D1B488;
  id v12 = v6;
  id v13 = v5;
  id v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 64);
  id v20 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 72);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void sub_1A7BF5494(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MEMORY[0x1AD0D54C0]();
  id v5 = (void *)v2;
  if (*(void *)(a1 + 32) || (uint64_t v4 = *(void *)(a1 + 40)) == 0)
  {
    id v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF548();
    }

    uint64_t v7 = *(void *)(a1 + 96);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  else
  {
    uint64_t v63 = (void *)v2;
    id v8 = objc_msgSend_accountsWithAccountType_(*(void **)(*(void *)(a1 + 48) + 16), v3, v4);
    id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    obuint64_t j = v8;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v82, v91, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v83;
      uint64_t v65 = *(void *)v83;
      do
      {
        uint64_t v15 = 0;
        uint64_t v66 = v13;
        do
        {
          if (*(void *)v83 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v82 + 1) + 8 * v15);
          if (objc_msgSend_length(*(void **)(a1 + 56), v11, v12))
          {
            if (sub_1A7BF2C10(*(void **)(a1 + 56), v16)) {
              int v19 = 1;
            }
            else {
              int v19 = sub_1A7BF330C(*(void **)(a1 + 56), v16);
            }
          }
          else
          {
            int v19 = 0;
          }
          if (objc_msgSend_length(*(void **)(a1 + 64), v17, v18))
          {
            id v20 = sub_1A7BF221C(v16);
            if (v20)
            {
              long long v21 = *(void **)(a1 + 64);
              uint64_t v22 = sub_1A7BF221C(v16);
              int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v21, v23, (uint64_t)v22);
            }
            else
            {
              int isEqualToIgnoringCase = 0;
            }
          }
          else
          {
            int isEqualToIgnoringCase = 0;
          }
          if ((v19 | isEqualToIgnoringCase) == 1)
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            id v25 = *(id *)(a1 + 72);
            uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v78, v90, 16);
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v79;
              while (2)
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v79 != v29) {
                    objc_enumerationMutation(v25);
                  }
                  long long v31 = *(void **)(*((void *)&v78 + 1) + 8 * i);
                  if (sub_1A7BF2C10(v31, v16) & 1) != 0 || (sub_1A7BF330C(v31, v16))
                  {
                    int v33 = 0;
                    goto LABEL_36;
                  }
                }
                uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v32, (uint64_t)&v78, v90, 16);
                int v33 = 1;
                if (v28) {
                  continue;
                }
                break;
              }
            }
            else
            {
              int v33 = 1;
            }
LABEL_36:
            int v68 = v33;

            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id v34 = *(id *)(a1 + 80);
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v74, v89, 16);
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v75;
              while (2)
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v75 != v38) {
                    objc_enumerationMutation(v34);
                  }
                  long long v40 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                  uint64_t v41 = sub_1A7BF221C(v16);
                  if (v41)
                  {
                    uint64_t v43 = (void *)v41;
                    long long v44 = sub_1A7BF221C(v16);
                    int v46 = objc_msgSend_isEqualToIgnoringCase_(v40, v45, (uint64_t)v44);

                    if (v46)
                    {

                      uint64_t v14 = v65;
                      uint64_t v13 = v66;
                      goto LABEL_48;
                    }
                  }
                }
                uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v42, (uint64_t)&v74, v89, 16);
                if (v37) {
                  continue;
                }
                break;
              }
            }

            uint64_t v14 = v65;
            uint64_t v13 = v66;
            if (v68) {
              objc_msgSend_addObject_(v64, v11, (uint64_t)v16);
            }
          }
LABEL_48:
          ++v15;
        }
        while (v15 != v13);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v82, v91, 16);
      }
      while (v13);
    }

    long long v49 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v47, v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v88 = (uint64_t)v64;
      _os_log_impl(&dword_1A7BC0000, v49, OS_LOG_TYPE_DEFAULT, "Requesting deletion of accounts { accountsToDelete : %@ }", buf, 0xCu);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v50 = v64;
    uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v70, v86, 16);
    if (v52)
    {
      uint64_t v55 = v52;
      uint64_t v56 = *(void *)v71;
      do
      {
        for (uint64_t k = 0; k != v55; ++k)
        {
          if (*(void *)v71 != v56) {
            objc_enumerationMutation(v50);
          }
          uint64_t v58 = *(void *)(*((void *)&v70 + 1) + 8 * k);
          int v59 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v53, v54);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v88 = v58;
            _os_log_impl(&dword_1A7BC0000, v59, OS_LOG_TYPE_DEFAULT, "Deleting unused account { account: %@ }", buf, 0xCu);
          }

          uint64_t v60 = *(void **)(*(void *)(a1 + 48) + 16);
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = sub_1A7BF5A68;
          v69[3] = &unk_1E5D1B3C0;
          v69[4] = v58;
          objc_msgSend_removeAccount_withCompletionHandler_(v60, v61, v58, v69);
        }
        uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v70, v86, 16);
      }
      while (v55);
    }

    uint64_t v62 = *(void *)(a1 + 96);
    if (v62) {
      (*(void (**)(uint64_t, uint64_t))(v62 + 16))(v62, 1);
    }

    id v5 = v63;
  }
}

void sub_1A7BF5A68(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = @"NO";
    int v11 = 138412802;
    if (a2) {
      uint64_t v10 = @"YES";
    }
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "Delete completed { account: %@, success: %@, error: %@ }", (uint8_t *)&v11, 0x20u);
  }
}

void sub_1A7BF5D28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BF5E50;
  block[3] = &unk_1E5D1B4D8;
  id v17 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v13 = v6;
  id v14 = v5;
  uint64_t v9 = *(void *)(a1 + 32);
  id v18 = v8;
  uint64_t v15 = v9;
  id v19 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void sub_1A7BF5E50(void *a1)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (*(void (**)(void))(a1[8] + 16))();
  id v3 = (*(void (**)(void))(a1[9] + 16))();
  id v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v107 = (uint64_t)v2;
    __int16 v108 = 2112;
    uint64_t v109 = v3;
    _os_log_impl(&dword_1A7BC0000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up unused accounts { usernames : %@, profileIDs : %@ }", buf, 0x16u);
  }

  if (a1[4] || (uint64_t v8 = a1[5]) == 0)
  {
    uint64_t v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF4D8();
    }

    uint64_t v10 = a1[10];
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
  }
  else
  {
    long long v84 = a1;
    id v11 = objc_msgSend_accountsWithAccountType_(*(void **)(a1[6] + 16), v7, v8);
    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    obuint64_t j = v11;
    long long v79 = v3;
    long long v80 = v2;
    uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v98, v105, 16);
    if (v83)
    {
      uint64_t v82 = *(void *)v99;
      uint64_t v81 = *MEMORY[0x1E4F6AC40];
      *(void *)&long long v15 = 138412290;
      long long v76 = v15;
      while (2)
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v99 != v82) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          id v18 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14, v76);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v76;
            uint64_t v107 = (uint64_t)v17;
            _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_INFO, "Checking if account should be deleted { account: %@ }", buf, 0xCu);
          }

          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          id v19 = v2;
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v94, v104, 16);
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v95;
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v95 != v23) {
                  objc_enumerationMutation(v19);
                }
                id v25 = *(void **)(*((void *)&v94 + 1) + 8 * j);
                if (sub_1A7BF2C10(v25, v17) & 1) != 0 || (sub_1A7BF330C(v25, v17))
                {
                  int v27 = 0;
                  goto LABEL_28;
                }
              }
              uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v26, (uint64_t)&v94, v104, 16);
              int v27 = 1;
              if (v22) {
                continue;
              }
              break;
            }
          }
          else
          {
            int v27 = 1;
          }
LABEL_28:

          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v28 = v3;
          uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v90, v103, 16);
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v91;
            while (2)
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v91 != v32) {
                  objc_enumerationMutation(v28);
                }
                id v34 = *(void **)(*((void *)&v90 + 1) + 8 * k);
                uint64_t v35 = sub_1A7BF221C(v17);
                if (v35)
                {
                  uint64_t v37 = (void *)v35;
                  uint64_t v38 = sub_1A7BF221C(v17);
                  char isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v34, v39, (uint64_t)v38);

                  if (isEqualToIgnoringCase)
                  {
                    int v27 = 0;
                    goto LABEL_39;
                  }
                }
              }
              uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v36, (uint64_t)&v90, v103, 16);
              if (v31) {
                continue;
              }
              break;
            }
LABEL_39:
            id v3 = v79;
            uint64_t v2 = v80;
          }

          uint64_t v43 = objc_msgSend_accountProperties(v17, v41, v42);
          long long v45 = objc_msgSend_objectForKey_(v43, v44, v81);

          if (v45)
          {
            uint64_t v48 = (void *)MEMORY[0x1E4F1C9C8];
            objc_msgSend_doubleValue(v45, v46, v47);
            long long v51 = objc_msgSend_dateWithTimeIntervalSince1970_(v48, v49, v50);
            uint64_t v54 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v52, v53);
            objc_msgSend_timeIntervalSinceDate_(v54, v55, (uint64_t)v51);
            double v57 = v56;

            if (v57 <= 60.0)
            {
              int v59 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v46, v47);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A7BC0000, v59, OS_LOG_TYPE_INFO, "Account was recently added. Not deleting", buf, 2u);
              }

              goto LABEL_52;
            }
          }
          uint64_t v58 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v46, v47);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7BC0000, v58, OS_LOG_TYPE_INFO, "Account was not recently added", buf, 2u);
          }

          if (v27) {
            objc_msgSend_addObject_(v77, v13, (uint64_t)v17);
          }
        }
        uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v98, v105, 16);
        if (v83) {
          continue;
        }
        break;
      }
    }
LABEL_52:

    uint64_t v62 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v60, v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v107 = (uint64_t)v77;
      _os_log_impl(&dword_1A7BC0000, v62, OS_LOG_TYPE_DEFAULT, "Requesting deletion of accounts { accountsToDelete : %@ }", buf, 0xCu);
    }

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v63 = v77;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v86, v102, 16);
    if (v65)
    {
      uint64_t v68 = v65;
      uint64_t v69 = *(void *)v87;
      do
      {
        for (uint64_t m = 0; m != v68; ++m)
        {
          if (*(void *)v87 != v69) {
            objc_enumerationMutation(v63);
          }
          uint64_t v71 = *(void *)(*((void *)&v86 + 1) + 8 * m);
          long long v72 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v66, v67);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v107 = v71;
            _os_log_impl(&dword_1A7BC0000, v72, OS_LOG_TYPE_DEFAULT, "Deleting unused account { account: %@ }", buf, 0xCu);
          }

          long long v73 = *(void **)(v84[6] + 16);
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = sub_1A7BF65A4;
          v85[3] = &unk_1E5D1B3C0;
          v85[4] = v71;
          objc_msgSend_removeAccount_withCompletionHandler_(v73, v74, v71, v85);
        }
        uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v86, v102, 16);
      }
      while (v68);
    }

    uint64_t v75 = v84[10];
    if (v75) {
      (*(void (**)(uint64_t, uint64_t))(v75 + 16))(v75, 1);
    }

    id v3 = v79;
    uint64_t v2 = v80;
  }
}

void sub_1A7BF65A4(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = @"NO";
    int v11 = 138412802;
    if (a2) {
      uint64_t v10 = @"YES";
    }
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1A7BC0000, v8, OS_LOG_TYPE_DEFAULT, "Delete completed { account: %@, success: %@, error: %@ }", (uint8_t *)&v11, 0x20u);
  }
}

void sub_1A7BF6D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state, char a15)
{
}

id sub_1A7BF6DB8(void *a1)
{
  id v1 = a1;
  char hasPrefix = objc_msgSend_hasPrefix_(v1, v2, @"FaceTime");
  id v5 = (id *)MEMORY[0x1E4F6B2E8];
  if ((hasPrefix & 1) != 0
    || (objc_msgSend_hasPrefix_(v1, v4, @"iMessage") & 1) != 0
    || (objc_msgSend_hasPrefix_(v1, v6, @"Calling") & 1) != 0
    || (id v9 = v1, objc_msgSend_hasPrefix_(v1, v7, @"Multiway")))
  {
    id v9 = *v5;
  }
  if (objc_msgSend_hasPrefix_(v1, v8, @"com.apple"))
  {
    id v10 = *v5;

    id v9 = v10;
  }

  return v9;
}

id sub_1A7BF6E90(void *a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_accountProperties(a1, a2, a3);
  id v5 = objc_msgSend_objectForKey_(v3, v4, @"self-handle");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
LABEL_6:
    id v10 = v6;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v5, v7, v8))
  {
    objc_msgSend_objectForKey_(v5, v9, @"uri");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

void sub_1A7BF6F54(void *a1)
{
  id v5 = a1;
  objc_msgSend_accountPropertyForKey_(v5, v1, @"bundleRef");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_msgSend_setAccountProperty_forKey_(v5, v4, (uint64_t)v3, @"bundleRef");
  }
  objc_msgSend_addObject_(v3, v2, @"com.apple.imcore");
}

void sub_1A7BF7A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, os_activity_scope_state_s state,char a21)
{
}

void sub_1A7BF7F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state, char a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1A7BF7F84(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 64));
  id v6 = WeakRetained;
  if (!WeakRetained || !objc_msgSend_containsObject_(WeakRetained[1], v5, *(void *)(a1 + 32))) {
    goto LABEL_21;
  }
  id v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    uint64_t v41 = v10;
    __int16 v42 = 2112;
    uint64_t v43 = v11;
    _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Handle user notification complete: %@:%@", buf, 0x16u);
  }

  uint64_t v14 = objc_msgSend_responseInformation(v3, v12, v13);
  id v16 = objc_msgSend_objectForKey_(v14, v15, *MEMORY[0x1E4F6C300]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = 0;
    id v18 = v16;
  }
  else
  {
    objc_opt_class();
    id v18 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v17 = v16;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
  }
  id v23 = v16;
  uint64_t v21 = v17;
  uint64_t v22 = v18;
LABEL_9:
  if ((unint64_t)objc_msgSend_count(v21, v19, v20) >= 2)
  {
    objc_msgSend_objectAtIndex_(v21, v24, 0);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v21, v27, 1);
LABEL_13:
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend_count(v21, v24, v25) == 1)
  {
    id v26 = *(id *)(a1 + 40);
    objc_msgSend_objectAtIndex_(v21, v30, 0);
    goto LABEL_13;
  }
  if (!v22)
  {
    id v26 = 0;
    uint64_t v32 = 0;
    goto LABEL_15;
  }
  id v26 = *(id *)(a1 + 40);
  id v31 = v22;
LABEL_14:
  uint64_t v32 = v31;
LABEL_15:
  BOOL v35 = objc_msgSend_response(v3, v28, v29) == 3 || objc_msgSend_response(v3, v33, v34) == 1;
  uint64_t v37 = objc_msgSend_response(v3, v33, v34);
  uint64_t v38 = *(void *)(a1 + 56);
  if (v38)
  {
    BYTE2(v39) = v37 == 2;
    BYTE1(v39) = 1;
    LOBYTE(v39) = v35;
    (*(void (**)(uint64_t, void, id, void, id, void, void *, void, int))(v38 + 16))(v38, *(void *)(a1 + 32), v26, *(void *)(a1 + 48), v26, 0, v32, 0, v39);
  }
  objc_msgSend_removeObject_(v6[1], v36, *(void *)(a1 + 32));

LABEL_21:
}

void sub_1A7BF8ACC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 200));
  cut_arc_os_release();
  _Unwind_Resume(a1);
}

void sub_1A7BF8B34(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, __int16 a10, char a11)
{
  id v29 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v25 = *(void *)(a1 + 32);
    id v26 = *(void **)(v25 + 32);
    *(void *)(v25 + 32) = 0;
  }
  uint64_t v27 = *(void *)(a1 + 40);
  if (v27)
  {
    BYTE2(v28) = a11;
    LOWORD(v28) = a10;
    (*(void (**)(uint64_t, id, id, id, id, id, id, id, id, int))(v27 + 16))(v27, v29, v18, v19, v20, v21, v22, v23, v24, v28);
  }
}

void sub_1A7BF8C74(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A7BF8DA0;
  block[3] = &unk_1E5D1B5A0;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  uint64_t v20 = a2;
  uint64_t v8 = *(void *)(a1 + 64);
  id v9 = *(void **)(a1 + 72);
  id v16 = v7;
  uint64_t v17 = v8;
  id v18 = v9;
  id v19 = *(id *)(a1 + 80);
  id v10 = v5;
  dispatch_async(v6, block);
}

void sub_1A7BF8DA0(uint64_t a1)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = (void **)(a1 + 40);
  sub_1A7BF6E90(*(void **)(a1 + 40), v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = objc_msgSend_accountProperties(*(void **)(a1 + 40), v7, v8);
  uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, @"status");

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (*(void *)(a1 + 48))
  {
    id v15 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v13, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF6E0();
    }
  }
  objc_msgSend_reload(*v3, v13, v14);
  id v18 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v16, v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 96);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138413314;
    uint64_t v81 = v19;
    __int16 v82 = 2112;
    uint64_t v83 = v20;
    __int16 v84 = 2112;
    uint64_t v85 = v22;
    __int16 v86 = 2048;
    uint64_t v87 = v21;
    __int16 v88 = 2112;
    uint64_t v89 = v23;
    _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_DEFAULT, "Renewal complete for: %@  service: %@ account: %@  renewResult: %ld  error: %@", buf, 0x34u);
  }

  if (objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 72) + 8), v24, *(void *)(a1 + 80)))
  {
    uint64_t v27 = objc_msgSend__credentialForAccount_(*(void **)(a1 + 72), v25, *(void *)(a1 + 40));
    uint64_t v30 = objc_msgSend_token(v27, v28, v29);
    if (!objc_msgSend_length(v2, v31, v32))
    {
      uint64_t v35 = sub_1A7BF221C(*v3);

      id v2 = (id)v35;
    }
    if (!objc_msgSend_length(v6, v33, v34))
    {
      uint64_t v38 = sub_1A7BF6E90(*v3, v36, v37);

      id v6 = (id)v38;
    }
    uint64_t v39 = *(void *)(a1 + 96);
    if (v39)
    {
      BOOL v40 = v39 == 1;

      uint64_t v30 = 0;
    }
    else
    {
      BOOL v40 = 0;
    }
    if (!objc_msgSend_length(v2, v36, v37))
    {
      uint64_t v43 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v41, v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF69C(v43);
      }

      int v46 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v44, v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF620((uint64_t *)(a1 + 40), v46);
      }

      uint64_t v30 = 0;
    }
    uint64_t v47 = im_primary_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A7BF9280;
    block[3] = &unk_1E5D1B578;
    id v77 = *(id *)(a1 + 88);
    id v70 = *(id *)(a1 + 80);
    id v71 = *(id *)(a1 + 56);
    id v72 = *(id *)(a1 + 64);
    id v2 = v2;
    id v73 = v2;
    id v6 = v6;
    id v74 = v6;
    id v75 = v30;
    id v76 = v12;
    BOOL v78 = v40;
    __int16 v79 = 1;
    id v48 = v30;
    dispatch_async(v47, block);

    objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 72) + 8), v49, *(void *)(a1 + 80));
    uint64_t v52 = objc_msgSend_domain(*(void **)(a1 + 48), v50, v51);
    objc_msgSend_code(*(void **)(a1 + 48), v53, v54);
    FTAWDLogRegistrationRenewCredentialsCompleted();

    id v55 = objc_alloc(MEMORY[0x1E4F6B570]);
    uint64_t v56 = *(void *)(a1 + 96);
    int v59 = objc_msgSend_domain(*(void **)(a1 + 48), v57, v58);
    uint64_t v62 = objc_msgSend_code(*(void **)(a1 + 48), v60, v61);
    id v64 = objc_msgSend_initWithRenewResult_errorDomain_errorCode_(v55, v63, v56, v59, v62);

    uint64_t v67 = objc_msgSend_defaultLogger(MEMORY[0x1E4F6B410], v65, v66);
    objc_msgSend_logMetric_(v67, v68, (uint64_t)v64);
  }
  else
  {
    uint64_t v27 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v25, v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v27, OS_LOG_TYPE_DEFAULT, "  => Cancelled, bailing", buf, 2u);
    }
  }
}

uint64_t sub_1A7BF9280(uint64_t a1)
{
  *(_WORD *)((char *)&v2 + 1) = *(_WORD *)(a1 + 97);
  LOBYTE(v2) = *(unsigned char *)(a1 + 96);
  return (*(uint64_t (**)(void, void, void, void, void, void, void, void, void, int))(*(void *)(a1 + 88) + 16))(*(void *)(a1 + 88), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), 0, *(void *)(a1 + 80), v2);
}

void sub_1A7BF92D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v9, OS_LOG_TYPE_DEFAULT, "Completed verify credentials", buf, 2u);
  }

  id v10 = im_primary_queue();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = sub_1A7BF9498;
  v14[3] = &unk_1E5D1B640;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v18 = v6;
  uint64_t v11 = *(void **)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 56);
  id v20 = v11;
  id v21 = v5;
  id v24 = *(id *)(a1 + 88);
  id v22 = *(id *)(a1 + 72);
  id v23 = *(id *)(a1 + 80);
  char v26 = *(unsigned char *)(a1 + 104);
  id v25 = *(id *)(a1 + 96);
  id v12 = v5;
  id v13 = v6;
  dispatch_async(v10, v14);
}

void sub_1A7BF9498(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(NSObject **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    id v76 = v5;
    __int16 v77 = 2112;
    uint64_t v78 = v6;
    __int16 v79 = 2112;
    uint64_t v80 = v7;
    __int16 v81 = 2112;
    uint64_t v82 = v8;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "Verification complete for: %@  service: %@ account: %@  error: %@", buf, 0x2Au);
  }

  uint64_t v11 = (void *)(a1 + 56);
  if (*(void *)(a1 + 56))
  {
    id v12 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v9, v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF938();
    }
  }
  if (objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 64) + 8), v9, *(void *)(a1 + 72)))
  {
    if (!*v11 && !*(void *)(a1 + 80))
    {
      id v15 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v13, v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1A7BFF8C8();
      }
    }
    id v16 = *(void **)(a1 + 80);
    if (v16)
    {
      uint64_t v19 = v16;
      goto LABEL_18;
    }
    uint64_t v19 = *(id *)(a1 + 48);
    if (v19)
    {
LABEL_18:
      if (*v11)
      {
        id v20 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v17, v18);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = *(NSObject **)(a1 + 56);
          uint64_t v22 = *(void *)(a1 + 88);
          *(_DWORD *)buf = 138412546;
          id v76 = v21;
          __int16 v77 = 2112;
          uint64_t v78 = v22;
          _os_log_impl(&dword_1A7BC0000, v20, OS_LOG_TYPE_DEFAULT, "   Verification failed with error: %@, starting renew for service: %@", buf, 0x16u);
        }

        objc_msgSend_setCredential_(v19, v23, 0);
        objc_msgSend__renewCredentialsIfPossibleForAccount_username_inServiceIdentifier_originalInServiceIdentifier_serviceName_failIfNotSilent_renewHandler_shortCircuitCompletionBlock_(*(void **)(a1 + 64), v24, (uint64_t)v19, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 96), *(void *)(a1 + 88), *(unsigned __int8 *)(a1 + 120), *(void *)(a1 + 112), *(void *)(a1 + 104));
      }
      else
      {
        id v25 = objc_msgSend__credentialForAccount_(*(void **)(a1 + 64), v17, (uint64_t)v19);
        int v28 = objc_msgSend_token(v25, v26, v27);
        uint64_t v29 = sub_1A7BF221C(v19);
        uint64_t v32 = sub_1A7BF6E90(v19, v30, v31);
        uint64_t v35 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v33, v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v76 = v19;
          _os_log_impl(&dword_1A7BC0000, v35, OS_LOG_TYPE_DEFAULT, "Verification succeeded for account: %@", buf, 0xCu);
        }

        uint64_t v38 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v36, v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v76 = v28;
          _os_log_impl(&dword_1A7BC0000, v38, OS_LOG_TYPE_DEFAULT, "     => Token: %@", buf, 0xCu);
        }

        uint64_t v41 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v39, v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v76 = v32;
          _os_log_impl(&dword_1A7BC0000, v41, OS_LOG_TYPE_DEFAULT, "    => SelfID: %@", buf, 0xCu);
        }

        if (!objc_msgSend_length(v29, v42, v43))
        {
          int v46 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v44, v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            sub_1A7BFF69C(v46);
          }

          long long v49 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v47, v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_1A7BFF854();
          }

          objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v50, v51);
          uint64_t v52 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR)) {
            sub_1A7BFF7C0(v19, v52, v53);
          }

          int v28 = 0;
        }
        uint64_t v54 = im_primary_queue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1A7BF9B5C;
        block[3] = &unk_1E5D1B618;
        id v69 = *(id *)(a1 + 104);
        id v62 = *(id *)(a1 + 72);
        id v63 = *(id *)(a1 + 32);
        id v64 = *(id *)(a1 + 40);
        id v65 = v29;
        uint64_t v66 = v32;
        uint64_t v67 = v28;
        uint64_t v68 = v19;
        uint64_t v19 = v19;
        id v55 = v28;
        uint64_t v56 = v32;
        id v57 = v29;
        dispatch_async(v54, block);

        objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 64) + 8), v58, *(void *)(a1 + 72));
      }
      goto LABEL_40;
    }
    int v59 = objc_msgSend_warning(MEMORY[0x1E4F6C3B8], v17, v18);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_1A7BFF750();
    }

    uint64_t v60 = im_primary_queue();
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = sub_1A7BF9B08;
    v70[3] = &unk_1E5D1B5F0;
    id v74 = *(id *)(a1 + 104);
    id v71 = *(id *)(a1 + 72);
    id v72 = *(id *)(a1 + 32);
    id v73 = *(id *)(a1 + 40);
    dispatch_async(v60, v70);

    uint64_t v19 = v74;
  }
  else
  {
    uint64_t v19 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v13, v14);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v19, OS_LOG_TYPE_DEFAULT, "  => Cancelled, bailing", buf, 2u);
    }
  }
LABEL_40:
}

uint64_t sub_1A7BF9B08(void *a1)
{
  BYTE2(v2) = 0;
  LOWORD(v2) = 256;
  return (*(uint64_t (**)(void, void, void, void, void, void, void, void, void, int))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0, 0, 0, 0, 0, v2);
}

void sub_1A7BF9B5C(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 88);
  objc_msgSend_accountPropertyForKey_(*(void **)(a1 + 80), a2, *MEMORY[0x1E4F6AC28]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_accountPropertyForKey_(*(void **)(a1 + 80), v10, *MEMORY[0x1E4F6AC38]);
  BYTE2(v12) = 0;
  LOWORD(v12) = 256;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *, int))(v9 + 16))(v9, v3, v4, v5, v6, v7, v8, v13, v11, v12);
}

void sub_1A7BFA580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state, char a15)
{
}

void sub_1A7BFB560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state, char a17)
{
}

void sub_1A7BFCA68(uint64_t a1)
{
  int v2 = sub_1A7BF221C(*(void **)(a1 + 32));
  uint64_t v5 = objc_msgSend_profileID(*(void **)(*(void *)(a1 + 40) + 32), v3, v4);
  int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v2, v6, (uint64_t)v5);

  if (isEqualToIgnoringCase)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;
  }
}

void sub_1A7BFCBAC(uint64_t a1)
{
  int v2 = sub_1A7BF221C(*(void **)(a1 + 32));
  uint64_t v5 = objc_msgSend_profileID(*(void **)(*(void *)(a1 + 40) + 32), v3, v4);
  int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v2, v6, (uint64_t)v5);

  if (isEqualToIgnoringCase)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;
  }
}

CFTypeRef sub_1A7BFCC9C()
{
  CFTypeRef result = *(CFTypeRef *)MEMORY[0x1AD0D4F60]("ACAccountTypeIdentifierIdentityServices", @"Accounts");
  qword_1EB47C708 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef sub_1A7BFCCEC()
{
  CFTypeRef result = *(CFTypeRef *)MEMORY[0x1AD0D4F60]("ACAccountTypeIdentifierGameCenter", @"Accounts");
  qword_1EB47C748 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef sub_1A7BFCD3C()
{
  CFTypeRef result = *(CFTypeRef *)MEMORY[0x1AD0D4F60]("ACAccountTypeIdentifierIDMS", @"Accounts");
  qword_1E97394E8 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef sub_1A7BFCD8C()
{
  CFTypeRef result = *(CFTypeRef *)MEMORY[0x1AD0D4F60]("kACRenewCredentialsShouldForceKey", @"Accounts");
  qword_1E9739508 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef sub_1A7BFCDDC()
{
  CFTypeRef result = *(CFTypeRef *)MEMORY[0x1AD0D4F60]("kACRenewCredentialsReasonStringKey", @"Accounts");
  qword_1E9739500 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef sub_1A7BFCE2C()
{
  CFTypeRef result = *(CFTypeRef *)MEMORY[0x1AD0D4F60]("kACRenewCredentialsAppleIDServiceTypeKey", @"Accounts");
  qword_1E97394F0 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef sub_1A7BFCE7C()
{
  CFTypeRef result = *(CFTypeRef *)MEMORY[0x1AD0D4F60]("kACRenewCredentialsProxiedAppBundleIDKey", @"Accounts");
  qword_1E97394F8 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef sub_1A7BFCECC()
{
  CFTypeRef result = *(CFTypeRef *)MEMORY[0x1AD0D4F60]("kACRenewCredentialsShouldAvoidUIKey", @"Accounts");
  qword_1E97395B8 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_1A7BFCF1C(uint64_t a1, const char *a2)
{
  qword_1E97395C8 = objc_msgSend_bundleWithPath_(MEMORY[0x1E4F28B50], a2, @"/System/Library/PrivateFrameworks/IMDaemonCore.framework");

  return MEMORY[0x1F41817F8]();
}

void sub_1A7BFCF9C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1A7BFCFBC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A7BFD7BC(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1A7BC97E8(a1);
  uint64_t v4 = objc_msgSend_allKeys(v1, v2, v3);
  sub_1A7BC97DC();
  sub_1A7BC97B0(&dword_1A7BC0000, v5, v6, "   result dictionary: %@", v7, v8, v9, v10, v11);
}

void sub_1A7BFD840(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1A7BC97E8(a1);
  uint64_t v4 = objc_msgSend_userIDArray(v1, v2, v3);
  sub_1A7BC97DC();
  sub_1A7BC97B0(&dword_1A7BC0000, v5, v6, "   Multiple signatures for: %@", v7, v8, v9, v10, v11);
}

void sub_1A7BFD8C4()
{
  sub_1A7BC97D0();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFD950(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1A7BC97E8(a1);
  uint64_t v4 = objc_msgSend_userIDArray(v1, v2, v3);
  sub_1A7BC97DC();
  sub_1A7BC97B0(&dword_1A7BC0000, v5, v6, "   Single signing for: %@", v7, v8, v9, v10, v11);
}

void sub_1A7BFD9D4(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A7BC0000, a2, OS_LOG_TYPE_DEBUG, "Signing message: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1A7BFDA50()
{
  sub_1A7BC979C();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_1A7BFDACC()
{
  sub_1A7BC97D0();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFDB58()
{
  sub_1A7BC97D0();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFDBE4()
{
  sub_1A7BC97D0();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFDC70(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_FAULT, "Failed to weak link APSSignDataWithIdentityRequest", v1, 2u);
}

void sub_1A7BFDCB4()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v0 = 138412546;
  uint64_t v1 = @"sigs";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_1A7BC0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1A7BFDD50(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A7BC0000, a2, OS_LOG_TYPE_ERROR, "Failed verifying signature with error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1A7BFDDCC()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sub_1A7BC97DC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1A7BC0000, v1, OS_LOG_TYPE_FAULT, "Failed to create CoreTelephonyClient object! { self: %@, coreTelephonyClient: %@ }", v2, 0x16u);
}

void sub_1A7BFDE54()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A7BC97DC();
  _os_log_error_impl(&dword_1A7BC0000, v0, OS_LOG_TYPE_ERROR, "Unable to read SIM status { simStatusError: %@ }", v1, 0xCu);
}

void sub_1A7BFDEC8()
{
  sub_1A7BD3254();
  sub_1A7BD326C(&dword_1A7BC0000, v0, v1, "Failed to request phone number registration state from telephony -- returning nil { error: %@, context: %@ }");
}

void sub_1A7BFDF30()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A7BC97DC();
  _os_log_debug_impl(&dword_1A7BC0000, v0, OS_LOG_TYPE_DEBUG, "No value found for telephony network key { key: %@ }", v1, 0xCu);
}

void sub_1A7BFDFA4()
{
  sub_1A7BD3254();
  sub_1A7BD326C(&dword_1A7BC0000, v0, v1, "Failure checking isPNRSupported -- falling back { error: %@, subscription: %@ }");
}

void sub_1A7BFE00C()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A7BC97DC();
  _os_log_debug_impl(&dword_1A7BC0000, v0, OS_LOG_TYPE_DEBUG, "Selected subscription to check isPNRSupported { selectedSubscription: %@ }", v1, 0xCu);
}

void sub_1A7BFE080()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFE108()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFE190()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFE218()
{
  sub_1A7BC97DC();
  sub_1A7BD5004(&dword_1A7BC0000, v0, v1, "Unable to get dual SIM capability { dualSIMError: %@ }", v2, v3, v4, v5, v6);
}

void sub_1A7BFE280()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sub_1A7BC97DC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A7BC0000, v1, OS_LOG_TYPE_DEBUG, "No valid subscriptions found { subscriptionInfo: %@, subscriptions: %@ }", v2, 0x16u);
}

void sub_1A7BFE304()
{
  sub_1A7BC97DC();
  sub_1A7BD5004(&dword_1A7BC0000, v0, v1, "Failed to fetch subscriptions { error: %@ }", v2, v3, v4, v5, v6);
}

void sub_1A7BFE36C()
{
  sub_1A7BC97DC();
  sub_1A7BD5004(&dword_1A7BC0000, v0, v1, "Failed to fetch active contexts { error: %@ }", v2, v3, v4, v5, v6);
}

void sub_1A7BFE3D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_ERROR, "Unable to determine user-selected subscription due to missing coreTelephonyClient instance!", v1, 2u);
}

void sub_1A7BFE418(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_DEBUG, "No subscription found to return selected registration phone number", v1, 2u);
}

void sub_1A7BFE45C()
{
  sub_1A7BC97DC();
  sub_1A7BD5004(&dword_1A7BC0000, v0, v1, "No phone number info found to return selected registration phone number { error: %@ }", v2, v3, v4, v5, v6);
}

void sub_1A7BFE4C4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A7BC97DC();
  _os_log_debug_impl(&dword_1A7BC0000, v0, OS_LOG_TYPE_DEBUG, "Loaded phone number info { phoneNumberInfo: %@ }", v1, 0xCu);
}

void sub_1A7BFE538(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_ERROR, "_CTServerConnectionIsEmergencyNumber - could not connect to CT.", v1, 2u);
}

void sub_1A7BFE57C(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 2048;
  uint64_t v5 = a1 >> 32;
  _os_log_error_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_ERROR, "_CTServerConnectionIsEmergencyNumber - encountered error %d %ld", (uint8_t *)v3, 0x12u);
}

void sub_1A7BFE608()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v0 = 138412546;
  uint64_t v1 = @"v";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_1A7BC0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1A7BFE6A4(void *a1)
{
  objc_end_catch();
}

void sub_1A7BFE6C8(void *a1)
{
  objc_end_catch();
}

void sub_1A7BFE6F8(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7BC0000, a2, OS_LOG_TYPE_ERROR, "**** Server sent status code header codes to refresh the bag (Interval: %d), reloading IDS and iMessage bags ****", (uint8_t *)v2, 8u);
}

void sub_1A7BFE770(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_ERROR, "**** Server sent status code header codes to refresh the bag, reloading IDS and iMessage bags ****", v1, 2u);
}

void sub_1A7BFE7B4()
{
  sub_1A7BE1334();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Eu);
}

void sub_1A7BFE84C()
{
  sub_1A7BC97DC();
  sub_1A7BE1334();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void sub_1A7BFE8CC(int *a1, void **a2, NSObject *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v5 = *a1;
  uint64_t v6 = objc_msgSend_domain(*a2, (const char *)a2, (uint64_t)a3);
  int v9 = objc_msgSend_code(*a2, v7, v8);
  int v12 = objc_msgSend_localizedDescription(*a2, v10, v11);
  id v15 = objc_msgSend_userInfo(*a2, v13, v14);
  id v17 = objc_msgSend_objectForKey_(v15, v16, *MEMORY[0x1E4F289C0]);
  v18[0] = 67110146;
  v18[1] = v5;
  __int16 v19 = 2112;
  id v20 = v6;
  __int16 v21 = 1024;
  int v22 = v9;
  __int16 v23 = 2112;
  id v24 = v12;
  __int16 v25 = 2112;
  char v26 = v17;
  _os_log_error_impl(&dword_1A7BC0000, a3, OS_LOG_TYPE_ERROR, "FTMessageDelivery failed! (HTTP Status Code: %d) Error (%@:%d): %@ %@", (uint8_t *)v18, 0x2Cu);
}

void sub_1A7BFEA04()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A7BC97DC();
  _os_log_fault_impl(&dword_1A7BC0000, v0, OS_LOG_TYPE_FAULT, "Failed to parse x-apple-server-time %@", v1, 0xCu);
}

void sub_1A7BFEA78()
{
  sub_1A7BC97DC();
  sub_1A7BD5004(&dword_1A7BC0000, v0, v1, "Result parse error: %@", v2, v3, v4, v5, v6);
}

void sub_1A7BFEAE0()
{
  sub_1A7BC97DC();
  sub_1A7BD5004(&dword_1A7BC0000, v0, v1, "%@ Message not being delivered, network is unavailable, can attempt stewie", v2, v3, v4, v5, v6);
}

void sub_1A7BFEB48()
{
  sub_1A7BC97DC();
  sub_1A7BD5004(&dword_1A7BC0000, v0, v1, "%@ Message not being delivered, vm traffic is disable", v2, v3, v4, v5, v6);
}

void sub_1A7BFEBB0()
{
  sub_1A7BC97DC();
  sub_1A7BD5004(&dword_1A7BC0000, v0, v1, "%@ Message not being delivered, airplane mode is enabled", v2, v3, v4, v5, v6);
}

void sub_1A7BFEC18()
{
  sub_1A7BC97DC();
  sub_1A7BE1334();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void sub_1A7BFEC94(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_FAULT, "Gave up, too many attempts", v1, 2u);
}

void sub_1A7BFECD8()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFED60()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFEDE8()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFEE70()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFEEF8()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFEF80(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_FAULT, "Server Bag provided us with a retry interval of %f ", (uint8_t *)&v3, 0x16u);
}

void sub_1A7BFF008(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_ERROR, "Message not being delivered, vm traffic is disable", v1, 2u);
}

void sub_1A7BFF04C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7BC0000, a2, OS_LOG_TYPE_ERROR, "Message not being delivered, missing some required keys: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1A7BFF0C4()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFF14C()
{
  sub_1A7BD3A24();
  sub_1A7BC9780(&dword_1A7BC0000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, 2u);
}

void sub_1A7BFF1D4()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v0 = 138412546;
  uint64_t v1 = @"x-protocol-version";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_1A7BC0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1A7BFF270()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v0 = 138412546;
  uint64_t v1 = @"accept-language";
  __int16 v2 = 2080;
  uint64_t v3 = "dictionary";
  _os_log_error_impl(&dword_1A7BC0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1A7BFF30C()
{
  sub_1A7BC97DC();
  sub_1A7BFCFBC(&dword_1A7BC0000, v0, v1, "Checking keychain with prefixed username %@", v2, v3, v4, v5, v6);
}

void sub_1A7BFF374()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A7BD3254();
  _os_log_debug_impl(&dword_1A7BC0000, v0, OS_LOG_TYPE_DEBUG, "Invalid username %@ or account %@", v1, 0x16u);
}

void sub_1A7BFF3EC()
{
  sub_1A7BFCFD8();
  sub_1A7BFCF64();
  sub_1A7BFCF9C(&dword_1A7BC0000, v0, v1, "Failed to request account type from identifier { typeIdentifierIDS: %@, accountType: %@, accountTypeError: %@ }");
}

void sub_1A7BFF45C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_1A7BD326C(&dword_1A7BC0000, a2, a3, "Failed saving account %@ with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void sub_1A7BFF4D8()
{
  sub_1A7BFCFD8();
  sub_1A7BFCF64();
  sub_1A7BFCF9C(&dword_1A7BC0000, v0, v1, "Failed to request account type from identifier { typeIdentifierIDS: %@, accountType: %@, accountTypeError: %@ }");
}

void sub_1A7BFF548()
{
  sub_1A7BFCFD8();
  sub_1A7BFCF64();
  sub_1A7BFCF9C(&dword_1A7BC0000, v0, v1, "Failed to request account type from identifier { typeIdentifierIDS: %@, accountType: %@, accountTypeError: %@ }");
}

void sub_1A7BFF5B8()
{
  sub_1A7BD3254();
  sub_1A7BD326C(&dword_1A7BC0000, v0, v1, "Failed saving account %@ with error: %@");
}

void sub_1A7BFF620(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A7BC0000, a2, OS_LOG_TYPE_ERROR, "*** Account: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1A7BFF69C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_ERROR, "*** Empty profile ID handed back during token gathering, please file a radar", v1, 2u);
}

void sub_1A7BFF6E0()
{
  sub_1A7BFCF84();
  sub_1A7BD326C(&dword_1A7BC0000, v0, v1, "Failed renewing account %@ with error: %@");
}

void sub_1A7BFF750()
{
  sub_1A7BFCF84();
  sub_1A7BD326C(&dword_1A7BC0000, v0, v1, "*** No account found to use for renewal, please file a radar (input: %@  output: %@)");
}

void sub_1A7BFF7C0(void *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_accountProperties(a1, a2, a3);
  sub_1A7BC97DC();
  _os_log_error_impl(&dword_1A7BC0000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "*** Account properties: %@", v5, 0xCu);
}

void sub_1A7BFF854()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A7BC97DC();
  _os_log_error_impl(&dword_1A7BC0000, v0, OS_LOG_TYPE_ERROR, "*** Account: %@", v1, 0xCu);
}

void sub_1A7BFF8C8()
{
  sub_1A7BFCF84();
  sub_1A7BD326C(&dword_1A7BC0000, v0, v1, "*** No error reported for account verification, but verified account is nil, please file a radar (input: %@  output: %@)");
}

void sub_1A7BFF938()
{
  sub_1A7BFCF84();
  sub_1A7BD326C(&dword_1A7BC0000, v0, v1, "Failed verifying account %@ with error: %@");
}

void sub_1A7BFF9A8()
{
  sub_1A7BC97DC();
  sub_1A7BFCFBC(&dword_1A7BC0000, v0, v1, "Assigning credential: %@", v2, v3, v4, v5, v6);
}

void sub_1A7BFFA10()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1A7BD3254();
  _os_log_fault_impl(&dword_1A7BC0000, v0, OS_LOG_TYPE_FAULT, "Failed saving account %@ with error: %@", v1, 0x16u);
}

void sub_1A7BFFA88(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  uint64_t v2 = @"FTPasswordManager";
  __int16 v3 = 2080;
  uint64_t v4 = "-[FTPasswordManager acAccountWithProfileID:username:accountStore:]";
  _os_log_error_impl(&dword_1A7BC0000, log, OS_LOG_TYPE_ERROR, "%@ - %s: invalid arguments!", (uint8_t *)&v1, 0x16u);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

uint64_t CTSettingCopyMyPhoneNumber()
{
  return MEMORY[0x1F40DEFB0]();
}

uint64_t FTAWDLogRegistrationRenewCredentialsCompleted()
{
  return MEMORY[0x1F4118FF8]();
}

uint64_t IDSAuthenticationDelegateUpdateTimeOfLastRequestPost()
{
  return MEMORY[0x1F4122C60]();
}

uint64_t IDSIsVirtualMachine()
{
  return MEMORY[0x1F4122CF0]();
}

uint64_t IDSLoggableDescriptionForObjectOnService()
{
  return MEMORY[0x1F4122D18]();
}

uint64_t IDSPEMFormatCertificatesForPushHeader()
{
  return MEMORY[0x1F4122D28]();
}

uint64_t IMCanonicalFormForEmail()
{
  return MEMORY[0x1F4123670]();
}

uint64_t IMCopyURLEscapedString()
{
  return MEMORY[0x1F41236B8]();
}

uint64_t IMCurrentPreferredLanguage()
{
  return MEMORY[0x1F41236F0]();
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x1F4123718]();
}

uint64_t IMGenerateLoginID()
{
  return MEMORY[0x1F4123760]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x1F4123768]();
}

uint64_t IMGetAppIntForKey()
{
  return MEMORY[0x1F4123770]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x1F4123788]();
}

uint64_t IMGetConferenceSettings()
{
  return MEMORY[0x1F41237B0]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x1F41237B8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x1F41237D0]();
}

uint64_t IMGetKeychainAuthToken()
{
  return MEMORY[0x1F41237E0]();
}

uint64_t IMGetKeychainPassword()
{
  return MEMORY[0x1F41237F8]();
}

uint64_t IMGetMainBundleIdentifier()
{
  return MEMORY[0x1F4123800]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x1F41238A0]();
}

uint64_t IMLocalizedStringFromTableInBundle()
{
  return MEMORY[0x1F41238A8]();
}

uint64_t IMLogSimulateCrashForProcess()
{
  return MEMORY[0x1F41238D0]();
}

uint64_t IMLogString()
{
  return MEMORY[0x1F41238E0]();
}

uint64_t IMRemoveAppValueForKey()
{
  return MEMORY[0x1F41239B0]();
}

uint64_t IMSetAppValueForKey()
{
  return MEMORY[0x1F41239F0]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x1F41239F8]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x1F4123A08]();
}

uint64_t IMSetKeychainAuthToken()
{
  return MEMORY[0x1F4123A10]();
}

uint64_t IMShouldLog()
{
  return MEMORY[0x1F4123A30]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x1F4123A38]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1F4123A48]();
}

uint64_t IMStringIsInHardcodedEmergencyNumberSet()
{
  return MEMORY[0x1F4123A68]();
}

uint64_t IMUserScopedNotification()
{
  return MEMORY[0x1F4123AE0]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1F4123AF0]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1F4123AF8]();
}

uint64_t JWUUIDPushObjectToString()
{
  return MEMORY[0x1F4123B78]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1F417CE60]();
}

uint64_t MarcoLog()
{
  return MEMORY[0x1F412C630]();
}

uint64_t MarcoNoteCheckpoint()
{
  return MEMORY[0x1F412C648]();
}

uint64_t MarcoShouldLog()
{
  return MEMORY[0x1F412C650]();
}

uint64_t MarcoShouldLogCheckpoints()
{
  return MEMORY[0x1F412C658]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x1F4123B80]();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x1F4101D70](store, nameEncoding);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EF8](key, algorithm, dataToSign, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

uint64_t SecureRandomBytes()
{
  return MEMORY[0x1F4123BA0]();
}

uint64_t VTCopyHEVCDecoderCapabilitiesDictionary()
{
  return MEMORY[0x1F4103170]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLRequestSetProtocolProperty()
{
  return MEMORY[0x1F40D5760]();
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x1F40DF020]();
}

uint64_t _CTServerConnectionCopySystemCapabilities()
{
  return MEMORY[0x1F40DF0A0]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1F40DF0B0]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1F40DF0E0]();
}

uint64_t _CTServerConnectionGetCarrierEntitlements()
{
  return MEMORY[0x1F40DF118]();
}

uint64_t _CTServerConnectionGetCommCenterInitializationState()
{
  return MEMORY[0x1F40DF138]();
}

uint64_t _CTServerConnectionIsEmergencyNumber()
{
  return MEMORY[0x1F40DF198]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1F40DF1D0]();
}

uint64_t _CTServerConnectionSetCellularUsagePolicy()
{
  return MEMORY[0x1F40DF208]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1F40DF218]();
}

uint64_t _CTServerConnectionVerifyCarrierEntitlements()
{
  return MEMORY[0x1F40DF248]();
}

uint64_t _IDSIDProtocolVersionNumber()
{
  return MEMORY[0x1F4122DF0]();
}

uint64_t _IDSLogTransport()
{
  return MEMORY[0x1F4122E38]();
}

uint64_t _IDSLogV()
{
  return MEMORY[0x1F4122E40]();
}

uint64_t _IDSShouldLog()
{
  return MEMORY[0x1F4122E70]();
}

uint64_t _IDSWarnV()
{
  return MEMORY[0x1F4122E98]();
}

uint64_t _IDSWebTunnelServiceVersionNumber()
{
  return MEMORY[0x1F4122EA0]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x1F4123BB8]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x1F4123C08]();
}

uint64_t _UIStringForIDSRegistrationServiceType()
{
  return MEMORY[0x1F4122EB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint64_t cut_arc_os_release()
{
  return MEMORY[0x1F4112A88]();
}

uint64_t cut_dispatch_log_queue()
{
  return MEMORY[0x1F4112A90]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

void free(void *a1)
{
}

uint64_t im_dispatch_after_primary_queue()
{
  return MEMORY[0x1F4123C18]();
}

uint64_t im_dispatch_async_with_timeout()
{
  return MEMORY[0x1F4123C20]();
}

uint64_t im_primary_queue()
{
  return MEMORY[0x1F4123C48]();
}

uint64_t jw_uuid_to_data()
{
  return MEMORY[0x1F4123C50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint64_t network_usage_policy_create_client()
{
  return MEMORY[0x1F417F410]();
}

uint64_t network_usage_policy_get_WiFi_data_allowed_from_policy()
{
  return MEMORY[0x1F417F420]();
}

uint64_t network_usage_policy_get_cell_data_allowed_from_policy()
{
  return MEMORY[0x1F417F430]();
}

uint64_t network_usage_policy_get_first_use_flow_performed_from_policy()
{
  return MEMORY[0x1F417F438]();
}

uint64_t network_usage_policy_get_for_bundle()
{
  return MEMORY[0x1F417F440]();
}

uint64_t network_usage_policy_set_changed_handler()
{
  return MEMORY[0x1F417F448]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x1F40CD3A0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t perform_first_network_use_flow()
{
  return MEMORY[0x1F417F458]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEA70](xarray, index);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}