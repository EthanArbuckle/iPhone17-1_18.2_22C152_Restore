void sub_22B2848B0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  double Seconds;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  CMTime v58;
  __CFString *v59;
  void *v60;
  uint64_t v61;
  void v62[2];

  v62[1] = *MEMORY[0x263EF8340];
  v8 = objc_msgSend_status(*(void **)(a1 + 32), a2, a3, a4, a5, a6, a7);
  if (v8 == 5)
  {
    if (IMOSLoggingEnabled())
    {
      v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        LOWORD(v58.value) = 0;
        _os_log_impl(&dword_22B280000, v42, OS_LOG_TYPE_INFO, "Export canceled", (uint8_t *)&v58, 2u);
      }
    }
    v32 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v39, @"__kIMTranscodeErrorDomain", -6, 0, v40, v41);
    goto LABEL_13;
  }
  if (v8 == 4)
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v22 = objc_msgSend_error(*(void **)(a1 + 32), v16, v17, v18, v19, v20, v21);
        LODWORD(v58.value) = 138412290;
        *(CMTimeValue *)((char *)&v58.value + 4) = (CMTimeValue)v22;
        _os_log_impl(&dword_22B280000, v15, OS_LOG_TYPE_INFO, "Export failed: %@", (uint8_t *)&v58, 0xCu);
      }
    }
    v23 = (void *)MEMORY[0x263F087E8];
    v61 = *MEMORY[0x263F08608];
    v24 = objc_msgSend_error(*(void **)(a1 + 32), v9, v10, v11, v12, v13, v14);
    v62[0] = v24;
    v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)v62, (uint64_t)&v61, 1, v26, v27);
    v32 = objc_msgSend_errorWithDomain_code_userInfo_(v23, v29, @"__kIMTranscodeErrorDomain", -4, (uint64_t)v28, v30, v31);

LABEL_13:
    v43 = 0;
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      LOWORD(v58.value) = 0;
      _os_log_impl(&dword_22B280000, v50, OS_LOG_TYPE_INFO, "Export succeeded!", (uint8_t *)&v58, 2u);
    }
  }
  v43 = objc_msgSend_outputURL(*(void **)(a1 + 32), v44, v45, v46, v47, v48, v49);
  v32 = 0;
LABEL_19:
  if (*(void *)(a1 + 40))
  {
    v59 = @"Duration";
    v51 = NSNumber;
    Seconds = *(double *)(a1 + 48);
    if (Seconds < 2.22044605e-16)
    {
      v58 = *(CMTime *)(a1 + 56);
      Seconds = CMTimeGetSeconds(&v58);
    }
    v53 = objc_msgSend_numberWithDouble_(v51, v33, v34, v35, v36, v37, v38, Seconds);
    v60 = v53;
    v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v54, (uint64_t)&v60, (uint64_t)&v59, 1, v55, v56);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_22B284F50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22B284F60(uint64_t a1)
{
}

void sub_22B284F68(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_status(*(void **)(a1 + 32), a2, a3, a4, a5, a6, a7);
  if (v8 == 5)
  {
    if (IMOSLoggingEnabled())
    {
      v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v38, OS_LOG_TYPE_INFO, "mpeg4 conversion canceled", buf, 2u);
      }
    }
    uint64_t v39 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v35, @"__kIMTranscodeErrorDomain", -6, 0, v36, v37);
    uint64_t v40 = *(void *)(a1 + 56);
    goto LABEL_18;
  }
  if (v8 != 4)
  {
    if (IMOSLoggingEnabled())
    {
      v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v47, OS_LOG_TYPE_INFO, "mpeg4 conversion succeeded!", buf, 2u);
      }
    }
    uint64_t v39 = objc_msgSend_outputURL(*(void **)(a1 + 32), v41, v42, v43, v44, v45, v46);
    uint64_t v40 = *(void *)(a1 + 64);
LABEL_18:
    uint64_t v48 = *(void *)(v40 + 8);
    v24 = *(void **)(v48 + 40);
    *(void *)(v48 + 40) = v39;
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend_error(*(void **)(a1 + 32), v16, v17, v18, v19, v20, v21);
      *(_DWORD *)buf = 138412290;
      v74 = v22;
      _os_log_impl(&dword_22B280000, v15, OS_LOG_TYPE_INFO, "mpeg4 conversion failed: %@", buf, 0xCu);
    }
  }
  v23 = (void *)MEMORY[0x263F087E8];
  uint64_t v71 = *MEMORY[0x263F08608];
  v24 = objc_msgSend_error(*(void **)(a1 + 32), v9, v10, v11, v12, v13, v14);
  v72 = v24;
  v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)&v72, (uint64_t)&v71, 1, v26, v27);
  uint64_t v32 = objc_msgSend_errorWithDomain_code_userInfo_(v23, v29, @"__kIMTranscodeErrorDomain", -4, (uint64_t)v28, v30, v31);
  uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8);
  v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v32;

LABEL_19:
  if (*(void *)(a1 + 48))
  {
    id v55 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v56 = NSNumber;
    v57 = *(void **)(a1 + 40);
    if (v57) {
      objc_msgSend_duration(v57, v49, v50, v51, v52, v53, v54);
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    v65 = objc_msgSend_numberWithDouble_(v56, v59, v60, v61, v62, v63, v64, Seconds);
    objc_msgSend_setObject_forKey_(v55, v66, (uint64_t)v65, @"Duration", v67, v68, v69);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_22B286A94(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend__fileSizeForTransfer_(*(void **)(a1 + 32), v10, (uint64_t)v7, v11, v12, v13, v14);
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (*(unsigned char *)(a1 + 80)) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      int v27 = 134218754;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = v17;
      __int16 v31 = 2112;
      id v32 = v7;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_22B280000, v15, OS_LOG_TYPE_INFO, "Transcoding bigSize finished with size %llu removeAlpha %@ path %@ and error %@", (uint8_t *)&v27, 0x2Au);
    }
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v7;
  id v20 = v7;

  uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v9;
  id v23 = v9;

  uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v8;
  id v26 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_22B286C54(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend__fileSizeForTransfer_(*(void **)(a1 + 32), v10, (uint64_t)v7, v11, v12, v13, v14);
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (*(unsigned char *)(a1 + 80)) {
        uint64_t v17 = @"YES";
      }
      else {
        uint64_t v17 = @"NO";
      }
      int v27 = 134218754;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = v17;
      __int16 v31 = 2112;
      id v32 = v7;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_22B280000, v15, OS_LOG_TYPE_INFO, "Transcoding smallSize finished with size %llu removeAlpha %@ path %@ and error %@", (uint8_t *)&v27, 0x2Au);
    }
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v7;
  id v20 = v7;

  uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v8;
  id v23 = v8;

  uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v9;
  id v26 = v9;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void *sub_22B286E14()
{
  result = (void *)MEMORY[0x230F43EF0]("IOSurfaceGetWidth", @"IOSurface");
  off_2683E9528 = result;
  return result;
}

