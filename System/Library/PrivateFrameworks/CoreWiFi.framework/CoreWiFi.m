id sub_1B4F318A0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CWFChannel *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id obj;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  unsigned char v49[128];
  uint64_t v50;
  uint64_t vars8;

  v50 = *MEMORY[0x1E4F143B8];
  objc_msgSend_objectForKeyedSubscript_(a1, a2, @"ORIG_RNR_CHANNEL_LIST", a4, a5);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v6)
  {
    v11 = v6;
    v12 = 0;
    v13 = *(void *)v46;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v16 = objc_msgSend_objectForKeyedSubscript_(v15, v7, @"CHANNEL", v9, v10);
        v20 = objc_msgSend_objectForKeyedSubscript_(v15, v17, @"CHANNEL_FLAGS", v18, v19);
        v21 = objc_alloc_init(CWFChannel);
        v26 = objc_msgSend_unsignedCharValue(v16, v22, v23, v24, v25);
        objc_msgSend_setChannel_(v21, v27, v26, v28, v29);
        v34 = objc_msgSend_unsignedIntValue(v20, v30, v31, v32, v33);
        objc_msgSend_setFlags_(v21, v35, v34, v36, v37);
        if (!v12)
        {
          v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40, v41);
        }
        objc_msgSend_addObject_(v12, v38, (uint64_t)v21, v40, v41);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v42 = objc_msgSend_copy(v12, v7, v8, v9, v10);

  return v42;
}

uint64_t sub_1B4F31A74(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"BEACON_INT", a4, a5);
  uint64_t v10 = objc_msgSend_integerValue(v5, v6, v7, v8, v9);

  return v10;
}

uint64_t sub_1B4F31AB4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"CONNECTED_BSSID", a4, a5);
  uint64_t v10 = objc_msgSend_BOOLValue(v5, v6, v7, v8, v9);

  return v10;
}

uint64_t sub_1B4F31AF4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"PHY_MODE", a4, a5);
  v11 = v6;
  if (v6)
  {
    uint64_t v12 = objc_msgSend_unsignedIntValue(v6, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(a1, v7, @"RATES", v9, v10);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v62, (uint64_t)v66, 16);
    if (v15)
    {
      uint64_t v20 = v15;
      char v21 = 0;
      char v22 = 0;
      uint64_t v23 = *(void *)v63;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v63 != v23) {
            objc_enumerationMutation(v13);
          }
          unint64_t v25 = objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v62 + 1) + 8 * i), v16, v17, v18, v19);
          if (v25 <= 0x36)
          {
            if (((1 << v25) & 0x41001001041240) != 0)
            {
              char v22 = 1;
            }
            else if (((1 << v25) & 0x826) != 0)
            {
              char v21 = 1;
            }
          }
          if (v21 & 1) != 0 && (v22)
          {
            char v21 = 1;
            char v22 = 1;
            goto LABEL_20;
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v62, (uint64_t)v66, 16);
        if (v20) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v21 = 0;
      char v22 = 0;
    }
LABEL_20:

    v29 = objc_msgSend_objectForKeyedSubscript_(a1, v26, @"HT_CAPS_IE", v27, v28);

    v33 = objc_msgSend_objectForKeyedSubscript_(a1, v30, @"VHT_CAPS_IE", v31, v32);

    v37 = objc_msgSend_objectForKeyedSubscript_(a1, v34, @"HE_CAP", v35, v36);

    v41 = objc_msgSend_objectForKeyedSubscript_(a1, v38, @"CHANNEL_FLAGS", v39, v40);
    unsigned int v46 = objc_msgSend_unsignedIntValue(v41, v42, v43, v44, v45);

    v50 = objc_msgSend_objectForKeyedSubscript_(a1, v47, @"CHANNEL_FLAGS", v48, v49);
    char v55 = objc_msgSend_unsignedIntValue(v50, v51, v52, v53, v54);
    if (v22) {
      int v56 = 2;
    }
    else {
      int v56 = 0;
    }
    int v57 = v56 & (v46 >> 3);
    int v58 = v57 | 4;
    if ((v21 & 1) == 0) {
      int v58 = v57;
    }
    if ((v55 & 8) == 0) {
      int v58 = v57;
    }
    if (v22) {
      v58 |= 8u;
    }
    if ((v55 & 8) != 0) {
      unsigned int v59 = v58;
    }
    else {
      unsigned int v59 = v57;
    }

    unsigned int v60 = v59 | 0x10;
    if (!v29) {
      unsigned int v60 = v59;
    }
    if (v33) {
      v60 |= 0x80u;
    }
    if (v37) {
      uint64_t v12 = v60 | 0x100;
    }
    else {
      uint64_t v12 = v60;
    }

    v11 = 0;
  }

  return v12;
}

BOOL sub_1B4F31DA0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"WPA_IE", a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

BOOL sub_1B4F31DDC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"HOTSPOT20_IE", a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

uint64_t sub_1B4F31E18(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"AP_MODE", a4, a5);
  uint64_t v10 = objc_msgSend_unsignedIntValue(v5, v6, v7, v8, v9);

  return v10;
}

uint64_t sub_1B4F31EB4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"TIMESTAMP", a4, a5);
  uint64_t v10 = objc_msgSend_unsignedLongLongValue(v5, v6, v7, v8, v9);

  return v10;
}

uint64_t sub_1B4F31F38(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"RSSI", a4, a5);
  uint64_t v10 = objc_msgSend_integerValue(v5, v6, v7, v8, v9);

  return v10;
}

uint64_t sub_1B4F3288C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"NOISE", a4, a5);
  uint64_t v10 = objc_msgSend_integerValue(v5, v6, v7, v8, v9);

  return v10;
}

BOOL sub_1B4F328CC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"IOS_IE", a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

id sub_1B4F3295C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"BSSID", a4, a5);
  BOOL v6 = CWFCorrectEthernetAddressString(v5);

  return v6;
}

void sub_1B4F329B0(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 32) + 16), v3, *(void *)(a1 + 40), v4, v5);
}

uint64_t sub_1B4F32A6C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = objc_msgSend_SSID(a1, a2, a3, a4, a5);
  if (v9)
  {
    Apple80211CalculateShortSSIDCopy();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(a1, v6, @"SHORT_SSID", v7, v8);
    uint64_t v15 = objc_msgSend_unsignedIntValue(v10, v11, v12, v13, v14);
  }
  return v15;
}

id sub_1B4F32C74(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"WPA_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_WPA_UCIPHERS", v7, v8);

  return v9;
}

id sub_1B4F32CD0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"WPA_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_WPA_AUTHSELS", v7, v8);

  return v9;
}

id sub_1B4F32D2C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"RSN_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_RSN_UCIPHERS", v7, v8);

  return v9;
}

id sub_1B4F32D88(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"RSN_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_RSN_AUTHSELS", v7, v8);

  return v9;
}

id sub_1B4F32DE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"80211D_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_80211D_COUNTRY_CODE", v7, v8);

  return v9;
}

void sub_1B4F33C40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F33C5C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_IE_PRODUCT_ID", v7, v8);
  uint64_t v14 = (int)objc_msgSend_intValue(v9, v10, v11, v12, v13);

  return v14;
}

id sub_1B4F33CBC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  v175 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"RNR_IE", a4, a5);
  objc_msgSend_objectForKeyedSubscript_(v175, v5, @"NEIGHBOR_AP_INFO_LIST", v6, v7);
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v186, (uint64_t)v191, 16);
  uint64_t v13 = 0;
  if (v178)
  {
    uint64_t v177 = *(void *)v187;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v187 != v177) {
          objc_enumerationMutation(obj);
        }
        uint64_t v181 = v14;
        uint64_t v15 = *(void **)(*((void *)&v186 + 1) + 8 * v14);
        v16 = objc_msgSend_objectForKeyedSubscript_(v15, v9, @"CHANNEL", v11, v12);
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v15, v17, @"CHANNEL_FLAGS", v18, v19);
        char v21 = objc_alloc_init(CWFChannel);
        v180 = v16;
        unsigned int v26 = objc_msgSend_unsignedCharValue(v16, v22, v23, v24, v25);
        objc_msgSend_setChannel_(v21, v27, v26, v28, v29);
        v179 = v20;
        uint64_t v34 = objc_msgSend_unsignedIntValue(v20, v30, v31, v32, v33);
        objc_msgSend_setFlags_(v21, v35, v34, v36, v37);
        v41 = objc_msgSend_objectForKeyedSubscript_(v15, v38, @"TBTT_INFO_SET", v39, v40);
        long long v182 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v182, (uint64_t)v190, 16);
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v183;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v183 != v45) {
                objc_enumerationMutation(v41);
              }
              v47 = *(void **)(*((void *)&v182 + 1) + 8 * i);
              uint64_t v48 = objc_alloc_init(CWFRNRBSS);
              objc_msgSend_setChannel_(v48, v49, (uint64_t)v21, v50, v51);
              char v55 = objc_msgSend_objectForKeyedSubscript_(v47, v52, @"SHORT_SSID", v53, v54);
              unsigned int v60 = objc_msgSend_unsignedIntValue(v55, v56, v57, v58, v59);
              objc_msgSend_setShortSSID_(v48, v61, v60, v62, v63);

              uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(v47, v64, @"BSSID", v65, v66);
              v68 = CWFCorrectEthernetAddressString(v67);
              objc_msgSend_setBSSID_(v48, v69, (uint64_t)v68, v70, v71);

              v75 = objc_msgSend_objectForKeyedSubscript_(v47, v72, @"SAME_SSID", v73, v74);
              uint64_t v80 = objc_msgSend_BOOLValue(v75, v76, v77, v78, v79);
              objc_msgSend_setSameSSID_(v48, v81, v80, v82, v83);

              v87 = objc_msgSend_objectForKeyedSubscript_(v47, v84, @"MULTIPLE_BSSID", v85, v86);
              uint64_t v92 = objc_msgSend_BOOLValue(v87, v88, v89, v90, v91);
              objc_msgSend_setMultipleBSSID_(v48, v93, v92, v94, v95);

              v99 = objc_msgSend_objectForKeyedSubscript_(v47, v96, @"TRANSMITTED_BSSID", v97, v98);
              uint64_t v104 = objc_msgSend_BOOLValue(v99, v100, v101, v102, v103);
              objc_msgSend_setTransmittedBSSID_(v48, v105, v104, v106, v107);

              v111 = objc_msgSend_objectForKeyedSubscript_(v47, v108, @"MEMBER_OF_ESS_WITH_2GHZ_OR_5GHZ_COLOCATED_AP", v109, v110);
              uint64_t v116 = objc_msgSend_BOOLValue(v111, v112, v113, v114, v115);
              objc_msgSend_setMultiband6GHz_(v48, v117, v116, v118, v119);

              v123 = objc_msgSend_objectForKeyedSubscript_(v47, v120, @"UPR_ACTIVE", v121, v122);
              uint64_t v128 = objc_msgSend_BOOLValue(v123, v124, v125, v126, v127);
              objc_msgSend_setUPRActive_(v48, v129, v128, v130, v131);

              v135 = objc_msgSend_objectForKeyedSubscript_(v47, v132, @"COLOCATED_AP", v133, v134);
              uint64_t v140 = objc_msgSend_BOOLValue(v135, v136, v137, v138, v139);
              objc_msgSend_setColocatedAP_(v48, v141, v140, v142, v143);

              v147 = objc_msgSend_objectForKeyedSubscript_(v47, v144, @"TBTT_OFFSET", v145, v146);
              unsigned int v152 = objc_msgSend_unsignedCharValue(v147, v148, v149, v150, v151);
              objc_msgSend_setTBTTOffset_(v48, v153, v152, v154, v155);

              v159 = objc_msgSend_objectForKeyedSubscript_(v47, v156, @"20MHZ_PSD", v157, v158);
              unsigned int v164 = objc_msgSend_unsignedCharValue(v159, v160, v161, v162, v163);
              objc_msgSend_setPrimary20MHzPSD_(v48, v165, v164, v166, v167);

              if (!v13)
              {
                uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v168, v169, v170, v171);
              }
              objc_msgSend_addObject_(v13, v168, (uint64_t)v48, v170, v171);
            }
            uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v172, (uint64_t)&v182, (uint64_t)v190, 16);
          }
          while (v44);
        }

        uint64_t v14 = v181 + 1;
      }
      while (v181 + 1 != v178);
      uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v186, (uint64_t)v191, 16);
    }
    while (v178);
  }
  v173 = objc_msgSend_copy(v13, v9, v10, v11, v12);

  return v173;
}

id sub_1B4F34134(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"CHANNEL", a4, a5);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(a1, v7, @"CHANNEL_FLAGS", v8, v9);
  uint64_t v12 = (void *)v10;
  if (v6) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
    v16[0] = @"CHANNEL";
    v16[1] = @"CHANNEL_FLAGS";
    v17[0] = v6;
    v17[1] = v10;
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v17, (uint64_t)v16, 2);
  }

  return v14;
}

uint64_t sub_1B4F3421C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"MBO_OCE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"ASSOC_DISALLOWED_REASON_CODE", v7, v8);
  uint64_t v14 = objc_msgSend_unsignedIntegerValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B4F3427C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend___WAPIPolicy(a1, a2, a3, a4, a5);
  uint64_t v10 = v5;
  if (v5)
  {
    unsigned int v11 = objc_msgSend_unsignedIntValue(v5, v6, v7, v8, v9);
    if ((v11 & 4) != 0) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = (v11 >> 2) & 2;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t sub_1B4F342D4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_objectForKeyedSubscript_(a1, a2, @"WAPI", a4, a5);
}

uint64_t sub_1B4F342E0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"RSN_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_RSN_MCIPHER", v7, v8);
  uint64_t v14 = objc_msgSend_unsignedLongLongValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B4F34340(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_IE_UNCONFIGURED", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B4F343A0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"RSN_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_RSN_BCIPHER", v7, v8);
  uint64_t v14 = objc_msgSend_unsignedLongLongValue(v9, v10, v11, v12, v13);

  return v14;
}

void sub_1B4F344C0(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_addObject_(*(void **)(*(void *)(a1 + 32) + 16), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4F345A4(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = objc_msgSend_copy(*(void **)(a1 + 48), v2, v3, v4, v5);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 168), v8, (uint64_t)v7, *(void *)(a1 + 32), v9);
  }
}

void sub_1B4F34734(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4F348D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F348F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

uint64_t sub_1B4F3495C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"RSN_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_RSN_CAPS", v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"RSN_CAPABILITIES", v11, v12);
  uint64_t v18 = objc_msgSend_unsignedIntValue(v13, v14, v15, v16, v17);

  return v18;
}

id sub_1B4F349D4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"PRIVATE_MAC_ADDRESS", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"PRIVATE_MAC_ADDRESS_VALUE", v7, v8);
  uint64_t v10 = CWFEthernetAddressStringFromData(v9);

  return v10;
}

void sub_1B4F34DC0(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 72), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t sub_1B4F35670(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_informationElementData(a1, v7, v8, v9, v10);
  if (objc_msgSend_length(v11, v12, v13, v14, v15))
  {
    id v19 = v11;
    objc_msgSend_bytes(v19, v20, v21, v22, v23);
    objc_msgSend_length(v19, v24, v25, v26, v27);
    Apple80211ParseAppleSWAPIE();
  }
  uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v6, v16, @"APPLE_SWAP_IE", v17, v18);
  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v28, v29, @"SWAP_IE_FEATURE_INTERNET_CONNECTION_SHARING_ENABLED", v30, v31);
  uint64_t v37 = objc_msgSend_BOOLValue(v32, v33, v34, v35, v36);

  return v37;
}

void sub_1B4F35874(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F3588C(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v10 = objc_msgSend_reply(*(void **)(a1 + 32), v6, v7, v8, v9);

  if (v10)
  {
    objc_msgSend_reply(*(void **)(a1 + 32), v11, v12, v13, v14);
    uint64_t v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, *MEMORY[0x1E4F28798], 37, 0);
    ((void (**)(void, void *))v15)[2](v15, v17);
  }
}

void sub_1B4F35F88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F36294(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 32), v3, v4, v5, v6);
}

void sub_1B4F362DC(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1BA995D10]();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = objc_msgSend_allKeys(*(void **)(*(void *)(a1 + 32) + 56), v3, v4, v5, v6);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * v12);
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(NSObject **)(v14 + 24);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = sub_1B4F78068;
        v25[3] = &unk_1E60BB9F0;
        v25[4] = v14;
        v25[5] = v13;
        dispatch_async(v15, v25);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v16, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v10);
  }

  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 56), v17, v18, v19, v20);
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 96), v21, v22, v23, v24);
}

void sub_1B4F366E0(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v5 = objc_msgSend___apple80211WithVirtualInterfaceRole_parentInterfaceName_(*(void **)(a1 + 32), v3, *(unsigned int *)(a1 + 56), *(void *)(a1 + 40), v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_1B4F3699C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F36B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F36C68(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v132 = objc_msgSend_WAPISubtype(a1, a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(a1, v6, @"WEP", v7, v8);
  unsigned int v131 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(a1, v14, @"WPA_IE", v15, v16);
  uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"IE_KEY_WPA_AUTHSELS", v19, v20);

  int v129 = objc_msgSend_containsObject_(v21, v22, (uint64_t)&unk_1F0DC8418, v23, v24);
  uint64_t v133 = v21;
  int v130 = objc_msgSend_containsObject_(v21, v25, (uint64_t)&unk_1F0DC8430, v26, v27);
  uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(a1, v28, @"RSN_IE", v29, v30);
  uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v31, v32, @"IE_KEY_RSN_AUTHSELS", v33, v34);

  uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(a1, v36, @"RSN_IE", v37, v38);
  uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v39, v40, @"IE_KEY_RSN_CAPS", v41, v42);

  int v128 = objc_msgSend_containsObject_(v35, v44, (uint64_t)&unk_1F0DC8418, v45, v46);
  int v127 = objc_msgSend_containsObject_(v35, v47, (uint64_t)&unk_1F0DC8448, v48, v49);
  int v126 = objc_msgSend_containsObject_(v35, v50, (uint64_t)&unk_1F0DC8460, v51, v52);
  int v124 = objc_msgSend_containsObject_(v35, v53, (uint64_t)&unk_1F0DC8430, v54, v55);
  char v123 = objc_msgSend_containsObject_(v35, v56, (uint64_t)&unk_1F0DC8478, v57, v58);
  int v122 = objc_msgSend_containsObject_(v35, v59, (uint64_t)&unk_1F0DC8490, v60, v61);
  int v65 = objc_msgSend_containsObject_(v35, v62, (uint64_t)&unk_1F0DC84A8, v63, v64);
  int v69 = objc_msgSend_containsObject_(v35, v66, (uint64_t)&unk_1F0DC84C0, v67, v68);
  int v73 = objc_msgSend_containsObject_(v35, v70, (uint64_t)&unk_1F0DC84D8, v71, v72);
  int v77 = objc_msgSend_containsObject_(v35, v74, (uint64_t)&unk_1F0DC84F0, v75, v76);
  int v125 = objc_msgSend_containsObject_(v35, v78, (uint64_t)&unk_1F0DC8508, v79, v80);
  int v84 = objc_msgSend_containsObject_(v35, v81, (uint64_t)&unk_1F0DC8520, v82, v83);
  v88 = objc_msgSend_objectForKeyedSubscript_(v43, v85, @"MFP_CAPABLE", v86, v87);
  int v121 = objc_msgSend_BOOLValue(v88, v89, v90, v91, v92);

  v96 = objc_msgSend_objectForKeyedSubscript_(v43, v93, @"MFP_REQUIRED", v94, v95);
  int v120 = objc_msgSend_BOOLValue(v96, v97, v98, v99, v100);

  int v104 = objc_msgSend_containsObject_(v35, v101, (uint64_t)&unk_1F0DC8538, v102, v103);
  v108 = objc_msgSend_objectForKeyedSubscript_(a1, v105, @"SCAN_RESULT_OWE_MULTI_SSID", v106, v107);
  int v113 = objc_msgSend_BOOLValue(v108, v109, v110, v111, v112);

  uint64_t v114 = 2;
  if ((unint64_t)(v132 - 1) >= 2) {
    uint64_t v114 = v131;
  }
  if (v129) {
    v114 |= 4uLL;
  }
  if (v128 | v127 | v126) {
    v114 |= 0x10uLL;
  }
  if (v73 | v77 | v65 | v69) {
    v114 |= 0x40uLL;
  }
  if (v130) {
    v114 |= 8uLL;
  }
  if ((v124 & 1) != 0 || (v123 & 1) != 0 || (uint64_t v115 = v114, v122))
  {
    uint64_t v115 = v114 | 0x20;
    if (((v124 | v121 ^ 1) & 1) == 0)
    {
      uint64_t v116 = v114 | 0xA0;
      if (v120) {
        uint64_t v115 = v116;
      }
    }
  }
  if (v125 | v84) {
    uint64_t v117 = v115 | 0x80;
  }
  else {
    uint64_t v117 = v115;
  }
  if (v104) {
    uint64_t v117 = 256;
  }
  if (v113) {
    uint64_t v117 = 768;
  }
  if (v117) {
    uint64_t v118 = v117;
  }
  else {
    uint64_t v118 = 512;
  }

  return v118;
}

void sub_1B4F37608(uint64_t a1, void *a2, int a3, unsigned __int8 *a4, unsigned int a5)
{
  v540[2] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = objc_alloc_init(CWFXPCEvent);
  uint64_t v11 = sub_1B4F51FC0(a3);
  objc_msgSend_setType_(v10, v12, v11, v13, v14);
  objc_msgSend_setInterfaceName_(v10, v15, *(void *)(a1 + 32), v16, v17);
  uint64_t v22 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v18, v19, v20, v21);
  objc_msgSend_setTimestamp_(v10, v23, (uint64_t)v22, v24, v25);

  BOOL v30 = 0;
  if (a3 <= 38)
  {
    switch(a3)
    {
      case 12:
        if (a5 == 276)
        {
          uint64_t v31 = objc_alloc_init(CWFHostAPStation);
          uint64_t v34 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v32, (uint64_t)a4, 6, v33);
          uint64_t v35 = CWFEthernetAddressStringFromData(v34);
          objc_msgSend_setBSSID_(v31, v36, (uint64_t)v35, v37, v38);

          v507 = @"HostAPStation";
          v508 = v31;
          uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v39, (uint64_t)&v508, (uint64_t)&v507, 1);
          objc_msgSend_setInfo_(v10, v41, (uint64_t)v40, v42, v43);

          uint64_t v44 = CWFGetOSLog();
          if (v44)
          {
            uint64_t v45 = CWFGetOSLog();
          }
          else
          {
            uint64_t v45 = MEMORY[0x1E4F14500];
            id v433 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            LODWORD(v513[0]) = 138543362;
            *(void *)((char *)v513 + 4) = v31;
            LODWORD(v486) = 12;
            v485 = v513;
            _os_log_send_and_compose_impl();
          }

          uint64_t v434 = *(void *)(a1 + 40);
          v435 = *(NSObject **)(v434 + 8);
          v491[0] = MEMORY[0x1E4F143A8];
          v491[1] = 3221225472;
          v491[2] = sub_1B4FBCD0C;
          v491[3] = &unk_1E60BB768;
          v491[4] = v434;
          v436 = v491;
          goto LABEL_54;
        }
        v466 = CWFGetOSLog();
        if (v466)
        {
          v467 = CWFGetOSLog();
        }
        else
        {
          v467 = MEMORY[0x1E4F14500];
          id v476 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v467, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v513[0]) = 136447234;
          *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
          WORD2(v513[1]) = 2082;
          *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
          HIWORD(v513[2]) = 1024;
          LODWORD(v513[3]) = 2462;
          WORD2(v513[3]) = 2048;
          *(void *)((char *)&v513[3] + 6) = 276;
          HIWORD(v513[4]) = 2048;
          v513[5] = a5;
          LODWORD(v486) = 48;
          v485 = v513;
          goto LABEL_113;
        }
        goto LABEL_114;
      case 13:
        if (a5 == 12)
        {
          uint64_t v31 = objc_alloc_init(CWFHostAPStation);
          v299 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v297, (uint64_t)a4, 6, v298);
          v300 = CWFEthernetAddressStringFromData(v299);
          objc_msgSend_setBSSID_(v31, v301, (uint64_t)v300, v302, v303);

          v505 = @"HostAPStation";
          v506 = v31;
          v305 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v304, (uint64_t)&v506, (uint64_t)&v505, 1);
          objc_msgSend_setInfo_(v10, v306, (uint64_t)v305, v307, v308);

          v309 = CWFGetOSLog();
          if (v309)
          {
            v310 = CWFGetOSLog();
          }
          else
          {
            v310 = MEMORY[0x1E4F14500];
            id v437 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v310, OS_LOG_TYPE_INFO))
          {
            LODWORD(v513[0]) = 138543362;
            *(void *)((char *)v513 + 4) = v31;
            LODWORD(v486) = 12;
            v485 = v513;
            _os_log_send_and_compose_impl();
          }

          uint64_t v438 = *(void *)(a1 + 40);
          v435 = *(NSObject **)(v438 + 8);
          v490[0] = MEMORY[0x1E4F143A8];
          v490[1] = 3221225472;
          v490[2] = sub_1B4FBCD5C;
          v490[3] = &unk_1E60BB768;
          v490[4] = v438;
          v436 = v490;
LABEL_54:
          dispatch_async(v435, v436);
          goto LABEL_55;
        }
        v468 = CWFGetOSLog();
        if (v468)
        {
          v467 = CWFGetOSLog();
        }
        else
        {
          v467 = MEMORY[0x1E4F14500];
          id v477 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v467, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v513[0]) = 136447234;
          *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke_2";
          WORD2(v513[1]) = 2082;
          *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
          HIWORD(v513[2]) = 1024;
          LODWORD(v513[3]) = 2493;
          WORD2(v513[3]) = 2048;
          *(void *)((char *)&v513[3] + 6) = 12;
          HIWORD(v513[4]) = 2048;
          v513[5] = a5;
          LODWORD(v486) = 48;
          v485 = v513;
          goto LABEL_113;
        }
        goto LABEL_114;
      case 14:
      case 15:
      case 16:
      case 18:
      case 19:
        goto LABEL_57;
      case 17:
        if (a5 == 8)
        {
          long long v529 = 0u;
          memset(v530, 0, sizeof(v530));
          long long v527 = 0u;
          long long v528 = 0u;
          long long v525 = 0u;
          long long v526 = 0u;
          long long v523 = 0u;
          long long v524 = 0u;
          long long v521 = 0u;
          long long v522 = 0u;
          long long v519 = 0u;
          long long v520 = 0u;
          long long v517 = 0u;
          long long v518 = 0u;
          long long v515 = 0u;
          long long v516 = 0u;
          long long v514 = 0u;
          memset(v513, 0, sizeof(v513));
          LOBYTE(v513[0]) = 1;
          int v311 = 1000 * *((_DWORD *)a4 + 1);
          HIDWORD(v513[0]) = *(_DWORD *)a4;
          LODWORD(v515) = v311;
          v312 = objc_alloc_init(CWFLinkQualityMetric);
          v315 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v313, (uint64_t)v513, 332, v314);
          objc_msgSend_setLinkQualityMetricData_(v312, v316, (uint64_t)v315, v317, v318);

          v323 = objc_msgSend_timestamp(v10, v319, v320, v321, v322);
          objc_msgSend_setUpdatedAt_(v312, v324, (uint64_t)v323, v325, v326);

          v511 = @"LinkQualityMetric";
          v512 = v312;
          v328 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v327, (uint64_t)&v512, (uint64_t)&v511, 1);
          objc_msgSend_setInfo_(v10, v329, (uint64_t)v328, v330, v331);

          objc_msgSend___setLinkQualityMetric_interfaceName_(*(void **)(a1 + 40), v332, (uint64_t)v312, *(void *)(a1 + 32), v333);
          goto LABEL_56;
        }
        v469 = CWFGetOSLog();
        if (v469)
        {
          v467 = CWFGetOSLog();
        }
        else
        {
          v467 = MEMORY[0x1E4F14500];
          id v478 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v467, OS_LOG_TYPE_ERROR)) {
          goto LABEL_114;
        }
        LODWORD(v513[0]) = 136447234;
        *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
        WORD2(v513[1]) = 2082;
        *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
        HIWORD(v513[2]) = 1024;
        LODWORD(v513[3]) = 2393;
        WORD2(v513[3]) = 2048;
        *(void *)((char *)&v513[3] + 6) = 8;
        HIWORD(v513[4]) = 2048;
        v513[5] = a5;
        LODWORD(v486) = 48;
        v485 = v513;
        goto LABEL_113;
      case 20:
        goto LABEL_31;
      default:
        if (a3 == 3)
        {
          uint64_t v418 = *(void *)(a1 + 40);
          v419 = *(NSObject **)(v418 + 8);
          v503[0] = MEMORY[0x1E4F143A8];
          v503[1] = 3221225472;
          v503[2] = sub_1B4FBCA2C;
          v503[3] = &unk_1E60BB9F0;
          v503[4] = v418;
          id v504 = *(id *)(a1 + 32);
          dispatch_async(v419, v503);
          objc_msgSend___updateCurrentKnownBSSWithIPConfigurationForInterfaceName_(*(void **)(a1 + 40), v420, *(void *)(a1 + 32), v421, v422);
          if (a5 == 12)
          {
            v423 = CWFDescriptionForApple80211BSSIDChangeReason(*((unsigned int *)a4 + 2));
            v427 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v424, *((unsigned int *)a4 + 2), v425, v426);
            v539[0] = @"BSSIDChangedReason";
            v539[1] = @"BSSIDChangedReasonDescription";
            v540[0] = v427;
            v540[1] = v423;
            v429 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v428, (uint64_t)v540, (uint64_t)v539, 2);
            objc_msgSend_setInfo_(v10, v430, (uint64_t)v429, v431, v432);
          }
          else
          {
            v475 = CWFGetOSLog();
            if (v475)
            {
              v423 = CWFGetOSLog();
            }
            else
            {
              v423 = MEMORY[0x1E4F14500];
              id v484 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v423, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v513[0]) = 136447234;
              *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
              WORD2(v513[1]) = 2082;
              *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
              HIWORD(v513[2]) = 1024;
              LODWORD(v513[3]) = 2168;
              WORD2(v513[3]) = 2048;
              *(void *)((char *)&v513[3] + 6) = 12;
              HIWORD(v513[4]) = 2048;
              v513[5] = a5;
              LODWORD(v486) = 48;
              v485 = v513;
              _os_log_send_and_compose_impl();
            }
          }

          v296 = v504;
          goto LABEL_45;
        }
        if (a3 != 4) {
          goto LABEL_57;
        }
        if (a5 == 32)
        {
          v175 = objc_alloc_init(CWFLinkChangeStatus);
          objc_msgSend_setLinkDown_(v175, v176, *a4 != 0, v177, v178);
          objc_msgSend_setRSSI_(v175, v179, *((int *)a4 + 1), v180, v181);
          objc_msgSend_setNoise_(v175, v182, *((__int16 *)a4 + 5), v183, v184);
          objc_msgSend_setCCA_(v175, v185, (char)a4[12], v186, v187);
          objc_msgSend_setInterfaceName_(v175, v188, *(void *)(a1 + 32), v189, v190);
          v195 = objc_msgSend_timestamp(v10, v191, v192, v193, v194);
          objc_msgSend_setTimestamp_(v175, v196, (uint64_t)v195, v197, v198);

          if (*a4)
          {
            objc_msgSend_setInvoluntaryLinkDown_(v175, v199, a4[16] != 0, v200, v201);
            objc_msgSend_setReason_(v175, v202, *((unsigned int *)a4 + 5), v203, v204);
            objc_msgSend_setSubreason_(v175, v205, *((unsigned int *)a4 + 6), v206, v207);
            if (_os_feature_enabled_impl()) {
              objc_msgSend_setLinkDownDebounceInProgress_(v175, v208, a4[28] != 0, v210, v211);
            }
            v212 = objc_msgSend___cachedKnownNetwork(*(void **)(a1 + 40), v208, v209, v210, v211);
            objc_msgSend___setLinkDownStatus_interfaceName_(*(void **)(a1 + 40), v213, (uint64_t)v175, *(void *)(a1 + 32), v214);
            v215 = *(NSObject **)(*(void *)(a1 + 40) + 8);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1B4FBCAB4;
            block[3] = &unk_1E60BC7A0;
            v498 = v212;
            v499 = v175;
            int8x16_t v489 = *(int8x16_t *)(a1 + 32);
            id v216 = (id)v489.i64[0];
            int8x16_t v500 = vextq_s8(v489, v489, 8uLL);
            id v217 = v212;
            dispatch_async(v215, block);

            v218 = v498;
          }
          else
          {
            v442 = objc_msgSend___joinStatusWithInterfaceName_(*(void **)(a1 + 40), v199, *(void *)(a1 + 32), v200, v201);
            v447 = objc_msgSend_knownNetworkProfile(v442, v443, v444, v445, v446);

            if (v447) {
              objc_msgSend___setCachedKnownNetwork_(*(void **)(a1 + 40), v448, (uint64_t)v447, v449, v450);
            }
            uint64_t v451 = *(void *)(a1 + 40);
            v452 = *(NSObject **)(v451 + 8);
            v494[0] = MEMORY[0x1E4F143A8];
            v494[1] = 3221225472;
            v494[2] = sub_1B4FBCBB8;
            v494[3] = &unk_1E60BB950;
            v494[4] = v451;
            id v495 = *(id *)(a1 + 32);
            id v496 = v447;
            id v217 = v447;
            dispatch_async(v452, v494);

            v218 = v495;
          }

          v453 = CWFGetOSLog();
          if (v453)
          {
            v454 = CWFGetOSLog();
          }
          else
          {
            v454 = MEMORY[0x1E4F14500];
            id v455 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v454, OS_LOG_TYPE_DEFAULT))
          {
            int v456 = *a4;
            int v457 = a4[28];
            LODWORD(v513[0]) = 67109376;
            HIDWORD(v513[0]) = v456;
            LOWORD(v513[1]) = 1024;
            *(_DWORD *)((char *)&v513[1] + 2) = v457;
            LODWORD(v486) = 14;
            v485 = v513;
            _os_log_send_and_compose_impl();
          }

          v531 = @"LinkChangeStatus";
          v532 = v175;
          BOOL v30 = 1;
          v459 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v458, (uint64_t)&v532, (uint64_t)&v531, 1);
          objc_msgSend_setInfo_(v10, v460, (uint64_t)v459, v461, v462);

          uint64_t v464 = *(void *)(a1 + 32);
          v463 = *(void **)(a1 + 40);
          v492[0] = MEMORY[0x1E4F143A8];
          v492[1] = 3221225472;
          v492[2] = sub_1B4FBCC30;
          v492[3] = &unk_1E60BC7C8;
          v492[4] = v463;
          v493 = v10;
          objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_reply_(v463, v465, v464, 1, (uint64_t)v492);

          goto LABEL_70;
        }
        v474 = CWFGetOSLog();
        if (v474)
        {
          v467 = CWFGetOSLog();
        }
        else
        {
          v467 = MEMORY[0x1E4F14500];
          id v483 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v467, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v513[0]) = 136447234;
          *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
          WORD2(v513[1]) = 2082;
          *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
          HIWORD(v513[2]) = 1024;
          LODWORD(v513[3]) = 2319;
          WORD2(v513[3]) = 2048;
          *(void *)((char *)&v513[3] + 6) = 32;
          HIWORD(v513[4]) = 2048;
          v513[5] = a5;
          LODWORD(v486) = 48;
          v485 = v513;
          goto LABEL_113;
        }
        break;
    }
    goto LABEL_114;
  }
  if (a3 <= 70)
  {
    if (a3 == 39)
    {
      if (a5 <= 0x14B)
      {
        v473 = CWFGetOSLog();
        if (v473)
        {
          v467 = CWFGetOSLog();
        }
        else
        {
          v467 = MEMORY[0x1E4F14500];
          id v482 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v467, OS_LOG_TYPE_ERROR)) {
          goto LABEL_114;
        }
        LODWORD(v513[0]) = 136447234;
        *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
        WORD2(v513[1]) = 2082;
        *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
        HIWORD(v513[2]) = 1024;
        LODWORD(v513[3]) = 2422;
        WORD2(v513[3]) = 2048;
        *(void *)((char *)&v513[3] + 6) = 332;
        HIWORD(v513[4]) = 2048;
        v513[5] = a5;
        LODWORD(v486) = 48;
        v485 = v513;
        goto LABEL_113;
      }
      uint64_t v31 = objc_alloc_init(CWFLinkQualityMetric);
      v399 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v397, (uint64_t)a4, 332, v398);
      objc_msgSend_setLinkQualityMetricData_(v31, v400, (uint64_t)v399, v401, v402);

      v407 = objc_msgSend_timestamp(v10, v403, v404, v405, v406);
      objc_msgSend_setUpdatedAt_(v31, v408, (uint64_t)v407, v409, v410);

      v509 = @"LinkQualityMetric";
      v510 = v31;
      v412 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v411, (uint64_t)&v510, (uint64_t)&v509, 1);
      objc_msgSend_setInfo_(v10, v413, (uint64_t)v412, v414, v415);

      objc_msgSend___setLinkQualityMetric_interfaceName_(*(void **)(a1 + 40), v416, (uint64_t)v31, *(void *)(a1 + 32), v417);
    }
    else
    {
      if (a3 != 70) {
        goto LABEL_57;
      }
      if (a5 != 8)
      {
        v471 = CWFGetOSLog();
        if (v471)
        {
          v467 = CWFGetOSLog();
        }
        else
        {
          v467 = MEMORY[0x1E4F14500];
          id v480 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v467, OS_LOG_TYPE_ERROR)) {
          goto LABEL_114;
        }
        LODWORD(v513[0]) = 136447234;
        *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
        WORD2(v513[1]) = 2082;
        *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
        HIWORD(v513[2]) = 1024;
        LODWORD(v513[3]) = 2260;
        WORD2(v513[3]) = 2048;
        *(void *)((char *)&v513[3] + 6) = 8;
        HIWORD(v513[4]) = 2048;
        v513[5] = a5;
        LODWORD(v486) = 48;
        v485 = v513;
        goto LABEL_113;
      }
      uint64_t v31 = objc_alloc_init(CWFRoamStatus);
      objc_msgSend_setInterfaceName_(v31, v219, *(void *)(a1 + 32), v220, v221);
      __uint64_t v222 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      objc_msgSend_setTimeStarted_(v31, v223, v222, v224, v225);
      v230 = objc_msgSend_timestamp(v10, v226, v227, v228, v229);
      objc_msgSend_setStartedAt_(v31, v231, (uint64_t)v230, v232, v233);

      v237 = objc_msgSend_SSID_(v9, v234, 0, v235, v236);
      objc_msgSend_setSSID_(v31, v238, (uint64_t)v237, v239, v240);

      v244 = objc_msgSend_BSSID_(v9, v241, 0, v242, v243);
      objc_msgSend_setFromBSSID_(v31, v245, (uint64_t)v244, v246, v247);

      v252 = objc_msgSend_fromBSSID(v31, v248, v249, v250, v251);
      v256 = objc_msgSend_substringToIndex_(v252, v253, 8, v254, v255);
      objc_msgSend_setOriginOUI_(v31, v257, (uint64_t)v256, v258, v259);

      v263 = objc_msgSend_channel_(v9, v260, 0, v261, v262);
      uint64_t v268 = objc_msgSend_channel(v263, v264, v265, v266, v267);
      objc_msgSend_setFromChannel_(v31, v269, v268, v270, v271);

      v275 = objc_msgSend_RSSI_(v9, v272, 0, v273, v274);
      uint64_t v280 = objc_msgSend_integerValue(v275, v276, v277, v278, v279);
      objc_msgSend_setFromRSSI_(v31, v281, v280, v282, v283);

      objc_msgSend_setReason_(v31, v284, *((unsigned int *)a4 + 1), v285, v286);
      objc_msgSend___setRoamStatus_interfaceName_(*(void **)(a1 + 40), v287, (uint64_t)v31, *(void *)(a1 + 32), v288);
      v535 = @"RoamStatus";
      v536 = v31;
      v290 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v289, (uint64_t)&v536, (uint64_t)&v535, 1);
      objc_msgSend_setInfo_(v10, v291, (uint64_t)v290, v292, v293);
    }
LABEL_55:

LABEL_56:
    BOOL v30 = 0;
    goto LABEL_57;
  }
  if (a3 != 71)
  {
    if (a3 != 76)
    {
      if (a3 != 80) {
        goto LABEL_57;
      }
      if (a5 == 168)
      {
        objc_msgSend___roamStatusWithInterfaceName_(*(void **)(a1 + 40), v26, *(void *)(a1 + 32), v28, v29);
        uint64_t v46 = (CWFRoamStatus *)objc_claimAutoreleasedReturnValue();
        uint64_t v51 = v46;
        if (!v46 || objc_msgSend_timeStarted(v46, v47, v48, v49, v50) != *((void *)a4 + 1))
        {
          uint64_t v55 = objc_alloc_init(CWFRoamStatus);

          uint64_t v59 = objc_msgSend_SSID_(v9, v56, 0, v57, v58);
          objc_msgSend_setSSID_(v55, v60, (uint64_t)v59, v61, v62);

          uint64_t v51 = v55;
        }
        objc_msgSend_setReason_(v51, v52, *((unsigned int *)a4 + 1), v53, v54);
        objc_msgSend_setFromChannel_(v51, v63, *((unsigned int *)a4 + 10), v64, v65);
        objc_msgSend_setFromRSSI_(v51, v66, *((int *)a4 + 8), v67, v68);
        v487 = objc_msgSend_stringWithFormat_(NSString, v69, @"%02x:%02x:%02x", v70, v71, a4[56], a4[57], a4[58]);
        objc_msgSend_setOriginOUI_(v51, v72, (uint64_t)v487, v73, v74);
        uint64_t v78 = objc_msgSend_stringWithFormat_(NSString, v75, @"%02x:%02x:%02x:%02x:%02x:%02x", v76, v77, a4[88], a4[89], a4[90], a4[91], a4[92], a4[93]);
        objc_msgSend_setFromBSSID_(v51, v79, (uint64_t)v78, v80, v81);
        objc_msgSend_setToRSSI_(v51, v82, *((int *)a4 + 9), v83, v84);
        objc_msgSend_setToChannel_(v51, v85, *((unsigned int *)a4 + 11), v86, v87);
        uint64_t v91 = objc_msgSend_stringWithFormat_(NSString, v88, @"%02x:%02x:%02x", v89, v90, a4[59], a4[60], a4[61]);
        objc_msgSend_setTargetOUI_(v51, v92, (uint64_t)v91, v93, v94);
        uint64_t v98 = objc_msgSend_stringWithFormat_(NSString, v95, @"%02x:%02x:%02x:%02x:%02x:%02x", v96, v97, a4[94], a4[95], a4[96], a4[97], a4[98], a4[99]);
        objc_msgSend_setToBSSID_(v51, v99, (uint64_t)v98, v100, v101);
        objc_msgSend_setStatus_(v51, v102, *(unsigned int *)a4, v103, v104);
        id v488 = v9;
        uint64_t v109 = objc_msgSend_interfaceName(v9, v105, v106, v107, v108);
        objc_msgSend_setInterfaceName_(v51, v110, (uint64_t)v109, v111, v112);

        objc_msgSend_setTimeStarted_(v51, v113, *((void *)a4 + 1), v114, v115);
        objc_msgSend_setTimeEnded_(v51, v116, *((void *)a4 + 2), v117, v118);
        if (objc_msgSend_timeStarted(v51, v119, v120, v121, v122))
        {
          int v127 = objc_msgSend_startedAt(v51, v123, v124, v125, v126);

          if (!v127)
          {
            int v128 = objc_msgSend_timestamp(v10, v123, v124, v125, v126);
            objc_msgSend_setStartedAt_(v51, v129, (uint64_t)v128, v130, v131);
          }
        }
        if (objc_msgSend_timeEnded(v51, v123, v124, v125, v126))
        {
          v136 = objc_msgSend_timestamp(v10, v132, v133, v134, v135);
          objc_msgSend_setEndedAt_(v51, v137, (uint64_t)v136, v138, v139);

          uint64_t v140 = (void *)MEMORY[0x1E4F1C9C8];
          uint64_t v145 = objc_msgSend_endedAt(v51, v141, v142, v143, v144);
          objc_msgSend_timeIntervalSinceReferenceDate(v145, v146, v147, v148, v149);
          double v151 = v150;
          uint64_t v156 = objc_msgSend_timeEnded(v51, v152, v153, v154, v155);
          uint64_t v161 = objc_msgSend_timeStarted(v51, v157, v158, v159, v160);
          uint64_t v166 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v140, v162, v163, v164, v165, v151 + (double)(unint64_t)(v156 - v161) / -1000.0);
          objc_msgSend_setStartedAt_(v51, v167, (uint64_t)v166, v168, v169);
        }
        objc_msgSend___setRoamStatus_interfaceName_(*(void **)(a1 + 40), v132, (uint64_t)v51, *(void *)(a1 + 32), v135);
        v537 = @"RoamStatus";
        v538 = v51;
        uint64_t v171 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v170, (uint64_t)&v538, (uint64_t)&v537, 1);
        objc_msgSend_setInfo_(v10, v172, (uint64_t)v171, v173, v174);

        BOOL v30 = 0;
        id v9 = v488;
        goto LABEL_57;
      }
      v470 = CWFGetOSLog();
      if (v470)
      {
        v467 = CWFGetOSLog();
      }
      else
      {
        v467 = MEMORY[0x1E4F14500];
        id v479 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v467, OS_LOG_TYPE_ERROR))
      {
LABEL_114:

        BOOL v30 = 1;
        goto LABEL_57;
      }
      LODWORD(v513[0]) = 136447234;
      *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke_2";
      WORD2(v513[1]) = 2082;
      *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
      HIWORD(v513[2]) = 1024;
      LODWORD(v513[3]) = 2197;
      WORD2(v513[3]) = 2048;
      *(void *)((char *)&v513[3] + 6) = 168;
      HIWORD(v513[4]) = 2048;
      v513[5] = a5;
      LODWORD(v486) = 48;
      v485 = v513;
LABEL_113:
      _os_log_send_and_compose_impl();
      goto LABEL_114;
    }
LABEL_31:
    uint64_t v294 = *(void *)(a1 + 40);
    v295 = *(NSObject **)(v294 + 8);
    v501[0] = MEMORY[0x1E4F143A8];
    v501[1] = 3221225472;
    v501[2] = sub_1B4FBCA70;
    v501[3] = &unk_1E60BB9F0;
    v501[4] = v294;
    id v502 = *(id *)(a1 + 32);
    dispatch_async(v295, v501);
    v296 = v502;
LABEL_45:

    goto LABEL_56;
  }
  if (a5 != 8)
  {
    v472 = CWFGetOSLog();
    if (v472)
    {
      v467 = CWFGetOSLog();
    }
    else
    {
      v467 = MEMORY[0x1E4F14500];
      id v481 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v467, OS_LOG_TYPE_ERROR)) {
      goto LABEL_114;
    }
    LODWORD(v513[0]) = 136447234;
    *(void *)((char *)v513 + 4) = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
    WORD2(v513[1]) = 2082;
    *(void *)((char *)&v513[1] + 6) = "CWFXPCRequestProxy.m";
    HIWORD(v513[2]) = 1024;
    LODWORD(v513[3]) = 2290;
    WORD2(v513[3]) = 2048;
    *(void *)((char *)&v513[3] + 6) = 8;
    HIWORD(v513[4]) = 2048;
    v513[5] = a5;
    LODWORD(v486) = 48;
    v485 = v513;
    goto LABEL_113;
  }
  objc_msgSend___roamStatusWithInterfaceName_(*(void **)(a1 + 40), v26, *(void *)(a1 + 32), v28, v29);
  v175 = (CWFLinkChangeStatus *)objc_claimAutoreleasedReturnValue();
  BOOL v30 = v175 == 0;
  if (v175)
  {
    __uint64_t v334 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    objc_msgSend_setTimeEnded_(v175, v335, v334, v336, v337);
    v342 = objc_msgSend_timestamp(v10, v338, v339, v340, v341);
    objc_msgSend_setEndedAt_(v175, v343, (uint64_t)v342, v344, v345);

    v349 = objc_msgSend_BSSID_(v9, v346, 0, v347, v348);
    objc_msgSend_setToBSSID_(v175, v350, (uint64_t)v349, v351, v352);

    v357 = objc_msgSend_toBSSID(v175, v353, v354, v355, v356);
    v361 = objc_msgSend_substringToIndex_(v357, v358, 8, v359, v360);
    objc_msgSend_setTargetOUI_(v175, v362, (uint64_t)v361, v363, v364);

    v368 = objc_msgSend_channel_(v9, v365, 0, v366, v367);
    uint64_t v373 = objc_msgSend_channel(v368, v369, v370, v371, v372);
    objc_msgSend_setToChannel_(v175, v374, v373, v375, v376);

    v380 = objc_msgSend_RSSI_(v9, v377, 0, v378, v379);
    uint64_t v385 = objc_msgSend_integerValue(v380, v381, v382, v383, v384);
    objc_msgSend_setToRSSI_(v175, v386, v385, v387, v388);

    objc_msgSend_setStatus_(v175, v389, *((unsigned int *)a4 + 1), v390, v391);
    v533 = @"RoamStatus";
    v534 = v175;
    v393 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v392, (uint64_t)&v534, (uint64_t)&v533, 1);
    objc_msgSend_setInfo_(v10, v394, (uint64_t)v393, v395, v396);
  }
LABEL_70:

LABEL_57:
  v439 = objc_msgSend_delegate(*(void **)(a1 + 40), v26, v27, v28, v29, v485, v486);
  v441 = v439;
  if (!v30 && v439) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v439, v440, *(void *)(a1 + 40), (uint64_t)v10, 0);
  }
}

void sub_1B4F390D4(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = CWFGetOSLog();
  if (v2)
  {
    uint64_t v3 = CWFGetOSLog();
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 32) + 48), v5, v6, v7, v8);
    int v36 = 67109120;
    int v37 = v9;
    _os_log_send_and_compose_impl();
  }

  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  if (objc_msgSend_invalidated(*(void **)(a1 + 40), v11, v12, v13, v14))
  {
    objc_sync_exit(v10);
  }
  else
  {
    objc_msgSend_setInvalidated_(*(void **)(a1 + 32), v15, 1, v16, v17);
    objc_sync_exit(v10);

    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v18 = (void **)(a1 + 32);
    uint64_t v20 = v19[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B5001880;
    block[3] = &unk_1E60BB768;
    uint64_t v35 = v19;
    dispatch_sync(v20, block);
    objc_msgSend_setInterruptionHandler_(*v18, v21, 0, v22, v23);
    uint64_t v28 = objc_msgSend_targetQueue(*v18, v24, v25, v26, v27);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1B50018C8;
    v32[3] = &unk_1E60BB768;
    id v33 = *v18;
    dispatch_async(v28, v32);

    objc_msgSend_setInvalidationHandler_(*v18, v29, 0, v30, v31);
    id v10 = v35;
  }
}

void sub_1B4F3930C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F394A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_1B4F39880()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_1EB4B2610;
  uint64_t v7 = qword_1EB4B2610;
  if (!qword_1EB4B2610)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1B4F924C0;
    v3[3] = &unk_1E60BAFD8;
    v3[4] = &v4;
    sub_1B4F924C0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B4F3994C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F39964()
{
  if (!qword_1EB4B25F8) {
    qword_1EB4B25F8 = _sl_dlopen();
  }
  return qword_1EB4B25F8;
}

uint64_t sub_1B4F39A34()
{
  if (!qword_1EB4B2608) {
    qword_1EB4B2608 = _sl_dlopen();
  }
  return qword_1EB4B2608;
}

void sub_1B4F39B04(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___receivedEvent_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4F39CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F3A01C(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_remoteObjectProxy(*(void **)(a1 + 32), v3, v4, v5, v6);
  objc_msgSend_receivedXPCEvent_(v7, v8, *(void *)(a1 + 40), v9, v10);

  uint64_t v11 = CWFGetOSLog();
  if (v11)
  {
    uint64_t v12 = CWFGetOSLog();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v18 = objc_msgSend_type(*(void **)(a1 + 40), v14, v15, v16, v17);
    uint64_t v23 = sub_1B4F53484(v18, v19, v20, v21, v22);
    uint64_t v41 = objc_msgSend_UUID(*(void **)(a1 + 40), v24, v25, v26, v27);
    uint64_t v32 = objc_msgSend_UUIDString(v41, v28, v29, v30, v31);
    int v36 = objc_msgSend_substringToIndex_(v32, v33, 5, v34, v35);
    objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 32) + 144), v37, v38, v39, v40);
    uint64_t v42 = sub_1B4F4B704(*(void *)(*(void *)(a1 + 32) + 152));
    _os_log_send_and_compose_impl();
  }
}

void sub_1B4F3CA0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F3CBC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *sub_1B4F3D380(unsigned int a1)
{
  if (a1 > 3) {
    return @"?g";
  }
  else {
    return off_1E60BB698[a1];
  }
}

id sub_1B4F3D76C(void *a1)
{
  id v4 = a1;
  if (v4)
  {
    if (qword_1EB4B2620 != -1) {
      dispatch_once(&qword_1EB4B2620, &unk_1F0DA3E50);
    }
    uint64_t v5 = objc_msgSend_stringFromDate_((void *)qword_1EB4B2618, v1, (uint64_t)v4, v2, v3);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

__CFString *sub_1B4F3FD20(__CFString *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_1EB4B25D0 != -1) {
    dispatch_once(&qword_1EB4B25D0, &unk_1F0DA4030);
  }
  if (objc_msgSend_logRedactionDisabled(CWFInterface, a2, a3, a4, a5)) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = @"<redacted>";
  }
  return v6;
}

uint64_t sub_1B4F3FDF4(uint64_t result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    uint64_t v5 = a4;
    uint64_t v6 = a2;
    uint64_t v7 = result;
    do
    {
      unsigned int v8 = *(unsigned __int8 *)v6++;
      result = objc_msgSend_appendFormat_(*(void **)(v7 + 32), a2, @"%02x", a4, a5, v8);
      --v5;
    }
    while (v5);
  }
  return result;
}

__CFString *sub_1B4F3FE58(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 > 31)
  {
    switch(a1)
    {
      case 32:
        uint64_t v5 = @"wpa2-enterprise";
        goto LABEL_27;
      case 40:
        uint64_t v5 = @"wpa2-enterprise-mixed";
        goto LABEL_27;
      case 512:
        uint64_t v5 = @"open";
        goto LABEL_27;
    }
  }
  else
  {
    switch(a1)
    {
      case 1:
        if ((unint64_t)(a2 - 1) >= 5) {
          uint64_t v5 = @"wep";
        }
        else {
          uint64_t v5 = off_1E60BB608[(void)(a2 - 1)];
        }
        goto LABEL_27;
      case 2:
        uint64_t v6 = @"wapi";
        if (a3 == 2) {
          uint64_t v6 = @"wapi-cert";
        }
        if (a3 == 1) {
          uint64_t v5 = @"wapi-psk";
        }
        else {
          uint64_t v5 = v6;
        }
        goto LABEL_27;
      case 8:
        uint64_t v5 = @"wpa-enterprise";
        goto LABEL_27;
    }
  }
  if ((a1 & 0x80) != 0)
  {
    uint64_t v5 = @"wpa3-enterprise";
    goto LABEL_27;
  }
  if (a1 > 63)
  {
    if (a1 > 255)
    {
      if (a1 == 256)
      {
        uint64_t v5 = @"owe";
        goto LABEL_27;
      }
      if (a1 == 768)
      {
        uint64_t v5 = @"owe-transition";
        goto LABEL_27;
      }
    }
    else
    {
      if (a1 == 64)
      {
        uint64_t v5 = @"wpa3-sae";
        goto LABEL_27;
      }
      if (a1 == 80)
      {
        uint64_t v5 = @"wpa3-transition";
        goto LABEL_27;
      }
    }
    goto LABEL_40;
  }
  if (a1 == 4)
  {
    uint64_t v5 = @"wpa-personal";
    goto LABEL_27;
  }
  if (a1 != 16)
  {
    if (a1 == 20)
    {
      uint64_t v5 = @"wpa2-personal-mixed";
      goto LABEL_27;
    }
LABEL_40:
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (0x%lX)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  uint64_t v5 = @"wpa2-personal";
LABEL_27:
  return v5;
}

void sub_1B4F403C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F406A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F408A8()
{
  if (!qword_1EB4B25E0) {
    qword_1EB4B25E0 = _sl_dlopen();
  }
  return qword_1EB4B25E0;
}

uint64_t sub_1B4F40978()
{
  if (!qword_1EB4B25E8) {
    qword_1EB4B25E8 = _sl_dlopen();
  }
  return qword_1EB4B25E8;
}

void sub_1B4F40A58()
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v0 = qword_1EB4B25F0;
  uint64_t v16 = qword_1EB4B25F0;
  if (!qword_1EB4B25F0)
  {
    id v1 = sub_1B4F773F4();
    v14[3] = (uint64_t)dlsym(v1, "kCNSCaptiveNetworkProperty");
    qword_1EB4B25F0 = v14[3];
    uint64_t v0 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v0)
  {
    uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v2, v3, v4, v5);
    uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"CFStringRef getkCNSCaptiveNetworkProperty(void)", v8, v9);
    uint64_t v11 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v12, (uint64_t)v10, @"CWFNetworkProfile.m", 31, @"%s", v11);

    __break(1u);
  }
}

void sub_1B4F40B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F4123C(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  uint64_t v2 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        if (*(void *)(a1 + 48))
        {
          dispatch_group_enter(v2);
          uint64_t v12 = *(void *)(a1 + 40);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = sub_1B4F89C7C;
          v19[3] = &unk_1E60BB768;
          uint64_t v20 = v2;
          objc_msgSend_sendXPCEvent_reply_(v11, v13, v12, (uint64_t)v19, v14);
        }
        else
        {
          objc_msgSend_sendXPCEvent_reply_(*(void **)(*((void *)&v21 + 1) + 8 * v10), v6, *(void *)(a1 + 40), 0, v7);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v8);
  }

  uint64_t v15 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F51FA8;
  block[3] = &unk_1E60BBCF8;
  id v18 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v15, block);
}

void sub_1B4F41460(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  uint64_t v2 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        if (*(void *)(a1 + 48))
        {
          dispatch_group_enter(v2);
          uint64_t v12 = *(void *)(a1 + 40);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = sub_1B500085C;
          v19[3] = &unk_1E60BB768;
          uint64_t v20 = v2;
          objc_msgSend_sendXPCEvent_reply_(v11, v13, v12, (uint64_t)v19, v14);
        }
        else
        {
          objc_msgSend_sendXPCEvent_reply_(*(void **)(*((void *)&v21 + 1) + 8 * v10), v6, *(void *)(a1 + 40), 0, v7);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v8);
  }

  uint64_t v15 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F51AA0;
  block[3] = &unk_1E60BBCF8;
  id v18 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v15, block);
}

void sub_1B4F42148(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_UUID(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_UUIDString(v7, v8, v9, v10, v11);

  objc_msgSend___cancelRequestsWithNamePrefix_(*(void **)(a1 + 40), v13, (uint64_t)v12, v14, v15);
}

void sub_1B4F421C4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_requestParameters(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_interfaceName(v7, v8, v9, v10, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 184), v13, (uint64_t)v12, v14, v15);
    uint64_t v17 = NSNumber;
    uint64_t v22 = objc_msgSend_type(*(void **)(a1 + 32), v18, v19, v20, v21);
    uint64_t v26 = objc_msgSend_numberWithInteger_(v17, v23, v22, v24, v25);
    uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v16, v27, (uint64_t)v26, v28, v29);
    uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v33 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 184), v13, (uint64_t)v12, v14, v15);
      uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)&unk_1F0DC7B48, v35, v36);
      uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v37;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 184), v13, (uint64_t)&stru_1F0DA9CF0, v14, v15);
    uint64_t v41 = NSNumber;
    uint64_t v46 = objc_msgSend_type(*(void **)(a1 + 32), v42, v43, v44, v45);
    uint64_t v50 = objc_msgSend_numberWithInteger_(v41, v47, v46, v48, v49);
    uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v40, v51, (uint64_t)v50, v52, v53);
    uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 8);
    int v56 = *(void **)(v55 + 40);
    *(void *)(v55 + 40) = v54;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v60 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 184), v57, (uint64_t)&stru_1F0DA9CF0, v58, v59);
      uint64_t v64 = objc_msgSend_objectForKeyedSubscript_(v60, v61, (uint64_t)&unk_1F0DC7B48, v62, v63);
      uint64_t v65 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v66 = *(void **)(v65 + 40);
      *(void *)(v65 + 40) = v64;

      uint64_t v67 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v69 = *(void *)(v67 + 40);
      uint64_t v68 = (id *)(v67 + 40);
      if (!v69) {
        objc_storeStrong(v68, *(id *)(*(void *)(a1 + 40) + 192));
      }
    }
  }
}

void sub_1B4F4254C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_eventID(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_type(v7, v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v13, v12, 0, v14);
  uint64_t v20 = objc_msgSend_interfaceName(v7, v16, v17, v18, v19);
  long long v23 = objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v21, 0, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v24, 0, 0, v25);
  uint64_t v31 = objc_msgSend_allKeys(*(void **)(*(void *)(a1 + 40) + 16), v27, v28, v29, v30);
  if (objc_msgSend_containsObject_(v31, v32, (uint64_t)v7, v33, v34))
  {
  }
  else
  {
    uint64_t v42 = objc_msgSend_allKeys(*(void **)(*(void *)(a1 + 40) + 16), v35, v36, v37, v38);
    int v46 = objc_msgSend_containsObject_(v42, v43, (uint64_t)v15, v44, v45);

    if (!v46) {
      goto LABEL_8;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 32), v39, (uint64_t)v7, v40, v41);
  uint64_t v48 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v49 = *(void **)(v48 + 40);
  *(void *)(v48 + 40) = v47;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 32), v50, (uint64_t)v15, v51, v52);
    uint64_t v54 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v55 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v53;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 32), v56, (uint64_t)v23, v57, v58);
      uint64_t v60 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v61 = *(void **)(v60 + 40);
      *(void *)(v60 + 40) = v59;

      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 32), v62, (uint64_t)v26, v63, v64);
        uint64_t v66 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v67 = *(void **)(v66 + 40);
        *(void *)(v66 + 40) = v65;
      }
    }
  }
LABEL_8:
}

void sub_1B4F42768(uint64_t a1)
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6 && (objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 40) + 72), v2, v6, v3, v4) & 1) != 0
    || objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 40) + 72), v2, *(void *)(a1 + 48), v3, v4))
  {
    if (objc_msgSend_taskState(*(void **)(*(void *)(a1 + 40) + 88), v2, v7, v3, v4) == 3
      && (uint64_t v12 = *(void **)(a1 + 40),
          uint64_t v13 = objc_msgSend_type(*(void **)(a1 + 56), v8, v9, v10, v11),
          objc_msgSend___shouldCoalesceEventTypeWhileSuspended_(v12, v14, v13, v15, v16)))
    {
      objc_msgSend___coalesceAndCacheEvent_(*(void **)(a1 + 40), v8, *(void *)(a1 + 56), v10, v11);
      uint64_t v17 = CWFGetOSLog();
      if (v17)
      {
        uint64_t v18 = CWFGetOSLog();
      }
      else
      {
        uint64_t v18 = MEMORY[0x1E4F14500];
        id v53 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v58 = objc_msgSend_type(*(void **)(a1 + 56), v54, v55, v56, v57);
        uint64_t v63 = sub_1B4F53484(v58, v59, v60, v61, v62);
        uint64_t v135 = objc_msgSend_UUID(*(void **)(a1 + 56), v64, v65, v66, v67);
        uint64_t v132 = objc_msgSend_UUIDString(v135, v68, v69, v70, v71);
        uint64_t v75 = objc_msgSend_substringToIndex_(v132, v72, 5, v73, v74);
        int v80 = objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 40) + 144), v76, v77, v78, v79);
        uint64_t v81 = *(uint64_t **)(a1 + 40);
        uint64_t v82 = v81[21];
        uint64_t v83 = v81[22];
        uint64_t v84 = v81[23];
        uint64_t v85 = sub_1B4F4B704(v81[19]);
        uint64_t v90 = objc_msgSend_acknowledgementTimeout(*(void **)(a1 + 56), v86, v87, v88, v89);
        int v151 = 138545154;
        unsigned int v152 = v63;
        __int16 v153 = 2114;
        uint64_t v154 = v75;
        __int16 v155 = 1024;
        int v156 = v80;
        __int16 v157 = 2114;
        uint64_t v158 = v82;
        __int16 v159 = 2114;
        uint64_t v160 = v83;
        __int16 v161 = 2114;
        uint64_t v162 = v84;
        __int16 v163 = 2114;
        uint64_t v164 = v85;
        __int16 v165 = 2048;
        uint64_t v166 = v90;
        _os_log_send_and_compose_impl();
      }
      uint64_t v91 = *(void **)(a1 + 64);
      if (v91)
      {
        uint64_t v92 = *(NSObject **)(*(void *)(a1 + 40) + 48);
        v149[0] = MEMORY[0x1E4F143A8];
        v149[1] = 3221225472;
        v149[2] = sub_1B4F78318;
        v149[3] = &unk_1E60BBCF8;
        id v150 = v91;
        dispatch_async(v92, v149);
        uint64_t v49 = v150;
        goto LABEL_27;
      }
    }
    else
    {
      if (objc_msgSend_taskState(*(void **)(*(void *)(a1 + 40) + 88), v8, v9, v10, v11) != 3
        || (long long v23 = *(void **)(a1 + 40),
            uint64_t v24 = objc_msgSend_type(*(void **)(a1 + 56), v19, v20, v21, v22),
            !objc_msgSend___shouldDropEventTypeWhileSuspended_(v23, v25, v24, v26, v27)))
      {
        uint64_t v30 = objc_msgSend_acknowledgementTimeout(*(void **)(a1 + 56), v19, v20, v21, v22);
        uint64_t v34 = *(void *)(a1 + 40);
        if (v30)
        {
          objc_msgSend_addObject_(*(void **)(v34 + 80), v31, *(void *)(a1 + 56), v32, v33);
          objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 40), v35, v36, v37, v38);
          uint64_t v39 = *(void *)(a1 + 40);
          uint64_t v40 = *(NSObject **)(v39 + 40);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1B4F783B0;
          block[3] = &unk_1E60BBD20;
          void block[4] = v39;
          id v145 = *(id *)(a1 + 56);
          id v146 = *(id *)(a1 + 64);
          dispatch_async(v40, block);
          int64_t v45 = objc_msgSend_acknowledgementTimeout(*(void **)(a1 + 56), v41, v42, v43, v44);
          dispatch_time_t v46 = dispatch_time(0, v45);
          uint64_t v47 = *(void *)(a1 + 40);
          uint64_t v48 = *(NSObject **)(v47 + 16);
          v141[0] = MEMORY[0x1E4F143A8];
          v141[1] = 3221225472;
          v141[2] = sub_1B4F789A8;
          v141[3] = &unk_1E60BBD20;
          v141[4] = v47;
          id v142 = *(id *)(a1 + 56);
          id v143 = *(id *)(a1 + 64);
          dispatch_after(v46, v48, v141);

          uint64_t v49 = v145;
        }
        else
        {
          uint64_t v52 = *(NSObject **)(v34 + 40);
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = sub_1B4F3A01C;
          v139[3] = &unk_1E60BB9F0;
          v139[4] = v34;
          id v140 = *(id *)(a1 + 56);
          dispatch_async(v52, v139);
          uint64_t v49 = v140;
        }
        goto LABEL_27;
      }
      uint64_t v28 = CWFGetOSLog();
      if (v28)
      {
        uint64_t v29 = CWFGetOSLog();
      }
      else
      {
        uint64_t v29 = MEMORY[0x1E4F14500];
        id v93 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v98 = objc_msgSend_type(*(void **)(a1 + 56), v94, v95, v96, v97);
        uint64_t v103 = sub_1B4F53484(v98, v99, v100, v101, v102);
        v136 = objc_msgSend_UUID(*(void **)(a1 + 56), v104, v105, v106, v107);
        uint64_t v134 = objc_msgSend_UUIDString(v136, v108, v109, v110, v111);
        uint64_t v115 = objc_msgSend_substringToIndex_(v134, v112, 5, v113, v114);
        int v120 = objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 40) + 144), v116, v117, v118, v119);
        uint64_t v121 = *(uint64_t **)(a1 + 40);
        uint64_t v122 = v121[21];
        uint64_t v123 = v121[22];
        uint64_t v133 = v121[23];
        uint64_t v124 = sub_1B4F4B704(v121[19]);
        uint64_t v129 = objc_msgSend_acknowledgementTimeout(*(void **)(a1 + 56), v125, v126, v127, v128);
        int v151 = 138545154;
        unsigned int v152 = v103;
        __int16 v153 = 2114;
        uint64_t v154 = v115;
        __int16 v155 = 1024;
        int v156 = v120;
        __int16 v157 = 2114;
        uint64_t v158 = v122;
        __int16 v159 = 2114;
        uint64_t v160 = v123;
        __int16 v161 = 2114;
        uint64_t v162 = v133;
        __int16 v163 = 2114;
        uint64_t v164 = v124;
        __int16 v165 = 2048;
        uint64_t v166 = v129;
        _os_log_send_and_compose_impl();
      }
      uint64_t v130 = *(void **)(a1 + 64);
      if (v130)
      {
        uint64_t v131 = *(NSObject **)(*(void *)(a1 + 40) + 48);
        v147[0] = MEMORY[0x1E4F143A8];
        v147[1] = 3221225472;
        v147[2] = sub_1B4F78364;
        v147[3] = &unk_1E60BBCF8;
        id v148 = v130;
        dispatch_async(v131, v147);
        uint64_t v49 = v148;
        goto LABEL_27;
      }
    }
  }
  else
  {
    uint64_t v50 = *(void **)(a1 + 64);
    if (v50)
    {
      uint64_t v51 = *(NSObject **)(*(void *)(a1 + 40) + 48);
      v137[0] = MEMORY[0x1E4F143A8];
      v137[1] = 3221225472;
      v137[2] = sub_1B4F78C6C;
      v137[3] = &unk_1E60BBCF8;
      id v138 = v50;
      dispatch_async(v51, v137);
      uint64_t v49 = v138;
LABEL_27:
    }
  }
}

void sub_1B4F4325C(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  if (!*(unsigned char *)(a1 + 56)) {
    objc_msgSend_XPCConnection_receivedXPCRequest_(*(void **)(a1 + 32), v2, *(void *)(a1 + 40), *(void *)(a1 + 48), v5);
  }
  uint64_t v7 = objc_msgSend_requestParameters(*(void **)(a1 + 48), v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_timeout(v7, v8, v9, v10, v11);

  if (v12)
  {
    uint64_t v17 = objc_msgSend_requestParameters(*(void **)(a1 + 48), v13, v14, v15, v16);
    int64_t v22 = objc_msgSend_timeout(v17, v18, v19, v20, v21);
    dispatch_time_t v23 = dispatch_time(0, v22);
    uint64_t v24 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F48FC8;
    block[3] = &unk_1E60BB768;
    id v26 = *(id *)(a1 + 48);
    dispatch_after(v23, v24, block);
  }
}

void sub_1B4F43378(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 88);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    uint64_t v5 = CWFGetOSLog();
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  BOOL v11 = objc_msgSend_code(*(void **)(a1 + 48), v7, v8, v9, v10) != 0;
  if (os_log_type_enabled(v5, (os_log_type_t)(16 * v11)))
  {
    id v53 = v2;
    uint64_t v54 = sub_1B4F43CD0(*(void *)(a1 + 96), v12, v13, v14, v15);
    clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 64) + 144), v16, v17, v18, v19);
    uint64_t v20 = sub_1B4F4B704(*(void *)(*(void *)(a1 + 64) + 152));
    qos_class_self();
    uint64_t v25 = objc_msgSend_interfaceName(*(void **)(a1 + 72), v21, v22, v23, v24);
    uint64_t v30 = objc_msgSend_UUIDString(*(void **)(a1 + 80), v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_substringToIndex_(v30, v31, 5, v32, v33);
    objc_msgSend_code(*(void **)(a1 + 32), v35, v36, v37, v38);
    char isUserPrivacySensitiveRequestType = objc_msgSend___isUserPrivacySensitiveRequestType_(*(void **)(a1 + 64), v39, *(void *)(a1 + 96), v40, v41);
    if (isUserPrivacySensitiveRequestType)
    {
      uint64_t v47 = @"<private>";
    }
    else
    {
      uint64_t v52 = objc_msgSend_description(*(void **)(a1 + 40), v42, v43, v44, v45);
      objc_msgSend_redactedForWiFi(v52, v48, v49, v50, v51);
      uint64_t v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    _os_log_send_and_compose_impl();
    if ((isUserPrivacySensitiveRequestType & 1) == 0)
    {
    }
    uint64_t v2 = v53;
  }
}

void sub_1B4F43674(uint64_t a1)
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_allKeys(*(void **)(*(void *)(a1 + 32) + 56), v3, v4, v5, v6);
  int v11 = objc_msgSend_containsObject_(v7, v8, *(void *)(a1 + 40), v9, v10);

  if (v11)
  {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 56), v12, 0, *(void *)(a1 + 40), v13);
    objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 32), v14, v15, v16, v17);
    id v26 = &off_1B5031000;
    if (objc_msgSend_code(*(void **)(a1 + 48), v18, v19, v20, v21) == 60
      && (objc_msgSend_domain(*(void **)(a1 + 48), v22, v23, v24, v25),
          uint64_t v27 = objc_claimAutoreleasedReturnValue(),
          int v31 = objc_msgSend_isEqualToString_(v27, v28, *MEMORY[0x1E4F28798], v29, v30),
          v27,
          v31))
    {
      uint64_t v32 = CWFGetOSLog();
      if (v32)
      {
        uint64_t v33 = CWFGetOSLog();
      }
      else
      {
        uint64_t v33 = MEMORY[0x1E4F14500];
        id v45 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v50 = @"SUBREQ";
        if (!*(void *)(a1 + 56)) {
          uint64_t v50 = @"REQ";
        }
        uint64_t v119 = v50;
        uint64_t v117 = sub_1B4F43CD0(*(void *)(a1 + 96), v46, v47, v48, v49);
        double v51 = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(a1 + 104)) / 1000000000.0;
        int v56 = objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 32) + 144), v52, v53, v54, v55);
        uint64_t v57 = *(uint64_t **)(a1 + 32);
        uint64_t v111 = v57[21];
        uint64_t v113 = v57[22];
        uint64_t v115 = v57[23];
        unint64_t v58 = sub_1B4F4B704(v57[19]);
        uint64_t v63 = objc_msgSend_interfaceName(*(void **)(a1 + 64), v59, v60, v61, v62);
        uint64_t v68 = objc_msgSend_UUIDString(*(void **)(a1 + 40), v64, v65, v66, v67);
        objc_msgSend_substringToIndex_(v68, v69, 5, v70, v71);
        int v135 = 138545666;
        v136 = v119;
        __int16 v137 = 2114;
        uint64_t v138 = (uint64_t)v117;
        __int16 v139 = 2048;
        double v140 = v51;
        __int16 v141 = 1024;
        int v142 = v56;
        __int16 v143 = 2114;
        uint64_t v144 = v111;
        __int16 v145 = 2114;
        uint64_t v146 = v113;
        id v26 = &off_1B5031000;
        __int16 v147 = 2114;
        uint64_t v148 = v115;
        __int16 v149 = 2114;
        id v150 = v58;
        __int16 v151 = 2114;
        unsigned int v152 = v63;
        __int16 v153 = 2114;
        id v154 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();
      }
      uint64_t v76 = objc_msgSend_delegate(*(void **)(a1 + 32), v72, v73, v74, v75);
      if (v76)
      {
        uint64_t v77 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = *((void *)v26 + 121);
        block[2] = sub_1B4F79B1C;
        block[3] = &unk_1E60BB950;
        uint64_t v44 = v76;
        uint64_t v78 = *(void *)(a1 + 32);
        uint64_t v79 = *(void **)(a1 + 40);
        uint64_t v132 = v44;
        uint64_t v133 = v78;
        id v134 = v79;
        dispatch_async(v77, block);

        int v80 = v132;
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v44 = 0;
    }
    else
    {
      if (objc_msgSend_code(*(void **)(a1 + 48), v22, v23, v24, v25) != 89) {
        goto LABEL_25;
      }
      uint64_t v38 = objc_msgSend_domain(*(void **)(a1 + 48), v34, v35, v36, v37);
      int isEqualToString = objc_msgSend_isEqualToString_(v38, v39, *MEMORY[0x1E4F28798], v40, v41);

      if (!isEqualToString) {
        goto LABEL_25;
      }
      uint64_t v43 = CWFGetOSLog();
      if (v43)
      {
        uint64_t v44 = CWFGetOSLog();
      }
      else
      {
        uint64_t v44 = MEMORY[0x1E4F14500];
        id v81 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v86 = @"SUBREQ";
        if (!*(void *)(a1 + 56)) {
          uint64_t v86 = @"REQ";
        }
        int v120 = v86;
        uint64_t v118 = sub_1B4F43CD0(*(void *)(a1 + 96), v82, v83, v84, v85);
        double v87 = (double)(clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(void *)(a1 + 104)) / 1000000000.0;
        int v92 = objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 32) + 144), v88, v89, v90, v91);
        id v93 = *(uint64_t **)(a1 + 32);
        uint64_t v112 = v93[21];
        uint64_t v114 = v93[22];
        uint64_t v116 = v93[23];
        uint64_t v94 = sub_1B4F4B704(v93[19]);
        uint64_t v99 = objc_msgSend_interfaceName(*(void **)(a1 + 64), v95, v96, v97, v98);
        uint64_t v104 = objc_msgSend_UUIDString(*(void **)(a1 + 40), v100, v101, v102, v103);
        objc_msgSend_substringToIndex_(v104, v105, 5, v106, v107);
        int v135 = 138545666;
        v136 = v120;
        __int16 v137 = 2114;
        uint64_t v138 = v118;
        __int16 v139 = 2048;
        double v140 = v87;
        __int16 v141 = 1024;
        int v142 = v92;
        __int16 v143 = 2114;
        uint64_t v144 = v112;
        __int16 v145 = 2114;
        uint64_t v146 = v114;
        id v26 = &off_1B5031000;
        __int16 v147 = 2114;
        uint64_t v148 = v116;
        __int16 v149 = 2114;
        id v150 = v94;
        __int16 v151 = 2114;
        unsigned int v152 = v99;
        __int16 v153 = 2114;
        id v154 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

        int v80 = (void *)v118;
        goto LABEL_23;
      }
    }
LABEL_24:

LABEL_25:
    uint64_t v108 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = *((void *)v26 + 121);
    v121[2] = sub_1B4F43378;
    v121[3] = &unk_1E60BBD98;
    id v129 = *(id *)(a1 + 88);
    id v122 = *(id *)(a1 + 48);
    id v123 = *(id *)(a1 + 72);
    id v124 = *(id *)(a1 + 80);
    id v109 = *(id *)(a1 + 56);
    long long v130 = *(_OWORD *)(a1 + 96);
    uint64_t v110 = *(void *)(a1 + 32);
    id v125 = v109;
    uint64_t v126 = v110;
    id v127 = *(id *)(a1 + 64);
    id v128 = *(id *)(a1 + 40);
    dispatch_async(v108, v121);
  }
}

__CFString *sub_1B4F43CD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = @"NONE";
  switch(a1)
  {
    case 0:
      goto LABEL_726;
    case 1:
      uint64_t v8 = @"GET INTF NAMES";
      break;
    case 2:
      uint64_t v8 = @"GET VIRTUAL INTF NAMES";
      break;
    case 3:
      uint64_t v8 = @"GET INTF NAME";
      break;
    case 4:
      uint64_t v8 = @"GET INTF CAPS";
      break;
    case 5:
      uint64_t v8 = @"GET POWER";
      break;
    case 6:
      uint64_t v8 = @"SET POWER";
      break;
    case 7:
      uint64_t v8 = @"GET SSID";
      break;
    case 8:
      uint64_t v8 = @"GET SSID FOR VENDOR";
      break;
    case 9:
      uint64_t v8 = @"GET BSSID";
      break;
    case 10:
      uint64_t v8 = @"GET BSSID FOR VENDOR";
      break;
    case 11:
      uint64_t v8 = @"GET AUTH TYPE";
      break;
    case 12:
      uint64_t v8 = @"GET SECURITY";
      break;
    case 13:
      uint64_t v8 = @"GET WEP SUBTYPE";
      break;
    case 14:
      uint64_t v8 = @"GET WAPI SUBTYPE";
      break;
    case 15:
      uint64_t v8 = @"GET SUPP CHANNELS";
      break;
    case 16:
      uint64_t v8 = @"GET CHANNEL";
      break;
    case 17:
      uint64_t v8 = @"SET CHANNEL";
      break;
    case 18:
      uint64_t v8 = @"GET RSSI";
      break;
    case 19:
      uint64_t v8 = @"GET NOISE";
      break;
    case 20:
      uint64_t v8 = @"GET TX RATE";
      break;
    case 21:
      uint64_t v8 = @"GET TX POWER";
      break;
    case 22:
      uint64_t v8 = @"GET COUNTRY CODE";
      break;
    case 23:
      uint64_t v8 = @"SET COMPANION COUNTRY CODE";
      break;
    case 24:
      uint64_t v8 = @"GET DTIM INTERVAL";
      break;
    case 25:
      uint64_t v8 = @"GET GUARD INTERVAL";
      break;
    case 26:
      uint64_t v8 = @"GET MCS INDEX";
      break;
    case 27:
      uint64_t v8 = @"GET NSS";
      break;
    case 28:
      uint64_t v8 = @"GET SUPP PHY MODES";
      break;
    case 29:
      uint64_t v8 = @"GET PHY MODE";
      break;
    case 30:
      uint64_t v8 = @"GET OP MODE";
      break;
    case 31:
      uint64_t v8 = @"GET VIRTUAL INTF ROLE";
      break;
    case 32:
      uint64_t v8 = @"GET PARENT INTF NAME";
      break;
    case 33:
      uint64_t v8 = @"GET MAC ADDR";
      break;
    case 34:
      uint64_t v8 = @"GET RANGING CAPS";
      break;
    case 35:
      uint64_t v8 = @"GET THERMAL INDEX";
      break;
    case 36:
      uint64_t v8 = @"SET THERMAL INDEX";
      break;
    case 37:
      uint64_t v8 = @"GET LINK DOWN STATUS";
      break;
    case 38:
      uint64_t v8 = @"GET WOW ENABLED";
      break;
    case 39:
      uint64_t v8 = @"GET AWDL SYNC ENABLED";
      break;
    case 40:
      uint64_t v8 = @"GET AWDL PREFERRED CHANNELS";
      break;
    case 41:
      uint64_t v8 = @"GET AWDL SYNC STATE";
      break;
    case 42:
      uint64_t v8 = @"GET AWDL SYNC CHANNEL SEQ";
      break;
    case 43:
      uint64_t v8 = @"GET AWDL SYNC PARAMS";
      break;
    case 44:
      uint64_t v8 = @"GET AWDL STRATEGY";
      break;
    case 45:
      uint64_t v8 = @"GET AWDL ELECTION PARAMS";
      break;
    case 46:
      uint64_t v8 = @"GET AWDL ELECTION ID";
      break;
    case 47:
      uint64_t v8 = @"GET AWDL ELECTION RSSI THRESH";
      break;
    case 48:
      uint64_t v8 = @"GET AWDL PEER DATABASE";
      break;
    case 49:
      uint64_t v8 = @"GET AWDL SOCIAL TIME SLOTS";
      break;
    case 50:
      uint64_t v8 = @"GET AWDL MASTER CHANNEL";
      break;
    case 51:
      uint64_t v8 = @"GET AWDL SECONDARY MASTER CHANNEL";
      break;
    case 52:
      uint64_t v8 = @"GET AWDL OP MODE";
      break;
    case 53:
      uint64_t v8 = @"GET AWDL STATS";
      break;
    case 54:
      uint64_t v8 = @"GET KNOWN NETWORKS LIST";
      break;
    case 55:
      uint64_t v8 = @"GET KNOWN NETWORK MATCHING NETWORK PROFILE";
      break;
    case 56:
      uint64_t v8 = @"GET KNOWN NETWORK MATCHING SCAN RESULT";
      break;
    case 57:
      uint64_t v8 = @"GET CURR SCAN RESULT";
      break;
    case 58:
      uint64_t v8 = @"GET CURR KNOWN NETWORK";
      break;
    case 59:
      uint64_t v8 = @"ADD KNOWN NETWORK";
      break;
    case 60:
      uint64_t v8 = @"REMOVE KNOWN NETWORK";
      break;
    case 61:
      uint64_t v8 = @"UPDATE KNOWN NETWORK";
      break;
    case 62:
      uint64_t v8 = @"ASSOC";
      break;
    case 63:
      uint64_t v8 = @"DISASSOC";
      break;
    case 64:
      uint64_t v8 = @"SCAN";
      break;
    case 65:
      uint64_t v8 = @"ANQP";
      break;
    case 66:
      uint64_t v8 = @"START AWDL PEER ASSISTED DISC";
      break;
    case 67:
      uint64_t v8 = @"STOP AWDL PEER ASSISTED DISC";
      break;
    case 68:
      uint64_t v8 = @"SET RANGEABLE";
      break;
    case 69:
      uint64_t v8 = @"RANGING";
      break;
    case 70:
      uint64_t v8 = @"POWER CHANGED EVENT";
      break;
    case 71:
      uint64_t v8 = @"SSID CHANGED EVENT";
      break;
    case 72:
      uint64_t v8 = @"BSSID CHANGED EVENT";
      break;
    case 73:
      uint64_t v8 = @"RSN HANDSHAKE DONE EVENT";
      break;
    case 74:
      uint64_t v8 = @"COUNTRY CODE CHANGED EVENT";
      break;
    case 75:
      uint64_t v8 = @"SCAN CACHE UPDATED EVENT";
      break;
    case 76:
      uint64_t v8 = @"LINK CHANGED EVENT";
      break;
    case 77:
      uint64_t v8 = @"LINK QUALITY EVENT";
      break;
    case 78:
      uint64_t v8 = @"MODE CHANGED EVENT";
      break;
    case 79:
      uint64_t v8 = @"WOW CHANGED EVENT";
      break;
    case 80:
      uint64_t v8 = @"INTERFACE ADDED EVENT";
      break;
    case 81:
      uint64_t v8 = @"INTERFACE REMOVED EVENT";
      break;
    case 82:
      uint64_t v8 = @"AUTO-JOIN STATUS CHANGED EVENT";
      break;
    case 83:
      uint64_t v8 = @"JOIN STATUS CHANGED EVENT";
      break;
    case 84:
      uint64_t v8 = @"ROAM STATUS CHANGED EVENT";
      break;
    case 85:
      uint64_t v8 = @"AWDL REAL TIME MODE STARTED EVENT";
      break;
    case 86:
      uint64_t v8 = @"AWDL REAL TIME MODE ENDED EVENT";
      break;
    case 87:
      uint64_t v8 = @"AWDL SYNC STATE CHANGED EVENT";
      break;
    case 88:
      uint64_t v8 = @"NET SVCE CHANGED EVENT";
      break;
    case 89:
      uint64_t v8 = @"IPv4 CHANGED EVENT";
      break;
    case 90:
      uint64_t v8 = @"IPv6 CHANGED EVENT";
      break;
    case 91:
      uint64_t v8 = @"DNS CHANGED EVENT";
      break;
    case 92:
      uint64_t v8 = @"DHCP CHANGED EVENT";
      break;
    case 93:
      uint64_t v8 = @"NET REACHABILITY CHANGED EVENT";
      break;
    case 94:
      uint64_t v8 = @"EAP8021X CHANGED EVENT";
      break;
    case 95:
      uint64_t v8 = @"(INTERNAL) WILL ASSOC EVENT";
      break;
    case 96:
      uint64_t v8 = @"(INTERNAL) ASSOC DONE EVENT";
      break;
    case 97:
      uint64_t v8 = @"(INTERNAL) AUTO JOIN STATE CHANGED EVENT";
      break;
    case 98:
      uint64_t v8 = @"GET EVENT REGS";
      break;
    case 99:
      uint64_t v8 = @"GET SYSTEM EVENT REGS";
      break;
    case 100:
      uint64_t v8 = @"FOREGROUND APP ACTIVITY";
      break;
    case 101:
      uint64_t v8 = @"BACKGROUND APP ACTIVITY";
      break;
    case 102:
      uint64_t v8 = @"WIFI-BOUND ACTIVITY";
      break;
    case 103:
      uint64_t v8 = @"ENABLE WOW ACTIVITY";
      break;
    case 104:
      uint64_t v8 = @"QUIESCE WIFI ACTIVITY";
      break;
    case 105:
      uint64_t v8 = @"DISABLE AUTO-JOIN ACTIVITY";
      break;
    case 106:
      uint64_t v8 = @"DATAPATH IN USE ACTIVITY";
      break;
    case 107:
      uint64_t v8 = @"HIGH BANDWIDTH DATAPATH IN USE ACTIVITY";
      break;
    case 108:
      uint64_t v8 = @"LOW LATENCY DATAPATH IN USE ACTIVITY";
      break;
    case 109:
      uint64_t v8 = @"2GHZ IN USE ACTIVITY";
      break;
    case 110:
      uint64_t v8 = @"5GHZ IN USE ACTIVITY";
      break;
    case 111:
      uint64_t v8 = @"DISABLE LINK RECOVERY ACTIVITY";
      break;
    case 112:
      uint64_t v8 = @"GET ACTIVITY REGS";
      break;
    case 113:
      uint64_t v8 = @"GET SYSTEM ACTIVITY REGS";
      break;
    case 114:
      uint64_t v8 = @"GET IO80211 CONTROLLER INFO";
      break;
    case 115:
      uint64_t v8 = @"GET IO80211 INTERFACE INFO";
      break;
    case 116:
      uint64_t v8 = @"GET IPv4 ADDRS";
      break;
    case 117:
      uint64_t v8 = @"GET IPv4 ROUTER";
      break;
    case 118:
      uint64_t v8 = @"GET IPv6 ADDRS";
      break;
    case 119:
      uint64_t v8 = @"GET IPv6 ROUTER";
      break;
    case 120:
      uint64_t v8 = @"GET NET SVCE ID";
      break;
    case 121:
      uint64_t v8 = @"GET NET SVCE NAME";
      break;
    case 122:
      uint64_t v8 = @"GET NET SVCE ENABLED";
      break;
    case 123:
      uint64_t v8 = @"GET DHCP START";
      break;
    case 124:
      uint64_t v8 = @"GET DHCP EXPIRE";
      break;
    case 125:
      uint64_t v8 = @"GET DNS SERVER ADDRS";
      break;
    case 126:
      uint64_t v8 = @"GET GLOBAL IPv4 ADDRS";
      break;
    case 127:
      uint64_t v8 = @"GET GLOBAL IPv4 ROUTER";
      break;
    case 128:
    case 133:
      uint64_t v8 = @"GET GLOBAL IPv4 NET SVCE ID";
      break;
    case 129:
    case 134:
      uint64_t v8 = @"GET GLOBAL IPv4 NET SVCE NAME";
      break;
    case 130:
    case 135:
      uint64_t v8 = @"GET GLOBAL IPv4 INTF NAME";
      break;
    case 131:
      uint64_t v8 = @"GET GLOBAL IPv6 ADDRS";
      break;
    case 132:
      uint64_t v8 = @"GET GLOBAL IPv6 ROUTER";
      break;
    case 136:
      uint64_t v8 = @"GET GLOBAL DNS SERVER ADDRS";
      break;
    case 137:
      uint64_t v8 = @"GET NET REACHABILITY";
      break;
    case 138:
      uint64_t v8 = @"GET 1X SUPP STATE";
      break;
    case 139:
      uint64_t v8 = @"GET 1X CONTROL MODE";
      break;
    case 140:
      uint64_t v8 = @"GET 1X CONTROL STATE";
      break;
    case 141:
      uint64_t v8 = @"GET 1X CLIENT STATUS";
      break;
    case 142:
      uint64_t v8 = @"GET ROAM STATUS";
      break;
    case 143:
      uint64_t v8 = @"GET JOIN STATUS";
      break;
    case 144:
      uint64_t v8 = @"GET AUTO JOIN STATUS";
      break;
    case 145:
      uint64_t v8 = @"GET DEVICE UUID";
      break;
    case 146:
      uint64_t v8 = @"GET AWDL SIDECAR DIAGNOSTICS";
      break;
    case 147:
      uint64_t v8 = @"GET POWER STATE";
      break;
    case 148:
      uint64_t v8 = @"GET CHAIN ACK";
      break;
    case 149:
      uint64_t v8 = @"GET TX CHAIN POWER";
      break;
    case 150:
      uint64_t v8 = @"GET DESENSE";
      break;
    case 151:
      uint64_t v8 = @"GET DESENSE LEVEL";
      break;
    case 152:
      uint64_t v8 = @"GET BT COEX CONFIG";
      break;
    case 153:
      uint64_t v8 = @"GET BT COEX PROFILES 2GHZ";
      break;
    case 154:
      uint64_t v8 = @"GET BT COEX PROFILES 5GHZ";
      break;
    case 155:
      uint64_t v8 = @"GET BT COEX MODE";
      break;
    case 156:
      uint64_t v8 = @"GET LEAKY AP STATS";
      break;
    case 157:
      uint64_t v8 = @"GET AWDL EXT STATE MACHINE PARAMS";
      break;
    case 158:
      uint64_t v8 = @"GET AWDL ELECTION METRIC";
      break;
    case 159:
      uint64_t v8 = @"GET AWDL PRESENCE MODE";
      break;
    case 160:
      uint64_t v8 = @"GET AWDL GUARD TIME";
      break;
    case 161:
      uint64_t v8 = @"GET AWDL AVAIL WINDOW AP ALIGNMENT";
      break;
    case 162:
      uint64_t v8 = @"GET AWDL CONT ELECTION ALGORITHM ENABLED";
      break;
    case 163:
      uint64_t v8 = @"GET AWDL AF TX MODE";
      break;
    case 164:
      uint64_t v8 = @"GET AWDL PEER TRAFFIC REG";
      break;
    case 165:
      uint64_t v8 = @"GET AWDL ENCRYPTION TYPE";
      break;
    case 166:
      uint64_t v8 = @"GET AWDL BTLE STATE PARAMS";
      break;
    case 167:
      uint64_t v8 = @"GET LINK QUALITY METRIC";
      break;
    case 168:
      uint64_t v8 = @"CANCEL";
      break;
    case 169:
      uint64_t v8 = @"START MONITORING EVENT";
      break;
    case 170:
      uint64_t v8 = @"STOP MONITORING EVENT";
      break;
    case 171:
      uint64_t v8 = @"BEGIN ACTIVITY";
      break;
    case 172:
      uint64_t v8 = @"END ACTIVITY";
      break;
    case 173:
      uint64_t v8 = @"GET HW MAC ADDR";
      break;
    case 174:
      uint64_t v8 = @"SET RANGING IDENTIFIER";
      break;
    case 175:
      uint64_t v8 = @"GET LQM SUMMARY";
      break;
    case 176:
      uint64_t v8 = @"GET POWER DEBUG INFO";
      break;
    case 177:
      uint64_t v8 = @"AUTO-JOIN";
      break;
    case 178:
      uint64_t v8 = @"GET CCA";
      break;
    case 179:
      uint64_t v8 = @"GET USER AUTO JOIN STATE";
      break;
    case 180:
      uint64_t v8 = @"SET USER AUTO JOIN STATE";
      break;
    case 181:
      uint64_t v8 = @"USER AUTO JOIN STATE CHANGED EVENT";
      break;
    case 182:
      uint64_t v8 = @"GET AUTO HOTSPOT MODE";
      break;
    case 183:
      uint64_t v8 = @"SET AUTO HOTSPOT MODE";
      break;
    case 184:
      uint64_t v8 = @"AUTO HOTSPOT MODE CHANGED EVENT";
      break;
    case 185:
      uint64_t v8 = @"GET WIFI UI STATE FLAGS";
      break;
    case 186:
      uint64_t v8 = @"WIFI UI STATE FLAGS CHANGED EVENT";
      break;
    case 187:
      uint64_t v8 = @"GET RX RATE";
      break;
    case 188:
      uint64_t v8 = @"SENSING";
      break;
    case 189:
      uint64_t v8 = @"GET USER SETTINGS";
      break;
    case 190:
      uint64_t v8 = @"SET USER SETTINGS";
      break;
    case 191:
      uint64_t v8 = @"USER SETTING CHANGED EVENT";
      break;
    case 192:
      uint64_t v8 = @"LINK DOWN DEBOUNCE FAILED EVENT";
      break;
    case 193:
      uint64_t v8 = @"GET AUTO-JOIN METRIC";
      break;
    case 194:
      uint64_t v8 = @"GET AUTO-JOIN STATS";
      break;
    case 195:
      uint64_t v8 = @"RESET AUTO-JOIN STATS";
      break;
    case 196:
      uint64_t v8 = @"KNOWN NETWORK PROFILE CHANGED EVENT";
      break;
    case 197:
      uint64_t v8 = @"BAND SUPPORT FOR CURRENT COUNTRY";
      break;
    case 198:
      uint64_t v8 = @"ADD KNOWN BSS";
      break;
    case 199:
      uint64_t v8 = @"REMOVE KNOWN BSS";
      break;
    case 200:
      uint64_t v8 = @"UPDATED KNOWN BSS";
      break;
    case 201:
      uint64_t v8 = @"GET PASSWORD";
      break;
    case 202:
      uint64_t v8 = @"SET PASSWORD";
      break;
    case 203:
      uint64_t v8 = @"GET IPv4 SUBNET MASKS";
      break;
    case 204:
      uint64_t v8 = @"GET IPv4 ARP RESOLVED HW ADDR";
      break;
    case 205:
      uint64_t v8 = @"GET IPv4 ARP RESOLVED IP ADDR";
      break;
    case 206:
      uint64_t v8 = @"GET DHCP SERVER ID";
      break;
    case 207:
      uint64_t v8 = @"GET DHCPv6 SERVER ID";
      break;
    case 208:
      uint64_t v8 = @"GET IPv4 NETWORK SIGNATURE";
      break;
    case 209:
      uint64_t v8 = @"GET IPv6 NETWORK SIGNATURE";
      break;
    case 210:
      uint64_t v8 = @"GET HW SUPP CHANNELS";
      break;
    case 211:
      uint64_t v8 = @"GET MAX LINK SPEED";
      break;
    case 212:
      uint64_t v8 = @"GET STATE";
      break;
    case 213:
      uint64_t v8 = @"GET POWERSAVE";
      break;
    case 214:
      uint64_t v8 = @"GET MAX NSS FOR AP";
      break;
    case 215:
      uint64_t v8 = @"GET TX NSS";
      break;
    case 216:
      uint64_t v8 = @"GET BEACON CACHE";
      break;
    case 217:
      uint64_t v8 = @"GET BLOCKED BANDS";
      break;
    case 218:
      uint64_t v8 = @"SET BLOCKED BANDS";
      break;
    case 219:
      uint64_t v8 = @"UPDATE SOFT AP BAND";
      break;
    case 220:
      uint64_t v8 = @"START HOSTAP MODE";
      break;
    case 221:
      uint64_t v8 = @"STOP HOSTAP MODE";
      break;
    case 222:
      uint64_t v8 = @"GET PRIVATE MAC ADDR";
      break;
    case 223:
      uint64_t v8 = @"GET PRIVATE MAC MODE";
      break;
    case 224:
      uint64_t v8 = @"SET PRIVATE MAC USER SETTING";
      break;
    case 225:
      uint64_t v8 = @"GET PRIVATE MAC MODE SYSTEM SETTING";
      break;
    case 226:
      uint64_t v8 = @"SET PRIVATE MAC SYSTEM SETTING";
      break;
    case 227:
      uint64_t v8 = @"SET PRIVATE MAC USER JOIN FAILURE UI STATE";
      break;
    case 228:
      uint64_t v8 = @"GET QUICK PROBE REQUIRED";
      break;
    case 229:
      uint64_t v8 = @"REPORT QUICK PROBE RESULT";
      break;
    case 230:
      uint64_t v8 = @"DISABLE PRIVATE MAC ADDR ROTATION ACTIVITY";
      break;
    case 231:
      uint64_t v8 = @"HOSTAP STA DID ARRIVE EVENT";
      break;
    case 232:
      uint64_t v8 = @"HOSTAP STA DID LEAVE EVENT";
      break;
    case 233:
      uint64_t v8 = @"GET HOSTAP STA LIST";
      break;
    case 234:
      uint64_t v8 = @"GET LQM CONFIG";
      break;
    case 235:
      uint64_t v8 = @"SET LQM CONFIG";
      break;
    case 236:
      uint64_t v8 = @"GET WIFI ASSIST OVERRIDE REASONS";
      break;
    case 237:
      uint64_t v8 = @"WIFI ASSIST CONFIG CHANGED EVENT";
      break;
    case 238:
      uint64_t v8 = @"NEARBY DEVICE DISCOVERY";
      break;
    case 239:
      uint64_t v8 = @"NEARBY DEVICE DISCOVERY RESULT EVENT";
      break;
    case 240:
      uint64_t v8 = @"NEARBY DEVICE DISCOVERY DONE EVENT";
      break;
    case 241:
      uint64_t v8 = @"GET BG SCAN CACHE";
      break;
    case 242:
      uint64_t v8 = @"BG SCAN CACHE NETWK AVAILABLE EVENT";
      break;
    case 243:
      uint64_t v8 = @"GET BG SCAN CONFIG";
      break;
    case 244:
      uint64_t v8 = @"SET BG SCAN CONFIG";
      break;
    case 248:
      uint64_t v8 = @"GET KNOWN NETWORK INFO LOCAL NETWORK";
      break;
    default:
      objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_726:
      break;
  }
  return v8;
}

void sub_1B4F4543C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v9);
}

void sub_1B4F46258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1B4F46BB8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = objc_msgSend_interfaceName(*(void **)(a1 + 32), a2, a3, a4, a5);
  if (objc_msgSend_isMonitoringEventType_interfaceName_(*(void **)(a1 + 32), v10, (uint64_t)a2, (uint64_t)v9, v11))
  {
    uint64_t v12 = CWFGetOSLog();
    if (v12)
    {
      uint64_t v13 = CWFGetOSLog();
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      _os_log_send_and_compose_impl();
    }

    uint64_t v19 = objc_msgSend_eventHandler(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v20 = (void *)v19;
    if (v19) {
      (*(void (**)(uint64_t, void, const char *, uint64_t, uint64_t))(v19 + 16))(v19, *(void *)(a1 + 32), a2, a3, a4);
    }
  }
}

uint64_t sub_1B4F46E90(uint64_t a1)
{
  if ((unint64_t)(a1 - 70) < 0x19) {
    return 1;
  }
  uint64_t result = 0;
  unint64_t v3 = a1 - 181;
  if (v3 <= 0x3D && ((1 << v3) & 0x2D0C000000008C29) != 0) {
    return 1;
  }
  return result;
}

BOOL sub_1B4F46ED0(uint64_t a1)
{
  return (unint64_t)(a1 - 100) < 0xC || a1 == 230;
}

void sub_1B4F47598(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v10 = objc_msgSend_valueForEntitlement_(*(void **)(*(void *)(a1 + 32) + 144), v3, *(void *)(a1 + 40), v4, v5);
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v6, v7, v8, v9);
  }
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 112), v6, (uint64_t)v11, *(void *)(a1 + 40), v9);
  if (!v10) {
}
  }

id sub_1B4F476C8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v7 = 0;
  uint64_t v8 = 0;
  void v17[3] = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 1:
      v17[0] = 0x1F0DAEA70;
      v17[1] = 0x1F0DAEC50;
      v17[2] = 0x1F0DAEC70;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v17, 3, a5);
      goto LABEL_7;
    case 2:
      v16[0] = 0x1F0DAEAB0;
      v16[1] = 0x1F0DAEA70;
      void v16[2] = 0x1F0DAEC50;
      v16[3] = 0x1F0DAEC70;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v16, 4, a5);
      goto LABEL_7;
    case 3:
      v15[0] = 0x1F0DAEAF0;
      v15[1] = 0x1F0DAEAB0;
      v15[2] = 0x1F0DAEA70;
      v15[3] = 0x1F0DAEC50;
      v15[4] = 0x1F0DAEC70;
      uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v10 = v15;
      goto LABEL_6;
    case 4:
      v14[0] = 0x1F0DAEB30;
      v14[1] = 0x1F0DAEAB0;
      v14[2] = 0x1F0DAEA70;
      v14[3] = 0x1F0DAEC50;
      v14[4] = 0x1F0DAEC70;
      uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v10 = v14;
LABEL_6:
      objc_msgSend_arrayWithObjects_count_(v9, a2, (uint64_t)v10, 5, a5);
      uint64_t v8 = LABEL_7:;
      char v7 = 1;
      break;
    case 5:
      v13[0] = 0x1F0DAEB30;
      v13[1] = 0x1F0DAEAB0;
      v13[2] = 0x1F0DAEA70;
      v13[3] = 0x1F0DAEC50;
      v13[4] = 0x1F0DAEC70;
      uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v13, 5, a5);
      char v7 = 0;
      break;
    case 7:
      uint64_t v12 = 0x1F0DAEC50;
      char v7 = 1;
      uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)&v12, 1, a5);
      break;
    default:
      break;
  }
  if (a2) {
    *a2 = v7;
  }
  return v8;
}

void sub_1B4F47E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F483C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
}

void sub_1B4F483F4(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained[21];
  int v7 = objc_msgSend_processIdentifier(WeakRetained[18], v3, v4, v5, v6);
  int v12 = objc_msgSend_effectiveUserIdentifier(WeakRetained[18], v8, v9, v10, v11);
  int v17 = objc_msgSend_effectiveGroupIdentifier(WeakRetained[18], v13, v14, v15, v16);
  uint64_t v18 = CWFGetOSLog();
  if (v18)
  {
    uint64_t v19 = CWFGetOSLog();
  }
  else
  {
    uint64_t v19 = MEMORY[0x1E4F14500];
    id v20 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = objc_msgSend_UUID(WeakRetained, v21, v22, v23, v24);
    uint64_t v30 = objc_msgSend_UUIDString(v25, v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_substringToIndex_(v30, v31, 5, v32, v33);
    int v52 = 138544386;
    id v53 = v2;
    __int16 v54 = 1024;
    int v55 = v7;
    __int16 v56 = 1024;
    int v57 = v12;
    __int16 v58 = 1024;
    int v59 = v17;
    __int16 v60 = 2114;
    uint64_t v61 = v34;
    int v51 = 40;
    uint64_t v50 = &v52;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend___didInvalidate(WeakRetained, v35, v36, v37, v38);
  uint64_t v43 = objc_msgSend_invalidationHandler(WeakRetained, v39, v40, v41, v42);

  if (v43)
  {
    objc_msgSend_invalidationHandler(WeakRetained, v44, v45, v46, v47);
    uint64_t v48 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v48[2](v48, v49);
  }
  objc_msgSend_setInvalidationHandler_(WeakRetained, v44, 0, v46, v47, v50, v51);
}

void sub_1B4F485F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  objc_msgSend_XPCListener_invalidatedXPCConnection_(v7, v8, *(void *)(a1 + 32), (uint64_t)WeakRetained, v9);

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(NSObject **)(v10 + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B4F329B0;
  v13[3] = &unk_1E60BB9F0;
  v13[4] = v10;
  id v14 = WeakRetained;
  id v12 = WeakRetained;
  dispatch_async(v11, v13);
}

void sub_1B4F486D0(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  int v7 = objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    id v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
  }
  objc_msgSend_setInvalidationHandler_(*(void **)(a1 + 32), v8, 0, v10, v11);
}

void sub_1B4F48834(uint64_t a1)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  switch(objc_msgSend_type(WeakRetained, v4, v5, v6, v7))
  {
    case 1:
    case 2:
    case 5:
    case 11:
    case 15:
    case 16:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 34:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 175:
    case 176:
    case 178:
    case 187:
    case 197:
    case 210:
    case 211:
    case 212:
    case 213:
    case 214:
    case 215:
    case 216:
    case 217:
    case 233:
    case 234:
    case 241:
      goto LABEL_2;
    case 3:
      id v12 = objc_msgSend_requestParameters(WeakRetained, v8, v9, v10, v11);
      int v17 = objc_msgSend_interfaceName(v12, v13, v14, v15, v16);

      uint64_t v22 = objc_msgSend_response(WeakRetained, v18, v19, v20, v21);

      if (v17)
      {
        if (!v22) {
          goto LABEL_96;
        }
        objc_msgSend_response(WeakRetained, v23, v24, v25, v26);
        uint64_t v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        __int16 v60 = @"Result";
        v61[0] = v17;
        uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v61, (uint64_t)&v60, 1);
        ((void (**)(void, void, void *))v27)[2](v27, 0, v29);
        goto LABEL_95;
      }
      if (!v22) {
        goto LABEL_96;
      }
      objc_msgSend_response(WeakRetained, v23, v24, v25, v26);
      uint64_t v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v32, *MEMORY[0x1E4F28798], 6, 0);
      goto LABEL_94;
    case 4:
      if (*(void *)(a1 + 56) || *(_DWORD *)(a1 + 72)) {
LABEL_2:
      }
        objc_msgSend___getApple80211_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      else {
        objc_msgSend___getPlatformCapabilities_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      }
      goto LABEL_4;
    case 7:
      objc_msgSend___getSSID_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 8:
      objc_msgSend___getSSIDForVendor_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 9:
      objc_msgSend___getBSSID_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 10:
      objc_msgSend___getBSSIDForVendor_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 12:
      objc_msgSend___getSecurity_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 13:
      objc_msgSend___getWEPSubtype_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 14:
      objc_msgSend___getWAPISubtype_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 17:
      objc_msgSend___setChannel_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 33:
      objc_msgSend___getMACAddress_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 37:
      objc_msgSend___getLinkDownStatus_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 55:
      objc_msgSend___getKnownNetworkMatchingNetworkProfile_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 56:
      objc_msgSend___getKnownNetworkMatchingScanResult_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 57:
      objc_msgSend___getCurrentScanResult_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 59:
      objc_msgSend___addKnownNetwork_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 64:
      objc_msgSend___performScan_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 181:
    case 184:
    case 186:
    case 192:
    case 196:
    case 231:
    case 232:
    case 239:
    case 240:
    case 242:
      objc_msgSend___updateEventRegistration_XPCManager_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 48), v11);
      goto LABEL_4;
    case 98:
      objc_msgSend___getEventIDs_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 99:
      objc_msgSend___getSystemEventIDs_XPCManager_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 48), v11);
      goto LABEL_4;
    case 112:
      objc_msgSend___getActivities_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 113:
      objc_msgSend___getSystemActivities_XPCManager_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 48), v11);
      goto LABEL_4;
    case 114:
      objc_msgSend___getIO80211ControllerInfo_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 115:
      objc_msgSend___getIO80211InterfaceInfo_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 116:
      objc_msgSend___getIPv4Addresses_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 117:
      objc_msgSend___getIPv4Router_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 118:
      objc_msgSend___getIPv6Addresses_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 119:
      objc_msgSend___getIPv6Router_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 120:
      objc_msgSend___getNetServiceID_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 121:
      objc_msgSend___getNetServiceName_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 122:
      objc_msgSend___getNetServiceEnabled_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 123:
      objc_msgSend___getDHCPLeaseStartTime_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 124:
      objc_msgSend___getDHCPLeaseExpirationTime_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 125:
      objc_msgSend___getDNSServerAddresses_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 126:
      objc_msgSend___getGlobalIPv4Addresses_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 127:
      objc_msgSend___getGlobalIPv4Router_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 128:
      objc_msgSend___getGlobalIPv4NetServiceID_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 129:
      objc_msgSend___getGlobalIPv4NetServiceName_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 130:
      objc_msgSend___getGlobalIPv4InterfaceName_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 131:
      objc_msgSend___getGlobalIPv6Addresses_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 132:
      objc_msgSend___getGlobalIPv6Router_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 133:
      objc_msgSend___getGlobalIPv6NetServiceID_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 134:
      objc_msgSend___getGlobalIPv6NetServiceName_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 135:
      objc_msgSend___getGlobalIPv6InterfaceName_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 136:
      objc_msgSend___getGlobalDNSServerAddresses_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 137:
      objc_msgSend___getNetworkReachability_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 138:
      objc_msgSend___getEAP8021XSupplicantState_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 139:
      objc_msgSend___getEAP8021XControlMode_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 140:
      objc_msgSend___getEAP8021XControlState_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 141:
      objc_msgSend___getEAP8021XClientStatus_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 142:
      objc_msgSend___getRoamStatus_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 143:
      objc_msgSend___getJoinStatus_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 144:
      objc_msgSend___getAutoJoinStatus_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 167:
      objc_msgSend___getLinkQualityMetric_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 173:
      objc_msgSend___getHardwareMACAddress_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 185:
      objc_msgSend___getWiFiUIStateFlags_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 203:
      objc_msgSend___getIPv4SubnetMasks_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 204:
      objc_msgSend___getIPv4ARPResolvedHardwareAddress_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 205:
      objc_msgSend___getIPv4ARPResolvedIPAddress_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 206:
      objc_msgSend___getDHCPServerID_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 207:
      objc_msgSend___getDHCPv6ServerID_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 208:
      objc_msgSend___getIPv4NetworkSignature_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 209:
      objc_msgSend___getIPv6NetworkSignature_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 220:
      objc_msgSend___startHostAPMode_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 221:
      objc_msgSend___stopHostAPMode_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    case 222:
      objc_msgSend___getPrivateMACAddress_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 223:
      objc_msgSend___getPrivateMACAddressMode_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 224:
      objc_msgSend___setPrivateMACAddressMode_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 225:
      objc_msgSend___getPrivateMACAddressModeSystemSetting_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 226:
      objc_msgSend___setPrivateMACAddressModeSystemSetting_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 227:
      objc_msgSend___setPrivateMACAddressUserJoinFailureUIState_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 228:
      objc_msgSend___getQuickProbeRequired_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 229:
      objc_msgSend___reportQuickProbeResult_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 235:
      objc_msgSend___setLQMConfig_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, v10, v11);
      goto LABEL_4;
    case 248:
      objc_msgSend___getKnownNetworkInfoForLocalNetworkPrompt_XPCConnection_(*(void **)(a1 + 32), v8, (uint64_t)WeakRetained, *(void *)(a1 + 40), v11);
      goto LABEL_4;
    default:
      uint64_t v30 = objc_msgSend_delegate(*(void **)(a1 + 32), v8, v9, v10, v11);
      int v17 = v30;
      if (v30)
      {
        objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v30, v31, *(void *)(a1 + 32), *(void *)(a1 + 40), (uint64_t)WeakRetained);
      }
      else
      {
        uint64_t v33 = CWFGetOSLog();
        if (v33)
        {
          uint64_t v34 = CWFGetOSLog();
        }
        else
        {
          uint64_t v34 = MEMORY[0x1E4F14500];
          id v35 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = objc_msgSend_type(WeakRetained, v36, v37, v38, v39);
          uint64_t v45 = sub_1B4F43CD0(v40, v41, v42, v43, v44);
          int v58 = 138543362;
          int v59 = v45;
          int v57 = 12;
          __int16 v56 = &v58;
          _os_log_send_and_compose_impl();
        }
        uint64_t v50 = objc_msgSend_response(WeakRetained, v46, v47, v48, v49);

        if (v50)
        {
          objc_msgSend_response(WeakRetained, v51, v52, v53, v54);
          uint64_t v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v55, *MEMORY[0x1E4F28798], 45, 0, v56, v57);
          uint64_t v29 = LABEL_94:;
          ((void (**)(void, void *, void))v27)[2](v27, v29, 0);
LABEL_95:
        }
      }
LABEL_96:

LABEL_4:
      return;
  }
}

void sub_1B4F48FC8(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_response(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_response(*(void **)(a1 + 32), v8, v9, v10, v11);
    id v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 60, 0);
    ((void (**)(void, void *, void))v12)[2](v12, v14, 0);
  }
}

void sub_1B4F4908C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  objc_msgSend_willChangeValueForKey_(WeakRetained, v8, @"isFinished", v9, v10);
  objc_msgSend_willChangeValueForKey_(WeakRetained, v11, @"isExecuting", v12, v13);
  objc_msgSend_setDidSendResponse_(WeakRetained, v14, 1, v15, v16);
  objc_msgSend_didChangeValueForKey_(WeakRetained, v17, @"isExecuting", v18, v19);
  objc_msgSend_didChangeValueForKey_(WeakRetained, v20, @"isFinished", v21, v22);
}

void sub_1B4F49160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B4F43674;
  v11[3] = &unk_1E60BBD98;
  v11[4] = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = *(id *)(a1 + 48);
  long long v19 = *(_OWORD *)(a1 + 80);
  id v15 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 72);
  id v16 = v6;
  id v17 = *(id *)(a1 + 64);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void sub_1B4F492A8(uint64_t a1)
{
  id v6 = (void *)MEMORY[0x1BA995D10]();
  if (!*(void *)(a1 + 32))
  {
    if ((objc_msgSend___allowAlreadyPendingRequest_(*(void **)(a1 + 40), v2, *(void *)(a1 + 48), v4, v5) & 1) == 0
      && objc_msgSend___hasPendingRequestWithType_(*(void **)(a1 + 40), v2, *(void *)(a1 + 64), v4, v5))
    {
      uint64_t v7 = *(NSObject **)(*(void *)(a1 + 40) + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B4F79B64;
      block[3] = &unk_1E60BBCF8;
      id v42 = *(id *)(a1 + 56);
      dispatch_async(v7, block);
      uint64_t v8 = v42;
LABEL_11:

      goto LABEL_12;
    }
    if (!*(void *)(a1 + 32)) {
      goto LABEL_7;
    }
  }
  id v9 = objc_msgSend_allKeys(*(void **)(*(void *)(a1 + 40) + 56), v2, v3, v4, v5);
  int v13 = objc_msgSend_containsObject_(v9, v10, *(void *)(a1 + 32), v11, v12);

  if (v13)
  {
LABEL_7:
    id v14 = *(void **)(a1 + 48);
    id v15 = *(void **)(*(void *)(a1 + 40) + 56);
    id v16 = objc_msgSend_UUID(v14, v2, v3, v4, v5);
    objc_msgSend_setObject_forKeyedSubscript_(v15, v17, (uint64_t)v14, (uint64_t)v16, v18);

    objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 40), v19, v20, v21, v22);
    uint64_t v27 = objc_msgSend_delegate(*(void **)(a1 + 40), v23, v24, v25, v26);
    uint64_t v8 = v27;
    uint64_t v28 = *(void *)(a1 + 40);
    if (v27)
    {
      uint64_t v29 = *(NSObject **)(v28 + 24);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1B4F4325C;
      v37[3] = &unk_1E60BBDE8;
      char v40 = *(unsigned char *)(a1 + 72);
      uint64_t v30 = (id *)v38;
      id v31 = v27;
      uint64_t v32 = *(void *)(a1 + 40);
      uint64_t v33 = *(void **)(a1 + 48);
      v38[0] = v31;
      v38[1] = v32;
      id v39 = v33;
      dispatch_async(v29, v37);
    }
    else
    {
      uint64_t v34 = *(NSObject **)(v28 + 32);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = sub_1B4F79BF4;
      v35[3] = &unk_1E60BB768;
      uint64_t v30 = &v36;
      id v36 = *(id *)(a1 + 48);
      dispatch_async(v34, v35);
    }

    goto LABEL_11;
  }
LABEL_12:
}

uint64_t sub_1B4F4AB3C(uint64_t a1, uint64_t a2, void *a3, char *a4)
{
  id v7 = a3;
  uint64_t v11 = v7;
  char v12 = a1 - 1;
  if ((unint64_t)(a1 - 1) > 6 || ((0x47u >> v12) & 1) == 0)
  {
    uint64_t v13 = 1;
    char v14 = 1;
    goto LABEL_4;
  }
  char v14 = (7u >> v12) & 1;
  uint64_t v13 = 1;
  if (a2 <= 172)
  {
    switch(a2)
    {
      case 9:
        if ((objc_msgSend_isEqualToString_(v7, v8, @"wifivelocityd", v9, v10) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v62, @"wifid", v63, v64) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v65, @"Preferences", v66, v67) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v68, @"Setup", v69, v70) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v71, @"NanoSettings", v72, v73) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v74, @"TVSettings", v75, v76) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v77, @"WiFiPickerExtension", v78, v79) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v80, @"aonsensed", v81, v82) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v83, @"locationd", v84, v85) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v86, @"WiFi", v87, v88) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v89, @"symptomsd", v90, v91) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v92, @"wifianalyze", v93, v94) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v95, @"inboxupdaterd", v96, v97) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v98, @"wifiutil", v99, v100) & 1) != 0)
        {
          goto LABEL_4;
        }
        char isEqualToString = objc_msgSend_isEqualToString_(v11, v101, @"BackgroundShortcutRunner", v102, v103);
        break;
      case 22:
        if ((objc_msgSend_isEqualToString_(v7, v8, @"wifivelocityd", v9, v10) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v108, @"wifid", v109, v110) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v111, @"Preferences", v112, v113) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v114, @"Setup", v115, v116) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v117, @"NanoSettings", v118, v119) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v120, @"TVSettings", v121, v122) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v123, @"WiFiPickerExtension", v124, v125) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v126, @"locationd", v127, v128) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v129, @"WiFi", v130, v131) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v132, @"symptomsd", v133, v134) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v135, @"wifianalyze", v136, v137) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v138, @"inboxupdaterd", v139, v140) & 1) != 0
          || (objc_msgSend_isEqualToString_(v11, v141, @"wifiutil", v142, v143) & 1) != 0)
        {
          goto LABEL_4;
        }
        char isEqualToString = objc_msgSend_isEqualToString_(v11, v144, @"nearbyd", v145, v146);
        break;
      case 33:
        goto LABEL_18;
      default:
        goto LABEL_4;
    }
    if ((isEqualToString & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v105, @"florence", v106, v107) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v147, @"nightingale", v148, v149) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v150, @"milod", v151, v152) & 1) != 0)
    {
      goto LABEL_4;
    }
    int v19 = objc_msgSend_isEqualToString_(v11, v153, @"coreautomationd", v154, v155);
    goto LABEL_13;
  }
  if ((unint64_t)(a2 - 222) < 6 || a2 == 173)
  {
LABEL_18:
    if ((objc_msgSend_isEqualToString_(v7, v8, @"wifivelocityd", v9, v10) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v20, @"wifid", v21, v22) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v23, @"Preferences", v24, v25) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v26, @"Setup", v27, v28) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v29, @"NanoSettings", v30, v31) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v32, @"TVSettings", v33, v34) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v35, @"WiFiPickerExtension", v36, v37) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v38, @"WiFi", v39, v40) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v41, @"wifianalyze", v42, v43) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v44, @"inboxupdaterd", v45, v46) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v47, @"wifiutil", v48, v49) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v50, @"BackgroundShortcutRunner", v51, v52) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v53, @"florence", v54, v55) & 1) != 0
      || (objc_msgSend_isEqualToString_(v11, v56, @"nightingale", v57, v58) & 1) != 0)
    {
      goto LABEL_4;
    }
    int v19 = objc_msgSend_isEqualToString_(v11, v59, @"milod", v60, v61);
    goto LABEL_13;
  }
  if (a2 != 218 || (objc_msgSend_isEqualToString_(v7, v8, @"profiled", v9, v10) & 1) != 0) {
    goto LABEL_4;
  }
  int v19 = objc_msgSend_isEqualToString_(v11, v16, @"wifiutil", v17, v18);
LABEL_13:
  if (!v19) {
    uint64_t v13 = 0;
  }
LABEL_4:
  if (a4) {
    *a4 = v14;
  }

  return v13;
}

uint64_t sub_1B4F4AFD0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v13 = a4;
  if ((unint64_t)(a1 - 1) < 3)
  {
    if ((a2 == 22 || a2 == 9)
      && ((objc_msgSend_isEqualToString_(v9, v10, @"florence", v11, v12) & 1) != 0
       || (objc_msgSend_isEqualToString_(v9, v14, @"nightingale", v15, v16) & 1) != 0
       || objc_msgSend_isEqualToString_(v9, v17, @"milod", v18, v19)))
    {
      id v20 = 0;
      uint64_t v21 = 1;
      goto LABEL_26;
    }
LABEL_25:
    uint64_t v21 = 0;
    id v20 = 0;
    goto LABEL_26;
  }
  if (a1 != 5) {
    goto LABEL_25;
  }
  if (a2 == 22 || a2 == 9)
  {
    uint64_t v28 = 0x1F0DAEC70;
    uint64_t v23 = &v28;
  }
  else
  {
    if (a2 != 7) {
      goto LABEL_25;
    }
    if (os_variant_has_internal_content()
      && (objc_msgSend_containsObject_(v13, v10, @"corewifi_api_force_non_internal=1", v22, v12) & 1) == 0)
    {
      uint64_t v24 = CWFGetOSLog();
      if (v24)
      {
        uint64_t v25 = CWFGetOSLog();
      }
      else
      {
        uint64_t v25 = MEMORY[0x1E4F14500];
        id v26 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        int v30 = 138543874;
        id v31 = v9;
        __int16 v32 = 2114;
        uint64_t v33 = @"com.apple.corewlan-xpc";
        __int16 v34 = 2114;
        id v35 = @"GET SSID";
        _os_log_send_and_compose_impl();
      }
      goto LABEL_25;
    }
    uint64_t v29 = 0x1F0DAEC70;
    uint64_t v23 = &v29;
  }
  v23[1] = 0x1F0DAEC90;
  v23[2] = 0x1F0DAEA70;
  v23[3] = 0x1F0DAEAB0;
  v23[4] = 0x1F0DAEAF0;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v23, 5, v12);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = 1;
  if (a5 && v20)
  {
    id v20 = v20;
    *a5 = v20;
  }
LABEL_26:

  return v21;
}

__CFString *sub_1B4F4B704(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = *off_1E60BB010[a1 - 1];
  }
  return v2;
}

id sub_1B4F4B75C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = (int)a2;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = sub_1B4F4BA0C(a1, a2, a3, a4, a5);
  if ((unint64_t)(a1 - 1) > 6)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v7, (uint64_t)*off_1E60BB048[a1 - 1], v8, v9);
    if (v11) {
      BOOL v12 = v5 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = v10;
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v28, (uint64_t)v32, 16);
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
            id v20 = (void *)MEMORY[0x1BA995D10](v15);
            uint64_t v25 = objc_msgSend_integerValue(v19, v21, v22, v23, v24, (void)v28);
            sub_1B4F4BB38(v25, v11);
            ++v18;
          }
          while (v16 != v18);
          uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v26, (uint64_t)&v28, (uint64_t)v32, 16);
          uint64_t v16 = v15;
        }
        while (v15);
      }
    }
  }

  return v11;
}

id sub_1B4F4B8E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((unint64_t)(a1 - 1) > 6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], a2, (uint64_t)*off_1E60BB080[a1 - 1], a4, a5, v5);
  }
  return v7;
}

void sub_1B4F4B9F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1B4F4BA0C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a1)
  {
    case 1:
      uint64_t v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, a4, a5);
      for (uint64_t i = 1; i != 249; ++i)
      {
        uint64_t v10 = objc_msgSend_numberWithInteger_(NSNumber, v5, i, v6, v7);
        objc_msgSend_addObject_(v8, v11, (uint64_t)v10, v12, v13);
      }
      uint64_t v15 = objc_msgSend_copy(v8, v5, v14, v6, v7);

      break;
    case 2:
      uint64_t v15 = objc_msgSend_arrayByAddingObjectsFromArray_(&unk_1F0DC8610, a2, (uint64_t)&unk_1F0DC8628, a4, a5);
      break;
    case 3:
      uint64_t v15 = &unk_1F0DC8628;
      break;
    case 4:
      uint64_t v15 = &unk_1F0DC8640;
      break;
    case 5:
      uint64_t v15 = &unk_1F0DC8658;
      break;
    case 6:
      uint64_t v15 = &unk_1F0DC8670;
      break;
    case 7:
      uint64_t v15 = &unk_1F0DC8688;
      break;
    default:
      uint64_t v15 = 0;
      break;
  }
  return v15;
}

void sub_1B4F4BB38(uint64_t a1, void *a2)
{
  id v152 = a2;
  if (a1 > 112)
  {
    if (a1 <= 232)
    {
      switch(a1)
      {
        case 113:
          uint64_t v36 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v37 = objc_opt_class();
          uint64_t v38 = objc_opt_class();
          uint64_t v10 = objc_msgSend_setWithObjects_(v36, v39, v37, v40, v41, v38, 0);
          uint64_t v11 = sel_querySystemActivitiesWithRequestParams_reply_;
          break;
        case 210:
          uint64_t v42 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v43 = objc_opt_class();
          uint64_t v44 = objc_opt_class();
          uint64_t v10 = objc_msgSend_setWithObjects_(v42, v45, v43, v46, v47, v44, 0);
          uint64_t v11 = sel_queryHardwareSupportedChannelsWithRequestParams_reply_;
          break;
        case 216:
          uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = objc_opt_class();
          uint64_t v10 = objc_msgSend_setWithObjects_(v18, v21, v19, v22, v23, v20, 0);
          uint64_t v11 = sel_queryBeaconCacheWithRequestParams_reply_;
          break;
        default:
          goto LABEL_39;
      }
    }
    else
    {
      switch(a1)
      {
        case 241:
          uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = objc_opt_class();
          uint64_t v10 = objc_msgSend_setWithObjects_(v12, v15, v13, v16, v17, v14, 0);
          uint64_t v11 = sel_queryBackgroundScanCacheWithRequestParams_reply_;
          break;
        case 242:
        case 243:
        case 244:
          goto LABEL_39;
        case 245:
          uint64_t v93 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v94 = objc_opt_class();
          uint64_t v98 = objc_msgSend_setWithObjects_(v93, v95, v94, v96, v97, 0);
          uint64_t v68 = sel_queryAutoJoinDenyListWithRequestParams_reply_;
          objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v152, v99, (uint64_t)v98, (uint64_t)sel_queryAutoJoinDenyListWithRequestParams_reply_, 0, 0);
          goto LABEL_32;
        case 246:
          uint64_t v100 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v101 = objc_opt_class();
          uint64_t v105 = objc_msgSend_setWithObjects_(v100, v102, v101, v103, v104, 0);
          uint64_t v68 = sel_setAutoJoinDenyListForNetwork_reason_requestParams_reply_;
          objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v152, v106, (uint64_t)v105, (uint64_t)sel_setAutoJoinDenyListForNetwork_reason_requestParams_reply_, 0, 0);
          goto LABEL_31;
        case 247:
          uint64_t v107 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v108 = objc_opt_class();
          uint64_t v105 = objc_msgSend_setWithObjects_(v107, v109, v108, v110, v111, 0);
          uint64_t v68 = sel_clearAutoJoinDenyListForNetwork_reason_requestParams_reply_;
          objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v152, v112, (uint64_t)v105, (uint64_t)sel_clearAutoJoinDenyListForNetwork_reason_requestParams_reply_, 0, 0);
LABEL_31:

          uint64_t v113 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v114 = objc_opt_class();
          uint64_t v98 = objc_msgSend_setWithObjects_(v113, v115, v114, v116, v117, 0);
          objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v152, v118, (uint64_t)v98, (uint64_t)v68, 2, 0);
LABEL_32:

          uint64_t v119 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v120 = objc_opt_class();
          uint64_t v124 = objc_msgSend_setWithObjects_(v119, v121, v120, v122, v123, 0);
          objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v152, v125, (uint64_t)v124, (uint64_t)v68, 0, 1);

          uint64_t v126 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v127 = objc_opt_class();
          uint64_t v128 = objc_opt_class();
          uint64_t v129 = objc_opt_class();
          uint64_t v130 = objc_opt_class();
          uint64_t v151 = objc_opt_class();
          objc_msgSend_setWithObjects_(v126, v131, v127, v132, v133, v128, v129, v130, v151, 0);
          uint64_t v10 = LABEL_33:;
          uint64_t v134 = v152;
          uint64_t v135 = (uint64_t)v10;
          uint64_t v11 = v68;
          goto LABEL_37;
        case 248:
          uint64_t v136 = (void *)MEMORY[0x1E4F1CA80];
          uint64_t v137 = objc_opt_class();
          uint64_t v138 = objc_opt_class();
          uint64_t v139 = objc_opt_class();
          uint64_t v140 = objc_opt_class();
          uint64_t v10 = objc_msgSend_setWithObjects_(v136, v141, v137, v142, v143, v138, v139, v140, 0);
          uint64_t v11 = sel_queryKnownNetworkInfoForLocalNetworkPromptWithOptions_requestParams_reply_;
          break;
        default:
          if (a1 != 233) {
            goto LABEL_39;
          }
          uint64_t v87 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v88 = objc_opt_class();
          uint64_t v89 = objc_opt_class();
          uint64_t v10 = objc_msgSend_setWithObjects_(v87, v90, v88, v91, v92, v89, 0);
          uint64_t v11 = sel_queryHostAPStationListWithRequestParams_reply_;
          break;
      }
    }
  }
  else if (a1 > 97)
  {
    switch(a1)
    {
      case 'b':
        uint64_t v75 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v76 = objc_opt_class();
        uint64_t v77 = objc_opt_class();
        uint64_t v10 = objc_msgSend_setWithObjects_(v75, v78, v76, v79, v80, v77, 0);
        uint64_t v11 = sel_queryEventIDsWithRequestParams_reply_;
        break;
      case 'c':
        uint64_t v81 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v82 = objc_opt_class();
        uint64_t v83 = objc_opt_class();
        uint64_t v10 = objc_msgSend_setWithObjects_(v81, v84, v82, v85, v86, v83, 0);
        uint64_t v11 = sel_querySystemEventIDsWithRequestParams_reply_;
        break;
      case 'p':
        uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v25 = objc_opt_class();
        uint64_t v26 = objc_opt_class();
        uint64_t v10 = objc_msgSend_setWithObjects_(v24, v27, v25, v28, v29, v26, 0);
        uint64_t v11 = sel_queryActivitiesWithRequestParams_reply_;
        break;
      default:
        goto LABEL_39;
    }
  }
  else
  {
    switch(a1)
    {
      case '@':
        uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v4 = objc_opt_class();
        uint64_t v5 = objc_opt_class();
        uint64_t v10 = objc_msgSend_setWithObjects_(v3, v6, v4, v7, v8, v5, 0);
        uint64_t v11 = sel_performScanWithParameters_requestParams_reply_;
        break;
      case 'A':
        uint64_t v48 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v49 = objc_opt_class();
        uint64_t v50 = objc_opt_class();
        uint64_t v10 = objc_msgSend_setWithObjects_(v48, v51, v49, v52, v53, v50, 0);
        uint64_t v11 = sel_performANQPWithParameters_requestParams_reply_;
        break;
      case 'B':
      case 'C':
        goto LABEL_39;
      case 'D':
        uint64_t v54 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v55 = objc_opt_class();
        uint64_t v56 = objc_opt_class();
        uint64_t v10 = objc_msgSend_setWithObjects_(v54, v57, v55, v58, v59, v56, 0);
        objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v152, v60, (uint64_t)v10, (uint64_t)sel_setRangeable_peerList_requestParams_reply_, 1, 0);
        goto LABEL_38;
      case 'E':
        uint64_t v61 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v62 = objc_opt_class();
        uint64_t v63 = objc_opt_class();
        uint64_t v67 = objc_msgSend_setWithObjects_(v61, v64, v62, v65, v66, v63, 0);
        uint64_t v68 = sel_performRangingWithPeerList_timeout_requestParams_reply_;
        objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v152, v69, (uint64_t)v67, (uint64_t)sel_performRangingWithPeerList_timeout_requestParams_reply_, 0, 0);

        uint64_t v70 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v71 = objc_opt_class();
        uint64_t v150 = objc_opt_class();
        objc_msgSend_setWithObjects_(v70, v72, v71, v73, v74, v150, 0);
        goto LABEL_33;
      default:
        if (a1 == 15)
        {
          uint64_t v144 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v145 = objc_opt_class();
          uint64_t v146 = objc_opt_class();
          uint64_t v10 = objc_msgSend_setWithObjects_(v144, v147, v145, v148, v149, v146, 0);
          uint64_t v11 = sel_querySupportedChannelsWithCountryCode_requestParams_reply_;
        }
        else
        {
          if (a1 != 54) {
            goto LABEL_39;
          }
          long long v30 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v31 = objc_opt_class();
          uint64_t v32 = objc_opt_class();
          uint64_t v10 = objc_msgSend_setWithObjects_(v30, v33, v31, v34, v35, v32, 0);
          uint64_t v11 = sel_queryKnownNetworkProfilesWithProperties_requestParams_reply_;
        }
        break;
    }
  }
  uint64_t v134 = v152;
  uint64_t v135 = (uint64_t)v10;
LABEL_37:
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v134, v9, v135, (uint64_t)v11, 1, 1);
LABEL_38:

LABEL_39:
}

void sub_1B4F4C808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1B4F4DCE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

BOOL sub_1B4F4DD20(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

BOOL sub_1B4F4DD5C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

uint64_t sub_1B4F4DD98(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_objectForKeyedSubscript_(a1, a2, @"ANQP_PARSED", a4, a5);
}

id sub_1B4F4E090(uint64_t a1, const char *a2, unsigned char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = 0;
  v23[1] = *MEMORY[0x1E4F143B8];
  char v11 = 0;
  switch(a1)
  {
    case 1:
    case 7:
      uint64_t v7 = 0;
      if ((uint64_t)a2 <= 32)
      {
        if (a2 == (const char *)9)
        {
          uint64_t v21 = 0x1F0DAEBF0;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], (const char *)9, (uint64_t)&v21, 1, a5);
          goto LABEL_27;
        }
        if (a2 == (const char *)22)
        {
          v23[0] = 0x1F0DAEBD0;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], (const char *)0x16, (uint64_t)v23, 1, a5);
          goto LABEL_27;
        }
        if (a2 == (const char *)23)
        {
          uint64_t v22 = 0x1F0DAEC10;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], (const char *)0x17, (uint64_t)&v22, 1, a5);
          goto LABEL_36;
        }
      }
      else
      {
        char v8 = (_BYTE)a2 + 83;
        if ((unint64_t)(a2 - 173) <= 0x36)
        {
          if (((1 << v8) & 0x7E000000000001) != 0)
          {
LABEL_5:
            uint64_t v18 = @"com.apple.private.corewifi.mac-addr";
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)&v18, 1, a5);
            uint64_t v7 = LABEL_27:;
            char v11 = 0;
            goto LABEL_37;
          }
          if (((1 << v8) & 0x30000000) != 0)
          {
            uint64_t v20 = 0x1F0DAEC30;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)&v20, 1, a5);
            goto LABEL_27;
          }
          if (a2 == (const char *)218)
          {
            uint64_t v19 = 0x1F0DAECB0;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], (const char *)0xDA, (uint64_t)&v19, 1, a5);
            goto LABEL_36;
          }
        }
        if (a2 == (const char *)33) {
          goto LABEL_5;
        }
      }
      goto LABEL_37;
    case 2:
    case 3:
      uint64_t v7 = 0;
      if ((uint64_t)a2 <= 32)
      {
        if (a2 == (const char *)9)
        {
          uint64_t v16 = 0x1F0DAEBF0;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], (const char *)9, (uint64_t)&v16, 1, a5);
        }
        else if (a2 == (const char *)22)
        {
          uint64_t v17 = 0x1F0DAEBD0;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], (const char *)0x16, (uint64_t)&v17, 1, a5);
        }
        else
        {
          if (a2 != (const char *)23) {
            goto LABEL_37;
          }
          uint64_t v15 = 0x1F0DAEC10;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], (const char *)0x17, (uint64_t)&v15, 1, a5);
        }
        goto LABEL_36;
      }
      char v9 = (_BYTE)a2 + 83;
      if ((unint64_t)(a2 - 173) > 0x36) {
        goto LABEL_42;
      }
      if (((1 << v9) & 0x7E000000000001) != 0) {
        goto LABEL_9;
      }
      if (((1 << v9) & 0x30000000) != 0)
      {
        uint64_t v14 = 0x1F0DAEC30;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)&v14, 1, a5);
        goto LABEL_36;
      }
      if (a2 == (const char *)218)
      {
        uint64_t v13 = 0x1F0DAECB0;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], (const char *)0xDA, (uint64_t)&v13, 1, a5);
        goto LABEL_36;
      }
LABEL_42:
      if (a2 == (const char *)33)
      {
LABEL_9:
        uint64_t v12 = @"com.apple.private.corewifi.mac-addr";
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)&v12, 1, a5);
        uint64_t v7 = LABEL_36:;
        char v11 = 1;
      }
LABEL_37:
      if (a3) {
        *a3 = v11;
      }
      return v7;
    case 5:
      if (((unint64_t)a2 & 0xFFFFFFFFFFFFFFFELL) == 0xE4)
      {
        uint64_t v7 = sub_1B4F476C8(2, &v11, (uint64_t)a3, a4, a5);
      }
      else
      {
        uint64_t v7 = 0;
      }
      goto LABEL_37;
    default:
      goto LABEL_37;
  }
}

void sub_1B4F4E6F0(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void **)(a1 + 40);
        uint64_t v14 = objc_msgSend_registeredActivities(*(void **)(*((void *)&v18 + 1) + 8 * v12), v6, v7, v8, v9, (void)v18);
        objc_msgSend_addObjectsFromArray_(v13, v15, (uint64_t)v14, v16, v17);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v10);
  }
}

void sub_1B4F4E820(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4, v5, v6);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v10)
  {
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v8);
        }
        long long v18 = objc_msgSend_registeredActivities(*(void **)(*((void *)&v29 + 1) + 8 * v17), v11, v12, v13, v14, (void)v29);
        objc_msgSend_addObjectsFromArray_(v7, v19, (uint64_t)v18, v20, v21);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v15);
  }

  uint64_t v26 = objc_msgSend_copy(v7, v22, v23, v24, v25);
  uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;
}

void sub_1B4F4EA70(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 64), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B4F4EC20(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 40), v3, *(void *)(a1 + 40), v4, v5);
  uint64_t v10 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, *(unsigned int *)(a1 + 56), v8, v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend_containsObject_(v6, v11, (uint64_t)v10, v12, v13);
}

void sub_1B4F4EEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

BOOL sub_1B4F4EF10(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"RSN_IE", a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

id CWFFilteredScanResults(void *a1, void *a2)
{
  uint64_t v477 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v9 = objc_msgSend_minimumRSSI(v4, v5, v6, v7, v8);
  unint64_t v455 = objc_msgSend_maximumAge(v4, v10, v11, v12, v13);
  unint64_t v18 = objc_msgSend_minimumTimestamp(v4, v14, v15, v16, v17);
  char v446 = objc_msgSend_includeHiddenNetworks(v4, v19, v20, v21, v22);
  int v445 = objc_msgSend_BSSType(v4, v23, v24, v25, v26);
  uint64_t v31 = objc_msgSend_includeScanResults(v4, v27, v28, v29, v30);
  v447 = objc_msgSend_includeProperties(v4, v32, v33, v34, v35);
  int v454 = objc_msgSend_mergeScanResults(v4, v36, v37, v38, v39);
  int v459 = objc_msgSend_includeBackgroundScanCacheResults(v4, v40, v41, v42, v43);
  uint64_t v48 = objc_msgSend_channels(v4, v44, v45, v46, v47);

  v452 = (void *)v31;
  uint64_t v453 = v9;
  unint64_t v450 = v18;
  if (v48)
  {
    objc_msgSend_channels(v4, v49, v50, v51, v52);
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      uint64_t v58 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v53, v54, v55, v56);
      long long v464 = 0u;
      long long v465 = 0u;
      long long v466 = 0u;
      long long v467 = 0u;
      id v59 = v57;
      uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v464, (uint64_t)&v469, 16);
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v465;
        do
        {
          for (uint64_t i = 0; i != v62; ++i)
          {
            if (*(void *)v465 != v63) {
              objc_enumerationMutation(v59);
            }
            uint64_t v65 = sub_1B4F5B02C(*(void **)(*((void *)&v464 + 1) + 8 * i));
            objc_msgSend_addObject_(v58, v66, (uint64_t)v65, v67, v68);
          }
          uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v69, (uint64_t)&v464, (uint64_t)&v469, 16);
        }
        while (v62);
      }

      uint64_t v9 = v453;
      unint64_t v18 = v450;
    }
    else
    {
      uint64_t v58 = 0;
    }
    uint64_t v451 = objc_msgSend_copy(v58, v53, v54, v55, v56);
  }
  else
  {
    uint64_t v451 = 0;
  }
  if (!v3)
  {
    uint64_t v70 = 0;
    goto LABEL_216;
  }
  uint64_t v70 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v49, v50, v51, v52);
  if (!objc_msgSend_count(v3, v71, v72, v73, v74)) {
    goto LABEL_216;
  }
  uint64_t v75 = 0;
  if (v455) {
    BOOL v76 = v18 == 0;
  }
  else {
    BOOL v76 = 0;
  }
  int v77 = v76;
  int v458 = v77;
  int v78 = v454;
  id v443 = v3;
  id v444 = v4;
  int v456 = v70;
  do
  {
    context = (void *)MEMORY[0x1BA995D10]();
    uint64_t v86 = objc_msgSend_objectAtIndexedSubscript_(v3, v79, v75, v80, v81);
    uint64_t v461 = v75;
    if (v459)
    {
      uint64_t v87 = objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], v82, (uint64_t)&unk_1F0DC6C18, v84, v85, &unk_1F0DC6C30, &unk_1F0DC6C48, &unk_1F0DC6C60, &unk_1F0DC6C78, &unk_1F0DC6C90, 0);
      uint64_t v91 = objc_msgSend_filteredScanResultWithProperties_(v86, v88, (uint64_t)v87, v89, v90);

      uint64_t v86 = (void *)v91;
    }
    if (v458)
    {
      if (objc_msgSend_age(v86, v82, v83, v84, v85) > v455)
      {
        uint64_t v92 = CWFGetOSLog();
        if (v92)
        {
          uint64_t v93 = CWFGetOSLog();
        }
        else
        {
          uint64_t v93 = MEMORY[0x1E4F14500];
          id v248 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
          goto LABEL_176;
        }
        int v469 = 138543362;
        v470 = (const char *)v86;
        LODWORD(v442) = 12;
        v441 = &v469;
LABEL_175:
        _os_log_send_and_compose_impl();
LABEL_176:

        goto LABEL_177;
      }
    }
    else if (v18 && objc_msgSend_timestamp(v86, v82, v83, v84, v85) < v18)
    {
      uint64_t v94 = CWFGetOSLog();
      if (v94)
      {
        uint64_t v93 = CWFGetOSLog();
      }
      else
      {
        uint64_t v93 = MEMORY[0x1E4F14500];
        id v296 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
        goto LABEL_176;
      }
      int v469 = 138543362;
      v470 = (const char *)v86;
      LODWORD(v442) = 12;
      v441 = &v469;
      goto LABEL_175;
    }
    if (v9 < 0 && objc_msgSend_RSSI(v86, v82, v83, v84, v85) < v9)
    {
      uint64_t v95 = CWFGetOSLog();
      if (v95)
      {
        uint64_t v93 = CWFGetOSLog();
      }
      else
      {
        uint64_t v93 = MEMORY[0x1E4F14500];
        id v299 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
        goto LABEL_176;
      }
      int v469 = 138543362;
      v470 = (const char *)v86;
      LODWORD(v442) = 12;
      v441 = &v469;
      goto LABEL_175;
    }
    v463 = v86;
    uint64_t v96 = objc_msgSend_channels(v4, v82, v83, v84, v85, v441, v442);

    if (!v96) {
      goto LABEL_44;
    }
    uint64_t v101 = objc_msgSend_channel(v86, v97, v98, v99, v100);
    if (!objc_msgSend_is6GHz(v101, v102, v103, v104, v105))
    {

LABEL_42:
      if ((objc_msgSend_scanFlags(v4, v97, v98, v99, v100) & 8) == 0)
      {
        uint64_t v111 = objc_msgSend_channel(v86, v97, v98, v99, v100);
        uint64_t v112 = sub_1B4F5B02C(v111);
        char v116 = objc_msgSend_containsObject_(v451, v113, (uint64_t)v112, v114, v115);

        if ((v116 & 1) == 0)
        {
          v297 = CWFGetOSLog();
          if (v297)
          {
            uint64_t v93 = CWFGetOSLog();
          }
          else
          {
            uint64_t v93 = MEMORY[0x1E4F14500];
            id v330 = MEMORY[0x1E4F14500];
          }
          uint64_t v86 = v463;

          if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
            goto LABEL_176;
          }
          int v469 = 138543362;
          v470 = (const char *)v463;
          LODWORD(v442) = 12;
          v441 = &v469;
          goto LABEL_175;
        }
      }
      goto LABEL_44;
    }
    __int16 v110 = objc_msgSend_scanFlags(v4, v106, v107, v108, v109);

    if ((v110 & 0x100) == 0) {
      goto LABEL_42;
    }
LABEL_44:
    uint64_t v86 = v463;
    if ((objc_msgSend_scanFlags(v4, v97, v98, v99, v100) & 0x200) == 0
      && objc_msgSend_isFILSDiscoveryFrame(v463, v117, v118, v119, v120))
    {
      uint64_t v121 = CWFGetOSLog();
      if (v121)
      {
        uint64_t v93 = CWFGetOSLog();
      }
      else
      {
        uint64_t v93 = MEMORY[0x1E4F14500];
        id v300 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
        goto LABEL_176;
      }
      int v469 = 138543362;
      v470 = (const char *)v463;
      LODWORD(v442) = 12;
      v441 = &v469;
      goto LABEL_175;
    }
    if ((v459 & 1) == 0)
    {
      if (objc_msgSend_isBackgroundScanResult(v463, v117, v118, v119, v120))
      {
        uint64_t v247 = CWFGetOSLog();
        if (v247)
        {
          uint64_t v93 = CWFGetOSLog();
        }
        else
        {
          uint64_t v93 = MEMORY[0x1E4F14500];
          id v329 = MEMORY[0x1E4F14500];
        }
        uint64_t v70 = v456;

        if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
          goto LABEL_176;
        }
        int v469 = 138543362;
        v470 = (const char *)v463;
        LODWORD(v442) = 12;
        v441 = &v469;
        goto LABEL_175;
      }
      if ((v446 & 1) == 0)
      {
        uint64_t v249 = objc_msgSend_SSID(v463, v243, v244, v245, v246);
        uint64_t v254 = objc_msgSend_length(v249, v250, v251, v252, v253);

        if (!v254)
        {
          v332 = CWFGetOSLog();
          uint64_t v70 = v456;
          if (v332)
          {
            uint64_t v93 = CWFGetOSLog();
          }
          else
          {
            uint64_t v93 = MEMORY[0x1E4F14500];
            id v342 = MEMORY[0x1E4F14500];
          }

          if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
            goto LABEL_176;
          }
          int v469 = 138543362;
          v470 = (const char *)v463;
          LODWORD(v442) = 12;
          v441 = &v469;
          goto LABEL_175;
        }
      }
      uint64_t v255 = objc_msgSend_SSID(v4, v243, v244, v245, v246);
      uint64_t v70 = v456;
      if (v255)
      {
        v260 = (void *)v255;
        uint64_t v261 = objc_msgSend_SSID(v4, v256, v257, v258, v259);
        uint64_t v266 = objc_msgSend_networkName(v463, v262, v263, v264, v265);
        if (v261 == (void *)v266)
        {

          uint64_t v86 = v463;
        }
        else
        {
          uint64_t v271 = (void *)v266;
          v276 = objc_msgSend_SSID(v4, v267, v268, v269, v270);
          if (v276)
          {
            v281 = objc_msgSend_networkName(v463, v272, v273, v274, v275);
            if (v281)
            {
              uint64_t v282 = objc_msgSend_SSID(v4, v277, v278, v279, v280);
              v287 = objc_msgSend_networkName(v463, v283, v284, v285, v286);
              BOOL v295 = (objc_msgSend_isEqual_(v282, v288, (uint64_t)v287, v289, v290) & 1) == 0
                  && (objc_msgSend_scanFlags(v4, v291, v292, v293, v294) & 0x800) == 0;

              uint64_t v9 = v453;
            }
            else
            {
              BOOL v295 = (objc_msgSend_scanFlags(v4, v277, v278, v279, v280) & 0x800) == 0;
            }

            int v78 = v454;
          }
          else
          {
            BOOL v295 = (objc_msgSend_scanFlags(v4, v272, v273, v274, v275) & 0x800) == 0;
          }

          uint64_t v70 = v456;
          uint64_t v86 = v463;
          if (v295)
          {
            uint64_t v348 = CWFGetOSLog();
            if (v348)
            {
              uint64_t v93 = CWFGetOSLog();
            }
            else
            {
              uint64_t v93 = MEMORY[0x1E4F14500];
              id v374 = MEMORY[0x1E4F14500];
            }
            unint64_t v18 = v450;

            if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
              goto LABEL_176;
            }
            int v469 = 138543362;
            v470 = (const char *)v463;
            LODWORD(v442) = 12;
            v441 = &v469;
            goto LABEL_175;
          }
        }
      }
      if (objc_msgSend_shortSSID(v4, v256, v257, v258, v259))
      {
        uint64_t v353 = objc_msgSend_shortSSID(v4, v349, v350, v351, v352);
        if (v353 != objc_msgSend_shortSSID(v86, v354, v355, v356, v357)
          && (objc_msgSend_scanFlags(v4, v349, v350, v351, v352) & 0x800) == 0)
        {
          v358 = CWFGetOSLog();
          unint64_t v18 = v450;
          if (v358)
          {
            uint64_t v93 = CWFGetOSLog();
          }
          else
          {
            uint64_t v93 = MEMORY[0x1E4F14500];
            id v397 = MEMORY[0x1E4F14500];
          }

          if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
            goto LABEL_176;
          }
          int v469 = 138543362;
          v470 = (const char *)v86;
          LODWORD(v442) = 12;
          v441 = &v469;
          goto LABEL_175;
        }
      }
      unint64_t v18 = v450;
      if (v445 == 2)
      {
        if ((objc_msgSend_isESS(v86, v349, v350, v351, v352) & 1) == 0) {
          goto LABEL_152;
        }
      }
      else if (v445 == 1 && (objc_msgSend_isIBSS(v86, v349, v350, v351, v352) & 1) == 0)
      {
LABEL_152:
        uint64_t v359 = CWFGetOSLog();
        if (v359)
        {
          uint64_t v93 = CWFGetOSLog();
        }
        else
        {
          uint64_t v93 = MEMORY[0x1E4F14500];
          id v373 = MEMORY[0x1E4F14500];
        }
        uint64_t v70 = v456;

        if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
          goto LABEL_176;
        }
        int v469 = 138543362;
        v470 = (const char *)v86;
        LODWORD(v442) = 12;
        v441 = &v469;
        goto LABEL_175;
      }
      uint64_t v360 = objc_msgSend_matchNetworkNamePrefix(v4, v349, v350, v351, v352);
      if (v360)
      {
        v361 = (void *)v360;
        v362 = objc_msgSend_networkName(v86, v117, v118, v119, v120);
        uint64_t v367 = objc_msgSend_matchNetworkNamePrefix(v4, v363, v364, v365, v366);
        char hasPrefix = objc_msgSend_hasPrefix_(v362, v368, (uint64_t)v367, v369, v370);

        uint64_t v86 = v463;
        if ((hasPrefix & 1) == 0)
        {
          uint64_t v372 = CWFGetOSLog();
          if (v372)
          {
            uint64_t v93 = CWFGetOSLog();
          }
          else
          {
            uint64_t v93 = MEMORY[0x1E4F14500];
            id v396 = MEMORY[0x1E4F14500];
          }
          uint64_t v70 = v456;

          if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
            goto LABEL_176;
          }
          int v469 = 138543362;
          v470 = (const char *)v463;
          LODWORD(v442) = 12;
          v441 = &v469;
          goto LABEL_175;
        }
      }
    }
    if (v452 && (objc_msgSend_containsObject_(v452, v117, (uint64_t)v86, v119, v120) & 1) == 0)
    {
      uint64_t v298 = CWFGetOSLog();
      uint64_t v70 = v456;
      if (v298)
      {
        uint64_t v93 = CWFGetOSLog();
      }
      else
      {
        uint64_t v93 = MEMORY[0x1E4F14500];
        id v331 = MEMORY[0x1E4F14500];
      }

      if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
        goto LABEL_176;
      }
      int v469 = 138543362;
      v470 = (const char *)v86;
      LODWORD(v442) = 12;
      v441 = &v469;
      goto LABEL_175;
    }
    uint64_t v122 = objc_msgSend_filterPredicate(v4, v117, v118, v119, v120);
    uint64_t v70 = v456;
    if (v122)
    {
      uint64_t v127 = (void *)v122;
      uint64_t v128 = objc_msgSend_filterPredicate(v4, v123, v124, v125, v126);
      char v132 = objc_msgSend_evaluateWithObject_(v128, v129, (uint64_t)v463, v130, v131);

      if ((v132 & 1) == 0)
      {
        v301 = CWFGetOSLog();
        if (v301)
        {
          uint64_t v93 = CWFGetOSLog();
        }
        else
        {
          uint64_t v93 = MEMORY[0x1E4F14500];
          id v333 = MEMORY[0x1E4F14500];
        }
        uint64_t v86 = v463;

        if (!os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
          goto LABEL_176;
        }
        int v469 = 138543362;
        v470 = (const char *)v463;
        LODWORD(v442) = 12;
        v441 = &v469;
        goto LABEL_175;
      }
    }
    if (!objc_msgSend_count(v456, v123, v124, v125, v126))
    {
      uint64_t v86 = v463;
LABEL_108:
      if (objc_msgSend_isPasspoint(v86, v133, v134, v135, v136, v441, v442)
        && objc_msgSend_maximumANQPAgeForPasspointScanResults(v4, v302, v303, v304, v305))
      {
        v306 = objc_alloc_init(CWFANQPParameters);
        uint64_t v311 = objc_msgSend_maximumANQPAgeForPasspointScanResults(v4, v307, v308, v309, v310);
        objc_msgSend_setMaximumAge_(v306, v312, v311, v313, v314);
        v468 = v86;
        uint64_t v317 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v315, (uint64_t)&v468, 1, v316);
        CWFFilteredANQPResults(v317, v306);
        unint64_t v318 = v18;
        uint64_t v320 = v319 = v86;
        uint64_t v325 = objc_msgSend_firstObject(v320, v321, v322, v323, v324);

        unint64_t v18 = v318;
        uint64_t v86 = (void *)v325;
        uint64_t v70 = v456;
      }
      uint64_t v93 = objc_msgSend_filteredScanResultWithProperties_(v86, v302, (uint64_t)v447, v304, v305);
      objc_msgSend_addObject_(v70, v326, (uint64_t)v93, v327, v328);
      goto LABEL_176;
    }
    uint64_t v137 = 0;
    uint64_t v86 = v463;
    while (1)
    {
      uint64_t v138 = (void *)MEMORY[0x1BA995D10]();
      uint64_t v142 = objc_msgSend_objectAtIndexedSubscript_(v70, v139, v137, v140, v141);
      uint64_t v147 = objc_msgSend_BSSID(v86, v143, v144, v145, v146);
      if (!v147) {
        goto LABEL_62;
      }
      id v152 = (void *)v147;
      uint64_t v153 = objc_msgSend_BSSID(v142, v148, v149, v150, v151);
      if (!v153) {
        goto LABEL_67;
      }
      uint64_t v158 = (void *)v153;
      int v457 = v138;
      __int16 v159 = objc_msgSend_BSSID(v86, v154, v155, v156, v157);
      uint64_t v462 = v142;
      uint64_t v164 = objc_msgSend_BSSID(v142, v160, v161, v162, v163);
      if (!objc_msgSend_isEqual_(v159, v165, (uint64_t)v164, v166, v167)) {
        goto LABEL_66;
      }
      uint64_t v86 = v463;
      v172 = objc_msgSend_SSID(v463, v168, v169, v170, v171);
      uint64_t v177 = objc_msgSend_SSID(v142, v173, v174, v175, v176);
      if (v172 == (void *)v177) {
        break;
      }
      long long v182 = (void *)v177;
      uint64_t v187 = objc_msgSend_SSID(v463, v178, v179, v180, v181);
      if (!v187) {
        goto LABEL_65;
      }
      uint64_t v188 = objc_msgSend_SSID(v462, v183, v184, v185, v186);
      if (!v188)
      {
        uint64_t v9 = v453;
LABEL_65:

        int v78 = v454;
        uint64_t v70 = v456;
LABEL_66:

        uint64_t v142 = v462;
        uint64_t v86 = v463;
        uint64_t v138 = v457;
LABEL_67:

        if (!v78) {
          goto LABEL_76;
        }
        goto LABEL_68;
      }
      v448 = (void *)v188;
      uint64_t v193 = objc_msgSend_SSID(v463, v189, v190, v191, v192);
      uint64_t v198 = objc_msgSend_SSID(v462, v194, v195, v196, v197);
      char isEqual = objc_msgSend_isEqual_(v193, v199, (uint64_t)v198, v200, v201);

      uint64_t v86 = v463;
      uint64_t v9 = v453;
      int v78 = v454;
      uint64_t v70 = v456;
      uint64_t v138 = v457;
      uint64_t v142 = v462;
      if (isEqual) {
        goto LABEL_129;
      }
LABEL_62:
      if (!v78) {
        goto LABEL_76;
      }
LABEL_68:
      uint64_t v202 = objc_msgSend_SSID(v86, v148, v149, v150, v151);
      if (v202)
      {
        uint64_t v207 = (void *)v202;
        uint64_t v462 = v142;
        uint64_t v208 = objc_msgSend_SSID(v142, v203, v204, v205, v206);
        if (!v208) {
          goto LABEL_75;
        }
        v213 = (void *)v208;
        objc_msgSend_SSID(v86, v209, v210, v211, v212);
        v215 = uint64_t v214 = v86;
        uint64_t v220 = objc_msgSend_SSID(v142, v216, v217, v218, v219);
        if (!objc_msgSend_isEqual_(v215, v221, (uint64_t)v220, v222, v223))
        {

          uint64_t v70 = v456;
          uint64_t v86 = v214;
LABEL_75:

          goto LABEL_76;
        }
        uint64_t v228 = v138;
        int v229 = objc_msgSend_APMode(v214, v224, v225, v226, v227);
        int v234 = objc_msgSend_APMode(v142, v230, v231, v232, v233);

        BOOL v76 = v229 == v234;
        uint64_t v138 = v228;
        int v78 = v454;
        uint64_t v9 = v453;
        uint64_t v70 = v456;
        uint64_t v86 = v214;
        if (v76)
        {
          uint64_t v375 = objc_msgSend_channel(v214, v235, v236, v237, v238);
          char v380 = objc_msgSend_is6GHz(v375, v376, v377, v378, v379);
          if (v380)
          {
            uint64_t v385 = objc_msgSend_channel(v142, v381, v382, v383, v384);
            char v390 = objc_msgSend_is6GHz(v385, v386, v387, v388, v389);

            if ((v390 & 1) == 0)
            {
              uint64_t v395 = CWFGetOSLog();
              if (v395)
              {
                uint64_t v347 = CWFGetOSLog();
              }
              else
              {
                uint64_t v347 = MEMORY[0x1E4F14500];
                id v437 = MEMORY[0x1E4F14500];
              }
              id v3 = v443;

              uint64_t v86 = v463;
              if (os_log_type_enabled(v347, OS_LOG_TYPE_INFO))
              {
                int v469 = 136446978;
                v470 = "CWFFilteredScanResults";
                __int16 v471 = 2082;
                v472 = "CWFUtilPrivate.m";
                __int16 v473 = 1024;
                int v474 = 1194;
                __int16 v475 = 2114;
                id v476 = v463;
                LODWORD(v442) = 38;
                v441 = &v469;
                _os_log_send_and_compose_impl();
              }
              v343 = v142;
              goto LABEL_211;
            }
          }
          else
          {
          }
          uint64_t v404 = objc_msgSend_channel(v463, v391, v392, v393, v394);
          if (objc_msgSend_is6GHz(v404, v405, v406, v407, v408))
          {

            goto LABEL_192;
          }
          uint64_t v417 = objc_msgSend_channel(v142, v409, v410, v411, v412);
          int v422 = objc_msgSend_is6GHz(v417, v418, v419, v420, v421);

          if (v422)
          {
            v423 = CWFGetOSLog();
            if (v423)
            {
              uint64_t v341 = CWFGetOSLog();
            }
            else
            {
              uint64_t v341 = MEMORY[0x1E4F14500];
              id v438 = MEMORY[0x1E4F14500];
            }

            uint64_t v339 = (uint64_t)v463;
            if (os_log_type_enabled(v341, OS_LOG_TYPE_INFO))
            {
              int v469 = 136446978;
              v470 = "CWFFilteredScanResults";
              __int16 v471 = 2082;
              v472 = "CWFUtilPrivate.m";
              __int16 v473 = 1024;
              int v474 = 1201;
              __int16 v475 = 2114;
              id v476 = v142;
              LODWORD(v442) = 38;
              v441 = &v469;
LABEL_182:
              _os_log_send_and_compose_impl();
            }
LABEL_202:

            objc_msgSend_removeObjectAtIndex_(v70, v433, v137, v434, v435);
            uint64_t v86 = (void *)v339;
LABEL_77:
            id v3 = v443;
            id v4 = v444;
            unint64_t v18 = v450;
            goto LABEL_108;
          }
LABEL_192:
          uint64_t v424 = objc_msgSend_RSSI(v142, v413, v414, v415, v416);
          uint64_t v429 = objc_msgSend_RSSI(v463, v425, v426, v427, v428);
          uint64_t v430 = CWFGetOSLog();
          uint64_t v431 = (void *)v430;
          if (v424 < v429)
          {
            if (v430)
            {
              uint64_t v341 = CWFGetOSLog();
            }
            else
            {
              uint64_t v341 = MEMORY[0x1E4F14500];
              id v432 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v341, OS_LOG_TYPE_INFO))
            {
              int v469 = 136446978;
              v470 = "CWFFilteredScanResults";
              __int16 v471 = 2082;
              v472 = "CWFUtilPrivate.m";
              __int16 v473 = 1024;
              int v474 = 1216;
              __int16 v475 = 2114;
              id v476 = v142;
              LODWORD(v442) = 38;
              v441 = &v469;
              _os_log_send_and_compose_impl();
              uint64_t v339 = (uint64_t)v463;
              goto LABEL_202;
            }
            uint64_t v339 = (uint64_t)v463;
LABEL_201:
            uint64_t v142 = v462;
            goto LABEL_202;
          }
          if (v430)
          {
            uint64_t v347 = CWFGetOSLog();
          }
          else
          {
            uint64_t v347 = MEMORY[0x1E4F14500];
            id v436 = MEMORY[0x1E4F14500];
          }
          id v3 = v443;
          uint64_t v86 = v463;

          if (os_log_type_enabled(v347, OS_LOG_TYPE_INFO))
          {
            int v469 = 136446978;
            v470 = "CWFFilteredScanResults";
            __int16 v471 = 2082;
            v472 = "CWFUtilPrivate.m";
            __int16 v473 = 1024;
            int v474 = 1211;
            __int16 v475 = 2114;
            id v476 = v463;
            LODWORD(v442) = 38;
            v441 = &v469;
            _os_log_send_and_compose_impl();
          }
          v343 = v142;
          goto LABEL_211;
        }
      }
LABEL_76:

      if (++v137 >= (unint64_t)objc_msgSend_count(v70, v239, v240, v241, v242)) {
        goto LABEL_77;
      }
    }

    int v78 = v454;
    uint64_t v70 = v456;
    uint64_t v138 = v457;
LABEL_129:
    unint64_t v334 = objc_msgSend_timestamp(v86, v148, v149, v150, v151);
    if (v334 > objc_msgSend_timestamp(v142, v335, v336, v337, v338))
    {
      uint64_t v339 = sub_1B4F5B0A4(v86, v142);

      uint64_t v340 = CWFGetOSLog();
      if (v340)
      {
        uint64_t v341 = CWFGetOSLog();
      }
      else
      {
        uint64_t v341 = MEMORY[0x1E4F14500];
        id v402 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v341, OS_LOG_TYPE_INFO))
      {
        int v469 = 136446978;
        v470 = "CWFFilteredScanResults";
        __int16 v471 = 2082;
        v472 = "CWFUtilPrivate.m";
        __int16 v473 = 1024;
        int v474 = 1168;
        __int16 v475 = 2114;
        uint64_t v142 = v462;
        id v476 = v462;
        LODWORD(v442) = 38;
        v441 = &v469;
        goto LABEL_182;
      }
      goto LABEL_201;
    }
    v343 = sub_1B4F5B0A4(v142, v86);

    objc_msgSend_replaceObjectAtIndex_withObject_(v70, v344, v137, (uint64_t)v343, v345);
    v346 = CWFGetOSLog();
    if (v346)
    {
      uint64_t v347 = CWFGetOSLog();
    }
    else
    {
      uint64_t v347 = MEMORY[0x1E4F14500];
      id v403 = MEMORY[0x1E4F14500];
    }
    id v3 = v443;

    if (os_log_type_enabled(v347, OS_LOG_TYPE_INFO))
    {
      int v469 = 136446978;
      v470 = "CWFFilteredScanResults";
      __int16 v471 = 2082;
      v472 = "CWFUtilPrivate.m";
      __int16 v473 = 1024;
      int v474 = 1177;
      __int16 v475 = 2114;
      id v476 = v86;
      LODWORD(v442) = 38;
      v441 = &v469;
      _os_log_send_and_compose_impl();
    }
LABEL_211:

    id v4 = v444;
    unint64_t v18 = v450;
LABEL_177:

    uint64_t v75 = v461 + 1;
  }
  while (v461 + 1 < (unint64_t)objc_msgSend_count(v3, v398, v399, v400, v401));
LABEL_216:
  v439 = objc_msgSend_copy(v70, v49, v50, v51, v52, v441, v442);

  return v439;
}

id CWFGetOSLog()
{
  if (qword_1EB4B2630 != -1) {
    dispatch_once(&qword_1EB4B2630, &unk_1F0DA3E70);
  }
  uint64_t v0 = (void *)qword_1EB4B2628;
  return v0;
}

id CWFCorrectEthernetAddressString(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1
    && (v3 = v1, (uint64_t v8 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7)) != 0)
    && (v16 = 0, int v15 = 0, sscanf(v8, "%x:%x:%x:%x:%x:%x", v17, &v17[1], &v17[2], &v17[3], &v17[4], &v17[5]) == 6))
  {
    for (uint64_t i = 0; i != 6; ++i)
      *((unsigned char *)&v15 + i) = v17[i];
    uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v9, @"%02x:%02x:%02x:%02x:%02x:%02x", v10, v11, v15, BYTE1(v15), BYTE2(v15), HIBYTE(v15), v16, HIBYTE(v16));
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id CWFHumanReadableStringFromData(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4, v5))
  {
    char v6 = 0;
    uint64_t v7 = 0;
    do
    {
      id v8 = [NSString alloc];
      uint64_t v11 = objc_msgSend_initWithData_encoding_(v8, v9, (uint64_t)v1, qword_1B50315D0[v7], v10);
      uint64_t v12 = (void *)v11;
      if (v6) {
        break;
      }
      char v6 = 1;
      uint64_t v7 = 1;
    }
    while (!v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id CWFEthernetAddressStringFromData(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4, v5) == 6
    && (id v6 = v1, (v11 = (unsigned __int8 *)objc_msgSend_bytes(v6, v7, v8, v9, v10)) != 0))
  {
    int v15 = objc_msgSend_stringWithFormat_(NSString, v12, @"%02x:%02x:%02x:%02x:%02x:%02x", v13, v14, *v11, v11[1], v11[2], v11[3], v11[4], v11[5]);
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

void sub_1B4F50F00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

id sub_1B4F50F2C()
{
  uint64_t v0 = (audit_token_t *)MEMORY[0x1F4188790]();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath_audittoken(v0, buffer, 0x1000u) < 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v1 = [NSString alloc];
    uint64_t v4 = objc_msgSend_initWithCString_encoding_(v1, v2, (uint64_t)buffer, 4, v3);
  }
  return v4;
}

void sub_1B4F514C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F514E8()
{
  if (!qword_1E9D45BD8) {
    qword_1E9D45BD8 = _sl_dlopen();
  }
  return qword_1E9D45BD8;
}

uint64_t sub_1B4F51AA0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F51BBC(uint64_t a1)
{
}

void sub_1B4F51BC4(uint64_t a1)
{
}

void sub_1B4F51BCC(uint64_t a1)
{
}

void sub_1B4F51BD4(uint64_t a1)
{
}

void sub_1B4F51BDC(uint64_t a1)
{
}

void sub_1B4F51BE4(uint64_t a1)
{
}

void sub_1B4F51BEC(uint64_t a1)
{
}

void sub_1B4F51BF4(uint64_t a1)
{
}

void sub_1B4F51BFC(uint64_t a1)
{
}

void sub_1B4F51C04(uint64_t a1)
{
}

void sub_1B4F51C0C(uint64_t a1)
{
}

void sub_1B4F51C14(uint64_t a1)
{
}

uint64_t sub_1B4F51C1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51C2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51C3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51C4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51C5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51C6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51C7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51C8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51C9C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51CAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51CBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1B4F51CCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id CWFHexadecimalStringFromData(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
    id v6 = a1;
    uint64_t v11 = objc_msgSend_length(v6, v7, v8, v9, v10);
    int v15 = objc_msgSend_stringWithCapacity_(v5, v12, 2 * v11, v13, v14);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B4F3FDF4;
    v22[3] = &unk_1E60BB7B8;
    id v16 = v15;
    id v23 = v16;
    objc_msgSend_enumerateByteRangesUsingBlock_(v6, v17, (uint64_t)v22, v18, v19);
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v20 = objc_msgSend_copy(v16, a2, a3, a4, a5);

  return v20;
}

uint64_t CWFIsAutoJoinRetryTrigger(unint64_t a1)
{
  return (a1 < 0x40) & (0xC00FF00000000010 >> a1);
}

uint64_t sub_1B4F51FA8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F51FC0(int a1)
{
  uint64_t result = 0;
  if (a1 > 45)
  {
    if (a1 > 79)
    {
      if (a1 == 80)
      {
        return 14;
      }
      else
      {
        BOOL v3 = a1 == 191;
        uint64_t v4 = 29;
LABEL_12:
        if (v3) {
          return v4;
        }
        else {
          return 0;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case '?':
          uint64_t result = 37;
          break;
        case '@':
        case 'A':
        case 'B':
        case 'E':
          return result;
        case 'C':
          uint64_t result = 15;
          break;
        case 'D':
          uint64_t result = 16;
          break;
        case 'F':
        case 'G':
          return 14;
        default:
          BOOL v3 = a1 == 46;
          uint64_t v4 = 17;
          goto LABEL_12;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1:
        uint64_t result = 1;
        break;
      case 2:
        uint64_t result = 2;
        break;
      case 3:
        uint64_t result = 3;
        break;
      case 4:
        uint64_t result = 6;
        break;
      case 5:
      case 6:
      case 7:
      case 9:
      case 10:
      case 14:
      case 16:
      case 18:
      case 19:
        return result;
      case 8:
        uint64_t result = 8;
        break;
      case 11:
        uint64_t result = 4;
        break;
      case 12:
        uint64_t result = 32;
        break;
      case 13:
        uint64_t result = 33;
        break;
      case 15:
        uint64_t result = 5;
        break;
      case 17:
        goto LABEL_16;
      case 20:
        uint64_t result = 31;
        break;
      default:
        if (a1 == 39) {
LABEL_16:
        }
          uint64_t result = 7;
        break;
    }
  }
  return result;
}

__CFString *sub_1B4F520D4(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 0x40)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB328[a1];
  }
  return v5;
}

__CFString *sub_1B4F52138(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 5)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB528[a1];
  }
  return v5;
}

uint64_t sub_1B4F5219C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_objectForKeyedSubscript_(a1, a2, @"SCAN_RESULT_NET_FLAGS", a4, a5);
}

uint64_t sub_1B4F521A8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_objectForKeyedSubscript_(a1, a2, @"IE", a4, a5);
}

uint64_t sub_1B4F521B4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_objectForKeyedSubscript_(a1, a2, @"SSID", a4, a5);
}

__CFString *sub_1B4F53420(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB0B8[a1];
  }
  return v5;
}

__CFString *sub_1B4F53484(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 0x26)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB0D8[a1];
  }
  return v5;
}

uint64_t sub_1B4F534E8(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xC) {
    return 0;
  }
  else {
    return qword_1B50313D0[a1 - 1];
  }
}

uint64_t sub_1B4F5350C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x24) {
    return 0;
  }
  else {
    return qword_1B5031438[a1 - 1];
  }
}

id sub_1B4F535A4(void *a1, void *a2)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  id v6 = 0;
  if (v3 && v4)
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v7 = v4;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v83, (uint64_t)v88, 16);
    if (v9)
    {
      uint64_t v14 = v9;
      uint64_t v15 = *(void *)v84;
      id v76 = v7;
      int v77 = v5;
      uint64_t v73 = *(void *)v84;
      while (2)
      {
        uint64_t v16 = 0;
        uint64_t v74 = v14;
        do
        {
          if (*(void *)v84 != v15) {
            objc_enumerationMutation(v7);
          }
          uint64_t v17 = *(void **)(*((void *)&v83 + 1) + 8 * v16);
          uint64_t v18 = objc_msgSend_SSID(v3, v10, v11, v12, v13, v73);
          id v23 = objc_msgSend_SSID(v17, v19, v20, v21, v22);
          int v78 = v18;
          if (objc_msgSend_length(v18, v24, v25, v26, v27))
          {
            if (objc_msgSend_length(v23, v28, v29, v30, v31))
            {
              if (objc_msgSend_isEqualToData_(v18, v32, (uint64_t)v23, v33, v34))
              {
                int isPasspoint = objc_msgSend_isPasspoint(v3, v35, v36, v37, v38);
                if (isPasspoint == objc_msgSend_isPasspoint(v17, v40, v41, v42, v43))
                {
                  if (!objc_msgSend_isAmbiguousNetworkName(v17, v44, v45, v46, v47))
                  {
LABEL_26:

                    id v6 = v17;
                    goto LABEL_28;
                  }
                  uint64_t v75 = v16;
                  long long v81 = 0u;
                  long long v82 = 0u;
                  long long v79 = 0u;
                  long long v80 = 0u;
                  uint64_t v52 = objc_msgSend_BSSList(v17, v48, v49, v50, v51);
                  uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v79, (uint64_t)v87, 16);
                  if (v54)
                  {
                    uint64_t v59 = v54;
                    uint64_t v60 = *(void *)v80;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v59; ++i)
                      {
                        if (*(void *)v80 != v60) {
                          objc_enumerationMutation(v52);
                        }
                        uint64_t v62 = objc_msgSend_BSSID(*(void **)(*((void *)&v79 + 1) + 8 * i), v55, v56, v57, v58);
                        uint64_t v67 = objc_msgSend_BSSID(v3, v63, v64, v65, v66);
                        char isEqualToString = objc_msgSend_isEqualToString_(v62, v68, (uint64_t)v67, v69, v70);

                        if (isEqualToString)
                        {

                          id v7 = v76;
                          uint64_t v5 = v77;
                          goto LABEL_26;
                        }
                      }
                      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v79, (uint64_t)v87, 16);
                      if (v59) {
                        continue;
                      }
                      break;
                    }
                  }

                  id v7 = v76;
                  uint64_t v5 = v77;
                  uint64_t v15 = v73;
                  uint64_t v14 = v74;
                  uint64_t v16 = v75;
                }
              }
            }
          }

          ++v16;
        }
        while (v16 != v14);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v83, (uint64_t)v88, 16);
        id v6 = 0;
        if (v14) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v6 = 0;
    }
LABEL_28:
  }
  return v6;
}

__CFString *sub_1B4F53860(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 > 63)
  {
    if (a1 > 159)
    {
      if (a1 > 511)
      {
        if (a1 == 512)
        {
          id v7 = @"Open";
        }
        else
        {
          if (a1 != 768) {
            goto LABEL_68;
          }
          id v7 = @"OWE Transition";
        }
      }
      else if (a1 == 160)
      {
        id v7 = @"WPA2/WPA3 Enterprise";
      }
      else
      {
        if (a1 != 256) {
          goto LABEL_68;
        }
        id v7 = @"OWE";
      }
    }
    else if (a1 > 83)
    {
      if (a1 == 84)
      {
        id v7 = @"WPA/WPA2/WPA3 Personal";
      }
      else
      {
        if (a1 != 128) {
          goto LABEL_68;
        }
        id v7 = @"WPA3 Enterprise";
      }
    }
    else if (a1 == 64)
    {
      id v7 = @"WPA3 Personal";
    }
    else
    {
      if (a1 != 80) {
        goto LABEL_68;
      }
      id v7 = @"WPA2/WPA3 Personal";
    }
  }
  else
  {
    if (a1 <= 15)
    {
      switch(a1)
      {
        case 1:
          id v7 = @"WEP";
          break;
        case 2:
          id v7 = @"WAPI";
          break;
        case 4:
          id v7 = @"WPA Personal";
          break;
        case 8:
          id v7 = @"WPA Enterprise";
          break;
        default:
          goto LABEL_68;
      }
      return v7;
    }
    if (a1 > 31)
    {
      if (a1 == 32)
      {
        id v7 = @"WPA2 Enterprise";
      }
      else
      {
        if (a1 != 40) {
          goto LABEL_68;
        }
        id v7 = @"WPA/WPA2 Enterprise";
      }
    }
    else
    {
      if (a1 != 16)
      {
        if (a1 == 20)
        {
          id v7 = @"WPA/WPA2 Personal";
          return v7;
        }
LABEL_68:
        objc_msgSend_stringWithFormat_(NSString, a2, @"%@%lu", a4, a5, @"Unknown=", a1, v5);
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v7;
      }
      id v7 = @"WPA2 Personal";
    }
  }
  return v7;
}

uint64_t sub_1B4F53B10(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_isEqualToString_(v1, v2, @"Open", v3, v4))
  {
    uint64_t v8 = 512;
  }
  else if (objc_msgSend_isEqualToString_(v1, v5, @"WEP", v6, v7))
  {
    uint64_t v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v1, v9, @"WAPI", v10, v11))
  {
    uint64_t v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v1, v12, @"WPA Personal", v13, v14))
  {
    uint64_t v8 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v1, v15, @"WPA/WPA2 Personal", v16, v17))
  {
    uint64_t v8 = 20;
  }
  else if (objc_msgSend_isEqualToString_(v1, v18, @"WPA2 Personal", v19, v20))
  {
    uint64_t v8 = 16;
  }
  else if (objc_msgSend_isEqualToString_(v1, v21, @"WPA2/WPA3 Personal", v22, v23))
  {
    uint64_t v8 = 80;
  }
  else if (objc_msgSend_isEqualToString_(v1, v24, @"WPA/WPA2/WPA3 Personal", v25, v26))
  {
    uint64_t v8 = 84;
  }
  else if (objc_msgSend_isEqualToString_(v1, v27, @"WPA3 Personal", v28, v29))
  {
    uint64_t v8 = 64;
  }
  else if (objc_msgSend_isEqualToString_(v1, v30, @"WPA Enterprise", v31, v32))
  {
    uint64_t v8 = 8;
  }
  else if (objc_msgSend_isEqualToString_(v1, v33, @"WPA/WPA2 Enterprise", v34, v35))
  {
    uint64_t v8 = 40;
  }
  else if (objc_msgSend_isEqualToString_(v1, v36, @"WPA2 Enterprise", v37, v38))
  {
    uint64_t v8 = 32;
  }
  else if (objc_msgSend_isEqualToString_(v1, v39, @"WPA2/WPA3 Enterprise", v40, v41))
  {
    uint64_t v8 = 160;
  }
  else if (objc_msgSend_isEqualToString_(v1, v42, @"WPA3 Enterprise", v43, v44))
  {
    uint64_t v8 = 128;
  }
  else if (objc_msgSend_isEqualToString_(v1, v45, @"OWE Transition", v46, v47))
  {
    uint64_t v8 = 768;
  }
  else if (objc_msgSend_isEqualToString_(v1, v48, @"OWE", v49, v50))
  {
    uint64_t v8 = 256;
  }
  else if (objc_msgSend_hasPrefix_(v1, v51, @"Unknown=", v52, v53))
  {
    uint64_t v58 = objc_msgSend_length(@"Unknown=", v54, v55, v56, v57);
    uint64_t v62 = objc_msgSend_substringFromIndex_(v1, v59, v58, v60, v61);
    uint64_t v8 = objc_msgSend_longLongValue(v62, v63, v64, v65, v66);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_1B4F53D48(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 6)
  {
    uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@%ld", a4, a5, @"Unknown=", a1);
  }
  else
  {
    uint64_t v5 = (void *)qword_1E60BB208[a1];
  }
  return v5;
}

uint64_t sub_1B4F53DB4(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_isEqualToString_(v1, v2, @"WEP-40 Shared Key", v3, v4))
  {
    uint64_t v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v1, v5, @"WEP-104 Shared Key", v6, v7))
  {
    uint64_t v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v1, v9, @"WEP-40 Open", v10, v11))
  {
    uint64_t v8 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v1, v12, @"WEP-104 Open", v13, v14))
  {
    uint64_t v8 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v1, v15, @"Dynamic WEP", v16, v17))
  {
    uint64_t v8 = 5;
  }
  else if (objc_msgSend_hasPrefix_(v1, v18, @"Unknown=", v19, v20))
  {
    uint64_t v25 = objc_msgSend_length(@"Unknown=", v21, v22, v23, v24);
    uint64_t v29 = objc_msgSend_substringFromIndex_(v1, v26, v25, v27, v28);
    uint64_t v8 = objc_msgSend_integerValue(v29, v30, v31, v32, v33);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_1B4F53EB8(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 3)
  {
    uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@%ld", a4, a5, @"Unknown=", a1);
  }
  else
  {
    uint64_t v5 = (void *)qword_1E60BB238[a1];
  }
  return v5;
}

uint64_t sub_1B4F53F24(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_isEqualToString_(v1, v2, @"WAPI PSK", v3, v4))
  {
    uint64_t v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v1, v5, @"WAPI Cert", v6, v7))
  {
    uint64_t v8 = 2;
  }
  else if (objc_msgSend_hasPrefix_(v1, v9, @"Unknown=", v10, v11))
  {
    uint64_t v16 = objc_msgSend_length(@"Unknown=", v12, v13, v14, v15);
    uint64_t v20 = objc_msgSend_substringFromIndex_(v1, v17, v16, v18, v19);
    uint64_t v8 = objc_msgSend_integerValue(v20, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_1B4F53FD4(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 0x13)
  {
    uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"%@%ld", a4, a5, @"Unknown=", a1);
  }
  else
  {
    uint64_t v5 = (void *)qword_1E60BB250[a1];
  }
  return v5;
}

uint64_t sub_1B4F54040(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_isEqualToString_(v1, v2, @"Unspecified", v3, v4))
  {
    uint64_t v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v1, v5, @"WiFi Menu", v6, v7))
  {
    uint64_t v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v1, v9, @"Network Prefs", v10, v11))
  {
    uint64_t v8 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v1, v12, @"Preferred Networks List", v13, v14))
  {
    uint64_t v8 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v1, v15, @"WiFi Settings", v16, v17))
  {
    uint64_t v8 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v1, v18, @"Ask to Join", v19, v20))
  {
    uint64_t v8 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v1, v21, @"SetupAssistant", v22, v23))
  {
    uint64_t v8 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v1, v24, @"Cloud Sync", v25, v26))
  {
    uint64_t v8 = 8;
  }
  else if (objc_msgSend_isEqualToString_(v1, v27, @"MCX Profile", v28, v29))
  {
    uint64_t v8 = 9;
  }
  else if (objc_msgSend_isEqualToString_(v1, v30, @"Carrier Bundle", v31, v32))
  {
    uint64_t v8 = 10;
  }
  else if (objc_msgSend_isEqualToString_(v1, v33, @"WiFi Password Sharing", v34, v35))
  {
    uint64_t v8 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v1, v36, @"Tap to Setup", v37, v38))
  {
    uint64_t v8 = 12;
  }
  else if (objc_msgSend_isEqualToString_(v1, v39, @"Guessing", v40, v41))
  {
    uint64_t v8 = 13;
  }
  else if (objc_msgSend_isEqualToString_(v1, v42, @"System App", v43, v44))
  {
    uint64_t v8 = 14;
  }
  else if (objc_msgSend_isEqualToString_(v1, v45, @"3rd Party App", v46, v47))
  {
    uint64_t v8 = 15;
  }
  else if (objc_msgSend_isEqualToString_(v1, v48, @"Recommendation", v49, v50))
  {
    uint64_t v8 = 16;
  }
  else if (objc_msgSend_isEqualToString_(v1, v51, @"Wallet", v52, v53))
  {
    uint64_t v8 = 17;
  }
  else if (objc_msgSend_isEqualToString_(v1, v54, @"Accessory App", v55, v56))
  {
    uint64_t v8 = 18;
  }
  else if (objc_msgSend_hasPrefix_(v1, v57, @"Unknown=", v58, v59))
  {
    uint64_t v64 = objc_msgSend_length(@"Unknown=", v60, v61, v62, v63);
    uint64_t v68 = objc_msgSend_substringFromIndex_(v1, v65, v64, v66, v67);
    uint64_t v8 = objc_msgSend_integerValue(v68, v69, v70, v71, v72);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_1B4F542B0(void *a1, void *a2)
{
  uint64_t v241 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  id v6 = 0;
  if (!v3 || !v4) {
    goto LABEL_72;
  }
  long long v231 = 0u;
  long long v232 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  id v7 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v229, (uint64_t)v240, 16);
  if (!v9)
  {
    id v6 = 0;
    goto LABEL_71;
  }
  uint64_t v14 = *(void *)v230;
  uint64_t v221 = v7;
  uint64_t v218 = *(void *)v230;
  while (2)
  {
    uint64_t v15 = 0;
    uint64_t v219 = v9;
    do
    {
      if (*(void *)v230 != v14) {
        objc_enumerationMutation(v7);
      }
      uint64_t v220 = v15;
      uint64_t v16 = *(void **)(*((void *)&v229 + 1) + 8 * v15);
      uint64_t v224 = objc_msgSend_domainName(v16, v10, v11, v12, v13);
      if (!v224 || !objc_msgSend_isPasspoint(v3, v17, v18, v19, v20)) {
        goto LABEL_32;
      }
      uint64_t v21 = objc_msgSend_domainNameList(v3, v17, v18, v19, v20);
      uint64_t v26 = objc_msgSend_domainName(v16, v22, v23, v24, v25);
      char v30 = objc_msgSend_containsObject_(v21, v27, (uint64_t)v26, v28, v29);

      if (v30) {
        goto LABEL_69;
      }
      uint64_t v35 = objc_msgSend_cellularNetworkInfo(v3, v31, v32, v33, v34);
      uint64_t v40 = objc_msgSend_cellularNetworkInfo(v16, v36, v37, v38, v39);
      if (objc_msgSend_count(v35, v41, v42, v43, v44) && objc_msgSend_count(v40, v45, v46, v47, v48))
      {
        uint64_t v49 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v45, (uint64_t)v35, v47, v48);
        uint64_t v53 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v50, (uint64_t)v40, v51, v52);
        char v57 = objc_msgSend_intersectsSet_(v49, v54, (uint64_t)v53, v55, v56);

        if (v57)
        {
          int v58 = 1;
          uint64_t v59 = @"MCC/MNCs";
          if (@"MCC/MNCs") {
            goto LABEL_30;
          }
          goto LABEL_31;
        }
        uint64_t v59 = @"MCC/MNCs";
      }
      else
      {
        uint64_t v59 = 0;
      }
      uint64_t v60 = objc_msgSend_NAIRealmNameList(v3, v45, v46, v47, v48);
      uint64_t v65 = objc_msgSend_NAIRealmNameList(v16, v61, v62, v63, v64);
      if (objc_msgSend_count(v60, v66, v67, v68, v69) && objc_msgSend_count(v65, v70, v71, v72, v73))
      {
        int v77 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v74, (uint64_t)v60, v75, v76);
        long long v81 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v78, (uint64_t)v65, v79, v80);
        char v85 = objc_msgSend_intersectsSet_(v77, v82, (uint64_t)v81, v83, v84);

        if (v85)
        {
          int v58 = 1;
          uint64_t v59 = @"NAI";
          if (@"NAI") {
            goto LABEL_30;
          }
          goto LABEL_31;
        }
        uint64_t v59 = @"NAI";
      }
      else
      {
      }
      uint64_t v90 = objc_msgSend_roamingConsortiumList(v3, v86, v87, v88, v89);
      uint64_t v95 = objc_msgSend_roamingConsortiumList(v16, v91, v92, v93, v94);
      if (objc_msgSend_count(v90, v96, v97, v98, v99) && objc_msgSend_count(v95, v100, v101, v102, v103))
      {
        uint64_t v107 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v104, (uint64_t)v90, v105, v106);
        uint64_t v111 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v108, (uint64_t)v95, v109, v110);
        int v58 = objc_msgSend_intersectsSet_(v107, v112, (uint64_t)v111, v113, v114);

        uint64_t v59 = @"RCOI";
      }
      else
      {
        int v58 = 0;
      }

      if (v59)
      {
LABEL_30:
        if (v58)
        {
          id v216 = CWFGetOSLog();
          if (v216)
          {
            uint64_t v193 = CWFGetOSLog();
          }
          else
          {
            uint64_t v193 = MEMORY[0x1E4F14500];
            id v217 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v193, OS_LOG_TYPE_DEBUG))
          {
            int v234 = 138543874;
            uint64_t v235 = v59;
            __int16 v236 = 2114;
            uint64_t v237 = v16;
            __int16 v238 = 2114;
            id v239 = v3;
            _os_log_send_and_compose_impl();
          }
LABEL_67:

LABEL_68:
LABEL_69:
          id v6 = v16;

          id v7 = v221;
          goto LABEL_71;
        }
      }
LABEL_31:

      if (v58) {
        goto LABEL_69;
      }
LABEL_32:
      uint64_t v35 = objc_msgSend_SSID(v3, v17, v18, v19, v20);
      uint64_t v40 = objc_msgSend_SSID(v16, v115, v116, v117, v118);
      int isPasspoint = objc_msgSend_isPasspoint(v3, v119, v120, v121, v122);
      if (isPasspoint == objc_msgSend_isPasspoint(v16, v124, v125, v126, v127))
      {
        char v136 = objc_msgSend_isProfileBased(v16, v128, v129, v130, v131)
            && objc_msgSend_isEAP(v16, v132, v133, v134, v135)
             ? objc_msgSend_isEAP(v3, v132, v133, v134, v135)
             : 0;
        if (objc_msgSend_length(v35, v132, v133, v134, v135))
        {
          if (objc_msgSend_length(v40, v137, v138, v139, v140))
          {
            if (objc_msgSend_isEqualToData_(v35, v141, (uint64_t)v40, v142, v143))
            {
              if ((v136 & 1) != 0
                || (uint64_t v148 = objc_msgSend_supportedSecurityTypes(v3, v144, v145, v146, v147),
                    v148 == objc_msgSend_effectiveSupportedSecurityTypes(v16, v149, v150, v151, v152))
                || (uint64_t v153 = objc_msgSend_supportedSecurityTypes(v3, v144, v145, v146, v147),
                    (objc_msgSend_effectiveSupportedSecurityTypes(v16, v154, v155, v156, v157) & v153) != 0))
              {
                if (objc_msgSend_supportedSecurityTypes(v16, v144, v145, v146, v147) != 256
                  && (objc_msgSend_supportedSecurityTypes(v3, v158, v159, v160, v161) != 256
                   || (objc_msgSend_channel(v3, v158, v159, v160, v161),
                       uint64_t v162 = objc_claimAutoreleasedReturnValue(),
                       char v167 = objc_msgSend_is6GHz(v162, v163, v164, v165, v166),
                       v162,
                       (v167 & 1) != 0))
                  || (uint64_t v168 = objc_msgSend_supportedSecurityTypes(v3, v158, v159, v160, v161),
                      v168 == objc_msgSend_supportedSecurityTypes(v16, v169, v170, v171, v172)))
                {
                  if (objc_msgSend_supportedSecurityTypes(v16, v158, v159, v160, v161) != 64
                    && (objc_msgSend_supportedSecurityTypes(v3, v173, v174, v175, v176) != 64
                     || (objc_msgSend_channel(v3, v173, v174, v175, v176),
                         long long v182 = objc_claimAutoreleasedReturnValue(),
                         char v187 = objc_msgSend_is6GHz(v182, v183, v184, v185, v186),
                         v182,
                         (v187 & 1) != 0))
                    || (uint64_t v177 = objc_msgSend_supportedSecurityTypes(v3, v173, v174, v175, v176),
                        v177 == objc_msgSend_supportedSecurityTypes(v16, v178, v179, v180, v181)))
                  {
                    if (!objc_msgSend_isAmbiguousNetworkName(v16, v173, v174, v175, v176)) {
                      goto LABEL_68;
                    }
                    uint64_t v222 = v40;
                    uint64_t v223 = v35;
                    uint64_t v192 = v5;
                    long long v227 = 0u;
                    long long v228 = 0u;
                    long long v225 = 0u;
                    long long v226 = 0u;
                    uint64_t v193 = objc_msgSend_BSSList(v16, v188, v189, v190, v191);
                    uint64_t v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v194, (uint64_t)&v225, (uint64_t)v233, 16);
                    if (v195)
                    {
                      uint64_t v200 = v195;
                      uint64_t v201 = *(void *)v226;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v200; ++i)
                        {
                          if (*(void *)v226 != v201) {
                            objc_enumerationMutation(v193);
                          }
                          uint64_t v203 = objc_msgSend_BSSID(*(void **)(*((void *)&v225 + 1) + 8 * i), v196, v197, v198, v199);
                          uint64_t v204 = CWFCorrectEthernetAddressString(v203);
                          uint64_t v209 = objc_msgSend_copy(v204, v205, v206, v207, v208);

                          if (v209)
                          {
                            uint64_t v210 = objc_msgSend_BSSID(v3, v196, v197, v198, v199);
                            char isEqualToString = objc_msgSend_isEqualToString_(v209, v211, (uint64_t)v210, v212, v213);

                            if (isEqualToString)
                            {
                              uint64_t v5 = v192;
                              uint64_t v40 = v222;
                              uint64_t v35 = v223;
                              goto LABEL_67;
                            }
                          }
                        }
                        uint64_t v200 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v196, (uint64_t)&v225, (uint64_t)v233, 16);
                        if (v200) {
                          continue;
                        }
                        break;
                      }
                    }

                    uint64_t v5 = v192;
                    uint64_t v40 = v222;
                    uint64_t v35 = v223;
                  }
                }
              }
            }
          }
        }
      }

      uint64_t v15 = v220 + 1;
      id v7 = v221;
      uint64_t v14 = v218;
    }
    while (v220 + 1 != v219);
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v10, (uint64_t)&v229, (uint64_t)v240, 16);
    id v6 = 0;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_71:

LABEL_72:
  return v6;
}

__CFString *sub_1B4F549C4(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB2E8[a1];
  }
  return v5;
}

__CFString *sub_1B4F54A28(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB308[a1];
  }
  return v5;
}

__CFString *sub_1B4F54A8C(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 0xC)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB550[a1];
  }
  return v5;
}

void *sub_1B4F54AF0(void *result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    uint64_t v5 = objc_msgSend_lowercaseString(result, a2, a3, a4, a5);
    uint64_t v9 = objc_msgSend_containsObject_(&unk_1F0DC86A0, v6, (uint64_t)v5, v7, v8);

    return (void *)v9;
  }
  return result;
}

__CFString *sub_1B4F54B3C(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 < 8 && ((0xDFu >> a1) & 1) != 0)
  {
    uint64_t v5 = off_1E60BB5B0[(char)a1];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

__CFString *sub_1B4F54BB4(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB5F0[a1];
  }
  return v5;
}

__CFString *sub_1B4F54C18(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if a1 < 9 && ((0x117u >> a1))
  {
    uint64_t v5 = off_1E60BB630[(int)a1];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (0x%X)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

__CFString *sub_1B4F54C88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%d)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB678[(int)a1];
  }
  return v5;
}

__CFString *sub_1B4F54CEC(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    __int16 v5 = a1;
    id v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, a3, a4, a5);
    uint64_t v11 = v6;
    if ((v5 & 4) != 0)
    {
      objc_msgSend_appendString_(v6, v7, @"b/", v9, v10);
      if ((v5 & 8) == 0)
      {
LABEL_4:
        if ((v5 & 2) == 0) {
          goto LABEL_5;
        }
        goto LABEL_15;
      }
    }
    else if ((v5 & 8) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend_appendString_(v11, v7, @"g/", v9, v10);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
LABEL_15:
    objc_msgSend_appendString_(v11, v7, @"a/", v9, v10);
    if ((v5 & 0x10) == 0)
    {
LABEL_6:
      if ((v5 & 0x80) == 0) {
        goto LABEL_7;
      }
      goto LABEL_17;
    }
LABEL_16:
    objc_msgSend_appendString_(v11, v7, @"n/", v9, v10);
    if ((v5 & 0x80) == 0)
    {
LABEL_7:
      if ((v5 & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
LABEL_17:
    objc_msgSend_appendString_(v11, v7, @"ac/", v9, v10);
    if ((v5 & 0x100) == 0)
    {
LABEL_8:
      if ((v5 & 0x200) == 0)
      {
LABEL_10:
        if (objc_msgSend_length(v11, v7, v8, v9, v10))
        {
          uint64_t v16 = objc_msgSend_length(v11, v12, v13, v14, v15);
          objc_msgSend_substringToIndex_(v11, v17, v16 - 1, v18, v19);
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v20 = @"?";
        }

        goto LABEL_22;
      }
LABEL_9:
      objc_msgSend_appendString_(v11, v7, @"be/", v9, v10);
      goto LABEL_10;
    }
LABEL_18:
    objc_msgSend_appendString_(v11, v7, @"ax/", v9, v10);
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v20 = @"none";
LABEL_22:
  return v20;
}

void sub_1B4F54E24()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)qword_1EB4B2618;
  qword_1EB4B2618 = (uint64_t)v0;

  objc_msgSend_setDateFormat_((void *)qword_1EB4B2618, v2, @"YYYY-MM-dd HH:mm:ss.SSS ZZZ", v3, v4);
  uint64_t v9 = objc_msgSend_localTimeZone(MEMORY[0x1E4F1CAF0], v5, v6, v7, v8);
  objc_msgSend_setTimeZone_((void *)qword_1EB4B2618, v10, (uint64_t)v9, v11, v12);

  objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x1E4F1CA20], v13, v14, v15, v16);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocale_((void *)qword_1EB4B2618, v17, (uint64_t)v20, v18, v19);
}

__CFString *sub_1B4F54ECC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if a1 < 0xC && ((0xFF9u >> a1))
  {
    __int16 v5 = off_1E60BB6B8[(int)a1];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%d)", a4, a5, a1);
    __int16 v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t CWFSecItemQueryPassword_0(void *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F3B878];
  uint64_t v35 = *MEMORY[0x1E4F3BD20];
  uint64_t v36 = v3;
  uint64_t v4 = *MEMORY[0x1E4F3B880];
  uint64_t v38 = MEMORY[0x1E4F1CC38];
  uint64_t v39 = v4;
  CFTypeRef cf = 0;
  uint64_t v37 = *MEMORY[0x1E4F3BC70];
  uint64_t v40 = MEMORY[0x1E4F1CC38];
  __int16 v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a1;
  uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v7, (uint64_t)&v38, (uint64_t)&v35, 3);
  if (objc_msgSend_length(v6, v9, v10, v11, v12))
  {
    id v13 = [NSString alloc];
    uint64_t v16 = objc_msgSend_initWithData_encoding_(v13, v14, (uint64_t)v6, 4, v15);
    uint64_t v21 = objc_msgSend_mutableCopy(v8, v17, v18, v19, v20);
    objc_msgSend_setObject_forKeyedSubscript_(v21, v22, *MEMORY[0x1E4F3B988], *MEMORY[0x1E4F3B978], v23);
    objc_msgSend_setObject_forKeyedSubscript_(v21, v24, @"AirPort", *MEMORY[0x1E4F3B850], v25);
    if (v16) {
      objc_msgSend_setObject_forKeyedSubscript_(v21, v26, (uint64_t)v16, *MEMORY[0x1E4F3B5C0], v27, cf, v35, v36, v37, v38, v39, v40, v41);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v21, v26, (uint64_t)v6, *MEMORY[0x1E4F3B5C0], v27, cf, v35, v36, v37, v38, v39, v40, v41);
    }
    uint64_t v28 = SecItemCopyMatching((CFDictionaryRef)v21, &cf);
  }
  else
  {
    uint64_t v28 = 4294967246;
  }

  CFTypeRef v29 = cf;
  if (a2 && cf)
  {
    id v30 = [NSString alloc];
    *a2 = (id)objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)cf, 4, v32);
    CFTypeRef v29 = cf;
  }
  if (v29) {
    CFRelease(v29);
  }

  return v28;
}

uint64_t sub_1B4F55108(void *a1, void *a2, void *a3)
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (__CFString *)v5;
  id v9 = v7;
  uint64_t v11 = v9;
  if (!v8)
  {
    uint64_t v20 = 4294967246;
    goto LABEL_32;
  }
  if (!v9)
  {
    uint64_t v21 = *MEMORY[0x1E4F3B878];
    uint64_t v119 = *MEMORY[0x1E4F3BD20];
    uint64_t v120 = v21;
    uint64_t v22 = (__CFString *)*MEMORY[0x1E4F3B880];
    uint64_t v123 = (void *)MEMORY[0x1E4F1CC38];
    uint64_t v124 = v22;
    uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)&v123, (uint64_t)&v119, 2);
    if (!objc_msgSend_length(v8, v23, v24, v25, v26))
    {
      uint64_t v20 = 4294967246;
      goto LABEL_31;
    }
    id v27 = [NSString alloc];
    id v30 = objc_msgSend_initWithData_encoding_(v27, v28, (uint64_t)v8, 4, v29);
    uint64_t v35 = (__CFString *)objc_msgSend_mutableCopy(v16, v31, v32, v33, v34);
    objc_msgSend_setObject_forKeyedSubscript_(v35, v36, *MEMORY[0x1E4F3B988], *MEMORY[0x1E4F3B978], v37);
    objc_msgSend_setObject_forKeyedSubscript_(v35, v38, @"AirPort", *MEMORY[0x1E4F3B850], v39);
    if (v30) {
      objc_msgSend_setObject_forKeyedSubscript_(v35, v40, (uint64_t)v30, *MEMORY[0x1E4F3B5C0], v41);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v35, v40, (uint64_t)v8, *MEMORY[0x1E4F3B5C0], v41);
    }
    uint64_t v20 = SecItemDelete((CFDictionaryRef)v35);
    goto LABEL_29;
  }
  id v116 = 0;
  CWFSecItemQueryPassword_0(v8, &v116);
  id v12 = v116;
  uint64_t v16 = v12;
  if (!v12)
  {
    uint64_t v42 = *MEMORY[0x1E4F3B550];
    uint64_t v119 = *MEMORY[0x1E4F3BD20];
    uint64_t v120 = v42;
    uint64_t v123 = (void *)MEMORY[0x1E4F1CC38];
    uint64_t v124 = @"apple";
    uint64_t v43 = *MEMORY[0x1E4F3B558];
    uint64_t v121 = *MEMORY[0x1E4F3B878];
    uint64_t v122 = v43;
    uint64_t v44 = *MEMORY[0x1E4F3B570];
    uint64_t v125 = (__CFString *)MEMORY[0x1E4F1CC38];
    uint64_t v126 = v44;
    id v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)&v123, (uint64_t)&v119, 4);
    if (objc_msgSend_length(v8, v45, v46, v47, v48) && objc_msgSend_length(v11, v49, v50, v51, v52))
    {
      id v53 = [NSString alloc];
      uint64_t v35 = (__CFString *)objc_msgSend_initWithData_encoding_(v53, v54, (uint64_t)v8, 4, v55);
      uint64_t v59 = objc_msgSend_dataUsingEncoding_(v11, v56, 4, v57, v58);
      if (objc_msgSend_length(v59, v60, v61, v62, v63))
      {
        uint64_t v68 = objc_msgSend_mutableCopy(v30, v64, v65, v66, v67);
        objc_msgSend_setObject_forKeyedSubscript_(v68, v69, *MEMORY[0x1E4F3B988], *MEMORY[0x1E4F3B978], v70);
        objc_msgSend_setObject_forKeyedSubscript_(v68, v71, @"AirPort", *MEMORY[0x1E4F3B850], v72);
        if (v35)
        {
          uint64_t v75 = (uint64_t)v35;
          objc_msgSend_setObject_forKeyedSubscript_(v68, v73, (uint64_t)v35, *MEMORY[0x1E4F3B5C0], v74);
        }
        else
        {
          uint64_t v75 = (uint64_t)v8;
          objc_msgSend_setObject_forKeyedSubscript_(v68, v73, (uint64_t)v8, *MEMORY[0x1E4F3B5C0], v74);
        }
        objc_msgSend_setObject_forKeyedSubscript_(v68, v76, @"AirPort network password", *MEMORY[0x1E4F3B678], v77);
        objc_msgSend_setObject_forKeyedSubscript_(v68, v78, v75, *MEMORY[0x1E4F3B788], v79);
        objc_msgSend_setObject_forKeyedSubscript_(v68, v80, (uint64_t)v59, *MEMORY[0x1E4F3BD38], v81);
        uint64_t v20 = SecItemAdd((CFDictionaryRef)v68, 0);
LABEL_27:

LABEL_28:
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v59 = 0;
      uint64_t v35 = 0;
    }
    uint64_t v20 = 4294967246;
    goto LABEL_28;
  }
  if ((objc_msgSend_isEqualToString_(v12, v13, (uint64_t)v11, v14, v15) & 1) == 0)
  {
    id v30 = objc_msgSend_dataUsingEncoding_(v11, v17, 4, v18, v19);
    if (!objc_msgSend_length(v30, v82, v83, v84, v85))
    {
      uint64_t v20 = 4294967246;
      goto LABEL_30;
    }
    id v86 = [NSString alloc];
    uint64_t v35 = (__CFString *)objc_msgSend_initWithData_encoding_(v86, v87, (uint64_t)v8, 4, v88);
    uint64_t v89 = *MEMORY[0x1E4F3B878];
    v117[0] = *MEMORY[0x1E4F3BD20];
    v117[1] = v89;
    uint64_t v90 = *MEMORY[0x1E4F3B880];
    v118[0] = MEMORY[0x1E4F1CC38];
    v118[1] = v90;
    uint64_t v59 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v91, (uint64_t)v118, (uint64_t)v117, 2);
    uint64_t v93 = *MEMORY[0x1E4F3B788];
    uint64_t v119 = *MEMORY[0x1E4F3BD38];
    uint64_t v120 = v93;
    if (v35) {
      uint64_t v94 = v35;
    }
    else {
      uint64_t v94 = v8;
    }
    uint64_t v123 = v30;
    uint64_t v124 = v94;
    uint64_t v121 = *MEMORY[0x1E4F3B678];
    uint64_t v125 = @"AirPort network password";
    uint64_t v68 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v92, (uint64_t)&v123, (uint64_t)&v119, 3);
    if (objc_msgSend_length(v8, v95, v96, v97, v98))
    {
      id v99 = [NSString alloc];
      id v115 = v6;
      uint64_t v102 = objc_msgSend_initWithData_encoding_(v99, v100, (uint64_t)v8, 4, v101);
      uint64_t v107 = objc_msgSend_mutableCopy(v59, v103, v104, v105, v106);
      objc_msgSend_setObject_forKeyedSubscript_(v107, v108, *MEMORY[0x1E4F3B988], *MEMORY[0x1E4F3B978], v109);
      objc_msgSend_setObject_forKeyedSubscript_(v107, v110, @"AirPort", *MEMORY[0x1E4F3B850], v111);
      if (v102) {
        objc_msgSend_setObject_forKeyedSubscript_(v107, v112, (uint64_t)v102, *MEMORY[0x1E4F3B5C0], v113);
      }
      else {
        objc_msgSend_setObject_forKeyedSubscript_(v107, v112, (uint64_t)v8, *MEMORY[0x1E4F3B5C0], v113);
      }
      uint64_t v20 = SecItemUpdate((CFDictionaryRef)v107, (CFDictionaryRef)v68);

      id v6 = v115;
    }
    else
    {
      uint64_t v20 = 4294967246;
    }
    goto LABEL_27;
  }
  uint64_t v20 = 0;
LABEL_31:

LABEL_32:
  return v20;
}

__CFString *sub_1B4F55650(uint64_t a1)
{
  if (a1)
  {
    uint64_t v3 = NSString;
    uint64_t v4 = convertApple80211ReturnToString();
    objc_msgSend_stringWithFormat_(v3, v5, @"0x%x (%s)", v6, v7, a1, v4);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = @"0x0 (success)";
  }
  return v8;
}

uint64_t sub_1B4F556C8()
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!sub_1B4F55EF8()) {
    return 0;
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v0 = (void *)qword_1EB4B25C0;
  uint64_t v30 = qword_1EB4B25C0;
  if (!qword_1EB4B25C0)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4F5603C;
    v26[3] = &unk_1E60BAFD8;
    v26[4] = &v27;
    sub_1B4F5603C(v26);
    id v0 = (void *)v28[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v27, 8);
  uint64_t v6 = objc_msgSend_sharedConnection(v1, v2, v3, v4, v5);
  uint64_t v11 = objc_msgSend_installedProfileIdentifiers(v6, v7, v8, v9, v10);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v11;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v22, (uint64_t)v31, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v20
          && (objc_msgSend_isEqual_(v20, v14, @"com.apple.defaults.managed.corecapture.wifi.megawifi", v15, v16, (void)v22) & 1) != 0)
        {
          uint64_t v17 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v22, (uint64_t)v31, 16);
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v17;
}

void sub_1B4F5589C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F558BC(void *a1)
{
  id v4 = a1;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = CWFBootArgs();
  }
  if (objc_msgSend_containsObject_(v5, v1, @"corewifi_redact_logs=0", v2, v3))
  {
    uint64_t v9 = 1;
  }
  else if (objc_msgSend_containsObject_(v5, v6, @"corewifi_redact_logs=1", v7, v8))
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id sub_1B4F55944(size_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (char *)v7 - ((MEMORY[0x1F4188790]() + 15) & 0xFFFFFFFFFFFFFFF0);
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], a1, v2))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v3, (uint64_t)v2, a1, v4);
  }
  return v5;
}

__CFString *sub_1B4F55A1C(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 6)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"? (%ld)", a4, a5, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E60BB718[a1];
  }
  return v5;
}

__CFString *sub_1B4F55A80(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E60BB748[a1 - 1];
  }
}

uint64_t sub_1B4F55AA4(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_isEqualToString_(v1, v2, @"off", v3, v4))
  {
    uint64_t v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v1, v5, @"rotating", v6, v7))
  {
    uint64_t v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v1, v9, @"static", v10, v11))
  {
    uint64_t v8 = 3;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id sub_1B4F55B20(void *a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v11 = v6;
  id v12 = 0;
  if (!v5 || !v6) {
    goto LABEL_9;
  }
  id v12 = objc_msgSend_SSID(v5, v7, v8, v9, v10);
  if (objc_msgSend_isPasspoint(v5, v13, v14, v15, v16))
  {
    uint64_t v20 = objc_msgSend_domainName(v5, v7, v17, v18, v19);
    uint64_t v24 = objc_msgSend_dataUsingEncoding_(v20, v21, 4, v22, v23);

    id v12 = (void *)v24;
  }
  if (v12 && (CWFEthernetAddressDataFromString(v11), (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v29 = (void *)v25;
    uint64_t v30 = objc_msgSend_data(MEMORY[0x1E4F1CA58], v7, v26, v27, v28);
    objc_msgSend_appendData_(v30, v31, (uint64_t)v29, v32, v33);
    objc_msgSend_appendData_(v30, v34, (uint64_t)v12, v35, v36);
    *(_OWORD *)md = 0u;
    long long v57 = 0u;
    memset(&v55, 0, sizeof(v55));
    CC_SHA256_Init(&v55);
    id v37 = v30;
    uint64_t v42 = (const void *)objc_msgSend_bytes(v37, v38, v39, v40, v41);
    CC_LONG v47 = objc_msgSend_length(v37, v43, v44, v45, v46);
    CC_SHA256_Update(&v55, v42, v47);
    CC_SHA256_Final(md, &v55);
    uint64_t v50 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v48, (uint64_t)md, 32, v49);
    id v51 = 0;
  }
  else
  {
LABEL_9:
    uint64_t v54 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v7, *MEMORY[0x1E4F28798], 22, 0);
    id v51 = v54;
    id v37 = 0;
    if (a3 && v54)
    {
      id v51 = v54;
      id v37 = 0;
      uint64_t v29 = 0;
      uint64_t v50 = 0;
      *a3 = v51;
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v50 = 0;
    }
  }
  id v52 = v50;

  return v52;
}

BOOL sub_1B4F55D30(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v6 = v4;
  memset(v28, 0, sizeof(v28));
  if (!v3 || !v4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v5, *MEMORY[0x1E4F28798], 22, 0);
    uint64_t v18 = LABEL_11:;
    goto LABEL_8;
  }
  int v7 = socket(2, 2, 0);
  if (v7 == -1)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28798];
    uint64_t v22 = *__error();
    objc_msgSend_errorWithDomain_code_userInfo_(v20, v23, v21, v22, 0);
    goto LABEL_11;
  }
  int v9 = v7;
  if ((objc_msgSend_getCString_maxLength_encoding_(v6, v8, (uint64_t)v28, 16, 4) & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 6, 0);
    uint64_t v18 = LABEL_14:;
    goto LABEL_7;
  }
  v28[16] = 32;
  id v11 = v3;
  uint64_t v16 = (_OWORD *)objc_msgSend_bytes(v11, v12, v13, v14, v15);
  long long v17 = v16[1];
  *(_OWORD *)&v28[17] = *v16;
  *(_OWORD *)&v28[33] = v17;
  if (ioctl(v9, 0xC03169D2uLL, v28))
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28798];
    uint64_t v26 = *__error();
    objc_msgSend_errorWithDomain_code_userInfo_(v24, v27, v25, v26, 0);
    goto LABEL_14;
  }
  uint64_t v18 = 0;
LABEL_7:
  close(v9);
LABEL_8:

  return v18 == 0;
}

uint64_t sub_1B4F55EF8()
{
  if (!qword_1EB4B25B8) {
    qword_1EB4B25B8 = _sl_dlopen();
  }
  return qword_1EB4B25B8;
}

uint64_t sub_1B4F55FC8()
{
  uint64_t result = _sl_dlopen();
  qword_1EB4B25B8 = result;
  return result;
}

void sub_1B4F5603C(void *a1)
{
  if (!sub_1B4F55EF8())
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v2, v3, v4, v5);
    a1 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"void *ManagedConfigurationLibrary(void)", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v14, (uint64_t)a1, @"CWFUtilInternal.m", 107, @"%s", 0);

    __break(1u);
    free(v15);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = objc_getClass("MCProfileConnection");
  if (*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    qword_1EB4B25C0 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  else
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8, v9);
    uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)"Class getMCProfileConnectionClass(void)_block_invoke", v18, v19);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v21, (uint64_t)v20, @"CWFUtilInternal.m", 108, @"Unable to find class %s", "MCProfileConnection");

    __break(1u);
  }
}

void sub_1B4F562D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  id v6 = a3;
  uint64_t v7 = CWFGetOSLog();
  if (v7)
  {
    uint64_t v8 = CWFGetOSLog();
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_isMonitoringEvents(v6, v10, v11, v12, v13))
  {
    uint64_t v18 = objc_msgSend_eventHandler(v6, v14, v15, v16, v17);
    uint64_t v19 = (void *)v18;
    if (v18) {
      (*(void (**)(uint64_t, id, uint64_t))(v18 + 16))(v18, v6, a2);
    }
  }
}

void sub_1B4F564E8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 32))
  {
    *(unsigned char *)(v3 + 32) = 1;
    SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 24), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  }
}

void sub_1B4F565B8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 32))
  {
    *(unsigned char *)(v3 + 32) = 0;
    SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 24), 0);
  }
}

void sub_1B4F566C0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 32);
}

void CWFLog(os_log_type_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    uint64_t v5 = CWFGetOSLog();
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, a1)) {
    _os_log_send_and_compose_impl();
  }
}

__uint64_t CWFLogGetContinuousNanoSeconds()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
}

id CWFBootArgs()
{
  mach_port_t mainPort = 0;
  if (!MEMORY[0x1BA995490](*MEMORY[0x1E4F14638], &mainPort))
  {
    io_registry_entry_t v0 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v0)
    {
      io_object_t v1 = v0;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"boot-args", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      if (CFProperty)
      {
        uint64_t v7 = (void *)CFProperty;
        uint64_t v8 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v3, v4, v5, v6);
        uint64_t v12 = objc_msgSend_componentsSeparatedByCharactersInSet_(v7, v9, (uint64_t)v8, v10, v11);

        IOObjectRelease(v1);
        CFRelease(v7);
        goto LABEL_5;
      }
      IOObjectRelease(v1);
    }
  }
  uint64_t v12 = 0;
LABEL_5:
  return v12;
}

id CWFGetBootTime()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)id v9 = 0x1500000001;
  size_t v6 = 16;
  if (sysctl(v9, 2u, &v7, &v6, 0, 0) == -1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v0, v1, v2, v3, (double)(int)v8 / 1000000.0 + (double)v7);
  }
  return v4;
}

id CWFMachineSerialNumber()
{
  mach_port_t v0 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"IOPlatformSerialNumber", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      uint64_t v8 = CFProperty;
      id v9 = objc_msgSend_stringWithString_(NSString, v5, (uint64_t)CFProperty, v6, v7);
      CFRelease(v8);
    }
    else
    {
      id v9 = 0;
    }
    IOObjectRelease(v3);
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

id CWFDebugDescriptionForLQMSummary(char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = objc_msgSend_numberWithInt_(NSNumber, v7, *a1, v8, v9);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v11, (uint64_t)v10, @"CCA", v12);

    uint64_t v16 = objc_msgSend_numberWithInt_(NSNumber, v13, a1[1], v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, @"RSSI", v18);

    uint64_t v22 = objc_msgSend_numberWithInt_(NSNumber, v19, *((__int16 *)a1 + 1), v20, v21);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v23, (uint64_t)v22, @"SNR", v24);

    uint64_t v28 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v25, *((unsigned int *)a1 + 1), v26, v27);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, @"DataStallScore", v30);

    uint64_t v34 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v31, *((unsigned int *)a1 + 2), v32, v33);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v35, (uint64_t)v34, @"NetScore", v36);

    uint64_t v40 = objc_msgSend_numberWithLongLong_(NSNumber, v37, *((void *)a1 + 2), v38, v39);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, @"TxRetries", v42);

    uint64_t v46 = objc_msgSend_numberWithLongLong_(NSNumber, v43, *((void *)a1 + 3), v44, v45);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v47, (uint64_t)v46, @"TxFails", v48);

    id v52 = objc_msgSend_numberWithLongLong_(NSNumber, v49, *((void *)a1 + 4), v50, v51);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, @"TxFrames", v54);

    uint64_t v58 = objc_msgSend_numberWithLongLong_(NSNumber, v55, *((void *)a1 + 5), v56, v57);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v59, (uint64_t)v58, @"RxFCSErrors", v60);

    uint64_t v64 = objc_msgSend_numberWithLongLong_(NSNumber, v61, *((void *)a1 + 6), v62, v63);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v65, (uint64_t)v64, @"RxPLCPErrors", v66);

    uint64_t v70 = objc_msgSend_numberWithLongLong_(NSNumber, v67, *((void *)a1 + 7), v68, v69);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v71, (uint64_t)v70, @"RxCRSGlitches", v72);

    uint64_t v76 = objc_msgSend_numberWithLongLong_(NSNumber, v73, *((void *)a1 + 8), v74, v75);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v77, (uint64_t)v76, @"RxDupErrors", v78);

    long long v82 = objc_msgSend_numberWithLongLong_(NSNumber, v79, *((void *)a1 + 9), v80, v81);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v83, (uint64_t)v82, @"RxAmpduDupErrors", v84);

    uint64_t v88 = objc_msgSend_numberWithLongLong_(NSNumber, v85, *((void *)a1 + 10), v86, v87);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v88, @"RxUcastReplayErrors", v90);

    uint64_t v94 = objc_msgSend_numberWithLongLong_(NSNumber, v91, *((void *)a1 + 11), v92, v93);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v95, (uint64_t)v94, @"RxUcastDecryptErrors", v96);

    uint64_t v100 = objc_msgSend_numberWithLongLong_(NSNumber, v97, *((void *)a1 + 12), v98, v99);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v101, (uint64_t)v100, @"RxMcastReplayErrors", v102);

    uint64_t v106 = objc_msgSend_numberWithLongLong_(NSNumber, v103, *((void *)a1 + 13), v104, v105);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v107, (uint64_t)v106, @"RxMcastDecryptErrors", v108);

    uint64_t v112 = objc_msgSend_numberWithLongLong_(NSNumber, v109, *((void *)a1 + 14), v110, v111);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v113, (uint64_t)v112, @"RxRetries", v114);

    uint64_t v118 = objc_msgSend_numberWithLongLong_(NSNumber, v115, *((void *)a1 + 15), v116, v117);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v119, (uint64_t)v118, @"RxGoodPLCPS", v120);

    uint64_t v124 = objc_msgSend_numberWithLongLong_(NSNumber, v121, *((void *)a1 + 16), v122, v123);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v125, (uint64_t)v124, @"RxUcastFrames", v126);

    uint64_t v130 = objc_msgSend_numberWithLongLong_(NSNumber, v127, *((void *)a1 + 17), v128, v129);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v131, (uint64_t)v130, @"RxMcastFrames", v132);

    char v136 = objc_msgSend_numberWithLongLong_(NSNumber, v133, *((void *)a1 + 18), v134, v135);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v137, (uint64_t)v136, @"RxTotalFrames", v138);

    uint64_t v142 = objc_msgSend_numberWithLongLong_(NSNumber, v139, *((void *)a1 + 19), v140, v141);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v143, (uint64_t)v142, @"RxRTSUCast", v144);

    uint64_t v149 = objc_msgSend_copy(v6, v145, v146, v147, v148);
  }
  else
  {
    id v6 = 0;
    uint64_t v149 = objc_msgSend_copy(0, a2, a3, a4, a5);
  }
  uint64_t v150 = (void *)v149;

  return v150;
}

id CWFEthernetAddressDataFromString(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && (v3 = v1, (uint64_t v8 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7)) != 0)
    && (__int16 v15 = 0, v14 = 0, sscanf(v8, "%x:%x:%x:%x:%x:%x", v16, &v16[1], &v16[2], &v16[3], &v16[4], &v16[5]) == 6))
  {
    for (uint64_t i = 0; i != 6; ++i)
      *((unsigned char *)&v14 + i) = v16[i];
    uint64_t v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v9, (uint64_t)&v14, 6, v10);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id CWFConvertPropertyListToJSON(void *a1, void *a2)
{
  return sub_1B4F59CC8(a1, a2, 0);
}

id sub_1B4F59CC8(void *a1, void *a2, unsigned int a3)
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v9 = a2;
  id v10 = v9;
  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    objc_msgSend_setFormatOptions_(v10, v11, 1907, v12, v13);
    uint64_t v18 = objc_msgSend_localTimeZone(MEMORY[0x1E4F1CAF0], v14, v15, v16, v17);
    objc_msgSend_setTimeZone_(v10, v19, (uint64_t)v18, v20, v21);
  }
  uint64_t v143 = v10;
  if (!v4)
  {
    objc_msgSend_null(MEMORY[0x1E4F1CA98], v5, v6, v7, v8);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_JSONCompatibleKeyValueMap(v4, v22, v23, v24, v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
    id v149 = v26;
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v141 = v9;
    id v142 = v4;
    id v27 = v4;
    id v28 = v10;
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v29, v30, v31, v32);
    id v149 = (id)objc_claimAutoreleasedReturnValue();
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id v33 = v27;
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v150, (uint64_t)v154, 16);
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v151;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v151 != v37) {
            objc_enumerationMutation(v33);
          }
          uint64_t v39 = *(void **)(*((void *)&v150 + 1) + 8 * i);
          uint64_t v44 = sub_1B4F59CC8(v39, v28, a3);
          if (!v44)
          {
            uint64_t v45 = NSString;
            uint64_t v46 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v40, v41, v42, v43);
            uint64_t v51 = objc_msgSend_UUIDString(v46, v47, v48, v49, v50);
            CC_SHA256_CTX v55 = objc_msgSend_substringToIndex_(v51, v52, 5, v53, v54);
            uint64_t v60 = objc_msgSend_description(v39, v56, v57, v58, v59);
            uint64_t v44 = objc_msgSend_stringWithFormat_(v45, v61, @"FAILED TO CONVERT [uuid=%@, desc=<%@>]", v62, v63, v55, v60);
          }
          objc_msgSend_addObject_(v149, v40, (uint64_t)v44, v42, v43);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v64, (uint64_t)&v150, (uint64_t)v154, 16);
      }
      while (v36);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v26 = v4;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_base64EncodedStringWithOptions_(v4, v134, 0, v135, v136);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_stringFromDate_(v10, v137, (uint64_t)v4, v139, v140);
          }
          else {
            objc_msgSend_description(v4, v137, v138, v139, v140);
          }
          id v26 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      goto LABEL_19;
    }
    id v141 = v9;
    id v142 = v4;
    id v65 = v4;
    id v147 = v10;
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v66, v67, v68, v69);
    id v149 = (id)objc_claimAutoreleasedReturnValue();
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    uint64_t v146 = v65;
    objc_msgSend_allKeys(v65, v70, v71, v72, v73);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v74, (uint64_t)&v150, (uint64_t)v154, 16);
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v145 = *(void *)v151;
      unint64_t v77 = 0x1E4F29000uLL;
      do
      {
        for (uint64_t j = 0; j != v76; ++j)
        {
          if (*(void *)v151 != v145) {
            objc_enumerationMutation(obj);
          }
          uint64_t v79 = *(void **)(*((void *)&v150 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v87 = v79;
          }
          else
          {
            uint64_t v88 = *(void **)(v77 + 24);
            uint64_t v89 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v80, v81, v82, v83);
            uint64_t v94 = objc_msgSend_UUIDString(v89, v90, v91, v92, v93);
            uint64_t v98 = objc_msgSend_substringToIndex_(v94, v95, 5, v96, v97);
            uint64_t v103 = objc_msgSend_description(v79, v99, v100, v101, v102);
            objc_msgSend_stringWithFormat_(v88, v104, @"FAILED TO CONVERT [uuid=%@, desc=<%@>]", v105, v106, v98, v103);
            id v87 = (id)objc_claimAutoreleasedReturnValue();

            unint64_t v77 = 0x1E4F29000uLL;
          }
          uint64_t v107 = objc_msgSend_objectForKey_(v146, v84, (uint64_t)v79, v85, v86);
          uint64_t v112 = sub_1B4F59CC8(v107, v147, a3);
          if (!v112)
          {
            uint64_t v113 = *(void **)(v77 + 24);
            uint64_t v114 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v108, v109, v110, v111);
            uint64_t v119 = objc_msgSend_UUIDString(v114, v115, v116, v117, v118);
            uint64_t v123 = objc_msgSend_substringToIndex_(v119, v120, 5, v121, v122);
            uint64_t v128 = objc_msgSend_description(v107, v124, v125, v126, v127);
            uint64_t v112 = objc_msgSend_stringWithFormat_(v113, v129, @"FAILED TO CONVERT [uuid=%@, desc=<%@>]", v130, v131, v123, v128);

            unint64_t v77 = 0x1E4F29000;
          }
          objc_msgSend_setObject_forKey_(v149, v108, (uint64_t)v112, (uint64_t)v87, v111);
        }
        uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v132, (uint64_t)&v150, (uint64_t)v154, 16);
      }
      while (v76);
    }
  }
  id v9 = v141;
  id v4 = v142;
LABEL_35:

  return v149;
}

id CWFConvertObjectToJSON(void *a1, void *a2)
{
  return sub_1B4F59CC8(a1, a2, 1u);
}

uint64_t CWFStrongestSecurityType(__int16 a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x80) != 0) {
    return 128;
  }
  if ((a1 & 0x20) != 0) {
    return 32;
  }
  if ((a1 & 8) != 0) {
    return 8;
  }
  if ((a1 & 2) != 0 && a2 == 2) {
    return 2;
  }
  if ((a1 & 1) != 0 && a3 == 5) {
    return 1;
  }
  uint64_t v4 = 16;
  uint64_t v5 = 4;
  if ((a1 & 4) == 0) {
    uint64_t v5 = 2;
  }
  if ((a1 & 6) == 0) {
    uint64_t v5 = 1;
  }
  uint64_t v6 = a1 & 0x200;
  if ((a1 & 0x100) != 0) {
    uint64_t v6 = 256;
  }
  if ((a1 & 7) == 0) {
    uint64_t v5 = v6;
  }
  if ((a1 & 0x10) == 0) {
    uint64_t v4 = v5;
  }
  if ((a1 & 0x40) != 0) {
    return 64;
  }
  else {
    return v4;
  }
}

uint64_t CWFWeakestSecurityType(__int16 a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x200) != 0) {
    return 512;
  }
  if ((a1 & 0x100) != 0) {
    return 256;
  }
  if ((a1 & 1) != 0 && a3 != 5) {
    return 1;
  }
  if ((a1 & 2) != 0 && a2 != 2) {
    return 2;
  }
  if ((a1 & 4) != 0) {
    return 4;
  }
  if ((a1 & 0x10) != 0) {
    return 16;
  }
  uint64_t v3 = 64;
  if ((a1 & 0x40) == 0) {
    uint64_t v3 = 1;
  }
  if ((a1 & 0x41) == 0) {
    uint64_t v3 = 2;
  }
  if ((a1 & 0x43) == 0)
  {
    if ((a1 & 8) != 0)
    {
      return 8;
    }
    else
    {
      uint64_t v3 = a1 & 0x80;
      if ((a1 & 0x20) != 0) {
        return 32;
      }
    }
  }
  return v3;
}

uint64_t CWFCompareSecurityType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 != a4)
  {
    if (a1 == 128 || a4 == 128)
    {
      BOOL v6 = a1 == 128;
      goto LABEL_38;
    }
    if (a1 == 32 || a4 == 32)
    {
      BOOL v6 = a1 == 32;
      goto LABEL_38;
    }
    if (a1 == 8 || a4 == 8)
    {
      BOOL v6 = a1 == 8;
      goto LABEL_38;
    }
    if (a1 == 2 && a3 == 2) {
      return 1;
    }
    if (a4 != 2 || a6 != 2)
    {
      if (a1 == 1 && a2 == 5) {
        return 1;
      }
      if (a4 != 1 || a5 != 5)
      {
        if (a1 == 64 || a4 == 64)
        {
          BOOL v6 = a1 == 64;
        }
        else if (a1 == 16 || a4 == 16)
        {
          BOOL v6 = a1 == 16;
        }
        else if (a1 == 4 || a4 == 4)
        {
          BOOL v6 = a1 == 4;
        }
        else
        {
          if (a1 != 2 && a4 != 2)
          {
            if (a1 == 1 || a4 == 1)
            {
              if (a1 == 1) {
                return 1;
              }
              else {
                return -1;
              }
            }
            if (a4 == 256) {
              uint64_t v7 = -1;
            }
            else {
              uint64_t v7 = 0;
            }
            BOOL v8 = a1 == 256;
            goto LABEL_27;
          }
          BOOL v6 = a1 == 2;
        }
LABEL_38:
        uint64_t v7 = 1;
        if (!v6) {
          return -1;
        }
        return v7;
      }
    }
    return -1;
  }
  if (a1 == 2 && ((a6 - 1) | (unint64_t)(a3 - 1)) <= 1)
  {
    BOOL v6 = a3 == 2;
    goto LABEL_38;
  }
  uint64_t v7 = 0;
  if (a1 != 1 || (unint64_t)(a2 - 1) > 4 || (unint64_t)(a5 - 1) > 4) {
    return v7;
  }
  if (a2 == 2 || a5 == 2)
  {
    BOOL v6 = a2 == 2;
    goto LABEL_38;
  }
  if (a2 == 4 || a5 == 4)
  {
    BOOL v6 = a2 == 4;
    goto LABEL_38;
  }
  if (a2 == 1 || a5 == 1)
  {
    if (a2 == 1) {
      return 1;
    }
    else {
      return -1;
    }
  }
  if (a5 == 3) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = a2 == 3;
LABEL_27:
  if (v8) {
    return 1;
  }
  return v7;
}

uint64_t CWFFastestPHYMode(__int16 a1)
{
  int v1 = a1 & 4;
  if ((a1 & 8) != 0) {
    int v1 = 8;
  }
  if ((a1 & 2) != 0) {
    int v2 = 2;
  }
  else {
    int v2 = v1;
  }
  if ((a1 & 0x10) != 0) {
    int v3 = 16;
  }
  else {
    int v3 = v2;
  }
  if ((a1 & 0x80) != 0) {
    unsigned int v4 = 128;
  }
  else {
    unsigned int v4 = v3;
  }
  if ((a1 & 0x100) != 0) {
    return 256;
  }
  else {
    return v4;
  }
}

uint64_t CWFSlowestPHYMode(__int16 a1)
{
  int v1 = a1 & 0x100;
  if ((a1 & 0x80) != 0) {
    int v1 = 128;
  }
  if ((a1 & 0x10) != 0) {
    int v2 = 16;
  }
  else {
    int v2 = v1;
  }
  if ((a1 & 2) != 0) {
    int v3 = 2;
  }
  else {
    int v3 = v2;
  }
  if ((a1 & 8) != 0) {
    unsigned int v4 = 8;
  }
  else {
    unsigned int v4 = v3;
  }
  if ((a1 & 4) != 0) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t CWFComparePHYMode(int a1, int a2)
{
  if (a1 == a2) {
    return 0;
  }
  if (a1 == 256 || a2 == 256)
  {
    BOOL v4 = a1 == 256;
    goto LABEL_24;
  }
  if (a1 == 128 || a2 == 128)
  {
    BOOL v4 = a1 == 128;
    goto LABEL_24;
  }
  if (a1 == 16 || a2 == 16)
  {
    BOOL v4 = a1 == 16;
    goto LABEL_24;
  }
  if (a1 == 2 || a2 == 2)
  {
    BOOL v4 = a1 == 2;
    goto LABEL_24;
  }
  if (a1 == 8 || a2 == 8)
  {
    BOOL v4 = a1 == 8;
LABEL_24:
    if (v4) {
      return 1;
    }
    else {
      return -1;
    }
  }
  if (a2 == 4) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 0;
  }
  if (a1 == 4) {
    return 1;
  }
  else {
    return v3;
  }
}

uint64_t CWFScanResultHas6GHzOnlyBSS(void *a1, void *a2, void *a3)
{
  uint64_t v266 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v226 = a2;
  id v6 = a3;
  uint64_t v11 = (void (**)(void, void))v6;
  uint64_t v12 = 0;
  long long v227 = v5;
  if (v5 && v6)
  {
    uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10);
    long long v231 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17);
    if (v226)
    {
      uint64_t v22 = objc_msgSend_mutableCopy(v226, v18, v19, v20, v21);
    }
    else
    {
      uint64_t v22 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21);
    }
    id v26 = v22;
    objc_msgSend_addObject_(v22, v23, (uint64_t)v5, v24, v25);
    unint64_t v27 = 0x1E60BA000uLL;
    id v28 = [CWFScanResult alloc];
    uint64_t v29 = ((void (**)(void, id))v11)[2](v11, v5);
    uint64_t v32 = objc_msgSend_initWithScanRecord_includeProperties_(v28, v30, (uint64_t)v29, 0, v31);

    long long v260 = 0u;
    long long v261 = 0u;
    long long v258 = 0u;
    long long v259 = 0u;
    id obj = v26;
    uint64_t v233 = v32;
    int v234 = v11;
    uint64_t v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v258, (uint64_t)v265, 16);
    if (v238)
    {
      uint64_t v235 = *(void *)v259;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v259 != v235) {
            objc_enumerationMutation(obj);
          }
          uint64_t v244 = v34;
          uint64_t v35 = *(void *)(*((void *)&v258 + 1) + 8 * v34);
          context = (void *)MEMORY[0x1BA995D10]();
          uint64_t v36 = v11[2](v11, v35);
          id v37 = objc_alloc(*(Class *)(v27 + 2904));
          uint64_t v240 = (void *)v36;
          uint64_t v40 = objc_msgSend_initWithScanRecord_includeProperties_(v37, v38, v36, 0, v39);
          uint64_t v45 = objc_msgSend_channel(v40, v41, v42, v43, v44);
          if (objc_msgSend_is6GHz(v45, v46, v47, v48, v49))
          {
          }
          else
          {
            uint64_t v58 = objc_msgSend_RNRBSSList(v40, v50, v51, v52, v53);
            uint64_t v63 = objc_msgSend_count(v58, v59, v60, v61, v62);

            if (v63) {
              objc_msgSend_addObject_(v231, v54, (uint64_t)v40, v56, v57);
            }
          }
          uint64_t v64 = objc_msgSend_channel(v40, v54, v55, v56, v57);
          int v69 = objc_msgSend_is6GHz(v64, v65, v66, v67, v68);

          if (v69)
          {
            uint64_t v74 = objc_msgSend_SSID(v32, v70, v71, v72, v73);
            if (v74)
            {
              uint64_t v79 = (void *)v74;
              uint64_t v80 = objc_msgSend_SSID(v40, v75, v76, v77, v78);
              if (!v80)
              {

                goto LABEL_32;
              }
              uint64_t v85 = (void *)v80;
              uint64_t v86 = objc_msgSend_SSID(v32, v81, v82, v83, v84);
              uint64_t v91 = objc_msgSend_SSID(v40, v87, v88, v89, v90);
              int isEqual = objc_msgSend_isEqual_(v86, v92, (uint64_t)v91, v93, v94);

              if (isEqual)
              {
                uint64_t v100 = objc_msgSend_supportedSecurityTypes(v32, v96, v97, v98, v99);
                if ((objc_msgSend_supportedSecurityTypes(v40, v101, v102, v103, v104) & v100) != 0)
                {
                  unint64_t v109 = objc_msgSend_age(v40, v105, v106, v107, v108);
                  if (v109 > objc_msgSend_age(v32, v110, v111, v112, v113)
                    || (uint64_t v118 = objc_msgSend_age(v32, v114, v115, v116, v117),
                        (unint64_t)(v118 - objc_msgSend_age(v40, v119, v120, v121, v122)) <= 0x7530))
                  {
                    if (!objc_msgSend_count(v13, v114, v115, v116, v117)) {
                      goto LABEL_30;
                    }
                    uint64_t v126 = 0;
                    while (1)
                    {
                      uint64_t v127 = (void *)MEMORY[0x1BA995D10]();
                      uint64_t v131 = objc_msgSend_objectAtIndexedSubscript_(v13, v128, v126, v129, v130);
                      uint64_t v136 = objc_msgSend_BSSID(v40, v132, v133, v134, v135);
                      if (v136)
                      {
                        id v141 = (void *)v136;
                        uint64_t v142 = objc_msgSend_BSSID(v131, v137, v138, v139, v140);
                        if (v142)
                        {
                          id v147 = (void *)v142;
                          uint64_t v148 = objc_msgSend_BSSID(v40, v143, v144, v145, v146);
                          long long v153 = objc_msgSend_BSSID(v131, v149, v150, v151, v152);
                          int v157 = objc_msgSend_isEqual_(v148, v154, (uint64_t)v153, v155, v156);

                          if (v157)
                          {
                            int hasNon6GHzRNRChannel = objc_msgSend_hasNon6GHzRNRChannel(v40, v158, v159, v160, v161);
                            if (!hasNon6GHzRNRChannel
                              || objc_msgSend_hasNon6GHzRNRChannel(v131, v168, v169, v170, v171))
                            {

LABEL_31:
                              uint64_t v32 = v233;
                              uint64_t v11 = v234;
                              unint64_t v27 = 0x1E60BA000;
                              break;
                            }
                            objc_msgSend_removeObjectAtIndex_(v13, v172, v126, v173, v174);

LABEL_30:
                            objc_msgSend_addObject_(v13, v123, (uint64_t)v40, v124, v125);
                            goto LABEL_31;
                          }
                        }
                        else
                        {
                        }
                      }

                      if (++v126 >= (unint64_t)objc_msgSend_count(v13, v162, v163, v164, v165)) {
                        goto LABEL_30;
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_32:

          uint64_t v34 = v244 + 1;
        }
        while (v244 + 1 != v238);
        uint64_t v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v166, (uint64_t)&v258, (uint64_t)v265, 16);
        uint64_t v238 = v175;
      }
      while (v175);
    }

    long long v256 = 0u;
    long long v257 = 0u;
    long long v254 = 0u;
    long long v255 = 0u;
    id v228 = v13;
    uint64_t v239 = objc_msgSend_countByEnumeratingWithState_objects_count_(v228, v176, (uint64_t)&v254, (uint64_t)v264, 16);
    if (v239)
    {
      uint64_t v237 = *(void *)v255;
      while (2)
      {
        for (uint64_t i = 0; i != v239; ++i)
        {
          if (*(void *)v255 != v237) {
            objc_enumerationMutation(v228);
          }
          long long v182 = *(void **)(*((void *)&v254 + 1) + 8 * i);
          if ((objc_msgSend_hasNon6GHzRNRChannel(v182, v177, v178, v179, v180) & 1) == 0)
          {
            long long v252 = 0u;
            long long v253 = 0u;
            long long v250 = 0u;
            long long v251 = 0u;
            id contexta = v231;
            uint64_t v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(contexta, v183, (uint64_t)&v250, (uint64_t)v263, 16);
            if (v230)
            {
              uint64_t v188 = *(void *)v251;
              uint64_t v236 = i;
              uint64_t v229 = *(void *)v251;
              do
              {
                uint64_t v189 = 0;
                do
                {
                  if (*(void *)v251 != v188) {
                    objc_enumerationMutation(contexta);
                  }
                  uint64_t v241 = v189;
                  uint64_t v190 = *(void **)(*((void *)&v250 + 1) + 8 * v189);
                  long long v246 = 0u;
                  long long v247 = 0u;
                  long long v248 = 0u;
                  long long v249 = 0u;
                  uint64_t v245 = v190;
                  uint64_t v191 = objc_msgSend_RNRBSSList(v190, v184, v185, v186, v187);
                  uint64_t v193 = objc_msgSend_countByEnumeratingWithState_objects_count_(v191, v192, (uint64_t)&v246, (uint64_t)v262, 16);
                  if (v193)
                  {
                    uint64_t v198 = v193;
                    uint64_t v199 = *(void *)v247;
                    do
                    {
                      for (uint64_t j = 0; j != v198; ++j)
                      {
                        if (*(void *)v247 != v199) {
                          objc_enumerationMutation(v191);
                        }
                        uint64_t v201 = *(void **)(*((void *)&v246 + 1) + 8 * j);
                        uint64_t v206 = objc_msgSend_shortSSID(v201, v194, v195, v196, v197);
                        if (!v206)
                        {
                          if (objc_msgSend_isSameSSID(v201, v202, v203, v204, v205)) {
                            uint64_t v206 = objc_msgSend_shortSSID(v245, v202, v203, v204, v205);
                          }
                          else {
                            uint64_t v206 = 0;
                          }
                        }
                        if (v206 == objc_msgSend_shortSSID(v182, v202, v203, v204, v205))
                        {
                          uint64_t v207 = objc_msgSend_BSSID(v201, v194, v195, v196, v197);
                          if (v207)
                          {
                            uint64_t v208 = (void *)v207;
                            uint64_t v209 = objc_msgSend_BSSID(v182, v194, v195, v196, v197);
                            if (v209)
                            {
                              uint64_t v214 = (void *)v209;
                              v215 = objc_msgSend_BSSID(v201, v210, v211, v212, v213);
                              uint64_t v220 = objc_msgSend_BSSID(v182, v216, v217, v218, v219);
                              int v224 = objc_msgSend_isEqual_(v215, v221, (uint64_t)v220, v222, v223);

                              if (v224)
                              {

                                uint64_t v32 = v233;
                                uint64_t v11 = v234;
                                uint64_t i = v236;
                                goto LABEL_71;
                              }
                            }
                            else
                            {
                            }
                          }
                        }
                      }
                      uint64_t v198 = objc_msgSend_countByEnumeratingWithState_objects_count_(v191, v194, (uint64_t)&v246, (uint64_t)v262, 16);
                    }
                    while (v198);
                  }

                  uint64_t v189 = v241 + 1;
                  uint64_t v188 = v229;
                  uint64_t v32 = v233;
                  uint64_t v11 = v234;
                }
                while (v241 + 1 != v230);
                uint64_t v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(contexta, v184, (uint64_t)&v250, (uint64_t)v263, 16);
              }
              while (v230);
            }

            uint64_t v12 = 1;
            goto LABEL_75;
          }
LABEL_71:
          ;
        }
        uint64_t v239 = objc_msgSend_countByEnumeratingWithState_objects_count_(v228, v177, (uint64_t)&v254, (uint64_t)v264, 16);
        if (v239) {
          continue;
        }
        break;
      }
    }
    uint64_t v12 = 0;
LABEL_75:
  }
  return v12;
}

id CWFFilteredANQPResults(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v80 = objc_msgSend_maximumAge(v4, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_minimumTimestamp(v4, v9, v10, v11, v12);
  if (v3)
  {
    unint64_t v18 = v13;
    uint64_t v19 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17);
    if (objc_msgSend_count(v3, v20, v21, v22, v23))
    {
      id v79 = v4;
      unint64_t v28 = 0;
      if (v80) {
        BOOL v29 = v18 == 0;
      }
      else {
        BOOL v29 = 0;
      }
      int v30 = v29;
      do
      {
        uint64_t v31 = (void *)MEMORY[0x1BA995D10]();
        uint64_t v35 = objc_msgSend_objectAtIndexedSubscript_(v3, v32, v28, v33, v34);
        uint64_t v40 = objc_msgSend_ANQPResponse(v35, v36, v37, v38, v39);
        uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v40, v41, @"TIMESTAMP", v42, v43);
        unint64_t v49 = objc_msgSend_unsignedLongLongValue(v44, v45, v46, v47, v48);

        if (v30) {
          BOOL v54 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - v49 > v80;
        }
        else {
          BOOL v54 = 0;
        }
        BOOL v55 = v49 >= v18 || v18 == 0;
        if (!v55 || v54)
        {
          uint64_t v56 = objc_msgSend_scanRecord(v35, v50, v51, v52, v53, v79);
          uint64_t v61 = objc_msgSend_mutableCopy(v56, v57, v58, v59, v60);

          objc_msgSend_setObject_forKeyedSubscript_(v61, v62, 0, @"ANQP_PARSED", v63);
          uint64_t v64 = [CWFScanResult alloc];
          int v69 = objc_msgSend_matchingKnownNetworkProfile(v35, v65, v66, v67, v68);
          uint64_t v71 = objc_msgSend_initWithScanRecord_knownNetworkProfile_includeProperties_(v64, v70, (uint64_t)v61, (uint64_t)v69, 0);

          uint64_t v35 = (void *)v71;
        }
        objc_msgSend_addObject_(v19, v50, (uint64_t)v35, v52, v53, v79);

        ++v28;
      }
      while (v28 < objc_msgSend_count(v3, v72, v73, v74, v75));
      id v4 = v79;
    }
    uint64_t v76 = objc_msgSend_copy(v19, v24, v25, v26, v27);
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v76 = objc_msgSend_copy(0, v14, v15, v16, v17);
  }
  uint64_t v77 = (void *)v76;

  return v77;
}

id sub_1B4F5B02C(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    uint64_t v7 = objc_msgSend_channel(v2, v3, v4, v5, v6);
    uint64_t v12 = objc_msgSend_band(v2, v8, v9, v10, v11);

    a1 = objc_msgSend_channelWithNumber_band_width_(CWFChannel, v13, v7, v12, 0);
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_1B4F5B0A4(void *a1, void *a2)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  uint64_t v10 = objc_msgSend_channel(v5, v6, v7, v8, v9);
  int v15 = objc_msgSend_is6GHz(v10, v11, v12, v13, v14);

  if (!v15) {
    goto LABEL_26;
  }
  uint64_t v20 = objc_msgSend_channel(v4, v16, v17, v18, v19);
  if (!objc_msgSend_is6GHz(v20, v21, v22, v23, v24))
  {

    goto LABEL_26;
  }
  int hasNon6GHzRNRChannel = objc_msgSend_hasNon6GHzRNRChannel(v4, v25, v26, v27, v28);

  if (!hasNon6GHzRNRChannel)
  {
LABEL_26:
    id v88 = 0;
    uint64_t v56 = 0;
    id v38 = 0;
    goto LABEL_28;
  }
  uint64_t v34 = objc_msgSend_scanRecord(v4, v30, v31, v32, v33);
  objc_msgSend_objectForKeyedSubscript_(v34, v35, @"ORIG_RNR_CHANNEL_LIST", v36, v37);
  id v38 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_count(v38, v39, v40, v41, v42))
  {
    id v88 = 0;
    uint64_t v56 = 0;
    goto LABEL_28;
  }
  uint64_t v47 = objc_msgSend_scanRecord(v5, v43, v44, v45, v46);
  uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(v47, v48, @"ORIG_RNR_CHANNEL_LIST", v49, v50);
  uint64_t v56 = objc_msgSend_mutableCopy(v51, v52, v53, v54, v55);

  if (!v56)
  {
    uint64_t v56 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v57, v58, v59, v60);
    if (!v56) {
      goto LABEL_24;
    }
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v38 = v38;
  id v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v61, (uint64_t)&v92, (uint64_t)v96, 16);
  if (!v65)
  {

    goto LABEL_21;
  }
  char v66 = 0;
  uint64_t v67 = *(void *)v93;
  do
  {
    for (uint64_t i = 0; i != v65; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v93 != v67) {
        objc_enumerationMutation(v38);
      }
      uint64_t v69 = *(void *)(*((void *)&v92 + 1) + 8 * i);
      if ((objc_msgSend_containsObject_(v56, v62, v69, v63, v64, (void)v92) & 1) == 0)
      {
        objc_msgSend_addObject_(v56, v62, v69, v63, v64);
        char v66 = 1;
      }
    }
    id v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v62, (uint64_t)&v92, (uint64_t)v96, 16);
  }
  while (v65);

  if ((v66 & 1) == 0)
  {
LABEL_24:
    id v88 = 0;
LABEL_28:
    id v65 = 0;
    goto LABEL_22;
  }
  uint64_t v74 = objc_msgSend_scanRecord(v5, v70, v71, v72, v73);
  id v65 = objc_msgSend_mutableCopy(v74, v75, v76, v77, v78);

  if (!v65)
  {
LABEL_21:
    id v88 = 0;
    goto LABEL_22;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v65, v79, (uint64_t)v56, @"ORIG_RNR_CHANNEL_LIST", v80);
  uint64_t v81 = [CWFScanResult alloc];
  uint64_t v86 = objc_msgSend_matchingKnownNetworkProfile(v5, v82, v83, v84, v85);
  id v88 = (id)objc_msgSend_initWithScanRecord_knownNetworkProfile_includeProperties_(v81, v87, (uint64_t)v65, (uint64_t)v86, 0);

  if (!v88)
  {
LABEL_22:
    uint64_t v89 = v5;
    goto LABEL_23;
  }
  id v88 = v88;

  uint64_t v89 = v88;
LABEL_23:
  id v90 = v89;

  return v90;
}

uint64_t CWFKnownNetworkAssociatedDuringAWDLRealTimeMode(void *a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v9 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6, v7, v8);
  int v10 = _os_feature_enabled_impl();
  uint64_t v15 = 0;
  if (v3 && v10)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v16 = objc_msgSend_BSSList(v3, v11, v12, v13, v14, 0);
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v67, (uint64_t)v71, 16);
    if (v18)
    {
      uint64_t v23 = v18;
      uint64_t v24 = *(void *)v68;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v68 != v24) {
            objc_enumerationMutation(v16);
          }
          uint64_t v26 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          objc_msgSend_timeIntervalSinceReferenceDate(v9, v19, v20, v21, v22);
          double v28 = v27;
          uint64_t v33 = objc_msgSend_AWDLRealTimeModeTimestamp(v26, v29, v30, v31, v32);
          objc_msgSend_timeIntervalSinceReferenceDate(v33, v34, v35, v36, v37);
          double v39 = v28 - v38;

          if (v39 < 604800.0)
          {
            uint64_t v40 = objc_msgSend_location(v26, v19, v20, v21, v22);
            uint64_t v45 = (void *)v40;
            if (!v4
              || !v40
              || (objc_msgSend_horizontalAccuracy(v4, v41, v42, v43, v44), v50 < 0.0)
              || (objc_msgSend_horizontalAccuracy(v4, v46, v47, v48, v49), v55 > 100.0)
              || (objc_msgSend_horizontalAccuracy(v45, v51, v52, v53, v54), v60 < 0.0)
              || (objc_msgSend_horizontalAccuracy(v45, v56, v57, v58, v59), v64 > 100.0)
              || (objc_msgSend_distanceFromLocation_(v45, v61, (uint64_t)v4, v62, v63), v65 <= 300.0))
            {

              uint64_t v15 = 1;
              goto LABEL_22;
            }
          }
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v67, (uint64_t)v71, 16);
        uint64_t v15 = 0;
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
LABEL_22:
  }
  return v15;
}

uint64_t sub_1B4F5B5CC(void *a1, void *a2, uint64_t a3, unint64_t *a4)
{
  id v6 = a1;
  id v7 = a2;
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (v6 && v7)
  {
    uint64_t v10 = 0;
    if (a3)
    {
      id v11 = v6;
      uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15);
      id v17 = v8;
      uint64_t v22 = objc_msgSend_bytes(v17, v18, v19, v20, v21);
      if (objc_msgSend_length(v11, v23, v24, v25, v26))
      {
        uint64_t v76 = a4;
        uint64_t v77 = v8;
        id v78 = v6;
        unint64_t v31 = 0;
        uint64_t v32 = 0;
        uint64_t v9 = 0;
        unint64_t v82 = 0;
        uint64_t v83 = 0;
        id v80 = v17;
        uint64_t v81 = v16;
        do
        {
          if (objc_msgSend_length(v17, v27, v28, v29, v30))
          {
            unint64_t v37 = 0;
            unint64_t v84 = v31;
            do
            {
              uint64_t v38 = v32 + v31;
              if (v32 + v31 >= objc_msgSend_length(v11, v33, v34, v35, v36)) {
                break;
              }
              if (*(unsigned __int8 *)(v16 + v38) == *(unsigned __int8 *)(v22 + v37))
              {
                id v39 = v11;
                uint64_t v40 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v33, v32 + v31, v35, v36);
                uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v9, v41, (uint64_t)v40, v42, v43);
                uint64_t v48 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v45, v37, v46, v47);
                uint64_t v52 = v9;
                char v53 = objc_msgSend_containsObject_(v44, v49, (uint64_t)v48, v50, v51);

                if (v53)
                {
                  uint64_t v32 = 0;
                  uint64_t v16 = v81;
                  id v11 = v39;
                  uint64_t v9 = v52;
                }
                else
                {
                  uint64_t v9 = v52;
                  if (!v52)
                  {
                    uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v33, v34, v35, v36);
                  }
                  uint64_t v54 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v33, v38, v35, v36);
                  uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v9, v55, (uint64_t)v54, v56, v57);

                  id v11 = v39;
                  if (!v58)
                  {
                    uint64_t v58 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v59, v60, v61, v62);
                    char v66 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v63, v38, v64, v65);
                    objc_msgSend_setObject_forKeyedSubscript_(v9, v67, (uint64_t)v58, (uint64_t)v66, v68);
                  }
                  long long v69 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v59, v37, v61, v62);
                  objc_msgSend_addObject_(v58, v70, (uint64_t)v69, v71, v72);

                  if (v82 <= v32 + 1) {
                    unint64_t v73 = v32 + 1;
                  }
                  else {
                    unint64_t v73 = v82;
                  }
                  uint64_t v74 = v83;
                  if (v32 + 1 == a3) {
                    uint64_t v74 = v83 + 1;
                  }
                  unint64_t v82 = v73;
                  uint64_t v83 = v74;

                  ++v32;
                  uint64_t v16 = v81;
                }
                id v17 = v80;
                unint64_t v31 = v84;
              }
              else
              {
                uint64_t v32 = 0;
              }
              ++v37;
            }
            while (v37 < objc_msgSend_length(v17, v33, v34, v35, v36));
          }
          ++v31;
        }
        while (v31 < objc_msgSend_length(v11, v33, v34, v35, v36));
        if (v76)
        {
          uint64_t v8 = v77;
          id v6 = v78;
          uint64_t v10 = v83;
          if (v83) {
            unint64_t *v76 = v82;
          }
        }
        else
        {
          uint64_t v8 = v77;
          id v6 = v78;
          uint64_t v10 = v83;
        }
      }
      else
      {
        uint64_t v9 = 0;
        uint64_t v10 = 0;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id CWFColocatedNetworksMatchingScanResult(void *a1, void *a2, void *a3)
{
  uint64_t v636 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v11 = a3;
  if (v5)
  {
    id v575 = v6;
    id v576 = v5;
    id v574 = v11;
    if (objc_msgSend_isWiFi6E(v5, v7, v8, v9, v10))
    {
      id v12 = v5;
      id v13 = v6;
      id v14 = v11;
      uint64_t v23 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v15, v16, v17, v18);
      v580 = v13;
      if (v13)
      {
        uint64_t v24 = objc_msgSend_SSID(v12, v19, v20, v21, v22);
        uint64_t v29 = objc_msgSend_length(v24, v25, v26, v27, v28);

        if (v29)
        {
          uint64_t v38 = v12;
          if ((objc_msgSend_isIBSS(v12, v30, v31, v32, v33) & 1) == 0
            && (objc_msgSend_isEAP(v12, v34, v35, v36, v37) & 1) == 0
            && (objc_msgSend_isWAPI(v12, v39, v40, v41, v42) & 1) == 0
            && (objc_msgSend_isWEP(v12, v43, v44, v45, v46) & 1) == 0
            && (objc_msgSend_isWPA(v12, v47, v48, v49, v50) & 1) == 0)
          {
            if (objc_msgSend_isOpen(v12, v51, v52, v53, v54)) {
              int isOWE = 1;
            }
            else {
              int isOWE = objc_msgSend_isOWE(v12, v55, v56, v57, v58);
            }
            if (objc_msgSend_isPSK(v12, v55, v56, v57, v58))
            {
              if (objc_msgSend_isWPA2(v12, v280, v281, v282, v283))
              {
                int v284 = 1;
LABEL_56:
                long long v625 = 0u;
                long long v626 = 0u;
                long long v623 = 0u;
                long long v624 = 0u;
                uint64_t v285 = objc_msgSend_RNRBSSList(v12, v280, v281, v282, v283);
                uint64_t v287 = objc_msgSend_countByEnumeratingWithState_objects_count_(v285, v286, (uint64_t)&v623, (uint64_t)v635, 16);
                id v600 = v12;
                v589 = v23;
                v590 = v14;
                int v595 = v284;
                if (!v287)
                {

                  goto LABEL_130;
                }
                uint64_t v292 = v287;
                char v293 = 0;
                id v581 = *(id *)v624;
                v577 = v285;
                while (1)
                {
                  uint64_t v294 = 0;
                  uint64_t v578 = v292;
                  do
                  {
                    if (*(id *)v624 != v581) {
                      objc_enumerationMutation(v285);
                    }
                    if (v293)
                    {

LABEL_192:
                      id v13 = 0;
                      v543 = v23;
                      objc_msgSend_removeAllObjects(v23, v417, v418, v419, v420);
                      goto LABEL_199;
                    }
                    BOOL v295 = *(void **)(*((void *)&v623 + 1) + 8 * v294);
                    uint64_t v597 = objc_msgSend_shortSSID(v295, v288, v289, v290, v291);
                    if (!v597
                      && (!objc_msgSend_isSameSSID(v295, v296, v297, v298, v299)
                       || (uint64_t v597 = objc_msgSend_shortSSID(v38, v288, v289, v290, v291)) == 0))
                    {
                      char v293 = 0;
                      goto LABEL_122;
                    }
                    long long v621 = 0u;
                    long long v622 = 0u;
                    long long v619 = 0u;
                    long long v620 = 0u;
                    id v591 = v580;
                    uint64_t v605 = objc_msgSend_countByEnumeratingWithState_objects_count_(v591, v300, (uint64_t)&v619, (uint64_t)&v631, 16);
                    if (!v605)
                    {
                      char v293 = 0;
                      goto LABEL_121;
                    }
                    uint64_t v583 = v294;
                    id obja = *(id *)v620;
LABEL_67:
                    uint64_t v305 = 0;
                    while (1)
                    {
                      if (*(id *)v620 != obja) {
                        objc_enumerationMutation(v591);
                      }
                      v306 = *(void **)(*((void *)&v619 + 1) + 8 * v305);
                      uint64_t v307 = objc_msgSend_SSID(v306, v301, v302, v303, v304);
                      if (v307)
                      {
                        uint64_t v308 = (void *)v307;
                        uint64_t v309 = objc_msgSend_SSID(v38, v301, v302, v303, v304);
                        if (v309)
                        {
                          uint64_t v314 = (void *)v309;
                          v315 = objc_msgSend_SSID(v306, v310, v311, v312, v313);
                          uint64_t v320 = objc_msgSend_SSID(v38, v316, v317, v318, v319);
                          char isEqual = objc_msgSend_isEqual_(v315, v321, (uint64_t)v320, v322, v323);

                          uint64_t v38 = v600;
                          if (isEqual) {
                            goto LABEL_116;
                          }
                        }
                        else
                        {
                        }
                      }
                      uint64_t v325 = objc_msgSend_SSID(v306, v301, v302, v303, v304);
                      uint64_t v330 = objc_msgSend_length(v325, v326, v327, v328, v329);

                      if (!v330) {
                        goto LABEL_116;
                      }
                      id v331 = objc_msgSend_channel(v306, v301, v302, v303, v304);
                      int v336 = objc_msgSend_is5GHz(v331, v332, v333, v334, v335);

                      if (!v336
                        || (objc_msgSend_isIBSS(v306, v301, v302, v303, v304) & 1) != 0
                        || (objc_msgSend_isEAP(v306, v301, v302, v303, v304) & 1) != 0
                        || (objc_msgSend_isWAPI(v306, v301, v302, v303, v304) & 1) != 0
                        || (objc_msgSend_isWEP(v306, v301, v302, v303, v304) & 1) != 0
                        || (objc_msgSend_isWPA(v306, v301, v302, v303, v304) & 1) != 0)
                      {
                        goto LABEL_116;
                      }
                      int v341 = (objc_msgSend_isOpen(v306, v301, v302, v303, v304) & 1) != 0
                           ? 1
                           : objc_msgSend_isOWE(v306, v337, v338, v339, v340);
                      int isPSK = objc_msgSend_isPSK(v306, v337, v338, v339, v340);
                      if (isPSK) {
                        break;
                      }
LABEL_89:
                      if ((v341 | isPSK) == 1) {
                        goto LABEL_90;
                      }
LABEL_116:
                      if (v605 == ++v305)
                      {
                        uint64_t v605 = objc_msgSend_countByEnumeratingWithState_objects_count_(v591, v301, (uint64_t)&v619, (uint64_t)&v631, 16);
                        if (!v605)
                        {
                          char v293 = 0;
                          goto LABEL_119;
                        }
                        goto LABEL_67;
                      }
                    }
                    if ((objc_msgSend_isWPA2(v306, v301, v302, v303, v304) & 1) == 0)
                    {
                      int isPSK = objc_msgSend_isWPA3(v306, v301, v302, v303, v304);
                      goto LABEL_89;
                    }
                    int isPSK = 1;
LABEL_90:
                    if (isOWE != v341 || ((v595 ^ isPSK) & 1) != 0) {
                      goto LABEL_116;
                    }
                    if (objc_msgSend_shortSSID(v306, v301, v302, v303, v304) == v597)
                    {
                      uint64_t v351 = objc_msgSend_BSSID(v306, v343, v344, v345, v346);
                      if (v351)
                      {
                        uint64_t v356 = objc_msgSend_BSSID(v295, v347, v348, v349, v350);
                        if (v356)
                        {
                          uint64_t v357 = objc_msgSend_BSSID(v306, v352, v353, v354, v355);
                          v362 = objc_msgSend_BSSID(v295, v358, v359, v360, v361);
                          if (objc_msgSend_isEqual_(v357, v363, (uint64_t)v362, v364, v365))
                          {
                            v587 = objc_msgSend_channel(v306, v366, v367, v368, v369);
                            uint64_t v374 = objc_msgSend_channel(v587, v370, v371, v372, v373);
                            uint64_t v379 = objc_msgSend_channel(v295, v375, v376, v377, v378);
                            if (v374 == objc_msgSend_channel(v379, v380, v381, v382, v383))
                            {
                              v585 = objc_msgSend_channel(v306, v384, v385, v386, v387);
                              int v392 = objc_msgSend_band(v585, v388, v389, v390, v391);
                              id v397 = objc_msgSend_channel(v295, v393, v394, v395, v396);
                              int v406 = v392 == objc_msgSend_band(v397, v398, v399, v400, v401)
                                   ? objc_msgSend_isColocatedAP(v295, v402, v403, v404, v405)
                                   : 0;
                            }
                            else
                            {
                              int v406 = 0;
                            }
                          }
                          else
                          {
                            int v406 = 0;
                          }

                          uint64_t v23 = v589;
                          id v14 = v590;
                        }
                        else
                        {
                          int v406 = 0;
                        }
                      }
                      else
                      {
                        int v406 = 0;
                      }

                      uint64_t v38 = v600;
                    }
                    else
                    {
                      int v406 = 0;
                    }
                    if (objc_msgSend_isColocatedAP(v295, v343, v344, v345, v346))
                    {
                      uint64_t v407 = objc_msgSend_RNRBSSList(v306, v301, v302, v303, v304);
                      int v411 = objc_msgSend_containsObject_(v407, v408, (uint64_t)v295, v409, v410);
                    }
                    else
                    {
                      int v411 = 0;
                    }
                    if ((v406 | v411) != 1) {
                      goto LABEL_116;
                    }
                    uint64_t v412 = sub_1B4F535A4(v306, v14);

                    if (!v412)
                    {
                      objc_msgSend_addObject_(v23, v413, (uint64_t)v306, v414, v415);
                      goto LABEL_116;
                    }
                    char v293 = 1;
LABEL_119:
                    int v284 = v595;
                    uint64_t v285 = v577;
                    uint64_t v292 = v578;
                    uint64_t v294 = v583;
LABEL_121:

LABEL_122:
                    ++v294;
                  }
                  while (v294 != v292);
                  uint64_t v416 = objc_msgSend_countByEnumeratingWithState_objects_count_(v285, v288, (uint64_t)&v623, (uint64_t)v635, 16);
                  uint64_t v292 = v416;
                  if (!v416)
                  {

                    if (v293) {
                      goto LABEL_192;
                    }
LABEL_130:
                    long long v617 = 0u;
                    long long v618 = 0u;
                    long long v615 = 0u;
                    long long v616 = 0u;
                    id v582 = v580;
                    uint64_t v584 = objc_msgSend_countByEnumeratingWithState_objects_count_(v582, v421, (uint64_t)&v615, (uint64_t)v630, 16);
                    int v426 = 0;
                    if (!v584) {
                      goto LABEL_194;
                    }
                    uint64_t v427 = *(void *)v616;
                    uint64_t v579 = *(void *)v616;
LABEL_132:
                    uint64_t v428 = 0;
LABEL_133:
                    if (*(void *)v616 != v427)
                    {
                      uint64_t v429 = v428;
                      objc_enumerationMutation(v582);
                      uint64_t v428 = v429;
                    }
                    if (v426)
                    {
                      int v426 = 1;
                      goto LABEL_194;
                    }
                    uint64_t v586 = v428;
                    uint64_t v430 = *(void **)(*((void *)&v615 + 1) + 8 * v428);
                    uint64_t v431 = objc_msgSend_SSID(v430, v422, v423, v424, v425);
                    v606 = v430;
                    if (v431)
                    {
                      id v432 = (void *)v431;
                      uint64_t v433 = objc_msgSend_SSID(v38, v422, v423, v424, v425);
                      if (v433)
                      {
                        id v438 = (void *)v433;
                        v439 = objc_msgSend_SSID(v430, v434, v435, v436, v437);
                        id v444 = objc_msgSend_SSID(v38, v440, v441, v442, v443);
                        char v448 = objc_msgSend_isEqual_(v439, v445, (uint64_t)v444, v446, v447);

                        uint64_t v430 = v606;
                        if (v448) {
                          goto LABEL_139;
                        }
                      }
                      else
                      {
                      }
                    }
                    uint64_t v449 = objc_msgSend_SSID(v430, v422, v423, v424, v425);
                    uint64_t v454 = objc_msgSend_length(v449, v450, v451, v452, v453);

                    if (!v454
                      || (objc_msgSend_channel(v430, v422, v423, v424, v425),
                          unint64_t v455 = objc_claimAutoreleasedReturnValue(),
                          int v460 = objc_msgSend_is5GHz(v455, v456, v457, v458, v459),
                          v455,
                          !v460)
                      || (objc_msgSend_isIBSS(v430, v422, v423, v424, v425) & 1) != 0
                      || (objc_msgSend_isEAP(v430, v422, v423, v424, v425) & 1) != 0
                      || (objc_msgSend_isWAPI(v430, v422, v423, v424, v425) & 1) != 0
                      || (objc_msgSend_isWEP(v430, v422, v423, v424, v425) & 1) != 0
                      || (objc_msgSend_isWPA(v430, v422, v423, v424, v425) & 1) != 0)
                    {
LABEL_139:
                      int v426 = 0;
                      goto LABEL_186;
                    }
                    if (objc_msgSend_isOpen(v430, v422, v423, v424, v425)) {
                      int v465 = 1;
                    }
                    else {
                      int v465 = objc_msgSend_isOWE(v430, v461, v462, v463, v464);
                    }
                    int isWPA3 = objc_msgSend_isPSK(v430, v461, v462, v463, v464);
                    if (isWPA3)
                    {
                      if (objc_msgSend_isWPA2(v430, v422, v423, v424, v425))
                      {
                        int isWPA3 = 1;
                        goto LABEL_156;
                      }
                      int isWPA3 = objc_msgSend_isWPA3(v430, v422, v423, v424, v425);
                    }
                    if ((v465 | isWPA3) != 1) {
                      goto LABEL_139;
                    }
LABEL_156:
                    int v426 = 0;
                    if (isOWE != v465 || ((v284 ^ isWPA3) & 1) != 0) {
                      goto LABEL_186;
                    }
                    long long v613 = 0u;
                    long long v614 = 0u;
                    long long v611 = 0u;
                    long long v612 = 0u;
                    long long v467 = objc_msgSend_RNRBSSList(v430, v422, v423, v424, v425);
                    uint64_t v469 = objc_msgSend_countByEnumeratingWithState_objects_count_(v467, v468, (uint64_t)&v611, (uint64_t)v628, 16);
                    if (!v469)
                    {
                      int v426 = 0;
                      goto LABEL_185;
                    }
                    uint64_t v474 = v469;
                    id v475 = *(id *)v612;
                    id objb = v467;
                    id v592 = *(id *)v612;
                    while (2)
                    {
                      uint64_t v476 = 0;
LABEL_161:
                      if (*(id *)v612 != v475) {
                        objc_enumerationMutation(v467);
                      }
                      uint64_t v477 = *(void **)(*((void *)&v611 + 1) + 8 * v476);
                      uint64_t v478 = objc_msgSend_shortSSID(v477, v470, v471, v472, v473);
                      if ((v478
                         || objc_msgSend_isSameSSID(v477, v470, v471, v472, v473)
                         && (uint64_t v478 = objc_msgSend_shortSSID(v430, v470, v471, v472, v473)) != 0)
                        && objc_msgSend_shortSSID(v38, v470, v471, v472, v473) == v478)
                      {
                        uint64_t v479 = objc_msgSend_BSSID(v38, v470, v471, v472, v473);
                        if (v479)
                        {
                          id v480 = (void *)v479;
                          uint64_t v481 = objc_msgSend_BSSID(v477, v470, v471, v472, v473);
                          if (!v481)
                          {

                            goto LABEL_180;
                          }
                          uint64_t v486 = (void *)v481;
                          v487 = objc_msgSend_BSSID(v38, v482, v483, v484, v485);
                          v492 = objc_msgSend_BSSID(v477, v488, v489, v490, v491);
                          if (!objc_msgSend_isEqual_(v487, v493, (uint64_t)v492, v494, v495))
                          {

                            long long v467 = objb;
                            uint64_t v430 = v606;
                            goto LABEL_180;
                          }
                          v598 = v487;
                          int8x16_t v500 = objc_msgSend_channel(v38, v496, v497, v498, v499);
                          uint64_t v505 = objc_msgSend_channel(v500, v501, v502, v503, v504);
                          v510 = objc_msgSend_channel(v477, v506, v507, v508, v509);
                          if (v505 == objc_msgSend_channel(v510, v511, v512, v513, v514))
                          {
                            long long v519 = objc_msgSend_channel(v38, v515, v516, v517, v518);
                            int v588 = objc_msgSend_band(v519, v520, v521, v522, v523);
                            long long v528 = objc_msgSend_channel(v477, v524, v525, v526, v527);
                            if (v588 == objc_msgSend_band(v528, v529, v530, v531, v532))
                            {
                              int isColocatedAP = objc_msgSend_isColocatedAP(v477, v533, v534, v535, v536);

                              uint64_t v38 = v600;
                              long long v467 = objb;
                              uint64_t v430 = v606;
                              id v475 = v592;
                              if (isColocatedAP)
                              {
                                v538 = sub_1B4F535A4(v606, v590);

                                if (v538)
                                {
                                  int v426 = 1;
                                  goto LABEL_183;
                                }
                                objc_msgSend_addObject_(v589, v539, (uint64_t)v606, v540, v541);
                              }
                              goto LABEL_180;
                            }

                            uint64_t v38 = v600;
                          }
                          else
                          {
                          }
                          long long v467 = objb;
                          uint64_t v430 = v606;
                          id v475 = v592;
                        }
                      }
LABEL_180:
                      if (v474 == ++v476)
                      {
                        uint64_t v474 = objc_msgSend_countByEnumeratingWithState_objects_count_(v467, v470, (uint64_t)&v611, (uint64_t)v628, 16);
                        if (v474) {
                          continue;
                        }
                        int v426 = 0;
LABEL_183:
                        id v14 = v590;
                        int v284 = v595;
                        uint64_t v427 = v579;
LABEL_185:

LABEL_186:
                        uint64_t v428 = v586 + 1;
                        if (v586 + 1 == v584)
                        {
                          uint64_t v542 = objc_msgSend_countByEnumeratingWithState_objects_count_(v582, v422, (uint64_t)&v615, (uint64_t)v630, 16);
                          uint64_t v584 = v542;
                          if (!v542)
                          {
LABEL_194:

                            v543 = v589;
                            if (objc_msgSend_count(v589, v544, v545, v546, v547))
                            {
                              v552 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v548, @"channel", 0, (uint64_t)&unk_1F0DA35B0);
                              v553 = (void *)MEMORY[0x1E4F29008];
                              v609[0] = MEMORY[0x1E4F143A8];
                              v609[1] = 3221225472;
                              v609[2] = sub_1B4F60B00;
                              v609[3] = &unk_1E60BB800;
                              id v554 = v38;
                              id v610 = v554;
                              v556 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v553, v555, 0, 0, (uint64_t)v609);
                              v557 = (void *)MEMORY[0x1E4F29008];
                              v607[0] = MEMORY[0x1E4F143A8];
                              v607[1] = 3221225472;
                              v607[2] = sub_1B4F60D38;
                              v607[3] = &unk_1E60BB800;
                              id v608 = v554;
                              v559 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v557, v558, 0, 0, (uint64_t)v607);
                              v561 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v560, 0, 0, (uint64_t)&unk_1F0DA2970);
                              v563 = objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E4F29008], v562, 0, 0, (uint64_t)sel_compareSupportedSecurityTypes_);
                              v566 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v564, @"RSSI", 0, v565);
                              v627[0] = v552;
                              v627[1] = v556;
                              v627[2] = v559;
                              v627[3] = v561;
                              v627[4] = v563;
                              v627[5] = v566;
                              v569 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v567, (uint64_t)v627, 6, v568);
                              objc_msgSend_sortedArrayUsingDescriptors_(v589, v570, (uint64_t)v569, v571, v572);
                              id v13 = (id)objc_claimAutoreleasedReturnValue();

                              id v14 = v590;
                              uint64_t v38 = v600;

                              if ((v426 & 1) == 0)
                              {
LABEL_199:

                                id v6 = v575;
                                id v5 = v576;
                                id v11 = v574;
                                goto LABEL_200;
                              }
                            }
                            else
                            {
                              id v13 = 0;
                              if (!v426) {
                                goto LABEL_199;
                              }
                            }
                            objc_msgSend_removeAllObjects(v589, v548, v549, v550, v551);
                            goto LABEL_199;
                          }
                          goto LABEL_132;
                        }
                        goto LABEL_133;
                      }
                      goto LABEL_161;
                    }
                  }
                }
              }
              int v284 = objc_msgSend_isWPA3(v12, v280, v281, v282, v283);
            }
            else
            {
              int v284 = 0;
            }
            if ((isOWE | v284) == 1) {
              goto LABEL_56;
            }
          }
          id v13 = 0;
LABEL_209:
          v543 = v23;
          goto LABEL_199;
        }
        id v13 = 0;
      }
      uint64_t v38 = v12;
      goto LABEL_209;
    }
    id v604 = v5;
    id v59 = v6;
    id v596 = v11;
    uint64_t v64 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v60, v61, v62, v63);
    int v65 = _os_feature_enabled_impl();
    id v13 = 0;
    v594 = v59;
    long long v70 = 0;
    if (!v59 || !v65) {
      goto LABEL_53;
    }
    uint64_t v71 = objc_msgSend_SSID(v604, v66, v67, v68, v69);
    uint64_t v76 = objc_msgSend_length(v71, v72, v73, v74, v75);

    if (!v76
      || (objc_msgSend_isIBSS(v604, v77, v78, v79, v80) & 1) != 0
      || (objc_msgSend_isEAP(v604, v81, v82, v83, v84) & 1) != 0
      || (objc_msgSend_isWAPI(v604, v85, v86, v87, v88) & 1) != 0
      || (objc_msgSend_isWEP(v604, v89, v90, v91, v92) & 1) != 0
      || (objc_msgSend_isWPA(v604, v93, v94, v95, v96) & 1) != 0)
    {
      id v13 = 0;
      long long v70 = 0;
      goto LABEL_53;
    }
    v599 = v64;
    LODWORD(v619) = 0;
    uint64_t v101 = (void *)MEMORY[0x1E4F28FE8];
    uint64_t v102 = objc_msgSend_BSSID(v604, v97, v98, v99, v100);
    uint64_t v106 = objc_msgSend_componentsSeparatedByString_(v102, v103, @":", v104, v105);
    uint64_t v111 = objc_msgSend_lastObject(v106, v107, v108, v109, v110);
    uint64_t v115 = objc_msgSend_scannerWithString_(v101, v112, (uint64_t)v111, v113, v114);
    objc_msgSend_scanHexInt_(v115, v116, (uint64_t)&v619, v117, v118);

    long long v70 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v119, v120, v121, v122);
    uint64_t v123 = NSString;
    uint64_t v128 = objc_msgSend_BSSID(v604, v124, v125, v126, v127);
    uint64_t v132 = objc_msgSend_substringToIndex_(v128, v129, 14, v130, v131);
    uint64_t v136 = objc_msgSend_stringWithFormat_(v123, v133, @"%@:%02x", v134, v135, v132, (v619 + 1));
    objc_msgSend_addObject_(v70, v137, (uint64_t)v136, v138, v139);

    uint64_t v140 = NSString;
    uint64_t v145 = objc_msgSend_BSSID(v604, v141, v142, v143, v144);
    id v149 = objc_msgSend_substringToIndex_(v145, v146, 14, v147, v148);
    long long v153 = objc_msgSend_stringWithFormat_(v140, v150, @"%@:%02x", v151, v152, v149, (v619 + 2));
    objc_msgSend_addObject_(v70, v154, (uint64_t)v153, v155, v156);

    int v157 = NSString;
    uint64_t v162 = objc_msgSend_BSSID(v604, v158, v159, v160, v161);
    uint64_t v166 = objc_msgSend_substringToIndex_(v162, v163, 14, v164, v165);
    uint64_t v170 = objc_msgSend_stringWithFormat_(v157, v167, @"%@:%02x", v168, v169, v166, (v619 - 1));
    objc_msgSend_addObject_(v70, v171, (uint64_t)v170, v172, v173);

    uint64_t v174 = NSString;
    uint64_t v179 = objc_msgSend_BSSID(v604, v175, v176, v177, v178);
    uint64_t v183 = objc_msgSend_substringToIndex_(v179, v180, 14, v181, v182);
    uint64_t v187 = objc_msgSend_stringWithFormat_(v174, v184, @"%@:%02x", v185, v186, v183, (v619 - 2));
    objc_msgSend_addObject_(v70, v188, (uint64_t)v187, v189, v190);

    long long v633 = 0u;
    long long v634 = 0u;
    long long v631 = 0u;
    long long v632 = 0u;
    id obj = v594;
    uint64_t v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v191, (uint64_t)&v631, (uint64_t)v635, 16);
    if (!v192) {
      goto LABEL_42;
    }
    uint64_t v197 = v192;
    uint64_t v198 = *(void *)v632;
LABEL_22:
    uint64_t v199 = 0;
    while (1)
    {
      if (*(void *)v632 != v198) {
        objc_enumerationMutation(obj);
      }
      uint64_t v200 = *(void **)(*((void *)&v631 + 1) + 8 * v199);
      uint64_t v201 = objc_msgSend_SSID(v200, v193, v194, v195, v196);
      if (!v201) {
        goto LABEL_30;
      }
      uint64_t v202 = (void *)v201;
      uint64_t v203 = v70;
      uint64_t v204 = objc_msgSend_SSID(v604, v193, v194, v195, v196);
      if (!v204) {
        break;
      }
      uint64_t v209 = (void *)v204;
      uint64_t v210 = objc_msgSend_SSID(v200, v205, v206, v207, v208);
      v215 = objc_msgSend_SSID(v604, v211, v212, v213, v214);
      char v219 = objc_msgSend_isEqual_(v210, v216, (uint64_t)v215, v217, v218);

      long long v70 = v203;
      if ((v219 & 1) == 0) {
        goto LABEL_30;
      }
LABEL_40:
      if (v197 == ++v199)
      {
        uint64_t v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v193, (uint64_t)&v631, (uint64_t)v635, 16);
        if (!v197)
        {
LABEL_42:
          int v249 = 0;
          goto LABEL_43;
        }
        goto LABEL_22;
      }
    }

LABEL_30:
    uint64_t v220 = objc_msgSend_SSID(v200, v193, v194, v195, v196);
    uint64_t v225 = objc_msgSend_length(v220, v221, v222, v223, v224);

    if (v225)
    {
      id v226 = objc_msgSend_channel(v200, v193, v194, v195, v196);
      int v231 = objc_msgSend_is5GHz(v226, v227, v228, v229, v230);

      if (v231)
      {
        if ((objc_msgSend_isIBSS(v200, v193, v194, v195, v196) & 1) == 0
          && (objc_msgSend_isEAP(v200, v193, v194, v195, v196) & 1) == 0
          && (objc_msgSend_isWAPI(v200, v193, v194, v195, v196) & 1) == 0
          && (objc_msgSend_isWEP(v200, v193, v194, v195, v196) & 1) == 0
          && (objc_msgSend_isWPA(v200, v193, v194, v195, v196) & 1) == 0)
        {
          objc_msgSend_isPSK(v200, v193, v194, v195, v196);
          objc_msgSend_isPSK(v604, v232, v233, v234, v235);
          uint64_t v240 = objc_msgSend_BSSID(v200, v236, v237, v238, v239);
          int v244 = objc_msgSend_containsObject_(v70, v241, (uint64_t)v240, v242, v243);

          if (v244)
          {
            uint64_t v245 = sub_1B4F535A4(v200, v596);

            if (v245)
            {
              int v249 = 1;
LABEL_43:
              uint64_t v64 = v599;

              if (objc_msgSend_count(v599, v250, v251, v252, v253))
              {
                long long v258 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v254, @"channel", 0, (uint64_t)&unk_1F0DA2830);
                long long v259 = (void *)MEMORY[0x1E4F29008];
                v628[0] = MEMORY[0x1E4F143A8];
                v628[1] = 3221225472;
                v628[2] = sub_1B4F61168;
                v628[3] = &unk_1E60BB800;
                id v260 = v604;
                id v629 = v260;
                uint64_t v262 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v259, v261, 0, 0, (uint64_t)v628);
                uint64_t v263 = (void *)MEMORY[0x1E4F29008];
                *(void *)&long long v623 = MEMORY[0x1E4F143A8];
                *((void *)&v623 + 1) = 3221225472;
                *(void *)&long long v624 = sub_1B4F613A0;
                *((void *)&v624 + 1) = &unk_1E60BB800;
                *(void *)&long long v625 = v260;
                uint64_t v265 = objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v263, v264, 0, 0, (uint64_t)&v623);
                objc_msgSend_sortDescriptorWithKey_ascending_comparator_(MEMORY[0x1E4F29008], v266, 0, 0, (uint64_t)&unk_1F0DA35D0);
                v268 = uint64_t v267 = v70;
                uint64_t v270 = objc_msgSend_sortDescriptorWithKey_ascending_selector_(MEMORY[0x1E4F29008], v269, 0, 0, (uint64_t)sel_compareSupportedSecurityTypes_);
                uint64_t v273 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v271, @"RSSI", 0, v272);
                v630[0] = v258;
                v630[1] = v262;
                v630[2] = v265;
                v630[3] = v268;
                v630[4] = v270;
                v630[5] = v273;
                v276 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v274, (uint64_t)v630, 6, v275);
                objc_msgSend_sortedArrayUsingDescriptors_(v599, v277, (uint64_t)v276, v278, v279);
                id v13 = (id)objc_claimAutoreleasedReturnValue();

                long long v70 = v267;
                uint64_t v64 = v599;

                id v6 = v575;
                id v5 = v576;
                id v11 = v574;
                if ((v249 & 1) == 0) {
                  goto LABEL_53;
                }
LABEL_52:
                objc_msgSend_removeAllObjects(v64, v254, v255, v256, v257);
              }
              else
              {
                id v13 = 0;
                id v6 = v575;
                id v5 = v576;
                id v11 = v574;
                if (v249) {
                  goto LABEL_52;
                }
              }
LABEL_53:

              goto LABEL_200;
            }
            objc_msgSend_addObject_(v599, v246, (uint64_t)v200, v247, v248);
          }
        }
      }
    }
    goto LABEL_40;
  }
  id v13 = 0;
LABEL_200:

  return v13;
}

uint64_t CWFCompareLowDataMode(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 == 1;
  if (a1 == 1) {
    uint64_t v2 = -1;
  }
  if (a1 == a2) {
    return 0;
  }
  else {
    return v2;
  }
}

uint64_t CWFKnownNetworkSupportsSeamlessSSIDTransition(void *a1, void *a2)
{
  v455[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v366 = CWFGetOSLog();
    if (v366)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v392 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1866;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (!v3)
  {
    uint64_t v368 = CWFGetOSLog();
    if (v368)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v393 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1868;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  uint64_t v9 = objc_msgSend_matchingKnownNetworkProfile(v3, v5, v6, v7, v8);

  if (!v9)
  {
    uint64_t v369 = CWFGetOSLog();
    if (v369)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v394 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1869;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (!v4)
  {
    uint64_t v370 = CWFGetOSLog();
    if (v370)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v395 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1870;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isOpen(v3, v10, v11, v12, v13))
  {
    uint64_t v371 = CWFGetOSLog();
    if (v371)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v396 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1873;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isEAP(v3, v14, v15, v16, v17))
  {
    uint64_t v372 = CWFGetOSLog();
    if (v372)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v397 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1874;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isWEP(v3, v18, v19, v20, v21))
  {
    uint64_t v373 = CWFGetOSLog();
    if (v373)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v398 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1875;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isWAPI(v3, v22, v23, v24, v25))
  {
    uint64_t v374 = CWFGetOSLog();
    if (v374)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v399 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1876;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isWPA(v3, v26, v27, v28, v29))
  {
    uint64_t v375 = CWFGetOSLog();
    if (v375)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v400 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1877;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isOWE(v3, v30, v31, v32, v33))
  {
    uint64_t v376 = CWFGetOSLog();
    if (v376)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v401 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1878;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  uint64_t v38 = objc_msgSend_matchingKnownNetworkProfile(v3, v34, v35, v36, v37);
  int isCaptive = objc_msgSend_isCaptive(v38, v39, v40, v41, v42);

  if (isCaptive)
  {
    uint64_t v377 = CWFGetOSLog();
    if (v377)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v402 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1879;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if ((objc_msgSend_isPSK(v3, v44, v45, v46, v47) & 1) == 0)
  {
    uint64_t v378 = CWFGetOSLog();
    if (v378)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v403 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1880;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if ((objc_msgSend_isWPA2(v3, v48, v49, v50, v51) & 1) == 0 && (objc_msgSend_isWPA3(v3, v52, v53, v54, v55) & 1) == 0)
  {
    uint64_t v390 = CWFGetOSLog();
    if (v390)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v419 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1881;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isOpen(v4, v52, v53, v54, v55))
  {
    uint64_t v379 = CWFGetOSLog();
    if (v379)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v404 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1883;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isEAP(v4, v56, v57, v58, v59))
  {
    char v380 = CWFGetOSLog();
    if (v380)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v405 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1884;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isWEP(v4, v60, v61, v62, v63))
  {
    uint64_t v381 = CWFGetOSLog();
    if (v381)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v406 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1885;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isWAPI(v4, v64, v65, v66, v67))
  {
    uint64_t v382 = CWFGetOSLog();
    if (v382)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v407 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1886;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isWPA(v4, v68, v69, v70, v71))
  {
    uint64_t v383 = CWFGetOSLog();
    if (v383)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v408 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1887;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isOWE(v4, v72, v73, v74, v75))
  {
    uint64_t v384 = CWFGetOSLog();
    if (v384)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v409 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1888;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isCaptive(v4, v76, v77, v78, v79))
  {
    uint64_t v385 = CWFGetOSLog();
    if (v385)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v410 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1889;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if ((objc_msgSend_isPSK(v4, v80, v81, v82, v83) & 1) == 0)
  {
    uint64_t v386 = CWFGetOSLog();
    if (v386)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v411 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1890;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if ((objc_msgSend_isWPA2(v4, v84, v85, v86, v87) & 1) == 0 && (objc_msgSend_isWPA3(v4, v88, v89, v90, v91) & 1) == 0)
  {
    uint64_t v391 = CWFGetOSLog();
    if (v391)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v420 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1891;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  uint64_t v92 = objc_msgSend_matchingKnownNetworkProfile(v3, v88, v89, v90, v91);
  v455[0] = v92;
  uint64_t v95 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v93, (uint64_t)v455, 1, v94);
  uint64_t v96 = sub_1B4F542B0(v3, v95);

  if (!v96)
  {
    uint64_t v387 = CWFGetOSLog();
    if (v387)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v412 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1894;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  if (objc_msgSend_isAutoJoinDisabled(v4, v97, v98, v99, v100))
  {
    uint64_t v388 = CWFGetOSLog();
    if (v388)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v413 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446722;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1897;
    LODWORD(v422) = 28;
    uint64_t v421 = &v439;
    goto LABEL_255;
  }
  uint64_t v105 = objc_msgSend_matchingKnownNetworkProfile(v3, v101, v102, v103, v104);
  int isPrivacyProxyEnabled = objc_msgSend_isPrivacyProxyEnabled(v105, v106, v107, v108, v109);
  int v115 = objc_msgSend_isPrivacyProxyEnabled(v4, v111, v112, v113, v114);

  if (isPrivacyProxyEnabled != v115)
  {
    uint64_t v389 = CWFGetOSLog();
    if (v389)
    {
      uint64_t v367 = CWFGetOSLog();
    }
    else
    {
      uint64_t v367 = MEMORY[0x1E4F14500];
      id v414 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v367, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_256;
    }
    int v439 = 136446978;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1900;
    __int16 v445 = 1024;
    LODWORD(v446) = objc_msgSend_isPrivacyProxyEnabled(v4, v415, v416, v417, v418);
    LODWORD(v422) = 34;
    uint64_t v421 = &v439;
LABEL_255:
    _os_log_send_and_compose_impl();
LABEL_256:

    uint64_t v350 = 0;
    goto LABEL_121;
  }
  uint64_t v424 = v4;
  long long v437 = 0u;
  long long v438 = 0u;
  long long v435 = 0u;
  long long v436 = 0u;
  uint64_t v120 = objc_msgSend_matchingKnownNetworkProfile(v3, v116, v117, v118, v119);
  uint64_t v125 = objc_msgSend_BSSList(v120, v121, v122, v123, v124);

  uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v126, (uint64_t)&v435, (uint64_t)v454, 16);
  if (!v127)
  {
LABEL_42:

    uint64_t v169 = CWFGetOSLog();
    if (v169)
    {
      uint64_t v125 = CWFGetOSLog();
    }
    else
    {
      uint64_t v125 = MEMORY[0x1E4F14500];
      id v306 = MEMORY[0x1E4F14500];
    }

    id v4 = v424;
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
    {
      int v439 = 136446978;
      v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
      __int16 v441 = 2082;
      uint64_t v442 = "CWFUtilPrivate.m";
      __int16 v443 = 1024;
      int v444 = 1936;
      __int16 v445 = 2112;
      uint64_t v446 = (const char *)v3;
      LODWORD(v422) = 38;
      uint64_t v421 = &v439;
      _os_log_send_and_compose_impl();
    }
    int v303 = 0;
    goto LABEL_103;
  }
  uint64_t v132 = v127;
  uint64_t v133 = *(void *)v436;
  uint64_t v429 = v3;
LABEL_30:
  uint64_t v134 = 0;
  while (1)
  {
    if (*(void *)v436 != v133) {
      objc_enumerationMutation(v125);
    }
    uint64_t v430 = *(void **)(*((void *)&v435 + 1) + 8 * v134);
    uint64_t v135 = objc_msgSend_BSSID(v430, v128, v129, v130, v131);
    uint64_t v140 = objc_msgSend_BSSID(v3, v136, v137, v138, v139);
    if (v135 == (void *)v140) {
      break;
    }
    uint64_t v145 = (void *)v140;
    uint64_t v146 = objc_msgSend_BSSID(v430, v141, v142, v143, v144);
    if (v146)
    {
      uint64_t v151 = (void *)v146;
      uint64_t v152 = objc_msgSend_BSSID(v3, v147, v148, v149, v150);
      if (v152)
      {
        int v157 = (void *)v152;
        uint64_t v158 = objc_msgSend_BSSID(v430, v153, v154, v155, v156);
        objc_msgSend_BSSID(v429, v159, v160, v161, v162);
        uint64_t v163 = v133;
        v165 = uint64_t v164 = v125;
        int isEqual = objc_msgSend_isEqual_(v158, v166, (uint64_t)v165, v167, v168);

        uint64_t v125 = v164;
        uint64_t v133 = v163;

        id v3 = v429;
        if (isEqual) {
          goto LABEL_45;
        }
        goto LABEL_40;
      }
    }
LABEL_40:
    if (v132 == ++v134)
    {
      uint64_t v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v128, (uint64_t)&v435, (uint64_t)v454, 16);
      if (!v132) {
        goto LABEL_42;
      }
      goto LABEL_30;
    }
  }

LABEL_45:
  long long v433 = 0u;
  long long v434 = 0u;
  long long v431 = 0u;
  long long v432 = 0u;
  id v4 = v424;
  objc_msgSend_BSSList(v424, v128, v129, v130, v131);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v428 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v170, (uint64_t)&v431, (uint64_t)v453, 16);
  if (!v428)
  {
    int v303 = 0;
    goto LABEL_102;
  }
  uint64_t v423 = v125;
  uint64_t v175 = *(void *)v432;
  while (2)
  {
    uint64_t v176 = 0;
    while (2)
    {
      if (*(void *)v432 != v175) {
        objc_enumerationMutation(obj);
      }
      uint64_t v177 = *(void **)(*((void *)&v431 + 1) + 8 * v176);
      uint64_t v178 = objc_msgSend_channel(v3, v171, v172, v173, v174, v421, v422);
      if (objc_msgSend_is6GHz(v178, v179, v180, v181, v182))
      {
        uint64_t v187 = objc_msgSend_channel(v177, v183, v184, v185, v186);
        int v192 = objc_msgSend_is5GHz(v187, v188, v189, v190, v191);

        if (!v192) {
          goto LABEL_87;
        }
      }
      else
      {
      }
      uint64_t v197 = objc_msgSend_IPv4NetworkSignature(v177, v171, v172, v173, v174);
      if (v197)
      {
        uint64_t v202 = objc_msgSend_IPv4NetworkSignature(v430, v193, v194, v195, v196);
        if (v202)
        {
          uint64_t v203 = objc_msgSend_IPv4NetworkSignature(v177, v198, v199, v200, v201);
          uint64_t v208 = objc_msgSend_IPv4NetworkSignature(v430, v204, v205, v206, v207);
          int v212 = objc_msgSend_isEqual_(v203, v209, (uint64_t)v208, v210, v211);
        }
        else
        {
          int v212 = 0;
        }
      }
      else
      {
        int v212 = 0;
      }

      uint64_t v221 = objc_msgSend_IPv6NetworkSignature(v177, v213, v214, v215, v216);
      if (v221)
      {
        id v226 = objc_msgSend_IPv6NetworkSignature(v430, v217, v218, v219, v220);
        if (v226)
        {
          long long v227 = objc_msgSend_IPv6NetworkSignature(v177, v222, v223, v224, v225);
          long long v232 = objc_msgSend_IPv6NetworkSignature(v430, v228, v229, v230, v231);
          int v236 = objc_msgSend_isEqual_(v227, v233, (uint64_t)v232, v234, v235);
        }
        else
        {
          int v236 = 0;
        }
      }
      else
      {
        int v236 = 0;
      }

      uint64_t v245 = objc_msgSend_DHCPServerID(v177, v237, v238, v239, v240);
      if (v245)
      {
        long long v250 = objc_msgSend_DHCPServerID(v430, v241, v242, v243, v244);
        if (v250)
        {
          uint64_t v251 = objc_msgSend_DHCPServerID(v177, v246, v247, v248, v249);
          objc_msgSend_DHCPServerID(v430, v252, v253, v254, v255);
          uint64_t v257 = v256 = v212;
          int v261 = objc_msgSend_isEqual_(v251, v258, (uint64_t)v257, v259, v260);

          int v212 = v256;
        }
        else
        {
          int v261 = 0;
        }
      }
      else
      {
        int v261 = 0;
      }

      uint64_t v270 = objc_msgSend_DHCPv6ServerID(v177, v262, v263, v264, v265);
      if (v270)
      {
        uint64_t v275 = objc_msgSend_DHCPv6ServerID(v430, v266, v267, v268, v269);
        if (v275)
        {
          objc_msgSend_DHCPv6ServerID(v177, v271, v272, v273, v274);
          v276 = int v425 = v212;
          objc_msgSend_DHCPv6ServerID(v430, v277, v278, v279, v280);
          uint64_t v281 = v177;
          int v282 = v236;
          v284 = uint64_t v283 = v175;
          int v288 = objc_msgSend_isEqual_(v276, v285, (uint64_t)v284, v286, v287);

          uint64_t v175 = v283;
          int v236 = v282;
          uint64_t v177 = v281;

          int v212 = v425;
        }
        else
        {
          int v288 = 0;
        }
      }
      else
      {
        int v288 = 0;
      }

      if ((v212 & v261 & 1) != 0 || (v236 & v288) != 0)
      {
        uint64_t v304 = CWFGetOSLog();
        if (v304)
        {
          uint64_t v305 = CWFGetOSLog();
        }
        else
        {
          uint64_t v305 = MEMORY[0x1E4F14500];
          id v307 = MEMORY[0x1E4F14500];
        }
        id v3 = v429;
        id v4 = v424;

        if (os_log_type_enabled(v305, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_networkName(v429, v308, v309, v310, v311);
          uint64_t v312 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v317 = objc_msgSend_networkName(v424, v313, v314, v315, v316);
          int v439 = 136447746;
          v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
          __int16 v441 = 2082;
          uint64_t v442 = "CWFUtilPrivate.m";
          __int16 v443 = 1024;
          int v444 = 1921;
          __int16 v445 = 2112;
          uint64_t v446 = v312;
          __int16 v447 = 2112;
          char v448 = v430;
          __int16 v449 = 2112;
          unint64_t v450 = v317;
          __int16 v451 = 2112;
          uint64_t v452 = v177;
          LODWORD(v422) = 68;
          uint64_t v421 = &v439;
          _os_log_send_and_compose_impl();
        }
        int v303 = 1;
        goto LABEL_101;
      }
      int v289 = v212 | v236 | v261 | v288;
      id v3 = v429;
      if (v289 == 1)
      {
        uint64_t v290 = CWFGetOSLog();
        if (v290)
        {
          uint64_t v291 = CWFGetOSLog();
        }
        else
        {
          uint64_t v291 = MEMORY[0x1E4F14500];
          id v292 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v291, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_networkName(v429, v293, v294, v295, v296);
          uint64_t v297 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v302 = objc_msgSend_networkName(v424, v298, v299, v300, v301);
          int v439 = 136447746;
          v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
          __int16 v441 = 2082;
          uint64_t v442 = "CWFUtilPrivate.m";
          __int16 v443 = 1024;
          int v444 = 1927;
          __int16 v445 = 2112;
          uint64_t v446 = v297;
          __int16 v447 = 2112;
          char v448 = v430;
          __int16 v449 = 2112;
          unint64_t v450 = v302;
          __int16 v451 = 2112;
          uint64_t v452 = v177;
          LODWORD(v422) = 68;
          uint64_t v421 = &v439;
          _os_log_send_and_compose_impl();
        }
      }
LABEL_87:
      if (v428 != ++v176) {
        continue;
      }
      break;
    }
    uint64_t v428 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v171, (uint64_t)&v431, (uint64_t)v453, 16);
    if (v428) {
      continue;
    }
    break;
  }
  int v303 = 0;
  id v4 = v424;
LABEL_101:
  uint64_t v125 = v423;
LABEL_102:

LABEL_103:
  uint64_t v326 = objc_msgSend_SSID(v4, v318, v319, v320, v321);
  if (v326)
  {
    uint64_t v327 = objc_msgSend_matchingKnownNetworkProfile(v3, v322, v323, v324, v325);
    v332 = objc_msgSend_seamlessSSIDList(v327, v328, v329, v330, v331);
    uint64_t v337 = objc_msgSend_SSID(v4, v333, v334, v335, v336);
    unsigned int v341 = objc_msgSend_containsObject_(v332, v338, (uint64_t)v337, v339, v340);
  }
  else
  {
    unsigned int v341 = 0;
  }

  id v342 = CWFGetOSLog();
  if (v342)
  {
    v343 = CWFGetOSLog();
  }
  else
  {
    v343 = MEMORY[0x1E4F14500];
    id v344 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v343, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v345 = " NOT";
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    int v439 = 136446978;
    if (v303) {
      uint64_t v345 = "";
    }
    __int16 v443 = 1024;
    int v444 = 1946;
    __int16 v445 = 2080;
    uint64_t v446 = v345;
    LODWORD(v422) = 38;
    uint64_t v421 = &v439;
    _os_log_send_and_compose_impl();
  }

  uint64_t v346 = CWFGetOSLog();
  if (v346)
  {
    uint64_t v347 = CWFGetOSLog();
  }
  else
  {
    uint64_t v347 = MEMORY[0x1E4F14500];
    id v348 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v347, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v349 = " NOT";
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    int v439 = 136446978;
    if (v341) {
      uint64_t v349 = "";
    }
    __int16 v443 = 1024;
    int v444 = 1948;
    __int16 v445 = 2080;
    uint64_t v446 = v349;
    LODWORD(v422) = 38;
    uint64_t v421 = &v439;
    _os_log_send_and_compose_impl();
  }

  uint64_t v350 = v303 | v341;
LABEL_121:
  uint64_t v351 = CWFGetOSLog();
  if (v351)
  {
    uint64_t v352 = CWFGetOSLog();
  }
  else
  {
    uint64_t v352 = MEMORY[0x1E4F14500];
    id v353 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v352, OS_LOG_TYPE_DEBUG))
  {
    if (v350) {
      v358 = "supported";
    }
    else {
      v358 = "NOT supported";
    }
    uint64_t v359 = objc_msgSend_networkName(v3, v354, v355, v356, v357, v421, v422);
    uint64_t v364 = objc_msgSend_networkName(v4, v360, v361, v362, v363);
    int v439 = 136447490;
    v440 = "CWFKnownNetworkSupportsSeamlessSSIDTransition";
    __int16 v441 = 2082;
    uint64_t v442 = "CWFUtilPrivate.m";
    __int16 v443 = 1024;
    int v444 = 1957;
    __int16 v445 = 2080;
    uint64_t v446 = v358;
    __int16 v447 = 2112;
    char v448 = v359;
    __int16 v449 = 2112;
    unint64_t v450 = v364;
    _os_log_send_and_compose_impl();
  }
  return v350;
}

uint64_t CWFScanResultSupportsSeamlessSSIDTransition(void *a1, void *a2)
{
  v350[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    int v303 = CWFGetOSLog();
    if (v303)
    {
      uint64_t v304 = CWFGetOSLog();
    }
    else
    {
      uint64_t v304 = MEMORY[0x1E4F14500];
      id v310 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v304, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_155;
    }
    int v334 = 136446722;
    uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
    __int16 v336 = 2082;
    uint64_t v337 = "CWFUtilPrivate.m";
    __int16 v338 = 1024;
    int v339 = 1970;
    LODWORD(v317) = 28;
    uint64_t v316 = &v334;
    goto LABEL_154;
  }
  if (!v3)
  {
    uint64_t v305 = CWFGetOSLog();
    if (v305)
    {
      uint64_t v304 = CWFGetOSLog();
    }
    else
    {
      uint64_t v304 = MEMORY[0x1E4F14500];
      id v311 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v304, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_155;
    }
    int v334 = 136446722;
    uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
    __int16 v336 = 2082;
    uint64_t v337 = "CWFUtilPrivate.m";
    __int16 v338 = 1024;
    int v339 = 1972;
    LODWORD(v317) = 28;
    uint64_t v316 = &v334;
    goto LABEL_154;
  }
  uint64_t v9 = objc_msgSend_matchingKnownNetworkProfile(v3, v5, v6, v7, v8);

  if (!v9)
  {
    id v306 = CWFGetOSLog();
    if (v306)
    {
      uint64_t v304 = CWFGetOSLog();
    }
    else
    {
      uint64_t v304 = MEMORY[0x1E4F14500];
      id v312 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v304, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_155;
    }
    int v334 = 136446722;
    uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
    __int16 v336 = 2082;
    uint64_t v337 = "CWFUtilPrivate.m";
    __int16 v338 = 1024;
    int v339 = 1973;
    LODWORD(v317) = 28;
    uint64_t v316 = &v334;
    goto LABEL_154;
  }
  if (!v4)
  {
    id v307 = CWFGetOSLog();
    if (v307)
    {
      uint64_t v304 = CWFGetOSLog();
    }
    else
    {
      uint64_t v304 = MEMORY[0x1E4F14500];
      id v313 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v304, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_155;
    }
    int v334 = 136446722;
    uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
    __int16 v336 = 2082;
    uint64_t v337 = "CWFUtilPrivate.m";
    __int16 v338 = 1024;
    int v339 = 1974;
    LODWORD(v317) = 28;
    uint64_t v316 = &v334;
    goto LABEL_154;
  }
  id v14 = objc_msgSend_matchingKnownNetworkProfile(v4, v10, v11, v12, v13);

  if (!v14)
  {
    uint64_t v308 = CWFGetOSLog();
    if (v308)
    {
      uint64_t v304 = CWFGetOSLog();
    }
    else
    {
      uint64_t v304 = MEMORY[0x1E4F14500];
      id v314 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v304, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_155;
    }
    int v334 = 136446722;
    uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
    __int16 v336 = 2082;
    uint64_t v337 = "CWFUtilPrivate.m";
    __int16 v338 = 1024;
    int v339 = 1975;
    LODWORD(v317) = 28;
    uint64_t v316 = &v334;
    goto LABEL_154;
  }
  uint64_t v19 = objc_msgSend_matchingKnownNetworkProfile(v4, v15, v16, v17, v18);
  v350[0] = v19;
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)v350, 1, v21);
  uint64_t v23 = sub_1B4F542B0(v4, v22);

  if (!v23)
  {
    uint64_t v309 = CWFGetOSLog();
    if (v309)
    {
      uint64_t v304 = CWFGetOSLog();
    }
    else
    {
      uint64_t v304 = MEMORY[0x1E4F14500];
      id v315 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v304, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_155;
    }
    int v334 = 136446722;
    uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
    __int16 v336 = 2082;
    uint64_t v337 = "CWFUtilPrivate.m";
    __int16 v338 = 1024;
    int v339 = 1978;
    LODWORD(v317) = 28;
    uint64_t v316 = &v334;
LABEL_154:
    _os_log_send_and_compose_impl();
LABEL_155:

    uint64_t v29 = 0;
    goto LABEL_115;
  }
  uint64_t v28 = objc_msgSend_matchingKnownNetworkProfile(v4, v24, v25, v26, v27);
  uint64_t v29 = CWFKnownNetworkSupportsSeamlessSSIDTransition(v3, v28);

  if (v29)
  {
    long long v332 = 0u;
    long long v333 = 0u;
    long long v330 = 0u;
    long long v331 = 0u;
    uint64_t v34 = objc_msgSend_matchingKnownNetworkProfile(v3, v30, v31, v32, v33);
    id v39 = objc_msgSend_BSSList(v34, v35, v36, v37, v38);

    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v330, (uint64_t)v349, 16);
    if (!v41) {
      goto LABEL_22;
    }
    uint64_t v46 = v41;
    uint64_t v323 = *(void *)v331;
    uint64_t v321 = v4;
    id obj = v39;
LABEL_10:
    uint64_t v47 = 0;
    uint64_t v48 = v323;
    while (1)
    {
      if (*(void *)v331 != v48) {
        objc_enumerationMutation(obj);
      }
      uint64_t v49 = *(void **)(*((void *)&v330 + 1) + 8 * v47);
      uint64_t v50 = objc_msgSend_BSSID(v49, v42, v43, v44, v45);
      uint64_t v55 = objc_msgSend_BSSID(v3, v51, v52, v53, v54);
      uint64_t v325 = v49;
      if (v50 == (void *)v55) {
        break;
      }
      uint64_t v60 = (void *)v55;
      uint64_t v61 = objc_msgSend_BSSID(v49, v56, v57, v58, v59);
      if (v61)
      {
        uint64_t v66 = (void *)v61;
        uint64_t v67 = objc_msgSend_BSSID(v3, v62, v63, v64, v65);
        if (v67)
        {
          uint64_t v72 = (void *)v67;
          uint64_t v73 = objc_msgSend_BSSID(v325, v68, v69, v70, v71);
          objc_msgSend_BSSID(v3, v74, v75, v76, v77);
          v79 = id v78 = v3;
          int isEqual = objc_msgSend_isEqual_(v73, v80, (uint64_t)v79, v81, v82);

          id v3 = v78;
          uint64_t v48 = v323;

          id v4 = v321;
          if (isEqual) {
            goto LABEL_25;
          }
          goto LABEL_20;
        }
      }
LABEL_20:
      if (v46 == ++v47)
      {
        id v39 = obj;
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v330, (uint64_t)v349, 16);
        if (!v46)
        {
LABEL_22:

          uint64_t v84 = CWFGetOSLog();
          if (v84)
          {
            uint64_t v85 = CWFGetOSLog();
          }
          else
          {
            uint64_t v85 = MEMORY[0x1E4F14500];
            id v243 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
          {
            int v334 = 136446978;
            uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
            __int16 v336 = 2082;
            uint64_t v337 = "CWFUtilPrivate.m";
            __int16 v338 = 1024;
            int v339 = 2023;
            __int16 v340 = 2112;
            unsigned int v341 = (const char *)v3;
            LODWORD(v317) = 38;
            uint64_t v316 = &v334;
            _os_log_send_and_compose_impl();
          }
          int v238 = 0;
          goto LABEL_95;
        }
        goto LABEL_10;
      }
    }

LABEL_25:
    long long v328 = 0u;
    long long v329 = 0u;
    long long v326 = 0u;
    long long v327 = 0u;
    uint64_t v86 = objc_msgSend_matchingKnownNetworkProfile(v4, v42, v43, v44, v45);
    uint64_t v91 = objc_msgSend_BSSList(v86, v87, v88, v89, v90);

    uint64_t v324 = objc_msgSend_countByEnumeratingWithState_objects_count_(v91, v92, (uint64_t)&v326, (uint64_t)v348, 16);
    if (v324)
    {
      uint64_t v318 = v3;
      char v97 = 0;
      uint64_t v322 = *(void *)v327;
      uint64_t v320 = v91;
LABEL_27:
      uint64_t v98 = 0;
      while (1)
      {
        if (*(void *)v327 != v322) {
          objc_enumerationMutation(v320);
        }
        uint64_t v99 = *(void **)(*((void *)&v326 + 1) + 8 * v98);
        uint64_t v100 = objc_msgSend_BSSID(v99, v93, v94, v95, v96, v316, v317);
        uint64_t v105 = objc_msgSend_BSSID(v4, v101, v102, v103, v104);
        if (v100 == v105)
        {
        }
        else
        {
          uint64_t v110 = (void *)v105;
          uint64_t v111 = objc_msgSend_BSSID(v99, v106, v107, v108, v109);
          if (!v111) {
            goto LABEL_41;
          }
          uint64_t v116 = (void *)v111;
          uint64_t v117 = objc_msgSend_BSSID(v4, v112, v113, v114, v115);
          if (!v117)
          {

LABEL_41:
LABEL_72:

            goto LABEL_73;
          }
          uint64_t v122 = (void *)v117;
          uint64_t v123 = objc_msgSend_BSSID(v99, v118, v119, v120, v121);
          uint64_t v128 = objc_msgSend_BSSID(v4, v124, v125, v126, v127);
          int v132 = objc_msgSend_isEqual_(v123, v129, (uint64_t)v128, v130, v131);

          id v4 = v321;
          if (!v132) {
            goto LABEL_73;
          }
        }
        uint64_t v137 = objc_msgSend_IPv4NetworkSignature(v99, v93, v94, v95, v96);
        if (v137)
        {
          uint64_t v138 = v325;
          uint64_t v143 = objc_msgSend_IPv4NetworkSignature(v325, v133, v134, v135, v136);
          if (v143)
          {
            uint64_t v144 = objc_msgSend_IPv4NetworkSignature(v99, v139, v140, v141, v142);
            uint64_t v149 = objc_msgSend_IPv4NetworkSignature(v325, v145, v146, v147, v148);
            int v153 = objc_msgSend_isEqual_(v144, v150, (uint64_t)v149, v151, v152);
          }
          else
          {
            int v153 = 0;
          }
        }
        else
        {
          int v153 = 0;
          uint64_t v138 = v325;
        }

        uint64_t v162 = objc_msgSend_IPv6NetworkSignature(v99, v154, v155, v156, v157);
        if (v162)
        {
          uint64_t v167 = objc_msgSend_IPv6NetworkSignature(v138, v158, v159, v160, v161);
          if (v167)
          {
            uint64_t v168 = objc_msgSend_IPv6NetworkSignature(v99, v163, v164, v165, v166);
            uint64_t v173 = objc_msgSend_IPv6NetworkSignature(v138, v169, v170, v171, v172);
            int v177 = objc_msgSend_isEqual_(v168, v174, (uint64_t)v173, v175, v176);
          }
          else
          {
            int v177 = 0;
          }
        }
        else
        {
          int v177 = 0;
        }

        uint64_t v186 = objc_msgSend_DHCPServerID(v99, v178, v179, v180, v181);
        if (v186)
        {
          uint64_t v191 = objc_msgSend_DHCPServerID(v138, v182, v183, v184, v185);
          if (v191)
          {
            int v192 = objc_msgSend_DHCPServerID(v99, v187, v188, v189, v190);
            uint64_t v197 = objc_msgSend_DHCPServerID(v138, v193, v194, v195, v196);
            int v201 = objc_msgSend_isEqual_(v192, v198, (uint64_t)v197, v199, v200);
          }
          else
          {
            int v201 = 0;
          }
        }
        else
        {
          int v201 = 0;
        }

        uint64_t v210 = objc_msgSend_DHCPv6ServerID(v99, v202, v203, v204, v205);
        if (v210)
        {
          uint64_t v215 = objc_msgSend_DHCPv6ServerID(v138, v206, v207, v208, v209);
          if (v215)
          {
            uint64_t v216 = objc_msgSend_DHCPv6ServerID(v99, v211, v212, v213, v214);
            uint64_t v221 = objc_msgSend_DHCPv6ServerID(v138, v217, v218, v219, v220);
            int v225 = objc_msgSend_isEqual_(v216, v222, (uint64_t)v221, v223, v224);

            uint64_t v138 = v325;
          }
          else
          {
            int v225 = 0;
          }
        }
        else
        {
          int v225 = 0;
        }

        if ((v153 & v201 & 1) != 0 || (v177 & v225) != 0)
        {
          uint64_t v239 = CWFGetOSLog();
          id v4 = v321;
          if (v239)
          {
            uint64_t v240 = CWFGetOSLog();
          }
          else
          {
            uint64_t v240 = MEMORY[0x1E4F14500];
            id v244 = MEMORY[0x1E4F14500];
          }
          uint64_t v85 = obj;
          uint64_t v242 = v320;

          if (os_log_type_enabled(v240, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_networkName(v318, v245, v246, v247, v248);
            uint64_t v249 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v254 = objc_msgSend_networkName(v321, v250, v251, v252, v253);
            int v334 = 136447746;
            uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
            __int16 v336 = 2082;
            uint64_t v337 = "CWFUtilPrivate.m";
            __int16 v338 = 1024;
            int v339 = 2002;
            __int16 v340 = 2112;
            unsigned int v341 = v249;
            __int16 v342 = 2112;
            v343 = v325;
            __int16 v344 = 2112;
            uint64_t v345 = v254;
            __int16 v346 = 2112;
            uint64_t v347 = v99;
            LODWORD(v317) = 68;
            uint64_t v316 = &v334;
            _os_log_send_and_compose_impl();
          }
          int v238 = 1;
          id v3 = v318;
          goto LABEL_94;
        }
        if ((v153 | v177 | v201 | v225) == 1)
        {
          id v226 = CWFGetOSLog();
          id v4 = v321;
          if (v226)
          {
            uint64_t v100 = CWFGetOSLog();
          }
          else
          {
            uint64_t v100 = MEMORY[0x1E4F14500];
            id v227 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_networkName(v318, v228, v229, v230, v231);
            long long v232 = (char *)objc_claimAutoreleasedReturnValue();
            uint64_t v237 = objc_msgSend_networkName(v321, v233, v234, v235, v236);
            int v334 = 136447746;
            uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
            __int16 v336 = 2082;
            uint64_t v337 = "CWFUtilPrivate.m";
            __int16 v338 = 1024;
            int v339 = 2008;
            __int16 v340 = 2112;
            unsigned int v341 = v232;
            __int16 v342 = 2112;
            v343 = v138;
            __int16 v344 = 2112;
            uint64_t v345 = v237;
            __int16 v346 = 2112;
            uint64_t v347 = v99;
            LODWORD(v317) = 68;
            uint64_t v316 = &v334;
            char v97 = 1;
            _os_log_send_and_compose_impl();
          }
          else
          {
            char v97 = 1;
          }
          goto LABEL_72;
        }
        char v97 = 1;
        id v4 = v321;
LABEL_73:
        if (v324 == ++v98)
        {
          uint64_t v324 = objc_msgSend_countByEnumeratingWithState_objects_count_(v320, v93, (uint64_t)&v326, (uint64_t)v348, 16);
          if (v324) {
            goto LABEL_27;
          }

          id v3 = v318;
          if (v97)
          {
            int v238 = 0;
            uint64_t v85 = obj;
            goto LABEL_95;
          }
          goto LABEL_80;
        }
      }
    }

LABEL_80:
    uint64_t v241 = CWFGetOSLog();
    uint64_t v85 = obj;
    if (v241)
    {
      uint64_t v242 = CWFGetOSLog();
    }
    else
    {
      uint64_t v242 = MEMORY[0x1E4F14500];
      id v255 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
    {
      int v334 = 136446978;
      uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
      __int16 v336 = 2082;
      uint64_t v337 = "CWFUtilPrivate.m";
      __int16 v338 = 1024;
      int v339 = 2015;
      __int16 v340 = 2112;
      unsigned int v341 = (const char *)v4;
      LODWORD(v317) = 38;
      uint64_t v316 = &v334;
      _os_log_send_and_compose_impl();
    }
    int v238 = 0;
LABEL_94:

LABEL_95:
    uint64_t v264 = objc_msgSend_SSID(v4, v256, v257, v258, v259);
    if (v264)
    {
      uint64_t v265 = objc_msgSend_matchingKnownNetworkProfile(v3, v260, v261, v262, v263);
      uint64_t v270 = objc_msgSend_seamlessSSIDList(v265, v266, v267, v268, v269);
      uint64_t v275 = objc_msgSend_SSID(v4, v271, v272, v273, v274);
      unsigned int v279 = objc_msgSend_containsObject_(v270, v276, (uint64_t)v275, v277, v278);
    }
    else
    {
      unsigned int v279 = 0;
    }

    uint64_t v280 = CWFGetOSLog();
    if (v280)
    {
      uint64_t v281 = CWFGetOSLog();
    }
    else
    {
      uint64_t v281 = MEMORY[0x1E4F14500];
      id v282 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v281, OS_LOG_TYPE_DEBUG))
    {
      if (v238) {
        uint64_t v283 = "";
      }
      else {
        uint64_t v283 = " NOT";
      }
      int v334 = 136446978;
      uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
      __int16 v336 = 2082;
      uint64_t v337 = "CWFUtilPrivate.m";
      __int16 v338 = 1024;
      int v339 = 2033;
      __int16 v340 = 2080;
      unsigned int v341 = v283;
      LODWORD(v317) = 38;
      uint64_t v316 = &v334;
      _os_log_send_and_compose_impl();
    }

    int v284 = CWFGetOSLog();
    if (v284)
    {
      uint64_t v285 = CWFGetOSLog();
    }
    else
    {
      uint64_t v285 = MEMORY[0x1E4F14500];
      id v286 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v285, OS_LOG_TYPE_DEBUG))
    {
      if (v279) {
        uint64_t v287 = "";
      }
      else {
        uint64_t v287 = " NOT";
      }
      int v334 = 136446978;
      uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
      __int16 v336 = 2082;
      uint64_t v337 = "CWFUtilPrivate.m";
      __int16 v338 = 1024;
      int v339 = 2035;
      __int16 v340 = 2080;
      unsigned int v341 = v287;
      LODWORD(v317) = 38;
      uint64_t v316 = &v334;
      _os_log_send_and_compose_impl();
    }

    uint64_t v29 = v238 | v279;
  }
LABEL_115:
  int v288 = CWFGetOSLog();
  if (v288)
  {
    int v289 = CWFGetOSLog();
  }
  else
  {
    int v289 = MEMORY[0x1E4F14500];
    id v290 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v289, OS_LOG_TYPE_DEBUG))
  {
    if (v29) {
      uint64_t v295 = "supported";
    }
    else {
      uint64_t v295 = "NOT supported";
    }
    uint64_t v296 = objc_msgSend_networkName(v3, v291, v292, v293, v294, v316, v317);
    uint64_t v301 = objc_msgSend_networkName(v4, v297, v298, v299, v300);
    int v334 = 136447490;
    uint64_t v335 = "CWFScanResultSupportsSeamlessSSIDTransition";
    __int16 v336 = 2082;
    uint64_t v337 = "CWFUtilPrivate.m";
    __int16 v338 = 1024;
    int v339 = 2044;
    __int16 v340 = 2080;
    unsigned int v341 = v295;
    __int16 v342 = 2112;
    v343 = v296;
    __int16 v344 = 2112;
    uint64_t v345 = v301;
    _os_log_send_and_compose_impl();
  }
  return v29;
}

id CWFKnownNetworksSupportingSeamlessSSIDTransitionForScanResult(void *a1, void *a2, char a3)
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v116 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v7, v8, v9, v10);
  if (v5)
  {
    if (objc_msgSend_count(v6, v11, v12, v13, v14))
    {
      uint64_t v19 = objc_msgSend_matchingKnownNetworkProfile(v5, v15, v16, v17, v18);

      if (v19)
      {
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        uint64_t v20 = v6;
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v120, (uint64_t)v124, 16);
        if (!v22) {
          goto LABEL_34;
        }
        uint64_t v27 = v22;
        id v114 = v6;
        id v115 = v5;
        uint64_t v119 = *(void *)v121;
        uint64_t v28 = v116;
        uint64_t v117 = v20;
        char v118 = a3;
        while (1)
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v121 != v119) {
              objc_enumerationMutation(v20);
            }
            uint64_t v30 = *(void **)(*((void *)&v120 + 1) + 8 * v29);
            if (a3)
            {
              if (CWFKnownNetworkSupportsSeamlessSSIDTransition(v5, *(void **)(*((void *)&v120 + 1) + 8 * v29))) {
                goto LABEL_26;
              }
              uint64_t v32 = objc_msgSend_SSID(v5, v23, v31, v25, v26);
              uint64_t v37 = objc_msgSend_SSID(v30, v33, v34, v35, v36);
              if (v32 == (void *)v37)
              {

                goto LABEL_26;
              }
              uint64_t v42 = (void *)v37;
              uint64_t v43 = objc_msgSend_SSID(v5, v38, v39, v40, v41);
              if (!v43)
              {

LABEL_31:
                a3 = v118;
                goto LABEL_27;
              }
              uint64_t v48 = (void *)v43;
              uint64_t v49 = objc_msgSend_SSID(v30, v44, v45, v46, v47);
              if (!v49)
              {

                uint64_t v20 = v117;
                goto LABEL_31;
              }
              uint64_t v54 = (void *)v49;
              uint64_t v55 = objc_msgSend_SSID(v5, v50, v51, v52, v53);
              uint64_t v60 = objc_msgSend_SSID(v30, v56, v57, v58, v59);
              int isEqual = objc_msgSend_isEqual_(v55, v61, (uint64_t)v60, v62, v63);

              uint64_t v28 = v116;
              id v5 = v115;

              uint64_t v20 = v117;
              a3 = v118;
              if (isEqual) {
                goto LABEL_26;
              }
            }
            else
            {
              uint64_t v65 = objc_msgSend_SSID(v5, v23, v24, v25, v26);
              uint64_t v70 = objc_msgSend_SSID(v30, v66, v67, v68, v69);
              if (v65 == (void *)v70)
              {

                goto LABEL_27;
              }
              uint64_t v75 = (void *)v70;
              uint64_t v76 = objc_msgSend_SSID(v5, v71, v72, v73, v74);
              if (!v76) {
                goto LABEL_24;
              }
              uint64_t v81 = (void *)v76;
              uint64_t v82 = objc_msgSend_SSID(v30, v77, v78, v79, v80);
              if (!v82)
              {

                uint64_t v20 = v117;
LABEL_24:

                a3 = v118;
LABEL_25:
                if ((CWFKnownNetworkSupportsSeamlessSSIDTransition(v5, v30) & 1) == 0) {
                  goto LABEL_27;
                }
LABEL_26:
                objc_msgSend_addObject_(v28, v23, (uint64_t)v30, v25, v26);
                goto LABEL_27;
              }
              uint64_t v87 = (void *)v82;
              uint64_t v88 = objc_msgSend_SSID(v5, v83, v84, v85, v86);
              long long v93 = objc_msgSend_SSID(v30, v89, v90, v91, v92);
              char v97 = objc_msgSend_isEqual_(v88, v94, (uint64_t)v93, v95, v96);

              uint64_t v28 = v116;
              id v5 = v115;

              uint64_t v20 = v117;
              a3 = v118;
              if ((v97 & 1) == 0) {
                goto LABEL_25;
              }
            }
LABEL_27:
            ++v29;
          }
          while (v27 != v29);
          uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v120, (uint64_t)v124, 16);
          uint64_t v27 = v98;
          if (!v98)
          {
            id v6 = v114;
            goto LABEL_34;
          }
        }
      }
      uint64_t v109 = CWFGetOSLog();
      if (v109)
      {
        uint64_t v110 = CWFGetOSLog();
      }
      else
      {
        uint64_t v110 = MEMORY[0x1E4F14500];
        id v113 = MEMORY[0x1E4F14500];
      }

      uint64_t v20 = v110;
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_34;
      }
      int v125 = 136446722;
      uint64_t v126 = "CWFKnownNetworksSupportingSeamlessSSIDTransitionForScanResult";
      __int16 v127 = 2082;
      uint64_t v128 = "CWFUtilPrivate.m";
      __int16 v129 = 1024;
      int v130 = 2057;
    }
    else
    {
      uint64_t v107 = CWFGetOSLog();
      if (v107)
      {
        uint64_t v108 = CWFGetOSLog();
      }
      else
      {
        uint64_t v108 = MEMORY[0x1E4F14500];
        id v112 = MEMORY[0x1E4F14500];
      }

      uint64_t v20 = v108;
      if (!os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_34;
      }
      int v125 = 136446722;
      uint64_t v126 = "CWFKnownNetworksSupportingSeamlessSSIDTransitionForScanResult";
      __int16 v127 = 2082;
      uint64_t v128 = "CWFUtilPrivate.m";
      __int16 v129 = 1024;
      int v130 = 2056;
    }
  }
  else
  {
    uint64_t v105 = CWFGetOSLog();
    if (v105)
    {
      uint64_t v106 = CWFGetOSLog();
    }
    else
    {
      uint64_t v106 = MEMORY[0x1E4F14500];
      id v111 = MEMORY[0x1E4F14500];
    }

    uint64_t v20 = v106;
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_34;
    }
    int v125 = 136446722;
    uint64_t v126 = "CWFKnownNetworksSupportingSeamlessSSIDTransitionForScanResult";
    __int16 v127 = 2082;
    uint64_t v128 = "CWFUtilPrivate.m";
    __int16 v129 = 1024;
    int v130 = 2055;
  }
  _os_log_send_and_compose_impl();
LABEL_34:

  uint64_t v103 = objc_msgSend_copy(v116, v99, v100, v101, v102);
  return v103;
}

id CWFIPv4Subnets(void *a1, void *a2)
{
  id v3 = a1;
  id v114 = a2;
  id v112 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7);
  if (v3)
  {
    if (v114)
    {
      uint64_t v12 = objc_msgSend_count(v3, v8, v9, v10, v11);
      if (v12 == objc_msgSend_count(v114, v13, v14, v15, v16))
      {
        if (objc_msgSend_count(v3, v8, v9, v10, v11))
        {
          unint64_t v17 = 0;
          id v113 = v3;
          do
          {
            uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(v3, v8, v17, v10, v11);
            uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v114, v19, v17, v20, v21);
            long long v122 = v18;
            uint64_t v26 = objc_msgSend_componentsSeparatedByString_(v18, v23, @".", v24, v25);
            long long v121 = v22;
            uint64_t v30 = objc_msgSend_componentsSeparatedByString_(v22, v27, @".", v28, v29);
            char v118 = NSString;
            long long v120 = objc_msgSend_objectAtIndexedSubscript_(v26, v31, 0, v32, v33);
            LODWORD(v18) = objc_msgSend_intValue(v120, v34, v35, v36, v37);
            uint64_t v119 = objc_msgSend_objectAtIndexedSubscript_(v30, v38, 0, v39, v40);
            uint64_t v116 = objc_msgSend_intValue(v119, v41, v42, v43, v44) & v18;
            uint64_t v117 = objc_msgSend_objectAtIndexedSubscript_(v26, v45, 1, v46, v47);
            int v52 = objc_msgSend_intValue(v117, v48, v49, v50, v51);
            uint64_t v56 = objc_msgSend_objectAtIndexedSubscript_(v30, v53, 1, v54, v55);
            uint64_t v115 = objc_msgSend_intValue(v56, v57, v58, v59, v60) & v52;
            uint64_t v64 = objc_msgSend_objectAtIndexedSubscript_(v26, v61, 2, v62, v63);
            LODWORD(v22) = objc_msgSend_intValue(v64, v65, v66, v67, v68);
            uint64_t v72 = objc_msgSend_objectAtIndexedSubscript_(v30, v69, 2, v70, v71);
            uint64_t v77 = objc_msgSend_intValue(v72, v73, v74, v75, v76) & v22;
            uint64_t v81 = objc_msgSend_objectAtIndexedSubscript_(v26, v78, 3, v79, v80);
            LODWORD(v22) = objc_msgSend_intValue(v81, v82, v83, v84, v85);
            uint64_t v89 = objc_msgSend_objectAtIndexedSubscript_(v30, v86, 3, v87, v88);
            int v94 = objc_msgSend_intValue(v89, v90, v91, v92, v93);
            uint64_t v98 = objc_msgSend_stringWithFormat_(v118, v95, @"%d.%d.%d.%d", v96, v97, v116, v115, v77, v94 & v22);

            if (v98) {
              objc_msgSend_addObject_(v112, v99, (uint64_t)v98, v100, v101);
            }

            ++v17;
            id v3 = v113;
          }
          while (v17 < objc_msgSend_count(v113, v102, v103, v104, v105));
        }
      }
    }
  }
  if (objc_msgSend_count(v112, v8, v9, v10, v11)) {
    uint64_t v110 = objc_msgSend_copy(v112, v106, v107, v108, v109);
  }
  else {
    uint64_t v110 = 0;
  }

  return v110;
}

id CWFIPv4AddressesFromDHCPOptionData(void *a1)
{
  id v1 = a1;
  uint64_t v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v2, v3, v4, v5);
  id v7 = v1;
  uint64_t v12 = objc_msgSend_bytes(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_length(v7, v13, v14, v15, v16);
  if (v17)
  {
    unint64_t v22 = v17;
    if ((v17 & 3) == 0)
    {
      for (unint64_t i = 0; i < v22; i += 4)
      {
        uint64_t v27 = objc_msgSend_stringWithFormat_(NSString, v18, @"%d.%d.%d.%d", v20, v21, *(unsigned __int8 *)(v12 + i), *(unsigned __int8 *)(v12 + i + 1), *(unsigned __int8 *)(v12 + i + 2), *(unsigned __int8 *)(v12 + i + 3));
        if (v27) {
          objc_msgSend_addObject_(v6, v24, (uint64_t)v27, v25, v26);
        }
      }
    }
  }
  if (objc_msgSend_count(v6, v18, v19, v20, v21)) {
    uint64_t v32 = objc_msgSend_copy(v6, v28, v29, v30, v31);
  }
  else {
    uint64_t v32 = 0;
  }

  return v32;
}

BOOL CWFIsIPv4AddressLoopback(void *a1)
{
  int v9[2] = *MEMORY[0x1E4F143B8];
  HIDWORD(v9[0]) = 0;
  v9[1] = 0;
  id v1 = a1;
  uint64_t v6 = (const char *)objc_msgSend_UTF8String(v1, v2, v3, v4, v5);
  return inet_pton(2, v6, (char *)v9 + 4) == 1 && BYTE4(v9[0]) == 127;
}

BOOL CWFIsIPv4AddressLinkLocal(void *a1)
{
  int v9[2] = *MEMORY[0x1E4F143B8];
  HIDWORD(v9[0]) = 0;
  v9[1] = 0;
  id v1 = a1;
  uint64_t v6 = (const char *)objc_msgSend_UTF8String(v1, v2, v3, v4, v5);
  return inet_pton(2, v6, (char *)v9 + 4) == 1 && SWORD2(v9[0]) == -343;
}

BOOL CWFIsIPv6AddressLinkLocal(void *a1)
{
  v10[0] = 0;
  int v11 = 0;
  v10[1] = 0;
  id v1 = a1;
  uint64_t v6 = (const char *)objc_msgSend_UTF8String(v1, v2, v3, v4, v5, 0);
  int v7 = inet_pton(30, v6, v10);
  BOOL result = 0;
  if (v7 == 1) {
    return LOBYTE(v10[0]) == 254 && (BYTE1(v10[0]) & 0xC0) == 128;
  }
  return result;
}

__CFString *CWFStringFromDenyListAddReason(unint64_t a1)
{
  if (a1 > 0xC) {
    return @"Unknown";
  }
  else {
    return off_1E60BB840[a1];
  }
}

__CFString *CWFStringFromDenyListRemoveReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"Unknown";
  }
  else {
    return off_1E60BB8A8[a1 - 1];
  }
}

__CFString *CWFStringFromDenyListState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E60BB8E0[a1 - 1];
  }
}

uint64_t CWFIsCodesignedByApple()
{
  return 0;
}

uint64_t CWFPrivateMACAddressAllowFallbackForAssociationError()
{
  return 1;
}

BOOL CWFPrivateMACShouldShowPrivateMACAddressDisabledWarning(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v10 = v5;
  if (a3 != 1) {
    goto LABEL_9;
  }
  if (objc_msgSend_privateMACAddressModeUserSetting(v5, v6, v7, v8, v9)
    || objc_msgSend_privateMACAddressModeConfigurationProfileSetting(v10, v11, v12, v13, v14) | a2)
  {
    BOOL v19 = 1;
    goto LABEL_10;
  }
  if (!objc_msgSend_privateMACAddressDisabledByEvaluation(v10, v15, v16, v17, v18))
  {
LABEL_9:
    BOOL v19 = 0;
    goto LABEL_10;
  }
  if (os_variant_has_internal_content()) {
    _os_feature_enabled_impl();
  }
  uint64_t v24 = objc_msgSend_lastJoinedAt(v10, v20, v21, v22, v23);
  objc_msgSend_timeIntervalSinceReferenceDate(v24, v25, v26, v27, v28);
  double v30 = v29;
  uint64_t v35 = objc_msgSend_privateMACAddressEvaluatedAt(v10, v31, v32, v33, v34);
  objc_msgSend_timeIntervalSinceReferenceDate(v35, v36, v37, v38, v39);
  BOOL v19 = v30 - v40 > 14400.0;

LABEL_10:
  return v19;
}

BOOL CWFPrivateMACShouldEnablePrivateMACAddressForEvaluation(void *a1)
{
  id v1 = a1;
  if (os_variant_has_internal_content()) {
    _os_feature_enabled_impl();
  }
  if (objc_msgSend_privateMACAddressDisabledByEvaluation(v1, v2, v3, v4, v5))
  {
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v6, v7, v8, v9);
    double v11 = v10;
    uint64_t v16 = objc_msgSend_privateMACAddressEvaluatedAt(v1, v12, v13, v14, v15);
    objc_msgSend_timeIntervalSinceReferenceDate(v16, v17, v18, v19, v20);
    BOOL v22 = v11 - v21 > 86400.0;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

uint64_t CWFDescriptionForApple80211BSSIDChangeReason(uint64_t a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = convertBssidChangedReasonToString();
  return objc_msgSend_stringWithFormat_(v2, v4, @"0x%x (%s)", v5, v6, a1, v3);
}

uint64_t sub_1B4F609F0()
{
  qword_1EB4B2628 = (uint64_t)os_log_create("com.apple.WiFiManager", "");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1B4F60A34(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v10 = objc_msgSend_is6GHz(v4, v6, v7, v8, v9);
  if (v10 == objc_msgSend_is6GHz(v5, v11, v12, v13, v14))
  {
    int v20 = objc_msgSend_is5GHz(v4, v15, v16, v17, v18);
    if (v20 == objc_msgSend_is5GHz(v5, v21, v22, v23, v24))
    {
      int isDFS = objc_msgSend_isDFS(v4, v25, v26, v27, v28);
      if (isDFS == objc_msgSend_isDFS(v5, v30, v31, v32, v33))
      {
        uint64_t v38 = 0;
        goto LABEL_10;
      }
      int v19 = objc_msgSend_isDFS(v5, v34, v35, v36, v37);
    }
    else
    {
      int v19 = objc_msgSend_is5GHz(v5, v25, v26, v27, v28);
    }
  }
  else
  {
    int v19 = objc_msgSend_is6GHz(v5, v15, v16, v17, v18);
  }
  if (v19) {
    uint64_t v38 = -1;
  }
  else {
    uint64_t v38 = 1;
  }
LABEL_10:

  return v38;
}

uint64_t sub_1B4F60B00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v121 = 0;
  double v11 = objc_msgSend_SSID(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_SSID(v5, v12, v13, v14, v15);
  unint64_t v118 = sub_1B4F5B5CC(v11, v16, 4, &v121);

  double v21 = objc_msgSend_SSID(*(void **)(a1 + 32), v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_length(v21, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_SSID(v5, v27, v28, v29, v30);
  uint64_t v36 = objc_msgSend_length(v31, v32, v33, v34, v35);
  uint64_t v41 = objc_msgSend_SSID(*(void **)(a1 + 32), v37, v38, v39, v40);
  uint64_t v46 = objc_msgSend_length(v41, v42, v43, v44, v45);
  id v119 = v5;
  uint64_t v51 = objc_msgSend_SSID(v5, v47, v48, v49, v50);
  uint64_t v56 = objc_msgSend_length(v51, v52, v53, v54, v55);

  if (v26 >= v36) {
    unint64_t v57 = v46 - v56;
  }
  else {
    unint64_t v57 = v56 - v46;
  }

  unint64_t v120 = 0;
  uint64_t v62 = objc_msgSend_SSID(*(void **)(a1 + 32), v58, v59, v60, v61);
  uint64_t v67 = objc_msgSend_SSID(v6, v63, v64, v65, v66);
  unint64_t v68 = sub_1B4F5B5CC(v62, v67, 4, &v120);

  uint64_t v73 = objc_msgSend_SSID(*(void **)(a1 + 32), v69, v70, v71, v72);
  uint64_t v78 = objc_msgSend_length(v73, v74, v75, v76, v77);
  uint64_t v83 = objc_msgSend_SSID(v6, v79, v80, v81, v82);
  uint64_t v88 = objc_msgSend_length(v83, v84, v85, v86, v87);
  uint64_t v93 = objc_msgSend_SSID(*(void **)(a1 + 32), v89, v90, v91, v92);
  uint64_t v98 = objc_msgSend_length(v93, v94, v95, v96, v97);
  uint64_t v103 = objc_msgSend_SSID(v6, v99, v100, v101, v102);
  uint64_t v108 = objc_msgSend_length(v103, v104, v105, v106, v107);
  BOOL v109 = v78 < v88;
  if (v78 >= v88) {
    uint64_t v110 = v108;
  }
  else {
    uint64_t v110 = v98;
  }
  if (v109) {
    uint64_t v111 = v108;
  }
  else {
    uint64_t v111 = v98;
  }

  BOOL v112 = v121 > v120;
  if (v121 != v120 || (BOOL v112 = v118 > v68, v118 != v68))
  {
    if (v112) {
      uint64_t v113 = 1;
    }
    else {
      uint64_t v113 = -1;
    }
    goto LABEL_20;
  }
  uint64_t v113 = 0;
  if (!v118)
  {
LABEL_20:
    uint64_t v116 = v119;
    goto LABEL_21;
  }
  unint64_t v114 = v111 - v110;
  BOOL v115 = v57 == v111 - v110;
  uint64_t v116 = v119;
  if (!v115)
  {
    if (v114 > v57) {
      uint64_t v113 = 1;
    }
    else {
      uint64_t v113 = -1;
    }
  }
LABEL_21:

  return v113;
}

uint64_t sub_1B4F60D38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v93 = a3;
  uint64_t v10 = objc_msgSend_BSSID(v5, v6, v7, v8, v9);
  uint64_t v18 = objc_msgSend_substringToIndex_(v10, v11, 2, v12, v13);
  if (v18)
  {
    uint64_t v19 = objc_msgSend_BSSID(*(void **)(a1 + 32), v14, v15, v16, v17);
    uint64_t v27 = objc_msgSend_substringToIndex_(v19, v20, 2, v21, v22);
    if (v27)
    {
      objc_msgSend_BSSID(v5, v23, v24, v25, v26);
      uint64_t v28 = v91 = v5;
      uint64_t v32 = objc_msgSend_substringToIndex_(v28, v29, 2, v30, v31);
      uint64_t v37 = objc_msgSend_BSSID(*(void **)(a1 + 32), v33, v34, v35, v36);
      uint64_t v41 = objc_msgSend_substringToIndex_(v37, v38, 2, v39, v40);
      uint64_t v45 = a1;
      int isEqual = objc_msgSend_isEqual_(v32, v42, (uint64_t)v41, v43, v44);

      int v47 = isEqual;
      a1 = v45;

      id v5 = v91;
    }
    else
    {
      int v47 = 0;
    }
  }
  else
  {
    int v47 = 0;
  }

  int v52 = objc_msgSend_BSSID(v93, v48, v49, v50, v51);
  uint64_t v60 = objc_msgSend_substringToIndex_(v52, v53, 2, v54, v55);
  if (v60)
  {
    uint64_t v61 = objc_msgSend_BSSID(*(void **)(a1 + 32), v56, v57, v58, v59);
    uint64_t v69 = objc_msgSend_substringToIndex_(v61, v62, 2, v63, v64);
    if (v69)
    {
      objc_msgSend_BSSID(v93, v65, v66, v67, v68);
      uint64_t v70 = v92 = v47;
      uint64_t v74 = objc_msgSend_substringToIndex_(v70, v71, 2, v72, v73);
      uint64_t v79 = objc_msgSend_BSSID(*(void **)(a1 + 32), v75, v76, v77, v78);
      uint64_t v83 = objc_msgSend_substringToIndex_(v79, v80, 2, v81, v82);
      int v87 = objc_msgSend_isEqual_(v74, v84, (uint64_t)v83, v85, v86);

      int v47 = v92;
    }
    else
    {
      int v87 = 0;
    }
  }
  else
  {
    int v87 = 0;
  }

  uint64_t v88 = 1;
  if (!v47) {
    uint64_t v88 = -1;
  }
  if (v87 == v47) {
    uint64_t v89 = 0;
  }
  else {
    uint64_t v89 = v88;
  }

  return v89;
}

uint64_t sub_1B4F60F64(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v39 = 0;
  uint64_t v9 = objc_msgSend_BSSID(a2, v5, v6, v7, v8);
  uint64_t v14 = v9;
  if (v9)
  {
    uint64_t v15 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v9, v10, @":", (uint64_t)&stru_1F0DA9CF0, v13);

    uint64_t v14 = objc_msgSend_scannerWithString_(MEMORY[0x1E4F28FE8], v16, (uint64_t)v15, v17, v18);
    objc_msgSend_scanHexLongLong_(v14, v19, (uint64_t)&v39, v20, v21);
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v22 = objc_msgSend_BSSID(v4, v10, v11, v12, v13, 0);
  if (v22)
  {
    uint64_t v25 = v22;
    uint64_t v26 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v22, v23, @":", (uint64_t)&stru_1F0DA9CF0, v24);

    uint64_t v30 = objc_msgSend_scannerWithString_(MEMORY[0x1E4F28FE8], v27, (uint64_t)v26, v28, v29);

    objc_msgSend_scanHexLongLong_(v30, v31, (uint64_t)&v38, v32, v33);
    unint64_t v34 = v38;

    uint64_t v14 = v30;
  }
  else
  {
    unint64_t v34 = 0;
  }
  uint64_t v35 = 1;
  if (v39 >= v34) {
    uint64_t v35 = -1;
  }
  if (v39 == v34) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = v35;
  }

  return v36;
}

uint64_t sub_1B4F6109C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v10 = objc_msgSend_is6GHz(v4, v6, v7, v8, v9);
  if (v10 == objc_msgSend_is6GHz(v5, v11, v12, v13, v14))
  {
    int v20 = objc_msgSend_is5GHz(v4, v15, v16, v17, v18);
    if (v20 == objc_msgSend_is5GHz(v5, v21, v22, v23, v24))
    {
      int isDFS = objc_msgSend_isDFS(v4, v25, v26, v27, v28);
      if (isDFS == objc_msgSend_isDFS(v5, v30, v31, v32, v33))
      {
        uint64_t v38 = 0;
        goto LABEL_10;
      }
      int v19 = objc_msgSend_isDFS(v5, v34, v35, v36, v37);
    }
    else
    {
      int v19 = objc_msgSend_is5GHz(v5, v25, v26, v27, v28);
    }
  }
  else
  {
    int v19 = objc_msgSend_is6GHz(v5, v15, v16, v17, v18);
  }
  if (v19) {
    uint64_t v38 = -1;
  }
  else {
    uint64_t v38 = 1;
  }
LABEL_10:

  return v38;
}

uint64_t sub_1B4F61168(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v121 = 0;
  uint64_t v11 = objc_msgSend_SSID(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_SSID(v5, v12, v13, v14, v15);
  unint64_t v118 = sub_1B4F5B5CC(v11, v16, 4, &v121);

  uint64_t v21 = objc_msgSend_SSID(*(void **)(a1 + 32), v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_length(v21, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_SSID(v5, v27, v28, v29, v30);
  uint64_t v36 = objc_msgSend_length(v31, v32, v33, v34, v35);
  uint64_t v41 = objc_msgSend_SSID(*(void **)(a1 + 32), v37, v38, v39, v40);
  uint64_t v46 = objc_msgSend_length(v41, v42, v43, v44, v45);
  id v119 = v5;
  uint64_t v51 = objc_msgSend_SSID(v5, v47, v48, v49, v50);
  uint64_t v56 = objc_msgSend_length(v51, v52, v53, v54, v55);

  if (v26 >= v36) {
    unint64_t v57 = v46 - v56;
  }
  else {
    unint64_t v57 = v56 - v46;
  }

  unint64_t v120 = 0;
  uint64_t v62 = objc_msgSend_SSID(*(void **)(a1 + 32), v58, v59, v60, v61);
  uint64_t v67 = objc_msgSend_SSID(v6, v63, v64, v65, v66);
  unint64_t v68 = sub_1B4F5B5CC(v62, v67, 4, &v120);

  uint64_t v73 = objc_msgSend_SSID(*(void **)(a1 + 32), v69, v70, v71, v72);
  uint64_t v78 = objc_msgSend_length(v73, v74, v75, v76, v77);
  uint64_t v83 = objc_msgSend_SSID(v6, v79, v80, v81, v82);
  uint64_t v88 = objc_msgSend_length(v83, v84, v85, v86, v87);
  id v93 = objc_msgSend_SSID(*(void **)(a1 + 32), v89, v90, v91, v92);
  uint64_t v98 = objc_msgSend_length(v93, v94, v95, v96, v97);
  uint64_t v103 = objc_msgSend_SSID(v6, v99, v100, v101, v102);
  uint64_t v108 = objc_msgSend_length(v103, v104, v105, v106, v107);
  BOOL v109 = v78 < v88;
  if (v78 >= v88) {
    uint64_t v110 = v108;
  }
  else {
    uint64_t v110 = v98;
  }
  if (v109) {
    uint64_t v111 = v108;
  }
  else {
    uint64_t v111 = v98;
  }

  BOOL v112 = v121 > v120;
  if (v121 != v120 || (BOOL v112 = v118 > v68, v118 != v68))
  {
    if (v112) {
      uint64_t v113 = 1;
    }
    else {
      uint64_t v113 = -1;
    }
    goto LABEL_20;
  }
  uint64_t v113 = 0;
  if (!v118)
  {
LABEL_20:
    uint64_t v116 = v119;
    goto LABEL_21;
  }
  unint64_t v114 = v111 - v110;
  BOOL v115 = v57 == v111 - v110;
  uint64_t v116 = v119;
  if (!v115)
  {
    if (v114 > v57) {
      uint64_t v113 = 1;
    }
    else {
      uint64_t v113 = -1;
    }
  }
LABEL_21:

  return v113;
}

uint64_t sub_1B4F613A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v93 = a3;
  uint64_t v10 = objc_msgSend_BSSID(v5, v6, v7, v8, v9);
  uint64_t v18 = objc_msgSend_substringToIndex_(v10, v11, 2, v12, v13);
  if (v18)
  {
    uint64_t v19 = objc_msgSend_BSSID(*(void **)(a1 + 32), v14, v15, v16, v17);
    uint64_t v27 = objc_msgSend_substringToIndex_(v19, v20, 2, v21, v22);
    if (v27)
    {
      objc_msgSend_BSSID(v5, v23, v24, v25, v26);
      uint64_t v28 = v91 = v5;
      uint64_t v32 = objc_msgSend_substringToIndex_(v28, v29, 2, v30, v31);
      uint64_t v37 = objc_msgSend_BSSID(*(void **)(a1 + 32), v33, v34, v35, v36);
      uint64_t v41 = objc_msgSend_substringToIndex_(v37, v38, 2, v39, v40);
      uint64_t v45 = a1;
      int isEqual = objc_msgSend_isEqual_(v32, v42, (uint64_t)v41, v43, v44);

      int v47 = isEqual;
      a1 = v45;

      id v5 = v91;
    }
    else
    {
      int v47 = 0;
    }
  }
  else
  {
    int v47 = 0;
  }

  int v52 = objc_msgSend_BSSID(v93, v48, v49, v50, v51);
  uint64_t v60 = objc_msgSend_substringToIndex_(v52, v53, 2, v54, v55);
  if (v60)
  {
    uint64_t v61 = objc_msgSend_BSSID(*(void **)(a1 + 32), v56, v57, v58, v59);
    uint64_t v69 = objc_msgSend_substringToIndex_(v61, v62, 2, v63, v64);
    if (v69)
    {
      objc_msgSend_BSSID(v93, v65, v66, v67, v68);
      uint64_t v70 = v92 = v47;
      uint64_t v74 = objc_msgSend_substringToIndex_(v70, v71, 2, v72, v73);
      uint64_t v79 = objc_msgSend_BSSID(*(void **)(a1 + 32), v75, v76, v77, v78);
      uint64_t v83 = objc_msgSend_substringToIndex_(v79, v80, 2, v81, v82);
      int v87 = objc_msgSend_isEqual_(v74, v84, (uint64_t)v83, v85, v86);

      int v47 = v92;
    }
    else
    {
      int v87 = 0;
    }
  }
  else
  {
    int v87 = 0;
  }

  uint64_t v88 = 1;
  if (!v47) {
    uint64_t v88 = -1;
  }
  if (v87 == v47) {
    uint64_t v89 = 0;
  }
  else {
    uint64_t v89 = v88;
  }

  return v89;
}

uint64_t sub_1B4F615CC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v39 = 0;
  uint64_t v9 = objc_msgSend_BSSID(a2, v5, v6, v7, v8);
  uint64_t v14 = v9;
  if (v9)
  {
    uint64_t v15 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v9, v10, @":", (uint64_t)&stru_1F0DA9CF0, v13);

    uint64_t v14 = objc_msgSend_scannerWithString_(MEMORY[0x1E4F28FE8], v16, (uint64_t)v15, v17, v18);
    objc_msgSend_scanHexLongLong_(v14, v19, (uint64_t)&v39, v20, v21);
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v22 = objc_msgSend_BSSID(v4, v10, v11, v12, v13, 0);
  if (v22)
  {
    uint64_t v25 = v22;
    uint64_t v26 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v22, v23, @":", (uint64_t)&stru_1F0DA9CF0, v24);

    uint64_t v30 = objc_msgSend_scannerWithString_(MEMORY[0x1E4F28FE8], v27, (uint64_t)v26, v28, v29);

    objc_msgSend_scanHexLongLong_(v30, v31, (uint64_t)&v38, v32, v33);
    unint64_t v34 = v38;

    uint64_t v14 = v30;
  }
  else
  {
    unint64_t v34 = 0;
  }
  uint64_t v35 = 1;
  if (v39 >= v34) {
    uint64_t v35 = -1;
  }
  if (v39 == v34) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = v35;
  }

  return v36;
}

void sub_1B4F61C28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F61C44(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_updatedRotationKeyHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_updatedRotationKeyHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_rotationKey(*(void **)(a1 + 32), v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_rotationKeyUpdatedAt(*(void **)(a1 + 32), v18, v19, v20, v21);
    ((void (**)(void, void *, void *))v12)[2](v12, v17, v22);
  }
}

void sub_1B4F61F14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F61F30(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_updatedRotationKeyHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_updatedRotationKeyHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_rotationKey(*(void **)(a1 + 32), v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_rotationKeyUpdatedAt(*(void **)(a1 + 32), v18, v19, v20, v21);
    ((void (**)(void, void *, void *))v12)[2](v12, v17, v22);
  }
}

void sub_1B4F62228(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F62244(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_updatedDeviceKeyHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_updatedDeviceKeyHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_deviceKey(*(void **)(a1 + 32), v13, v14, v15, v16);
    ((void (**)(void, void *))v12)[2](v12, v17);
  }
}

void sub_1B4F6250C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1B4F62528(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_updatedSystemSettingHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_updatedSystemSettingHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_systemSetting(*(void **)(a1 + 32), v13, v14, v15, v16);
    v12[2](v12, v17);
  }
}

void sub_1B4F626D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B4F62700(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_allowRotationHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_allowRotationHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = sub_1B4F62820;
    v16[3] = &unk_1E60BB900;
    uint64_t v18 = *(void *)(a1 + 56);
    long long v15 = *(_OWORD *)(a1 + 40);
    id v13 = (id)v15;
    long long v17 = v15;
    ((void (**)(void, void *))v12)[2](v12, v16);
  }
  else
  {
    int v14 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (unsigned int *)&v14, 1u);
    if (!v14) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void *sub_1B4F62820(void *result, char a2)
{
  int v2 = 0;
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = a2;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(result[6] + 8) + 24), (unsigned int *)&v2, 1u);
  if (!v2) {
    return (void *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  return result;
}

void sub_1B4F62E84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F62EAC(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_updatedPrivateMACAddressHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_updatedPrivateMACAddressHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v12[2](v12, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

void sub_1B4F6309C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F630C4(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_effectiveHardwareMACAddress(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_effectiveHardwareMACAddress(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = sub_1B4F631E4;
    v16[3] = &unk_1E60BB978;
    uint64_t v18 = *(void *)(a1 + 56);
    long long v15 = *(_OWORD *)(a1 + 40);
    id v13 = (id)v15;
    long long v17 = v15;
    ((void (**)(void, void *))v12)[2](v12, v16);
  }
  else
  {
    int v14 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (unsigned int *)&v14, 1u);
    if (!v14) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_1B4F631E4(void *a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  int v4 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned int *)&v4, 1u);
  if (!v4) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

id sub_1B4F63760(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1B4F63A9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F63BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F63CA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F63F10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F64008(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F64564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F65760(void *a1, io_iterator_t a2)
{
}

void sub_1B4F6576C(void *a1, io_iterator_t a2)
{
}

void sub_1B4F65778(void *a1, io_iterator_t a2)
{
}

void sub_1B4F65784(void *a1, io_iterator_t a2)
{
}

void sub_1B4F659F8(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 64))
  {
    *(unsigned char *)(v3 + 64) = 1;
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(void *)(a1 + 32) + 24), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  }
}

void sub_1B4F65AC8(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 64))
  {
    *(unsigned char *)(v3 + 64) = 0;
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(void *)(a1 + 32) + 24), 0);
  }
}

void sub_1B4F65BD0(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 64);
}

void sub_1B4F662F4(void *a1, io_iterator_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v43 = v5;
  if (v5)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v8 = CWFGetOSLog();
    if (v8)
    {
      uint64_t v9 = CWFGetOSLog();
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_isMonitoringEvents(v5, v12, v13, v14, v15);
      _os_log_send_and_compose_impl();
    }

    if (objc_msgSend_isMonitoringEvents(v5, v16, v17, v18, v19))
    {
      uint64_t v40 = v7;
      objc_msgSend_eventHandler(v5, v20, v21, v22, v23);
      uint64_t v42 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        io_object_t v24 = IOIteratorNext(a2);
        if (v24)
        {
          io_registry_entry_t v25 = v24;
          CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          id v41 = v6;
          do
          {
            CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v25, @"IOClass", v26, 0);
            uint64_t v28 = (void *)IORegistryEntryCreateCFProperty(v25, @"IOInterfaceName", v26, 0);
            CFTypeRef v29 = IORegistryEntryCreateCFProperty(v25, @"BSD Name", v26, 0);
            CFTypeRef v30 = IORegistryEntryCreateCFProperty(v25, @"IO80211VirtualInterfaceRole", v26, 0);
            CFTypeRef v31 = IORegistryEntryCreateCFProperty(v25, @"IOInterfaceNamePrefix", v26, 0);
            CFTypeRef cf = IORegistryEntryCreateCFProperty(v25, @"IOInterfaceUnit", v26, 0);
            clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
            uint64_t v32 = CWFGetOSLog();
            if (v32)
            {
              uint64_t v33 = CWFGetOSLog();
            }
            else
            {
              uint64_t v33 = MEMORY[0x1E4F14500];
              id v34 = MEMORY[0x1E4F14500];
            }

            id v6 = v41;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
              _os_log_send_and_compose_impl();
            }

            unint64_t v39 = objc_msgSend_copy(v28, v35, v36, v37, v38);
            ((void (**)(void, void *, void *, id))v42)[2](v42, v43, v39, v41);

            if (v29) {
              CFRelease(v29);
            }
            if (v28) {
              CFRelease(v28);
            }
            if (CFProperty) {
              CFRelease(CFProperty);
            }
            if (v30) {
              CFRelease(v30);
            }
            if (v31) {
              CFRelease(v31);
            }
            if (cf) {
              CFRelease(cf);
            }
            IOObjectRelease(v25);
            io_registry_entry_t v25 = IOIteratorNext(a2);
          }
          while (v25);
        }
      }

      uint64_t v7 = v40;
    }
  }
  else
  {
    while (1)
    {
      io_object_t v10 = IOIteratorNext(a2);
      if (!v10) {
        break;
      }
      IOObjectRelease(v10);
    }
  }
}

uint64_t sub_1B4F67488(uint64_t a1)
{
  int v2 = [CWFSensingAutoDataCollector alloc];
  qword_1EB4B2638 = objc_msgSend_initWithHomes_(v2, v3, *(void *)(a1 + 32), v4, v5);
  return MEMORY[0x1F41817F8]();
}

void sub_1B4F679A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend__serviceObjects(*(void **)(a1 + 32), a2, a3, a4, a5);
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v56, v6, *(void *)(a1 + 40), v7, v8);
  if (v9)
  {
    uint64_t v14 = (void *)v9;
    uint64_t v15 = objc_msgSend__serviceObjects(*(void **)(a1 + 32), v10, v11, v12, v13);
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v15, v16, *(void *)(a1 + 40), v17, v18);
    io_object_t v24 = objc_msgSend_currentRoomIdentifier(v19, v20, v21, v22, v23);
    CFTypeRef v29 = objc_msgSend__currentAccessory(*(void **)(a1 + 32), v25, v26, v27, v28);
    id v34 = objc_msgSend_room(v29, v30, v31, v32, v33);
    unint64_t v39 = objc_msgSend_uniqueIdentifier(v34, v35, v36, v37, v38);
    char isEqual = objc_msgSend_isEqual_(v24, v40, (uint64_t)v39, v41, v42);

    if ((isEqual & 1) == 0)
    {
      uint64_t v48 = objc_msgSend__serviceObjects(*(void **)(a1 + 32), v44, v45, v46, v47);
      int v52 = objc_msgSend_objectForKeyedSubscript_(v48, v49, *(void *)(a1 + 40), v50, v51);
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = sub_1B4F67B48;
      v57[3] = &unk_1E60BB9C8;
      long long v58 = *(_OWORD *)(a1 + 32);
      objc_msgSend_deregisterForPrimaryServiceNotificationWith_(v52, v53, (uint64_t)v57, v54, v55);
    }
  }
  else
  {
  }
}

void sub_1B4F67B48(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend__serviceObjects(*(void **)(a1 + 32), a2, a3, a4, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v9, v6, *(void *)(a1 + 40), v7, v8);
}

uint64_t sub_1B4F67FF8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = sub_1B4F68070;
  v7[3] = &unk_1E60BB9C8;
  long long v8 = *(_OWORD *)(a1 + 40);
  return objc_msgSend_registerForPrimaryServiceNotificationWith_(v5, a2, (uint64_t)v7, a4, a5);
}

void sub_1B4F68070(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
    if (v4)
    {
      uint64_t v5 = CWFGetOSLog();
    }
    else
    {
      uint64_t v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend_uniqueIdentifier(*(void **)(a1 + 32), v7, v8, v9, v10);
      objc_msgSend_code(v3, v11, v12, v13, v14);
      _os_log_send_and_compose_impl();
    }
    uint64_t v19 = objc_msgSend__serviceObjects(*(void **)(a1 + 40), v15, v16, v17, v18);
    io_object_t v24 = objc_msgSend_uniqueIdentifier(*(void **)(a1 + 32), v20, v21, v22, v23);
    objc_msgSend_removeObjectForKey_(v19, v25, (uint64_t)v24, v26, v27);
  }
}

uint64_t sub_1B4F685FC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend_setTarget_(v4, v5, v3, v6, v7);
  objc_msgSend_invoke(v4, v8, v9, v10, v11);

  uint64_t v12 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v12();
}

void sub_1B4F69D20(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(unsigned char **)(a1 + 32);
  if (!v7[48]) {
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = objc_msgSend___setupEventMonitoring(v7, v2, v3, v4, v5);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 40), v2, v8, v4, v5);
    if (!v13)
    {
      uint64_t v13 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v9, v10, v11, v12);
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 40), v14, (uint64_t)v13, *(void *)(a1 + 40), v15);
    }
    uint64_t v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, *(unsigned int *)(a1 + 48), v11, v12);
    objc_msgSend_addObject_(v13, v17, (uint64_t)v16, v18, v19);
  }
}

void sub_1B4F69E94(uint64_t a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 40), v2, v6, v3, v4);
    if (v10)
    {
      uint64_t v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v7, *(unsigned int *)(a1 + 48), v8, v9);
      objc_msgSend_removeObject_(v10, v12, (uint64_t)v11, v13, v14);
    }
  }
}

uint64_t sub_1B4F70624(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_1B4F7062C(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  ssize_t v2 = read(*(_DWORD *)(a1 + 40), v50, 0x400uLL);
  if (v2 < 0)
  {
    uint64_t v45 = CWFGetOSLog();
    if (v45)
    {
      uint64_t v43 = CWFGetOSLog();
    }
    else
    {
      uint64_t v43 = MEMORY[0x1E4F14500];
      id v46 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      __error();
      uint64_t v47 = __error();
      strerror(*v47);
      goto LABEL_33;
    }
LABEL_34:
  }
  else
  {
    ssize_t v3 = v2;
    if (v2)
    {
      ssize_t v4 = 0;
      uint64_t v5 = v50;
      while (1)
      {
        uint64_t v6 = *(unsigned int *)&v50[v4];
        if (v4 + v6 > v3)
        {
          uint64_t v42 = CWFGetOSLog();
          if (v42)
          {
            uint64_t v43 = CWFGetOSLog();
          }
          else
          {
            uint64_t v43 = MEMORY[0x1E4F14500];
            id v44 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
LABEL_33:
          }
            _os_log_send_and_compose_impl();
          goto LABEL_34;
        }
        if ((v6 - 24) < 0x18) {
          return;
        }
        snprintf(__str, 0x10uLL, "%s%u", v5 + 32, *((_DWORD *)v5 + 7));
        if (objc_msgSend_isMonitoringEvents(*(void **)(a1 + 32), v7, v8, v9, v10)) {
          break;
        }
LABEL_27:
        v4 += *(unsigned int *)&v50[v4];
        uint64_t v5 = &v50[v4];
        if (v4 >= v3) {
          return;
        }
      }
      uint64_t v16 = objc_msgSend_stringWithCString_encoding_(NSString, v11, (uint64_t)__str, 4, v12);
      int v17 = *((_DWORD *)v5 + 5);
      if ((v17 - 9) < 5)
      {
        clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        uint64_t v18 = CWFGetOSLog();
        if (v18)
        {
          uint64_t v19 = CWFGetOSLog();
        }
        else
        {
          uint64_t v19 = MEMORY[0x1E4F14500];
          id v21 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v48 = objc_msgSend_descriptionForKernelEventCode_(CWFKernelEventMonitor, v22, *((unsigned int *)v5 + 5), v23, v24);
          _os_log_send_and_compose_impl();
        }
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        objc_msgSend_interfaceFlagsWithInterfaceName_(*(void **)(a1 + 32), v13, (uint64_t)v16, v14, v15);
        clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        uint64_t v20 = CWFGetOSLog();
        if (v20)
        {
          uint64_t v19 = CWFGetOSLog();
        }
        else
        {
          uint64_t v19 = MEMORY[0x1E4F14500];
          id v26 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
      }
      else
      {
        clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        io_registry_entry_t v25 = CWFGetOSLog();
        if (v25)
        {
          uint64_t v19 = CWFGetOSLog();
        }
        else
        {
          uint64_t v19 = MEMORY[0x1E4F14500];
          id v30 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_24;
        }
      }
      uint64_t v31 = objc_msgSend_descriptionForKernelEventCode_(CWFKernelEventMonitor, v27, *((unsigned int *)v5 + 5), v28, v29);
      _os_log_send_and_compose_impl();

LABEL_24:
      uint64_t v36 = objc_msgSend_eventHandler(*(void **)(a1 + 32), v32, v33, v34, v35);

      if (v36)
      {
        objc_msgSend_eventHandler(*(void **)(a1 + 32), v37, v38, v39, v40);
        uint64_t v41 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void, void *, void))v41)[2](v41, *(void *)(a1 + 32), v16, *((unsigned int *)v5 + 5));
      }
      goto LABEL_27;
    }
  }
}

void sub_1B4F70D2C(uint64_t a1)
{
  ssize_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 32)) {
    *(unsigned char *)(v3 + 32) = 1;
  }
}

void sub_1B4F70DE8(uint64_t a1)
{
  ssize_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 32)) {
    *(unsigned char *)(v3 + 32) = 0;
  }
}

void sub_1B4F70ED8(uint64_t a1)
{
  ssize_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 32);
}

void sub_1B4F747DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F7498C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F75020(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  qword_1EB4B2648 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], a2, (uint64_t)&unk_1F0DC8700, a4, a5);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1B4F77330()
{
  uint64_t result = _sl_dlopen();
  qword_1EB4B25E0 = result;
  return result;
}

void *sub_1B4F773A4(uint64_t a1)
{
  ssize_t v2 = sub_1B4F773F4();
  uint64_t result = dlsym(v2, "kCNSCaptiveNetworkProperty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB4B25F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1B4F773F4()
{
  uint64_t v0 = sub_1B4F408A8();
  if (v0) {
    return (void *)v0;
  }
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v1, v2, v3, v4);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *CaptiveNetworkLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v10, @"CWFNetworkProfile.m", 30, @"%s", 0);

  __break(1u);
  free(v12);
  return v5;
}

void *sub_1B4F774A4(uint64_t a1)
{
  uint64_t v2 = sub_1B4F773F4();
  uint64_t result = dlsym(v2, "kCNSNetworkWasCaptiveProperty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB4B25C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1B4F774F4(uint64_t a1)
{
  uint64_t v2 = sub_1B4F773F4();
  uint64_t result = dlsym(v2, "kCNSCaptiveBypassProperty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB4B25B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1B4F77544(uint64_t a1)
{
  uint64_t v2 = sub_1B4F773F4();
  uint64_t result = dlsym(v2, "kCNSCaptiveNetworkWebSheetLoginDateProperty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E9D45C28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B4F77AAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F77AC0(uint64_t a1)
{
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained[21];
  objc_msgSend_processIdentifier(WeakRetained[18], v3, v4, v5, v6);
  objc_msgSend_effectiveUserIdentifier(WeakRetained[18], v7, v8, v9, v10);
  objc_msgSend_effectiveGroupIdentifier(WeakRetained[18], v11, v12, v13, v14);
  uint64_t v15 = CWFGetOSLog();
  if (v15)
  {
    uint64_t v16 = CWFGetOSLog();
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = objc_msgSend_UUID(WeakRetained, v18, v19, v20, v21);
    uint64_t v27 = objc_msgSend_UUIDString(v22, v23, v24, v25, v26);
    uint64_t v31 = objc_msgSend_substringToIndex_(v27, v28, 5, v29, v30);
    _os_log_send_and_compose_impl();
  }
}

void sub_1B4F77DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F77E04(void *a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[4] + 112), v3, a1[5], v4, v5);
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v12 = objc_msgSend_valueForEntitlement_(*(void **)(a1[4] + 144), v9, a1[5], v10, v11);
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v19 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v20 = v19;
    if (!v19)
    {
      uint64_t v20 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v15, v16, v17, v18);
    }
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 112), v15, (uint64_t)v20, a1[5], v18);
    if (!v19) {
  }
    }
}

void sub_1B4F77EE8(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  long long v1 = *(_OWORD *)(a1 + 32);
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v3[2] = sub_1B4F77F60;
  v3[3] = &unk_1E60BB9F0;
  long long v4 = v1;
  dispatch_async(v2, v3);
}

void sub_1B4F77F60(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 32) + 72), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4F77FA8(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  long long v1 = *(_OWORD *)(a1 + 32);
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v3[2] = sub_1B4F78020;
  v3[3] = &unk_1E60BB9F0;
  long long v4 = v1;
  dispatch_async(v2, v3);
}

void sub_1B4F78020(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 32) + 64), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4F78068(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  objc_msgSend_XPCConnection_canceledXPCRequestsWithUUID_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), v9);
}

void sub_1B4F78318(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4F78364(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4F783B0(void **a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_remoteObjectProxy(a1[4], v3, v4, v5, v6);
  uint64_t v8 = a1[5];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_1B4F78630;
  v55[3] = &unk_1E60BBD20;
  id v9 = v8;
  uint64_t v10 = a1[4];
  id v56 = v9;
  uint64_t v57 = v10;
  id v58 = a1[6];
  objc_msgSend_receivedAcknowledgedXPCEvent_reply_(v7, v11, (uint64_t)v9, (uint64_t)v55, v12);

  uint64_t v13 = CWFGetOSLog();
  if (v13)
  {
    uint64_t v14 = CWFGetOSLog();
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v20 = objc_msgSend_type(a1[5], v16, v17, v18, v19);
    uint64_t v53 = sub_1B4F53484(v20, v21, v22, v23, v24);
    uint64_t v54 = objc_msgSend_UUID(a1[5], v25, v26, v27, v28);
    uint64_t v33 = objc_msgSend_UUIDString(v54, v29, v30, v31, v32);
    uint64_t v37 = objc_msgSend_substringToIndex_(v33, v34, 5, v35, v36);
    int v42 = objc_msgSend_processIdentifier(*((void **)a1[4] + 18), v38, v39, v40, v41);
    uint64_t v43 = (uint64_t *)a1[4];
    uint64_t v45 = v43[21];
    uint64_t v44 = v43[22];
    uint64_t v46 = v43[23];
    uint64_t v47 = sub_1B4F4B704(v43[19]);
    uint64_t v52 = objc_msgSend_acknowledgementTimeout(a1[5], v48, v49, v50, v51);
    int v59 = 138545154;
    uint64_t v60 = v53;
    __int16 v61 = 2114;
    uint64_t v62 = v37;
    __int16 v63 = 1024;
    int v64 = v42;
    __int16 v65 = 2114;
    uint64_t v66 = v45;
    __int16 v67 = 2114;
    uint64_t v68 = v44;
    __int16 v69 = 2114;
    uint64_t v70 = v46;
    __int16 v71 = 2114;
    uint64_t v72 = v47;
    __int16 v73 = 2048;
    uint64_t v74 = v52;
    _os_log_send_and_compose_impl();
  }
}

void sub_1B4F78630(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v2 = CWFGetOSLog();
  if (v2)
  {
    uint64_t v3 = CWFGetOSLog();
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v9 = objc_msgSend_type(*(void **)(a1 + 32), v5, v6, v7, v8);
    uint64_t v14 = sub_1B4F53484(v9, v10, v11, v12, v13);
    uint64_t v45 = objc_msgSend_UUID(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_UUIDString(v45, v19, v20, v21, v22);
    uint64_t v27 = objc_msgSend_substringToIndex_(v23, v24, 5, v25, v26);
    int v32 = objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 40) + 144), v28, v29, v30, v31);
    uint64_t v33 = *(uint64_t **)(a1 + 40);
    uint64_t v34 = v33[21];
    uint64_t v35 = v33[22];
    uint64_t v36 = v33[23];
    uint64_t v37 = sub_1B4F4B704(v33[19]);
    uint64_t v42 = objc_msgSend_acknowledgementTimeout(*(void **)(a1 + 32), v38, v39, v40, v41);
    int v49 = 138545154;
    uint64_t v50 = v14;
    __int16 v51 = 2114;
    uint64_t v52 = v27;
    __int16 v53 = 1024;
    int v54 = v32;
    __int16 v55 = 2114;
    uint64_t v56 = v34;
    __int16 v57 = 2114;
    uint64_t v58 = v35;
    __int16 v59 = 2114;
    uint64_t v60 = v36;
    __int16 v61 = 2114;
    uint64_t v62 = v37;
    __int16 v63 = 2048;
    uint64_t v64 = v42;
    _os_log_send_and_compose_impl();
  }
  uint64_t v43 = *(void *)(a1 + 40);
  uint64_t v44 = *(NSObject **)(v43 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F78888;
  block[3] = &unk_1E60BBD20;
  void block[4] = v43;
  id v47 = *(id *)(a1 + 32);
  id v48 = *(id *)(a1 + 48);
  dispatch_async(v44, block);
}

void sub_1B4F78888(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  if (objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 32) + 80), v3, *(void *)(a1 + 40), v4, v5))
  {
    objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 32) + 80), v6, *(void *)(a1 + 40), v7, v8);
    objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 32), v9, v10, v11, v12);
    uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F78958;
    block[3] = &unk_1E60BBCF8;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v13, block);
  }
}

void sub_1B4F78958(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

void sub_1B4F789A8(void **a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  if (objc_msgSend_containsObject_(*((void **)a1[4] + 10), v3, (uint64_t)a1[5], v4, v5))
  {
    uint64_t v6 = CWFGetOSLog();
    if (v6)
    {
      uint64_t v7 = CWFGetOSLog();
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = objc_msgSend_type(a1[5], v9, v10, v11, v12);
      uint64_t v18 = sub_1B4F53484(v13, v14, v15, v16, v17);
      __int16 v55 = objc_msgSend_UUID(a1[5], v19, v20, v21, v22);
      int v54 = objc_msgSend_UUIDString(v55, v23, v24, v25, v26);
      uint64_t v30 = objc_msgSend_substringToIndex_(v54, v27, 5, v28, v29);
      int v35 = objc_msgSend_processIdentifier(*((void **)a1[4] + 18), v31, v32, v33, v34);
      uint64_t v36 = (uint64_t *)a1[4];
      uint64_t v38 = v36[21];
      uint64_t v37 = v36[22];
      uint64_t v39 = v36[23];
      uint64_t v40 = sub_1B4F4B704(v36[19]);
      uint64_t v45 = objc_msgSend_acknowledgementTimeout(a1[5], v41, v42, v43, v44);
      int v58 = 138545154;
      __int16 v59 = v18;
      __int16 v60 = 2114;
      __int16 v61 = v30;
      __int16 v62 = 1024;
      int v63 = v35;
      __int16 v64 = 2114;
      uint64_t v65 = v38;
      __int16 v66 = 2114;
      uint64_t v67 = v37;
      __int16 v68 = 2114;
      uint64_t v69 = v39;
      __int16 v70 = 2114;
      __int16 v71 = v40;
      __int16 v72 = 2048;
      uint64_t v73 = v45;
      _os_log_send_and_compose_impl();
    }
    objc_msgSend_removeObject_(*((void **)a1[4] + 10), v46, (uint64_t)a1[5], v47, v48);
    objc_msgSend___updateXPCTransactionCount(a1[4], v49, v50, v51, v52);
    __int16 v53 = *((void *)a1[4] + 6);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F78C20;
    block[3] = &unk_1E60BBCF8;
    id v57 = a1[6];
    dispatch_async(v53, block);
  }
}

void sub_1B4F78C20(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4F78C6C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1B4F78DA8(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 88), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B4F78E9C(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v10 = objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 32) + 144), v6, v7, v8, v9);
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = v11[21];
    uint64_t v14 = v11[22];
    uint64_t v15 = v11[23];
    int v46 = 67110146;
    int v47 = v10;
    __int16 v48 = 2114;
    uint64_t v49 = v13;
    __int16 v50 = 2114;
    uint64_t v51 = v14;
    __int16 v52 = 2114;
    uint64_t v53 = v15;
    __int16 v54 = 2114;
    uint64_t v55 = v12;
    _os_log_send_and_compose_impl();
  }

  int v20 = objc_msgSend_taskState(*(void **)(a1 + 40), v16, v17, v18, v19);
  if (objc_msgSend_taskState(*(void **)(*(void *)(a1 + 32) + 88), v21, v22, v23, v24) == 3
    && v20 != 3)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v30 = objc_msgSend_allValues(*(void **)(*(void *)(a1 + 32) + 96), v25, v26, v27, v28);
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(v30);
          }
          uint64_t v36 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v37 = *(void *)(a1 + 32);
          uint64_t v38 = *(NSObject **)(v37 + 40);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1B4F79110;
          block[3] = &unk_1E60BB9F0;
          void block[4] = v36;
          void block[5] = v37;
          dispatch_async(v38, block);
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v39, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v33);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

void sub_1B4F79110(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_acknowledgementTimeout(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_remoteObjectProxy(*(void **)(a1 + 40), v8, v9, v10, v11);
  uint64_t v16 = v12;
  uint64_t v17 = *(void *)(a1 + 32);
  if (v7) {
    objc_msgSend_receivedAcknowledgedXPCEvent_reply_(v12, v13, v17, 0, v15);
  }
  else {
    objc_msgSend_receivedXPCEvent_(v12, v13, v17, v14, v15);
  }

  uint64_t v18 = CWFGetOSLog();
  if (v18)
  {
    uint64_t v19 = CWFGetOSLog();
  }
  else
  {
    uint64_t v19 = MEMORY[0x1E4F14500];
    id v20 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v25 = objc_msgSend_type(*(void **)(a1 + 32), v21, v22, v23, v24);
    uint64_t v30 = sub_1B4F53484(v25, v26, v27, v28, v29);
    __int16 v48 = objc_msgSend_UUID(*(void **)(a1 + 32), v31, v32, v33, v34);
    uint64_t v39 = objc_msgSend_UUIDString(v48, v35, v36, v37, v38);
    long long v43 = objc_msgSend_substringToIndex_(v39, v40, 5, v41, v42);
    objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 40) + 144), v44, v45, v46, v47);
    uint64_t v49 = sub_1B4F4B704(*(void *)(*(void *)(a1 + 40) + 152));
    _os_log_send_and_compose_impl();
  }
}

id sub_1B4F79408()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1E9D45C00;
  uint64_t v7 = qword_1E9D45C00;
  if (!qword_1E9D45C00)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1B4F868C0;
    v3[3] = &unk_1E60BAFD8;
    void v3[4] = &v4;
    sub_1B4F868C0(v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B4F794D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F79B1C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_XPCConnection_canceledXPCRequestsWithUUID_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), *(void *)(a1 + 48), v4);
}

void sub_1B4F79B64(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 37, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

void sub_1B4F79BF4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_response(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_response(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    ((void (**)(void, void *, void))v12)[2](v12, v14, 0);
  }
}

void sub_1B4F79CA8(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    uint64_t v5 = CWFGetOSLog();
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  BOOL v11 = objc_msgSend_code(*(void **)(a1 + 32), v7, v8, v9, v10) != 0;
  if (os_log_type_enabled(v5, (os_log_type_t)(16 * v11)))
  {
    uint64_t v38 = sub_1B4F43CD0(*(void *)(a1 + 80), v12, v13, v14, v15);
    clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 48) + 144), v16, v17, v18, v19);
    id v20 = sub_1B4F4B704(*(void *)(*(void *)(a1 + 48) + 152));
    qos_class_self();
    unint64_t v25 = objc_msgSend_interfaceName(*(void **)(a1 + 56), v21, v22, v23, v24);
    uint64_t v30 = objc_msgSend_UUIDString(*(void **)(a1 + 64), v26, v27, v28, v29);
    uint64_t v39 = objc_msgSend_substringToIndex_(v30, v31, 5, v32, v33);
    objc_msgSend_code(*(void **)(a1 + 32), v34, v35, v36, v37);
    _os_log_send_and_compose_impl();
  }
}

void sub_1B4F79FE4(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = objc_msgSend_UUID(*(void **)(a1 + 32), v6, v7, v8, v9);
    uint64_t v15 = objc_msgSend_UUIDString(v10, v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_substringToIndex_(v15, v16, 5, v17, v18);
    int v37 = 138543618;
    id v38 = v2;
    __int16 v39 = 2114;
    uint64_t v40 = v19;
    int v36 = 22;
    uint64_t v35 = &v37;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend___didInvalidate(*(void **)(a1 + 32), v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v24, v25, v26, v27);

  if (v28)
  {
    objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v29, v30, v31, v32);
    uint64_t v33 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v33[2](v33, v34);
  }
  objc_msgSend_setInvalidationHandler_(*(void **)(a1 + 32), v29, 0, v31, v32, v35, v36);
}

void sub_1B4F7A4A0(uint64_t a1)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  id v3 = *(id *)(*(void *)(a1 + 32) + 72);
  id v4 = *(id *)(*(void *)(a1 + 32) + 16);
  id v5 = *(id *)(*(void *)(a1 + 32) + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v6 = *(void **)(a1 + 32);
  uint64_t v11 = objc_msgSend_type(*(void **)(a1 + 40), v7, v8, v9, v10);
  uint64_t v12 = *(void *)(a1 + 40);
  v29[0] = @"EventID";
  v29[1] = @"Remove";
  v30[0] = v12;
  v30[1] = MEMORY[0x1E4F1CC28];
  uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v30, (uint64_t)v29, 2);
  uint64_t v15 = sub_1B4F5350C(v11);
  uint64_t v16 = *(void *)(a1 + 48);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B4F7A6EC;
  v21[3] = &unk_1E60BBE88;
  objc_copyWeak(&v27, &location);
  id v17 = v4;
  id v22 = v17;
  id v18 = v3;
  id v23 = v18;
  id v24 = *(id *)(a1 + 40);
  id v19 = v5;
  id v25 = v19;
  id v26 = *(id *)(a1 + 56);
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(v6, v20, v15, (uint64_t)v14, v16, v21);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void sub_1B4F7A6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F7A6EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = sub_1B4F7A7EC;
  v7[3] = &unk_1E60BBEB0;
  id v8 = v3;
  id v5 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = WeakRetained;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void sub_1B4F7A7EC(uint64_t a1)
{
  id v5 = (void *)MEMORY[0x1BA995D10]();
  if (!*(void *)(a1 + 32)
    && (objc_msgSend_containsObject_(*(void **)(a1 + 40), v2, *(void *)(a1 + 48), v3, v4) & 1) == 0)
  {
    objc_msgSend_addObject_(*(void **)(a1 + 40), v6, *(void *)(a1 + 48), v7, v8);
    id v17 = objc_msgSend_delegate(*(void **)(a1 + 56), v9, v10, v11, v12);
    if (v17)
    {
      uint64_t v18 = *(void *)(a1 + 56);
      id v19 = objc_msgSend_copy(*(void **)(a1 + 40), v13, v14, v15, v16);
      objc_msgSend_XPCConnection_updatedRegisteredEventIDs_(v17, v20, v18, (uint64_t)v19, v21);
    }
    objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 56), v13, v14, v15, v16);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = sub_1B4F7A90C;
  v23[3] = &unk_1E60BBE60;
  id v22 = *(NSObject **)(a1 + 64);
  id v25 = *(id *)(a1 + 72);
  id v24 = *(id *)(a1 + 32);
  dispatch_async(v22, v23);
}

void sub_1B4F7A90C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_1B4F7ABC0(uint64_t a1)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  id v3 = *(id *)(*(void *)(a1 + 32) + 72);
  id v4 = *(id *)(*(void *)(a1 + 32) + 16);
  id v5 = *(id *)(*(void *)(a1 + 32) + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v6 = *(void **)(a1 + 32);
  uint64_t v11 = objc_msgSend_type(*(void **)(a1 + 40), v7, v8, v9, v10);
  uint64_t v12 = *(void *)(a1 + 40);
  v29[0] = @"EventID";
  v29[1] = @"Remove";
  v30[0] = v12;
  v30[1] = MEMORY[0x1E4F1CC38];
  uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v30, (uint64_t)v29, 2);
  uint64_t v15 = sub_1B4F5350C(v11);
  uint64_t v16 = *(void *)(a1 + 48);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B4F7AE0C;
  v21[3] = &unk_1E60BBE88;
  objc_copyWeak(&v27, &location);
  id v17 = v4;
  id v22 = v17;
  id v18 = v3;
  id v23 = v18;
  id v24 = *(id *)(a1 + 40);
  id v19 = v5;
  id v25 = v19;
  id v26 = *(id *)(a1 + 56);
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(v6, v20, v15, (uint64_t)v14, v16, v21);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void sub_1B4F7ADE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F7AE0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B4F7AF08;
  v8[3] = &unk_1E60BBEB0;
  id v5 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = WeakRetained;
  id v12 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  id v13 = v3;
  id v14 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void sub_1B4F7AF08(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  if (objc_msgSend_containsObject_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5))
  {
    objc_msgSend_removeObject_(*(void **)(a1 + 32), v6, *(void *)(a1 + 40), v7, v8);
    id v17 = objc_msgSend_delegate(*(void **)(a1 + 48), v9, v10, v11, v12);
    if (v17)
    {
      uint64_t v18 = *(void *)(a1 + 48);
      id v19 = objc_msgSend_copy(*(void **)(a1 + 32), v13, v14, v15, v16);
      objc_msgSend_XPCConnection_updatedRegisteredEventIDs_(v17, v20, v18, (uint64_t)v19, v21);
    }
    objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 48), v13, v14, v15, v16);
  }
  id v22 = *(NSObject **)(a1 + 56);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = sub_1B4F7B024;
  v23[3] = &unk_1E60BBE60;
  id v25 = *(id *)(a1 + 72);
  id v24 = *(id *)(a1 + 64);
  dispatch_async(v22, v23);
}

void sub_1B4F7B024(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_1B4F7B27C(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  id v2 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        dispatch_group_enter(v2);
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v13 = objc_msgSend_type(v7, v9, v10, v11, v12);
        uint64_t v14 = sub_1B4F5350C(v13);
        v33[0] = @"EventID";
        v33[1] = @"Remove";
        v34[0] = v7;
        v34[1] = MEMORY[0x1E4F1CC38];
        uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v34, (uint64_t)v33, 2);
        uint64_t v17 = *(void *)(a1 + 40);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = sub_1B4F7B508;
        v27[3] = &unk_1E60BBED8;
        uint64_t v28 = v2;
        objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(v8, v18, v14, (uint64_t)v16, v17, v27);
      }
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v29, (uint64_t)v35, 16);
    }
    while (v5);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(NSObject **)(v20 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7B510;
  block[3] = &unk_1E60BBF00;
  void block[4] = v20;
  id v26 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v21, block);
}

void sub_1B4F7B508(uint64_t a1)
{
}

void sub_1B4F7B510(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (objc_msgSend_count(*(void **)(*(void *)(a1 + 32) + 72), a2, a3, a4, a5))
  {
    objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 72), v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_delegate(*(void **)(a1 + 32), v10, v11, v12, v13);
    id v19 = v14;
    if (v14) {
      objc_msgSend_XPCConnection_updatedRegisteredEventIDs_(v14, v15, *(void *)(a1 + 32), 0, v18);
    }
    objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 32), v15, v16, v17, v18);
  }
  uint64_t v20 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7B5F0;
  block[3] = &unk_1E60BBCF8;
  id v22 = *(id *)(a1 + 40);
  dispatch_async(v20, block);
}

void sub_1B4F7B5F0(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_1B4F7B748(uint64_t a1)
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v4 = *(id *)(v3 + 64);
    id v5 = *(id *)(*(void *)(a1 + 40) + 16);
    id v6 = *(id *)(*(void *)(a1 + 40) + 32);
    if (objc_msgSend_containsObject_(v4, v7, *(void *)(a1 + 32), v8, v9))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B4F7C0E4;
      block[3] = &unk_1E60BBCF8;
      id v42 = *(id *)(a1 + 56);
      dispatch_async(v6, block);
    }
    else
    {
      objc_msgSend_addObject_(v4, v10, *(void *)(a1 + 32), v11, v12);
      objc_initWeak(&location, *(id *)(a1 + 40));
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v19 = objc_msgSend_type(*(void **)(a1 + 32), v15, v16, v17, v18);
      uint64_t v20 = *(void *)(a1 + 32);
      v56[0] = @"Activity";
      v56[1] = @"Remove";
      v57[0] = v20;
      v57[1] = MEMORY[0x1E4F1CC28];
      id v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v57, (uint64_t)v56, 2);
      uint64_t v23 = sub_1B4F534E8(v19);
      uint64_t v24 = *(void *)(a1 + 48);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = sub_1B4F7BB6C;
      v48[3] = &unk_1E60BBE88;
      objc_copyWeak(&v54, &location);
      id v25 = v5;
      id v49 = v25;
      id v50 = v4;
      id v51 = *(id *)(a1 + 32);
      __int16 v52 = v6;
      id v53 = *(id *)(a1 + 56);
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(v14, v26, v23, (uint64_t)v22, v24, v48);

      if (objc_msgSend_timeout(*(void **)(a1 + 32), v27, v28, v29, v30))
      {
        int64_t v35 = objc_msgSend_timeout(*(void **)(a1 + 32), v31, v32, v33, v34);
        dispatch_time_t v36 = dispatch_time(0, v35);
        uint64_t v37 = *(void *)(a1 + 40);
        id v38 = *(NSObject **)(v37 + 16);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = sub_1B4F7BD90;
        v43[3] = &unk_1E60BBF50;
        v43[4] = v37;
        id v44 = *(id *)(a1 + 32);
        id v45 = *(id *)(a1 + 48);
        objc_copyWeak(&v47, &location);
        id v46 = v25;
        dispatch_after(v36, v38, v43);

        objc_destroyWeak(&v47);
      }

      objc_destroyWeak(&v54);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v13 = *(NSObject **)(v3 + 32);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_1B4F7C170;
    v39[3] = &unk_1E60BBCF8;
    id v40 = *(id *)(a1 + 56);
    dispatch_async(v13, v39);
    id v4 = v40;
  }
}

void sub_1B4F7BB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 152));
  _Unwind_Resume(a1);
}

void sub_1B4F7BB6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = sub_1B4F7BC6C;
  v7[3] = &unk_1E60BBEB0;
  id v8 = v3;
  id v5 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = WeakRetained;
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void sub_1B4F7BC6C(uint64_t a1)
{
  id v6 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32)) {
    objc_msgSend_removeObject_(*(void **)(a1 + 40), v2, *(void *)(a1 + 48), v4, v5);
  }
  objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 56), v2, v3, v4, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B4F7BD3C;
  v8[3] = &unk_1E60BBE60;
  uint64_t v7 = *(NSObject **)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 32);
  dispatch_async(v7, v8);
}

void sub_1B4F7BD3C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_1B4F7BD90(uint64_t a1)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  if (objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 32) + 64), v3, *(void *)(a1 + 40), v4, v5))
  {
    objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 32) + 64), v6, *(void *)(a1 + 40), v7, v8);
    id v9 = *(void **)(a1 + 32);
    uint64_t v14 = objc_msgSend_type(*(void **)(a1 + 40), v10, v11, v12, v13);
    uint64_t v15 = sub_1B4F534E8(v14);
    uint64_t v16 = *(void *)(a1 + 40);
    v25[0] = @"Activity";
    v25[1] = @"Remove";
    v26[0] = v16;
    v26[1] = MEMORY[0x1E4F1CC38];
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v26, (uint64_t)v25, 2);
    uint64_t v19 = *(void *)(a1 + 48);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1B4F7BF4C;
    v21[3] = &unk_1E60BBF28;
    objc_copyWeak(&v24, (id *)(a1 + 64));
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 56);
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(v9, v20, v15, (uint64_t)v18, v19, v21);

    objc_destroyWeak(&v24);
  }
}

void sub_1B4F7BF30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F7BF4C(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_send_and_compose_impl();
  }

  uint64_t v7 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7C0A0;
  block[3] = &unk_1E60BB768;
  void block[4] = WeakRetained;
  dispatch_async(v7, block);
}

void sub_1B4F7C0A0(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 32), v3, v4, v5, v6);
}

void sub_1B4F7C0E4(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 37, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F7C170(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F7C2E0(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32))
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 40) + 64);
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v51, (uint64_t)v57, 16);
    if (v9)
    {
      uint64_t v10 = *(void *)v52;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend_UUID(v12, v5, v6, v7, v8);
        char isEqual = objc_msgSend_isEqual_(v13, v14, *(void *)(a1 + 32), v15, v16);

        if (isEqual) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v51, (uint64_t)v57, 16);
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v18 = v12;

      if (!v18) {
        goto LABEL_13;
      }
      id v19 = *(id *)(*(void *)(a1 + 40) + 64);
      id v20 = *(id *)(*(void *)(a1 + 40) + 16);
      id v21 = *(id *)(*(void *)(a1 + 40) + 32);
      id v40 = v19;
      objc_msgSend_removeObject_(v19, v22, (uint64_t)v18, v23, v24);
      objc_initWeak(&location, *(id *)(a1 + 40));
      id v25 = *(void **)(a1 + 40);
      uint64_t v30 = objc_msgSend_type(v18, v26, v27, v28, v29);
      v55[0] = @"Activity";
      v55[1] = @"Remove";
      v56[0] = v18;
      v56[1] = MEMORY[0x1E4F1CC38];
      uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)v56, (uint64_t)v55, 2);
      uint64_t v33 = sub_1B4F534E8(v30);
      uint64_t v34 = *(void *)(a1 + 48);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = sub_1B4F7C6C0;
      v45[3] = &unk_1E60BBFA0;
      objc_copyWeak(&v49, &location);
      id v35 = v20;
      id v46 = v35;
      id v36 = v21;
      id v47 = v36;
      id v48 = *(id *)(a1 + 56);
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(v25, v37, v33, (uint64_t)v32, v34, v45);

      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
    }
    else
    {
LABEL_10:

LABEL_13:
      id v38 = *(NSObject **)(*(void *)(a1 + 40) + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1B4F7C8B0;
      block[3] = &unk_1E60BBCF8;
      id v44 = *(id *)(a1 + 56);
      dispatch_async(v38, block);
      id v18 = v44;
    }
  }
  else
  {
    __int16 v39 = *(NSObject **)(*(void *)(a1 + 40) + 32);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1B4F7C93C;
    v41[3] = &unk_1E60BBCF8;
    id v42 = *(id *)(a1 + 56);
    dispatch_async(v39, v41);
    id v18 = v42;
  }
}

void sub_1B4F7C694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F7C6C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B4F7C798;
  v8[3] = &unk_1E60BBF78;
  void v8[4] = WeakRetained;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void sub_1B4F7C798(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 32), v3, v4, v5, v6);
  id v7 = *(NSObject **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B4F7C85C;
  v8[3] = &unk_1E60BBE60;
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  dispatch_async(v7, v8);
}

void sub_1B4F7C85C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_1B4F7C8B0(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 2, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F7C93C(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F7CA8C(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  id v2 = dispatch_group_create();
  id v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 64), v3, v4, v5, v6);
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 64), v8, v9, v10, v11);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v7;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v38, (uint64_t)v44, 16);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        dispatch_group_enter(v2);
        uint64_t v17 = *(void **)(a1 + 32);
        uint64_t v22 = objc_msgSend_type(v16, v18, v19, v20, v21);
        uint64_t v23 = sub_1B4F534E8(v22);
        v42[0] = @"Activity";
        v42[1] = @"Remove";
        v43[0] = v16;
        v43[1] = MEMORY[0x1E4F1CC38];
        id v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v43, (uint64_t)v42, 2);
        uint64_t v26 = *(void *)(a1 + 40);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = sub_1B4F7CD30;
        v36[3] = &unk_1E60BBED8;
        uint64_t v37 = v2;
        objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(v17, v27, v23, (uint64_t)v25, v26, v36);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v38, (uint64_t)v44, 16);
    }
    while (v14);
  }

  uint64_t v29 = *(void *)(a1 + 32);
  uint64_t v30 = *(NSObject **)(v29 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7CD38;
  block[3] = &unk_1E60BBF00;
  void block[4] = v29;
  id v35 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v30, block);
}

void sub_1B4F7CD30(uint64_t a1)
{
}

void sub_1B4F7CD38(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend___updateXPCTransactionCount(*(void **)(a1 + 32), a2, a3, a4, a5);
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7CDD4;
  block[3] = &unk_1E60BBCF8;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v6, block);
}

void sub_1B4F7CDD4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_1B4F7CF0C(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v6 = objc_msgSend_allValues(*(void **)(*(void *)(a1 + 32) + 56), v2, v3, v4, v5);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    char v14 = 0;
    uint64_t v15 = *(void *)v57;
    uint64_t v48 = *MEMORY[0x1E4F28798];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v57 != v15) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        id v18 = objc_msgSend_requestParameters(v17, v9, v10, v11, v12);
        uint64_t v23 = objc_msgSend_UUID(v18, v19, v20, v21, v22);
        int isEqual = objc_msgSend_isEqual_(v23, v24, *(void *)(a1 + 40), v25, v26);

        if (isEqual)
        {
          uint64_t v28 = objc_msgSend_delegate(*(void **)(a1 + 32), v9, v10, v11, v12);
          uint64_t v33 = v28;
          if (v28)
          {
            uint64_t v34 = *(NSObject **)(*(void *)(a1 + 32) + 24);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = sub_1B4F7D1F8;
            block[3] = &unk_1E60BB950;
            id v35 = v28;
            uint64_t v36 = *(void *)(a1 + 32);
            uint64_t v37 = *(void **)(a1 + 40);
            id v53 = v35;
            uint64_t v54 = v36;
            id v55 = v37;
            dispatch_async(v34, block);
          }
          long long v38 = objc_msgSend_response(v17, v29, v30, v31, v32);

          if (v38)
          {
            objc_msgSend_response(v17, v39, v40, v41, v42);
            long long v43 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
            uint64_t v45 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v44, v48, 89, 0);
            ((void (**)(void, void *, void))v43)[2](v43, v45, 0);
          }
          char v14 = 1;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v56, (uint64_t)v60, 16);
    }
    while (v13);
  }
  else
  {
    char v14 = 0;
  }

  id v46 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_1B4F7D240;
  v49[3] = &unk_1E60BBFC8;
  char v51 = v14 & 1;
  id v50 = *(id *)(a1 + 48);
  dispatch_async(v46, v49);
}

void sub_1B4F7D1F8(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_XPCConnection_canceledXPCRequestsWithUUID_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), *(void *)(a1 + 48), v4);
}

void sub_1B4F7D240(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  int v4 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  else if (v5)
  {
    uint64_t v6 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 2, 0);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

uint64_t sub_1B4F7D4EC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F7D504(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F7D674(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B4F7D690(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (v5)
  {
    uint64_t v10 = objc_msgSend___allowXPCRequestWithType_error_(WeakRetained, v7, 7, 0, v8);
    uint64_t v13 = objc_msgSend___allowXPCRequestWithType_error_(v9, v11, 9, 0, v12);
    uint64_t v16 = objc_msgSend___allowXPCRequestWithType_error_(v9, v14, 22, 0, v15);
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      uint64_t v19 = objc_msgSend___privacyFilteredScanResult_allowSSID_allowBSSID_allowCountryCode_(v9, v17, (uint64_t)v5, v10, v13, v16);
      (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v21, v19);
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 32);
    if (v20) {
      (*(void (**)(uint64_t, id, void))(v20 + 16))(v20, v21, 0);
    }
  }
}

void sub_1B4F7D9DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F7E1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F7E1F8(id *a1, uint64_t a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1 + 6;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = a1[4];
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v5, v8, @"Result", v9, v10);

  if (v11 && objc_msgSend_count(a1[4], v12, v13, v14, v15))
  {
    uint64_t v16 = objc_msgSend___matchedScanResultsWithKnownNetworkProfiles_scanResults_(WeakRetained, v12, (uint64_t)v11, (uint64_t)a1[4], v15);

    id v7 = (id)v16;
  }
  uint64_t v17 = objc_msgSend_response(a1[5], v12, v13, v14, v15);

  if (v17)
  {
    objc_msgSend_response(a1[5], v18, v19, v20, v21);
    uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v25 = @"Result";
    v26[0] = v7;
    uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v26, (uint64_t)&v25, 1);
    ((void (**)(void, void, void *))v22)[2](v22, 0, v24);
  }
}

void sub_1B4F7E594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F7E5C0(uint64_t a1, uint64_t a2, void *a3)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)(a1 + 56);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v11 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v5, v12, @"Result", v13, v14);

  if (objc_msgSend_count(v15, v16, v17, v18, v19)) {
    objc_msgSend_addObjectsFromArray_(v11, v20, (uint64_t)v15, v21, v22);
  }
  objc_msgSend_addObjectsFromArray_(v11, v20, *(void *)(a1 + 32), v21, v22);
  if (objc_msgSend_includeMatchingKnownNetworkProfiles(*(void **)(a1 + 40), v23, v24, v25, v26))
  {
    uint64_t v31 = objc_msgSend_allObjects(v11, v27, v28, v29, v30);
    objc_msgSend___matchKnownNetworksWithScanResults_parentXPCRequest_(WeakRetained, v32, (uint64_t)v31, *(void *)(a1 + 48), v33);
  }
  else
  {
    uint64_t v34 = objc_msgSend_response(*(void **)(a1 + 48), v27, v28, v29, v30);

    if (v34)
    {
      objc_msgSend_response(*(void **)(a1 + 48), v35, v36, v37, v38);
      long long v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v47 = @"Result";
      id v44 = objc_msgSend_allObjects(v11, v40, v41, v42, v43);
      v48[0] = v44;
      id v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)v48, (uint64_t)&v47, 1);
      ((void (**)(void, void, void *))v39)[2](v39, 0, v46);
    }
  }
}

void sub_1B4F7EA4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F7EA78(void **a1, void *a2, void *a3)
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v6, v8, @"Result", v9, v10);
  uint64_t v16 = v11;
  if (v5 || !objc_msgSend_count(v11, v12, v13, v14, v15))
  {
    uint64_t v17 = objc_msgSend_response(a1[5], v12, v13, v14, v15);

    if (v17)
    {
      objc_msgSend_response(a1[5], v18, v19, v20, v21);
      uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, id))v22)[2](v22, v5, v6);
    }
  }
  else
  {
    uint64_t v23 = objc_msgSend_ANQPElementIDListForPasspointScanResults(a1[4], v12, v13, v14, v15);
    if (objc_msgSend_count(v23, v24, v25, v26, v27))
    {
      uint64_t v31 = objc_msgSend___passpointScanResults_(WeakRetained, v28, (uint64_t)v16, v29, v30);
    }
    else
    {
      uint64_t v31 = 0;
    }

    uint64_t v36 = objc_msgSend_count(v31, v32, v33, v34, v35);
    uint64_t v40 = (uint64_t)a1[4];
    if (v36)
    {
      objc_msgSend___performFollowupANQPForPasspointScanResults_combinedScanResults_parameters_parentXPCRequest_(WeakRetained, v37, (uint64_t)v31, (uint64_t)v16, v40, a1[5]);
    }
    else
    {
      int v41 = objc_msgSend_includeMatchingKnownNetworkProfiles(a1[4], v37, v38, v39, v40);
      uint64_t v45 = (uint64_t)a1[5];
      if (v41)
      {
        objc_msgSend___matchKnownNetworksWithScanResults_parentXPCRequest_(WeakRetained, v42, (uint64_t)v16, v45, v44);
      }
      else
      {
        id v46 = objc_msgSend_response(a1[5], v42, v43, v45, v44);

        if (v46)
        {
          objc_msgSend_response(a1[5], v47, v48, v49, v50);
          char v51 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          uint64_t v54 = @"Result";
          v55[0] = v16;
          id v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v52, (uint64_t)v55, (uint64_t)&v54, 1);
          ((void (**)(void, void, void *))v51)[2](v51, 0, v53);
        }
      }
    }
  }
}

void sub_1B4F7EF48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1B4F7EF98(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"Result", v8, v9);

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    if (v10)
    {
      uint64_t v15 = objc_msgSend___filterScanResultsForPrivacy_(WeakRetained, v11, (uint64_t)v10, v12, v13);
      (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v16, v15);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v16, 0);
    }
  }
}

void sub_1B4F7F084(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"Result", v8, v9);

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    if (v10)
    {
      uint64_t v15 = objc_msgSend___filterScanResultsForPrivacy_(WeakRetained, v11, (uint64_t)v10, v12, v13);
      (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v16, v15);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v16, 0);
    }
  }
}

void sub_1B4F7F170(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

void sub_1B4F7F3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F7F3D0(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"Result", v8, v9);
  if (!v21
    && objc_msgSend_count(v14, v10, v11, v12, v13)
    && objc_msgSend_includeMatchingKnownNetworkProfiles(*(void **)(a1 + 32), v10, v11, v12, v13))
  {
    objc_msgSend___matchKnownNetworksWithScanResults_parentXPCRequest_(WeakRetained, v10, (uint64_t)v14, *(void *)(a1 + 40), v13);
  }
  else
  {
    uint64_t v15 = objc_msgSend_response(*(void **)(a1 + 40), v10, v11, v12, v13);

    if (v15)
    {
      objc_msgSend_response(*(void **)(a1 + 40), v16, v17, v18, v19);
      uint64_t v20 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, id))v20)[2](v20, v21, v5);
    }
  }
}

void sub_1B4F7F6F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B4F7F724(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"Result", v8, v9);

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    if (v10)
    {
      uint64_t v15 = objc_msgSend___filterScanResultsForPrivacy_(WeakRetained, v11, (uint64_t)v10, v12, v13);
      (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v16, v15);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v16, 0);
    }
  }
}

void sub_1B4F7F810(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"Result", v8, v9);

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    if (v10)
    {
      uint64_t v15 = objc_msgSend___filterScanResultsForPrivacy_(WeakRetained, v11, (uint64_t)v10, v12, v13);
      (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v16, v15);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v16, 0);
    }
  }
}

void sub_1B4F7F8FC(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

uint64_t sub_1B4F7FB28(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F7FB40(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F7FD18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F7FF0C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F7FF24(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F80188(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F8022C(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

uint64_t sub_1B4F80400(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F805B4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F805CC(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F80704(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F80BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B4F80BE4(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v20 = @"AssocParams";
  v21[0] = v3;
  id v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v21, (uint64_t)&v20, 1);
  uint64_t v10 = objc_msgSend_requestParameters(*(void **)(a1 + 40), v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_UUID(*(void **)(a1 + 40), v11, v12, v13, v14);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1B4F80D38;
  v18[3] = &unk_1E60BBED8;
  id v19 = *(id *)(a1 + 40);
  id v17 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(WeakRetained, v16, 62, (uint64_t)v5, (uint64_t)v10, v15, 0, v18);
}

void sub_1B4F80D38(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_response(*(void **)(a1 + 32), v6, v7, v8, v9);

  if (v10)
  {
    objc_msgSend_response(*(void **)(a1 + 32), v11, v12, v13, v14);
    uint64_t v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id))v15)[2](v15, v16, v5);
  }
}

uint64_t sub_1B4F81060(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F81078(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F81090(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F81268(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F813CC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F81580(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F81624(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

void sub_1B4F81850(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F818F4(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

void sub_1B4F81A8C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

uint64_t sub_1B4F81CCC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F81CE4(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F81F2C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F81F44(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F821A8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F821C0(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F823B8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F8277C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F82900(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F82A74(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F82C48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F82CEC(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

uint64_t sub_1B4F82F18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F82F30(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F83158(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F83170(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F832C8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F83538(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F83550(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F837A8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F837C0(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F83A18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F83A30(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F83C58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F83CFC(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

uint64_t sub_1B4F83F18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F83F30(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F840F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B4F84110(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"Result", v8, v9);

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    if (v10)
    {
      uint64_t v15 = objc_msgSend___filterScanResultsForPrivacy_(WeakRetained, v11, (uint64_t)v10, v12, v13);
      (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v16, v15);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v16, 0);
    }
  }
}

void sub_1B4F842E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B4F84300(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"Result", v8, v9);

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14)
  {
    if (v10)
    {
      uint64_t v15 = objc_msgSend___filterScanResultsForPrivacy_(WeakRetained, v11, (uint64_t)v10, v12, v13);
      (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v16, v15);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v16, 0);
    }
  }
}

uint64_t sub_1B4F84598(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F845B0(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F847E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F84800(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F84A28(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F84A40(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F84B78(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F84D2C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F84DD0(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

void sub_1B4F84FFC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F850A0(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

uint64_t sub_1B4F85308(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F85320(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F85458(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

uint64_t sub_1B4F85648(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4F85838(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F85850(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F85A78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F85B1C(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

uint64_t sub_1B4F85D84(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F85D9C(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

uint64_t sub_1B4F85FE4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4F85FFC(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, *MEMORY[0x1E4F28798], 22, 0);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void sub_1B4F8621C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F86434(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4F86618(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

uint64_t sub_1B4F866F8()
{
  uint64_t result = _sl_dlopen();
  qword_1E9D45BD8 = result;
  return result;
}

void *sub_1B4F8676C(void *a1)
{
  uint64_t v2 = sub_1B4F514E8();
  if (v2)
  {
    uint64_t v7 = (void *)v2;
  }
  else
  {
    a1 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v3, v4, v5, v6);
    uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v9, (uint64_t)"void *AppSupportLibrary(void)", v10, v11);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(a1, v12, (uint64_t)v7, @"CWFXPCConnection.m", 36, @"%s", 0);

    __break(1u);
    free(v13);
  }
  uint64_t result = dlsym(v7, "CPCopyBundleIdentifierAndTeamFromAuditToken");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  off_1E9D45BF0 = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t sub_1B4F8684C()
{
  uint64_t result = _sl_dlopen();
  qword_1EB4B25F8 = result;
  return result;
}

void sub_1B4F868C0(void *a1)
{
  if (!sub_1B4F39964())
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v2, v3, v4, v5);
    a1 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"void *CoreLocationLibrary(void)", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v14, (uint64_t)a1, @"CWFXPCConnection.m", 44, @"%s", 0);

    __break(1u);
    free(v15);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = objc_getClass("CLLocationManager");
  if (*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    qword_1E9D45C00 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  else
  {
    id v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8, v9);
    uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)"Class getCLLocationManagerClass(void)_block_invoke", v18, v19);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v21, (uint64_t)v20, @"CWFXPCConnection.m", 45, @"Unable to find class %s", "CLLocationManager");

    __break(1u);
  }
}

void sub_1B4F87664(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v4 = (void (*)(uint64_t, uint64_t))off_1E9D45C30;
  uint64_t v20 = off_1E9D45C30;
  if (!off_1E9D45C30)
  {
    uint64_t v5 = sub_1B4F88108();
    v18[3] = (uint64_t)dlsym(v5, "EAPSecIdentityHandleCreateSecIdentity");
    off_1E9D45C30 = (_UNKNOWN *)v18[3];
    uint64_t v4 = (void (*)(uint64_t, uint64_t))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v4)
  {
    v4(a1, a2);
  }
  else
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"OSStatus soft_EAPSecIdentityHandleCreateSecIdentity(EAPSecIdentityHandleRef, SecIdentityRef *)", v12, v13);
    uint64_t v15 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v16, (uint64_t)v14, @"CWFEAPCredentials.m", 23, @"%s", v15);

    __break(1u);
  }
}

void sub_1B4F877BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4F87820(uint64_t a1)
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v2 = (void (*)(uint64_t))off_1E9D45C38;
  uint64_t v18 = off_1E9D45C38;
  if (!off_1E9D45C38)
  {
    uint64_t v3 = sub_1B4F88108();
    v16[3] = (uint64_t)dlsym(v3, "EAPSecIdentityHandleCreate");
    off_1E9D45C38 = (_UNKNOWN *)v16[3];
    uint64_t v2 = (void (*)(uint64_t))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (v2)
  {
    v2(a1);
  }
  else
  {
    uint64_t v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_stringWithUTF8String_(NSString, v9, (uint64_t)"EAPSecIdentityHandleRef soft_EAPSecIdentityHandleCreate(SecIdentityRef)", v10, v11);
    uint64_t v13 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v8, v14, (uint64_t)v12, @"CWFEAPCredentials.m", 27, @"%s", v13);

    __break(1u);
  }
}

void sub_1B4F87970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F87F74()
{
  if (!qword_1E9D45BE0) {
    qword_1E9D45BE0 = _sl_dlopen();
  }
  return qword_1E9D45BE0;
}

uint64_t sub_1B4F88044()
{
  uint64_t result = _sl_dlopen();
  qword_1E9D45BE0 = result;
  return result;
}

void *sub_1B4F880B8(uint64_t a1)
{
  uint64_t v2 = sub_1B4F88108();
  uint64_t result = dlsym(v2, "EAPSecIdentityHandleCreateSecIdentity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1E9D45C30 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1B4F88108()
{
  uint64_t v0 = sub_1B4F87F74();
  if (v0) {
    return (void *)v0;
  }
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v1, v2, v3, v4);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *EAP8021XLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v10, @"CWFEAPCredentials.m", 17, @"%s", 0);

  __break(1u);
  free(v12);
  return v5;
}

void *sub_1B4F881B8(uint64_t a1)
{
  uint64_t v2 = sub_1B4F88108();
  uint64_t result = dlsym(v2, "EAPSecIdentityHandleCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1E9D45C38 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B4F88670(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_resume(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v6, v7, v8, v9, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

void sub_1B4F887E8(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_suspend(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v6, v7, v8, v9, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

void sub_1B4F88960(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_msgSend_setDelegate_(v12, v6, 0, v7, v8, (void)v36);
        objc_msgSend_invalidate(v12, v13, v14, v15, v16);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v36, (uint64_t)v40, 16);
    }
    while (v9);
  }

  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 16), v17, v18, v19, v20);
  objc_msgSend_stopEventMonitoring(*(void **)(*(void *)(a1 + 32) + 24), v21, v22, v23, v24);
  objc_msgSend_setDelegate_(*(void **)(*(void *)(a1 + 32) + 24), v25, 0, v26, v27);
  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 24), v28, v29, v30, v31);
  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 32), v32, v33, v34, v35);
}

void sub_1B4F88B7C(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v3);
        }
        long long v13 = *(void **)(a1 + 40);
        uint64_t v14 = objc_msgSend_registeredEventIDs(*(void **)(*((void *)&v18 + 1) + 8 * v12), v6, v7, v8, v9, (void)v18);
        objc_msgSend_unionSet_(v13, v15, (uint64_t)v14, v16, v17);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v10);
  }
}

void sub_1B4F88DA0(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(a1[4] + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v3);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_serviceType(v13, v6, v7, v8, v9, (void)v17) == a1[6])
        {
          uint64_t v14 = objc_msgSend_localXPCClient(v13, v6, v7, v8, v9);
          uint64_t v15 = *(void *)(a1[5] + 8);
          uint64_t v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_1B4F88FD4(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = *(id *)(a1[4] + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v3);
        }
        long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend_serviceType(v13, v6, v7, v8, v9, (void)v22) == a1[6])
        {
          uint64_t v14 = objc_msgSend_XPCListener(v13, v6, v7, v8, v9);
          uint64_t v19 = objc_msgSend_endpoint(v14, v15, v16, v17, v18);
          uint64_t v20 = *(void *)(a1[5] + 8);
          long long v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_1B4F891AC(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  if (objc_opt_class())
  {
    __int16 v62 = v2;
    uint64_t v7 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v3, v4, v5, v6);
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v73, (uint64_t)v78, 16);
    if (v65)
    {
      uint64_t v64 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v65; ++i)
        {
          if (*(void *)v74 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          uint64_t v15 = objc_msgSend_XPCConnections(v14, v9, v10, v11, v12);
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v69, (uint64_t)v77, 16);
          if (v17)
          {
            uint64_t v22 = v17;
            uint64_t v23 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v70 != v23) {
                  objc_enumerationMutation(v15);
                }
                long long v25 = *(void **)(*((void *)&v69 + 1) + 8 * j);
                if ((objc_msgSend_isLocal(v25, v18, v19, v20, v21) & 1) == 0)
                {
                  uint64_t v26 = objc_msgSend_registeredEventIDs(v25, v18, v19, v20, v21);
                  uint64_t v31 = objc_msgSend_count(v26, v27, v28, v29, v30);

                  if (v31)
                  {
                    uint64_t v32 = NSNumber;
                    uint64_t v33 = objc_msgSend_XPCConnection(v25, v18, v19, v20, v21);
                    uint64_t v38 = objc_msgSend_processIdentifier(v33, v34, v35, v36, v37);
                    uint64_t v42 = objc_msgSend_numberWithInt_(v32, v39, v38, v40, v41);
                    objc_msgSend_addObject_(v7, v43, (uint64_t)v42, v44, v45);
                  }
                }
              }
              uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v69, (uint64_t)v77, 16);
            }
            while (v22);
          }
        }
        uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v73, (uint64_t)v78, 16);
      }
      while (v65);
    }

    if ((objc_msgSend_isEqualToSet_(*(void **)(*(void *)(a1 + 32) + 40), v46, (uint64_t)v7, v47, v48) & 1) == 0)
    {
      objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 40), v49, v50, v51, v52);
      objc_msgSend_unionSet_(*(void **)(*(void *)(a1 + 32) + 40), v53, (uint64_t)v7, v54, v55);
      long long v56 = *(void **)(*(void *)(a1 + 32) + 32);
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = sub_1B4F89498;
      v66[3] = &unk_1E60BC100;
      id v57 = v7;
      uint64_t v58 = *(void *)(a1 + 32);
      id v67 = v57;
      uint64_t v68 = v58;
      objc_msgSend_updateConfiguration_(v56, v59, (uint64_t)v66, v60, v61);
    }
    uint64_t v2 = v62;
  }
}

void sub_1B4F89498(uint64_t a1, void *a2)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v8 = objc_msgSend_descriptor(MEMORY[0x1E4F96448], v4, v5, v6, v7);
  objc_msgSend_setValues_(v8, v9, 1, v10, v11);
  if (MEMORY[0x1E4F62710])
  {
    v61[0] = *MEMORY[0x1E4F62710];
    uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v61, 1, v14);
    objc_msgSend_setEndowmentNamespaces_(v8, v16, (uint64_t)v15, v17, v18);
  }
  uint64_t v54 = v8;
  objc_msgSend_setStateDescriptor_(v3, v12, (uint64_t)v8, v13, v14);
  uint64_t v23 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v19, v20, v21, v22);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v24 = *(id *)(a1 + 32);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v26)
  {
    uint64_t v31 = v26;
    uint64_t v32 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v57 != v32) {
          objc_enumerationMutation(v24);
        }
        uint64_t v34 = (void *)MEMORY[0x1E4F96430];
        uint64_t v35 = (void *)MEMORY[0x1E4F963F8];
        uint64_t v36 = objc_msgSend_intValue(*(void **)(*((void *)&v56 + 1) + 8 * i), v27, v28, v29, v30);
        uint64_t v40 = objc_msgSend_identifierWithPid_(v35, v37, v36, v38, v39);
        uint64_t v44 = objc_msgSend_predicateMatchingIdentifier_(v34, v41, (uint64_t)v40, v42, v43);

        objc_msgSend_addObject_(v23, v45, (uint64_t)v44, v46, v47);
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v56, (uint64_t)v60, 16);
    }
    while (v31);
  }

  objc_msgSend_setPredicates_(v3, v48, (uint64_t)v23, v49, v50);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  void v55[2] = sub_1B4F896E8;
  v55[3] = &unk_1E60BC0D8;
  void v55[4] = *(void *)(a1 + 40);
  objc_msgSend_setUpdateHandler_(v3, v51, (uint64_t)v55, v52, v53);
}

void sub_1B4F896E8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_state(v7, v8, v9, v10, v11);
  int v17 = objc_msgSend_taskState(v12, v13, v14, v15, v16);

  uint64_t v22 = objc_msgSend_previousState(v7, v18, v19, v20, v21);
  int v27 = objc_msgSend_taskState(v22, v23, v24, v25, v26);

  uint64_t v32 = (uint64_t *)MEMORY[0x1E4F62710];
  if (MEMORY[0x1E4F62710])
  {
    uint64_t v33 = objc_msgSend_state(v7, v28, v29, v30, v31);
    uint64_t v38 = objc_msgSend_endowmentNamespaces(v33, v34, v35, v36, v37);
    uint64_t v39 = *v32;
    LODWORD(v32) = objc_msgSend_containsObject_(v38, v40, *v32, v41, v42);

    uint64_t v47 = objc_msgSend_previousState(v7, v43, v44, v45, v46);
    uint64_t v52 = objc_msgSend_endowmentNamespaces(v47, v48, v49, v50, v51);
    int v56 = objc_msgSend_containsObject_(v52, v53, v39, v54, v55);
  }
  else
  {
    int v56 = 0;
  }
  if ((v17 != 3) == (v27 == 3) || v32 != v56)
  {
    uint64_t v57 = *(void *)(a1 + 32);
    long long v58 = *(NSObject **)(v57 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F89894;
    block[3] = &unk_1E60BB950;
    void block[4] = v57;
    id v60 = v6;
    id v61 = v7;
    dispatch_async(v58, block);
  }
}

void sub_1B4F89894(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v2, (uint64_t)&v51, (uint64_t)v56, 16);
  if (v46)
  {
    uint64_t v45 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v52 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v9 = objc_msgSend_XPCConnections(v8, v3, v4, v5, v6, context);
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v47, (uint64_t)v55, 16);
        if (v11)
        {
          uint64_t v16 = v11;
          uint64_t v17 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v48 != v17) {
                objc_enumerationMutation(v9);
              }
              uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * j);
              if ((objc_msgSend_isLocal(v19, v12, v13, v14, v15) & 1) == 0)
              {
                int v20 = objc_msgSend_pid(*(void **)(a1 + 40), v12, v13, v14, v15);
                uint64_t v25 = objc_msgSend_XPCConnection(v19, v21, v22, v23, v24);
                if (v20 == objc_msgSend_processIdentifier(v25, v26, v27, v28, v29))
                {
                  uint64_t v34 = objc_msgSend_registeredEventIDs(v19, v30, v31, v32, v33);
                  uint64_t v39 = objc_msgSend_count(v34, v35, v36, v37, v38);

                  if (!v39) {
                    continue;
                  }
                  uint64_t v25 = objc_msgSend_state(*(void **)(a1 + 48), v12, v13, v14, v15);
                  objc_msgSend_setProcessState_(v19, v40, (uint64_t)v25, v41, v42);
                }
              }
            }
            uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v47, (uint64_t)v55, 16);
          }
          while (v16);
        }
      }
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v51, (uint64_t)v56, 16);
    }
    while (v46);
  }
}

void sub_1B4F89C7C(uint64_t a1)
{
}

void sub_1B4F8BF88(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (objc_msgSend__isHomeNetwork(v10, v3, v4, v5, v6)) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v7, (uint64_t)v10, v8, v9);
  }
}

uint64_t sub_1B4F8C650(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__isHomeNetwork(a2, (const char *)a2, a3, a4, a5);
}

BOOL sub_1B4F8C730(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_msgSend_isPersonalHotspot(v4, v5, v6, v7, v8) & 1) == 0
    && (objc_msgSend_isCarPlayNetwork(v4, v9, v10, v11, v12) & 1) == 0
    && (objc_msgSend_isCarPlay(v4, v13, v14, v15, v16) & 1) == 0
    && objc_msgSend_movingAttribute(v4, v17, v18, v19, v20) != 1)
  {
    uint64_t v31 = objc_msgSend_lastJoinedAt(v4, v21, v22, v23, v24);
    if (v31
      && (objc_msgSend_lastJoinedAt(v4, v27, v28, v29, v30),
          uint64_t v2 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_compare_(v2, v32, *(void *)(a1 + 32), v33, v34) == 1))
    {
      BOOL v25 = 1;
    }
    else
    {
      uint64_t v35 = objc_msgSend_lastJoinedOnAnyDeviceAt(v4, v27, v28, v29, v30);
      if (v35)
      {
        uint64_t v40 = (void *)v35;
        uint64_t v41 = objc_msgSend_lastJoinedOnAnyDeviceAt(v4, v36, v37, v38, v39);
        BOOL v25 = objc_msgSend_compare_(v41, v42, *(void *)(a1 + 32), v43, v44) == 1;

        if (!v31)
        {
LABEL_13:

          goto LABEL_6;
        }
      }
      else
      {
        BOOL v25 = 0;
        if (!v31) {
          goto LABEL_13;
        }
      }
    }

    goto LABEL_13;
  }
  BOOL v25 = 0;
LABEL_6:

  return v25;
}

uint64_t sub_1B4F8C8B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend__homeNetworkComparator(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t v11 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v16 = ((uint64_t (**)(void, id, id))v11)[2](v11, v5, v6);
  if (!v16)
  {
    objc_msgSend__lastJoinedComparator(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v17 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v16 = ((uint64_t (**)(void, id, id))v17)[2](v17, v5, v6);
  }
  return v16;
}

uint64_t sub_1B4F8C96C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_lastJoinedAt(v4, v6, v7, v8, v9);
  if (v10)
  {
  }
  else
  {
    uint64_t v35 = objc_msgSend_lastJoinedAt(v5, v11, v12, v13, v14);

    if (v35)
    {
      uint64_t v36 = -1;
      goto LABEL_12;
    }
  }
  uint64_t v19 = objc_msgSend_lastJoinedAt(v4, v15, v16, v17, v18);
  if (v19)
  {
    uint64_t v24 = (void *)v19;
    BOOL v25 = objc_msgSend_lastJoinedAt(v5, v20, v21, v22, v23);

    if (!v25)
    {
      uint64_t v36 = 1;
      goto LABEL_12;
    }
  }
  uint64_t v26 = objc_msgSend_lastJoinedAt(v4, v20, v21, v22, v23);
  if (v26)
  {

LABEL_10:
    uint64_t v37 = objc_msgSend_lastJoinedAt(v5, v31, v32, v33, v34);
    uint64_t v42 = objc_msgSend_lastJoinedAt(v4, v38, v39, v40, v41);
    uint64_t v36 = objc_msgSend_compare_(v37, v43, (uint64_t)v42, v44, v45);

    goto LABEL_12;
  }
  uint64_t v36 = objc_msgSend_lastJoinedAt(v5, v27, v28, v29, v30);

  if (v36) {
    goto LABEL_10;
  }
LABEL_12:

  return v36;
}

uint64_t sub_1B4F8CA98(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_OSSpecificAttributes(v4, v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"networkUsage", v12, v13);
  if (v14)
  {
  }
  else
  {
    uint64_t v43 = objc_msgSend_OSSpecificAttributes(v5, v15, v16, v17, v18);
    long long v47 = objc_msgSend_objectForKeyedSubscript_(v43, v44, @"networkUsage", v45, v46);

    if (v47)
    {
      uint64_t v42 = -1;
      goto LABEL_13;
    }
  }
  uint64_t v23 = objc_msgSend_OSSpecificAttributes(v4, v19, v20, v21, v22);
  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"networkUsage", v25, v26);
  if (v27)
  {
    uint64_t v32 = (void *)v27;
    uint64_t v33 = objc_msgSend_OSSpecificAttributes(v5, v28, v29, v30, v31);
    uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v33, v34, @"networkUsage", v35, v36);

    if (!v37)
    {
      uint64_t v42 = 1;
      goto LABEL_13;
    }
  }
  else
  {
  }
  long long v48 = objc_msgSend_OSSpecificAttributes(v4, v38, v39, v40, v41);
  long long v52 = objc_msgSend_objectForKeyedSubscript_(v48, v49, @"networkUsage", v50, v51);
  if (v52)
  {
  }
  else
  {
    id v61 = objc_msgSend_OSSpecificAttributes(v5, v53, v54, v55, v56);
    uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(v61, v62, @"networkUsage", v63, v64);

    if (!v65)
    {
      uint64_t v42 = 0;
      goto LABEL_13;
    }
  }
  __int16 v66 = objc_msgSend_OSSpecificAttributes(v4, v57, v58, v59, v60);
  long long v70 = objc_msgSend_objectForKeyedSubscript_(v66, v67, @"networkUsage", v68, v69);
  uint64_t v75 = objc_msgSend_integerValue(v70, v71, v72, v73, v74);
  uint64_t v80 = objc_msgSend_OSSpecificAttributes(v5, v76, v77, v78, v79);
  uint64_t v84 = objc_msgSend_objectForKeyedSubscript_(v80, v81, @"networkUsage", v82, v83);
  uint64_t v42 = v75 <= objc_msgSend_integerValue(v84, v85, v86, v87, v88);

LABEL_13:
  return v42;
}

uint64_t sub_1B4F8CD14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((objc_msgSend__isHomeNetwork(v5, v7, v8, v9, v10) & 1) != 0
    || (objc_msgSend__isHomeNetwork(v6, v11, v12, v13, v14) & 1) == 0)
  {
    if (objc_msgSend__isHomeNetwork(v5, v11, v12, v13, v14)
      && !objc_msgSend__isHomeNetwork(v6, v16, v17, v18, v19))
    {
      uint64_t v15 = -1;
    }
    else if (objc_msgSend__isHomeNetwork(v5, v16, v17, v18, v19) {
           && objc_msgSend__isHomeNetwork(v6, v20, v21, v22, v23))
    }
    {
      objc_msgSend__networkProfileUsageComparator(*(void **)(a1 + 32), v24, v25, v26, v27);
      uint64_t v28 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      uint64_t v15 = ((uint64_t (**)(void, id, id))v28)[2](v28, v5, v6);
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

id sub_1B4F8D0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v10 = objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_components_fromDate_(v10, v11, 28, a1, v12);
  uint64_t v17 = objc_msgSend_dateFromComponents_(v10, v14, (uint64_t)v13, v15, v16);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend_setDay_(v18, v19, a3, v20, v21);
  uint64_t v23 = objc_msgSend_dateByAddingComponents_toDate_options_(v10, v22, (uint64_t)v18, (uint64_t)v17, 0);

  return v23;
}

id sub_1B4F8D198(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, a4, a5);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = a1;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, @"\\ ", @" ", v15, (void)v21);
          objc_msgSend_addObject_(v6, v17, (uint64_t)v16, v18, v19);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v14, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v10);
  }

  return v6;
}

id sub_1B4F8D30C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_msgSend_mutableCopy(a1, a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_count(v5, v6, v7, v8, v9);
  uint64_t v15 = v10 - 1;
  if (v10 != 1)
  {
    do
    {
      uint32_t v16 = arc4random_uniform(v15 + 1);
      objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(v5, v17, v15--, v16, v18);
    }
    while (v15);
  }
  uint64_t v19 = objc_msgSend_copy(v5, v11, v12, v13, v14);

  return v19;
}

uint64_t sub_1B4F8D380()
{
  uint64_t result = _sl_dlopen();
  qword_1EB4B2600 = result;
  return result;
}

uint64_t sub_1B4F8DC74(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v3 = v1;
  if (MEMORY[0x1E4F72420])
  {
    uint64_t v9 = *MEMORY[0x1E4F72450];
    v10[0] = v1;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v2, (uint64_t)v10, (uint64_t)&v9, 1);
    uint64_t v6 = LXLexiconCreate();
  }
  else
  {
    id v4 = CWFGetOSLog();
    if (v4)
    {
      id v5 = CWFGetOSLog();
    }
    else
    {
      id v5 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

void sub_1B4F8E1A0(uint64_t a1, void *a2, int a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v5) {
      size_t count = xpc_array_get_count(v5);
    }
    else {
      size_t count = 0;
    }
    uint64_t v13 = CWFGetOSLog();
    uint64_t v60 = a1;
    if (v13)
    {
      uint64_t v14 = CWFGetOSLog();
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v63 = 136315394;
      uint64_t v64 = "-[CWFLocalDeviceDiscovery activate]_block_invoke";
      __int16 v65 = 2048;
      size_t v66 = count;
      LODWORD(v59) = 22;
      uint64_t v58 = &v63;
      _os_log_send_and_compose_impl();
    }

    if (!count)
    {
LABEL_40:
      objc_msgSend__processMRCRecord_(*(void **)(v60 + 32), v16, (uint64_t)v8, v17, v18, v58, v59);

      goto LABEL_41;
    }
    size_t v19 = 0;
    uint64_t v20 = (const char *)*MEMORY[0x1E4FBA808];
    key = (char *)*MEMORY[0x1E4FBA800];
    unint64_t v21 = 0x1E4F29000uLL;
    __int16 v62 = (const char *)*MEMORY[0x1E4FBA808];
    while (1)
    {
      long long v22 = xpc_array_get_dictionary(v5, v19);
      long long v23 = v22;
      if (v22)
      {
        string = xpc_dictionary_get_string(v22, v20);
        if (string)
        {
          uint64_t v28 = objc_msgSend_stringWithUTF8String_(*(void **)(v21 + 24), v25, (uint64_t)string, v26, v27);
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = xpc_dictionary_get_string(v23, key);
            if (v30)
            {
              uint64_t v34 = objc_msgSend_stringWithUTF8String_(*(void **)(v21 + 24), v31, (uint64_t)v30, v32, v33);
              objc_msgSend_serviceRecordFromRecordName_(CWFBonjourServiceRecord, v35, (uint64_t)v34, v36, v37, v58, v59);
            }
            else
            {
              uint64_t v34 = 0;
              objc_msgSend_serviceRecordFromRecordName_(CWFBonjourServiceRecord, v31, 0, v32, v33, v58, v59);
            uint64_t v42 = };
            objc_msgSend_objectForKey_(v8, v43, (uint64_t)v29, v44, v45);
            v51 = uint64_t v46 = v8;
            if (v51) {
              objc_msgSend_objectForKey_(v46, v47, (uint64_t)v29, v49, v50);
            }
            else {
            long long v52 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v47, v48, v49, v50);
            }

            objc_msgSend_addObject_(v52, v53, (uint64_t)v42, v54, v55);
            objc_msgSend_setObject_forKey_(v46, v56, (uint64_t)v52, (uint64_t)v29, v57);

            id v8 = v46;
            uint64_t v20 = v62;
            unint64_t v21 = 0x1E4F29000;
            goto LABEL_39;
          }
        }
        uint64_t v38 = CWFGetOSLog();
        if (v38)
        {
          uint64_t v29 = CWFGetOSLog();
        }
        else
        {
          uint64_t v29 = MEMORY[0x1E4F14500];
          id v40 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_39;
        }
        int v63 = 136315650;
        uint64_t v64 = "-[CWFLocalDeviceDiscovery activate]_block_invoke";
        __int16 v65 = 2048;
        size_t v66 = v19;
        __int16 v67 = 2112;
        uint64_t v68 = v23;
        LODWORD(v59) = 32;
        uint64_t v58 = &v63;
      }
      else
      {
        uint64_t v39 = CWFGetOSLog();
        if (v39)
        {
          uint64_t v29 = CWFGetOSLog();
        }
        else
        {
          uint64_t v29 = MEMORY[0x1E4F14500];
          id v41 = MEMORY[0x1E4F14500];
        }

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_39;
        }
        int v63 = 136315394;
        uint64_t v64 = "-[CWFLocalDeviceDiscovery activate]_block_invoke";
        __int16 v65 = 2048;
        size_t v66 = v19;
        LODWORD(v59) = 22;
        uint64_t v58 = &v63;
      }
      _os_log_send_and_compose_impl();
LABEL_39:

      if (count == ++v19) {
        goto LABEL_40;
      }
    }
  }
  uint64_t v6 = CWFGetOSLog();
  if (v6)
  {
    id v7 = CWFGetOSLog();
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v63 = 136315394;
    uint64_t v64 = "-[CWFLocalDeviceDiscovery activate]_block_invoke";
    __int16 v65 = 1024;
    LODWORD(v66) = a3;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend__callHandlerWithValidResults_filtered_(*(void **)(a1 + 32), v11, 0, 0, v12);
LABEL_41:
}

void sub_1B4F8E9B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_handler(*(void **)(a1 + 32), a2, a3, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void))v6 + 2))(v6, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t sub_1B4F8F640(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend__containsUnwantedCharactersForDisplay(a2, v5, v6, v7, v8)) {
    uint64_t v13 = objc_msgSend__containsUnwantedCharactersForDisplay(v4, v9, v10, v11, v12) ^ 1;
  }
  else {
    uint64_t v13 = -1;
  }

  return v13;
}

void sub_1B4F8FFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1B4F90008(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  LXLexiconEnumerateEntriesForString();
  if (!*((unsigned char *)v6 + 24)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }

  _Block_object_dispose(&v5, 8);
}

void sub_1B4F9010C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B4F90124(uint64_t *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = (void *)LXEntryCopyString();
  if (!objc_msgSend_caseInsensitiveCompare_(v5, v6, a1[4], v7, v8))
  {
    if ((LXEntryGetMetaFlags() & 0x3800000) == 0)
    {
LABEL_28:
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      ++*(void *)(*(void *)(a1[8] + 8) + 24);
      goto LABEL_29;
    }
    uint64_t v9 = CWFGetOSLog();
    if (v9)
    {
      uint64_t v10 = CWFGetOSLog();
    }
    else
    {
      uint64_t v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_27:

      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_28;
    }
    LXEntryGetMetaFlags();
    int MetaFlags = LXEntryGetMetaFlags();
    uint64_t v17 = objc_msgSend_string(MEMORY[0x1E4F28E78], v13, v14, v15, v16);
    long long v22 = v17;
    if (MetaFlags)
    {
      objc_msgSend_appendString_(v17, v18, @"HasTitleCase, ", v20, v21);
      if ((MetaFlags & 2) == 0)
      {
LABEL_9:
        if ((MetaFlags & 4) == 0) {
          goto LABEL_10;
        }
        goto LABEL_32;
      }
    }
    else if ((MetaFlags & 2) == 0)
    {
      goto LABEL_9;
    }
    objc_msgSend_appendString_(v22, v18, @"NoSuggest, ", v20, v21);
    if ((MetaFlags & 4) == 0)
    {
LABEL_10:
      if ((MetaFlags & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_33;
    }
LABEL_32:
    objc_msgSend_appendString_(v22, v18, @"NoPredictUntilLearned, ", v20, v21);
    if ((MetaFlags & 8) == 0)
    {
LABEL_11:
      if ((MetaFlags & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_34;
    }
LABEL_33:
    objc_msgSend_appendString_(v22, v18, @"PreferredFormForSortKey, ", v20, v21);
    if ((MetaFlags & 0x20) == 0)
    {
LABEL_12:
      if ((MetaFlags & 0x40) == 0) {
        goto LABEL_13;
      }
      goto LABEL_35;
    }
LABEL_34:
    objc_msgSend_appendString_(v22, v18, @"CannotBeCapitalized, ", v20, v21);
    if ((MetaFlags & 0x40) == 0)
    {
LABEL_13:
      if ((MetaFlags & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_36;
    }
LABEL_35:
    objc_msgSend_appendString_(v22, v18, @"PreventShiftAfterPeriod, ", v20, v21);
    if ((MetaFlags & 0x80) == 0)
    {
LABEL_14:
      if ((MetaFlags & 0x200000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_37;
    }
LABEL_36:
    objc_msgSend_appendString_(v22, v18, @"NoSuggestUntilLearned, ", v20, v21);
    if ((MetaFlags & 0x200000) == 0)
    {
LABEL_15:
      if ((MetaFlags & 0x800000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
LABEL_37:
    objc_msgSend_appendString_(v22, v18, @"HasCustomCapitalization, ", v20, v21);
    if ((MetaFlags & 0x800000) == 0)
    {
LABEL_16:
      if ((MetaFlags & 0x1000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_39;
    }
LABEL_38:
    objc_msgSend_appendString_(v22, v18, @"Vulgar, ", v20, v21);
    if ((MetaFlags & 0x1000000) == 0)
    {
LABEL_17:
      if ((MetaFlags & 0x2000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_40;
    }
LABEL_39:
    objc_msgSend_appendString_(v22, v18, @"Offensive, ", v20, v21);
    if ((MetaFlags & 0x2000000) == 0)
    {
LABEL_18:
      if ((MetaFlags & 0x4000000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_41;
    }
LABEL_40:
    objc_msgSend_appendString_(v22, v18, @"Sensitive, ", v20, v21);
    if ((MetaFlags & 0x4000000) == 0)
    {
LABEL_19:
      if ((MetaFlags & 0x2000000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_42;
    }
LABEL_41:
    objc_msgSend_appendString_(v22, v18, @"Recent, ", v20, v21);
    if ((MetaFlags & 0x2000000) == 0)
    {
LABEL_20:
      if ((MetaFlags & 0x8000000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_43;
    }
LABEL_42:
    objc_msgSend_appendString_(v22, v18, @"Sensitive, ", v20, v21);
    if ((MetaFlags & 0x8000000) == 0)
    {
LABEL_21:
      if ((MetaFlags & 0x10000000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_44;
    }
LABEL_43:
    objc_msgSend_appendString_(v22, v18, @"Transient, ", v20, v21);
    if ((MetaFlags & 0x10000000) == 0)
    {
LABEL_22:
      if ((MetaFlags & 0x20000000) == 0)
      {
LABEL_24:
        if (objc_msgSend_length(v22, v18, v19, v20, v21))
        {
          uint64_t v27 = objc_msgSend_length(v22, v23, v24, v25, v26);
          objc_msgSend_replaceCharactersInRange_withString_(v22, v28, v27 - 2, 2, (uint64_t)&stru_1F0DA9CF0);
        }
        _os_log_send_and_compose_impl();

        goto LABEL_27;
      }
LABEL_23:
      objc_msgSend_appendString_(v22, v18, @"ContainsEmoji, ", v20, v21);
      goto LABEL_24;
    }
LABEL_44:
    objc_msgSend_appendString_(v22, v18, @"Probationary, ", v20, v21);
    if ((MetaFlags & 0x20000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_29:
}

void sub_1B4F90764(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1B4F90774);
  }
  _Unwind_Resume(a1);
}

void sub_1B4F90784(_Unwind_Exception *a1)
{
}

void sub_1B4F90790(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1B4F9079CLL);
}

id sub_1B4F90860(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, a3, a4, a5);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = a1;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_appendFormat_(v6, v10, @"\"%@\", ", v11, v12, *(void *)(*((void *)&v27 + 1) + 8 * i));
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v13);
  }

  if ((unint64_t)objc_msgSend_length(v6, v16, v17, v18, v19) >= 3)
  {
    uint64_t v24 = objc_msgSend_length(v6, v20, v21, v22, v23);
    objc_msgSend_replaceCharactersInRange_withString_(v6, v25, v24 - 2, 2, (uint64_t)&stru_1F0DA9CF0);
  }
  return v6;
}

id sub_1B4F909C0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend__stringByRemovingServiceName(a1, a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a1, v7, (uint64_t)v6, (uint64_t)&stru_1F0DA9CF0, v8);

  return v9;
}

uint64_t sub_1B4F90A20(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__stringByReplacingOccurencesOfRegexPattern_replacement_(a1, a2, @"\\.?_.*local\\.|", (uint64_t)&stru_1F0DA9CF0, a5);
}

id sub_1B4F90A34(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend__stringByReplacingOccurencesOfRegexPattern_replacement_(a1, a2, @"\\.local\\.?", (uint64_t)&stru_1F0DA9CF0, a5);
  uint64_t v8 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v6, @"\\ ", @" ", v7);

  uint64_t v11 = objc_msgSend__stringByReplacingOccurencesOfRegexPattern_replacement_(v8, v9, @"^[A-Z0-9]+@", (uint64_t)&stru_1F0DA9CF0, v10);

  return v11;
}

uint64_t sub_1B4F90ACC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a1, a2, @"-", @" ", a5);
}

id sub_1B4F90AE0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28FD8];
  id v7 = a4;
  uint64_t v9 = objc_msgSend_regularExpressionWithPattern_options_error_(v6, v8, a3, 1, 0);
  uint64_t v14 = objc_msgSend_length(a1, v10, v11, v12, v13);
  uint64_t v16 = objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(v9, v15, (uint64_t)a1, 0, 0, v14, v7);

  return v16;
}

uint64_t sub_1B4F90B80(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a1, a2, @"’", (uint64_t)&stru_1F0DA9CF0, a5);
}

uint64_t sub_1B4F90B94(void *a1, const char *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F0DC8718, a2, (uint64_t)&v9, (uint64_t)v13, 16);
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(&unk_1F0DC8718);
        }
        if (objc_msgSend_rangeOfString_options_(a1, v4, *(void *)(*((void *)&v9 + 1) + 8 * v8), 5, v5) != 0x7FFFFFFFFFFFFFFFLL) {
          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F0DC8718, v4, (uint64_t)&v9, (uint64_t)v13, 16);
      uint64_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

BOOL sub_1B4F90CA8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_rangeOfString_options_(a1, a2, @"_.+_.+\\.local", 1024, a5) != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL sub_1B4F90CD8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_rangeOfString_options_(a1, a2, @"(?:[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})", 1024, a5) != 0x7FFFFFFFFFFFFFFFLL|| objc_msgSend_rangeOfString_options_(a1, v6, @"(?:\\d{1,3}-){3}\\d{1,3}", 1024, v7) != 0x7FFFFFFFFFFFFFFFLL|| objc_msgSend_rangeOfString_options_(a1, v8, @"(?:[0-9A-Fa-f]{2}[-_:]{0,1}){5}[0-9A-Fa-f]{2}", 1024, v9) != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL sub_1B4F90D58(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], a2, @"_.-", a4, a5);
  uint64_t v10 = objc_msgSend_rangeOfCharacterFromSet_(a1, v7, (uint64_t)v6, v8, v9);
  if (v10) {
    BOOL v15 = v10 == objc_msgSend_length(a1, v11, v12, v13, v14) - 1;
  }
  else {
    BOOL v15 = 1;
  }

  return v15;
}

BOOL sub_1B4F90DD4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], a2, @"{}[]()<>-.@#$%", a4, a5);
  BOOL v10 = objc_msgSend_rangeOfCharacterFromSet_(a1, v7, (uint64_t)v6, v8, v9) != 0x7FFFFFFFFFFFFFFFLL;

  return v10;
}

uint64_t sub_1B4F90E30(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (objc_msgSend_isEqualToString_(a1, a2, @"127.0.0.1", a4, a5)) {
    return 1;
  }
  return objc_msgSend_isEqualToString_(a1, v6, @"fe80::1", v7, v8);
}

void sub_1B4F91A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4F91B78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  qword_1EB4B2658 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], a2, (uint64_t)&unk_1F0DC8748, a4, a5);
  return MEMORY[0x1F41817F8]();
}

void *sub_1B4F922FC(uint64_t a1)
{
  uint64_t v2 = sub_1B4F9234C();
  uint64_t result = dlsym(v2, "CLLocationCoordinate2DMake");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1EB4B2668 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1B4F9234C()
{
  uint64_t v0 = sub_1B4F39A34();
  if (v0) {
    return (void *)v0;
  }
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v1, v2, v3, v4);
  BOOL v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *CoreLocationLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v10, @"CWFBSS.m", 27, @"%s", 0);

  __break(1u);
  free(v12);
  return v5;
}

uint64_t sub_1B4F923FC()
{
  uint64_t result = _sl_dlopen();
  qword_1EB4B2608 = result;
  return result;
}

void *sub_1B4F92470(uint64_t a1)
{
  uint64_t v2 = sub_1B4F9234C();
  uint64_t result = dlsym(v2, "CLLocationCoordinate2DIsValid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1EB4B2670 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B4F924C0(uint64_t a1)
{
  sub_1B4F9234C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CLLocation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB4B2610 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v2, v3, v4, v5);
    BOOL v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"Class getCLLocationClass(void)_block_invoke", v8, v9);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"CWFBSS.m", 28, @"Unable to find class %s", "CLLocation");

    __break(1u);
  }
}

void sub_1B4F932E8(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  if (objc_opt_class())
  {
    BOOL v10 = objc_msgSend_coreAnalyticsEventName(*(void **)(*(void *)(a1 + 32) + 120), v6, v7, v8, v9);
    BOOL v15 = objc_msgSend_coreAnalyticsEventPayload(*(void **)(*(void *)(a1 + 32) + 120), v11, v12, v13, v14);
    uint64_t v16 = CWFGetOSLog();
    if (v16)
    {
      uint64_t v17 = CWFGetOSLog();
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    id v32 = v15;
    AnalyticsSendEventLazy();
  }
  uint64_t v19 = objc_alloc_init(CWFAutoJoinStatistics);
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 120);
  *(void *)(v20 + 120) = v19;

  uint64_t v26 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v22, v23, v24, v25);
  objc_msgSend_setStartedAt_(*(void **)(*(void *)(a1 + 32) + 120), v27, (uint64_t)v26, v28, v29);

  long long v30 = *(NSObject **)(*(void *)(a1 + 32) + 128);
  if (v30)
  {
    dispatch_time_t v31 = dispatch_walltime(0, 86400000000000);
    dispatch_source_set_timer(v30, v31, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  objc_sync_exit(v2);
}

void sub_1B4F935BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1B4F935E8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1B4F936C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F936DC(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134219010;
    unint64_t v15 = v3 / 0x3B9ACA00;
    __int16 v16 = 2048;
    unint64_t v17 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v18 = 2082;
    uint64_t v19 = "-[CWFAutoJoinManager invalidate]_block_invoke";
    __int16 v20 = 2082;
    uint64_t v21 = "CWFAutoJoinManager.m";
    __int16 v22 = 1024;
    int v23 = 396;
    _os_log_send_and_compose_impl();
  }

  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 544);
  qos_class_t v8 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F93904;
  block[3] = &unk_1E60BB768;
  void block[4] = *(void *)(a1 + 32);
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, block);
  dispatch_async(v7, v9);

  uint64_t v10 = *(void *)(a1 + 32);
  long long v11 = *(NSObject **)(v10 + 72);
  if (v11)
  {
    dispatch_source_cancel(v11);
    uint64_t v10 = *(void *)(a1 + 32);
  }
  uint64_t v12 = *(NSObject **)(v10 + 128);
  if (v12) {
    dispatch_source_cancel(v12);
  }
}

void sub_1B4F93904(uint64_t a1)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v86 = 134219010;
    unint64_t v87 = v3 / 0x3B9ACA00;
    __int16 v88 = 2048;
    unint64_t v89 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v90 = 2082;
    id v91 = "-[CWFAutoJoinManager invalidate]_block_invoke";
    __int16 v92 = 2082;
    id v93 = "CWFAutoJoinManager.m";
    __int16 v94 = 1024;
    int v95 = 398;
    LODWORD(v80) = 48;
    uint64_t v79 = &v86;
    _os_log_send_and_compose_impl();
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v81, (uint64_t)v85, 16);
  if (v9)
  {
    uint64_t v14 = v9;
    uint64_t v15 = *(void *)v82;
    uint64_t v16 = *MEMORY[0x1E4F28798];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v82 != v15) {
          objc_enumerationMutation(v7);
        }
        __int16 v18 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend_reply(v18, v10, v11, v12, v13, v79, v80, (void)v81);

        if (v19)
        {
          objc_msgSend_reply(v18, v10, v11, v12, v13);
          __int16 v20 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
          __int16 v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v21, v16, 89, 0);
          ((void (**)(void, void *))v20)[2](v20, v22);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v81, (uint64_t)v85, 16);
    }
    while (v14);
  }

  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 96), v23, v24, v25, v26);
  objc_msgSend_setAllowAutoJoinHandler_(*(void **)(a1 + 32), v27, 0, v28, v29);
  objc_msgSend_setAllowKnownNetworkHandler_(*(void **)(a1 + 32), v30, 0, v31, v32);
  objc_msgSend_setKnownNetworkComparator_(*(void **)(a1 + 32), v33, 0, v34, v35);
  objc_msgSend_setScanForNetworksHandler_(*(void **)(a1 + 32), v36, 0, v37, v38);
  objc_msgSend_setPerformGASQueryHandler_(*(void **)(a1 + 32), v39, 0, v40, v41);
  objc_msgSend_setAllowJoinCandidateHandler_(*(void **)(a1 + 32), v42, 0, v43, v44);
  objc_msgSend_setJoinCandidateComparator_(*(void **)(a1 + 32), v45, 0, v46, v47);
  objc_msgSend_setAssociateToNetworkHandler_(*(void **)(a1 + 32), v48, 0, v49, v50);
  objc_msgSend_setAllowAutoHotspotHandler_(*(void **)(a1 + 32), v51, 0, v52, v53);
  objc_msgSend_setAllowHotspotHandler_(*(void **)(a1 + 32), v54, 0, v55, v56);
  objc_msgSend_setBrowseForHotspotsHandler_(*(void **)(a1 + 32), v57, 0, v58, v59);
  objc_msgSend_setConnectToHotspotHandler_(*(void **)(a1 + 32), v60, 0, v61, v62);
  objc_msgSend_setUpdateKnownNetworkHandler_(*(void **)(a1 + 32), v63, 0, v64, v65);
  objc_msgSend_setEventHandler_(*(void **)(a1 + 32), v66, 0, v67, v68);
  uint64_t v73 = objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v69, v70, v71, v72);

  if (v73)
  {
    objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v74, v75, v76, v77);
    uint64_t v78 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v78[2]();
  }
  objc_msgSend_setInvalidationHandler_(*(void **)(a1 + 32), v74, 0, v76, v77, v79, v80);
}

void sub_1B4F93CE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F94264(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F942F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F9435C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F943F8(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    qos_class_t v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v6, *MEMORY[0x1E4F28798], 6, 0);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void sub_1B4F9549C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_1B4F95518(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    qos_class_t v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v6, *MEMORY[0x1E4F28798], 6, 0);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void sub_1B4F956E8(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134219010;
    unint64_t v13 = v3 / 0x3B9ACA00;
    __int16 v14 = 2048;
    unint64_t v15 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v16 = 2082;
    unint64_t v17 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]_block_invoke";
    __int16 v18 = 2082;
    uint64_t v19 = "CWFAutoJoinManager.m";
    __int16 v20 = 1024;
    int v21 = 790;
    _os_log_send_and_compose_impl();
  }

  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 544);
  qos_class_t v8 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F95900;
  block[3] = &unk_1E60BBCF8;
  id v11 = *(id *)(a1 + 40);
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, block);
  dispatch_async(v7, v9);
}

void sub_1B4F95900(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

void sub_1B4F95AA0(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 134219010;
    unint64_t v30 = v3 / 0x3B9ACA00;
    __int16 v31 = 2048;
    unint64_t v32 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v33 = 2082;
    uint64_t v34 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]_block_invoke";
    __int16 v35 = 2082;
    uint64_t v36 = "CWFAutoJoinManager.m";
    __int16 v37 = 1024;
    int v38 = 809;
    int v26 = 48;
    uint64_t v25 = &v29;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_reply(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_reply(*(void **)(a1 + 32), v12, v13, v14, v15);
    unint64_t v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    __int16 v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28798];
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20)
    {
      uint64_t v27 = *MEMORY[0x1E4F28A50];
      uint64_t v28 = v20;
      int v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v28, (uint64_t)&v27, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v22, v19, 89, (uint64_t)v21, v25, v26);
    }
    else
    {
      int v21 = 0;
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, v19, 89, 0, v25, v26);
    int v23 = };
    ((void (**)(void, void *))v17)[2](v17, v23);

    if (v20) {
  }
    }
  uint64_t v24 = *(void *)(a1 + 48);
  if (v24) {
    (*(void (**)(uint64_t, void))(v24 + 16))(v24, 0);
  }
}

void sub_1B4F95D04(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v6, *MEMORY[0x1E4F28798], 2, 0);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void sub_1B4F95ED4(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 134219010;
    unint64_t v29 = v3 / 0x3B9ACA00;
    __int16 v30 = 2048;
    unint64_t v31 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v32 = 2082;
    __int16 v33 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]_block_invoke";
    __int16 v34 = 2082;
    __int16 v35 = "CWFAutoJoinManager.m";
    __int16 v36 = 1024;
    int v37 = 840;
    int v25 = 48;
    uint64_t v24 = &v28;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_reply(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_reply(*(void **)(a1 + 32), v12, v13, v14, v15);
    unint64_t v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    __int16 v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28798];
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20)
    {
      uint64_t v26 = *MEMORY[0x1E4F28A50];
      uint64_t v27 = v20;
      int v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v27, (uint64_t)&v26, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v22, v19, 89, (uint64_t)v21, v24, v25);
    }
    else
    {
      int v21 = 0;
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, v19, 89, 0, v24, v25);
    int v23 = };
    ((void (**)(void, void *))v17)[2](v17, v23);

    if (v20) {
  }
    }
}

void sub_1B4F96120(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134219010;
    unint64_t v13 = v3 / 0x3B9ACA00;
    __int16 v14 = 2048;
    unint64_t v15 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v16 = 2082;
    unint64_t v17 = "-[CWFAutoJoinManager cancelAutoJoinWithUUID:error:reply:]_block_invoke";
    __int16 v18 = 2082;
    uint64_t v19 = "CWFAutoJoinManager.m";
    __int16 v20 = 1024;
    int v21 = 855;
    _os_log_send_and_compose_impl();
  }

  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 544);
  qos_class_t v8 = qos_class_self();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F96338;
  block[3] = &unk_1E60BBCF8;
  id v11 = *(id *)(a1 + 40);
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, block);
  dispatch_async(v7, v9);
}

void sub_1B4F96338(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

void sub_1B4F9652C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F96594(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F96714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F96D88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F9746C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v10 = objc_msgSend_reply(*(void **)(a1 + 32), v6, v7, v8, v9);

  if (v10)
  {
    objc_msgSend_reply(*(void **)(a1 + 32), v11, v12, v13, v14);
    unint64_t v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    unint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, *MEMORY[0x1E4F28798], 89, 0);
    ((void (**)(void, void *))v15)[2](v15, v17);
  }
}

void sub_1B4F976BC(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v10 = objc_msgSend_reply(*(void **)(a1 + 32), v6, v7, v8, v9);

  if (v10)
  {
    objc_msgSend_reply(*(void **)(a1 + 32), v11, v12, v13, v14);
    unint64_t v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    unint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, *MEMORY[0x1E4F28798], 1, 0);
    ((void (**)(void, void *))v15)[2](v15, v17);
  }
}

void sub_1B4F978B0(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 40) == *(_DWORD *)(v4 + 104)) {
    *(_DWORD *)(v4 + 104) = 0;
  }
  objc_sync_exit(v3);
}

void sub_1B4F97928(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___performAutoJoin(*(void **)(a1 + 32), v3, v4, v5, v6);
}

void sub_1B4F97BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F97C00(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v10 = objc_msgSend_eventHandler(*(void **)(a1 + 32), v6, v7, v8, v9);

  if (v10)
  {
    objc_msgSend_eventHandler(*(void **)(a1 + 32), v11, v12, v13, v14);
    unint64_t v15 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v15[2](v15, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

void sub_1B4F9B7DC(_Unwind_Exception *a1)
{
}

void sub_1B4F9B90C(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v55 = 134219010;
    unint64_t v56 = v2 / 0x3B9ACA00;
    __int16 v57 = 2048;
    unint64_t v58 = v2 % 0x3B9ACA00 / 0x3E8;
    __int16 v59 = 2082;
    uint64_t v60 = "-[CWFAutoJoinManager __performAutoJoin]_block_invoke";
    __int16 v61 = 2082;
    uint64_t v62 = "CWFAutoJoinManager.m";
    __int16 v63 = 1024;
    int v64 = 1849;
    LODWORD(v47) = 48;
    uint64_t v46 = &v55;
    _os_log_send_and_compose_impl();
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        LOBYTE(v55) = 0;
        uint64_t v14 = *(void **)(a1 + 40);
        uint64_t v15 = *(void *)(a1 + 48);
        id v49 = 0;
        int v16 = objc_msgSend___allowKnownNetwork_context_allowForSeamlessSSIDTransition_defer_targetQueue_error_(v14, v9, (uint64_t)v13, v15, 0, &v55, 0, &v49, v46, v47, context);
        id v20 = v49;
        if (v16)
        {
          objc_msgSend_addObject_(*(void **)(a1 + 56), v17, (uint64_t)v13, v18, v19);
          uint64_t v24 = (void **)(a1 + 64);
          if ((_BYTE)v55) {
            uint64_t v24 = (void **)(*(void *)(a1 + 40) + 368);
          }
          objc_msgSend_addObject_(*v24, v21, (uint64_t)v13, v22, v23);
          if (objc_msgSend_hiddenState(v13, v25, v26, v27, v28) != 2) {
            goto LABEL_17;
          }
          uint64_t v33 = objc_msgSend_wasHiddenBefore(v13, v29, v30, v31, v32);
          if (v33)
          {
            __int16 v35 = (void *)v33;
            __int16 v36 = objc_msgSend_wasHiddenBefore(v13, v29, v34, v31, v32);
            objc_msgSend_timeIntervalSinceReferenceDate(v36, v37, v38, v39, v40);
            double v42 = v41;

            if (v42 < 604800.0) {
LABEL_17:
            }
              objc_msgSend_addObject_(*(void **)(a1 + 72), v29, (uint64_t)v13, v31, v32);
          }
          char isStandalone6G = objc_msgSend_isStandalone6G(v13, v29, v34, v31, v32);
          uint64_t v44 = *(void *)(*(void *)(a1 + 80) + 8);
          if (*(unsigned char *)(v44 + 24)) {
            char v45 = isStandalone6G;
          }
          else {
            char v45 = 0;
          }
          *(unsigned char *)(v44 + 24) = v45;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v10);
  }
}

id sub_1B4F9BC24(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1B4F9BC2C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(a1 + 32));
  }
}

void sub_1B4F9EB20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F9EDC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4F9EDDC(uint64_t a1, void *a2, unsigned char *a3)
{
  id v26 = a2;
  if ((objc_msgSend_wasMoreRecentlyJoinedByUser(v26, v5, v6, v7, v8) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend_lastJoinedAt(v26, v9, v10, v11, v12);
    objc_msgSend_timeIntervalSinceReferenceDate(v13, v14, v15, v16, v17);
    double v19 = v18;
    objc_msgSend_timeIntervalSinceReferenceDate(*(void **)(a1 + 32), v20, v21, v22, v23);
    double v25 = v24;

    if (v19 >= v25)
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 416) = 1;
      *a3 = 1;
    }
  }
}

void sub_1B4FA1618(void **a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134219010;
    unint64_t v20 = v3 / 0x3B9ACA00;
    __int16 v21 = 2048;
    unint64_t v22 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v23 = 2082;
    double v24 = "-[CWFAutoJoinManager __updateDiscoverTimestampForJoinCandidates:]_block_invoke";
    __int16 v25 = 2082;
    id v26 = "CWFAutoJoinManager.m";
    __int16 v27 = 1024;
    int v28 = 3440;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_updateKnownNetworkHandler(a1[4], v7, v8, v9, v10);
  uint64_t v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_matchingKnownNetworkProfile(a1[5], v12, v13, v14, v15);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B4FA1838;
  void v17[3] = &unk_1E60BC3A8;
  id v18 = a1[6];
  ((void (**)(void, void *, void *))v11)[2](v11, v16, v17);
}

id sub_1B4FA1838(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7
    && (objc_msgSend_timeIntervalSinceReferenceDate(*(void **)(a1 + 32), v3, v4, v5, v6),
        double v9 = v8,
        objc_msgSend_lastDiscoveredAt(v7, v10, v11, v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_timeIntervalSinceReferenceDate(v14, v15, v16, v17, v18),
        double v20 = v9 - v19,
        v14,
        v20 >= 86400.0))
  {
    objc_msgSend_setLastDiscoveredAt_(v7, v21, *(void *)(a1 + 32), v22, v23);
    id v24 = v7;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

void sub_1B4FA1B24(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    uint64_t v5 = CWFGetOSLog();
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 134219010;
    unint64_t v22 = v3 / 0x3B9ACA00;
    __int16 v23 = 2048;
    unint64_t v24 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v25 = 2082;
    id v26 = "-[CWFAutoJoinManager __updateRNRChannel:has6GHzOnlyBSS:joinCandidate:]_block_invoke";
    __int16 v27 = 2082;
    int v28 = "CWFAutoJoinManager.m";
    __int16 v29 = 1024;
    int v30 = 3464;
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_updateKnownNetworkHandler(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_matchingKnownNetworkProfile(*(void **)(a1 + 40), v12, v13, v14, v15);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B4FA1D60;
  void v17[3] = &unk_1E60BC3D0;
  char v20 = *(unsigned char *)(a1 + 56);
  id v18 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  ((void (**)(void, void *, void *))v11)[2](v11, v16, v17);
}

id sub_1B4FA1D60(uint64_t a1, void *a2)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!v7) {
    goto LABEL_38;
  }
  int v88 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v8 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v3, v4, v5, v6);
    objc_msgSend_setWas6GHzOnlyAt_(v7, v9, (uint64_t)v8, v10, v11);
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v89 = v7;
  objc_msgSend_BSSList(v7, v3, v4, v5, v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v91, (uint64_t)v95, 16);
  if (!v13) {
    goto LABEL_36;
  }
  uint64_t v18 = v13;
  uint64_t v19 = *(void *)v92;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v92 != v19) {
        objc_enumerationMutation(obj);
      }
      int v21 = *(void **)(*((void *)&v91 + 1) + 8 * i);
      uint64_t v22 = objc_msgSend_BSSID(v21, v14, v15, v16, v17);
      if (v22)
      {
        __int16 v23 = (void *)v22;
        uint64_t v24 = objc_msgSend_BSSID(*(void **)(a1 + 32), v14, v15, v16, v17);
        if (v24)
        {
          __int16 v29 = (void *)v24;
          int v30 = objc_msgSend_BSSID(v21, v25, v26, v27, v28);
          __int16 v35 = objc_msgSend_BSSID(*(void **)(a1 + 32), v31, v32, v33, v34);
          int isEqual = objc_msgSend_isEqual_(v30, v36, (uint64_t)v35, v37, v38);

          if (isEqual)
          {
            if (!objc_msgSend_is2GHz(*(void **)(a1 + 40), v14, v15, v16, v17)) {
              goto LABEL_26;
            }
            char v45 = objc_msgSend_colocated2GHzRNRChannel(v21, v41, v42, v43, v44);
            long long v50 = v45;
            if (v45 != *(void **)(a1 + 40))
            {
              long long v51 = objc_msgSend_colocated2GHzRNRChannel(v21, v46, v47, v48, v49);
              unint64_t v56 = v51;
              if (v51 && *(void *)(a1 + 40))
              {
                __int16 v57 = objc_msgSend_colocated2GHzRNRChannel(v21, v52, v53, v54, v55);
                char v61 = objc_msgSend_isEqual_(v57, v58, *(void *)(a1 + 40), v59, v60);

                if (v61) {
                  goto LABEL_26;
                }
              }
              else
              {
              }
              objc_msgSend_setColocated2GHzRNRChannel_(v21, v41, *(void *)(a1 + 40), v43, v44);
              goto LABEL_34;
            }

LABEL_26:
            if (!objc_msgSend_is5GHz(*(void **)(a1 + 40), v41, v42, v43, v44)) {
              goto LABEL_36;
            }
            size_t v66 = objc_msgSend_colocated5GHzRNRChannel(v21, v62, v63, v64, v65);
            uint64_t v71 = v66;
            if (v66 == *(void **)(a1 + 40))
            {

              goto LABEL_36;
            }
            uint64_t v72 = objc_msgSend_colocated5GHzRNRChannel(v21, v67, v68, v69, v70);
            uint64_t v77 = v72;
            if (v72 && *(void *)(a1 + 40))
            {
              uint64_t v78 = objc_msgSend_colocated5GHzRNRChannel(v21, v73, v74, v75, v76);
              char v82 = objc_msgSend_isEqual_(v78, v79, *(void *)(a1 + 40), v80, v81);

              if (v82) {
                goto LABEL_36;
              }
            }
            else
            {
            }
            objc_msgSend_setColocated5GHzRNRChannel_(v21, v83, *(void *)(a1 + 40), v84, v85);
LABEL_34:

            id v7 = v89;
            goto LABEL_37;
          }
        }
        else
        {
        }
      }
    }
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v91, (uint64_t)v95, 16);
    if (v18) {
      continue;
    }
    break;
  }
LABEL_36:

  id v7 = v89;
  if (v88)
  {
LABEL_37:
    id v86 = v7;
    goto LABEL_39;
  }
LABEL_38:
  id v86 = 0;
LABEL_39:

  return v86;
}

void sub_1B4FA219C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4FA4C20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4FA5D34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4FA5DFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4FA5EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4FA5F64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FA8F34(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_SSID(v4, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_length(v10, v11, v12, v13, v14);

  char v20 = objc_msgSend_SSID(v5, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_length(v20, v21, v22, v23, v24);

  if ((objc_msgSend_isFILSDiscoveryFrame(v4, v26, v27, v28, v29) & 1) != 0
    || (BOOL v34 = v25 != 0, (objc_msgSend_isFILSDiscoveryFrame(v5, v30, v31, v32, v33) & 1) != 0)
    || (((v15 == 0) ^ v34) & 1) != 0)
  {
    __int16 v36 = objc_msgSend_channel(v4, v30, v31, v32, v33);
    int v41 = objc_msgSend_is2GHz(v36, v37, v38, v39, v40);
    uint64_t v46 = objc_msgSend_channel(v5, v42, v43, v44, v45);
    int v51 = objc_msgSend_is2GHz(v46, v47, v48, v49, v50);

    if (v41 == v51)
    {
      uint64_t v35 = 0;
    }
    else
    {
      unint64_t v56 = objc_msgSend_channel(v4, v52, v53, v54, v55);
      if (objc_msgSend_is2GHz(v56, v57, v58, v59, v60)) {
        uint64_t v35 = -1;
      }
      else {
        uint64_t v35 = 1;
      }
    }
  }
  else if (v15)
  {
    uint64_t v35 = 1;
  }
  else
  {
    uint64_t v35 = -1;
  }

  return v35;
}

void sub_1B4FAA8C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FAA8E4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_scanRecord(a2, (const char *)a2, a3, a4, a5);
}

uint64_t sub_1B4FAAE78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v16 = objc_msgSend_SSID(v5, v8, v9, v10, v11);
  if (v7 == v16)
  {
    int isEqual = 1;
  }
  else if (*(void *)(a1 + 32))
  {
    int v21 = objc_msgSend_SSID(v5, v12, v13, v14, v15);
    if (v21)
    {
      uint64_t v22 = *(void **)(a1 + 32);
      uint64_t v23 = objc_msgSend_SSID(v5, v17, v18, v19, v20);
      int isEqual = objc_msgSend_isEqual_(v22, v24, (uint64_t)v23, v25, v26);
    }
    else
    {
      int isEqual = 0;
    }
  }
  else
  {
    int isEqual = 0;
  }

  uint64_t v28 = *(void **)(a1 + 32);
  uint64_t v37 = objc_msgSend_SSID(v6, v29, v30, v31, v32);
  if (v28 == v37)
  {
    int v48 = 1;
  }
  else if (*(void *)(a1 + 32))
  {
    uint64_t v42 = objc_msgSend_SSID(v6, v33, v34, v35, v36);
    if (v42)
    {
      uint64_t v43 = *(void **)(a1 + 32);
      uint64_t v44 = objc_msgSend_SSID(v6, v38, v39, v40, v41);
      int v48 = objc_msgSend_isEqual_(v43, v45, (uint64_t)v44, v46, v47);
    }
    else
    {
      int v48 = 0;
    }
  }
  else
  {
    int v48 = 0;
  }

  uint64_t v49 = 1;
  if (!isEqual) {
    uint64_t v49 = -1;
  }
  if (v48 == isEqual) {
    uint64_t v50 = 0;
  }
  else {
    uint64_t v50 = v49;
  }

  return v50;
}

uint64_t sub_1B4FAAFE4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_lastJoinedByUserAt(a2, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_lastJoinedByUserAt(v4, v10, v11, v12, v13);

  if (v9 && v14)
  {
    uint64_t v18 = objc_msgSend_compare_(v9, v15, (uint64_t)v14, v16, v17);
  }
  else if (v9)
  {
    uint64_t v18 = 1;
  }
  else
  {
    uint64_t v18 = -1;
  }

  return v18;
}

uint64_t sub_1B4FAB06C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_SSID(v4, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_SSID(v5, v11, v12, v13, v14);
  if (v10 == (void *)v15)
  {

    goto LABEL_7;
  }
  uint64_t v20 = (void *)v15;
  uint64_t v21 = objc_msgSend_SSID(v4, v16, v17, v18, v19);
  if (v21)
  {
    uint64_t v26 = (void *)v21;
    uint64_t v27 = objc_msgSend_SSID(v5, v22, v23, v24, v25);
    if (v27)
    {
      uint64_t v32 = (void *)v27;
      uint64_t v33 = objc_msgSend_SSID(v4, v28, v29, v30, v31);
      uint64_t v38 = objc_msgSend_SSID(v5, v34, v35, v36, v37);
      char isEqual = objc_msgSend_isEqual_(v33, v39, (uint64_t)v38, v40, v41);

      if ((isEqual & 1) == 0) {
        goto LABEL_10;
      }
LABEL_7:
      uint64_t v47 = 0;
      goto LABEL_27;
    }
  }
LABEL_10:
  int v48 = objc_msgSend_BSSID(v4, v43, v44, v45, v46);
  unint64_t v56 = objc_msgSend_substringToIndex_(v48, v49, 2, v50, v51);
  if (v56)
  {
    __int16 v57 = objc_msgSend_BSSID(*(void **)(a1 + 32), v52, v53, v54, v55);
    uint64_t v65 = objc_msgSend_substringToIndex_(v57, v58, 2, v59, v60);
    if (v65)
    {
      uint64_t v126 = objc_msgSend_BSSID(v4, v61, v62, v63, v64);
      uint64_t v69 = objc_msgSend_substringToIndex_(v126, v66, 2, v67, v68);
      uint64_t v74 = objc_msgSend_BSSID(*(void **)(a1 + 32), v70, v71, v72, v73);
      uint64_t v78 = objc_msgSend_substringToIndex_(v74, v75, 2, v76, v77);
      int v82 = objc_msgSend_isEqual_(v69, v79, (uint64_t)v78, v80, v81);

      int v83 = v82;
    }
    else
    {
      int v83 = 0;
    }
  }
  else
  {
    int v83 = 0;
  }

  int v88 = objc_msgSend_BSSID(v5, v84, v85, v86, v87);
  uint64_t v96 = objc_msgSend_substringToIndex_(v88, v89, 2, v90, v91);
  if (v96)
  {
    uint64_t v97 = objc_msgSend_BSSID(*(void **)(a1 + 32), v92, v93, v94, v95);
    uint64_t v105 = objc_msgSend_substringToIndex_(v97, v98, 2, v99, v100);
    if (v105)
    {
      __int16 v127 = objc_msgSend_BSSID(v5, v101, v102, v103, v104);
      int v125 = objc_msgSend_substringToIndex_(v127, v106, 2, v107, v108);
      uint64_t v113 = objc_msgSend_BSSID(*(void **)(a1 + 32), v109, v110, v111, v112);
      objc_msgSend_substringToIndex_(v113, v114, 2, v115, v116);
      unint64_t v118 = v117 = v83;
      int v122 = objc_msgSend_isEqual_(v125, v119, (uint64_t)v118, v120, v121);

      int v83 = v117;
    }
    else
    {
      int v122 = 0;
    }
  }
  else
  {
    int v122 = 0;
  }

  uint64_t v123 = 1;
  if (!v83) {
    uint64_t v123 = -1;
  }
  if (v122 == v83) {
    uint64_t v47 = 0;
  }
  else {
    uint64_t v47 = v123;
  }
LABEL_27:

  return v47;
}

uint64_t sub_1B4FAB360(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v77 = 0;
  uint64_t v10 = objc_msgSend_SSID(v4, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_SSID(v5, v11, v12, v13, v14);
  if (v10 == (void *)v15)
  {

    goto LABEL_7;
  }
  uint64_t v20 = (void *)v15;
  uint64_t v21 = objc_msgSend_SSID(v4, v16, v17, v18, v19);
  if (v21)
  {
    uint64_t v26 = (void *)v21;
    uint64_t v27 = objc_msgSend_SSID(v5, v22, v23, v24, v25);
    if (v27)
    {
      uint64_t v32 = (void *)v27;
      uint64_t v33 = objc_msgSend_SSID(v4, v28, v29, v30, v31);
      uint64_t v38 = objc_msgSend_SSID(v5, v34, v35, v36, v37);
      char isEqual = objc_msgSend_isEqual_(v33, v39, (uint64_t)v38, v40, v41);

      if ((isEqual & 1) == 0) {
        goto LABEL_10;
      }
LABEL_7:
      uint64_t v47 = 0;
      goto LABEL_22;
    }
  }
LABEL_10:
  int v48 = objc_msgSend_BSSID(v4, v43, v44, v45, v46);
  uint64_t v53 = v48;
  if (v48)
  {
    uint64_t v54 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v48, v49, @":", (uint64_t)&stru_1F0DA9CF0, v52);

    uint64_t v53 = objc_msgSend_scannerWithString_(MEMORY[0x1E4F28FE8], v55, (uint64_t)v54, v56, v57);
    objc_msgSend_scanHexLongLong_(v53, v58, (uint64_t)&v77, v59, v60);
  }
  else
  {
    uint64_t v54 = 0;
  }
  char v61 = objc_msgSend_BSSID(v5, v49, v50, v51, v52, 0);
  if (v61)
  {
    uint64_t v64 = v61;
    uint64_t v65 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v61, v62, @":", (uint64_t)&stru_1F0DA9CF0, v63);

    uint64_t v69 = objc_msgSend_scannerWithString_(MEMORY[0x1E4F28FE8], v66, (uint64_t)v65, v67, v68);

    objc_msgSend_scanHexLongLong_(v69, v70, (uint64_t)&v76, v71, v72);
    unint64_t v73 = v76;

    uint64_t v53 = v69;
  }
  else
  {
    unint64_t v73 = 0;
  }
  uint64_t v74 = 1;
  if (v77 >= v73) {
    uint64_t v74 = -1;
  }
  if (v77 == v73) {
    uint64_t v47 = 0;
  }
  else {
    uint64_t v47 = v74;
  }

LABEL_22:
  return v47;
}

uint64_t sub_1B4FAB570(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_addReason(v4, v6, v7, v8, v9);
  uint64_t v19 = objc_msgSend_addReason(v5, v11, v12, v13, v14);
  if (v10 == 10) {
    int isProfileBased = 0;
  }
  else {
    int isProfileBased = objc_msgSend_isProfileBased(v4, v15, v16, v17, v18);
  }
  if (v19 == 10)
  {
    BOOL v21 = isProfileBased == 0;
    uint64_t v22 = 1;
  }
  else
  {
    int v23 = objc_msgSend_isProfileBased(v5, v15, v16, v17, v18);
    BOOL v21 = isProfileBased == v23;
    uint64_t v22 = -1;
    if (!v23) {
      uint64_t v22 = 1;
    }
  }
  if (v21) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v22;
  }

  return v24;
}

uint64_t sub_1B4FAB624(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int isPersonalHotspot = objc_msgSend_isPersonalHotspot(v4, v6, v7, v8, v9);
  int v15 = objc_msgSend_isPersonalHotspot(v5, v11, v12, v13, v14);

  if (isPersonalHotspot == v15)
  {
    uint64_t v20 = 0;
  }
  else if (objc_msgSend_isPersonalHotspot(v4, v16, v17, v18, v19))
  {
    uint64_t v20 = -1;
  }
  else
  {
    uint64_t v20 = 1;
  }

  return v20;
}

uint64_t sub_1B4FAB6A4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int isOpen = objc_msgSend_isOpen(v4, v6, v7, v8, v9);
  int v15 = objc_msgSend_isOpen(v5, v11, v12, v13, v14);

  if (isOpen == v15)
  {
    uint64_t v20 = 0;
  }
  else if (objc_msgSend_isOpen(v4, v16, v17, v18, v19))
  {
    uint64_t v20 = -1;
  }
  else
  {
    uint64_t v20 = 1;
  }

  return v20;
}

uint64_t sub_1B4FAB724(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend_is6GHz(v5, v7, v8, v9, v10)) {
    int v15 = objc_msgSend___does6GHzChannelOverlapWithUWB_(*(void **)(a1 + 32), v11, (uint64_t)v5, v13, v14) ^ 1;
  }
  else {
    int v15 = 0;
  }
  if (objc_msgSend_is6GHz(v6, v11, v12, v13, v14)) {
    int v20 = objc_msgSend___does6GHzChannelOverlapWithUWB_(*(void **)(a1 + 32), v16, (uint64_t)v6, v18, v19) ^ 1;
  }
  else {
    int v20 = 0;
  }
  if (v15 == v20)
  {
    if (objc_msgSend_is5GHz(v5, v16, v17, v18, v19)) {
      int v25 = objc_msgSend_isDFS(v5, v21, v22, v23, v24) ^ 1;
    }
    else {
      int v25 = 0;
    }
    if (objc_msgSend_is5GHz(v6, v21, v22, v23, v24)) {
      int v34 = objc_msgSend_isDFS(v6, v30, v31, v32, v33) ^ 1;
    }
    else {
      int v34 = 0;
    }
    if (v25 == v34)
    {
      int v35 = objc_msgSend_is6GHz(v5, v30, v31, v32, v33);
      if (v35 == objc_msgSend_is6GHz(v6, v36, v37, v38, v39))
      {
        int v52 = objc_msgSend_is5GHz(v5, v40, v41, v42, v43);
        if (v52 == objc_msgSend_is5GHz(v6, v53, v54, v55, v56))
        {
          uint64_t v51 = 0;
          goto LABEL_29;
        }
        int v44 = objc_msgSend_is5GHz(v6, v57, v58, v59, v60);
      }
      else
      {
        int v44 = objc_msgSend_is6GHz(v6, v40, v41, v42, v43);
      }
      BOOL v49 = v44 == 0;
      uint64_t v50 = -1;
      goto LABEL_26;
    }
    if (objc_msgSend_is5GHz(v6, v30, v31, v32, v33))
    {
      int isDFS = objc_msgSend_isDFS(v6, v45, v46, v47, v48);
      goto LABEL_21;
    }
LABEL_22:
    uint64_t v51 = 1;
    goto LABEL_29;
  }
  if (!objc_msgSend_is6GHz(v6, v16, v17, v18, v19)) {
    goto LABEL_22;
  }
  int isDFS = objc_msgSend___does6GHzChannelOverlapWithUWB_(*(void **)(a1 + 32), v26, (uint64_t)v6, v27, v28);
LABEL_21:
  BOOL v49 = isDFS == 0;
  uint64_t v50 = 1;
LABEL_26:
  if (v49) {
    uint64_t v51 = -v50;
  }
  else {
    uint64_t v51 = v50;
  }
LABEL_29:

  return v51;
}

uint64_t sub_1B4FAB8A8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v10 = objc_msgSend_RNRBSSList(v4, v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v65, (uint64_t)v70, 16);
  if (v12)
  {
    uint64_t v17 = v12;
    uint64_t v18 = *(void *)v66;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v66 != v18) {
          objc_enumerationMutation(v10);
        }
        int v20 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        BOOL v21 = objc_msgSend_channel(v20, v13, v14, v15, v16);
        int v26 = objc_msgSend_is6GHz(v21, v22, v23, v24, v25);

        if (v26)
        {
          uint64_t v27 = objc_msgSend_shortSSID(v20, v13, v14, v15, v16);
          if (v27)
          {
            if (v27 == objc_msgSend_shortSSID(v4, v28, v29, v30, v31)) {
              goto LABEL_14;
            }
          }
          else if (objc_msgSend_isSameSSID(v20, v28, v29, v30, v31))
          {
LABEL_14:
            int v32 = 1;
            goto LABEL_16;
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v65, (uint64_t)v70, 16);
      int v32 = 0;
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v32 = 0;
  }
LABEL_16:

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v37 = objc_msgSend_RNRBSSList(v5, v33, v34, v35, v36, 0);
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v61, (uint64_t)v69, 16);
  if (v39)
  {
    uint64_t v44 = v39;
    uint64_t v45 = *(void *)v62;
    while (2)
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v62 != v45) {
          objc_enumerationMutation(v37);
        }
        uint64_t v47 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        uint64_t v48 = objc_msgSend_channel(v47, v40, v41, v42, v43);
        int v53 = objc_msgSend_is6GHz(v48, v49, v50, v51, v52);

        if (v53)
        {
          uint64_t v54 = objc_msgSend_shortSSID(v47, v40, v41, v42, v43);
          if (v54)
          {
            if (v54 == objc_msgSend_shortSSID(v5, v55, v56, v57, v58)) {
              goto LABEL_30;
            }
          }
          else if (objc_msgSend_isSameSSID(v47, v55, v56, v57, v58))
          {
LABEL_30:

            goto LABEL_31;
          }
        }
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v61, (uint64_t)v69, 16);
      if (v44) {
        continue;
      }
      break;
    }
  }

  if (v32) {
LABEL_31:
  }
    uint64_t v59 = 1;
  else {
    uint64_t v59 = 0;
  }

  return v59;
}

uint64_t sub_1B4FABB18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v11 = objc_msgSend_SSID(v5, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_SSID(*(void **)(a1 + 32), v12, v13, v14, v15);
  int isEqualToData = objc_msgSend_isEqualToData_(v11, v17, (uint64_t)v16, v18, v19);

  uint64_t v25 = objc_msgSend_SSID(v6, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_SSID(*(void **)(a1 + 32), v26, v27, v28, v29);
  int v34 = objc_msgSend_isEqualToData_(v25, v31, (uint64_t)v30, v32, v33);

  if ((isEqualToData | v34) != 1 || isEqualToData == v34)
  {
    uint64_t v40 = 0;
    goto LABEL_21;
  }
  if (isEqualToData && objc_msgSend_RSSI(v6, v35, v36, v37, v38) < -67) {
    goto LABEL_11;
  }
  if (v34)
  {
    if (objc_msgSend_RSSI(v5, v35, v36, v37, v38) <= -68)
    {
LABEL_11:
      if (v34) {
        uint64_t v40 = -1;
      }
      else {
        uint64_t v40 = 1;
      }
      goto LABEL_21;
    }
    uint64_t v41 = -1;
  }
  else
  {
    uint64_t v41 = 1;
  }
  uint64_t v42 = objc_msgSend_RSSI(v5, v35, v36, v37, v38);
  uint64_t v47 = objc_msgSend_RSSI(v6, v43, v44, v45, v46);
  uint64_t v52 = objc_msgSend_RSSI(v5, v48, v49, v50, v51);
  uint64_t v57 = objc_msgSend_RSSI(v6, v53, v54, v55, v56);
  uint64_t v58 = v57 - v52;
  if (v42 >= v47) {
    uint64_t v58 = v52 - v57;
  }
  if (v58 >= 17) {
    uint64_t v40 = 0;
  }
  else {
    uint64_t v40 = v41;
  }
LABEL_21:

  return v40;
}

uint64_t sub_1B4FACC30(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v10 = objc_msgSend_batteryLife(v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);

  int v20 = objc_msgSend_signalStrength(v5, v16, v17, v18, v19);

  uint64_t v25 = objc_msgSend_integerValue(v20, v21, v22, v23, v24);
  BOOL v31 = v15 < 20 || v25 < 1;
  uint64_t v32 = objc_msgSend_batteryLife(v4, v26, v27, v28, v29);
  uint64_t v37 = objc_msgSend_integerValue(v32, v33, v34, v35, v36);

  uint64_t v42 = objc_msgSend_signalStrength(v4, v38, v39, v40, v41);

  uint64_t v47 = objc_msgSend_integerValue(v42, v43, v44, v45, v46);
  BOOL v49 = v37 < 20 || v47 < 1;
  int v50 = v31 ^ v49;
  BOOL v51 = !v49;
  uint64_t v52 = -1;
  if (v51) {
    uint64_t v52 = 1;
  }
  if (v50) {
    return v52;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B4FACD14(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v10 = objc_msgSend_group(v4, v6, v7, v8, v9);
  if (v10 == objc_msgSend_group(v5, v11, v12, v13, v14)) {
    goto LABEL_2;
  }
  if (objc_msgSend_group(v4, v15, v16, v17, v18) == 1 || objc_msgSend_group(v5, v20, v21, v22, v23) == 1)
  {
    uint64_t v24 = 1;
  }
  else
  {
    if (objc_msgSend_group(v4, v20, v21, v22, v23) != 2 && objc_msgSend_group(v5, v20, v21, v22, v23) != 2)
    {
LABEL_2:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    uint64_t v24 = 2;
  }
  if (objc_msgSend_group(v5, v20, v21, v22, v23) == v24) {
    uint64_t v19 = -1;
  }
  else {
    uint64_t v19 = 1;
  }
LABEL_12:

  return v19;
}

void sub_1B4FAD818(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4FADFA4(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(unsigned char *)(*(void *)(a1 + 32) + 24_Block_object_dispose(&STACK[0x2C0], 8) = 0;
  id v6 = *(unsigned char **)(a1 + 32);
  if (!v6[200]) {
    objc_msgSend___nextRequest(v6, v2, v3, v4, v5);
  }
  objc_sync_exit(obj);
}

void sub_1B4FAE010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B4FAEC18(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = CWFGetOSLog();
  if (v6)
  {
    uint64_t v7 = CWFGetOSLog();
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = objc_msgSend_integerValue(v4, v9, v10, v11, v12);
    uint64_t v18 = sub_1B4F54A8C(v13, v14, v15, v16, v17);
    _os_log_send_and_compose_impl();
  }
}

void sub_1B4FAF040(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4FAF564(uint64_t a1)
{
  uint64_t v41 = objc_alloc_init(CWFAutoJoinParameters);
  objc_msgSend_setMode_(v41, v2, 2, v3, v4);
  uint64_t v8 = objc_msgSend___retryTriggerForRetrySchedule_(*(void **)(a1 + 32), v5, *(void *)(*(void *)(a1 + 32) + 56), v6, v7);
  objc_msgSend_setTrigger_(v41, v9, v8, v10, v11);
  uint64_t v12 = objc_alloc_init(CWFAutoJoinRequest);
  uint64_t v17 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v13, v14, v15, v16);
  objc_msgSend_setUUID_(v12, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_setParameters_(v12, v21, (uint64_t)v41, v22, v23);
  uint64_t v27 = objc_msgSend___retryIntervalWithScheduleIndex_(*(void **)(a1 + 32), v24, *(void *)(*(void *)(a1 + 32) + 64), v25, v26);
  uint64_t v32 = objc_msgSend_allowAutoHotspotFallback(v27, v28, v29, v30, v31);
  objc_msgSend_setAllowAutoHotspotFallback_(v12, v33, v32, v34, v35);

  id v36 = *(id *)(a1 + 32);
  objc_sync_enter(v36);
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  uint64_t v40 = *(unsigned char **)(a1 + 32);
  if (!v40[200]) {
    objc_msgSend___addRequest_(v40, v37, (uint64_t)v12, v38, v39);
  }
  objc_sync_exit(v36);
}

void sub_1B4FAF67C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B4FAF9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FAF9E8(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 134219010;
    unint64_t v35 = v3 / 0x3B9ACA00;
    __int16 v36 = 2048;
    unint64_t v37 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v38 = 2082;
    uint64_t v39 = "-[CWFAutoJoinManager __calloutToAllowAutoJoinWithTrigger:error:]_block_invoke";
    __int16 v40 = 2082;
    uint64_t v41 = "CWFAutoJoinManager.m";
    __int16 v42 = 1024;
    int v43 = 6678;
    _os_log_send_and_compose_impl();
  }

  uint64_t v11 = objc_msgSend_allowAutoJoinHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_allowAutoJoinHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 72);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = sub_1B4FAFCD4;
    v29[3] = &unk_1E60BC480;
    long long v31 = *(_OWORD *)(a1 + 56);
    long long v28 = *(_OWORD *)(a1 + 40);
    id v18 = (id)v28;
    long long v30 = v28;
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v17, v29);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28798];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v33 = @"CWFAutoJoinManager.allowAutoJoinHandler() not configured";
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v33, (uint64_t)&v32, 1);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, v20, 6, (uint64_t)v21);
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    int v27 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (unsigned int *)&v27, 1u);
    if (!v27) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v26);
    }
  }
}

void sub_1B4FAFCD4(void *a1, char a2, void *a3)
{
  id v7 = a3;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  int v6 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[7] + 8) + 24), (unsigned int *)&v6, 1u);
  if (!v6) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB0248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 240), 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB02A0(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v37 = 134219010;
    unint64_t v38 = v3 / 0x3B9ACA00;
    __int16 v39 = 2048;
    unint64_t v40 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v41 = 2082;
    __int16 v42 = "-[CWFAutoJoinManager __calloutToAllowKnownNetwork:trigger:allowForSeamlessSSIDTransition:defer:queue:error:]_block_invoke";
    __int16 v43 = 2082;
    uint64_t v44 = "CWFAutoJoinManager.m";
    __int16 v45 = 1024;
    int v46 = 6719;
    _os_log_send_and_compose_impl();
  }

  uint64_t v11 = objc_msgSend_allowKnownNetworkHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_allowKnownNetworkHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1B4FB05A4;
    v31[3] = &unk_1E60BC4D0;
    long long v33 = *(_OWORD *)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 96);
    uint64_t v34 = *(void *)(a1 + 88);
    long long v30 = *(_OWORD *)(a1 + 56);
    id v20 = (id)v30;
    long long v32 = v30;
    ((void (**)(void, uint64_t, uint64_t, uint64_t, void *))v16)[2](v16, v17, v19, v18, v31);
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28798];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    __int16 v36 = @"CWFAutoJoinManager.allowKnownNetworkHandler() not configured";
    uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v36, (uint64_t)&v35, 1);
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v24, v22, 6, (uint64_t)v23);
    uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8);
    int v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    int v29 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 88) + 8) + 24), (unsigned int *)&v29, 1u);
    if (!v29) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v28);
    }
  }
}

void sub_1B4FB05A4(void *a1, char a2, char a3, void *a4)
{
  id v9 = a4;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  int v8 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[8] + 8) + 24), (unsigned int *)&v8, 1u);
  if (!v8) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB0658(void *a1, char a2, char a3, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void sub_1B4FB0A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB0AD0(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v35 = 134219010;
    unint64_t v36 = v3 / 0x3B9ACA00;
    __int16 v37 = 2048;
    unint64_t v38 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v39 = 2082;
    unint64_t v40 = "-[CWFAutoJoinManager __calloutToScanForNetworksWithParameters:scanChannels:error:]_block_invoke";
    __int16 v41 = 2082;
    __int16 v42 = "CWFAutoJoinManager.m";
    __int16 v43 = 1024;
    int v44 = 6778;
    _os_log_send_and_compose_impl();
  }

  uint64_t v11 = objc_msgSend_scanForNetworksHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_scanForNetworksHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    long long v28 = *(_OWORD *)(a1 + 48);
    long long v31 = *(_OWORD *)(a1 + 64);
    void v29[2] = sub_1B4FB0DC8;
    v29[3] = &unk_1E60BC548;
    uint64_t v32 = *(void *)(a1 + 80);
    id v18 = (id)v28;
    long long v30 = v28;
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v17, v29);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28798];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    uint64_t v34 = @"CWFAutoJoinManager.scanForNetworksHandler() not configured";
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v34, (uint64_t)&v33, 1);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, v20, 6, (uint64_t)v21);
    uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    int v27 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 24), (unsigned int *)&v27, 1u);
    if (!v27) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v26);
    }
  }
}

void sub_1B4FB0DC8(void *a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
  int v10 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[8] + 8) + 24), (unsigned int *)&v10, 1u);
  if (!v10) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB1288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB12D8(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v35 = 134219010;
    unint64_t v36 = v3 / 0x3B9ACA00;
    __int16 v37 = 2048;
    unint64_t v38 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v39 = 2082;
    unint64_t v40 = "-[CWFAutoJoinManager __calloutToPerformGASQueryWithParameters:GASQueryNetworks:error:]_block_invoke";
    __int16 v41 = 2082;
    __int16 v42 = "CWFAutoJoinManager.m";
    __int16 v43 = 1024;
    int v44 = 6829;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_performGASQueryHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_performGASQueryHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    long long v28 = *(_OWORD *)(a1 + 48);
    long long v31 = *(_OWORD *)(a1 + 64);
    void v29[2] = sub_1B4FB15D0;
    v29[3] = &unk_1E60BC548;
    uint64_t v32 = *(void *)(a1 + 80);
    id v18 = (id)v28;
    long long v30 = v28;
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v17, v29);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28798];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    uint64_t v34 = @"CWFAutoJoinManager.performGASQueryHandler() not configured";
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v34, (uint64_t)&v33, 1);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, v20, 6, (uint64_t)v21);
    uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    int v27 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 24), (unsigned int *)&v27, 1u);
    if (!v27) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v26);
    }
  }
}

void sub_1B4FB15D0(void *a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
  int v10 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[8] + 8) + 24), (unsigned int *)&v10, 1u);
  if (!v10) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB1A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB1A7C(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v36 = 134219010;
    unint64_t v37 = v3 / 0x3B9ACA00;
    __int16 v38 = 2048;
    unint64_t v39 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v40 = 2082;
    __int16 v41 = "-[CWFAutoJoinManager __calloutToAllowJoinCandidate:trigger:defer:error:]_block_invoke";
    __int16 v42 = 2082;
    __int16 v43 = "CWFAutoJoinManager.m";
    __int16 v44 = 1024;
    int v45 = 6876;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_allowJoinCandidateHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_allowJoinCandidateHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 40);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    long long v29 = *(_OWORD *)(a1 + 48);
    long long v32 = *(_OWORD *)(a1 + 64);
    v30[2] = sub_1B4FB1D78;
    void v30[3] = &unk_1E60BC4D0;
    uint64_t v18 = *(void *)(a1 + 88);
    uint64_t v33 = *(void *)(a1 + 80);
    id v19 = (id)v29;
    long long v31 = v29;
    ((void (**)(void, uint64_t, uint64_t, void *))v16)[2](v16, v17, v18, v30);
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28798];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    int v35 = @"CWFAutoJoinManager.allowJoinCandidateHandler() not configured";
    uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v35, (uint64_t)&v34, 1);
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v23, v21, 6, (uint64_t)v22);
    uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    int v28 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 24), (unsigned int *)&v28, 1u);
    if (!v28) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v27);
    }
  }
}

void sub_1B4FB1D78(void *a1, char a2, char a3, void *a4)
{
  id v9 = a4;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  int v8 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[8] + 8) + 24), (unsigned int *)&v8, 1u);
  if (!v8) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB2138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB2170(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 134219010;
    unint64_t v35 = v3 / 0x3B9ACA00;
    __int16 v36 = 2048;
    unint64_t v37 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v38 = 2082;
    unint64_t v39 = "-[CWFAutoJoinManager __calloutToAssociateWithParameters:error:]_block_invoke";
    __int16 v40 = 2082;
    __int16 v41 = "CWFAutoJoinManager.m";
    __int16 v42 = 1024;
    int v43 = 6919;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_associateToNetworkHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_associateToNetworkHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = sub_1B4FB245C;
    v29[3] = &unk_1E60BC5C0;
    uint64_t v31 = *(void *)(a1 + 64);
    long long v28 = *(_OWORD *)(a1 + 48);
    id v18 = (id)v28;
    long long v30 = v28;
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v17, v29);
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28798];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v33 = @"CWFAutoJoinManager.associateToNetworkHandler() not configured";
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v33, (uint64_t)&v32, 1);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, v20, 6, (uint64_t)v21);
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    int v27 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (unsigned int *)&v27, 1u);
    if (!v27) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v26);
    }
  }
}

void sub_1B4FB245C(void *a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  int v4 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned int *)&v4, 1u);
  if (!v4) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB27F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB2838(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  int v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 134219010;
    unint64_t v35 = v3 / 0x3B9ACA00;
    __int16 v36 = 2048;
    unint64_t v37 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v38 = 2082;
    unint64_t v39 = "-[CWFAutoJoinManager __calloutToAllowAutoHotspotWithTrigger:error:]_block_invoke";
    __int16 v40 = 2082;
    __int16 v41 = "CWFAutoJoinManager.m";
    __int16 v42 = 1024;
    int v43 = 6956;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_allowAutoHotspotHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_allowAutoHotspotHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 72);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = sub_1B4FB2B24;
    v29[3] = &unk_1E60BC610;
    long long v31 = *(_OWORD *)(a1 + 56);
    long long v28 = *(_OWORD *)(a1 + 40);
    id v18 = (id)v28;
    long long v30 = v28;
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v17, v29);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28798];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v33 = @"CWFAutoJoinManager.allowAutoHotspotHandler() not configured";
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v33, (uint64_t)&v32, 1);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, v20, 6, (uint64_t)v21);
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    int v27 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (unsigned int *)&v27, 1u);
    if (!v27) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v26);
    }
  }
}

void sub_1B4FB2B24(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  int v6 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[7] + 8) + 24), (unsigned int *)&v6, 1u);
  if (!v6) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB2EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB2F38(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  int v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 134219010;
    unint64_t v35 = v3 / 0x3B9ACA00;
    __int16 v36 = 2048;
    unint64_t v37 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v38 = 2082;
    unint64_t v39 = "-[CWFAutoJoinManager __calloutToAllowHotspot:error:]_block_invoke";
    __int16 v40 = 2082;
    __int16 v41 = "CWFAutoJoinManager.m";
    __int16 v42 = 1024;
    int v43 = 6994;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_allowHotspotHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_allowHotspotHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    long long v28 = *(_OWORD *)(a1 + 48);
    long long v31 = *(_OWORD *)(a1 + 64);
    void v29[2] = sub_1B4FB3220;
    v29[3] = &unk_1E60BC480;
    id v18 = (id)v28;
    long long v30 = v28;
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v17, v29);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28798];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v33 = @"CWFAutoJoinManager.allowHotspotHandler() not configured";
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v33, (uint64_t)&v32, 1);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, v20, 6, (uint64_t)v21);
    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    int v27 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 72) + 8) + 24), (unsigned int *)&v27, 1u);
    if (!v27) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v26);
    }
  }
}

void sub_1B4FB3220(void *a1, char a2, void *a3)
{
  id v7 = a3;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  int v6 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[7] + 8) + 24), (unsigned int *)&v6, 1u);
  if (!v6) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB3628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1B4FB366C(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  int v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v36 = 134219010;
    unint64_t v37 = v3 / 0x3B9ACA00;
    __int16 v38 = 2048;
    unint64_t v39 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v40 = 2082;
    __int16 v41 = "-[CWFAutoJoinManager __calloutToBrowseForHotspotsWithTimeout:maxCacheAge:cacheOnly:error:]_block_invoke";
    __int16 v42 = 2082;
    int v43 = "CWFAutoJoinManager.m";
    __int16 v44 = 1024;
    int v45 = 7032;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_browseForHotspotsHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_browseForHotspotsHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 80);
    uint64_t v19 = *(unsigned __int8 *)(a1 + 88);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1B4FB3964;
    v31[3] = &unk_1E60BC660;
    long long v33 = *(_OWORD *)(a1 + 56);
    long long v30 = *(_OWORD *)(a1 + 40);
    id v20 = (id)v30;
    long long v32 = v30;
    ((void (**)(void, uint64_t, uint64_t, uint64_t, void *))v16)[2](v16, v17, v18, v19, v31);
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28798];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    unint64_t v35 = @"CWFAutoJoinManager.browseForHotspotsHandler() not configured";
    uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v35, (uint64_t)&v34, 1);
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v24, v22, 6, (uint64_t)v23);
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
    int v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    int v29 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (unsigned int *)&v29, 1u);
    if (!v29) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v28);
    }
  }
}

void sub_1B4FB3964(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  int v7 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[7] + 8) + 24), (unsigned int *)&v7, 1u);
  if (!v7) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB3D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB3D60(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  int v4 = CWFGetOSLog();
  if (v4)
  {
    id v5 = CWFGetOSLog();
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 134219010;
    unint64_t v35 = v3 / 0x3B9ACA00;
    __int16 v36 = 2048;
    unint64_t v37 = v3 % 0x3B9ACA00 / 0x3E8;
    __int16 v38 = 2082;
    unint64_t v39 = "-[CWFAutoJoinManager __calloutToConnectToHotspot:error:]_block_invoke";
    __int16 v40 = 2082;
    __int16 v41 = "CWFAutoJoinManager.m";
    __int16 v42 = 1024;
    int v43 = 7069;
    _os_log_send_and_compose_impl();
  }

  id v11 = objc_msgSend_connectToHotspotHandler(*(void **)(a1 + 32), v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_connectToHotspotHandler(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = *(void *)(a1 + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = sub_1B4FB404C;
    v29[3] = &unk_1E60BC5C0;
    uint64_t v31 = *(void *)(a1 + 64);
    long long v28 = *(_OWORD *)(a1 + 48);
    id v18 = (id)v28;
    long long v30 = v28;
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v17, v29);
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28798];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    long long v33 = @"CWFAutoJoinManager.connectToHotspotHandler() not configured";
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v33, (uint64_t)&v32, 1);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, v20, 6, (uint64_t)v21);
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    int v27 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (unsigned int *)&v27, 1u);
    if (!v27) {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v26);
    }
  }
}

void sub_1B4FB404C(void *a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  int v4 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned int *)&v4, 1u);
  if (!v4) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FB46D0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1BA995D10]();
  id v6 = a3;
  __uint64_t v7 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v8 = CWFGetOSLog();
  if (v8)
  {
    uint64_t v9 = CWFGetOSLog();
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v15 = v7 / 0x3B9ACA00;
    unint64_t v16 = v7 % 0x3B9ACA00 / 0x3E8;
    uint64_t v17 = objc_msgSend_interfaceName(v6, v11, v12, v13, v14);
    int v59 = 134219522;
    unint64_t v60 = v15;
    __int16 v61 = 2048;
    unint64_t v62 = v16;
    __int16 v63 = 2082;
    long long v64 = "__SCDynamicStoreCallBack";
    __int16 v65 = 2082;
    long long v66 = "CWFSCNetworkService.m";
    __int16 v67 = 1024;
    int v68 = 61;
    __int16 v69 = 2112;
    uint64_t v70 = v17;
    __int16 v71 = 2112;
    uint64_t v72 = a2;
    LODWORD(v53) = 68;
    uint64_t v52 = &v59;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend_serviceID(v6, v18, v19, v20, v21);
  uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC0], v26, 0);
    if (NetworkServiceEntity)
    {
      uint64_t v32 = (__CFString *)NetworkServiceEntity;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v33 = a2;
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v54, (uint64_t)v58, 16);
      if (v35)
      {
        uint64_t v39 = v35;
        uint64_t v40 = *(void *)v55;
        while (2)
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v55 != v40) {
              objc_enumerationMutation(v33);
            }
            if (objc_msgSend_isEqualToString_(v32, v36, *(void *)(*((void *)&v54 + 1) + 8 * i), v37, v38, v52, v53, (void)v54))
            {

              CFRelease(v32);
              goto LABEL_18;
            }
          }
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v54, (uint64_t)v58, 16);
          if (v39) {
            continue;
          }
          break;
        }
      }

      CFRelease(v32);
    }
  }
  else
  {
LABEL_18:
    objc_msgSend_refreshServiceID(v6, v22, v23, v24, v25, v52, v53);
  }
  if (objc_msgSend_isMonitoringEvents(v6, v28, v29, v30, v31, v52, v53))
  {
    objc_msgSend_eventHandler(v6, v42, v43, v44, v45);
    int v50 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      BOOL v51 = objc_msgSend_copy(a2, v46, v47, v48, v49);
      ((void (**)(void, id, void *))v50)[2](v50, v6, v51);
    }
  }
}

void sub_1B4FB49E4(uint64_t a1, void *a2)
{
  __uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  id v4 = a2;
  id v5 = CWFGetOSLog();
  if (v5)
  {
    id v6 = CWFGetOSLog();
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_restartEventMonitoring(v4, v8, v9, v10, v11);
}

void sub_1B4FB4ABC(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateServiceID(*(void **)(a1 + 32), v3, v4, v5, v6);
  objc_msgSend___refreshNotificationKeys(*(void **)(a1 + 32), v7, v8, v9, v10);
}

void sub_1B4FB514C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend___refreshServiceID(*(void **)(a1 + 32), v3, v4, v5, v6);
}

void sub_1B4FB5210(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  id v7 = *(unsigned char **)(a1 + 32);
  if (v7[40])
  {
    objc_msgSend___refreshServiceID(v7, v2, v3, v4, v5);
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  }
}

void sub_1B4FB52DC(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 40))
  {
    *(unsigned char *)(v3 + 40) = 1;
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  }
}

void sub_1B4FB53AC(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 40))
  {
    *(unsigned char *)(v3 + 40) = 0;
    SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), 0, 0);
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), 0);
  }
}

void sub_1B4FB54C8(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 40);
}

void sub_1B4FB5CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB5CEC(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv4StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41C48];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41C48], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___IPv4SetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB5EA4(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv4StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41C50];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41C50], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___IPv4SetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB605C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv4StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41CA8];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41CA8], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___IPv4SetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB6214(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv4StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41C60];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41C60], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___IPv4SetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB63CC(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv4StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41CB0];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41CB0], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___IPv4SetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB6584(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv6StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41D10];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41D10], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___IPv6SetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB673C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv6StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41CC0];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41CC0], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___IPv6SetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB68F4(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv6SetupConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x1E4F41CC8], v9, v10);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void sub_1B4FB6A64(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___IPv4SetupConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x1E4F41C70], v9, v10);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void sub_1B4FB6BD4(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___DNSStateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41BB0];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41BB0], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___DNSSetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB6D8C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v7 = objc_msgSend___DNSStateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *MEMORY[0x1E4F41BC0];
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x1E4F41BC0], v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = objc_msgSend___DNSSetupConfig(*(void **)(a1 + 32), v15, v16, v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v8, v21, v22);
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

void sub_1B4FB6F44(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 48), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B4FB7090(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 56), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B4FB724C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___DHCPInfo(*(void **)(a1 + 32), v3, v4, v5, v6);
  CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v8 = v7;
  if (v7)
  {
    CFDateRef LeaseStartTime = DHCPInfoGetLeaseStartTime(v7);
    if (LeaseStartTime)
    {
      uint64_t v14 = objc_msgSend_copy(LeaseStartTime, v10, v11, v12, v13);
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

void sub_1B4FB73BC(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___DHCPInfo(*(void **)(a1 + 32), v3, v4, v5, v6);
  CFDictionaryRef v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef v8 = v7;
  if (v7)
  {
    CFDateRef LeaseExpirationTime = DHCPInfoGetLeaseExpirationTime(v7);
    if (LeaseExpirationTime)
    {
      uint64_t v14 = objc_msgSend_copy(LeaseExpirationTime, v10, v11, v12, v13);
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

void sub_1B4FB752C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  CFDictionaryRef v7 = objc_msgSend___IPv4StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"NetworkSignature", v9, v10);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void sub_1B4FB7698(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  CFDictionaryRef v7 = objc_msgSend___IPv6StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"NetworkSignature", v9, v10);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void sub_1B4FB7804(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  CFDictionaryRef v7 = objc_msgSend___DHCPStateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v11 = v7;
  if (v7)
  {
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"Option_54", v9, v10);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_1B4FB7978(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  CFDictionaryRef v7 = objc_msgSend___DHCPv6StateConfig(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v11 = v7;
  if (v7)
  {
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"Option_2", v9, v10);
    if (objc_msgSend_count(v12, v13, v14, v15, v16))
    {
      uint64_t v21 = objc_msgSend_firstObject(v12, v17, v18, v19, v20);
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;
    }
  }
}

void sub_1B4FB8A10(uint64_t a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = *(void *)(a1 + 32);
  CFDictionaryRef v7 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v8 = objc_msgSend_apple80211WithInterfaceName_(*(void **)(a1 + 40), v2, v6, v3, v4);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    uint64_t v10 = objc_msgSend_requestParameters(*(void **)(a1 + 48), v2, 0, v3, v4);
    uint64_t v15 = objc_msgSend_virtualInterfaceRole(v10, v11, v12, v13, v14);
    uint64_t v18 = objc_msgSend_apple80211WithVirtualInterfaceRole_parentInterfaceName_(v7, v16, v15, 0, v17);
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

uint64_t sub_1B4FB8AC0(uint64_t result)
{
  int v1 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(result + 40) + 8) + 24), (unsigned int *)&v1, 1u);
  if (!v1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_1B4FB8FD0(void **a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = NSString;
  uint64_t v8 = objc_msgSend_UUID(a1[4], v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_UUIDString(a1[5], v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_stringWithFormat_(v3, v19, @"%@/%@", v20, v21, v13, v18);

  objc_msgSend___cancelRequestsWithNamePrefix_(a1[6], v23, (uint64_t)v22, v24, v25);
}

void sub_1B4FB9128(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateEventMonitoring_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4FB9198(uint64_t a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  __uint64_t v2 = (void (*)(uint64_t))off_1E9D45C40;
  uint64_t v18 = off_1E9D45C40;
  if (!off_1E9D45C40)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B4FD50BC;
    v14[3] = &unk_1E60BAFD8;
    v14[4] = &v15;
    sub_1B4FD50BC(v14);
    __uint64_t v2 = (void (*)(uint64_t))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (v2)
  {
    v2(a1);
  }
  else
  {
    uint64_t v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v3, v4, v5, v6);
    uint64_t v11 = objc_msgSend_stringWithUTF8String_(NSString, v8, (uint64_t)"Boolean soft_CNForgetSSID(CFDataRef)", v9, v10);
    uint64_t v12 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v7, v13, (uint64_t)v11, @"CWFXPCRequestProxy.m", 61, @"%s", v12);

    __break(1u);
  }
}

void sub_1B4FB92BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB93C4(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend___privateMACManager(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B4FB94F4(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = *(void **)(a1[4] + 184);
  if (a1[5]) {
    objc_msgSend_objectForKeyedSubscript_(v6, v2, a1[5], v3, v4);
  }
  else {
    objc_msgSend_objectForKeyedSubscript_(v6, v2, (uint64_t)&stru_1F0DA9CF0, v3, v4);
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = *(void **)(a1[4] + 184);
    if (a1[5]) {
      objc_msgSend_setObject_forKeyedSubscript_(v13, v11, (uint64_t)v10, a1[5], v12);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v13, v11, (uint64_t)v10, (uint64_t)&stru_1F0DA9CF0, v12);
    }
  }
  uint64_t v14 = a1[6];
  uint64_t v15 = objc_msgSend_numberWithInteger_(NSNumber, v7, a1[7], v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v16, v14, (uint64_t)v15, v17);
}

void sub_1B4FB962C(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 120))
  {
    *(unsigned char *)(v7 + 120) = 1;
    objc_msgSend___startMonitoringDefaultEventIDs(*(void **)(a1 + 32), v2, v3, v4, v5);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = objc_msgSend___wifiInterfaceNames(*(void **)(a1 + 32), v8, v9, v10, v11, 0);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v23, (uint64_t)v27, 16);
    if (v14)
    {
      uint64_t v18 = v14;
      uint64_t v19 = *(void *)v24;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend___startMonitoringDefaultEventIDsForInterfaceName_(*(void **)(a1 + 32), v15, *(void *)(*((void *)&v23 + 1) + 8 * v20++), v16, v17);
        }
        while (v18 != v20);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v23, (uint64_t)v27, 16);
      }
      while (v18);
    }

    objc_msgSend___updateMonitoring_eventIDs_(*(void **)(a1 + 32), v21, 1, *(void *)(*(void *)(a1 + 32) + 112), v22);
  }
}

void sub_1B4FB97DC(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 120))
  {
    *(unsigned char *)(v7 + 120) = 0;
    objc_msgSend___stopMonitoringDefaultEventIDs(*(void **)(a1 + 32), v2, v3, v4, v5);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = objc_msgSend___wifiInterfaceNames(*(void **)(a1 + 32), v8, v9, v10, v11, 0);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v23, (uint64_t)v27, 16);
    if (v14)
    {
      uint64_t v18 = v14;
      uint64_t v19 = *(void *)v24;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend___stopMonitoringDefaultEventIDsForInterfaceName_(*(void **)(a1 + 32), v15, *(void *)(*((void *)&v23 + 1) + 8 * v20++), v16, v17);
        }
        while (v18 != v20);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v23, (uint64_t)v27, 16);
      }
      while (v18);
    }

    objc_msgSend___updateMonitoring_eventIDs_(*(void **)(a1 + 32), v21, 0, *(void *)(*(void *)(a1 + 32) + 112), v22);
  }
}

void sub_1B4FB99C0(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 120);
}

void sub_1B4FB9A78(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = objc_msgSend_allValues(*(void **)(*(void *)(a1 + 32) + 40), v3, v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v9)
  {
    uint64_t v14 = v9;
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_invalidate(*(void **)(*((void *)&v22 + 1) + 8 * v16++), v10, v11, v12, v13);
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v14);
  }

  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 224), v17, v18, v19, v20);
  uint64_t v21 = *(NSObject **)(*(void *)(a1 + 32) + 216);
  if (v21) {
    dispatch_source_cancel(v21);
  }
}

void sub_1B4FB9E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FB9EC8(void *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v8 = a3;
  if (!v13)
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v8, v5, @"Result", v6, v7);
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  int v12 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned int *)&v12, 1u);
  if (!v12) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FBA16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FBA9D8(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend___wifiInterfaceNames(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void sub_1B4FBAC9C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend___interfaceNames(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void sub_1B4FBAF60(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend___virtualInterfaceNames(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void sub_1B4FBB7F8(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[5] + 128), v2, v6, v3, v4);
    uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10, v11);
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_1B4FBB984(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[5] + 160), v2, v6, v3, v4);
    uint64_t v12 = objc_msgSend_deepCopy(v7, v8, v9, v10, v11);
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_1B4FBBB14(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[5] + 144), v2, v6, v3, v4);
    uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10, v11);
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_1B4FBBCA0(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[5] + 136), v2, v6, v3, v4);
    uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10, v11);
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_1B4FBBE2C(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[5] + 168), v2, v6, v3, v4);
    uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10, v11);
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_1B4FBBFB8(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[5] + 200), v2, v6, v3, v4);
    uint64_t v12 = objc_msgSend_copy(v7, v8, v9, v10, v11);
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_1B4FBC124(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 208), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B4FBC218(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(a1 + 40), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 208);
  *(void *)(v8 + 20_Block_object_dispose(&STACK[0x2C0], 8) = v7;
}

void sub_1B4FBC334(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = objc_msgSend_copy(*(void **)(a1 + 48), v2, v3, v4, v5);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 128), v8, (uint64_t)v7, *(void *)(a1 + 32), v9);

    uint64_t v14 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 40) + 208), v10, v11, v12, v13);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 200), v15, (uint64_t)v14, *(void *)(a1 + 32), v16);
  }
}

void sub_1B4FBC48C(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = objc_msgSend_copy(*(void **)(a1 + 48), v2, v3, v4, v5);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 144), v8, (uint64_t)v7, *(void *)(a1 + 32), v9);
  }
}

void sub_1B4FBC5C0(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = objc_msgSend_deepCopy(*(void **)(a1 + 48), v2, v3, v4, v5);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 160), v8, (uint64_t)v7, *(void *)(a1 + 32), v9);
  }
}

void sub_1B4FBC6F8(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = objc_msgSend_copy(*(void **)(a1 + 48), v2, v3, v4, v5);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 136), v8, (uint64_t)v7, *(void *)(a1 + 32), v9);
  }
}

void sub_1B4FBCA2C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateJoinStatusWithAssoc_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4FBCA70(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateJoinStatusWithAuth_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4FBCAB4(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_timestamp(*(void **)(a1 + 40), v8, v9, v10, v11);
  objc_msgSend_setLastDisconnectTimestamp_(v7, v13, (uint64_t)v12, v14, v15);

  uint64_t v20 = objc_msgSend_reason(*(void **)(a1 + 40), v16, v17, v18, v19);
  objc_msgSend_setLastDisconnectReason_(v7, v21, v20, v22, v23);
  long long v24 = *(void **)(a1 + 48);
  uint64_t v28 = objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], v25, (uint64_t)&unk_1F0DC7B60, v26, v27, &unk_1F0DC7B78, 0);
  objc_msgSend___updateNetworkProfile_updateProperties_interfaceName_reply_(v24, v29, (uint64_t)v7, (uint64_t)v28, *(void *)(a1 + 56), 0);

  int v34 = objc_msgSend___privateMACManager(*(void **)(a1 + 48), v30, v31, v32, v33);
  objc_msgSend_submitPrivateMACStatsMetricWithEventType_networkProfile_(v34, v35, @"LinkDown", *(void *)(a1 + 32), v36);
}

void sub_1B4FBCBB8(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateJoinStatusWithLinkUp_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  objc_msgSend___privateMACEvaluationCheckConnectivity(*(void **)(a1 + 32), v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend___privateMACManager(*(void **)(a1 + 32), v10, v11, v12, v13);
  objc_msgSend_submitPrivateMACStatsMetricWithEventType_networkProfile_(v14, v15, @"Linkup", *(void *)(a1 + 48), v16);
}

void sub_1B4FBCC30(uint64_t a1)
{
  __uint64_t v2 = CWFGetOSLog();
  if (v2)
  {
    uint64_t v3 = CWFGetOSLog();
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v9 = objc_msgSend_delegate(*(void **)(a1 + 32), v5, v6, v7, v8);
  uint64_t v11 = v9;
  if (v9) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v9, v10, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FBCD0C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(*(void *)(a1 + 32) + 240)) {
    _NETRBClientAddHost();
  }
}

void sub_1B4FBCD5C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(*(void *)(a1 + 32) + 240)) {
    _NETRBClientRemoveHost();
  }
}

void sub_1B4FBCDAC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v83, (uint64_t)v99, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v84;
    uint64_t v12 = *MEMORY[0x1E4F41B10];
    uint64_t v78 = *MEMORY[0x1E4F41B18];
    uint64_t v77 = *MEMORY[0x1E4F41B08];
    uint64_t v75 = *MEMORY[0x1E4F41AC0];
    uint64_t v76 = *MEMORY[0x1E4F41B00];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v84 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v83 + 1) + 8 * v13);
        if (objc_msgSend_containsString_(v14, v7, v12, v8, v9, v73, v74))
        {
          __uint64_t v18 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v19 = CWFGetOSLog();
          if (v19)
          {
            uint64_t v20 = CWFGetOSLog();
          }
          else
          {
            uint64_t v20 = MEMORY[0x1E4F14500];
            id v31 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v87 = 134219266;
            unint64_t v88 = v18 / 0x3B9ACA00;
            __int16 v89 = 2048;
            unint64_t v90 = v18 % 0x3B9ACA00 / 0x3E8;
            __int16 v91 = 2082;
            long long v92 = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke_2";
            __int16 v93 = 2082;
            uint64_t v94 = "CWFXPCRequestProxy.m";
            __int16 v95 = 1024;
            int v96 = 2546;
            __int16 v97 = 2112;
            id v98 = v4;
            LODWORD(v74) = 58;
            uint64_t v73 = &v87;
            _os_log_send_and_compose_impl();
          }

          uint64_t v32 = *(void *)(a1 + 32);
          uint64_t v33 = *(NSObject **)(v32 + 8);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1B4FBD3F0;
          block[3] = &unk_1E60BB9F0;
          void block[4] = v32;
          id v82 = *(id *)(a1 + 40);
          dispatch_async(v33, block);
          objc_msgSend___updateCurrentKnownBSSWithIPConfigurationForInterfaceName_(*(void **)(a1 + 32), v34, *(void *)(a1 + 40), v35, v36);

          uint64_t v30 = 19;
        }
        else if (objc_msgSend_containsString_(v14, v15, v78, v16, v17))
        {
          __uint64_t v24 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          long long v25 = CWFGetOSLog();
          if (v25)
          {
            uint64_t v26 = CWFGetOSLog();
          }
          else
          {
            uint64_t v26 = MEMORY[0x1E4F14500];
            id v43 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v87 = 134219266;
            unint64_t v88 = v24 / 0x3B9ACA00;
            __int16 v89 = 2048;
            unint64_t v90 = v24 % 0x3B9ACA00 / 0x3E8;
            __int16 v91 = 2082;
            long long v92 = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke_2";
            __int16 v93 = 2082;
            uint64_t v94 = "CWFXPCRequestProxy.m";
            __int16 v95 = 1024;
            int v96 = 2559;
            __int16 v97 = 2112;
            id v98 = v4;
            LODWORD(v74) = 58;
            uint64_t v73 = &v87;
            _os_log_send_and_compose_impl();
          }

          uint64_t v44 = *(void *)(a1 + 32);
          uint64_t v45 = *(NSObject **)(v44 + 8);
          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3221225472;
          v79[2] = sub_1B4FBD43C;
          v79[3] = &unk_1E60BB9F0;
          v79[4] = v44;
          id v80 = *(id *)(a1 + 40);
          dispatch_async(v45, v79);
          objc_msgSend___updateCurrentKnownBSSWithIPConfigurationForInterfaceName_(*(void **)(a1 + 32), v46, *(void *)(a1 + 40), v47, v48);

          uint64_t v30 = 20;
        }
        else if (objc_msgSend_containsString_(v14, v21, v77, v22, v23))
        {
          uint64_t v30 = 21;
        }
        else if (objc_msgSend_containsString_(v14, v27, v76, v28, v29))
        {
          __uint64_t v40 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          __int16 v41 = CWFGetOSLog();
          if (v41)
          {
            __int16 v42 = CWFGetOSLog();
          }
          else
          {
            __int16 v42 = MEMORY[0x1E4F14500];
            id v71 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            int v87 = 134219266;
            unint64_t v88 = v40 / 0x3B9ACA00;
            __int16 v89 = 2048;
            unint64_t v90 = v40 % 0x3B9ACA00 / 0x3E8;
            __int16 v91 = 2082;
            long long v92 = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke_2";
            __int16 v93 = 2082;
            uint64_t v94 = "CWFXPCRequestProxy.m";
            __int16 v95 = 1024;
            int v96 = 2575;
            __int16 v97 = 2112;
            id v98 = v4;
            LODWORD(v74) = 58;
            uint64_t v73 = &v87;
            _os_log_send_and_compose_impl();
          }

          uint64_t v30 = 22;
        }
        else
        {
          if (!objc_msgSend_containsString_(v14, v37, v75, v38, v39)) {
            goto LABEL_28;
          }
          uint64_t v30 = 18;
        }
        uint64_t v49 = objc_alloc_init(CWFXPCEvent);
        objc_msgSend_setType_(v49, v50, v30, v51, v52);
        objc_msgSend_setInterfaceName_(v49, v53, *(void *)(a1 + 40), v54, v55);
        unint64_t v60 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v56, v57, v58, v59);
        objc_msgSend_setTimestamp_(v49, v61, (uint64_t)v60, v62, v63);

        int v68 = objc_msgSend_delegate(*(void **)(a1 + 32), v64, v65, v66, v67);
        uint64_t v70 = v68;
        if (v68) {
          objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v68, v69, *(void *)(a1 + 32), (uint64_t)v49, 0);
        }

LABEL_28:
        ++v13;
      }
      while (v10 != v13);
      uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v83, (uint64_t)v99, 16);
      uint64_t v10 = v72;
    }
    while (v72);
  }
}

void sub_1B4FBD3F0(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateJoinStatusWithIPv4_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  objc_msgSend___privateMACEvaluationCheckConnectivity(*(void **)(a1 + 32), v6, v7, v8, v9);
}

void sub_1B4FBD43C(uint64_t a1)
{
  __uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateJoinStatusWithIPv6_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  objc_msgSend___privateMACEvaluationCheckConnectivity(*(void **)(a1 + 32), v6, v7, v8, v9);
}

void sub_1B4FBD488(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v49, (uint64_t)v65, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (objc_msgSend_containsString_(v13, v7, @"IPv4", v8, v9, v47, v48))
        {
          __uint64_t v17 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          __uint64_t v18 = CWFGetOSLog();
          if (v18)
          {
            uint64_t v19 = CWFGetOSLog();
          }
          else
          {
            uint64_t v19 = MEMORY[0x1E4F14500];
            id v22 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v53 = 134219266;
            unint64_t v54 = v17 / 0x3B9ACA00;
            __int16 v55 = 2048;
            unint64_t v56 = v17 % 0x3B9ACA00 / 0x3E8;
            __int16 v57 = 2082;
            uint64_t v58 = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
            __int16 v59 = 2082;
            unint64_t v60 = "CWFXPCRequestProxy.m";
            __int16 v61 = 1024;
            int v62 = 2611;
            __int16 v63 = 2112;
            id v64 = v4;
            LODWORD(v4_Block_object_dispose(&STACK[0x2C0], 8) = 58;
            uint64_t v47 = &v53;
            _os_log_send_and_compose_impl();
          }
          uint64_t v23 = 19;
        }
        else
        {
          if (!objc_msgSend_containsString_(v13, v14, @"IPv6", v15, v16)) {
            continue;
          }
          __uint64_t v20 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v21 = CWFGetOSLog();
          if (v21)
          {
            uint64_t v19 = CWFGetOSLog();
          }
          else
          {
            uint64_t v19 = MEMORY[0x1E4F14500];
            id v24 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v53 = 134219266;
            unint64_t v54 = v20 / 0x3B9ACA00;
            __int16 v55 = 2048;
            unint64_t v56 = v20 % 0x3B9ACA00 / 0x3E8;
            __int16 v57 = 2082;
            uint64_t v58 = "-[CWFXPCRequestProxy __setupEventHandlersWithInterfaceName:]_block_invoke";
            __int16 v59 = 2082;
            unint64_t v60 = "CWFXPCRequestProxy.m";
            __int16 v61 = 1024;
            int v62 = 2616;
            __int16 v63 = 2112;
            id v64 = v4;
            LODWORD(v4_Block_object_dispose(&STACK[0x2C0], 8) = 58;
            uint64_t v47 = &v53;
            _os_log_send_and_compose_impl();
          }
          uint64_t v23 = 20;
        }

        long long v25 = objc_alloc_init(CWFXPCEvent);
        objc_msgSend_setType_(v25, v26, v23, v27, v28);
        objc_msgSend_setInterfaceName_(v25, v29, *(void *)(a1 + 32), v30, v31);
        uint64_t v36 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v32, v33, v34, v35);
        objc_msgSend_setTimestamp_(v25, v37, (uint64_t)v36, v38, v39);

        uint64_t v44 = objc_msgSend_delegate(*(void **)(a1 + 40), v40, v41, v42, v43);
        uint64_t v46 = v44;
        if (v44) {
          objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v44, v45, *(void *)(a1 + 40), (uint64_t)v25, 0);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v49, (uint64_t)v65, 16);
    }
    while (v10);
  }
}

void sub_1B4FBD840(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_1B4FBD958;
  uint64_t v29 = &unk_1E60BB9F0;
  uint64_t v30 = v2;
  id v31 = *(id *)(a1 + 40);
  dispatch_async(v3, &v26);
  id v4 = objc_alloc_init(CWFXPCEvent);
  objc_msgSend_setType_(v4, v5, 23, v6, v7, v26, v27, v28, v29, v30);
  objc_msgSend_setInterfaceName_(v4, v8, *(void *)(a1 + 40), v9, v10);
  uint64_t v15 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v11, v12, v13, v14);
  objc_msgSend_setTimestamp_(v4, v16, (uint64_t)v15, v17, v18);

  uint64_t v23 = objc_msgSend_delegate(*(void **)(a1 + 32), v19, v20, v21, v22);
  long long v25 = v23;
  if (v23) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v23, v24, *(void *)(a1 + 32), (uint64_t)v4, 0);
  }
}

void sub_1B4FBD958(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___updateJoinStatusWithEAP8021X_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4FBDA10(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = objc_msgSend_allValues(*(void **)(*(void *)(a1 + 32) + 56), v3, v4, v5, v6);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v9)
  {
    uint64_t v14 = v9;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v7);
        }
        uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend_refreshServiceID(v17, v10, v11, v12, v13))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(NSObject **)(v18 + 16);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = sub_1B4FBDB90;
          v20[3] = &unk_1E60BB9F0;
          v20[4] = v17;
          v20[5] = v18;
          dispatch_async(v19, v20);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v14);
  }
}

void sub_1B4FBDB90(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = objc_alloc_init(CWFXPCEvent);
  objc_msgSend_setType_(v3, v4, 18, v5, v6);
  uint64_t v11 = objc_msgSend_interfaceName(*(void **)(a1 + 32), v7, v8, v9, v10);
  objc_msgSend_setInterfaceName_(v3, v12, (uint64_t)v11, v13, v14);

  uint64_t v19 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v15, v16, v17, v18);
  objc_msgSend_setTimestamp_(v3, v20, (uint64_t)v19, v21, v22);

  uint64_t v27 = objc_msgSend_delegate(*(void **)(a1 + 40), v23, v24, v25, v26);
  uint64_t v29 = v27;
  if (v27) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v27, v28, *(void *)(a1 + 40), (uint64_t)v3, 0);
  }
}

void sub_1B4FBDF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 240), 8);
  _Block_object_dispose((const void *)(v59 - 208), 8);
  _Block_object_dispose((const void *)(v59 - 176), 8);
  _Block_object_dispose((const void *)(v59 - 144), 8);
  _Block_object_dispose((const void *)(v59 - 112), 8);
  _Block_object_dispose((const void *)(v59 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FBE000(uint64_t a1)
{
  uint64_t v200 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24)
                                                              - *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24);
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v141 = objc_msgSend_networkInterfaceNames(*(void **)(*(void *)(a1 + 32) + 80), v2, v3, v4, v5);
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                          + 24)
                                                              - *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                          + 24);
  uint64_t v9 = objc_msgSend_apple80211WithInterfaceName_(*(void **)(a1 + 32), v6, 0, v7, v8);
  uint64_t v13 = objc_msgSend_interfaceNames_(v9, v10, 0, v11, v12);

  uint64_t v17 = objc_msgSend_apple80211WithInterfaceName_(*(void **)(a1 + 32), v14, 0, v15, v16);
  uint64_t v142 = objc_msgSend_virtualInterfaceNames_(v17, v18, 0, v19, v20);

  uint64_t v25 = objc_msgSend_wifiInterfaceNames(*(void **)(a1 + 32), v21, v22, v23, v24);
  uint64_t v138 = objc_msgSend_mutableCopy(v25, v26, v27, v28, v29);

  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id obj = v13;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v179, (uint64_t)v199, 16);
  if (v31)
  {
    uint64_t v35 = v31;
    uint64_t v36 = *(void *)v180;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v180 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void *)(*((void *)&v179 + 1) + 8 * i);
        objc_msgSend_apple80211WithInterfaceName_(*(void **)(a1 + 32), v32, v38, v33, v34, v134, v136);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        if (!v39)
        {
          __uint64_t v40 = [CWFApple80211 alloc];
          uint64_t v44 = objc_msgSend_initWithInterfaceName_(v40, v41, v38, v42, v43);
          __uint64_t v45 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v46 = CWFGetOSLog();
          if (v46)
          {
            uint64_t v47 = CWFGetOSLog();
          }
          else
          {
            uint64_t v47 = MEMORY[0x1E4F14500];
            id v48 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v47, (os_log_type_t)(16 * (v44 == 0))))
          {
            int v185 = 134219522;
            unint64_t v186 = v45 / 0x3B9ACA00;
            __int16 v187 = 2048;
            unint64_t v188 = v45 % 0x3B9ACA00 / 0x3E8;
            __int16 v189 = 2082;
            uint64_t v190 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke";
            __int16 v191 = 2082;
            int v192 = "CWFXPCRequestProxy.m";
            __int16 v193 = 1024;
            int v194 = 2727;
            __int16 v195 = 2080;
            long long v49 = "Successfully created";
            if (!v44) {
              long long v49 = "Failed to create";
            }
            uint64_t v196 = v49;
            __int16 v197 = 2112;
            uint64_t v198 = v38;
            LODWORD(v136) = 68;
            uint64_t v134 = &v185;
            _os_log_send_and_compose_impl();
          }

          uint64_t v50 = *(void *)(a1 + 32);
          long long v51 = *(NSObject **)(v50 + 8);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1B4FBEE24;
          block[3] = &unk_1E60BB950;
          void block[4] = v50;
          void block[5] = v38;
          id v39 = v44;
          id v178 = v39;
          dispatch_sync(v51, block);
        }
      }
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v179, (uint64_t)v199, 16);
    }
    while (v35);
  }

  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id v145 = v142;
  uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v145, v52, (uint64_t)&v173, (uint64_t)v184, 16);
  if (v53)
  {
    uint64_t v57 = v53;
    uint64_t v58 = *(void *)v174;
    do
    {
      for (uint64_t j = 0; j != v57; ++j)
      {
        if (*(void *)v174 != v58) {
          objc_enumerationMutation(v145);
        }
        uint64_t v60 = *(void *)(*((void *)&v173 + 1) + 8 * j);
        objc_msgSend_apple80211WithInterfaceName_(*(void **)(a1 + 32), v54, v60, v55, v56, v134, v136);
        id v61 = (id)objc_claimAutoreleasedReturnValue();
        if (!v61)
        {
          int v62 = [CWFApple80211 alloc];
          uint64_t v66 = objc_msgSend_initWithInterfaceName_(v62, v63, v60, v64, v65);
          __uint64_t v67 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          int v68 = CWFGetOSLog();
          if (v68)
          {
            __int16 v69 = CWFGetOSLog();
          }
          else
          {
            __int16 v69 = MEMORY[0x1E4F14500];
            id v70 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v69, (os_log_type_t)(16 * (v66 == 0))))
          {
            int v185 = 134219522;
            unint64_t v186 = v67 / 0x3B9ACA00;
            __int16 v187 = 2048;
            unint64_t v188 = v67 % 0x3B9ACA00 / 0x3E8;
            __int16 v189 = 2082;
            uint64_t v190 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke_2";
            __int16 v191 = 2082;
            int v192 = "CWFXPCRequestProxy.m";
            __int16 v193 = 1024;
            int v194 = 2741;
            __int16 v195 = 2080;
            id v71 = "Successfully created";
            if (!v66) {
              id v71 = "Failed to create";
            }
            uint64_t v196 = v71;
            __int16 v197 = 2112;
            uint64_t v198 = v60;
            LODWORD(v136) = 68;
            uint64_t v134 = &v185;
            _os_log_send_and_compose_impl();
          }

          uint64_t v72 = *(void *)(a1 + 32);
          uint64_t v73 = *(NSObject **)(v72 + 8);
          v171[0] = MEMORY[0x1E4F143A8];
          v171[1] = 3221225472;
          v171[2] = sub_1B4FBEE70;
          v171[3] = &unk_1E60BB950;
          v171[4] = v72;
          v171[5] = v60;
          id v61 = v66;
          id v172 = v61;
          dispatch_sync(v73, v171);
        }
      }
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v145, v54, (uint64_t)&v173, (uint64_t)v184, 16);
    }
    while (v57);
  }

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v140 = v141;
  uint64_t v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v74, (uint64_t)&v167, (uint64_t)v183, 16);
  if (v144)
  {
    uint64_t v143 = *(void *)v168;
    do
    {
      for (uint64_t k = 0; k != v144; ++k)
      {
        if (*(void *)v168 != v143) {
          objc_enumerationMutation(v140);
        }
        uint64_t v79 = *(void *)(*((void *)&v167 + 1) + 8 * k);
        if ((objc_msgSend_containsObject_(obj, v75, v79, v76, v77, v134, v136) & 1) != 0
          || objc_msgSend_containsObject_(v145, v75, v79, v76, v77))
        {
          objc_msgSend_SCNetworkServiceWithInterfaceName_(*(void **)(a1 + 32), v75, v79, v76, v77);
          id v83 = (id)objc_claimAutoreleasedReturnValue();
          if (!v83)
          {
            long long v84 = [CWFSCNetworkService alloc];
            unint64_t v88 = objc_msgSend_initWithInterfaceName_(v84, v85, v79, v86, v87);
            __uint64_t v89 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
            unint64_t v90 = CWFGetOSLog();
            if (v90)
            {
              __int16 v91 = CWFGetOSLog();
            }
            else
            {
              __int16 v91 = MEMORY[0x1E4F14500];
              id v92 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v91, (os_log_type_t)(16 * (v88 == 0))))
            {
              int v185 = 134219522;
              unint64_t v186 = v89 / 0x3B9ACA00;
              __int16 v187 = 2048;
              unint64_t v188 = v89 % 0x3B9ACA00 / 0x3E8;
              __int16 v189 = 2082;
              uint64_t v190 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke_2";
              __int16 v191 = 2082;
              int v192 = "CWFXPCRequestProxy.m";
              __int16 v193 = 1024;
              int v194 = 2759;
              __int16 v195 = 2080;
              __int16 v93 = "Successfully created";
              if (!v88) {
                __int16 v93 = "Failed to create";
              }
              uint64_t v196 = v93;
              __int16 v197 = 2112;
              uint64_t v198 = v79;
              LODWORD(v136) = 68;
              uint64_t v134 = &v185;
              _os_log_send_and_compose_impl();
            }

            uint64_t v94 = *(void *)(a1 + 32);
            __int16 v95 = *(NSObject **)(v94 + 8);
            v165[0] = MEMORY[0x1E4F143A8];
            v165[1] = 3221225472;
            v165[2] = sub_1B4FBEEBC;
            v165[3] = &unk_1E60BB950;
            v165[4] = v94;
            v165[5] = v79;
            id v83 = v88;
            id v166 = v83;
            dispatch_sync(v95, v165);
          }
          objc_msgSend_SCNetworkInterfaceWithInterfaceName_(*(void **)(a1 + 32), v80, v79, v81, v82, v134, v136);
          id v99 = (id)objc_claimAutoreleasedReturnValue();
          if (!v99)
          {
            uint64_t v100 = [CWFSCNetworkInterface alloc];
            uint64_t v104 = objc_msgSend_initWithInterfaceName_(v100, v101, v79, v102, v103);
            __uint64_t v105 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
            uint64_t v106 = CWFGetOSLog();
            if (v106)
            {
              uint64_t v107 = CWFGetOSLog();
            }
            else
            {
              uint64_t v107 = MEMORY[0x1E4F14500];
              id v108 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v107, (os_log_type_t)(16 * (v104 == 0))))
            {
              int v185 = 134219522;
              unint64_t v186 = v105 / 0x3B9ACA00;
              __int16 v187 = 2048;
              unint64_t v188 = v105 % 0x3B9ACA00 / 0x3E8;
              __int16 v189 = 2082;
              uint64_t v190 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke_2";
              __int16 v191 = 2082;
              int v192 = "CWFXPCRequestProxy.m";
              __int16 v193 = 1024;
              int v194 = 2769;
              __int16 v195 = 2080;
              BOOL v109 = "Successfully created";
              if (!v104) {
                BOOL v109 = "Failed to create";
              }
              uint64_t v196 = v109;
              __int16 v197 = 2114;
              uint64_t v198 = v79;
              LODWORD(v137) = 68;
              uint64_t v135 = &v185;
              _os_log_send_and_compose_impl();
            }

            uint64_t v110 = *(void *)(a1 + 32);
            uint64_t v111 = *(NSObject **)(v110 + 8);
            v163[0] = MEMORY[0x1E4F143A8];
            v163[1] = 3221225472;
            v163[2] = sub_1B4FBEF08;
            v163[3] = &unk_1E60BB950;
            v163[4] = v110;
            v163[5] = v79;
            id v99 = v104;
            id v164 = v99;
            dispatch_sync(v111, v163);
          }
          objc_msgSend_EAP8021XWithInterfaceName_(*(void **)(a1 + 32), v96, v79, v97, v98, v135, v137);
          id v112 = (id)objc_claimAutoreleasedReturnValue();
          if (!v112)
          {
            uint64_t v113 = [CWFEAP8021X alloc];
            int v117 = objc_msgSend_initWithInterfaceName_(v113, v114, v79, v115, v116);
            __uint64_t v118 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
            id v119 = CWFGetOSLog();
            if (v119)
            {
              uint64_t v120 = CWFGetOSLog();
            }
            else
            {
              uint64_t v120 = MEMORY[0x1E4F14500];
              id v121 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v120, (os_log_type_t)(16 * (v117 == 0))))
            {
              int v185 = 134219522;
              unint64_t v186 = v118 / 0x3B9ACA00;
              __int16 v187 = 2048;
              unint64_t v188 = v118 % 0x3B9ACA00 / 0x3E8;
              __int16 v189 = 2082;
              uint64_t v190 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke_2";
              __int16 v191 = 2082;
              int v192 = "CWFXPCRequestProxy.m";
              __int16 v193 = 1024;
              int v194 = 2779;
              __int16 v195 = 2080;
              int v122 = "Successfully created";
              if (!v117) {
                int v122 = "Failed to create";
              }
              uint64_t v196 = v122;
              __int16 v197 = 2114;
              uint64_t v198 = v79;
              LODWORD(v136) = 68;
              uint64_t v134 = &v185;
              _os_log_send_and_compose_impl();
            }

            uint64_t v123 = *(void *)(a1 + 32);
            uint64_t v124 = *(NSObject **)(v123 + 8);
            v161[0] = MEMORY[0x1E4F143A8];
            v161[1] = 3221225472;
            v161[2] = sub_1B4FBEF54;
            v161[3] = &unk_1E60BB950;
            v161[4] = v123;
            v161[5] = v79;
            id v112 = v117;
            id v162 = v112;
            dispatch_sync(v124, v161);
          }
        }
      }
      uint64_t v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v75, (uint64_t)&v167, (uint64_t)v183, 16);
    }
    while (v144);
  }

  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v125 = *(void *)(a1 + 32);
  uint64_t v126 = *(NSObject **)(v125 + 8);
  v147[0] = MEMORY[0x1E4F143A8];
  v147[1] = 3221225472;
  v147[2] = sub_1B4FBEFA0;
  v147[3] = &unk_1E60BC890;
  int8x16_t v155 = vextq_s8(*(int8x16_t *)(a1 + 104), *(int8x16_t *)(a1 + 104), 8uLL);
  long long v156 = *(_OWORD *)(a1 + 120);
  id v148 = v140;
  id v149 = obj;
  id v150 = v145;
  uint64_t v151 = v125;
  id v152 = v138;
  long long v157 = *(_OWORD *)(a1 + 136);
  long long v158 = *(_OWORD *)(a1 + 152);
  id v127 = *(id *)(a1 + 40);
  uint64_t v128 = *(void *)(a1 + 72);
  id v153 = v127;
  uint64_t v129 = *(void *)(a1 + 96);
  uint64_t v159 = v128;
  uint64_t v160 = v129;
  id v154 = *(id *)(a1 + 48);
  id v130 = v138;
  id v131 = v145;
  id v132 = obj;
  id v133 = v140;
  dispatch_async(v126, v147);
}

void sub_1B4FBEE24(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 40), v3, a1[6], a1[5], v4);
}

void sub_1B4FBEE70(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 40), v3, a1[6], a1[5], v4);
}

void sub_1B4FBEEBC(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 56), v3, a1[6], a1[5], v4);
}

void sub_1B4FBEF08(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 64), v3, a1[6], a1[5], v4);
}

void sub_1B4FBEF54(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 72), v3, a1[6], a1[5], v4);
}

void sub_1B4FBEFA0(uint64_t a1)
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                           + 24)
                                                               - *(void *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                           + 24);
  *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v2, (uint64_t)&v132, (uint64_t)v179, 16);
  if (v3)
  {
    uint64_t v7 = v3;
    id v123 = *(id *)v133;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(id *)v133 != v123) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v132 + 1) + 8 * v8);
        if ((objc_msgSend_containsObject_(*(void **)(a1 + 40), v4, v9, v5, v6, v111, v112) & 1) != 0
          || (objc_msgSend_containsObject_(*(void **)(a1 + 48), v10, v9, v11, v12) & 1) != 0)
        {
          objc_msgSend_removeObject_(*(void **)(a1 + 64), v10, v9, v11, v12);
          if (objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 56) + 48), v13, v9, v14, v15)) {
            goto LABEL_23;
          }
          objc_msgSend_addObject_(*(void **)(*(void *)(a1 + 56) + 48), v4, v9, v5, v6);
          objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 56) + 32), v16, v9, v17, v18);
          __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v20 = CWFGetOSLog();
          if (v20)
          {
            uint64_t v21 = CWFGetOSLog();
          }
          else
          {
            uint64_t v21 = MEMORY[0x1E4F14500];
            id v22 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v136 = 134219266;
            unint64_t v137 = v19 / 0x3B9ACA00;
            __int16 v138 = 2048;
            unint64_t v139 = v19 % 0x3B9ACA00 / 0x3E8;
            __int16 v140 = 2082;
            uint64_t v141 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke";
            __int16 v142 = 2082;
            uint64_t v143 = "CWFXPCRequestProxy.m";
            __int16 v144 = 1024;
            int v145 = 2814;
            __int16 v146 = 2114;
            uint64_t v147 = v9;
            LODWORD(v112) = 58;
            uint64_t v111 = &v136;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend___setupEventHandlersWithInterfaceName_(*(void **)(a1 + 56), v23, v9, v24, v25);
          uint64_t v26 = *(id *)(*(void *)(a1 + 56) + 112);
          uint64_t v30 = objc_msgSend___interfaceSpecificEventIDs_(*(void **)(a1 + 56), v27, *(void *)(*(void *)(a1 + 56) + 112), v28, v29);
          uint64_t v35 = objc_msgSend_mutableCopy(v30, v31, v32, v33, v34);

          objc_msgSend_minusSet_(v35, v36, (uint64_t)v26, v37, v38);
          objc_storeStrong((id *)(*(void *)(a1 + 56) + 112), v35);
          uint64_t v42 = *(void *)(a1 + 56);
          if (*(unsigned char *)(v42 + 120))
          {
            objc_msgSend___startMonitoringDefaultEventIDsForInterfaceName_((void *)v42, v39, v9, v40, v41);
            objc_msgSend___updateMonitoring_eventIDs_(*(void **)(a1 + 56), v43, 1, (uint64_t)v35, v44);
            uint64_t v42 = *(void *)(a1 + 56);
          }
          __uint64_t v45 = *(NSObject **)(v42 + 16);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1B4FBFBD0;
          block[3] = &unk_1E60BB9F0;
          void block[4] = v9;
          void block[5] = v42;
          dispatch_async(v45, block);
          __uint64_t v46 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v47 = CWFGetOSLog();
          if (v47)
          {
            id v48 = CWFGetOSLog();
          }
          else
          {
            id v48 = MEMORY[0x1E4F14500];
            id v49 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            int v136 = 134219266;
            unint64_t v137 = v46 / 0x3B9ACA00;
            __int16 v138 = 2048;
            unint64_t v139 = v46 % 0x3B9ACA00 / 0x3E8;
            __int16 v140 = 2082;
            uint64_t v141 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke_2";
            __int16 v142 = 2082;
            uint64_t v143 = "CWFXPCRequestProxy.m";
            __int16 v144 = 1024;
            int v145 = 2845;
            __int16 v146 = 2114;
            uint64_t v147 = v9;
            LODWORD(v112) = 58;
            uint64_t v111 = &v136;
            _os_log_send_and_compose_impl();
          }

          goto LABEL_22;
        }
        if ((objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 56) + 32), v10, v9, v11, v12) & 1) == 0)
        {
          objc_msgSend_addObject_(*(void **)(*(void *)(a1 + 56) + 32), v4, v9, v5, v6);
          __uint64_t v50 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          long long v51 = CWFGetOSLog();
          if (v51)
          {
            uint64_t v26 = CWFGetOSLog();
          }
          else
          {
            uint64_t v26 = MEMORY[0x1E4F14500];
            id v52 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v57 = v50 / 0x3B9ACA00;
            unint64_t v58 = v50 % 0x3B9ACA00 / 0x3E8;
            uint64_t v59 = objc_msgSend_allObjects(*(void **)(*(void *)(a1 + 56) + 32), v53, v54, v55, v56);
            __int16 v63 = objc_msgSend_componentsJoinedByString_(v59, v60, @",", v61, v62);
            int v136 = 134219522;
            unint64_t v137 = v57;
            __int16 v138 = 2048;
            unint64_t v139 = v58;
            __int16 v140 = 2082;
            uint64_t v141 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke_2";
            __int16 v142 = 2082;
            uint64_t v143 = "CWFXPCRequestProxy.m";
            __int16 v144 = 1024;
            int v145 = 2801;
            __int16 v146 = 2112;
            uint64_t v147 = v9;
            __int16 v148 = 2112;
            unint64_t v149 = (unint64_t)v63;
            LODWORD(v112) = 68;
            uint64_t v111 = &v136;
            _os_log_send_and_compose_impl();
          }
LABEL_22:
        }
LABEL_23:
        ++v8;
      }
      while (v7 != v8);
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v132, (uint64_t)v179, 16);
      uint64_t v7 = v64;
    }
    while (v64);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v124 = *(id *)(a1 + 64);
  uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v65, (uint64_t)&v127, (uint64_t)v178, 16);
  if (v66)
  {
    uint64_t v70 = v66;
    uint64_t v71 = *(void *)v128;
    do
    {
      uint64_t v72 = 0;
      do
      {
        if (*(void *)v128 != v71) {
          objc_enumerationMutation(v124);
        }
        uint64_t v73 = *(void *)(*((void *)&v127 + 1) + 8 * v72);
        char v74 = objc_msgSend_containsObject_(*(void **)(*(void *)(a1 + 56) + 48), v67, v73, v68, v69, v111, v112);
        __uint64_t v75 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        uint64_t v76 = CWFGetOSLog();
        uint64_t v77 = (void *)v76;
        if (v74)
        {
          if (v76)
          {
            uint64_t v78 = CWFGetOSLog();
          }
          else
          {
            uint64_t v78 = MEMORY[0x1E4F14500];
            id v79 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            int v136 = 134219266;
            unint64_t v137 = v75 / 0x3B9ACA00;
            __int16 v138 = 2048;
            unint64_t v139 = v75 % 0x3B9ACA00 / 0x3E8;
            __int16 v140 = 2082;
            uint64_t v141 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke";
            __int16 v142 = 2082;
            uint64_t v143 = "CWFXPCRequestProxy.m";
            __int16 v144 = 1024;
            int v145 = 2857;
            __int16 v146 = 2114;
            uint64_t v147 = v73;
            LODWORD(v112) = 58;
            uint64_t v111 = &v136;
            _os_log_send_and_compose_impl();
          }

          uint64_t v80 = *(void *)(a1 + 56);
          uint64_t v81 = *(NSObject **)(v80 + 16);
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = sub_1B4FBFC8C;
          v126[3] = &unk_1E60BB9F0;
          v126[4] = v73;
          v126[5] = v80;
          dispatch_async(v81, v126);
          objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 56) + 48), v82, v73, v83, v84);
        }
        else
        {
          if (v76)
          {
            long long v85 = CWFGetOSLog();
          }
          else
          {
            long long v85 = MEMORY[0x1E4F14500];
            id v86 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            int v136 = 134219266;
            unint64_t v137 = v75 / 0x3B9ACA00;
            __int16 v138 = 2048;
            unint64_t v139 = (274877907 * (v75 % 0x3B9ACA00)) >> 38;
            __int16 v140 = 2082;
            uint64_t v141 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke";
            __int16 v142 = 2082;
            uint64_t v143 = "CWFXPCRequestProxy.m";
            __int16 v144 = 1024;
            int v145 = 2855;
            __int16 v146 = 2114;
            uint64_t v147 = v73;
            LODWORD(v112) = 58;
            uint64_t v111 = &v136;
            _os_log_send_and_compose_impl();
          }
        }
        ++v72;
      }
      while (v70 != v72);
      uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v67, (uint64_t)&v127, (uint64_t)v178, 16);
      uint64_t v70 = v87;
    }
    while (v87);
  }

  *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 120) + 8)
                                                                           + 24)
                                                               - *(void *)(*(void *)(*(void *)(a1 + 128) + 8)
                                                                           + 24);
  *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 112) + 8)
                                                                           + 24)
                                                               - *(void *)(*(void *)(*(void *)(a1 + 128) + 8)
                                                                           + 24);
  __uint64_t v88 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v89 = CWFGetOSLog();
  if (v89)
  {
    unint64_t v90 = CWFGetOSLog();
  }
  else
  {
    unint64_t v90 = MEMORY[0x1E4F14500];
    id v91 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v96 = v88 / 0x3B9ACA00;
    unint64_t v121 = v88 % 0x3B9ACA00 / 0x3E8;
    id v125 = *(id *)(a1 + 72);
    unint64_t v97 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24);
    unint64_t v98 = v97 / 0x3B9ACA00;
    unint64_t v122 = v97 % 0x3B9ACA00 / 0x3E8;
    unint64_t v99 = *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24);
    unint64_t v100 = v99 / 0x3B9ACA00;
    unint64_t obja = v99 % 0x3B9ACA00 / 0x3E8;
    unint64_t v101 = *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 24);
    unint64_t v102 = v101 / 0x3B9ACA00;
    unint64_t v114 = v101 % 0x3B9ACA00 / 0x3E8;
    unint64_t v103 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    unint64_t v104 = v103 / 0x3B9ACA00;
    unint64_t v115 = v103 % 0x3B9ACA00 / 0x3E8;
    unint64_t v105 = *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
    unint64_t v106 = v105 / 0x3B9ACA00;
    unint64_t v113 = v105 % 0x3B9ACA00 / 0x3E8;
    uint64_t v116 = *(void *)(a1 + 40);
    uint64_t v117 = *(void *)(a1 + 48);
    uint64_t v107 = objc_msgSend_allKeys(*(void **)(*(void *)(a1 + 56) + 40), v92, v93, v94, v95);
    uint64_t v108 = *(void *)(*(void *)(a1 + 56) + 48);
    uint64_t v109 = *(void *)(a1 + 32);
    int v136 = 134223106;
    unint64_t v137 = v96;
    __int16 v138 = 2048;
    unint64_t v139 = v121;
    __int16 v140 = 2082;
    uint64_t v141 = "-[CWFXPCRequestProxy __updateWiFiNetworkInterfaces:reply:]_block_invoke_2";
    __int16 v142 = 2082;
    uint64_t v143 = "CWFXPCRequestProxy.m";
    __int16 v144 = 1024;
    int v145 = 2880;
    __int16 v146 = 2114;
    uint64_t v147 = (uint64_t)v125;
    __int16 v148 = 2048;
    unint64_t v149 = v98;
    __int16 v150 = 2048;
    unint64_t v151 = v122;
    __int16 v152 = 2048;
    unint64_t v153 = v100;
    __int16 v154 = 2048;
    unint64_t v155 = obja;
    __int16 v156 = 2048;
    unint64_t v157 = v102;
    __int16 v158 = 2048;
    unint64_t v159 = v114;
    __int16 v160 = 2048;
    unint64_t v161 = v104;
    __int16 v162 = 2048;
    unint64_t v163 = v115;
    __int16 v164 = 2048;
    unint64_t v165 = v106;
    __int16 v166 = 2048;
    unint64_t v167 = v113;
    __int16 v168 = 2114;
    uint64_t v169 = v116;
    __int16 v170 = 2114;
    uint64_t v171 = v117;
    __int16 v172 = 2114;
    long long v173 = v107;
    __int16 v174 = 2114;
    uint64_t v175 = v108;
    __int16 v176 = 2114;
    uint64_t v177 = v109;
    _os_log_send_and_compose_impl();
  }
  uint64_t v110 = *(void *)(a1 + 80);
  if (v110) {
    (*(void (**)(void))(v110 + 16))();
  }
}

void sub_1B4FBFBD0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = objc_alloc_init(CWFXPCEvent);
  objc_msgSend_setType_(v3, v4, 10, v5, v6);
  objc_msgSend_setInterfaceName_(v3, v7, *(void *)(a1 + 32), v8, v9);
  uint64_t v14 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v10, v11, v12, v13);
  objc_msgSend_setTimestamp_(v3, v15, (uint64_t)v14, v16, v17);

  id v22 = objc_msgSend_delegate(*(void **)(a1 + 40), v18, v19, v20, v21);
  uint64_t v24 = v22;
  if (v22) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v22, v23, *(void *)(a1 + 40), (uint64_t)v3, 0);
  }
}

void sub_1B4FBFC8C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = objc_alloc_init(CWFXPCEvent);
  objc_msgSend_setType_(v3, v4, 11, v5, v6);
  objc_msgSend_setInterfaceName_(v3, v7, *(void *)(a1 + 32), v8, v9);
  uint64_t v14 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v10, v11, v12, v13);
  objc_msgSend_setTimestamp_(v3, v15, (uint64_t)v14, v16, v17);

  id v22 = objc_msgSend_delegate(*(void **)(a1 + 40), v18, v19, v20, v21);
  uint64_t v24 = v22;
  if (v22) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v22, v23, *(void *)(a1 + 40), (uint64_t)v3, 0);
  }
}

void sub_1B4FC008C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 168));
  _Unwind_Resume(a1);
}

void sub_1B4FC00EC(uint64_t a1, uint64_t a2, void *a3, unint64_t a4)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (a4 > 0xD) {
    goto LABEL_14;
  }
  if (((1 << a4) & 0x3002) != 0)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v14 = CWFGetOSLog();
    if (v14)
    {
      uint64_t v13 = CWFGetOSLog();
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_27;
    }
LABEL_26:
    uint64_t v30 = objc_msgSend_descriptionForKernelEventCode_(CWFKernelEventMonitor, v18, a4, v19, v20);
    _os_log_send_and_compose_impl();

    goto LABEL_27;
  }
  if (((1 << a4) & 0xC00) != 0)
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v12 = CWFGetOSLog();
    if (v12)
    {
      uint64_t v13 = CWFGetOSLog();
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (a4 != 9)
  {
LABEL_14:
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v21 = CWFGetOSLog();
    if (v21)
    {
      uint64_t v13 = CWFGetOSLog();
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v29 = MEMORY[0x1E4F14500];
    }

    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  uint64_t v13 = objc_msgSend_apple80211WithInterfaceName_(WeakRetained, v8, (uint64_t)v6, v9, v10);
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v15 = CWFGetOSLog();
  if (v15)
  {
    uint64_t v16 = CWFGetOSLog();
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = objc_msgSend_descriptionForKernelEventCode_(CWFKernelEventMonitor, v24, 9, v25, v26);
    _os_log_send_and_compose_impl();
  }
  if (v13)
  {
    objc_msgSend___updateWiFiNetworkInterfaces_reply_(v11, v27, @"CWFKernelEventMonitor", 0, v28);
LABEL_27:
  }
}

void sub_1B4FC0728(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    if (objc_msgSend_isEqualToString_(v7, v8, @"IOServiceMatched", v9, v10))
    {
      uint64_t v15 = objc_msgSend_apple80211WithInterfaceName_(WeakRetained, v12, (uint64_t)v6, v13, v14);
      __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      id v17 = CWFGetOSLog();
      if (v17)
      {
        uint64_t v18 = CWFGetOSLog();
      }
      else
      {
        uint64_t v18 = MEMORY[0x1E4F14500];
        id v21 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 134219778;
        unint64_t v26 = v16 / 0x3B9ACA00;
        __int16 v27 = 2048;
        unint64_t v28 = v16 % 0x3B9ACA00 / 0x3E8;
        __int16 v29 = 2082;
        uint64_t v30 = "-[CWFXPCRequestProxy __setupEventHandlers]_block_invoke";
        __int16 v31 = 2082;
        uint64_t v32 = "CWFXPCRequestProxy.m";
        __int16 v33 = 1024;
        int v34 = 2962;
        __int16 v35 = 2114;
        id v36 = v6;
        __int16 v37 = 2114;
        id v38 = v7;
        __int16 v39 = 2048;
        uint64_t v40 = v15;
        int v24 = 78;
        id v23 = &v25;
        _os_log_send_and_compose_impl();
      }

LABEL_12:
      goto LABEL_13;
    }
    if (objc_msgSend_isEqualToString_(v7, v12, @"IOServiceTerminate", v13, v14))
    {
      __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      uint64_t v20 = CWFGetOSLog();
      if (v20)
      {
        uint64_t v15 = CWFGetOSLog();
      }
      else
      {
        uint64_t v15 = MEMORY[0x1E4F14500];
        id v22 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 134219522;
        unint64_t v26 = v19 / 0x3B9ACA00;
        __int16 v27 = 2048;
        unint64_t v28 = v19 % 0x3B9ACA00 / 0x3E8;
        __int16 v29 = 2082;
        uint64_t v30 = "-[CWFXPCRequestProxy __setupEventHandlers]_block_invoke";
        __int16 v31 = 2082;
        uint64_t v32 = "CWFXPCRequestProxy.m";
        __int16 v33 = 1024;
        int v34 = 2967;
        __int16 v35 = 2114;
        id v36 = v6;
        __int16 v37 = 2114;
        id v38 = v7;
        int v24 = 68;
        id v23 = &v25;
        _os_log_send_and_compose_impl();
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  objc_msgSend___updateWiFiNetworkInterfaces_reply_(WeakRetained, v8, @"CWFIO80211", 0, v10, v23, v24);
}

void sub_1B4FC0A70(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v92, (uint64_t)v108, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v93;
    uint64_t v14 = *MEMORY[0x1E4F41B10];
    uint64_t v89 = *MEMORY[0x1E4F41B18];
    uint64_t v87 = *MEMORY[0x1E4F41B00];
    uint64_t v88 = *MEMORY[0x1E4F41B08];
    uint64_t v85 = *MEMORY[0x1E4F41AC0];
    uint64_t v86 = *MEMORY[0x1E4F41B20];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v93 != v13) {
          objc_enumerationMutation(v6);
        }
        __uint64_t v16 = *(void **)(*((void *)&v92 + 1) + 8 * v15);
        if (objc_msgSend_containsString_(v16, v9, v14, v10, v11, v83, v84))
        {
          __uint64_t v20 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          id v21 = CWFGetOSLog();
          if (v21)
          {
            id v22 = CWFGetOSLog();
          }
          else
          {
            id v22 = MEMORY[0x1E4F14500];
            id v33 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v96 = 134219266;
            unint64_t v97 = v20 / 0x3B9ACA00;
            __int16 v98 = 2048;
            unint64_t v99 = v20 % 0x3B9ACA00 / 0x3E8;
            __int16 v100 = 2082;
            unint64_t v101 = "-[CWFXPCRequestProxy __setupEventHandlers]_block_invoke";
            __int16 v102 = 2082;
            unint64_t v103 = "CWFXPCRequestProxy.m";
            __int16 v104 = 1024;
            int v105 = 2985;
            __int16 v106 = 2114;
            id v107 = v6;
            LODWORD(v84) = 58;
            uint64_t v83 = &v96;
            _os_log_send_and_compose_impl();
          }

          int v34 = WeakRetained[1];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1B4FC12CC;
          block[3] = &unk_1E60BB768;
          void block[4] = WeakRetained;
          dispatch_async(v34, block);
          uint64_t v32 = 19;
          goto LABEL_25;
        }
        if (objc_msgSend_containsString_(v16, v17, v89, v18, v19))
        {
          __uint64_t v26 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          __int16 v27 = CWFGetOSLog();
          if (v27)
          {
            unint64_t v28 = CWFGetOSLog();
          }
          else
          {
            unint64_t v28 = MEMORY[0x1E4F14500];
            id v41 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            int v96 = 134219266;
            unint64_t v97 = v26 / 0x3B9ACA00;
            __int16 v98 = 2048;
            unint64_t v99 = v26 % 0x3B9ACA00 / 0x3E8;
            __int16 v100 = 2082;
            unint64_t v101 = "-[CWFXPCRequestProxy __setupEventHandlers]_block_invoke_2";
            __int16 v102 = 2082;
            unint64_t v103 = "CWFXPCRequestProxy.m";
            __int16 v104 = 1024;
            int v105 = 2998;
            __int16 v106 = 2114;
            id v107 = v6;
            LODWORD(v84) = 58;
            uint64_t v83 = &v96;
            _os_log_send_and_compose_impl();
          }

          uint64_t v42 = WeakRetained[1];
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = sub_1B4FC13E0;
          v90[3] = &unk_1E60BB768;
          v90[4] = WeakRetained;
          dispatch_async(v42, v90);
          uint64_t v32 = 20;
          goto LABEL_25;
        }
        if (objc_msgSend_containsString_(v16, v23, v88, v24, v25))
        {
          uint64_t v32 = 21;
LABEL_25:
          uint64_t v43 = objc_alloc_init(CWFXPCEvent);
          objc_msgSend_setType_(v43, v44, v32, v45, v46);
          long long v51 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v47, v48, v49, v50);
          objc_msgSend_setTimestamp_(v43, v52, (uint64_t)v51, v53, v54);

          uint64_t v59 = objc_msgSend_delegate(WeakRetained, v55, v56, v57, v58);
          uint64_t v61 = v59;
          if (v59) {
            objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v59, v60, (uint64_t)WeakRetained, (uint64_t)v43, 0);
          }

          goto LABEL_28;
        }
        if (objc_msgSend_containsString_(v16, v29, v87, v30, v31))
        {
          __uint64_t v38 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          __int16 v39 = CWFGetOSLog();
          if (v39)
          {
            uint64_t v40 = CWFGetOSLog();
          }
          else
          {
            uint64_t v40 = MEMORY[0x1E4F14500];
            id v71 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            int v96 = 134219266;
            unint64_t v97 = v38 / 0x3B9ACA00;
            __int16 v98 = 2048;
            unint64_t v99 = v38 % 0x3B9ACA00 / 0x3E8;
            __int16 v100 = 2082;
            unint64_t v101 = "-[CWFXPCRequestProxy __setupEventHandlers]_block_invoke_2";
            __int16 v102 = 2082;
            unint64_t v103 = "CWFXPCRequestProxy.m";
            __int16 v104 = 1024;
            int v105 = 3014;
            __int16 v106 = 2114;
            id v107 = v6;
            LODWORD(v84) = 58;
            uint64_t v83 = &v96;
            _os_log_send_and_compose_impl();
          }

          uint64_t v32 = 22;
          goto LABEL_25;
        }
        if (objc_msgSend_containsString_(v16, v35, v86, v36, v37))
        {
          __uint64_t v65 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v66 = CWFGetOSLog();
          if (v66)
          {
            __uint64_t v67 = CWFGetOSLog();
          }
          else
          {
            __uint64_t v67 = MEMORY[0x1E4F14500];
            id v72 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            int v96 = 134219266;
            unint64_t v97 = v65 / 0x3B9ACA00;
            __int16 v98 = 2048;
            unint64_t v99 = v65 % 0x3B9ACA00 / 0x3E8;
            __int16 v100 = 2082;
            unint64_t v101 = "-[CWFXPCRequestProxy __setupEventHandlers]_block_invoke";
            __int16 v102 = 2082;
            unint64_t v103 = "CWFXPCRequestProxy.m";
            __int16 v104 = 1024;
            int v105 = 3018;
            __int16 v106 = 2114;
            id v107 = v6;
            LODWORD(v84) = 58;
            uint64_t v83 = &v96;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend___updateWiFiNetworkInterfaces_reply_(WeakRetained, v73, @"CWFSCNetworkConfiguration/kSCEntNetInterface", 0, v74);
        }
        else if (objc_msgSend_containsString_(v16, v62, v85, v63, v64))
        {
          __uint64_t v68 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          uint64_t v69 = CWFGetOSLog();
          if (v69)
          {
            uint64_t v70 = CWFGetOSLog();
          }
          else
          {
            uint64_t v70 = MEMORY[0x1E4F14500];
            id v75 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            int v96 = 134219266;
            unint64_t v97 = v68 / 0x3B9ACA00;
            __int16 v98 = 2048;
            unint64_t v99 = v68 % 0x3B9ACA00 / 0x3E8;
            __int16 v100 = 2082;
            unint64_t v101 = "-[CWFXPCRequestProxy __setupEventHandlers]_block_invoke";
            __int16 v102 = 2082;
            unint64_t v103 = "CWFXPCRequestProxy.m";
            __int16 v104 = 1024;
            int v105 = 3023;
            __int16 v106 = 2114;
            id v107 = v6;
            LODWORD(v84) = 58;
            uint64_t v83 = &v96;
            _os_log_send_and_compose_impl();
          }

          objc_msgSend___updateWiFiNetworkInterfaces_reply_(WeakRetained, v76, @"CWFSCNetworkConfiguration/kSCDynamicStoreDomainSetup", 0, v77);
          objc_msgSend___updateWiFiNetworkServices(WeakRetained, v78, v79, v80, v81);
        }
LABEL_28:
        ++v15;
      }
      while (v12 != v15);
      uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v92, (uint64_t)v108, 16);
      uint64_t v12 = v82;
    }
    while (v82);
  }
}

void sub_1B4FC12CC(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend_allKeys(*(void **)(*(void *)(a1 + 32) + 144), v3, v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend___updateJoinStatusWithIPv4_(*(void **)(a1 + 32), v10, *(void *)(*((void *)&v16 + 1) + 8 * v15++), v11, v12);
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v13);
  }
}

void sub_1B4FC13E0(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend_allKeys(*(void **)(*(void *)(a1 + 32) + 144), v3, v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend___updateJoinStatusWithIPv6_(*(void **)(a1 + 32), v10, *(void *)(*((void *)&v16 + 1) + 8 * v15++), v11, v12);
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v13);
  }
}

void sub_1B4FC14F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v1 = objc_alloc_init(CWFXPCEvent);
  objc_msgSend_setType_(v1, v2, 24, v3, v4);
  uint64_t v9 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6, v7, v8);
  objc_msgSend_setTimestamp_(v1, v10, (uint64_t)v9, v11, v12);

  long long v17 = objc_msgSend_delegate(WeakRetained, v13, v14, v15, v16);
  long long v19 = v17;
  if (v17) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v17, v18, (uint64_t)WeakRetained, (uint64_t)v1, 0);
  }
}

void sub_1B4FC17CC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC1A18(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC1C90(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC20C0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC24F0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC273C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC2994(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC2CB4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC30AC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC33C8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC3620(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v9 = v7;
  if (v7) {
    objc_msgSend_XPCRequestProxy_sendXPCEvent_reply_(v7, v8, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  }
}

void sub_1B4FC3724(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_interfaceName(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_info(*(void **)(a1 + 32), v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"ScanResult", v14, v15);
  __uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v12, v17, @"IsAutoJoin", v18, v19);
  char v25 = objc_msgSend_BOOLValue(v20, v21, v22, v23, v24);

  if (v16) {
    BOOL v30 = v7 == 0;
  }
  else {
    BOOL v30 = 1;
  }
  if (!v30)
  {
    uint64_t v31 = objc_msgSend___knownNetworkProfiles(*(void **)(a1 + 40), v26, v27, v28, v29);
    uint64_t v32 = sub_1B4F542B0(v16, v31);

    uint64_t v33 = *(void *)(a1 + 40);
    int v34 = *(NSObject **)(v33 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4FC38A8;
    block[3] = &unk_1E60BC980;
    void block[4] = v33;
    id v37 = v16;
    id v38 = v32;
    char v40 = v25;
    id v39 = v7;
    id v35 = v32;
    dispatch_async(v34, block);
  }
}

void sub_1B4FC38A8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___addJoinStatusWithScanResult_knownNetworkProfile_isAutoJoin_interfaceName_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56));
}

void sub_1B4FC398C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_interfaceName(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_info(*(void **)(a1 + 32), v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"ScanResult", v14, v15);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v12, v17, @"Error", v18, v19);
  if (v16) {
    BOOL v23 = v7 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (!v23)
  {
    objc_msgSend___updateJoinStatusWithError_interaceName_(*(void **)(a1 + 40), v20, (uint64_t)v22, (uint64_t)v7, v21);
    _os_feature_enabled_impl();
  }
}

void sub_1B4FC3B04(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_interfaceName(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v12 = objc_msgSend_info(*(void **)(a1 + 32), v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"AutoJoinTrigger", v14, v15);
  uint64_t v21 = objc_msgSend_integerValue(v16, v17, v18, v19, v20);

  char v25 = objc_msgSend_objectForKeyedSubscript_(v12, v22, @"AutoJoinState", v23, v24);
  uint64_t v30 = objc_msgSend_integerValue(v25, v26, v27, v28, v29);

  int v34 = objc_msgSend_objectForKeyedSubscript_(v12, v31, @"AutoJoinResult", v32, v33);
  id v39 = v34;
  if (v21)
  {
    objc_msgSend___autoJoinStartedWithTrigger_interfaceName_(*(void **)(a1 + 40), v35, v21, (uint64_t)v7, v38);
  }
  else
  {
    char v40 = *(void **)(a1 + 40);
    if (v34)
    {
      uint64_t v41 = objc_msgSend_BOOLValue(v34, v35, v36, v37, v38);
      objc_msgSend___autoJoinEndedWithResult_interfaceName_(v40, v42, v41, (uint64_t)v7, v43);
    }
    else
    {
      objc_msgSend___updateAutoJoinState_interfaceName_(v40, v35, v30, (uint64_t)v7, v38);
    }
  }
}

void sub_1B4FC3F1C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 192);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B4FC3FCC;
  v8[3] = &unk_1E60BB9F0;
  void v8[4] = v3;
  id v9 = *(id *)(a1 + 40);
  objc_msgSend_addOperationWithBlock_(v4, v5, (uint64_t)v8, v6, v7);
}

void sub_1B4FC3FCC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v8 = objc_msgSend_interfaceName(*(void **)(a1 + 40), v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend___currentNetworkProfileWithInterfaceName_(v3, v9, (uint64_t)v8, v10, v11);

  if (v12) {
    objc_msgSend___setCachedKnownNetwork_(*(void **)(a1 + 32), v13, (uint64_t)v12, v14, v15);
  }
}

void sub_1B4FC404C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v10 = objc_msgSend_interfaceName(*(void **)(a1 + 40), v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_networkName(*(void **)(a1 + 32), v11, v12, v13, v14);
  IPConfigurationForgetNetwork();
}

void sub_1B4FC4180(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = CWFGetOSLog();
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  uint64_t v10 = objc_msgSend_SSID(*(void **)(a1 + 32), v6, v7, v8, v9);
  sub_1B4FB9198((uint64_t)v10);
}

void sub_1B4FC4524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FC4558(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v7) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  int v6 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned int *)&v6, 1u);
  if (!v6) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FC47F8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4FC4B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FC4BC0(void *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v8 = a3;
  if (!v13)
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v8, v5, @"Result", v6, v7);
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  int v12 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned int *)&v12, 1u);
  if (!v12) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FC4FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FC4FE4(void *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v8 = a3;
  if (!v13)
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v8, v5, @"Result", v6, v7);
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  int v12 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned int *)&v12, 1u);
  if (!v12) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FC5384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FC53C0(void *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v8 = a3;
  if (!v13)
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v8, v5, @"Result", v6, v7);
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  int v12 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), (unsigned int *)&v12, 1u);
  if (!v12) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_1B4FC5544(void *a1)
{
  id v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  if (v6) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend_containsObject_(*(void **)(a1[5] + 32), v2, v6, v3, v4);
  }
}

void sub_1B4FC5884(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend___apple80211WithInterfaceName_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_1B4FC5BAC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend___EAP8021XWithInterfaceName_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_1B4FC5ED4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend___SCNetworkServiceWithInterfaceName_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_1B4FC61FC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend___SCNetworkInterfaceWithInterfaceName_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_1B4FC64C4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend___interfaceSpecificEventIDs_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  if ((objc_msgSend_isEqualToSet_(v6, v7, *(void *)(*(void *)(a1 + 32) + 112), v8, v9) & 1) == 0)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v14 + 120))
    {
      uint64_t v15 = objc_msgSend_mutableCopy(*(void **)(v14 + 112), v10, v11, v12, v13);
      objc_msgSend_minusSet_(v15, v16, (uint64_t)v6, v17, v18);
      objc_msgSend___updateMonitoring_eventIDs_(*(void **)(a1 + 32), v19, 0, (uint64_t)v15, v20);
      char v25 = objc_msgSend_mutableCopy(v6, v21, v22, v23, v24);
      objc_msgSend_minusSet_(v25, v26, *(void *)(*(void *)(a1 + 32) + 112), v27, v28);
      objc_msgSend___updateMonitoring_eventIDs_(*(void **)(a1 + 32), v29, 1, (uint64_t)v25, v30);

      uint64_t v14 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v14 + 112), v6);
    uint64_t v31 = CWFGetOSLog();
    if (v31)
    {
      uint64_t v32 = CWFGetOSLog();
    }
    else
    {
      uint64_t v32 = MEMORY[0x1E4F14500];
      id v33 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }
  }
}

void sub_1B4FC713C(void **a1, void *a2, void *a3)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"Result", v8, v9);
  uint64_t v11 = CWFGetOSLog();
  if (v11)
  {
    uint64_t v12 = CWFGetOSLog();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v76 = 138543362;
    uint64_t v77 = v10;
    int v72 = 12;
    uint64_t v70 = &v76;
    _os_log_send_and_compose_impl();
  }

  if ((objc_msgSend_includeBeaconCacheResults(a1[4], v14, v15, v16, v17) & 1) != 0
    || objc_msgSend_includeBackgroundScanCacheResults(a1[4], v18, v19, v20, v21))
  {
    if (v10)
    {
      uint64_t v22 = objc_msgSend_mutableCopy(v10, v18, v19, v20, v21);
    }
    else
    {
      uint64_t v22 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21);
    }
    uint64_t v27 = (void (**)(void, void, void))v22;
    if (objc_msgSend_includeBeaconCacheResults(a1[4], v23, v24, v25, v26, v70, v72))
    {
      uint64_t v32 = CWFGetOSLog();
      if (v32)
      {
        id v33 = CWFGetOSLog();
      }
      else
      {
        id v33 = MEMORY[0x1E4F14500];
        id v34 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v35 = a1[5];
        int v76 = 138543362;
        uint64_t v77 = v35;
        LODWORD(v73) = 12;
        id v71 = &v76;
        _os_log_send_and_compose_impl();
      }

      id v39 = objc_msgSend_beaconCache_(a1[6], v36, 0, v37, v38);
      if (objc_msgSend_count(v39, v40, v41, v42, v43)) {
        objc_msgSend_addObjectsFromArray_(v27, v44, (uint64_t)v39, v45, v46);
      }
    }
    if (objc_msgSend_includeBackgroundScanCacheResults(a1[4], v28, v29, v30, v31, v71, v73))
    {
      uint64_t v47 = CWFGetOSLog();
      if (v47)
      {
        uint64_t v48 = CWFGetOSLog();
      }
      else
      {
        uint64_t v48 = MEMORY[0x1E4F14500];
        id v49 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        uint64_t v50 = a1[5];
        int v76 = 138543362;
        uint64_t v77 = v50;
        _os_log_send_and_compose_impl();
      }

      uint64_t v54 = objc_msgSend_backgroundScanCache_(a1[6], v51, 0, v52, v53);
      if (objc_msgSend_count(v54, v55, v56, v57, v58)) {
        objc_msgSend_addObjectsFromArray_(v27, v59, (uint64_t)v54, v60, v61);
      }
    }
    uint64_t v62 = CWFFilteredScanResults(v27, a1[4]);

    objc_msgSend_response(a1[5], v63, v64, v65, v66);
    __uint64_t v67 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v74 = @"Result";
    uint64_t v75 = v62;
    uint64_t v69 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v68, (uint64_t)&v75, (uint64_t)&v74, 1);
    ((void (**)(void, id, void *))v67)[2](v67, v5, v69);

    uint64_t v10 = (void *)v62;
  }
  else
  {
    objc_msgSend_response(a1[5], v18, v19, v20, v21);
    uint64_t v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, id))v27)[2](v27, v5, v6);
  }
}

void sub_1B4FCEE90(uint64_t a1)
{
  uint64_t v354 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v6 = objc_msgSend_apple80211WithInterfaceName_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  uint64_t v10 = objc_msgSend_SCNetworkServiceWithInterfaceName_(*(void **)(a1 + 32), v7, *(void *)(a1 + 40), v8, v9);
  uint64_t v14 = (void *)v10;
  if (v6) {
    BOOL v15 = v10 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    uint64_t v16 = objc_msgSend_BSSID_(v6, v11, 0, v12, v13);
    uint64_t v20 = objc_msgSend___currentNetworkProfileWithInterfaceName_(*(void **)(a1 + 32), v17, *(void *)(a1 + 40), v18, v19);
    uint64_t v345 = (void *)v16;
    if (v16) {
      BOOL v25 = v20 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (v25)
    {
LABEL_105:

      goto LABEL_106;
    }
    __int16 v338 = v6;
    long long v350 = 0u;
    long long v351 = 0u;
    long long v348 = 0u;
    long long v349 = 0u;
    id v344 = v20;
    uint64_t v26 = objc_msgSend_BSSList(v20, v21, v22, v23, v24);
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v348, (uint64_t)v353, 16);
    if (v28)
    {
      uint64_t v33 = v28;
      uint64_t v34 = *(void *)v349;
      long long v333 = v2;
      __int16 v336 = v14;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v349 != v34) {
            objc_enumerationMutation(v26);
          }
          uint64_t v36 = *(void **)(*((void *)&v348 + 1) + 8 * i);
          uint64_t v37 = objc_msgSend_BSSID(v36, v29, v30, v31, v32);
          if ((void *)v37 == v345)
          {

LABEL_23:
            id v54 = v36;
            uint64_t v2 = v333;
            uint64_t v14 = v336;
            goto LABEL_25;
          }
          uint64_t v42 = (void *)v37;
          uint64_t v43 = objc_msgSend_BSSID(v36, v38, v39, v40, v41);
          if (v43)
          {
            uint64_t v48 = (void *)v43;
            id v49 = objc_msgSend_BSSID(v36, v44, v45, v46, v47);
            int isEqual = objc_msgSend_isEqual_(v49, v50, (uint64_t)v345, v51, v52);

            if (isEqual) {
              goto LABEL_23;
            }
          }
          else
          {
          }
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v348, (uint64_t)v353, 16);
        id v54 = 0;
        uint64_t v2 = v333;
        uint64_t v14 = v336;
        if (v33) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v54 = 0;
    }
LABEL_25:

    uint64_t v59 = objc_msgSend_IPv4NetworkSignature(v14, v55, v56, v57, v58);
    uint64_t v64 = objc_msgSend_IPv6NetworkSignature(v14, v60, v61, v62, v63);
    uint64_t v69 = objc_msgSend_DHCPServerID(v14, v65, v66, v67, v68);
    uint64_t v74 = objc_msgSend_DHCPv6ServerID(v14, v70, v71, v72, v73);
    __int16 v342 = (void *)v74;
    v343 = v69;
    unsigned int v341 = v64;
    if (!v54)
    {
      int v79 = 0;
      id v6 = v338;
      goto LABEL_73;
    }
    id v6 = v338;
    if (!v59 && !v64 && !v69 && !v74)
    {
LABEL_30:
      int v79 = 0;
      goto LABEL_73;
    }
    uint64_t v84 = objc_msgSend_IPv4NetworkSignature(v54, v75, v76, v77, v78);
    if (v59 == v84) {
      goto LABEL_36;
    }
    if (!v59)
    {
LABEL_60:
      int v136 = v84;
      goto LABEL_61;
    }
    uint64_t v85 = objc_msgSend_IPv4NetworkSignature(v54, v80, v81, v82, v83);
    if (!v85)
    {
      uint64_t v120 = 0;
LABEL_59:

      goto LABEL_60;
    }
    int v334 = (void *)v85;
    long long v328 = objc_msgSend_IPv4NetworkSignature(v54, v86, v87, v88, v89);
    if (objc_msgSend_isEqual_(v59, v90, (uint64_t)v328, v91, v92))
    {
LABEL_36:
      unint64_t v97 = objc_msgSend_IPv6NetworkSignature(v54, v80, v81, v82, v83);
      if (v64 == v97)
      {
        long long v330 = v59;
LABEL_43:
        uint64_t v111 = objc_msgSend_DHCPServerID(v54, v93, v94, v95, v96);
        long long v326 = v69;
        if (v343 == v111)
        {
          uint64_t v337 = v14;
        }
        else
        {
          if (!v343)
          {
            char v106 = 1;
LABEL_66:

LABEL_67:
            uint64_t v59 = v330;
            if (v64 != v97)
            {
            }
LABEL_69:

            if (v59 != v84)
            {
            }
            if ((v106 & 1) == 0) {
              goto LABEL_30;
            }
            goto LABEL_72;
          }
          uint64_t v112 = objc_msgSend_DHCPServerID(v54, v107, v108, v109, v110);
          if (!v112)
          {

            char v106 = 1;
            goto LABEL_67;
          }
          uint64_t v324 = (void *)v112;
          uint64_t v323 = objc_msgSend_DHCPServerID(v54, v113, v114, v115, v116);
          if (!objc_msgSend_isEqual_(v343, v117, (uint64_t)v323, v118, v119))
          {
            char v106 = 1;
LABEL_65:

            goto LABEL_66;
          }
          uint64_t v337 = v14;
        }
        uint64_t v121 = objc_msgSend_DHCPv6ServerID(v54, v107, v108, v109, v110);
        uint64_t v126 = (void *)v121;
        char v106 = v342 != (void *)v121;
        if (v342 && v342 != (void *)v121)
        {
          uint64_t v127 = objc_msgSend_DHCPv6ServerID(v54, v122, v123, v124, v125);
          if (!v127)
          {

            char v106 = 1;
LABEL_55:
            uint64_t v14 = v337;
            if (v343 == v111) {
              goto LABEL_66;
            }
            goto LABEL_65;
          }
          uint64_t v322 = (void *)v127;
          long long v132 = objc_msgSend_DHCPv6ServerID(v54, v128, v129, v130, v131);
          char v106 = objc_msgSend_isEqual_(v342, v133, (uint64_t)v132, v134, v135) ^ 1;

          uint64_t v64 = v341;
        }

        goto LABEL_55;
      }
      if (!v64
        || (objc_msgSend_IPv6NetworkSignature(v54, v93, v94, v95, v96), (uint64_t v98 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        char v106 = 1;
        goto LABEL_69;
      }
      uint64_t v325 = (void *)v98;
      uint64_t v69 = objc_msgSend_IPv6NetworkSignature(v54, v99, v100, v101, v102);
      if (objc_msgSend_isEqual_(v64, v103, (uint64_t)v69, v104, v105))
      {
        long long v330 = v59;
        goto LABEL_43;
      }

      int v136 = v59;
      if (v59 == v84)
      {
LABEL_61:

LABEL_72:
        __int16 v138 = objc_msgSend_IPv4NetworkSignature(v14, v75, v137, v77, v78);
        objc_msgSend_setIPv4NetworkSignature_(v54, v139, (uint64_t)v138, v140, v141);

        __int16 v146 = objc_msgSend_IPv6NetworkSignature(v14, v142, v143, v144, v145);
        objc_msgSend_setIPv6NetworkSignature_(v54, v147, (uint64_t)v146, v148, v149);

        __int16 v154 = objc_msgSend_DHCPServerID(v14, v150, v151, v152, v153);
        objc_msgSend_setDHCPServerID_(v54, v155, (uint64_t)v154, v156, v157);

        __int16 v162 = objc_msgSend_DHCPv6ServerID(v14, v158, v159, v160, v161);
        objc_msgSend_setDHCPv6ServerID_(v54, v163, (uint64_t)v162, v164, v165);

        int v79 = 1;
LABEL_73:
        __int16 v166 = objc_msgSend___linkDownStatusWithInterfaceName_(*(void **)(a1 + 32), v75, *(void *)(a1 + 40), v77, v78);
        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v167, v168, v169, v170);
        double v172 = v171;
        uint64_t v177 = objc_msgSend_timestamp(v166, v173, v174, v175, v176);
        objc_msgSend_timeIntervalSinceReferenceDate(v177, v178, v179, v180, v181);
        double v183 = v172 - v182;

        if (v183 >= 30.0)
        {
          LODWORD(v197) = 0;
LABEL_96:
          if ((v79 | v197) == 1)
          {
            __int16 v340 = v166;
            long long v332 = v59;
            uint64_t v278 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v184, v185, v186, v187);
            uint64_t v283 = v278;
            if (v79) {
              objc_msgSend_addObject_(v278, v279, (uint64_t)&unk_1F0DC7C50, v281, v282);
            }
            int v284 = v14;
            if (v197) {
              objc_msgSend_addObject_(v283, v279, (uint64_t)&unk_1F0DC7C68, v281, v282);
            }
            uint64_t v285 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v279, v280, v281, v282);
            objc_msgSend_setObject_forKeyedSubscript_(v285, v286, (uint64_t)v344, @"NetworkProfile", v287);
            objc_msgSend_setObject_forKeyedSubscript_(v285, v288, (uint64_t)v283, @"NetworkProfileProperties", v289);
            id v290 = objc_alloc_init(CWFXPCRequest);
            objc_msgSend_setType_(v290, v291, 61, v292, v293);
            objc_msgSend_setInfo_(v290, v294, (uint64_t)v285, v295, v296);
            uint64_t v297 = objc_alloc_init(CWFRequestParameters);
            objc_msgSend_setInterfaceName_(v297, v298, *(void *)(a1 + 40), v299, v300);
            objc_msgSend_setRequestParameters_(v290, v301, (uint64_t)v297, v302, v303);
            uint64_t v308 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v304, v305, v306, v307);
            objc_msgSend_setReceivedAt_(v290, v309, (uint64_t)v308, v310, v311);

            v346[0] = MEMORY[0x1E4F143A8];
            v346[1] = 3221225472;
            v346[2] = sub_1B4FCF880;
            v346[3] = &unk_1E60BBED8;
            id v347 = v344;
            objc_msgSend_setResponse_(v290, v312, (uint64_t)v346, v313, v314);
            uint64_t v319 = objc_msgSend_delegate(*(void **)(a1 + 32), v315, v316, v317, v318);
            uint64_t v321 = v319;
            if (v319) {
              objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(v319, v320, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 232), (uint64_t)v290);
            }

            uint64_t v14 = v284;
            uint64_t v59 = v332;
            __int16 v166 = v340;
          }

          uint64_t v20 = v344;
          goto LABEL_105;
        }
        unint64_t v188 = objc_msgSend___linkDownNetworkWithInterfaceName_(*(void **)(a1 + 32), v184, *(void *)(a1 + 40), v186, v187);
        __int16 v197 = objc_msgSend_SSID(v188, v189, v190, v191, v192);
        if (v197)
        {
          int v339 = v166;
          id v335 = v54;
          uint64_t v198 = objc_msgSend_SSID(v344, v193, v194, v195, v196);

          if (v198)
          {
            long long v331 = v59;
            uint64_t v203 = objc_msgSend_seamlessSSIDList(v344, v199, v200, v201, v202);
            uint64_t v208 = objc_msgSend_mutableCopy(v203, v204, v205, v206, v207);

            uint64_t v211 = objc_msgSend___currentScanResultWithInterfaceName_forceNoCache_(*(void **)(a1 + 32), v209, *(void *)(a1 + 40), 1, v210);
            uint64_t v216 = objc_msgSend_copy(v344, v212, v213, v214, v215);
            uint64_t v220 = objc_msgSend_scanResultWithMatchingKnownNetworkProfile_(v211, v217, (uint64_t)v216, v218, v219);

            int v225 = objc_msgSend_matchingKnownNetworkProfile(v220, v221, v222, v223, v224);
            objc_msgSend_setSeamlessSSIDList_(v225, v226, 0, v227, v228);

            uint64_t v352 = v188;
            uint64_t v231 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v229, (uint64_t)&v352, 1, v230);
            long long v329 = v220;
            long long v232 = CWFKnownNetworksSupportingSeamlessSSIDTransitionForScanResult(v220, v231, 0);
            uint64_t v237 = objc_msgSend_count(v232, v233, v234, v235, v236);

            if (v237)
            {
              if (!v208)
              {
                uint64_t v208 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v238, v239, v240, v241);
              }
              uint64_t v242 = v14;
              id v243 = objc_msgSend_SSID(v188, v238, v239, v240, v241);
              char v247 = objc_msgSend_containsObject_(v208, v244, (uint64_t)v243, v245, v246);

              if (v247)
              {
LABEL_85:
                __int16 v166 = v339;
                uint64_t v259 = objc_msgSend_seamlessSSIDList(v344, v248, v249, v250, v251);
                if (v208 != (void *)v259)
                {
                  uint64_t v264 = (void *)v259;
                  if (v208
                    && (objc_msgSend_seamlessSSIDList(v344, v260, v261, v262, v263),
                        (uint64_t v265 = objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    uint64_t v270 = (void *)v265;
                    uint64_t v271 = objc_msgSend_seamlessSSIDList(v344, v266, v267, v268, v269);
                    char v327 = objc_msgSend_isEqual_(v208, v272, (uint64_t)v271, v273, v274);

                    __int16 v166 = v339;
                    if (v327) {
                      goto LABEL_93;
                    }
                  }
                  else
                  {
                  }
                  objc_msgSend_setSeamlessSSIDList_(v344, v275, (uint64_t)v208, v276, v277);
                  LODWORD(v197) = 1;
LABEL_94:
                  uint64_t v14 = v242;

                  id v54 = v335;
                  uint64_t v59 = v331;
                  goto LABEL_95;
                }

LABEL_93:
                LODWORD(v197) = 0;
                goto LABEL_94;
              }
              uint64_t v252 = objc_msgSend_SSID(v188, v248, v249, v250, v251);
              objc_msgSend_addObject_(v208, v253, (uint64_t)v252, v254, v255);
            }
            else
            {
              uint64_t v242 = v14;
              uint64_t v252 = objc_msgSend_SSID(v188, v238, v239, v240, v241);
              objc_msgSend_removeObject_(v208, v256, (uint64_t)v252, v257, v258);
            }

            goto LABEL_85;
          }
          LODWORD(v197) = 0;
          __int16 v166 = v339;
        }
LABEL_95:

        goto LABEL_96;
      }
    }

    uint64_t v120 = v334;
    goto LABEL_59;
  }
LABEL_106:
}

void sub_1B4FCF880(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CWFGetOSLog();
  uint64_t v5 = (void *)v4;
  if (v3)
  {
    if (v4)
    {
      id v6 = CWFGetOSLog();
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      uint64_t v13 = objc_msgSend_networkName(*(void **)(a1 + 32), v8, v9, v10, v11);
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    if (v4)
    {
      id v6 = CWFGetOSLog();
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
  }
}

void sub_1B4FCFA48(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA995D10]();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = objc_msgSend_operations(*(void **)(*(void *)(a1 + 32) + 192), v2, v3, v4, v5);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_name(v16, v9, v10, v11, v12);
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          uint64_t v19 = objc_msgSend_name(v16, v9, v10, v11, v12);
          int isEqual = objc_msgSend_isEqual_(v19, v20, @"updateKnownBSS", v21, v22);

          if (isEqual) {
            objc_msgSend_addDependency_(*(void **)(a1 + 40), v9, (uint64_t)v16, v11, v12);
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v13);
  }

  objc_msgSend_addOperation_(*(void **)(*(void *)(a1 + 32) + 192), v24, *(void *)(a1 + 40), v25, v26);
}

void sub_1B4FD0640(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v7 = objc_msgSend_response(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_response(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v12)[2](v12, v13, 0);
  }
}

uint64_t sub_1B4FD0D18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4FD10A4(uint64_t a1)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend___currentNetworkProfileWithInterfaceName_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
  objc_msgSend_identifier(v6, v7, v8, v9, v10);
  uint64_t v11 = (CWFAutoJoinParameters *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_identifier(*(void **)(a1 + 48), v12, v13, v14, v15);
  if (v11 == (CWFAutoJoinParameters *)v16)
  {

    goto LABEL_7;
  }
  uint64_t v21 = (void *)v16;
  uint64_t v22 = objc_msgSend_identifier(v6, v17, v18, v19, v20);
  if (!v22)
  {
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v27 = (void *)v22;
  uint64_t v28 = objc_msgSend_identifier(*(void **)(a1 + 48), v23, v24, v25, v26);
  if (!v28)
  {

    goto LABEL_17;
  }
  uint64_t v33 = (void *)v28;
  uint64_t v34 = objc_msgSend_identifier(v6, v29, v30, v31, v32);
  uint64_t v39 = objc_msgSend_identifier(*(void **)(a1 + 48), v35, v36, v37, v38);
  int isEqual = objc_msgSend_isEqual_(v34, v40, (uint64_t)v39, v41, v42);

  if (isEqual)
  {
LABEL_7:
    uint64_t v48 = CWFGetOSLog();
    if (v48)
    {
      id v49 = CWFGetOSLog();
    }
    else
    {
      id v49 = MEMORY[0x1E4F14500];
      id v50 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = *(void *)(a1 + 48);
      int v101 = 138543362;
      uint64_t v102 = v51;
      LODWORD(v100) = 12;
      unint64_t v99 = &v101;
      _os_log_send_and_compose_impl();
    }

    if (objc_msgSend_privateMACAddressDisabledByEvaluation(*(void **)(a1 + 48), v52, v53, v54, v55)) {
      objc_msgSend___disassocWithReason_interfaceName_(*(void **)(a1 + 32), v56, 32, *(void *)(a1 + 40), v57, v99, v100);
    }
    else {
      objc_msgSend___disassocWithReason_interfaceName_(*(void **)(a1 + 32), v56, 33, *(void *)(a1 + 40), v57, v99, v100);
    }
    uint64_t v11 = objc_alloc_init(CWFAutoJoinParameters);
    objc_msgSend_setMode_(v11, v58, 0, v59, v60);
    objc_msgSend_setTrigger_(v11, v61, 60, v62, v63);
    objc_msgSend_setTargetNetworkProfile_(v11, v64, *(void *)(a1 + 48), v65, v66);
    objc_msgSend___performAutoJoinWithParameters_interfaceName_(*(void **)(a1 + 32), v67, (uint64_t)v11, *(void *)(a1 + 40), v68);
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v69 = objc_msgSend_networkName(*(void **)(a1 + 48), v44, v45, v46, v47);

  if (v69)
  {
    uint64_t v74 = CWFGetOSLog();
    if (v74)
    {
      uint64_t v75 = CWFGetOSLog();
    }
    else
    {
      uint64_t v75 = MEMORY[0x1E4F14500];
      id v76 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v77 = *(void *)(a1 + 48);
      int v101 = 138543362;
      uint64_t v102 = v77;
      LODWORD(v100) = 12;
      unint64_t v99 = &v101;
      _os_log_send_and_compose_impl();
    }

    uint64_t v82 = objc_msgSend_networkName(*(void **)(a1 + 48), v78, v79, v80, v81);
    IPConfigurationForgetNetwork();
  }
  if (objc_msgSend_isPublicAirPlayNetwork(*(void **)(a1 + 48), v70, v71, v72, v73, v99, v100))
  {
    uint64_t v87 = objc_msgSend_SSID(*(void **)(a1 + 48), v83, v84, v85, v86);
    if (v87)
    {
      uint64_t v88 = (void *)v87;
      uint64_t v89 = sub_1B4F40978();

      if (v89)
      {
        unint64_t v90 = CWFGetOSLog();
        if (v90)
        {
          uint64_t v91 = CWFGetOSLog();
        }
        else
        {
          uint64_t v91 = MEMORY[0x1E4F14500];
          id v92 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v93 = *(void *)(a1 + 48);
          int v101 = 138543362;
          uint64_t v102 = v93;
          _os_log_send_and_compose_impl();
        }

        uint64_t v98 = objc_msgSend_SSID(*(void **)(a1 + 48), v94, v95, v96, v97);
        sub_1B4FB9198((uint64_t)v98);
      }
    }
  }
}

void sub_1B4FD1488(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_addOperation_(*(void **)(*(void *)(a1 + 32) + 192), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B4FD1F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FD1F90(uint64_t a1, int a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, (const char *)*MEMORY[0x1E4F7A118]);

  uint64_t v8 = CWFGetOSLog();
  if (v8)
  {
    uint64_t v9 = CWFGetOSLog();
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  if (a2 == 1002)
  {
    if (uint64 == 5003)
    {
      uint64_t v15 = *((void *)WeakRetained + 33);
      if (!v15)
      {
LABEL_29:
        *((void *)WeakRetained + 33) = 0;
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28798], 6, 0);
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v17);
    }
    else
    {
      if (uint64 != 5002) {
        goto LABEL_31;
      }
      if ((_NETRBClientSetHostCount() & 1) == 0)
      {
        uint64_t v21 = CWFGetOSLog();
        if (v21)
        {
          uint64_t v22 = CWFGetOSLog();
        }
        else
        {
          uint64_t v22 = MEMORY[0x1E4F14500];
          id v25 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          _os_log_send_and_compose_impl();
        }
      }
      if ((_NETRBClientDestroy() & 1) == 0)
      {
        uint64_t v23 = CWFGetOSLog();
        if (v23)
        {
          uint64_t v24 = CWFGetOSLog();
        }
        else
        {
          uint64_t v24 = MEMORY[0x1E4F14500];
          id v26 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          _os_log_send_and_compose_impl();
        }
      }
      *((void *)WeakRetained + 30) = 0;
      uint64_t v14 = *((void *)WeakRetained + 33);
      if (!v14)
      {
        uint64_t v15 = 0;
        goto LABEL_29;
      }
      (*(void (**)(uint64_t, void))(v14 + 16))(v14, 0);
    }
    uint64_t v15 = *((void *)WeakRetained + 33);
    goto LABEL_29;
  }
  if (a2 == 1001)
  {
    if (uint64 == 5003)
    {
      uint64_t v15 = *((void *)WeakRetained + 32);
      if (v15)
      {
        uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28798], 6, 0);
        (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

        uint64_t v15 = *((void *)WeakRetained + 32);
      }
      *((void *)WeakRetained + 32) = 0;
      goto LABEL_30;
    }
    if (uint64 == 5002)
    {
      uint64_t v12 = *((void *)WeakRetained + 32);
      if (v12)
      {
        (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
        uint64_t v13 = (void *)*((void *)WeakRetained + 32);
      }
      else
      {
        uint64_t v13 = 0;
      }
      *((void *)WeakRetained + 32) = 0;

      if (IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, @"com.apple.wifi.hostap", (IOPMAssertionID *)WeakRetained + 62))
      {
        uint64_t v18 = CWFGetOSLog();
        if (v18)
        {
          uint64_t v15 = CWFGetOSLog();
        }
        else
        {
          uint64_t v15 = MEMORY[0x1E4F14500];
          id v20 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
          _os_log_send_and_compose_impl();
        }
        goto LABEL_30;
      }
    }
  }
LABEL_31:

  return 0;
}

void sub_1B4FD2D1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v10 = a3;
  if (!v5
    && objc_msgSend_bridgeMode(*(void **)(a1 + 32), v6, v7, v8, v9)
    && objc_msgSend_bridgeType(*(void **)(a1 + 32), v6, v7, v8, v9))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(NSObject **)(v17 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4FD2E74;
    block[3] = &unk_1E60BCA90;
    void block[4] = v17;
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 32);
    id v22 = *(id *)(a1 + 56);
    id v23 = *(id *)(a1 + 64);
    dispatch_async(v18, block);
  }
  else
  {
    uint64_t v11 = objc_msgSend_response(*(void **)(a1 + 48), v6, v7, v8, v9);

    if (v11)
    {
      objc_msgSend_response(*(void **)(a1 + 48), v12, v13, v14, v15);
      uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id, void))v16)[2](v16, v5, 0);
    }
  }
}

void sub_1B4FD2E74(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v8 = objc_msgSend_requestParameters(*(void **)(a1 + 40), v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend___apple80211WithVirtualInterfaceRole_parentInterfaceName_(v3, v14, 7, (uint64_t)v13, v15);

  uint64_t v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 48);
  id v23 = objc_msgSend_interfaceName(v16, v19, v20, v21, v22);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1B4FD2FC4;
  v28[3] = &unk_1E60BCA68;
  id v24 = *(id *)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 32);
  id v29 = v24;
  uint64_t v30 = v25;
  id v31 = v16;
  id v32 = *(id *)(a1 + 56);
  id v33 = *(id *)(a1 + 64);
  id v26 = v16;
  objc_msgSend___startNetworkRelayBridgeWithHostAPConfiguration_interfaceName_reply_(v17, v27, v18, (uint64_t)v23, (uint64_t)v28);
}

void sub_1B4FD2FC4(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v8 = objc_alloc_init(CWFXPCRequest);
    objc_msgSend_setType_(v8, v9, 221, v10, v11);
    uint64_t v16 = objc_msgSend_requestParameters(*(void **)(a1 + 32), v12, v13, v14, v15);
    objc_msgSend_setRequestParameters_(v8, v17, (uint64_t)v16, v18, v19);

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1B4FD310C;
    v31[3] = &unk_1E60BC9D0;
    uint64_t v20 = *(void **)(a1 + 48);
    void v31[4] = *(void *)(a1 + 40);
    id v32 = v20;
    id v33 = *(id *)(a1 + 32);
    objc_msgSend_setResponse_(v8, v21, (uint64_t)v31, v22, v23);
    objc_msgSend_XPCRequestProxy_XPCConnection_receivedXPCRequest_(*(void **)(a1 + 56), v24, *(void *)(a1 + 40), *(void *)(a1 + 64), (uint64_t)v8);
  }
  uint64_t v25 = objc_msgSend_response(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v25)
  {
    objc_msgSend_response(*(void **)(a1 + 32), v26, v27, v28, v29);
    uint64_t v30 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id, void))v30)[2](v30, v7, 0);
  }
}

void sub_1B4FD310C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = sub_1B4FD31DC;
  v7[3] = &unk_1E60BC7A0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void sub_1B4FD31DC(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32))
  {
    id v11 = CWFGetOSLog();
    if (v11)
    {
      uint64_t v12 = CWFGetOSLog();
    }
    else
    {
      uint64_t v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v20 = 136446978;
      uint64_t v21 = "-[CWFXPCRequestProxy __startHostAPMode:XPCConnection:]_block_invoke_5";
      __int16 v22 = 2082;
      uint64_t v23 = "CWFXPCRequestProxy.m";
      __int16 v24 = 1024;
      int v25 = 7220;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      int v16 = 38;
      uint64_t v15 = &v20;
      _os_log_send_and_compose_impl();
    }
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = objc_msgSend_interfaceName(*(void **)(a1 + 48), v2, v3, v4, v5, v15, v16);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B4FD33B0;
  void v17[3] = &unk_1E60BB9C8;
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 32);
  objc_msgSend___stopNetworkRelayBridgeForInterfaceName_reply_(v7, v9, (uint64_t)v8, (uint64_t)v17, v10);
}

void sub_1B4FD33B0(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v7 = objc_msgSend_response(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_response(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (*(void *)(a1 + 40)) {
      id v13 = *(id *)(a1 + 40);
    }
    else {
      id v13 = v14;
    }
    ((void (**)(void, id, void))v12)[2](v12, v13, 0);
  }
}

void sub_1B4FD36A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4FD3764;
  block[3] = &unk_1E60BB950;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void sub_1B4FD3764(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1BA995D10]();
  if (*(void *)(a1 + 32))
  {
    int v25 = CWFGetOSLog();
    if (v25)
    {
      __int16 v26 = CWFGetOSLog();
    }
    else
    {
      __int16 v26 = MEMORY[0x1E4F14500];
      id v27 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      int v34 = 136446978;
      id v35 = "-[CWFXPCRequestProxy __stopHostAPMode:XPCConnection:]_block_invoke_2";
      __int16 v36 = 2082;
      uint64_t v37 = "CWFXPCRequestProxy.m";
      __int16 v38 = 1024;
      int v39 = 7266;
      __int16 v40 = 2114;
      uint64_t v41 = v28;
      int v30 = 38;
      uint64_t v29 = &v34;
      _os_log_send_and_compose_impl();
    }
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = objc_msgSend_requestParameters(*(void **)(a1 + 48), v2, v3, v4, v5, v29, v30);
  id v13 = objc_msgSend_interfaceName(v8, v9, v10, v11, v12);
  int v16 = objc_msgSend___apple80211WithVirtualInterfaceRole_parentInterfaceName_(v7, v14, 7, (uint64_t)v13, v15);

  uint64_t v17 = *(void **)(a1 + 40);
  __int16 v22 = objc_msgSend_interfaceName(v16, v18, v19, v20, v21);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1B4FD3984;
  v31[3] = &unk_1E60BB9C8;
  id v32 = *(id *)(a1 + 48);
  id v33 = *(id *)(a1 + 32);
  objc_msgSend___stopNetworkRelayBridgeForInterfaceName_reply_(v17, v23, (uint64_t)v22, (uint64_t)v31, v24);
}

void sub_1B4FD3984(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v7 = objc_msgSend_response(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_response(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (*(void *)(a1 + 40)) {
      id v13 = *(id *)(a1 + 40);
    }
    else {
      id v13 = v14;
    }
    ((void (**)(void, id, void))v12)[2](v12, v13, 0);
  }
}

void sub_1B4FD3ECC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    objc_msgSend_objectForKeyedSubscript_(a3, v6, @"Result", v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v9);
  }
}

void sub_1B4FD417C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FD4194(uint64_t a1, void *a2, void *a3)
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v10 = a3;
  if (v10)
  {
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v11)
    {
      uint64_t v12 = objc_msgSend_SSID(v11, v6, v7, v8, v9);
      uint64_t v17 = objc_msgSend_SSID(v10, v13, v14, v15, v16);
      if (v12 == (void *)v17)
      {

        goto LABEL_9;
      }
      __int16 v22 = (void *)v17;
      uint64_t v23 = objc_msgSend_SSID(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v18, v19, v20, v21);
      if (v23)
      {
        uint64_t v28 = (void *)v23;
        uint64_t v29 = objc_msgSend_SSID(v10, v24, v25, v26, v27);
        if (v29)
        {
          int v34 = (void *)v29;
          id v35 = objc_msgSend_SSID(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v30, v31, v32, v33);
          __int16 v40 = objc_msgSend_SSID(v10, v36, v37, v38, v39);
          int isEqual = objc_msgSend_isEqual_(v35, v41, (uint64_t)v40, v42, v43);

          if (!isEqual) {
            goto LABEL_12;
          }
LABEL_9:
          id v49 = objc_msgSend_scanRecord(v10, v45, v46, v47, v48);
          uint64_t v54 = objc_msgSend_mutableCopy(v49, v50, v51, v52, v53);

          uint64_t v59 = objc_msgSend_scanRecord(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v55, v56, v57, v58);
          objc_msgSend_addEntriesFromDictionary_(v54, v60, (uint64_t)v59, v61, v62);

          uint64_t v63 = [CWFScanResult alloc];
          uint64_t v68 = objc_msgSend_matchingKnownNetworkProfile(v10, v64, v65, v66, v67);
          uint64_t v70 = objc_msgSend_initWithScanRecord_knownNetworkProfile_includeProperties_(v63, v69, (uint64_t)v54, (uint64_t)v68, 0);
          uint64_t v71 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v72 = *(void **)(v71 + 40);
          *(void *)(v71 + 40) = v70;

          uint64_t v77 = objc_msgSend_OSSpecificAttributes(v10, v73, v74, v75, v76);
          objc_msgSend_setOSSpecificAttributes_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v78, (uint64_t)v77, v79, v80);

LABEL_13:
          goto LABEL_14;
        }
      }
    }
LABEL_12:
    uint64_t v81 = *(void *)(*(void *)(a1 + 40) + 8);
    id v82 = v10;
    uint64_t v54 = *(void **)(v81 + 40);
    *(void *)(v81 + 40) = v82;
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v83 = objc_msgSend_response(*(void **)(a1 + 32), v6, v7, v8, v9);

  if (v83)
  {
    uint64_t v88 = objc_msgSend_response(*(void **)(a1 + 32), v84, v85, v86, v87);
    unint64_t v90 = (void (**)(void, void, void))v88;
    uint64_t v91 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v91)
    {
      uint64_t v93 = @"Result";
      v94[0] = v91;
      id v92 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v89, (uint64_t)v94, (uint64_t)&v93, 1);
      ((void (**)(void, void, void *))v90)[2](v90, 0, v92);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v88 + 16))(v88, 0, 0);
    }
  }
}

void sub_1B4FD4800(uint64_t a1, void *a2, void *a3)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v95 = a3;
  uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v5, v6, v7, v8);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obj = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v102, (uint64_t)v109, 16);
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v103 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13, v14, v15);
        uint64_t v25 = objc_msgSend_sourceAddresses(v19, v21, v22, v23, v24);
        int v30 = objc_msgSend_allObjects(v25, v26, v27, v28, v29);
        objc_msgSend_setObject_forKey_(v20, v31, (uint64_t)v30, @"addresses", v32);

        uint64_t v37 = objc_msgSend_serviceNames(v19, v33, v34, v35, v36);
        uint64_t v42 = objc_msgSend_allObjects(v37, v38, v39, v40, v41);
        objc_msgSend_setObject_forKey_(v20, v43, (uint64_t)v42, @"services", v44);

        id v49 = objc_msgSend_name(v19, v45, v46, v47, v48);
        objc_msgSend_setObject_forKey_(v9, v50, (uint64_t)v20, (uint64_t)v49, v51);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v102, (uint64_t)v109, 16);
    }
    while (v16);
  }

  uint64_t v56 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v52, v53, v54, v55);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v57 = v95;
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v98, (uint64_t)v108, 16);
  if (v59)
  {
    uint64_t v64 = v59;
    uint64_t v65 = *(void *)v99;
    do
    {
      for (uint64_t j = 0; j != v64; ++j)
      {
        if (*(void *)v99 != v65) {
          objc_enumerationMutation(v57);
        }
        uint64_t v67 = objc_msgSend_description(*(void **)(*((void *)&v98 + 1) + 8 * j), v60, v61, v62, v63);
        objc_msgSend_addObject_(v56, v68, (uint64_t)v67, v69, v70);
      }
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v98, (uint64_t)v108, 16);
    }
    while (v64);
  }

  uint64_t v75 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v71, v72, v73, v74);
  v106[0] = @"valid";
  v106[1] = @"filtered";
  v107[0] = v9;
  v107[1] = v56;
  uint64_t v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v76, (uint64_t)v107, (uint64_t)v106, 2);
  objc_msgSend_setObject_forKeyedSubscript_(v75, v78, (uint64_t)v77, @"Result", v79);

  uint64_t v84 = objc_msgSend_response(*(void **)(a1 + 32), v80, v81, v82, v83);

  if (v84)
  {
    objc_msgSend_response(*(void **)(a1 + 32), v85, v86, v87, v88);
    uint64_t v89 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v94 = objc_msgSend_copy(v75, v90, v91, v92, v93);
    ((void (**)(void, void, void *))v89)[2](v89, 0, v94);
  }
}

id sub_1B4FD4B68(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4, a5);
  uint64_t v14 = objc_msgSend_processName(*(void **)(a1 + 32), v7, v8, v9, v10);
  if (v14) {
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v14, @"process", v13);
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15 && *(void *)(a1 + 48))
  {
    uint64_t v16 = objc_msgSend_profilesContainsHomeProfile_(*(void **)(a1 + 56), v11, v15, v12, v13);
    uint64_t v20 = objc_msgSend_numberWithBool_(NSNumber, v17, v16, v18, v19);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"home", v22);

    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 48), v23, @"mapLabelArrayForCalloutsKey", v24, v25);
    if (v26)
    {
      uint64_t v81 = v26;
      uint64_t v31 = NSNumber;
      uint64_t v32 = objc_msgSend_count(v26, v27, v28, v29, v30);
      uint64_t v36 = objc_msgSend_numberWithUnsignedInteger_(v31, v33, v32, v34, v35);
      objc_msgSend_setObject_forKey_(v6, v37, (uint64_t)v36, @"networkCount", v38);

      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 48), v39, @"mapLabelArrayForCalloutsKey", v40, v41);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v85, (uint64_t)v89, 16);
      if (v84)
      {
        uint64_t v83 = *(void *)v86;
        uint64_t v46 = 1;
        do
        {
          for (uint64_t i = 0; i != v84; ++i)
          {
            if (*(void *)v86 != v83) {
              objc_enumerationMutation(obj);
            }
            uint64_t v48 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            id v49 = objc_msgSend_objectForKeyedSubscript_(v48, v43, @"mapLabelCalloutDeviceCountKey", v44, v45);

            if (v49)
            {
              uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v48, v50, @"mapLabelCalloutDeviceCountKey", v51, v52);
              id v49 = objc_msgSend_integerValue(v53, v54, v55, v56, v57);
            }
            uint64_t v58 = objc_msgSend_numberWithInteger_(NSNumber, v50, (uint64_t)v49, v51, v52);
            uint64_t v62 = objc_msgSend_stringWithFormat_(NSString, v59, @"network%dDeviceCount", v60, v61, v46 + i);
            objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v58, (uint64_t)v62, v64);

            uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(v48, v65, @"mapLabelCalloutDeviceNamesKey", v66, v67);
            BOOL v69 = v68 != 0;

            uint64_t v73 = objc_msgSend_numberWithBool_(NSNumber, v70, v69, v71, v72);
            uint64_t v77 = objc_msgSend_stringWithFormat_(NSString, v74, @"network%dDeviceName", v75, v76, v46 + i);
            objc_msgSend_setObject_forKey_(v6, v78, (uint64_t)v73, (uint64_t)v77, v79);
          }
          uint64_t v46 = (v46 + i);
          uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v85, (uint64_t)v89, 16);
        }
        while (v84);
      }

      uint64_t v26 = v81;
    }
  }
  else
  {
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)&unk_1F0DC7CB0, @"networkCount", v13);
  }

  return v6;
}

uint64_t sub_1B4FD5048()
{
  uint64_t result = _sl_dlopen();
  qword_1EB4B25E8 = result;
  return result;
}

void *sub_1B4FD50BC(void *a1)
{
  uint64_t v2 = sub_1B4F40978();
  if (v2)
  {
    uint64_t v7 = (void *)v2;
  }
  else
  {
    a1 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v3, v4, v5, v6);
    uint64_t v7 = objc_msgSend_stringWithUTF8String_(NSString, v9, (uint64_t)"void *CaptiveNetworkLibrary(void)", v10, v11);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(a1, v12, (uint64_t)v7, @"CWFXPCRequestProxy.m", 55, @"%s", 0);

    __break(1u);
    free(v13);
  }
  uint64_t result = dlsym(v7, "CNForgetSSID");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  off_1E9D45C40 = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t sub_1B4FD519C()
{
  if (!qword_1E9D45C48) {
    qword_1E9D45C48 = _sl_dlopen();
  }
  return qword_1E9D45C48;
}

uint64_t sub_1B4FD526C()
{
  uint64_t result = _sl_dlopen();
  qword_1E9D45C48 = result;
  return result;
}

void sub_1B4FD52E0(void *a1)
{
  if (!sub_1B4FD519C())
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v2, v3, v4, v5);
    a1 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"void *CoreServicesLibrary(void)", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v14, (uint64_t)a1, @"CWFXPCRequestProxy.m", 65, @"%s", 0);

    __break(1u);
    free(v15);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = objc_getClass("LSApplicationProxy");
  if (*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    qword_1E9D45C50 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  else
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8, v9);
    uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)"Class getLSApplicationProxyClass(void)_block_invoke", v18, v19);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v21, (uint64_t)v20, @"CWFXPCRequestProxy.m", 66, @"Unable to find class %s", "LSApplicationProxy");

    __break(1u);
  }
}

void sub_1B4FD8458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_1B4FD8494(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    objc_msgSend_set_serviceRegistrationError_(*(void **)(a1 + 32), v3, (uint64_t)v6, v4, v5);
    uint64_t v7 = CWFGetOSLog();
    if (v7)
    {
      uint64_t v8 = CWFGetOSLog();
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend_localizedDescription(*(void **)(a1 + 40), v10, v11, v12, v13);
      objc_msgSend_code(v6, v14, v15, v16, v17);
      _os_log_send_and_compose_impl();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void sub_1B4FD85D4(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CWFGetOSLog();
  if (v2)
  {
    uint64_t v3 = CWFGetOSLog();
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend__accessory(*(void **)(a1 + 32), v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend__serviceRegistrationError(*(void **)(a1 + 32), v10, v11, v12, v13);
    int v40 = 138543618;
    uint64_t v41 = v9;
    __int16 v42 = 2114;
    uint64_t v43 = v14;
    int v39 = 22;
    uint64_t v38 = &v40;
    _os_log_send_and_compose_impl();
  }
  if (objc_msgSend__attempt(*(void **)(a1 + 32), v15, v16, v17, v18) <= 2
    && (objc_msgSend__serviceRegistrationError(*(void **)(a1 + 32), v19, v20, v21, v22),
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        v23))
  {
    objc_msgSend_set_serviceRegistrationError_(*(void **)(a1 + 32), v19, 0, v21, v22);
    uint64_t v24 = *(void **)(a1 + 32);
    uint64_t v29 = objc_msgSend__attempt(v24, v25, v26, v27, v28);
    objc_msgSend_set_attempt_(v24, v30, v29 + 1, v31, v32);
    objc_msgSend_registerForPrimaryServiceNotificationWith_(*(void **)(a1 + 32), v33, *(void *)(a1 + 40), v34, v35);
  }
  else
  {
    uint64_t v36 = *(void *)(a1 + 40);
    uint64_t v37 = objc_msgSend__serviceRegistrationError(*(void **)(a1 + 32), v19, v20, v21, v22, v38, v39);
    (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v37);
  }
}

void sub_1B4FD8B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

void sub_1B4FD8B7C(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    objc_msgSend_set_serviceRegistrationError_(*(void **)(a1 + 32), v3, (uint64_t)v6, v4, v5);
    uint64_t v7 = CWFGetOSLog();
    if (v7)
    {
      uint64_t v8 = CWFGetOSLog();
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend_localizedDescription(*(void **)(a1 + 40), v10, v11, v12, v13);
      objc_msgSend_code(v6, v14, v15, v16, v17);
      _os_log_send_and_compose_impl();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void sub_1B4FD8CBC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = objc_msgSend__accessory(*(void **)(a1 + 32), a2, a3, a4, a5);
  objc_msgSend_setDelegate_(v6, v7, 0, v8, v9);

  uint64_t v10 = *(void *)(a1 + 40);
  objc_msgSend__serviceRegistrationError(*(void **)(a1 + 32), v11, v12, v13, v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v10 + 16))(v10, v15);
}

void sub_1B4FD9000(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isPrimaryService(a1[4], a2, a3, a4, a5))
  {
    objc_msgSend_properties(a1[5], v6, v7, v8, v9);
    id v117 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = off_1EB4B25A0();
    if (objc_msgSend_containsObject_(v117, v11, (uint64_t)v10, v12, v13))
    {
      uint64_t v18 = objc_msgSend_properties(a1[5], v14, v15, v16, v17);
      uint64_t v19 = off_1EB4B2598();
      int v23 = objc_msgSend_containsObject_(v18, v20, (uint64_t)v19, v21, v22);

      if (v23)
      {
        uint64_t v24 = CWFGetOSLog();
        if (v24)
        {
          uint64_t v25 = CWFGetOSLog();
        }
        else
        {
          uint64_t v25 = MEMORY[0x1E4F14500];
          id v26 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = objc_msgSend_localizedDescription(a1[5], v27, v28, v29, v30);
          uint64_t v36 = objc_msgSend_value(a1[5], v32, v33, v34, v35);
          int v120 = 138543618;
          uint64_t v121 = v31;
          __int16 v122 = 2114;
          uint64_t v123 = v36;
          int v116 = 22;
          uint64_t v115 = &v120;
          _os_log_send_and_compose_impl();
        }
        uint64_t v41 = objc_msgSend__sensingParams(a1[6], v37, v38, v39, v40);
        uint64_t v46 = objc_msgSend_mutableCopy(v41, v42, v43, v44, v45);

        uint64_t v51 = objc_msgSend_localizedDescription(a1[5], v47, v48, v49, v50);

        if (v51)
        {
          uint64_t v56 = objc_msgSend_localizedDescription(a1[5], v52, v53, v54, v55);
          uint64_t v119 = v56;
          uint64_t v59 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v57, (uint64_t)&v119, 1, v58);
          objc_msgSend_setObject_forKeyedSubscript_(v46, v60, (uint64_t)v59, @"SENSING_PARAMS_ACTIVITY_LABELS", v61);
        }
        else
        {
          objc_msgSend_setObject_forKeyedSubscript_(v46, v52, (uint64_t)&unk_1F0DC8880, @"SENSING_PARAMS_ACTIVITY_LABELS", v55);
        }
        uint64_t v66 = objc_msgSend_value(a1[5], v62, v63, v64, v65, v115, v116);

        if (v66)
        {
          uint64_t v71 = objc_msgSend_value(a1[5], v67, v68, v69, v70);
          uint64_t v118 = v71;
          uint64_t v74 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v72, (uint64_t)&v118, 1, v73);
          objc_msgSend_setObject_forKeyedSubscript_(v46, v75, (uint64_t)v74, @"SENSING_PARAMS_ACTIVITY_VALUE", v76);
        }
        else
        {
          objc_msgSend_setObject_forKeyedSubscript_(v46, v67, (uint64_t)&unk_1F0DC8898, @"SENSING_PARAMS_ACTIVITY_VALUE", v70);
        }
        uint64_t v81 = objc_msgSend_uniqueIdentifier(a1[7], v77, v78, v79, v80);
        long long v86 = objc_msgSend_UUIDString(v81, v82, v83, v84, v85);
        objc_msgSend_setObject_forKeyedSubscript_(v46, v87, (uint64_t)v86, @"SENSING_PARAMS_COMMENT", v88);

        uint64_t v93 = objc_msgSend_room(a1[7], v89, v90, v91, v92);
        long long v98 = objc_msgSend_name(v93, v94, v95, v96, v97);
        objc_msgSend_setObject_forKeyedSubscript_(v46, v99, (uint64_t)v98, @"SENSING_PARAMS_PLACE_LABELS", v100);

        objc_msgSend_setObject_forKeyedSubscript_(v46, v101, MEMORY[0x1E4F1CC38], @"SENSING_PARAMS_SUBMIT_METRIC", v102);
        id v107 = objc_msgSend__delegate(a1[6], v103, v104, v105, v106);
        int v111 = objc_msgSend_performSensingFor_(v107, v108, (uint64_t)v46, v109, v110);

        if (v111)
        {
          uint64_t v112 = CWFGetOSLog();
          if (v112)
          {
            unint64_t v113 = CWFGetOSLog();
          }
          else
          {
            unint64_t v113 = MEMORY[0x1E4F14500];
            id v114 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            int v120 = 67109120;
            LODWORD(v121) = v111;
            _os_log_send_and_compose_impl();
          }
        }
      }
    }
    else
    {
    }
  }
}

id sub_1B4FD9530()
{
  if (qword_1E9D45C70 != -1) {
    dispatch_once(&qword_1E9D45C70, &unk_1F0DA3F90);
  }
  uint64_t v0 = (void *)qword_1E9D45C68;
  return v0;
}

void sub_1B4FD9584(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = sub_1B4FD95D0(a1, a2, a3, a4, a5);
  id v6 = (id *)dlsym(v5, "HMCharacteristicPropertySupportsEventNotification");
  if (v6) {
    objc_storeStrong((id *)&qword_1E9D45C68, *v6);
  }
  off_1EB4B2598 = sub_1B4FD9724;
}

void *sub_1B4FD95D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13[0] = 0;
  if (!qword_1E9D45C58)
  {
    v13[1] = (void *)MEMORY[0x1E4F143A8];
    v13[2] = (void *)3221225472;
    v13[3] = sub_1B4FD9730;
    v13[4] = &unk_1E60BAFB0;
    void v13[5] = v13;
    long long v14 = xmmword_1E60BCBA8;
    uint64_t v15 = 0;
    qword_1E9D45C58 = _sl_dlopen();
  }
  uint64_t v5 = (void *)qword_1E9D45C58;
  if (!qword_1E9D45C58)
  {
    uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, a4, a5);
    uint64_t v11 = objc_msgSend_stringWithUTF8String_(NSString, v8, (uint64_t)"void *HomeKitLibrary(void)", v9, v10);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v12, (uint64_t)v11, @"CWFSensingHMADataCollector.m", 30, @"%s", v13[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v6 = v13[0];
  if (v13[0]) {
LABEL_7:
  }
    free(v6);
  return v5;
}

id sub_1B4FD9724()
{
  return (id)qword_1E9D45C68;
}

uint64_t sub_1B4FD9730()
{
  uint64_t result = _sl_dlopen();
  qword_1E9D45C58 = result;
  return result;
}

id sub_1B4FD97A4()
{
  if (qword_1E9D45C78 != -1) {
    dispatch_once(&qword_1E9D45C78, &unk_1F0DA3BB0);
  }
  uint64_t v0 = (void *)qword_1E9D45C60;
  return v0;
}

void sub_1B4FD97F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = sub_1B4FD95D0(a1, a2, a3, a4, a5);
  id v6 = (id *)dlsym(v5, "HMCharacteristicPropertyReadable");
  if (v6) {
    objc_storeStrong((id *)&qword_1E9D45C60, *v6);
  }
  off_1EB4B25A0 = sub_1B4FD9844;
}

id sub_1B4FD9844()
{
  return (id)qword_1E9D45C60;
}

void sub_1B4FDA3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FDA510()
{
  if (!qword_1E9D45C08) {
    qword_1E9D45C08 = _sl_dlopen();
  }
  return qword_1E9D45C08;
}

uint64_t sub_1B4FDA5E0()
{
  uint64_t result = _sl_dlopen();
  qword_1E9D45C08 = result;
  return result;
}

void sub_1B4FDA654(void *a1)
{
  if (!sub_1B4FDA510())
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v2, v3, v4, v5);
    a1 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"void * _Nonnull SharingLibrary(void)", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v14, (uint64_t)a1, @"CWFAssocParameters.m", 21, @"%s", 0);

    __break(1u);
    free(v15);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = objc_getClass("SFRemoteHotspotDevice");
  if (*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    qword_1E9D45C18 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  else
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8, v9);
    uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)"Class  _Nonnull getSFRemoteHotspotDeviceClass(void)_block_invoke", v18, v19);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v21, (uint64_t)v20, @"CWFAssocParameters.m", 22, @"Unable to find class %s", "SFRemoteHotspotDevice");

    __break(1u);
  }
}

void sub_1B4FDBC78(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = CWFGetOSLog();
    if (v2)
    {
      uint64_t v3 = CWFGetOSLog();
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }
  }
}

void sub_1B4FDCEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FDCED0(uint64_t a1, int a2, int a3, unsigned int a4)
{
  if (a2)
  {
    if (a3)
    {
      id v6 = CWFGetOSLog();
      if (v6)
      {
        uint64_t v7 = CWFGetOSLog();
      }
      else
      {
        uint64_t v7 = MEMORY[0x1E4F14500];
        id v8 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        _os_log_send_and_compose_impl();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    if (a4 >= 0x51 && *(void *)(a1 + 40) == 2)
    {
      uint64_t v9 = CWFGetOSLog();
      if (v9)
      {
        uint64_t v10 = CWFGetOSLog();
      }
      else
      {
        uint64_t v10 = MEMORY[0x1E4F14500];
        id v11 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        _os_log_send_and_compose_impl();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

uint64_t sub_1B4FDD0C8(uint64_t a1, const char *a2)
{
  return objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(*(void **)(a1 + 32), a2, (uint64_t)a2, 1, 7);
}

uint64_t sub_1B4FDD0DC(uint64_t a1, const char *a2)
{
  return objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(*(void **)(a1 + 32), a2, (uint64_t)a2, 1, *(void *)(a1 + 40));
}

void sub_1B4FDD0F0(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = CWFGetOSLog();
    if (v2)
    {
      uint64_t v3 = CWFGetOSLog();
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }
  }
}

uint64_t sub_1B4FDDE18(uint64_t a1, const char *a2)
{
  return objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(*(void **)(a1 + 32), a2, (uint64_t)a2, 1, 6);
}

void sub_1B4FDDE2C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = CWFGetOSLog();
    if (v2)
    {
      uint64_t v3 = CWFGetOSLog();
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }
  }
}

uint64_t sub_1B4FDE1D4(uint64_t a1, const char *a2)
{
  return objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(*(void **)(a1 + 32), a2, (uint64_t)a2, 1, 7);
}

void sub_1B4FDE1E8(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = CWFGetOSLog();
    if (v2)
    {
      uint64_t v3 = CWFGetOSLog();
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }
  }
}

void sub_1B4FDF448(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = CWFGetOSLog();
    if (v2)
    {
      uint64_t v3 = CWFGetOSLog();
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }
  }
}

void sub_1B4FDF978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_1B4FDF9B4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    if (a3) {
      *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t sub_1B4FE01FC(uint64_t a1, const char *a2)
{
  return objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(*(void **)(a1 + 32), a2, (uint64_t)a2, 1, 0);
}

void sub_1B4FE0210(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = CWFGetOSLog();
    if (v2)
    {
      uint64_t v3 = CWFGetOSLog();
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      _os_log_send_and_compose_impl();
    }
  }
}

void sub_1B4FE2E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B4FE3820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE3838(uint64_t a1, void *a2)
{
}

void sub_1B4FE3848(uint64_t a1, void *a2)
{
}

void sub_1B4FE394C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE3968(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE3A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE3AB8(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE3CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE3CE0(uint64_t a1, void *a2)
{
}

void sub_1B4FE3CF0(uint64_t a1, void *a2)
{
}

void sub_1B4FE3E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE3E54(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE3FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE4018(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE41BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE41D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE4414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE442C(uint64_t a1, void *a2)
{
}

void sub_1B4FE443C(uint64_t a1, void *a2)
{
}

void sub_1B4FE4624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE463C(uint64_t a1, void *a2)
{
}

void sub_1B4FE464C(uint64_t a1, void *a2)
{
}

void sub_1B4FE4898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE48BC(uint64_t a1, void *a2)
{
}

void sub_1B4FE48CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t sub_1B4FE4AF4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_1B4FE4B10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4FE4D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE4D88(uint64_t a1, void *a2)
{
}

void sub_1B4FE4D98(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t sub_1B4FE4FC0(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_1B4FE4FDC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4FE51CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE51E4(uint64_t a1, void *a2)
{
}

void sub_1B4FE51F4(uint64_t a1, void *a2)
{
}

uint64_t sub_1B4FE5398(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4FE53B0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4FE5658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE5674(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE581C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE5838(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE5998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE59B4(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_BOOLValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE5B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE5B48(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE5CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE5D08(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE5F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE5F30(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE60D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE60F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE6294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE62B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE6454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE6470(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE6638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE6654(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE6788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE67A4(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE68E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE68FC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_doubleValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = v6;
  }
  return result;
}

void sub_1B4FE6A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE6A54(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_doubleValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = v6;
  }
  return result;
}

void sub_1B4FE6B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE6BAC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_doubleValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = v6;
  }
  return result;
}

void sub_1B4FE6D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE6D40(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE6EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE6EBC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE6FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE700C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE7140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE715C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE72D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE72F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE7534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE754C(uint64_t a1, void *a2)
{
}

void sub_1B4FE755C(uint64_t a1, void *a2)
{
}

void sub_1B4FE7660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE767C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE77B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE77CC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE79EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE7A08(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE7B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE7B9C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE7D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE7D74(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE7F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE7F34(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE826C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE8288(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE83BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE83D8(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE850C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE8528(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE865C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE8678(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE87F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE880C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE896C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE8988(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE8B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE8B1C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE8CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE8CDC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE8E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE8E9C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE9040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE905C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE9200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE921C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE93C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE93DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE9580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE959C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE96FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FE9718(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_BOOLValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FE9890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE98AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE9A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE9A6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE9C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE9C2C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE9DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE9DEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FE9F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FE9FAC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEA150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEA16C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEA310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEA32C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEA4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEA4EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEA64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEA668(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEA7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEA7FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEA9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEA9BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEAB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEAB7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEAD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEAD3C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

uint64_t sub_1B4FEAF3C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1B4FEAF54(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4FEB144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEB15C(uint64_t a1, void *a2)
{
}

void sub_1B4FEB16C(uint64_t a1, void *a2)
{
}

void sub_1B4FEB270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEB28C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_BOOLValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEB49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEB4B4(uint64_t a1, void *a2)
{
}

void sub_1B4FEB4C4(uint64_t a1, void *a2)
{
}

void sub_1B4FEB5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEB5E4(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEB7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEB80C(uint64_t a1, void *a2)
{
}

void sub_1B4FEB81C(uint64_t a1, void *a2)
{
}

void sub_1B4FEB920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEB93C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEBA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEBA8C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEBBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEBBDC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEBD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEBD2C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEBE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEBE7C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEBFB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEBFCC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntegerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEC144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEC160(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEC304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEC320(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEC530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEC548(uint64_t a1, void *a2)
{
}

void sub_1B4FEC558(uint64_t a1, void *a2)
{
}

void sub_1B4FEC6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEC6BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEC878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEC894(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FECAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FECB08(uint64_t a1, void *a2)
{
}

void sub_1B4FECB18(uint64_t a1, void *a2)
{
}

void sub_1B4FECC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FECC7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FECEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FECED8(uint64_t a1, void *a2)
{
}

void sub_1B4FECEE8(uint64_t a1, void *a2)
{
}

void sub_1B4FECEFC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FED3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FED40C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FED5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FED5CC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FED770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FED78C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FED930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FED94C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEDD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEDD30(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEDEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEDF08(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEE0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEE0E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEE354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEE36C(uint64_t a1, void *a2)
{
}

void sub_1B4FEE37C(uint64_t a1, void *a2)
{
}

void sub_1B4FEE570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEE588(uint64_t a1, void *a2)
{
}

void sub_1B4FEE598(uint64_t a1, void *a2)
{
}

void sub_1B4FEE788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEE7A0(uint64_t a1, void *a2)
{
}

void sub_1B4FEE7B0(uint64_t a1, void *a2)
{
}

void sub_1B4FEE9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEE9F4(uint64_t a1, void *a2)
{
}

void sub_1B4FEEA04(uint64_t a1, void *a2)
{
}

void sub_1B4FEEC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEEC24(uint64_t a1, void *a2)
{
}

void sub_1B4FEEC34(uint64_t a1, void *a2)
{
}

void sub_1B4FEEE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEEE48(uint64_t a1, void *a2)
{
}

void sub_1B4FEEE58(uint64_t a1, void *a2)
{
}

void sub_1B4FEF084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEF0A8(uint64_t a1, void *a2)
{
}

void sub_1B4FEF0B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1B4FEF32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEF344(uint64_t a1, void *a2)
{
}

void sub_1B4FEF354(uint64_t a1, void *a2)
{
}

void sub_1B4FEF4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEF4D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEF674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEF690(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEF834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEF850(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEF9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FEF9CC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_BOOLValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FEFB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEFB60(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEFD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEFD20(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FEFEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FEFEE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF0084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF00A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF0244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF0260(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF0404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF0420(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF05C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF05E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF0784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF07A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF0944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF0960(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF0B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF0B20(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF0CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF0CE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF0E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF0EA0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF1044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF1060(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF1204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF1220(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF13C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF13E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF1584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF15A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF1744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF1760(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF1904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF1920(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF1AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF1AE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF1C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF1CA0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF1E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF1E60(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF2004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF2020(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF21C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF21E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF2384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF23A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF2544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF2560(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF26C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FF26DC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_unsignedIntValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FF2844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF2860(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF29F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF2A10(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF2BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF2BC0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF2D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF2D70(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF2FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF2FCC(uint64_t a1, void *a2)
{
}

void sub_1B4FF2FDC(uint64_t a1, void *a2)
{
}

void sub_1B4FF32C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF32E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF3488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF34A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF3648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF3664(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF3808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF3824(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF39C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF39E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF3B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF3BA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF3D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF3D64(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF3F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF3F24(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF40C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF40E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF4288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF42A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF4448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF4464(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF4608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF4624(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF47C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF47E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF4988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF49A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF4B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF4B64(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF4D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF4D24(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF4EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF4EE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF5088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF50A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF5248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF5264(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF5408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF5424(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF55C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF55E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF5788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF57A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF5948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF5964(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF5B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF5B24(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF5CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF5CE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF5E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF5EA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF6048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF6064(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF62B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF62C8(uint64_t a1, void *a2)
{
}

void sub_1B4FF62D8(uint64_t a1, void *a2)
{
}

uint64_t sub_1B4FF6490(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_1B4FF64AC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4FF6708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF672C(uint64_t a1, void *a2)
{
}

void sub_1B4FF673C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1B4FF699C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF69B4(uint64_t a1, void *a2)
{
}

void sub_1B4FF69C4(uint64_t a1, void *a2)
{
}

void sub_1B4FF6C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF6C4C(uint64_t a1, void *a2)
{
}

void sub_1B4FF6C5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t sub_1B4FF6E9C(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_1B4FF6EB8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B4FF70CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF70E4(uint64_t a1, void *a2)
{
}

void sub_1B4FF70F4(uint64_t a1, void *a2)
{
}

void sub_1B4FF723C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF7258(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF73FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF7418(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF7660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF767C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF78D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF78EC(uint64_t a1, void *a2)
{
}

void sub_1B4FF78FC(uint64_t a1, void *a2)
{
}

void sub_1B4FF7AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF7AFC(uint64_t a1, void *a2)
{
}

void sub_1B4FF7B0C(uint64_t a1, void *a2)
{
}

void sub_1B4FF7CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF7D14(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF7ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF7EEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_1B4FF8064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FF8080(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FF82A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF82B8(uint64_t a1, void *a2)
{
}

void sub_1B4FF82C8(uint64_t a1, void *a2)
{
}

void sub_1B4FF83CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FF83E8(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_integerValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FF85F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF8610(uint64_t a1, void *a2)
{
}

void sub_1B4FF8620(uint64_t a1, void *a2)
{
}

void sub_1B4FF87F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B4FF880C(uint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = result;
    uint64_t result = objc_msgSend_BOOLValue(a3, (const char *)a2, (uint64_t)a3, a4, a5);
    *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_1B4FF8A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF8A44(uint64_t a1, void *a2)
{
}

void sub_1B4FF8A54(uint64_t a1, void *a2)
{
}

void sub_1B4FF8B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF8BB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v13 = v5;
  if (a2)
  {
    uint64_t v10 = objc_msgSend_localizedDescription(a2, v6, v7, v8, v9);
    NSLog(&cfstr_Error.isa, v10);
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = v5;
    uint64_t v10 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
}

void sub_1B4FF8D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF8DB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v13 = v5;
  if (a2)
  {
    uint64_t v10 = objc_msgSend_localizedDescription(a2, v6, v7, v8, v9);
    NSLog(&cfstr_Error.isa, v10);
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = v5;
    uint64_t v10 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
}

void sub_1B4FF8F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF8FB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v13 = v5;
  if (a2)
  {
    uint64_t v10 = objc_msgSend_localizedDescription(a2, v6, v7, v8, v9);
    NSLog(&cfstr_Error.isa, v10);
  }
  else
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = v5;
    uint64_t v10 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
}

void sub_1B4FF97B4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_handleNDDDoneEvent_interface_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), a5);
  id v5 = CWFGetOSLog();
  if (v5)
  {
    id v6 = CWFGetOSLog();
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_1B4FF98E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_handleNDDResultEvent_interface_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), a5);
  id v5 = CWFGetOSLog();
  if (v5)
  {
    id v6 = CWFGetOSLog();
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_1B4FF9A14(uint64_t a1)
{
  id v25 = *(id *)(a1 + 32);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v25, v2, @"DRIVER_AVAILABLE_REASON_STRING", v3, v4);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_stringWithCString_encoding_(NSString, v5, (uint64_t)"DextCrashed", 4, v7);
    int isEqualToString = objc_msgSend_isEqualToString_(v8, v10, (uint64_t)v9, v11, v12);

    if (isEqualToString) {
      objc_msgSend_handleDextCrashEvent(*(void **)(a1 + 40), v5, v14, v6, v7);
    }
  }
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v25, v5, @"DRIVER_AVAILABLE", v6, v7);
  uint64_t v20 = v15;
  if (v15 && objc_msgSend_BOOLValue(v15, v16, v17, v18, v19)) {
    objc_msgSend_handleDriverAvailableEvent(*(void **)(a1 + 40), v21, v22, v23, v24);
  }
}

void sub_1B4FF9E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4FF9E30(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)(a1 + 32);
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), a2, @"NDDParamsKey", a4, a5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v7, @"NDDClientKey", v8, v9);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend_handleNDDRequestWithParams_clientName_interface_(v6, v11, (uint64_t)v12, (uint64_t)v10, *(void *)(a1 + 48));
}

uint64_t sub_1B4FFC7BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  qword_1EB4B2678 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], a2, (uint64_t)&unk_1F0DC88C8, a4, a5);
  return MEMORY[0x1F41817F8]();
}

void sub_1B5000734(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v3);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend_setDelegate_(v12, v6, 0, v7, v8, (void)v21);
        objc_msgSend_invalidate(v12, v13, v14, v15, v16);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v9);
  }

  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 16), v17, v18, v19, v20);
}

void sub_1B500085C(uint64_t a1)
{
}

void sub_1B5000954(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 16), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B5000AA0(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = objc_msgSend_registeredEventIDs(*(void **)(*((void *)&v25 + 1) + 8 * v13), v7, v8, v9, v10, (void)v25);
        objc_msgSend_unionSet_(v3, v15, (uint64_t)v14, v16, v17);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v11);
  }

  uint64_t v22 = objc_msgSend_copy(v3, v18, v19, v20, v21);
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
}

void sub_1B5000F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5000F4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = objc_msgSend_delegate(*(void **)(a1 + 32), v3, v4, v5, v6);
  objc_msgSend_XPCListener_invalidatedXPCConnection_(v7, v8, *(void *)(a1 + 32), (uint64_t)WeakRetained, v9);

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(NSObject **)(v10 + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B5001018;
  v13[3] = &unk_1E60BB9F0;
  v13[4] = v10;
  id v14 = WeakRetained;
  id v12 = WeakRetained;
  dispatch_async(v11, v13);
}

void sub_1B5001018(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 32) + 16), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B5001060(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_addObject_(*(void **)(*(void *)(a1 + 32) + 16), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B500128C(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CWFGetOSLog();
  if (v2)
  {
    id v3 = CWFGetOSLog();
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v9 = objc_msgSend_processIdentifier(*(void **)(*(void *)(a1 + 32) + 48), v5, v6, v7, v8);
    LODWORD(v75) = 67109120;
    HIDWORD(v75) = v9;
    LODWORD(v50) = 8;
    uint64_t v49 = &v75;
    _os_log_send_and_compose_impl();
  }

  uint64_t v75 = 0;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x3032000000;
  uint64_t v78 = sub_1B4F51CAC;
  uint64_t v79 = sub_1B4F51C04;
  id v80 = 0;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500174C;
  block[3] = &unk_1E60BB790;
  uint64_t v72 = &v75;
  uint64_t v71 = v10;
  dispatch_sync(v11, block);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v16 = objc_msgSend_allKeys((void *)v76[5], v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v66, (uint64_t)v74, 16);
  if (v21)
  {
    uint64_t v22 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v67 != v22) {
          objc_enumerationMutation(v16);
        }
        uint64_t v24 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        long long v25 = objc_msgSend_objectForKeyedSubscript_((void *)v76[5], v18, v24, v19, v20, v49, v50);
        objc_msgSend___startMonitoringEvent_requestParameters_reply_(*(void **)(a1 + 32), v26, v24, (uint64_t)v25, 0);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v66, (uint64_t)v74, 16);
    }
    while (v21);
  }

  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x3032000000;
  uint64_t v63 = sub_1B4F51CAC;
  uint64_t v64 = sub_1B4F51C04;
  id v65 = 0;
  long long v27 = *(void **)(a1 + 32);
  long long v28 = v27[1];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = sub_1B50017A8;
  v57[3] = &unk_1E60BB790;
  uint64_t v59 = &v60;
  uint64_t v58 = v27;
  dispatch_sync(v28, v57);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v33 = objc_msgSend_allKeys((void *)v61[5], v29, v30, v31, v32);
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v53, (uint64_t)v73, 16);
  if (v38)
  {
    uint64_t v39 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v54 != v39) {
          objc_enumerationMutation(v33);
        }
        uint64_t v41 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        __int16 v42 = objc_msgSend_objectForKeyedSubscript_((void *)v61[5], v35, v41, v36, v37, v49, v50);
        objc_msgSend___beginActivity_requestParameters_reply_(*(void **)(a1 + 32), v43, v41, (uint64_t)v42, 0);
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v53, (uint64_t)v73, 16);
    }
    while (v38);
  }

  uint64_t v48 = objc_msgSend_targetQueue(*(void **)(a1 + 32), v44, v45, v46, v47);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1B5001804;
  v51[3] = &unk_1E60BB768;
  id v52 = *(id *)(a1 + 32);
  dispatch_async(v48, v51);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v75, 8);
}

void sub_1B50016FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B500174C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 16), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B50017A8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_copy(*(void **)(*(void *)(a1 + 32) + 24), v3, v4, v5, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_1B5001804(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_interruptionHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_interruptionHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    id v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
  }
}

void sub_1B5001880(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 32), v3, v4, v5, v6);
}

void sub_1B50018C8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    id v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
  }
}

uint64_t sub_1B5001B1C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B5001B34(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5001C0C;
  block[3] = &unk_1E60BB950;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = *(id *)(a1 + 48);
  dispatch_sync(v4, block);
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void sub_1B5001C0C(void *a1)
{
  uint64_t v4 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v5 = a1[4];
  if (v5) {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[5] + 24), v2, a1[6], v5, v3);
  }
}

void sub_1B5001E9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B5001EB4(uint64_t a1, void *a2)
{
}

void sub_1B5001EC4(uint64_t a1, void *a2)
{
}

void sub_1B5001ED4(void *a1)
{
  uint64_t v4 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v5 = a1[4];
  if (v5) {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[5] + 24), v2, a1[6], v5, v3);
  }
}

void sub_1B500203C(uint64_t a1)
{
  uint64_t v4 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 24), v2, 0, v5, v3);
  }
}

void sub_1B5002164(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 24), v3, v4, v5, v6);
}

uint64_t sub_1B5002374(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1B500238C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5002464;
  block[3] = &unk_1E60BB950;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = *(id *)(a1 + 48);
  dispatch_sync(v4, block);
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void sub_1B5002464(void *a1)
{
  uint64_t v4 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v5 = a1[4];
  if (v5) {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[5] + 16), v2, a1[6], v5, v3);
  }
}

void sub_1B50026F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B500270C(uint64_t a1, void *a2)
{
}

void sub_1B500271C(uint64_t a1, void *a2)
{
}

void sub_1B500272C(void *a1)
{
  uint64_t v4 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v5 = a1[4];
  if (v5) {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[5] + 16), v2, a1[6], v5, v3);
  }
}

void sub_1B5002864(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B50028FC;
  v5[3] = &unk_1E60BB9F0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_sync(v2, v5);
}

void sub_1B50028FC(uint64_t a1)
{
  uint64_t v4 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 40) + 16), v2, 0, v5, v3);
  }
}

void sub_1B5002A10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B5002A84;
  block[3] = &unk_1E60BB768;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_1B5002A84(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 16), v3, v4, v5, v6);
}

void sub_1B5002B94(uint64_t *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  if (a1[4])
  {
    uint64_t v3 = (void *)MEMORY[0x1BA995F60](a1[6]);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[5] + 32), v4, (uint64_t)v3, a1[4], v5);
  }
}

uint64_t sub_1B5002D10(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1BA995F60](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1B5002D3C(uint64_t a1)
{
}

void sub_1B5002D44(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[5] + 32), v2, v6, v3, v4);
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void sub_1B5002E20(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 32), v3, v4, v5, v6);
}

void sub_1B5002F0C(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (objc_msgSend_invalidated(*(void **)(a1 + 32), v2, v3, v4, v5))
  {
    objc_sync_exit(obj);
  }
  else
  {
    objc_msgSend_setInvalidated_(*(void **)(a1 + 32), v6, 1, v7, v8);
    objc_sync_exit(obj);

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(NSObject **)(v9 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B5003054;
    block[3] = &unk_1E60BB768;
    void block[4] = v9;
    dispatch_sync(v10, block);
    objc_msgSend_setInterruptionHandler_(*(void **)(a1 + 32), v11, 0, v12, v13);
    uint64_t v18 = objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v14, v15, v16, v17);

    if (v18)
    {
      objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v19, v20, v21, v22);
      uint64_t v23 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v23[2]();
    }
    objc_msgSend_setInvalidationHandler_(*(void **)(a1 + 32), v19, 0, v21, v22, obj);
  }
}

void sub_1B5003040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1B5003054(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 32), v3, v4, v5, v6);
}

void sub_1B50032C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B50032DC(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1[4] + 40), v3, a1[5], v4, v5);
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 40), v9, 0, a1[5], v10);
}

void sub_1B5003634(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = (void *)MEMORY[0x1BA995F60](a1[6]);
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1[4] + 40), v4, (uint64_t)v3, a1[5], v5);
}

uint64_t sub_1B5003698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel___acknowledgeEventWithUUID_, *(void *)(a1 + 40), a4, a5);
}

void sub_1B50036A4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 40), v3, 0, *(void *)(a1 + 40), v4);
}

void sub_1B50036F0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  objc_msgSend___receivedEvent_(*(void **)(a1 + 32), v3, *(void *)(a1 + 40), v4, v5);
}

void sub_1B5003958(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  id v6 = a3;
  if (objc_msgSend_isMonitoringEvents(v6, v7, v8, v9, v10))
  {
    clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v11 = CWFGetOSLog();
    if (v11)
    {
      uint64_t v12 = CWFGetOSLog();
    }
    else
    {
      uint64_t v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_eventHandler(v6, v14, v15, v16, v17);
    uint64_t v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      uint64_t v23 = objc_msgSend_copy(a2, v18, v19, v20, v21);
      ((void (**)(void, id, void *))v22)[2](v22, v6, v23);
    }
  }
}

void sub_1B5003B44(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1BA995D10]();
  id v4 = a2;
  uint64_t v5 = CWFGetOSLog();
  if (v5)
  {
    id v6 = CWFGetOSLog();
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_restartEventMonitoring(v4, v8, v9, v10, v11);
}

void sub_1B5003EC8(uint64_t a1)
{
  id v6 = (void *)MEMORY[0x1BA995D10]();
  id v7 = *(unsigned char **)(a1 + 32);
  if (v7[32]) {
    objc_msgSend___startEventMonitoring(v7, v2, v3, v4, v5);
  }
}

void sub_1B5003F88(uint64_t a1)
{
  id v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 32))
  {
    *(unsigned char *)(v7 + 32) = 1;
    objc_msgSend___startEventMonitoring(*(void **)(a1 + 32), v2, v3, v4, v5);
  }
}

void sub_1B5004054(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 32))
  {
    *(unsigned char *)(v3 + 32) = 0;
    SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), 0, 0);
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), 0);
  }
}

void sub_1B5004170(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 32);
}

void sub_1B50086EC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  id v6 = a3;
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v7 = CWFGetOSLog();
  if (v7)
  {
    uint64_t v8 = CWFGetOSLog();
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    long long v28 = objc_msgSend_interfaceName(v6, v10, v11, v12, v13);
    _os_log_send_and_compose_impl();
  }
  if (objc_msgSend_isMonitoringEvents(v6, v14, v15, v16, v17))
  {
    objc_msgSend_eventHandler(v6, v18, v19, v20, v21);
    long long v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      long long v27 = objc_msgSend_copy(a2, v22, v23, v24, v25);
      ((void (**)(void, id, void *))v26)[2](v26, v6, v27);
    }
  }
}

void sub_1B5008B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5008C04(uint64_t a1)
{
  id v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 32))
  {
    *(unsigned char *)(v7 + 32) = 1;
    objc_msgSend___startEventMonitoring(*(void **)(a1 + 32), v2, v3, v4, v5);
  }
}

void sub_1B5008CD0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 32))
  {
    *(unsigned char *)(v3 + 32) = 0;
    SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), 0, 0);
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), 0);
  }
}

void sub_1B5008DEC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 32);
}

void sub_1B5008F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v6 = (void (*)(uint64_t, uint64_t, uint64_t))off_1EB4B25A8;
  uint64_t v22 = off_1EB4B25A8;
  if (!off_1EB4B25A8)
  {
    uint64_t v7 = sub_1B500952C();
    v20[3] = (uint64_t)dlsym(v7, "EAPOLControlCopyStateAndStatus");
    off_1EB4B25A8 = (_UNKNOWN *)v20[3];
    id v6 = (void (*)(uint64_t, uint64_t, uint64_t))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v6)
  {
    v6(a1, a2, a3);
  }
  else
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10, v11);
    uint64_t v16 = objc_msgSend_stringWithUTF8String_(NSString, v13, (uint64_t)"int soft_EAPOLControlCopyStateAndStatus(const char *, EAPOLControlState *, CFDictionaryRef *)", v14, v15);
    uint64_t v17 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v12, v18, (uint64_t)v16, @"CWFEAP8021X.m", 26, @"%s", v17);

    __break(1u);
  }
}

void sub_1B5009074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B5009398()
{
  if (!qword_1E9D45BE8) {
    qword_1E9D45BE8 = _sl_dlopen();
  }
  return qword_1E9D45BE8;
}

uint64_t sub_1B5009468()
{
  uint64_t result = _sl_dlopen();
  qword_1E9D45BE8 = result;
  return result;
}

void *sub_1B50094DC(uint64_t a1)
{
  uint64_t v2 = sub_1B500952C();
  uint64_t result = dlsym(v2, "EAPOLControlKeyCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1E9D45BF8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1B500952C()
{
  uint64_t v0 = sub_1B5009398();
  if (v0) {
    return (void *)v0;
  }
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v1, v2, v3, v4);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *EAP8021XLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v10, @"CWFEAP8021X.m", 20, @"%s", 0);

  __break(1u);
  free(v12);
  return v5;
}

void *sub_1B50095DC(uint64_t a1)
{
  uint64_t v2 = sub_1B500952C();
  uint64_t result = dlsym(v2, "EAPOLControlCopyStateAndStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1EB4B25A8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B5009AC4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_eventHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_eventHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v12[2](v12, *(void *)(a1 + 40), 1);
  }
}

void sub_1B5009B48(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_eventHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_eventHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v12[2](v12, *(void *)(a1 + 40), 1);
  }
}

void sub_1B500A030(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  if ((objc_msgSend_isActivated(*(void **)(a1 + 32), v3, v4, v5, v6) & 1) == 0)
  {
    switch(*(void *)(*(void *)(a1 + 32) + 40))
    {
      case 1:
        _CFPreferencesSetAccessRestricted();
        break;
      case 3:
      case 5:
        uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8, v9, v10);
        objc_msgSend_addObserver_selector_name_object_(v11, v12, *(void *)(a1 + 32), (uint64_t)sel___ubiquitousKVSChanged_, *MEMORY[0x1E4F28A30], *(void *)(*(void *)(a1 + 32) + 24));

        break;
      case 4:
        _CFPreferencesSetAccessRestricted();
        _CFPreferencesSetFileProtectionClass();
        objc_initWeak(&location, *(id *)(a1 + 32));
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = (int *)(v13 + 32);
        uint64_t v15 = *(NSObject **)(v13 + 8);
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        uint64_t v21 = sub_1B500A258;
        uint64_t v22 = &unk_1E60BD3D0;
        objc_copyWeak(&v23, &location);
        notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", v14, v15, &v19);
        if (MKBDeviceUnlockedSinceBoot())
        {
          *(unsigned char *)(*(void *)(a1 + 32) + 36) = 1;
          CFPreferencesFlushCaches();
          if (notify_is_valid_token(*(_DWORD *)(*(void *)(a1 + 32) + 32)))
          {
            notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 32));
            *(_DWORD *)(*(void *)(a1 + 32) + 32) = -1;
          }
        }
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
        break;
      default:
        break;
    }
    objc_msgSend___synchronize(*(void **)(a1 + 32), v7, v8, v9, v10, v19, v20, v21, v22);
    objc_msgSend_setActivated_(*(void **)(a1 + 32), v16, 1, v17, v18);
  }
}

void sub_1B500A224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B500A258(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *((unsigned char *)WeakRetained + 36) = 1;
  CFPreferencesFlushCaches();
  if (notify_is_valid_token(*((_DWORD *)WeakRetained + 8)))
  {
    notify_cancel(*((_DWORD *)WeakRetained + 8));
    *((_DWORD *)WeakRetained + _Block_object_dispose(&STACK[0x2C0], 8) = -1;
  }
}

void sub_1B500A33C(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 40);
  switch(v8)
  {
    case 5:
      goto LABEL_4;
    case 4:
      if (notify_is_valid_token(*(_DWORD *)(v7 + 32)))
      {
        notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 32));
        *(_DWORD *)(*(void *)(a1 + 32) + 32) = -1;
      }
      break;
    case 3:
LABEL_4:
      uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v2, v3, v4, v5);
      objc_msgSend_removeObserver_name_object_(v9, v10, *(void *)(a1 + 32), *MEMORY[0x1E4F28A30], *(void *)(*(void *)(a1 + 32) + 24));

      break;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(NSObject **)(v11 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500A44C;
  block[3] = &unk_1E60BB768;
  void block[4] = v11;
  dispatch_async(v12, block);
}

void sub_1B500A44C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_invalidationHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
  }
  objc_msgSend_setInvalidationHandler_(*(void **)(a1 + 32), v8, 0, v10, v11);
  objc_msgSend_setEventHandler_(*(void **)(a1 + 32), v13, 0, v14, v15);
}

void sub_1B500A5F0(void *a1)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v6 = a1[4];
  switch(*(void *)(v6 + 40))
  {
    case 1:
      goto LABEL_5;
    case 2:
      CFStringRef v8 = (const __CFString *)a1[5];
      CFStringRef v9 = *(const __CFString **)(v6 + 48);
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFStringRef v11 = @"mobile";
      goto LABEL_6;
    case 3:
    case 5:
      uint64_t v7 = objc_msgSend_objectForKey_(*(void **)(v6 + 24), v2, a1[5], v3, v4);
      goto LABEL_7;
    case 4:
      if (!*(unsigned char *)(v6 + 36))
      {
        int v14 = MKBDeviceUnlockedSinceBoot();
        uint64_t v6 = a1[4];
        if (v14)
        {
          *(unsigned char *)(v6 + 36) = 1;
          CFPreferencesFlushCaches();
          BOOL is_valid_token = notify_is_valid_token(*(_DWORD *)(a1[4] + 32));
          uint64_t v6 = a1[4];
          if (is_valid_token)
          {
            notify_cancel(*(_DWORD *)(v6 + 32));
            *(_DWORD *)(a1[4] + 32) = -1;
            uint64_t v6 = a1[4];
          }
        }
      }
LABEL_5:
      CFStringRef v8 = (const __CFString *)a1[5];
      CFStringRef v9 = *(const __CFString **)(v6 + 48);
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
LABEL_6:
      uint64_t v7 = (uint64_t)CFPreferencesCopyValue(v8, v9, v11, v10);
LABEL_7:
      uint64_t v12 = *(void *)(a1[6] + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v7;

      break;
    default:
      break;
  }
}

void sub_1B500A7F8(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  switch(*(void *)(v7 + 40))
  {
    case 1:
      goto LABEL_5;
    case 2:
      CFStringRef v8 = *(const __CFString **)(a1 + 40);
      CFStringRef v9 = *(const void **)(a1 + 48);
      CFStringRef v10 = *(const __CFString **)(v7 + 48);
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFStringRef v12 = @"mobile";
      goto LABEL_6;
    case 3:
    case 5:
      objc_msgSend_setObject_forKey_(*(void **)(v7 + 24), v2, *(void *)(a1 + 48), *(void *)(a1 + 40), v5);
      break;
    case 4:
      if (!*(unsigned char *)(v7 + 36))
      {
        int v15 = MKBDeviceUnlockedSinceBoot();
        uint64_t v7 = *(void *)(a1 + 32);
        if (v15)
        {
          *(unsigned char *)(v7 + 36) = 1;
          CFPreferencesFlushCaches();
          BOOL is_valid_token = notify_is_valid_token(*(_DWORD *)(*(void *)(a1 + 32) + 32));
          uint64_t v7 = *(void *)(a1 + 32);
          if (is_valid_token)
          {
            notify_cancel(*(_DWORD *)(v7 + 32));
            *(_DWORD *)(*(void *)(a1 + 32) + 32) = -1;
            uint64_t v7 = *(void *)(a1 + 32);
          }
        }
      }
LABEL_5:
      CFStringRef v8 = *(const __CFString **)(a1 + 40);
      CFStringRef v9 = *(const void **)(a1 + 48);
      CFStringRef v10 = *(const __CFString **)(v7 + 48);
      CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
LABEL_6:
      CFPreferencesSetValue(v8, v9, v10, v12, v11);
      break;
    default:
      break;
  }
  if (objc_msgSend_isActivated(*(void **)(a1 + 32), v2, v3, v4, v5))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = *(NSObject **)(v13 + 16);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1B500A9A0;
    void v17[3] = &unk_1E60BB9F0;
    void v17[4] = v13;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(v14, v17);
  }
}

void sub_1B500A9A0(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_eventHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_eventHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    CFStringRef v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v16[0] = *(void *)(a1 + 40);
    int v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v16, 1, v14);
    ((void (**)(void, void *, void))v12)[2](v12, v15, 0);
  }
}

void sub_1B500AAEC(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  switch(*(void *)(v7 + 40))
  {
    case 1:
      goto LABEL_14;
    case 2:
      CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFArrayRef v28 = CFPreferencesCopyKeyList(*(CFStringRef *)(v7 + 48), @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      CFArrayRef v19 = (const __CFArray *)objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);

      if (!v19) {
        goto LABEL_17;
      }
      CFStringRef v33 = *(const __CFString **)(*(void *)(a1 + 32) + 48);
      CFStringRef v34 = @"mobile";
      CFArrayRef v35 = v19;
      CFStringRef v36 = v27;
      break;
    case 3:
    case 5:
      CFStringRef v8 = objc_msgSend_dictionaryRepresentation(*(void **)(v7 + 24), v2, v3, v4, v5);
      uint64_t v13 = objc_msgSend_allKeys(v8, v9, v10, v11, v12);
      id v18 = objc_msgSend_mutableCopy(v13, v14, v15, v16, v17);

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      CFArrayRef v19 = v18;
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v50, (uint64_t)v54, 16);
      if (v21)
      {
        uint64_t v24 = v21;
        uint64_t v25 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v51 != v25) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend_setObject_forKey_(*(void **)(*(void *)(a1 + 32) + 24), v22, 0, *(void *)(*((void *)&v50 + 1) + 8 * i), v23);
          }
          uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v50, (uint64_t)v54, 16);
        }
        while (v24);
      }

      goto LABEL_17;
    case 4:
      if (!*(unsigned char *)(v7 + 36))
      {
        int v46 = MKBDeviceUnlockedSinceBoot();
        uint64_t v7 = *(void *)(a1 + 32);
        if (v46)
        {
          *(unsigned char *)(v7 + 36) = 1;
          CFPreferencesFlushCaches();
          BOOL is_valid_token = notify_is_valid_token(*(_DWORD *)(*(void *)(a1 + 32) + 32));
          uint64_t v7 = *(void *)(a1 + 32);
          if (is_valid_token)
          {
            notify_cancel(*(_DWORD *)(v7 + 32));
            *(_DWORD *)(*(void *)(a1 + 32) + 32) = -1;
            uint64_t v7 = *(void *)(a1 + 32);
          }
        }
      }
LABEL_14:
      CFStringRef v37 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      CFStringRef v38 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFArrayRef v39 = CFPreferencesCopyKeyList(*(CFStringRef *)(v7 + 48), (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      CFArrayRef v19 = (const __CFArray *)objc_msgSend_mutableCopy(v39, v40, v41, v42, v43);

      if (!v19) {
        goto LABEL_17;
      }
      CFStringRef v33 = *(const __CFString **)(*(void *)(a1 + 32) + 48);
      CFArrayRef v35 = v19;
      CFStringRef v34 = v37;
      CFStringRef v36 = v38;
      break;
    default:
      CFArrayRef v19 = 0;
      goto LABEL_17;
  }
  CFPreferencesSetMultiple(0, v35, v33, v34, v36);
LABEL_17:
  if (objc_msgSend_isActivated(*(void **)(a1 + 32), v2, v3, v4, v5))
  {
    uint64_t v44 = *(void *)(a1 + 32);
    uint64_t v45 = *(NSObject **)(v44 + 16);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    void v48[2] = sub_1B500ADF4;
    v48[3] = &unk_1E60BB9F0;
    void v48[4] = v44;
    CFArrayRef v49 = v19;
    dispatch_async(v45, v48);
  }
}

void sub_1B500ADF4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_eventHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_eventHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v12[2](v12, *(void *)(a1 + 40), 0);
  }
}

void sub_1B500AF10(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  switch(*(void *)(v7 + 40))
  {
    case 1:
      goto LABEL_12;
    case 2:
      CFDictionaryRef v22 = *(const __CFDictionary **)(a1 + 40);
      CFStringRef v23 = *(const __CFString **)(v7 + 48);
      CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFStringRef v25 = @"mobile";
      goto LABEL_13;
    case 3:
    case 5:
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      CFStringRef v8 = objc_msgSend_allKeys(*(void **)(a1 + 40), v2, v3, v4, v5);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v32, (uint64_t)v36, 16);
      if (v10)
      {
        uint64_t v14 = v10;
        uint64_t v15 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v8);
            }
            uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            id v18 = *(void **)(*(void *)(a1 + 32) + 24);
            CFArrayRef v19 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v11, v17, v12, v13);
            objc_msgSend_setObject_forKey_(v18, v20, (uint64_t)v19, v17, v21);
          }
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v32, (uint64_t)v36, 16);
        }
        while (v14);
      }

      break;
    case 4:
      if (!*(unsigned char *)(v7 + 36))
      {
        int v28 = MKBDeviceUnlockedSinceBoot();
        uint64_t v7 = *(void *)(a1 + 32);
        if (v28)
        {
          *(unsigned char *)(v7 + 36) = 1;
          CFPreferencesFlushCaches();
          BOOL is_valid_token = notify_is_valid_token(*(_DWORD *)(*(void *)(a1 + 32) + 32));
          uint64_t v7 = *(void *)(a1 + 32);
          if (is_valid_token)
          {
            notify_cancel(*(_DWORD *)(v7 + 32));
            *(_DWORD *)(*(void *)(a1 + 32) + 32) = -1;
            uint64_t v7 = *(void *)(a1 + 32);
          }
        }
      }
LABEL_12:
      CFDictionaryRef v22 = *(const __CFDictionary **)(a1 + 40);
      CFStringRef v23 = *(const __CFString **)(v7 + 48);
      CFStringRef v25 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
LABEL_13:
      CFPreferencesSetMultiple(v22, 0, v23, v25, v24);
      break;
    default:
      break;
  }
  if (objc_msgSend_isActivated(*(void **)(a1 + 32), v2, v3, v4, v5))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    CFStringRef v27 = *(NSObject **)(v26 + 16);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1B500B1AC;
    void v30[3] = &unk_1E60BB9F0;
    void v30[4] = v26;
    id v31 = *(id *)(a1 + 40);
    dispatch_async(v27, v30);
  }
}

void sub_1B500B1AC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = objc_msgSend_eventHandler(*(void **)(a1 + 32), v3, v4, v5, v6);

  if (v7)
  {
    objc_msgSend_eventHandler(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_allKeys(*(void **)(a1 + 40), v13, v14, v15, v16);
    ((void (**)(void, void *, void))v12)[2](v12, v17, 0);
  }
}

void sub_1B500B338(uint64_t a1)
{
  uint64_t v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  switch(*(void *)(v7 + 40))
  {
    case 1:
      goto LABEL_5;
    case 2:
      CFStringRef v9 = *(const __CFString **)(v7 + 48);
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFStringRef v11 = @"mobile";
      goto LABEL_6;
    case 3:
    case 5:
      uint64_t v8 = objc_msgSend_dictionaryRepresentation(*(void **)(v7 + 24), v2, v3, v4, v5);
      goto LABEL_7;
    case 4:
      if (!*(unsigned char *)(v7 + 36))
      {
        int v14 = MKBDeviceUnlockedSinceBoot();
        uint64_t v7 = *(void *)(a1 + 32);
        if (v14)
        {
          *(unsigned char *)(v7 + 36) = 1;
          CFPreferencesFlushCaches();
          BOOL is_valid_token = notify_is_valid_token(*(_DWORD *)(*(void *)(a1 + 32) + 32));
          uint64_t v7 = *(void *)(a1 + 32);
          if (is_valid_token)
          {
            notify_cancel(*(_DWORD *)(v7 + 32));
            *(_DWORD *)(*(void *)(a1 + 32) + 32) = -1;
            uint64_t v7 = *(void *)(a1 + 32);
          }
        }
      }
LABEL_5:
      CFStringRef v9 = *(const __CFString **)(v7 + 48);
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
LABEL_6:
      uint64_t v8 = (uint64_t)CFPreferencesCopyMultiple(0, v9, v11, v10);
LABEL_7:
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v8;

      break;
    default:
      break;
  }
}

void sub_1B500B6C8(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend___synchronize(*(void **)(a1 + 32), v3, v4, v5, v6);
}

void sub_1B500CC7C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!objc_msgSend_logRedactionSetting(CWFInterface, a2, a3, a4, a5))
  {
    int has_internal_content = os_variant_has_internal_content();
    unsigned int v6 = sub_1B4F558BC(0);
    char v10 = v6;
    if (has_internal_content) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v6) {
      objc_msgSend_setLogRedactionSetting_(CWFInterface, v7, v6, v8, v9);
    }
    else {
      objc_msgSend_setLogRedactionSetting_(CWFInterface, v7, v11, v8, v9);
    }
    uint64_t v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B500CD5C;
    block[3] = &unk_1E60BD418;
    char v14 = has_internal_content;
    char v15 = v10;
    dispatch_async(v12, block);
  }
}

void sub_1B500CD5C(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  int v3 = sub_1B4F556C8();
  uint64_t v4 = CWFGetOSLog();
  if (v4)
  {
    uint64_t v5 = CWFGetOSLog();
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    _os_log_send_and_compose_impl();
  }

  if (!*(unsigned char *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 33)) {
      int v10 = 0;
    }
    else {
      int v10 = v3;
    }
    if (v10 == 1) {
      objc_msgSend_setLogRedactionSetting_(CWFInterface, v7, 1, v8, v9);
    }
  }
}

void sub_1B500D128(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1BA995D10]();
  id v6 = a3;
  clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v7 = CWFGetOSLog();
  if (v7)
  {
    uint64_t v8 = CWFGetOSLog();
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = objc_msgSend_interfaceName(v6, v10, v11, v12, v13);
    _os_log_send_and_compose_impl();
  }
  if (objc_msgSend_isMonitoringEvents(v6, v14, v15, v16, v17))
  {
    objc_msgSend_eventHandler(v6, v18, v19, v20, v21);
    uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      CFStringRef v27 = objc_msgSend_copy(a2, v22, v23, v24, v25);
      ((void (**)(void, id, void *))v26)[2](v26, v6, v27);
    }
  }
}

void sub_1B500D33C(uint64_t a1, void *a2)
{
  int v3 = (void *)MEMORY[0x1BA995D10]();
  id v4 = a2;
  uint64_t v5 = CWFGetOSLog();
  if (v5)
  {
    id v6 = CWFGetOSLog();
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    _os_log_send_and_compose_impl();
  }

  objc_msgSend_restartEventMonitoring(v4, v8, v9, v10, v11);
}

void sub_1B500D660(uint64_t a1)
{
  id v6 = (void *)MEMORY[0x1BA995D10]();
  id v7 = *(unsigned char **)(a1 + 32);
  if (v7[32]) {
    objc_msgSend___startEventMonitoring(v7, v2, v3, v4, v5);
  }
}

void sub_1B500D720(uint64_t a1)
{
  id v6 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v7 + 32))
  {
    *(unsigned char *)(v7 + 32) = 1;
    objc_msgSend___startEventMonitoring(*(void **)(a1 + 32), v2, v3, v4, v5);
  }
}

void sub_1B500D7EC(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 32))
  {
    *(unsigned char *)(v3 + 32) = 0;
    SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), 0, 0);
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 24), 0);
  }
}

void sub_1B500D908(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA995D10]();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 32);
}

void sub_1B500E558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1B500E57C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)qword_1E9D45C80;
  uint64_t v6 = qword_1E9D45C80;
  if (!qword_1E9D45C80)
  {
    sub_1B50101D0();
    v4[3] = (uint64_t)objc_getClass("HMHomeManager");
    qword_1E9D45C80 = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1B500E66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B500EF2C(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  int v9[2] = sub_1B500EFC0;
  void v9[3] = &unk_1E60BD440;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v10 = v3;
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  objc_msgSend_registerForPrimaryServiceNotificationWith_(v2, v6, (uint64_t)v9, v7, v8);
}

void sub_1B500EFC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = CWFGetOSLog();
    if (v4)
    {
      uint64_t v5 = CWFGetOSLog();
    }
    else
    {
      uint64_t v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend_uniqueIdentifier(*(void **)(a1 + 32), v7, v8, v9, v10);
      objc_msgSend_code(v3, v11, v12, v13, v14);
      _os_log_send_and_compose_impl();
    }
    uint64_t v16 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v21 = objc_msgSend_uniqueIdentifier(*(void **)(a1 + 32), v17, v18, v19, v20);
    objc_msgSend_removeObjectForServieType_withUUID_(v16, v22, v15, (uint64_t)v21, v23);
  }
}

id sub_1B500F258(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1B4F51CCC;
  uint64_t v21 = sub_1B4F51C14;
  id v22 = 0;
  uint64_t v8 = objc_msgSend__serviceQueue(*(void **)(a1 + 32), v4, v5, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B500F3A0;
  block[3] = &unk_1E60BD468;
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v9;
  uint64_t v16 = &v17;
  id v10 = v3;
  dispatch_sync(v8, block);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void sub_1B500F388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B500F3A0(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 40);
    id v14 = *(id *)(a1 + 32);
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v14, v4, @"CWF_ACCESSORY_UUID", v5, v6);
    LODWORD(v3) = objc_msgSend_registerForAccessoryStateChange_withParams_forCWFHMServiceType_(v3, v8, (uint64_t)v7, (uint64_t)v14, 1);

    uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v9, @"CWFHomeKitErrorDomain", (int)v3, 0);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v2, @"CWFHomeKitErrorDomain", -3900, 0);
  }
  return MEMORY[0x1F41817F8]();
}

void sub_1B500FF10(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_set_isHomeInformationAvailable_(*(void **)(a1 + 32), a2, 1, a4, a5);
  uint64_t v6 = CWFGetOSLog();
  if (v6)
  {
    uint64_t v7 = CWFGetOSLog();
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_msgSend__homeManager(*(void **)(a1 + 32), v9, v10, v11, v12);
    uint64_t v18 = objc_msgSend_homes(v13, v14, v15, v16, v17);
    _os_log_send_and_compose_impl();
  }
}

Class sub_1B5010180(uint64_t a1)
{
  sub_1B50101D0();
  Class result = objc_getClass("HMHomeManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1E9D45C80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B50101D0()
{
  if (!qword_1E9D45C88) {
    qword_1E9D45C88 = _sl_dlopen();
  }
}

uint64_t sub_1B50102A0()
{
  uint64_t result = _sl_dlopen();
  qword_1E9D45C88 = result;
  return result;
}

Class sub_1B5010314(uint64_t a1)
{
  sub_1B50101D0();
  Class result = objc_getClass("HMFLocationAuthorization");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB4B2688 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1B5010364(uint64_t a1)
{
  sub_1B50101D0();
  Class result = objc_getClass("HMMutableHomeManagerConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1EB4B2690 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

CWFChannel *sub_1B5010BA8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"CHANNEL", a4, a5);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(a1, v7, @"CHANNEL_FLAGS", v8, v9);
  uint64_t v11 = (void *)v10;
  if (v6) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = objc_alloc_init(CWFChannel);
    uint64_t v18 = objc_msgSend_unsignedIntegerValue(v6, v14, v15, v16, v17);
    objc_msgSend_setChannel_(v13, v19, v18, v20, v21);
    uint64_t v26 = objc_msgSend_intValue(v11, v22, v23, v24, v25);
    objc_msgSend_setFlags_(v13, v27, v26, v28, v29);
  }

  return v13;
}

uint64_t sub_1B5010C64(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"AGE", a4, a5);
  uint64_t v10 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8, v9);

  return v10;
}

uint64_t sub_1B5010CA4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"WPA_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"IE_KEY_WPA_MCIPHER", v7, v8);
  uint64_t v14 = objc_msgSend_unsignedLongLongValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5010D04(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_NETWORK_TYPE", v7, v8);
  uint64_t v14 = objc_msgSend_unsignedIntValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5010D64(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_INTERNET", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5010DC4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_ASRA", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5010E24(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_ESR", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5010E84(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_UESA", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5010EE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_VENTURE_GRP", v7, v8);
  uint64_t v14 = objc_msgSend_integerValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5010F44(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_VENTURE_TYPE", v7, v8);
  uint64_t v14 = objc_msgSend_integerValue(v9, v10, v11, v12, v13);

  return v14;
}

id sub_1B5010FA4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"11U_INTERWORKING_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_HESSID", v7, v8);
  uint64_t v10 = CWFCorrectEthernetAddressString(v9);

  return v10;
}

uint64_t sub_1B5011018(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_UNCONFIGURED", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011078(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_PROVIDES_INTERNET_ACCESS", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B50110D8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_WPS", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011138(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_IAP_OVER_WIFI", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011198(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_24GHZ_WIFI_NETWORKS", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B50111F8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_5GHZ_WIFI_NETWORKS", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011258(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_MFI_CONFIG_V1", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B50112B8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_MFI_HARDWARE_AUTH", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011318(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_SOFTWARE_TOKEN_AUTH", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011378(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_SOFTWARE_CERT_AUTH", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B50113D8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_HOMEKIT", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011438(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_HOMEKIT_V2", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011498(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_AIRPRINT", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B50114F8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_WOW", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011558(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_CARPLAY", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B50115B8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_SECURE_WAC", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011618(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_AIRPLAY", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5011678(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_BUFFERED_AIRPLAY", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

id sub_1B50116D8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_FRIENDLY_NAME", v7, v8);

  return v9;
}

id sub_1B5011734(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_MANUFACTURER_NAME", v7, v8);

  return v9;
}

id sub_1B5011790(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_MODEL_NAME", v7, v8);

  return v9;
}

id sub_1B50117EC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_DISPLAY_NAME", v7, v8);

  return v9;
}

id sub_1B5011848(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_PRIMARY_MAC", v7, v8);
  uint64_t v10 = CWFEthernetAddressStringFromData(v9);

  return v10;
}

id sub_1B50118BC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_BLUETOOTH_MAC", v7, v8);
  uint64_t v10 = CWFEthernetAddressStringFromData(v9);

  return v10;
}

id sub_1B5011930(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"APPLE_DEVICE_IE", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"APPLE_DEVICE_IE_DEVICE_ID", v7, v8);

  return v9;
}

id sub_1B501198C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_ANQPResponse(a1, a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"ANQP_CELL_NETWORK_INFO", v7, v8);

  return v9;
}

id sub_1B50119E0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_ANQPResponse(a1, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"ANQP_NAI_REALM_LIST", v13, v14);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v15;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v16);
        }
        uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v39 + 1) + 8 * i), v19, @"ANQP_NAI_REALM_NAME", v20, v21, (void)v39);
        if (v28) {
          objc_msgSend_addObject_(v6, v25, (uint64_t)v28, v26, v27);
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v22);
  }

  if (objc_msgSend_count(v16, v29, v30, v31, v32)) {
    uint64_t v37 = objc_msgSend_copy(v6, v33, v34, v35, v36);
  }
  else {
    uint64_t v37 = 0;
  }

  return v37;
}

id sub_1B5011B74(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_ANQPResponse(a1, a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"ANQP_ROAMING_CONSORTIUM_OI_LIST", v7, v8);

  return v9;
}

id sub_1B5011BC8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_ANQPResponse(a1, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"ANQP_OPERATOR_NAMES_LIST", v13, v14);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v15;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v16);
        }
        uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*((void *)&v39 + 1) + 8 * i), v19, @"ANQP_OPERATOR_NAME", v20, v21, (void)v39);
        if (v28) {
          objc_msgSend_addObject_(v6, v25, (uint64_t)v28, v26, v27);
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v22);
  }

  if (objc_msgSend_count(v16, v29, v30, v31, v32)) {
    uint64_t v37 = objc_msgSend_copy(v6, v33, v34, v35, v36);
  }
  else {
    uint64_t v37 = 0;
  }

  return v37;
}

id sub_1B5011D5C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_ANQPResponse(a1, a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"ANQP_DOMAIN_NAME_LIST", v7, v8);

  return v9;
}

BOOL sub_1B5011DB0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"MBO_OCE_IE", a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

uint64_t sub_1B5011DEC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_networkFlags(a1, a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_containsObject_(v5, v6, (uint64_t)&unk_1F0DC8418, v7, v8);

  return v9;
}

BOOL sub_1B5011E2C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"FD_CAP_ESS", v7, v8);
  BOOL v10 = v9 != 0;

  return v10;
}

uint64_t sub_1B5011E80(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"FD_CAP_ESS", v7, v8);

  if (v9) {
    uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t sub_1B5011EE8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v6 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  BOOL v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"FD_CAP_PHY_INDEX", v8, v9);
  int v15 = objc_msgSend_unsignedCharValue(v10, v11, v12, v13, v14);

  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(a1, v16, @"CHANNEL_FLAGS", v17, v18);
  char v24 = objc_msgSend_unsignedIntValue(v19, v20, v21, v22, v23);

  switch(v15)
  {
    case 0:
      uint64_t result = 4;
      break;
    case 1:
      if ((v24 & 8) != 0) {
        uint64_t result = 8;
      }
      else {
        uint64_t result = 2;
      }
      break;
    case 2:
      uint64_t result = 16;
      break;
    case 3:
      uint64_t result = 128;
      break;
    case 4:
      uint64_t result = 256;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

id sub_1B5011FE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"SSID", v7, v8);

  return v9;
}

uint64_t sub_1B5012040(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = objc_msgSend_FILSSSID(a1, a2, a3, a4, a5);
  if (v9)
  {
    uint64_t v10 = 0;
    Apple80211CalculateShortSSIDCopy();
  }
  else
  {
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(a1, v6, @"FILS_DISC_INFO", v7, v8);
    int v15 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"SHORT_SSID", v13, v14);
    uint64_t v10 = objc_msgSend_unsignedIntValue(v15, v16, v17, v18, v19);
  }
  return v10;
}

uint64_t sub_1B50120F8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"BEACON_INTERVAL", v7, v8);
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v10, v11, v12, v13);

  return v14;
}

CWFChannel *sub_1B5012158(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v6 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"PRIMARY_CHANNEL_FLAGS", v8, v9);

  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(a1, v11, @"FILS_DISC_INFO", v12, v13);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"PRIMARY_CHANNEL", v16, v17);

  uint64_t v19 = 0;
  if (v10 && v18)
  {
    uint64_t v19 = objc_alloc_init(CWFChannel);
    uint64_t v24 = objc_msgSend_unsignedIntegerValue(v10, v20, v21, v22, v23);
    objc_msgSend_setChannel_(v19, v25, v24, v26, v27);
    uint64_t v32 = objc_msgSend_unsignedIntValue(v18, v28, v29, v30, v31);
    objc_msgSend_setFlags_(v19, v33, v32, v34, v35);
  }

  return v19;
}

id sub_1B501223C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"PRIMARY_CHANNEL_FLAGS", v8, v9);

  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(a1, v11, @"FILS_DISC_INFO", v12, v13);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"PRIMARY_CHANNEL", v16, v17);

  uint64_t v20 = 0;
  if (v10 && v18)
  {
    v22[0] = @"CHANNEL";
    v22[1] = @"CHANNEL_FLAGS";
    v23[0] = v10;
    v23[1] = v18;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v23, (uint64_t)v22, 2);
  }

  return v20;
}

BOOL sub_1B5012354(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_NETWORK_TYPE", v7, v8);
  BOOL v10 = v9 != 0;

  return v10;
}

uint64_t sub_1B50123A8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_NETWORK_TYPE", v7, v8);
  uint64_t v14 = objc_msgSend_unsignedIntValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5012408(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_INTERNET", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5012468(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_ASRA", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B50124C8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_ESR", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5012528(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"FILS_DISC_INFO", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"INTERWORKING_ACCESS_UESA", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t sub_1B5012588(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"PRIVATE_MAC_ADDRESS", a4, a5);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"PRIVATE_MAC_ADDRESS_VALID", v7, v8);
  uint64_t v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

uint64_t CWFSecItemSetPassword(void *a1, void *a2)
{
  return sub_1B4F55108(a1, 0, a2);
}

uint64_t CWFMapDisassocReason(unint64_t a1)
{
  if (a1 > 0x11) {
    return 10;
  }
  else {
    return qword_1B50318C8[a1];
  }
}

void sub_1B501CE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B501D350()
{
  if (!qword_1E9D45C10) {
    qword_1E9D45C10 = _sl_dlopen();
  }
  return qword_1E9D45C10;
}

uint64_t sub_1B501D420()
{
  uint64_t result = _sl_dlopen();
  qword_1E9D45C10 = result;
  return result;
}

void sub_1B501D494(void *a1)
{
  if (!sub_1B501D350())
  {
    BOOL v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v2, v3, v4, v5);
    a1 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)"void *SharingLibrary(void)", v12, v13);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v10, v14, (uint64_t)a1, @"CWFAutoJoinMetric.m", 149, @"%s", 0);

    __break(1u);
    free(v15);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = objc_getClass("SFRemoteHotspotDevice");
  if (*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    qword_1E9D45C20 = *(void *)(*(void *)(a1[4] + 8) + 24);
  }
  else
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8, v9);
    uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)"Class getSFRemoteHotspotDeviceClass(void)_block_invoke", v18, v19);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v16, v21, (uint64_t)v20, @"CWFAutoJoinMetric.m", 150, @"Unable to find class %s", "SFRemoteHotspotDevice");

    __break(1u);
  }
}

void sub_1B501EC7C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  unint64_t v10 = objc_msgSend_integerValue(a2, v6, v7, v8, v9);
  sub_1B4F520D4(v10, v11, v12, v13, v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, (uint64_t)v5, (uint64_t)v17, v16);
}

void sub_1B501EF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B501EF38(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  unint64_t v9 = objc_msgSend_integerValue(a2, v5, v6, v7, v8);
  if (v9 - 44 < 8 || v9 <= 0x3F && ((1 << v9) & 0xC000000000000010) != 0) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += objc_msgSend_unsignedIntegerValue(v14, v10, v11, v12, v13);
  }
}

void sub_1B501F968(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  unint64_t v10 = objc_msgSend_integerValue(a2, v6, v7, v8, v9);
  sub_1B4F520D4(v10, v11, v12, v13, v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, (uint64_t)v5, (uint64_t)v17, v16);
}

void sub_1B502394C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

id sub_1B50239E0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B0]();
}

uint64_t Apple80211BindToInterfaceWithService()
{
  return MEMORY[0x1F4124788]();
}

uint64_t Apple80211CalculateShortSSIDCopy()
{
  return MEMORY[0x1F4124790]();
}

uint64_t Apple80211Close()
{
  return MEMORY[0x1F4124798]();
}

uint64_t Apple80211CopyCurrentNetwork()
{
  return MEMORY[0x1F41247A0]();
}

uint64_t Apple80211CopyValue()
{
  return MEMORY[0x1F41247B0]();
}

uint64_t Apple80211Get()
{
  return MEMORY[0x1F41247C8]();
}

uint64_t Apple80211GetIfListCopy()
{
  return MEMORY[0x1F41247D8]();
}

uint64_t Apple80211GetPower()
{
  return MEMORY[0x1F41247E0]();
}

uint64_t Apple80211GetVirtualIfListCopy()
{
  return MEMORY[0x1F41247E8]();
}

uint64_t Apple80211MaxLinkSpeed()
{
  return MEMORY[0x1F41247F0]();
}

uint64_t Apple80211Open()
{
  return MEMORY[0x1F41247F8]();
}

uint64_t Apple80211ParseAppleSWAPIE()
{
  return MEMORY[0x1F4124800]();
}

uint64_t Apple80211RawEventMonitoringInit()
{
  return MEMORY[0x1F4124810]();
}

uint64_t Apple80211RawGet()
{
  return MEMORY[0x1F4124818]();
}

uint64_t Apple80211RawStartMonitoringEventAll()
{
  return MEMORY[0x1F4124828]();
}

uint64_t Apple80211Set()
{
  return MEMORY[0x1F4124830]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7478](url);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
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

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

uint64_t CFPreferencesFlushCaches()
{
  return MEMORY[0x1F40D7ED8]();
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFDateRef DHCPInfoGetLeaseExpirationTime(CFDictionaryRef info)
{
  return (CFDateRef)MEMORY[0x1F4101D50](info);
}

CFDateRef DHCPInfoGetLeaseStartTime(CFDictionaryRef info)
{
  return (CFDateRef)MEMORY[0x1F4101D58](info);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1F40E8EF0](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F78](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1F40E9158](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1F40E91C8](*(void *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1F40E9238](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

uint64_t IPConfigurationForgetNetwork()
{
  return MEMORY[0x1F4124C80]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1F412A6A0]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1F412A6D0]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1F412A760]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1F412A790]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

CFDictionaryRef SCDynamicStoreCopyDHCPInfo(SCDynamicStoreRef store, CFStringRef serviceID)
{
  return (CFDictionaryRef)MEMORY[0x1F4101D80](store, serviceID);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DD8](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return (CFStringRef)MEMORY[0x1F4101DE0](allocator, domain);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DF0](allocator, domain, serviceID, entity);
}

uint64_t SCDynamicStoreSetDisconnectCallBack()
{
  return MEMORY[0x1F4101E00]();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x1F4101E68]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101E78](interface);
}

CFStringRef SCNetworkInterfaceGetHardwareAddressString(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101E90](interface);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1F4101E98](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101EA0](interface);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101F28](target, queue);
}

SCNetworkServiceRef SCNetworkServiceCopy(SCPreferencesRef prefs, CFStringRef serviceID)
{
  return (SCNetworkServiceRef)MEMORY[0x1F4101F40](prefs, serviceID);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return MEMORY[0x1F4101F70](service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1F4101F78](service);
}

CFStringRef SCNetworkServiceGetName(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x1F4101F80](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x1F4101F88](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x1F4101FC0](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x1F4101FC8](set);
}

CFArrayRef SCNetworkSetGetServiceOrder(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x1F4101FD0](set);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1F4101FF8](allocator, name, prefsID);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x1F40F6D48](code, *(void *)&flags, information);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1F40F6D68](*(void *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1F40F7120](path, *(void *)&flags, staticCode);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1F40C9AB0](aBlock);
}

uint64_t _CFPreferencesSetAccessRestricted()
{
  return MEMORY[0x1F40D8FA8]();
}

uint64_t _CFPreferencesSetFileProtectionClass()
{
  return MEMORY[0x1F40D8FC8]();
}

uint64_t _NETRBClientAddHost()
{
  return MEMORY[0x1F4130808]();
}

uint64_t _NETRBClientCreateInternal()
{
  return MEMORY[0x1F4130818]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x1F4130820]();
}

uint64_t _NETRBClientGetGlobalServiceState()
{
  return MEMORY[0x1F4130838]();
}

uint64_t _NETRBClientIsAllowedMoreHost()
{
  return MEMORY[0x1F4130840]();
}

uint64_t _NETRBClientRemoveHost()
{
  return MEMORY[0x1F4130848]();
}

uint64_t _NETRBClientSetHostCount()
{
  return MEMORY[0x1F4130850]();
}

uint64_t _NETRBClientStartService()
{
  return MEMORY[0x1F4130858]();
}

uint64_t _NETRBClientStopService()
{
  return MEMORY[0x1F4130860]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1F40D9630]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t convertApple80211ReturnToString()
{
  return MEMORY[0x1F4124838]();
}

uint64_t convertBssidChangedReasonToString()
{
  return MEMORY[0x1F4124840]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return (ether_addr *)MEMORY[0x1F40CBF70](a1);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return (char *)MEMORY[0x1F40CBF78](a1);
}

void free(void *a1)
{
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1F40CC650](a1);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint64_t mrc_cached_local_records_inquiry_activate()
{
  return MEMORY[0x1F4181110]();
}

uint64_t mrc_cached_local_records_inquiry_create()
{
  return MEMORY[0x1F4181118]();
}

uint64_t mrc_cached_local_records_inquiry_invalidate()
{
  return MEMORY[0x1F4181120]();
}

uint64_t mrc_cached_local_records_inquiry_set_queue()
{
  return MEMORY[0x1F4181128]();
}

uint64_t mrc_cached_local_records_inquiry_set_result_handler()
{
  return MEMORY[0x1F4181130]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8C0](audittoken, buffer, *(void *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEA70](xarray, index);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}