void *sub_22B286E44()
{
  result = (void *)MEMORY[0x230F43EF0]("IOSurfaceGetHeight", @"IOSurface");
  off_2683E9538 = result;
  return result;
}

void *sub_22B286E74()
{
  result = (void *)MEMORY[0x230F43EF0]("IOSurfaceGetBaseAddress", @"IOSurface");
  off_2683E9548 = result;
  return result;
}

void *sub_22B286EA4()
{
  result = (void *)MEMORY[0x230F43EF0]("IOSurfaceLock", @"IOSurface");
  off_2683E9558 = result;
  return result;
}

void *sub_22B286ED4()
{
  result = (void *)MEMORY[0x230F43EF0]("IOSurfaceUnlock", @"IOSurface");
  off_2683E9568 = result;
  return result;
}

void sub_22B28B714(uint64_t a1, const __CFString *a2, const __CFDictionary *a3)
{
}

id sub_22B28CAE4(CGImageSource *a1, unint64_t a2, double a3, double a4)
{
  v329[1] = *MEMORY[0x263EF8340];
  double v4 = ceil(a3);
  double v5 = ceil(a4);
  if (v4 >= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  if (v6 <= 1.84467441e19) {
    double v7 = v6;
  }
  else {
    double v7 = 1.84467441e19;
  }
  size_t Count = CGImageSourceGetCount(a1);
  id v9 = objc_alloc(MEMORY[0x263EFF980]);
  v311 = objc_msgSend_initWithCapacity_(v9, v10, Count, v11, v12, v13, v14);
  if (Count)
  {
    size_t v18 = 0;
    uint64_t v19 = *MEMORY[0x263F0F620];
    id v20 = (const void *)*MEMORY[0x263F0F370];
    uint64_t v21 = (const void *)*MEMORY[0x263F0F390];
    v22 = (const void *)*MEMORY[0x263F0F368];
    uint64_t v23 = MEMORY[0x263EFFA88];
    do
    {
      LODWORD(valuePtr) = 0;
      v329[0] = v19;
      *(void *)buf = v23;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)buf, (uint64_t)v329, 1, v16, v17);
      CFDictionaryRef v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CFDictionaryRef v25 = CGImageSourceCopyPropertiesAtIndex(a1, v18, v24);

      if (v25)
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v25, v20);
        CFDictionaryRef v27 = Value;
        if (Value)
        {
          CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(Value, v21);
          if (v28 || (CFNumberRef v28 = (const __CFNumber *)CFDictionaryGetValue(v27, v22)) != 0) {
            CFNumberGetValue(v28, kCFNumberFloatType, &valuePtr);
          }
        }
        CFRelease(v25);
        float v29 = *(float *)&valuePtr;
      }
      else
      {
        float v29 = 0.0;
      }
      if (v29 >= 0.011) {
        float v30 = v29;
      }
      else {
        float v30 = 0.1;
      }
      id v31 = objc_alloc(NSNumber);
      v38 = objc_msgSend_initWithDouble_(v31, v32, v33, v34, v35, v36, v37, v30);
      objc_msgSend_addObject_(v311, v39, (uint64_t)v38, v40, v41, v42, v43);

      ++v18;
    }
    while (Count != v18);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = Count;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v311;
      _os_log_impl(&dword_22B280000, v44, OS_LOG_TYPE_INFO, "GIF wanted %zu durations. Generated: %@.", buf, 0x16u);
    }
  }
  size_t v45 = CGImageSourceGetCount(a1);
  id v46 = objc_alloc(MEMORY[0x263EFF980]);
  v312 = objc_msgSend_initWithCapacity_(v46, v47, v45, v48, v49, v50, v51);
  id v52 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  objc_msgSend_setName_(v52, v53, @"IMTranscoderAgent _GIFCreateFrameGenerationBlocksForImageSource source frame cache", v54, v55, v56, v57);
  objc_msgSend_setCountLimit_(v52, v58, v45, v59, v60, v61, v62);
  unint64_t v63 = (unint64_t)v7;
  size_t Width = 0;
  if (v45)
  {
    for (uint64_t i = 0; i != v45; ++i)
    {
      id v66 = v52;
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_22B292FE4;
      *(void *)&buf[24] = &unk_26488EA30;
      *(void *)&buf[32] = v66;
      uint64_t v326 = i;
      unint64_t v327 = (unint64_t)v7;
      v328 = a1;
      v73 = (uint64_t (**)(void))objc_msgSend_copy(buf, v67, v68, v69, v70, v71, v72);

      if (!Width)
      {
        v74 = (CGImage *)v73[2](v73);
        uint64_t v75 = v74;
        if (v74)
        {
          size_t Width = CGImageGetWidth(v74);
          size_t Height = CGImageGetHeight(v75);
          if (Width <= Height) {
            size_t Width = Height;
          }
          CFRelease(v75);
        }
        else
        {
          size_t Width = 0;
        }
      }
      v77 = (void *)MEMORY[0x230F44340](v73);
      objc_msgSend_addObject_(v312, v78, (uint64_t)v77, v79, v80, v81, v82);
    }
  }

  uint64_t v309 = objc_msgSend_count(v312, v83, v84, v85, v86, v87, v88);
  if (IMOSLoggingEnabled())
  {
    v89 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = Width;
      _os_log_impl(&dword_22B280000, v89, OS_LOG_TYPE_INFO, "Real width is: %d", buf, 8u);
    }
  }
  v308 = 0;
  double v90 = (float)Width;
  if (Width >= v63) {
    double v91 = v4;
  }
  else {
    double v91 = (float)Width;
  }
  if (Width >= v63) {
    double v90 = v5;
  }
  float v302 = (float)(unint64_t)v309;
  unint64_t v318 = v309 - 1;
  uint64_t v319 = 0;
  key = (void *)*MEMORY[0x263F0F4F8];
  v305 = (void *)*MEMORY[0x263F0F4F0];
  double v300 = v90;
  double v301 = v91;
  double v93 = v91 * v90;
  uint64_t v316 = *MEMORY[0x263F0F370];
  uint64_t v304 = *MEMORY[0x263F0F380];
  v307 = (void *)*MEMORY[0x263F1DAD0];
  uint64_t v315 = *MEMORY[0x263F0F368];
  while (1)
  {
    context = (void *)MEMORY[0x230F44180]();
    v100 = objc_msgSend_mutableCopy(v312, v94, v95, v96, v97, v98, v99);
    v107 = objc_msgSend_mutableCopy(v311, v101, v102, v103, v104, v105, v106);
    if (IMOSLoggingEnabled())
    {
      v108 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v309;
        _os_log_impl(&dword_22B280000, v108, OS_LOG_TYPE_INFO, "Trying to create GIF with %d frames", buf, 8u);
      }
    }
    if (v319 <= 0)
    {
      uint64_t v176 = v309 - v319;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v115 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v319;
          _os_log_impl(&dword_22B280000, v115, OS_LOG_TYPE_INFO, "    Need to remove %d frame(s)", buf, 8u);
        }
      }
      uint64_t v116 = v319;
      if (v318 >= 2)
      {
        int v117 = 0;
        int v118 = 1;
        unint64_t v119 = 2;
        float v120 = v302 / (float)(v319 + 1);
        do
        {
          double v121 = (double)((int)v119 - 1);
          if (v121 == floorf(v120))
          {
            v128 = objc_msgSend_objectAtIndex_(v107, v109, v118, v111, v112, v113, v114, v121);
            int v129 = v118;
            if (v118 <= 0) {
              int v129 = objc_msgSend_count(v100, v122, v123, v124, v125, v126, v127);
            }
            uint64_t v130 = v129 - 1;
            v131 = objc_msgSend_objectAtIndex_(v107, v122, v130, v124, v125, v126, v127);
            v132 = NSNumber;
            objc_msgSend_floatValue(v131, v133, v134, v135, v136, v137, v138);
            float v140 = v139;
            objc_msgSend_floatValue(v128, v141, v142, v143, v144, v145, v146);
            *(float *)&double v148 = v140 + v147;
            v155 = objc_msgSend_numberWithFloat_(v132, v149, v150, v151, v152, v153, v154, v148);
            objc_msgSend_replaceObjectAtIndex_withObject_(v107, v156, v130, (uint64_t)v155, v157, v158, v159);
            objc_msgSend_removeObjectAtIndex_(v107, v160, v118, v161, v162, v163, v164);
            objc_msgSend_removeObjectAtIndex_(v100, v165, v118, v166, v167, v168, v169);

            --v118;
            float v120 = (float)(v302 / (float)(v319 + 1)) + v120;
            ++v117;
            uint64_t v116 = v319;
          }
          if (v318 <= v119) {
            break;
          }
          ++v118;
          ++v119;
        }
        while (v116 > v117);
      }
      uint64_t v176 = v309 - v319;
      if (objc_msgSend_count(v100, v109, v110, v111, v112, v113, v114) != v309 - v319) {
        objc_msgSend_removeLastObject(v100, v170, v171, v172, v173, v174, v175);
      }
      if (IMOSLoggingEnabled())
      {
        v177 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
        {
          int v184 = objc_msgSend_count(v100, v178, v179, v180, v181, v182, v183);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v184;
          _os_log_impl(&dword_22B280000, v177, OS_LOG_TYPE_INFO, "    Left with %d frame(s)", buf, 8u);
        }
      }
    }
    double v92 = (double)(unint64_t)v309;
    if (IMOSLoggingEnabled())
    {
      v191 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = (double)v319 / v92;
        _os_log_impl(&dword_22B280000, v191, OS_LOG_TYPE_INFO, "    Removed factor: %f", buf, 0xCu);
      }
    }
    if (v176 <= 5 && v319 || (double)v319 / (double)(unint64_t)v309 > 0.2) {
      break;
    }
    size_t v192 = objc_msgSend_count(v100, v185, v186, v187, v188, v189, v190);
    v329[0] = 0;
    double valuePtr = 0.0;
    CFDictionaryRef v193 = CGImageSourceCopyPropertiesAtIndex(a1, 0, 0);
    CFDictionaryRef v194 = v193;
    if (v193)
    {
      CFNumberRef v195 = (const __CFNumber *)CFDictionaryGetValue(v193, key);
      if (v195) {
        CFNumberGetValue(v195, kCFNumberCGFloatType, v329);
      }
      CFNumberRef v196 = (const __CFNumber *)CFDictionaryGetValue(v194, v305);
      if (v196) {
        CFNumberGetValue(v196, kCFNumberCGFloatType, &valuePtr);
      }
      CFRelease(v194);
      double v197 = *(double *)v329;
      double v198 = valuePtr;
    }
    else
    {
      double v198 = 0.0;
      double v197 = 0.0;
    }
    unint64_t v199 = 3 * vcvtd_n_u64_f64(v93 * (double)v192, 2uLL)
         + a2
         + (unint64_t)(v197 * (v198 + 1.0) + 1293732.0)
         + vcvtd_n_u64_f64(v198 * v197 * (double)v192, 2uLL);
    if (IMOSLoggingEnabled())
    {
      v200 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v199 >> 20;
        _os_log_impl(&dword_22B280000, v200, OS_LOG_TYPE_INFO, "  Projected memory footprint of GIF transcode: %lu megabytes", buf, 0xCu);
      }
    }
    if (v199 < 0x9600001)
    {
      CFDictionaryRef properties = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v204 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v204, OS_LOG_TYPE_INFO, "  Enabling memory efficient GIF encoding", buf, 2u);
        }
      }
      uint64_t v323 = v316;
      uint64_t v321 = v304;
      uint64_t v322 = MEMORY[0x263EFFA80];
      v205 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v201, (uint64_t)&v322, (uint64_t)&v321, 1, v202, v203);
      v324 = v205;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v206, (uint64_t)&v324, (uint64_t)&v323, 1, v207, v208);
      CFDictionaryRef properties = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    v209 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
    objc_msgSend_identifier(v307, v210, v211, v212, v213, v214, v215);
    v216 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v217 = CGImageDestinationCreateWithData(v209, v216, v192, 0);

    if (objc_msgSend_count(properties, v218, v219, v220, v221, v222, v223)) {
      CGImageDestinationSetProperties(v217, properties);
    }
    float v229 = 0.0;
    if (v192)
    {
      for (uint64_t j = 0; v192 != j; ++j)
      {
        objc_msgSend_objectAtIndex_(v100, v224, j, v225, v226, v227, v228);
        v231 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v237 = (CGImage *)v231[2]();
        if (v237)
        {
          v238 = NSDictionary;
          v239 = objc_msgSend_objectAtIndex_(v107, v232, j, v233, v234, v235, v236);
          v245 = objc_msgSend_dictionaryWithObjectsAndKeys_(v238, v240, (uint64_t)v239, v241, v242, v243, v244, v315, 0);

          objc_msgSend_dictionaryWithObject_forKey_(NSDictionary, v246, (uint64_t)v245, v316, v247, v248, v249);
          CFDictionaryRef v250 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CGImageDestinationAddImage(v217, v237, v250);
          CFRelease(v237);
          if (objc_msgSend_length(v209, v251, v252, v253, v254, v255, v256) > a2)
          {
            if (IMOSLoggingEnabled())
            {
              v263 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = j + 1;
                *(_WORD *)&buf[8] = 2048;
                *(void *)&buf[10] = v192;
                _os_log_impl(&dword_22B280000, v263, OS_LOG_TYPE_INFO, "  Bailing on frame %d out of %lu bceause we already exceeded the target data size", buf, 0x12u);
              }
            }
            unint64_t v303 = objc_msgSend_length(v209, v257, v258, v259, v260, v261, v262);
            uint64_t v270 = objc_msgSend_length(v209, v264, v265, v266, v267, v268, v269);

            float v229 = (float)(unint64_t)v270 / (float)(v303 / (j + 1) * v192);
            break;
          }
        }
      }
    }
    CGImageDestinationFinalize(v217);
    BOOL v283 = objc_msgSend_length(v209, v271, v272, v273, v274, v275, v276) > a2 && a2 != 0;
    if (v283)
    {
      if (v229 == 0.0) {
        float v229 = (double)a2 / (double)(unint64_t)objc_msgSend_length(v209, v277, v278, v279, v280, v281, v282);
      }
      float v284 = v229 * (float)v192;
      uint64_t v319 = (uint64_t)(fmax(floorf((float)v192 - v284), 1.0) + (double)v319);
      if (IMOSLoggingEnabled())
      {
        v285 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v285, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&uint8_t buf[4] = v319;
          *(_WORD *)&buf[8] = 2048;
          *(void *)&buf[10] = v192;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v284;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v229;
          _os_log_impl(&dword_22B280000, v285, OS_LOG_TYPE_INFO, "  Didn't fit, updating frames to remove: %d   (count: %lu   extra frames: %f  factorOff: %f)", buf, 0x26u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v286 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v286, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v286, OS_LOG_TYPE_INFO, "  Fits!", buf, 2u);
        }
      }
      v287 = v209;

      v308 = v287;
    }
    if (IMOSLoggingEnabled())
    {
      v288 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
      {
        int v295 = objc_msgSend_length(v209, v289, v290, v291, v292, v293, v294);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v295;
        _os_log_impl(&dword_22B280000, v288, OS_LOG_TYPE_INFO, "Final length was %d", buf, 8u);
      }
    }
    CFRelease(v217);

    if (!v283)
    {
      v297 = v308;
      v298 = v297;
      goto LABEL_132;
    }
  }
  if (IMOSLoggingEnabled())
  {
    v296 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v296, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = (double)v319 / v92;
      _os_log_impl(&dword_22B280000, v296, OS_LOG_TYPE_INFO, "    Removed too many frames (%f), trying to shrink the image", buf, 0xCu);
    }
  }
  v298 = sub_22B28CAE4(a1, a2, v301 * 0.85, v300 * 0.85);

  v297 = v308;
LABEL_132:

  return v298;
}

id sub_22B292228(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = objc_msgSend_longValue(v3, v4, v5, v6, v7, v8, v9);
  uint64_t v11 = v3;
  if (v10 > *(int *)(a1 + 40)) {
    uint64_t v11 = *(void **)(a1 + 32);
  }
  id v12 = v11;

  return v12;
}

const void *sub_22B292FE4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, *(void *)(a1 + 40), a4, a5, a6, a7);
  ThumbnailAtIndex = (const void *)objc_msgSend_objectForKey_(v8, v10, (uint64_t)v9, v11, v12, v13, v14);

  if (ThumbnailAtIndex)
  {
    CFRetain(ThumbnailAtIndex);
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x263EFF9A0]);
    v22 = objc_msgSend_initWithCapacity_(v16, v17, 3, v18, v19, v20, v21);
    uint64_t v23 = MEMORY[0x263EFFA88];
    objc_msgSend_setObject_forKey_(v22, v24, MEMORY[0x263EFFA88], *MEMORY[0x263F0F5A8], v25, v26, v27);
    uint64_t v33 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v28, *(void *)(a1 + 48), v29, v30, v31, v32);
    objc_msgSend_setObject_forKey_(v22, v34, (uint64_t)v33, *MEMORY[0x263F0F638], v35, v36, v37);

    objc_msgSend_setObject_forKey_(v22, v38, v23, *MEMORY[0x263F0F5B8], v39, v40, v41);
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(*(CGImageSourceRef *)(a1 + 56), *(void *)(a1 + 40), (CFDictionaryRef)v22);
    if (ThumbnailAtIndex)
    {
      v47 = *(void **)(a1 + 32);
      uint64_t v48 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v42, *(void *)(a1 + 40), v43, v44, v45, v46);
      objc_msgSend_setObject_forKey_(v47, v49, (uint64_t)ThumbnailAtIndex, (uint64_t)v48, v50, v51, v52);
    }
  }
  return ThumbnailAtIndex;
}

void sub_22B293128(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22B294900(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22B2947FCLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_22B295298(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22B2952A8(uint64_t a1)
{
}

void sub_22B2952B0(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v12 = a3;
  if (!v12)
  {
    uint64_t v14 = objc_msgSend_bestTranscription(v5, v6, v7, v8, v9, v10, v11);
    uint64_t v21 = v14;
    if (v14)
    {
      v22 = objc_msgSend_formattedString(v14, v15, v16, v17, v18, v19, v20);
      uint64_t v29 = objc_msgSend_length(v22, v23, v24, v25, v26, v27, v28);

      if (v29)
      {
        uint64_t v30 = *(void **)(*(void *)(a1[5] + 8) + 40);
        uint64_t v31 = objc_msgSend_formattedString(v21, v15, v16, v17, v18, v19, v20);
        uint64_t v37 = objc_msgSend_stringByAppendingString_(v30, v32, (uint64_t)v31, v33, v34, v35, v36);
        uint64_t v38 = *(void *)(a1[5] + 8);
        uint64_t v39 = *(void **)(v38 + 40);
        *(void *)(v38 + 40) = v37;

        uint64_t v40 = *(void *)(*(void *)(a1[6] + 8) + 24);
        v47 = objc_msgSend_segments(v21, v41, v42, v43, v44, v45, v46);
        unint64_t v54 = objc_msgSend_count(v47, v48, v49, v50, v51, v52, v53) + v40;

        if (v54 < 0x33)
        {
          uint64_t v57 = objc_msgSend_segments(v21, v15, v16, v17, v18, v19, v20);
          uint64_t v56 = objc_msgSend_count(v57, v58, v59, v60, v61, v62, v63);

          uint64_t v64 = *(void *)(*(void *)(a1[6] + 8) + 24);
          uint64_t v71 = objc_msgSend_segments(v21, v65, v66, v67, v68, v69, v70);
          *(void *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend_count(v71, v72, v73, v74, v75, v76, v77) + v64;

          if (!v56) {
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v55 = *(void *)(a1[6] + 8);
          uint64_t v56 = 50 - *(void *)(v55 + 24);
          *(void *)(v55 + 24) = 50;
          if (!v56) {
            goto LABEL_15;
          }
        }
        for (uint64_t i = 0; i != v56; ++i)
        {
          double v79 = *(double *)(*(void *)(a1[7] + 8) + 24);
          uint64_t v80 = objc_msgSend_segments(v21, v15, v16, v17, v18, v19, v20);
          uint64_t v86 = objc_msgSend_objectAtIndexedSubscript_(v80, v81, i, v82, v83, v84, v85);
          objc_msgSend_confidence(v86, v87, v88, v89, v90, v91, v92);
          *(double *)(*(void *)(a1[7] + 8) + 24) = v79 + v93;
        }
      }
    }
LABEL_15:
    if (objc_msgSend_isFinal(v5, v15, v16, v17, v18, v19, v20))
    {
      objc_msgSend_commitTranscriptionWithString_confidenceSum_numberOfSegments_completion_(IMTranscriptionUtilities, v94, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 24), a1[4], v98, v99, *(double *)(*(void *)(a1[7] + 8) + 24));
    }
    else
    {
      v100 = *(void **)(*(void *)(a1[5] + 8) + 40);
      v101 = objc_msgSend_localizedSeparatorString(IMTranscriptionUtilities, v94, v95, v96, v97, v98, v99);
      uint64_t v107 = objc_msgSend_stringByAppendingString_(v100, v102, (uint64_t)v101, v103, v104, v105, v106);
      uint64_t v108 = *(void *)(a1[5] + 8);
      v109 = *(void **)(v108 + 40);
      *(void *)(v108 + 40) = v107;
    }
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v110 = 138412290;
      id v111 = v12;
      _os_log_impl(&dword_22B280000, v13, OS_LOG_TYPE_INFO, "Transcription failed with error: %@", (uint8_t *)&v110, 0xCu);
    }
  }
  (*(void (**)(void))(a1[4] + 16))();
LABEL_19:
}

uint64_t sub_22B295748()
{
  v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  qword_2683E9578 = objc_msgSend_bundleForClass_(v0, v2, v1, v3, v4, v5, v6);
  return MEMORY[0x270F9A758]();
}

void sub_22B29817C(uint64_t a1, uint64_t a2)
{
}

void sub_22B29818C(uint64_t a1)
{
}

id sub_22B298198(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = objc_msgSend_isFromMe(*(void **)(a1 + 48), a2, a3, a4, a5, a6, a7);
  objc_msgSend_generatedSnapshotForDataURL_contentInset_isFromMe_(v8, v11, v9, v10, v12, v13, v14, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  id result = (id)_UIImageJPEGRepresentation();
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

uint64_t sub_22B298A1C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_fileURLWithPath_(NSURL, a2, (uint64_t)a2, a4, a5, a6, a7);
}

void sub_22B298A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = NSNumber;
      uint64_t v20 = objc_msgSend_length(*(void **)(a1 + 32), v13, v14, v15, v16, v17, v18);
      uint64_t v26 = objc_msgSend_numberWithUnsignedInteger_(v19, v21, v20, v22, v23, v24, v25);
      uint64_t v27 = @"NO";
      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v29 = *(void *)(a1 + 48);
      if (a5) {
        uint64_t v30 = @"YES";
      }
      else {
        uint64_t v30 = @"NO";
      }
      int v31 = 138414082;
      if (a6) {
        uint64_t v27 = @"YES";
      }
      uint64_t v32 = v26;
      __int16 v33 = 2112;
      uint64_t v34 = v28;
      __int16 v35 = 2112;
      uint64_t v36 = a2;
      __int16 v37 = 2112;
      uint64_t v38 = a4;
      __int16 v39 = 2112;
      uint64_t v40 = v30;
      __int16 v41 = 2112;
      uint64_t v42 = v27;
      __int16 v43 = 2112;
      uint64_t v44 = a3;
      __int16 v45 = 2112;
      uint64_t v46 = v29;
      _os_log_impl(&dword_22B280000, v12, OS_LOG_TYPE_INFO, "output trying to generate fallback for data %@ inFileURL %@ outputURLs %@ error %@ success %@ attemptedTranscode %@ text %@ attachments %@", (uint8_t *)&v31, 0x52u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
}

void sub_22B298BE8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = NSNumber;
      uint64_t v18 = objc_msgSend_length(*(void **)(a1 + 32), v11, v12, v13, v14, v15, v16);
      uint64_t v24 = objc_msgSend_numberWithUnsignedInteger_(v17, v19, v18, v20, v21, v22, v23);
      uint64_t v25 = @"NO";
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = *(void *)(a1 + 48);
      if (a4) {
        uint64_t v28 = @"YES";
      }
      else {
        uint64_t v28 = @"NO";
      }
      int v29 = 138413826;
      if (a5) {
        uint64_t v25 = @"YES";
      }
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      uint64_t v32 = v26;
      __int16 v33 = 2112;
      uint64_t v34 = a2;
      __int16 v35 = 2112;
      uint64_t v36 = a3;
      __int16 v37 = 2112;
      uint64_t v38 = v28;
      __int16 v39 = 2112;
      uint64_t v40 = v25;
      __int16 v41 = 2112;
      uint64_t v42 = v27;
      _os_log_impl(&dword_22B280000, v10, OS_LOG_TYPE_INFO, "output trying to generate fallback for data %@ inFileURL %@ outputURLs %@ error %@ success %@ attemptedTranscode %@ attachments %@", (uint8_t *)&v29, 0x48u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
}

void sub_22B298D98(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = @"NO";
      int v15 = 138413058;
      uint64_t v16 = a2;
      if (a4) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      if (a5) {
        uint64_t v11 = @"YES";
      }
      __int16 v17 = 2112;
      uint64_t v18 = a3;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      _os_log_impl(&dword_22B280000, v10, OS_LOG_TYPE_INFO, "got fullquality for data at URLs %@ error %@ success %@ attemptedToGenerateFallback %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 16);
  if (a5) {
    v14(v13, a2);
  }
  else {
    v14(v13, 0);
  }
}

void sub_22B298F04(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      int v12 = 138412802;
      uint64_t v13 = a2;
      __int16 v14 = 2112;
      if (a4) {
        uint64_t v9 = @"YES";
      }
      uint64_t v15 = a3;
      __int16 v16 = 2112;
      __int16 v17 = v9;
      _os_log_impl(&dword_22B280000, v8, OS_LOG_TYPE_INFO, "got fullquality for data at URLs %@ error %@ success %@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 16);
  if (a4) {
    v11(v10, a2);
  }
  else {
    v11(v10, 0);
  }
}

void sub_22B2993B8(uint64_t a1, uint64_t a2)
{
}

void sub_22B2993C8(uint64_t a1)
{
}

void *sub_22B2993D4()
{
  id result = (void *)MEMORY[0x230F43EF0]("PFCreateGIFFromVideoURL", @"PhotosFormats");
  off_2683E9590 = result;
  return result;
}

void sub_22B299404(double a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 134217984;
      double v4 = a1;
      _os_log_impl(&dword_22B280000, v2, OS_LOG_TYPE_INFO, "Converting to GIF progress {progress: %f}", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t sub_22B299504(void *a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      if (a2) {
        uint64_t v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22B280000, v8, OS_LOG_TYPE_INFO, "Finished transcoding GIF {success: %@}", buf, 0xCu);
    }
  }
  uint64_t v10 = a1[5];
  if (!a2) {
    return (*(uint64_t (**)(void, void, void, void, void, uint64_t))(v10 + 16))(a1[5], 0, 0, *(void *)(*(void *)(a1[6] + 8) + 40), 0, 1);
  }
  uint64_t v13 = a1[4];
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v4, (uint64_t)&v13, 1, v5, v6, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v10 + 16))(v10, v11, 0, 0, 1, 1);
}

uint64_t sub_22B299734()
{
  qword_26ACA7218 = objc_alloc_init(IMTranscodingAgentController);
  return MEMORY[0x270F9A758]();
}

void sub_22B29A8C8(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6, char a7, void *a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v25 = a8;
  if (*(void *)(a1 + 32))
  {
    uint64_t v26 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v19, v20, v21, v22, v23, v24);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_22B29AA40;
    v32[3] = &unk_26488EBB8;
    id v38 = *(id *)(a1 + 32);
    id v33 = v15;
    id v34 = v16;
    id v35 = v17;
    id v36 = v18;
    char v39 = a6;
    char v40 = a7;
    id v37 = v25;
    objc_msgSend___im_performBlock_(v26, v27, (uint64_t)v32, v28, v29, v30, v31);
  }
}

uint64_t sub_22B29AA40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(void *)(a1 + 64));
}

void sub_22B29AA64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = objc_msgSend_lastObject(*(void **)(*(void *)(a1 + 32) + 16), a2, a3, a4, a5, a6, a7);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_22B29AB3C;
  v14[3] = &unk_26488EC08;
  uint64_t v11 = *(void *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 40);
  objc_msgSend_transcodeFileTransferContents_utiType_transcoderUserInfo_completionBlock_(v8, v12, v9, v10, v11, (uint64_t)v14, v13);
}

uint64_t sub_22B29AB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, MEMORY[0x263EFFA68], a4, a5, a6, 0);
}

void sub_22B29AB6C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6, char a7, void *a8)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  int v20 = IMOSLoggingEnabled();
  if (a6)
  {
    if (v20)
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v27, OS_LOG_TYPE_INFO, "Main transcoding finished, trying to generate thumbnail", buf, 2u);
      }
    }
    objc_msgSend_transcodeThumbnailFor_target_allSizes_commonCapabilities_maxDimension_transcoderUserInfo_isLQMEnabled_outputURLs_outputContextInfo_attemptedTranscode_additionalOutPutContext_completionBlock_(*(void **)(a1 + 32), v21, *(void *)(a1 + 40), *(void *)(a1 + 88), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 96), *(void *)(a1 + 64), *(unsigned char *)(a1 + 104), v16, v17, a7, v19, *(void *)(a1 + 72));
  }
  else
  {
    if (v20)
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v18;
        _os_log_impl(&dword_22B280000, v28, OS_LOG_TYPE_INFO, "Failed to transcode, error %@", buf, 0xCu);
      }
    }
    uint64_t v29 = _IMTranscoderLinkFile(*(void **)(a1 + 40), v21, v22, v23, v24, v25, v26);
    uint64_t v30 = IMSingleObjectArray();

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

uint64_t sub_22B29AD94(uint64_t a1, const char *a2)
{
  char v3 = *(unsigned char *)(a1 + 120);
  return objc_msgSend_transcodeFileTransfer_utiType_allowUnfilteredUTIs_target_sizes_commonCapabilities_maxDimension_transcoderUserInfo_representations_isLQMEnabled_completionBlock_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 96), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 104), *(void *)(a1 + 80), *(void *)(a1 + 112), v3, *(void *)(a1 + 88));
}

void sub_22B29B4F0(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, uint64_t a7, void *a8)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v46 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = @"NO";
      *(_DWORD *)buf = 138412802;
      if (a6) {
        uint64_t v24 = @"YES";
      }
      uint64_t v48 = v24;
      __int16 v49 = 2112;
      id v50 = v15;
      __int16 v51 = 2112;
      id v52 = v13;
      _os_log_impl(&dword_22B280000, v23, OS_LOG_TYPE_INFO, "Thumbnail generation result: %@, error %@ - %@", buf, 0x20u);
    }
  }
  uint64_t v25 = objc_msgSend_mutableCopy(*(void **)(a1 + 32), v17, v18, v19, v20, v21, v22);
  objc_msgSend_addEntriesFromDictionary_(v25, v26, (uint64_t)v16, v27, v28, v29, v30);
  uint64_t v36 = *(void *)(a1 + 64);
  if (v36)
  {
    uint64_t v37 = *(void *)(a1 + 40);
    id v38 = objc_msgSend_arrayByAddingObjectsFromArray_(*(void **)(a1 + 48), v31, (uint64_t)v13, v32, v33, v34, v35);
    uint64_t v44 = objc_msgSend_arrayByAddingObjectsFromArray_(*(void **)(a1 + 56), v39, (uint64_t)v14, v40, v41, v42, v43);
    (*(void (**)(uint64_t, uint64_t, void *, void *, id, void, void, void *))(v36 + 16))(v36, v37, v38, v44, v15, a6, *(unsigned __int8 *)(a1 + 72), v25);
  }
}

void sub_22B29B8E4(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = @"YES";
      if (!*(unsigned char *)(a1 + 72)) {
        uint64_t v10 = @"NO";
      }
      int v38 = 138412546;
      uint64_t v39 = v9;
      __int16 v40 = 2112;
      uint64_t v41 = v10;
      _os_log_impl(&dword_22B280000, v8, OS_LOG_TYPE_INFO, "Found transcoder to transcode data for balloonBundleID %@ fallback %@", (uint8_t *)&v38, 0x16u);
    }
  }
  uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v2, v3, v4, v5, v6, v7);
  id v16 = objc_msgSend__randomTemporaryPathWithSuffix_fileName_(v11, v12, 0, 0, v13, v14, v15);
  uint64_t v23 = objc_msgSend_stringByDeletingLastPathComponent(v16, v17, v18, v19, v20, v21, v22);

  uint64_t v29 = objc_msgSend_fileURLWithPath_(NSURL, v24, (uint64_t)v23, v25, v26, v27, v28);
  uint64_t v36 = objc_msgSend_lastObject(*(void **)(*(void *)(a1 + 40) + 16), v30, v31, v32, v33, v34, v35);
  objc_msgSend_transcodeFileTransferData_balloonBundleID_attachments_inFileURL_fallBack_completionBlock_(v36, v37, *(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 56), (uint64_t)v29, *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 64));
}

uint64_t sub_22B29C788(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22B29C798(uint64_t a1)
{
}

void sub_22B29C7A0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v13 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      uint64_t v32 = objc_msgSend_copy(v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      id v33 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v32 = objc_msgSend_initWithDomain_code_userInfo_(v33, v34, *MEMORY[0x263F4AE00], 1, 0, v35, v36);
    }
    uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8);
    int v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v32;
  }
  else
  {
    MEMORY[0x230F43EE0](@"BlastDoorVideoPreview", @"BlastDoor");
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v5;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
    uint64_t v22 = objc_msgSend_image(v15, v16, v17, v18, v19, v20, v21);
    uint64_t v29 = objc_msgSend_cgImage(v22, v23, v24, v25, v26, v27, v28);

    int v30 = IMOSLoggingEnabled();
    if (v29)
    {
      if (v30)
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          LOWORD(v42) = 0;
          _os_log_impl(&dword_22B280000, v31, OS_LOG_TYPE_INFO, "Video validation completed successfully", (uint8_t *)&v42, 2u);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else if (v30)
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        int v42 = 138412290;
        uint64_t v43 = 0;
        _os_log_impl(&dword_22B280000, v39, OS_LOG_TYPE_INFO, "Video validation failed: %@", (uint8_t *)&v42, 0xCu);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v42 = 138412290;
      uint64_t v43 = v41;
      _os_log_impl(&dword_22B280000, v40, OS_LOG_TYPE_INFO, "Blastdoor validation completed, err: %@", (uint8_t *)&v42, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_22B29CA50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    MEMORY[0x230F43EE0](@"BlastDoorPreviewAudio", @"BlastDoor");
    if (objc_opt_isKindOfClass()) {
      id v16 = v5;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    uint64_t v24 = objc_msgSend_powerLevels(v17, v18, v19, v20, v21, v22, v23);
    uint64_t v31 = objc_msgSend_count(v24, v25, v26, v27, v28, v29, v30);

    if (v31)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_22B280000, v32, OS_LOG_TYPE_INFO, "Audio validation completed successfully", (uint8_t *)&v40, 2u);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v40 = 138412290;
        uint64_t v41 = v14;
        _os_log_impl(&dword_22B280000, v13, OS_LOG_TYPE_INFO, "Audio validation failed: %@", (uint8_t *)&v40, 0xCu);
      }
    }
    if (v6)
    {
      uint64_t v15 = objc_msgSend_copy(v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      id v33 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v15 = objc_msgSend_initWithDomain_code_userInfo_(v33, v34, *MEMORY[0x263F4AE00], 1, 0, v35, v36);
    }
    uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = *(id *)(v37 + 40);
    *(void *)(v37 + 40) = v15;
  }

  if (IMOSLoggingEnabled())
  {
    int v38 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v40 = 138412290;
      uint64_t v41 = v39;
      _os_log_impl(&dword_22B280000, v38, OS_LOG_TYPE_INFO, "Blastdoor validation completed, err: %@", (uint8_t *)&v40, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_22B29CEB0(uint64_t a1, char a2, void *a3)
{
  id v11 = a3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v12 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v5, v6, v7, v8, v9, v10);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_22B29CF88;
    v18[3] = &unk_26488ED48;
    id v20 = *(id *)(a1 + 32);
    char v21 = a2;
    id v19 = v11;
    objc_msgSend___im_performBlock_(v12, v13, (uint64_t)v18, v14, v15, v16, v17);
  }
}

uint64_t sub_22B29CF88(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t sub_22B29CFA0(void *a1)
{
  return MEMORY[0x270F9A6D0](IMSnapshotTranscoder, sel_generateSnapshotForMessageGUID_payloadURL_balloonBundleID_senderContext_completionBlock_, a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void sub_22B29D180(uint64_t a1, char a2, void *a3, double a4, double a5)
{
  id v15 = a3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v16 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v9, v10, v11, v12, v13, v14);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_22B29D26C;
    v22[3] = &unk_26488ED98;
    id v24 = *(id *)(a1 + 32);
    char v27 = a2;
    double v25 = a4;
    double v26 = a5;
    id v23 = v15;
    objc_msgSend___im_performBlock_(v16, v17, (uint64_t)v22, v18, v19, v20, v21);
  }
}

uint64_t sub_22B29D26C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void sub_22B29D288(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  long long v21 = *MEMORY[0x263F001B0];
  uint64_t v8 = objc_msgSend_sharedInstance(MEMORY[0x263F4B010], a2, a3, a4, a5, a6, a7);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 88);
  v18[0] = *(_OWORD *)(a1 + 72);
  v18[1] = v13;
  uint64_t v19 = *(void *)(a1 + 104);
  id v20 = 0;
  uint64_t v15 = objc_msgSend_generateAndPersistPreviewFromSourceURL_previewURL_senderContext_size_balloonBundleID_previewConstraints_error_(v8, v14, v9, v10, v11, (uint64_t)&v21, v12, v18, &v20);
  id v16 = v20;

  uint64_t v17 = *(void *)(a1 + 64);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id, double, double))(v17 + 16))(v17, v15, v16, *(double *)&v21, *((double *)&v21 + 1));
  }
}

void sub_22B29D4DC(uint64_t a1, char a2, void *a3, double a4, double a5)
{
  id v15 = a3;
  if (*(void *)(a1 + 32))
  {
    id v16 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v9, v10, v11, v12, v13, v14);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_22B29D5C8;
    v22[3] = &unk_26488ED98;
    id v24 = *(id *)(a1 + 32);
    char v27 = a2;
    double v25 = a4;
    double v26 = a5;
    id v23 = v15;
    objc_msgSend___im_performBlock_(v16, v17, (uint64_t)v22, v18, v19, v20, v21);
  }
}

uint64_t sub_22B29D5C8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void sub_22B29D5E4(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v21 = *MEMORY[0x263F001B0];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_22B280000, v8, OS_LOG_TYPE_INFO, "Will generate preview metadata for url %@ dst url %@", buf, 0x16u);
    }
  }
  uint64_t v11 = objc_msgSend_sharedInstance(MEMORY[0x263F4B010], v2, v3, v4, v5, v6, v7);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  id v20 = 0;
  long long v15 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&buf[16] = v15;
  uint64_t v23 = *(void *)(a1 + 96);
  uint64_t v17 = objc_msgSend_generateAndPersistMetadataFromSourceURL_destinationURL_senderContext_size_constraints_error_(v11, v16, v12, v13, v14, (uint64_t)&v21, (uint64_t)buf, &v20);
  id v18 = v20;

  uint64_t v19 = *(void *)(a1 + 56);
  if (v19) {
    (*(void (**)(uint64_t, uint64_t, id, double, double))(v19 + 16))(v19, v17, v18, *(double *)&v21, *((double *)&v21 + 1));
  }
}

void sub_22B29D8D4(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v17 = a5;
  if (*(void *)(a1 + 32))
  {
    id v18 = objc_msgSend_mainThread(MEMORY[0x263F08B88], v11, v12, v13, v14, v15, v16);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_22B29D9F4;
    v24[3] = &unk_26488EE38;
    id v28 = *(id *)(a1 + 32);
    char v29 = a2;
    id v25 = v9;
    id v26 = v10;
    id v27 = v17;
    objc_msgSend___im_performBlock_(v18, v19, (uint64_t)v24, v20, v21, v22, v23);
  }
}

uint64_t sub_22B29D9F4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_22B29DA10(void *a1, const char *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v9 = 0;
  id v10 = 0;
  uint64_t v6 = objc_msgSend_decodeiMessageAppPayload_senderContext_bundleID_outAttachmentURLs_error_(MEMORY[0x263F4B0D0], a2, v3, v4, v5, (uint64_t)&v10, (uint64_t)&v9);
  id v7 = v10;
  id v8 = v9;
  (*(void (**)(void, BOOL, void *, id, id))(a1[7] + 16))(a1[7], v6 != 0, v6, v7, v8);
}

uint64_t sub_22B29DB58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2, a3);
  }
  return result;
}

uint64_t _IMTranscoderLinkFile(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v53 = 0;
  id v8 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, a3, a4, a5, a6, a7);
  PathComponent = objc_msgSend_lastPathComponent(a1, v9, v10, v11, v12, v13, v14);
  uint64_t v22 = objc_msgSend_stringByDeletingPathExtension(PathComponent, v16, v17, v18, v19, v20, v21);
  uint64_t v29 = objc_msgSend_pathExtension(a1, v23, v24, v25, v26, v27, v28);
  uint64_t v35 = objc_msgSend_stringByAppendingPathExtension_(v22, v30, v29, v31, v32, v33, v34);
  uint64_t v41 = objc_msgSend_im_randomTemporaryFileURLWithFileName_(v8, v36, v35, v37, v38, v39, v40);
  uint64_t v48 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v42, v43, v44, v45, v46, v47);
  if (objc_msgSend_copyItemAtURL_toURL_error_(v48, v49, (uint64_t)a1, v41, (uint64_t)&v53, v50, v51)) {
    return v41;
  }
  else {
    return 0;
  }
}

void sub_22B29E6DC(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    uint64_t v3 = [Image_Estimator_HEIF alloc];
    id v9 = objc_msgSend_initWithMLModel_(v3, v4, (uint64_t)v10, v5, v6, v7, v8);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_22B29E994(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  if (v28)
  {
    id v5 = a3;
    uint64_t v6 = [Image_Estimator_HEIFOutput alloc];
    uint64_t v12 = objc_msgSend_featureValueForName_(v28, v7, @"Target Quality Factor", v8, v9, v10, v11);
    objc_msgSend_doubleValue(v12, v13, v14, v15, v16, v17, v18);
    id v25 = (id)objc_msgSend_initWithTarget_Quality_Factor_(v6, v19, v20, v21, v22, v23, v24);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = *(void (**)(uint64_t, void, id))(v26 + 16);
    id v25 = a3;
    v27(v26, 0, v25);
  }
}

void sub_22B29EB54(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  if (v28)
  {
    id v5 = a3;
    uint64_t v6 = [Image_Estimator_HEIFOutput alloc];
    uint64_t v12 = objc_msgSend_featureValueForName_(v28, v7, @"Target Quality Factor", v8, v9, v10, v11);
    objc_msgSend_doubleValue(v12, v13, v14, v15, v16, v17, v18);
    id v25 = (id)objc_msgSend_initWithTarget_Quality_Factor_(v6, v19, v20, v21, v22, v23, v24);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = *(void (**)(uint64_t, void, id))(v26 + 16);
    id v25 = a3;
    v27(v26, 0, v25);
  }
}

void sub_22B29EF14(void *a1)
{
  objc_end_catch();
}

void sub_22B29EF38(void *a1)
{
  objc_end_catch();
}

void sub_22B29EF68()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29EFF0()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29F078()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29F100()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29F188()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29F210()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29F298()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29F320()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29F3A8()
{
  sub_22B293114();
  sub_22B293128(&dword_22B280000, &_os_log_internal, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_22B29F430()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_22B280000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not load Image_Estimator_HEIF.mlmodelc in the bundle resource", v0, 2u);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x270EE20C8](inAudioConverter, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5D68](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x270EF4EC8]();
}

uint64_t CGImageCreateWithWBMPData()
{
  return MEMORY[0x270EF4ED8]();
}

void CGImageDestinationAddAuxiliaryDataInfo(CGImageDestinationRef idst, CFStringRef auxiliaryImageDataType, CFDictionaryRef auxiliaryDataInfoDictionary)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF4FF8](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

uint64_t CGImageSourceIsColorOptimizedForSharing()
{
  return MEMORY[0x270EF5078]();
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

uint64_t CMPhotoDecompressionContainerPredictTranscodedSize()
{
  return MEMORY[0x270F12F68]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x270F12F78]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x270F12F80]();
}

uint64_t CMPhotoJPEGCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x270F12F90]();
}

uint64_t CMPhotoJPEGCreateJPEGFromIOSurface()
{
  return MEMORY[0x270F12F98]();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x270EE7EB8](retstr, start, end);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x270EE2358](inURL, *(void *)&inFileType, inStreamDesc, inChannelLayout, *(void *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x270EE2368](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x270EE2370](inExtAudioFile, *(void *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x270EE2390](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x270EE2398](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x270EE23B8](inExtAudioFile, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x270EE23D8](inExtAudioFile, *(void *)&inNumberFrames, ioData);
}

uint64_t FigCreateIOSurfaceBackedCVPixelBuffer()
{
  return MEMORY[0x270F065F8]();
}

uint64_t IMAVURLAssetOptionsDefault()
{
  return MEMORY[0x270F3CFE8]();
}

uint64_t IMAVURLAssetOptionsWithExtraOptionsForWrite()
{
  return MEMORY[0x270F3CFF0]();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x270F3D000]();
}

uint64_t IMBalloonProviderBundlePaths()
{
  return MEMORY[0x270F3D008]();
}

uint64_t IMCheckVideoURLProperties()
{
  return MEMORY[0x270F3D020]();
}

uint64_t IMImageSourceHasStereoPair()
{
  return MEMORY[0x270F3D058]();
}

uint64_t IMIsAAVideoURL()
{
  return MEMORY[0x270F3D060]();
}

uint64_t IMIsHEVCWithAlphaVideoURL()
{
  return MEMORY[0x270F3D068]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x270F3D078]();
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x270F3CDD0]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x270F3D080]();
}

uint64_t IMMMSRestrictedModeEnabled()
{
  return MEMORY[0x270F3CE00]();
}

uint64_t IMMaxBitDepthForVideo()
{
  return MEMORY[0x270F3D088]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t IMPluginSnapshotCachesFileURL()
{
  return MEMORY[0x270F3D098]();
}

uint64_t IMPreviewConstraintsFromDictionary()
{
  return MEMORY[0x270F3D0A8]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x270F3D0C0]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x270F3CE58]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CEA8]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x270F3CEB0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x270F3CEF8]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x270EE8570](inUTI, inTagClass);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x270EE8588](inUTI1, inUTI2);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x270F06370]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _iMessageTelemetryLogHandle()
{
  return MEMORY[0x270F3D178]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vnegD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x270EDEF28](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageHistogramCalculation_ARGB8888(const vImage_Buffer *src, vImagePixelCount *histogram[4], vImage_Flags flags)
{
  return MEMORY[0x270EDF200](src, histogram, *(void *)&flags);
}