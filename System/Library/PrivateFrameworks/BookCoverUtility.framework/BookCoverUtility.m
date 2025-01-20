id sub_236A40F2C()
{
  void *v0;
  uint64_t vars8;

  if (qword_26AF401D8 != -1) {
    dispatch_once(&qword_26AF401D8, &unk_26E9DCC88);
  }
  v0 = (void *)qword_26AF401D0;
  return v0;
}

void sub_236A41228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236A41240(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_count(*(void **)(a1[4] + 32), a2, a3);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4 == 0;
  objc_msgSend_addObject_(*(void **)(a1[4] + 32), v5, a1[5]);
  v6 = sub_236A40F2C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend_logKey((void *)a1[5], v7, v8);
    int v10 = 138543618;
    v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = v4 + 1;
    _os_log_impl(&dword_236A3F000, v6, OS_LOG_TYPE_DEFAULT, "added operation %{public}@; count=%lu",
      (uint8_t *)&v10,
      0x16u);
  }
}

void sub_236A413B4(uint64_t a1)
{
  uint64_t v236 = *MEMORY[0x263EF8340];
  uint64_t v219 = 0;
  v220 = &v219;
  uint64_t v221 = 0x2020000000;
  char v222 = 1;
  uint64_t v193 = *MEMORY[0x263F0EDF8];
  uint64_t v194 = *MEMORY[0x263F0EF50];
  uint64_t v192 = *MEMORY[0x263F0ED50];
  uint64_t v191 = *MEMORY[0x263F0ED30];
  uint64_t v190 = *MEMORY[0x263F0ED48];
  uint64_t v189 = *MEMORY[0x263F0EE48];
  uint64_t v187 = *MEMORY[0x263F15F08];
  CFStringRef name = (const __CFString *)*MEMORY[0x263F001E8];
  CFStringRef key = (const __CFString *)*MEMORY[0x263F0EDA0];
  while (*((unsigned char *)v220 + 24))
  {
    context = (void *)MEMORY[0x237E09AE0]();
    uint64_t v213 = 0;
    v214 = &v213;
    uint64_t v215 = 0x3032000000;
    v216 = sub_236A42384;
    v217 = sub_236A42394;
    id v218 = 0;
    uint64_t v1 = *(void *)(a1 + 32);
    v2 = *(NSObject **)(v1 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236A4239C;
    block[3] = &unk_264CBAB18;
    block[5] = &v213;
    block[4] = v1;
    dispatch_sync(v2, block);
    v3 = sub_236A40F2C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_msgSend_count((void *)v214[5], v4, v5);
      LODWORD(buf.m11) = 134217984;
      *(void *)((char *)&buf.m11 + 4) = v6;
      _os_log_impl(&dword_236A3F000, v3, OS_LOG_TYPE_DEFAULT, "sorting operations; count=%lu", (uint8_t *)&buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
    uint64_t v8 = objc_msgSend_sortedArrayUsingSelector_((void *)v214[5], v7, (uint64_t)sel__compareHoldingStateLock_);
    v9 = (void *)v214[5];
    v214[5] = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
    if ((unint64_t)objc_msgSend_count((void *)v214[5], v10, v11) >= 9)
    {
      uint64_t v14 = (void *)v214[5];
      uint64_t v15 = objc_msgSend_count(v14, v12, v13);
      uint64_t v17 = objc_msgSend_subarrayWithRange_(v14, v16, v15 - 8, 8);
      v18 = (void *)v214[5];
      v214[5] = v17;
    }
    uint64_t v19 = *(void *)(a1 + 32);
    v20 = *(NSObject **)(v19 + 8);
    v211[0] = MEMORY[0x263EF8330];
    v211[1] = 3221225472;
    v211[2] = sub_236A424A0;
    v211[3] = &unk_264CBAB40;
    v211[5] = &v213;
    v211[4] = v19;
    v211[6] = &v219;
    dispatch_sync(v20, v211);
    if (objc_msgSend_count((void *)v214[5], v21, v22))
    {
      long long v209 = 0u;
      long long v210 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      id v23 = (id)v214[5];
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v207, v228, 16);
      if (v27)
      {
        uint64_t v28 = *(void *)v208;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v208 != v28) {
              objc_enumerationMutation(v23);
            }
            v30 = *(void **)(*((void *)&v207 + 1) + 8 * i);
            v32 = objc_msgSend_configureLayer(v30, v25, v26);
            if (v32)
            {
              objc_msgSend_setLayer_(v30, v31, (uint64_t)v32);
              v35 = objc_msgSend_layer(v30, v33, v34);
              objc_msgSend_setNeedsDisplay(v35, v36, v37);
            }
          }
          uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v207, v228, 16);
        }
        while (v27);
      }

      long long v205 = 0u;
      long long v206 = 0u;
      long long v203 = 0u;
      long long v204 = 0u;
      obuint64_t j = (id)v214[5];
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v203, v227, 16);
      if (v39)
      {
        uint64_t v195 = *(void *)v204;
        do
        {
          uint64_t v196 = v39;
          for (uint64_t j = 0; j != v196; ++j)
          {
            if (*(void *)v204 != v195) {
              objc_enumerationMutation(obj);
            }
            v43 = *(void **)(*((void *)&v203 + 1) + 8 * j);
            v44 = objc_msgSend_layer(v43, v40, v41);
            v47 = v44;
            if (v44)
            {
              objc_msgSend_bounds(v44, v45, v46);
              double v49 = v48;
              double v51 = v50;
              objc_msgSend_rasterizationScale(v47, v52, v53);
              double v55 = v54;
              double v56 = v49 * v54;
              if (v56 > 8192.0) {
                double v56 = 8192.0;
              }
              double v57 = fmax(v56, 1.0);
              if (v51 * v55 <= 8192.0) {
                double v58 = v51 * v55;
              }
              else {
                double v58 = 8192.0;
              }
              uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
              float v60 = v57;
              *(void *)v229 = v194;
              v62 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v61, llroundf(v60));
              double v63 = fmax(v58, 1.0);
              float v64 = v63;
              uint64_t v65 = llroundf(v64);
              *(void *)&buf.m11 = v62;
              *(void *)&v229[8] = v193;
              v67 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v66, v65);
              *(void *)&buf.m12 = v67;
              *(void *)&v229[16] = v192;
              v69 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v68, AlignedBytesPerRow);
              *(void *)&buf.m13 = v69;
              *(void *)&v229[24] = v191;
              v71 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v70, AlignedBytesPerRow * v65);
              *(void *)&buf.m14 = v71;
              *(void *)&buf.m21 = &unk_26E9DF410;
              *(void *)&long long v230 = v190;
              *((void *)&v230 + 1) = v189;
              *(void *)&buf.m22 = &unk_26E9DF428;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v72, (uint64_t)&buf, v229, 6);
              CFDictionaryRef properties = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

              v73 = IOSurfaceCreate(properties);
              v74 = v73;
              if (v73)
              {
                IOSurfaceLock(v73, 0, 0);
                if (!*(void *)(*(void *)(a1 + 32) + 48))
                {
                  id v76 = MTLCreateSystemDefaultDevice();
                  uint64_t v77 = *(void *)(a1 + 32);
                  v78 = *(void **)(v77 + 48);
                  *(void *)(v77 + 48) = v76;

                  uint64_t v81 = objc_msgSend_newCommandQueue(*(void **)(*(void *)(a1 + 32) + 48), v79, v80);
                  uint64_t v82 = *(void *)(a1 + 32);
                  v83 = *(void **)(v82 + 56);
                  *(void *)(v82 + 56) = v81;
                }
                v84 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v75, 80, (unint64_t)v57, (unint64_t)v63, 0);
                objc_msgSend_setUsage_(v84, v85, 5);
                v197 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(*(void **)(*(void *)(a1 + 32) + 48), v86, (uint64_t)v84, v74, 0);
                uint64_t v88 = *(void *)(a1 + 32);
                v89 = *(void **)(v88 + 40);
                if (v89)
                {
                  objc_msgSend_setDestination_(v89, v87, (uint64_t)v197);
                }
                else
                {
                  uint64_t v93 = *(void *)(v88 + 56);
                  if (v93)
                  {
                    uint64_t v225 = v187;
                    uint64_t v226 = v93;
                    v94 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v87, (uint64_t)&v226, &v225, 1);
                    objc_msgSend_rendererWithMTLTexture_options_(MEMORY[0x263F15860], v95, (uint64_t)v197, v94);
                  }
                  else
                  {
                    v94 = 0;
                    objc_msgSend_rendererWithMTLTexture_options_(MEMORY[0x263F15860], v87, (uint64_t)v197, 0);
                  uint64_t v96 = };
                  uint64_t v97 = *(void *)(a1 + 32);
                  v98 = *(void **)(v97 + 40);
                  *(void *)(v97 + 40) = v96;
                }
                memset(&buf, 0, sizeof(buf));
                CATransform3DMakeScale(&buf, v55, -v55, 1.0);
                objc_msgSend_begin(MEMORY[0x263F158F8], v99, v100);
                objc_msgSend_activateBackground_(MEMORY[0x263F158F8], v101, 1);
                objc_msgSend_setDisableActions_(MEMORY[0x263F158F8], v102, 1);
                v105 = objc_msgSend_layer(MEMORY[0x263F157E8], v103, v104);
                objc_msgSend_setAnchorPoint_(v105, v106, v107, 0.5, 0.5);
                CATransform3D v202 = buf;
                objc_msgSend_setTransform_(v105, v108, (uint64_t)&v202);
                objc_msgSend_setFrame_(v105, v109, v110, 0.0, 0.0, v57, v63);
                objc_msgSend_setGeometryFlipped_(v105, v111, 1);
                objc_msgSend_addSublayer_(v105, v112, (uint64_t)v47);
                objc_msgSend_setLayer_(*(void **)(*(void *)(a1 + 32) + 40), v113, (uint64_t)v105);
                objc_msgSend_setBounds_(*(void **)(*(void *)(a1 + 32) + 40), v114, v115, 0.0, 0.0, v57, v63);
                objc_msgSend_commit(MEMORY[0x263F158F8], v116, v117);
                objc_msgSend_flush(MEMORY[0x263F158F8], v118, v119);
                objc_msgSend_beginFrameAtTime_timeStamp_(*(void **)(*(void *)(a1 + 32) + 40), v120, 0, 0.0);
                objc_msgSend_render(*(void **)(*(void *)(a1 + 32) + 40), v121, v122);
                objc_msgSend_endFrame(*(void **)(*(void *)(a1 + 32) + 40), v123, v124);
                if (objc_msgSend_waitForCPUSynchronization(v43, v125, v126))
                {
                  v129 = objc_msgSend_commandBuffer(*(void **)(*(void *)(a1 + 32) + 56), v127, v128);
                  objc_msgSend_enqueue(v129, v130, v131);
                  objc_msgSend_commit(v129, v132, v133);
                  objc_msgSend_waitUntilCompleted(v129, v134, v135);
                  uint64_t v138 = objc_msgSend_status(v129, v136, v137);
                  BOOL v141 = v138 == 5;
                  if (v138 == 5)
                  {
                    v142 = objc_msgSend_error(v129, v139, v140);
                    v143 = sub_236A40F2C();
                    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
                    {
                      v186 = objc_msgSend_logKey(v43, v144, v145);
                      uint64_t v171 = objc_msgSend_localizedDescription(v142, v169, v170);
                      *(_DWORD *)v229 = 138412802;
                      *(void *)&v229[4] = v186;
                      *(_WORD *)&v229[12] = 2082;
                      *(void *)&v229[14] = "-[BCULayerRenderer _processOperations]_block_invoke";
                      *(_WORD *)&v229[22] = 2112;
                      v184 = (void *)v171;
                      *(void *)&v229[24] = v171;
                      _os_log_error_impl(&dword_236A3F000, v143, OS_LOG_TYPE_ERROR, "[%@] %{public}s error in the Metal Command Buffer: %@", v229, 0x20u);
                    }
                  }
                }
                else
                {
                  BOOL v141 = 0;
                }
                objc_msgSend_setLayer_(v43, v127, 0);
                if (v141)
                {
LABEL_48:
                  v92 = 0;
                }
                else
                {
                  CFTypeID v146 = CFGetTypeID(v74);
                  if (v146 != CGImageGetTypeID()
                    || (v147 = [BCUPurgeableImage alloc],
                        (v92 = objc_msgSend_initWithImage_surface_contentsScale_(v147, v148, (uint64_t)v74, 0, v55)) == 0))
                  {
                    OSType PixelFormat = IOSurfaceGetPixelFormat(v74);
                    if (PixelFormat == 1999843442 || PixelFormat == 1647534392)
                    {
                      v150 = (CGImage *)CGImageCreateFromIOSurface();
                      v151 = [BCUPurgeableImage alloc];
                      v92 = objc_msgSend_initWithImage_surface_contentsScale_(v151, v152, (uint64_t)v150, v74, v55);
                      CGImageRelease(v150);
                    }
                    else
                    {
                      CFRetain(v74);
                      IOSurfaceIncrementUseCount(v74);
                      BaseAddress = IOSurfaceGetBaseAddress(v74);
                      size_t BytesPerRow = IOSurfaceGetBytesPerRow(v74);
                      size_t Width = IOSurfaceGetWidth(v74);
                      size_t Height = IOSurfaceGetHeight(v74);
                      size_t AllocSize = IOSurfaceGetAllocSize(v74);
                      v156 = CGDataProviderCreateWithData(v74, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_236A42A90);
                      if (!v156)
                      {
                        IOSurfaceDecrementUseCount(v74);
                        CFRelease(v74);
                        goto LABEL_48;
                      }
                      CFTypeRef v157 = IOSurfaceCopyValue(v74, key);
                      v158 = v157;
                      if (v157)
                      {
                        DeviceRGB = CGColorSpaceCreateWithPropertyList(v157);
                        CFRelease(v158);
                      }
                      else
                      {
                        int v235 = 0;
                        long long v233 = 0u;
                        long long v234 = 0u;
                        long long v231 = 0u;
                        long long v232 = 0u;
                        long long v230 = 0u;
                        memset(v229, 0, sizeof(v229));
                        uint64_t v223 = 116;
                        DeviceRGB = 0;
                        if (!IOSurfaceGetBulkAttachments() && v223 == 116 && BYTE11(v231) == 12) {
                          DeviceRGB = CGColorSpaceCreateWithName(name);
                        }
                      }
                      if (!DeviceRGB) {
                        DeviceRGB = CGColorSpaceCreateDeviceRGB();
                      }
                      v161 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2002u, v156, 0, 1, kCGRenderingIntentDefault);
                      CGImageSetProperty();
                      CGColorSpaceRelease(DeviceRGB);
                      CGDataProviderRelease(v156);
                      v162 = [BCUPurgeableImage alloc];
                      v92 = objc_msgSend_initWithImage_surface_contentsScale_(v162, v163, (uint64_t)v161, v74, v55);
                      CGImageRelease(v161);
                    }
                  }
                }
                IOSurfaceUnlock(v74, 0, 0);
                CFRelease(v74);
                if (!v92)
                {
                  v164 = sub_236A40F2C();
                  if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
                  {
                    v168 = objc_msgSend_logKey(v43, v165, v166);
                    *(_DWORD *)v229 = 138412546;
                    *(void *)&v229[4] = v168;
                    *(_WORD *)&v229[12] = 2082;
                    *(void *)&v229[14] = "-[BCULayerRenderer _processOperations]_block_invoke";
                    _os_log_error_impl(&dword_236A3F000, v164, OS_LOG_TYPE_ERROR, "[%@] %{public}s failed to create image", v229, 0x16u);
                  }
                }
              }
              else
              {
                v84 = sub_236A40F2C();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                {
                  v160 = objc_msgSend_logKey(v43, v90, v91);
                  LODWORD(buf.m11) = 138412802;
                  *(void *)((char *)&buf.m11 + 4) = v160;
                  WORD2(buf.m12) = 2082;
                  *(void *)((char *)&buf.m12 + 6) = "-[BCULayerRenderer _processOperations]_block_invoke";
                  HIWORD(buf.m13) = 2112;
                  *(void *)&buf.m14 = properties;
                  _os_log_error_impl(&dword_236A3F000, v84, OS_LOG_TYPE_ERROR, "[%@] %{public}s failed to create IOSurface: %@", (uint8_t *)&buf, 0x20u);
                }
                v92 = 0;
              }

              objc_msgSend_setResult_(v43, v167, (uint64_t)v92);
            }
          }
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v203, v227, 16);
        }
        while (v39);
      }

      os_unfair_lock_lock((os_unfair_lock_t)&unk_26AF401C8);
      int v172 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 64);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_26AF401C8);
      if (v172)
      {
        uint64_t v173 = *(void *)(a1 + 32);
        v174 = *(NSObject **)(v173 + 8);
        v201[0] = MEMORY[0x263EF8330];
        v201[1] = 3221225472;
        v201[2] = sub_236A42614;
        v201[3] = &unk_264CBAB18;
        v201[4] = v173;
        v201[5] = &v213;
        dispatch_sync(v174, v201);
        *((unsigned char *)v220 + 24) = 0;
      }
      else
      {
        v175 = sub_236A40F2C();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v178 = objc_msgSend_count(*(void **)(*(void *)(a1 + 32) + 32), v176, v177);
          LODWORD(buf.m11) = 134217984;
          *(void *)((char *)&buf.m11 + 4) = v178;
          _os_log_impl(&dword_236A3F000, v175, OS_LOG_TYPE_DEFAULT, "completed %lu operations", (uint8_t *)&buf, 0xCu);
        }

        v179 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        v200[0] = MEMORY[0x263EF8330];
        v200[1] = 3221225472;
        v200[2] = sub_236A42788;
        v200[3] = &unk_264CBAB68;
        v200[4] = &v213;
        dispatch_async(v179, v200);
      }
    }
    _Block_object_dispose(&v213, 8);
  }
  _Block_object_dispose(&v219, 8);
}

void sub_236A422EC(_Unwind_Exception *a1)
{
}

uint64_t sub_236A42384(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_236A42394(uint64_t a1)
{
}

uint64_t sub_236A4239C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_allObjects(*(void **)(*(void *)(a1 + 32) + 32), a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t result = objc_msgSend_count(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7, v8);
  if (!result)
  {
    uint64_t result = objc_msgSend_count(*(void **)(*(void *)(a1 + 32) + 32), v10, v11);
    if (result)
    {
      __int16 v12 = sub_236A40F2C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = objc_msgSend_count(*(void **)(*(void *)(a1 + 32) + 32), v13, v14);
        int v18 = 134217984;
        uint64_t v19 = v15;
        _os_log_impl(&dword_236A3F000, v12, OS_LOG_TYPE_DEFAULT, "no operations to sort; count=%lu",
          (uint8_t *)&v18,
          0xCu);
      }

      return objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 32), v16, v17);
    }
  }
  return result;
}

void sub_236A424A0(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v13, v19, 16);
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend_removeObject_(*(void **)(a1[4] + 32), v5, *(void *)(*((void *)&v13 + 1) + 8 * v8++), (void)v13);
      }
      while (v6 != v8);
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v13, v19, 16);
    }
    while (v6);
  }

  uint64_t v11 = objc_msgSend_count(*(void **)(a1[4] + 32), v9, v10);
  __int16 v12 = sub_236A40F2C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CATransform3D buf = 134217984;
    uint64_t v18 = v11;
    _os_log_impl(&dword_236A3F000, v12, OS_LOG_TYPE_DEFAULT, "removed operations for processing; count=%lu", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v11 != 0;
}

void sub_236A42614(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v15, v21, 16);
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend_setResult_(v9, v5, 0, (void)v15);
        objc_msgSend_addObject_(*(void **)(*(void *)(a1 + 32) + 32), v10, (uint64_t)v9);
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v15, v21, 16);
    }
    while (v6);
  }

  uint64_t v11 = sub_236A40F2C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_msgSend_count(*(void **)(*(void *)(a1 + 32) + 32), v12, v13);
    *(_DWORD *)CATransform3D buf = 134217984;
    uint64_t v20 = v14;
    _os_log_impl(&dword_236A3F000, v11, OS_LOG_TYPE_DEFAULT, "added operations for retrying; count=%lu", buf, 0xCu);
  }
}

void sub_236A42788(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1, v2, (uint64_t)&v13, v17, 16);
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v1);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend_result(v9, v4, v5, (void)v13);
        objc_msgSend_setResult_(v9, v11, 0);
        objc_msgSend_completeWithImage_(v9, v12, (uint64_t)v10);
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1, v4, (uint64_t)&v13, v17, 16);
    }
    while (v6);
  }
}

uint64_t sub_236A42A4C()
{
  qword_26AF401D0 = (uint64_t)os_log_create("com.apple.BookCoverUtility", "BCULayerRenderer");
  return MEMORY[0x270F9A758]();
}

void sub_236A42A90(__IOSurface *a1)
{
  IOSurfaceDecrementUseCount(a1);
  CFRelease(a1);
}

id BookCoverUtilityLog()
{
  if (qword_2688A7320 != -1) {
    dispatch_once(&qword_2688A7320, &unk_26E9DCCA8);
  }
  v0 = (void *)qword_2688A7318;
  return v0;
}

uint64_t sub_236A42B1C()
{
  qword_2688A7318 = (uint64_t)os_log_create("com.apple.iBooks", "BookCoverUtility");
  return MEMORY[0x270F9A758]();
}

CGImageRef sub_236A43048(uint64_t a1, void *a2)
{
  objc_msgSend_URLForResource_withExtension_(a2, (const char *)a2, a1, @"png");
  CFURLRef v2 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v3 = v2;
  if (v2 && (uint64_t v4 = CGDataProviderCreateWithURL(v2)) != 0)
  {
    uint64_t v5 = v4;
    CGImageRef v6 = CGImageCreateWithPNGDataProvider(v4, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v5);
  }
  else
  {
    CGImageRef v6 = 0;
  }

  return v6;
}

double sub_236A43F04(CGImage *a1, double a2, double a3, double a4)
{
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  double v10 = 0.0;
  if (*MEMORY[0x263F001B0] != Width || *(double *)(MEMORY[0x263F001B0] + 8) != Height) {
    double v10 = fmin(a2 / Width, a3 / Height);
  }
  if (a4 == 0.0) {
    double v12 = 1.0;
  }
  else {
    double v12 = a4;
  }
  return 1.0 / v12 * round(v12 * (v10 * Width));
}

uint64_t sub_236A43FAC(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__layerWithImage_size_scale_shadow_, *(void *)(a1 + 40));
}

void sub_236A43FC4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v7 = a3;
  double v12 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v12)
  {
    objc_msgSend_roundedInsetsWithSize_(v12, v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
    v10.n128_u64[0] = 0;
    v11.n128_u64[0] = 0;
  }
  (*(void (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 40) + 16))(v8, v9, v10, v11);
  CGImageRelease(*(CGImageRef *)(a1 + 64));
}

CGColorRef sub_236A44694()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  long long v1 = xmmword_236A4A150;
  if (qword_26AF40210 != -1) {
    dispatch_once(&qword_26AF40210, &unk_26E9DCD28);
  }
  qword_2688A7328 = (uint64_t)CGColorCreate((CGColorSpaceRef)qword_26AF40218, (const CGFloat *)&v1);
  long long v1 = xmmword_236A4A160;
  if (qword_26AF40210 != -1) {
    dispatch_once(&qword_26AF40210, &unk_26E9DCD28);
  }
  CGColorRef result = CGColorCreate((CGColorSpaceRef)qword_26AF40218, (const CGFloat *)&v1);
  qword_2688A7330 = (uint64_t)result;
  return result;
}

uint64_t sub_236A449A8(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__layerWithImage_size_scale_minificationFilter_, *(void *)(a1 + 48));
}

void sub_236A449C0(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v7 = a3;
  double v12 = *(unsigned char **)(a1 + 32);
  if (v12[17])
  {
    objc_msgSend__roundedInsetsWithSize_(v12, v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
    v10.n128_u64[0] = 0;
    v11.n128_u64[0] = 0;
  }
  (*(void (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 40) + 16))(v8, v9, v10, v11);
  CGImageRelease(*(CGImageRef *)(a1 + 64));
}

void sub_236A44D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_236A44DA8(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__stackLayerWithImages_filters_size_contentsScale_insets_path_, *(void *)(a1 + 40));
}

void sub_236A44DD4(void *a1)
{
  (*(void (**)(double, double, double, double))(a1[4] + 16))(*(double *)(*(void *)(a1[5] + 8) + 32), *(double *)(*(void *)(a1[5] + 8) + 40), *(double *)(*(void *)(a1[5] + 8) + 48), *(double *)(*(void *)(a1[5] + 8) + 56));
  uint64_t v2 = *(const CGPath **)(*(void *)(a1[6] + 8) + 24);
  CGPathRelease(v2);
}

CGColorRef sub_236A455C4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  long long v1 = xmmword_236A4A170;
  if (qword_26AF40210 != -1) {
    dispatch_once(&qword_26AF40210, &unk_26E9DCD28);
  }
  CGColorRef result = CGColorCreate((CGColorSpaceRef)qword_26AF40218, (const CGFloat *)&v1);
  qword_2688A7340 = (uint64_t)result;
  return result;
}

double sub_236A45658(void *a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_msgSend_bounds(v1, v2, v3);
  double x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if ((objc_msgSend_masksToBounds(v1, v12, v13) & 1) == 0)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v16 = objc_msgSend_sublayers(v1, v14, v15, 0);
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v30, v34, 16);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          sub_236A45658(v22);
          objc_msgSend_convertRect_toLayer_(v22, v23, (uint64_t)v1);
          v38.origin.double x = v24;
          v38.origin.CGFloat y = v25;
          v38.size.CGFloat width = v26;
          v38.size.CGFloat height = v27;
          v36.origin.double x = x;
          v36.origin.CGFloat y = y;
          v36.size.CGFloat width = width;
          v36.size.CGFloat height = height;
          CGRect v37 = CGRectUnion(v36, v38);
          double x = v37.origin.x;
          CGFloat y = v37.origin.y;
          CGFloat width = v37.size.width;
          CGFloat height = v37.size.height;
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v28, (uint64_t)&v30, v34, 16);
      }
      while (v19);
    }
  }
  return x;
}

double sub_236A46394()
{
  double result = 0.0;
  xmmword_2688A7390 = 0u;
  unk_2688A73A0 = 0u;
  xmmword_2688A7370 = 0u;
  unk_2688A7380 = 0u;
  xmmword_2688A7350 = 0u;
  unk_2688A7360 = 0u;
  qword_2688A73B0 = @"BCUCoverEffectsIdentifierBookBinding";
  unk_2688A73B8 = @"BCUCoverEffectsIdentifierBookBindingNight";
  qword_2688A73C0 = @"BCUCoverEffectsIdentifierBookBindingWithShadow";
  unk_2688A73C8 = @"BCUCoverEffectsIdentifierBookBindingNightWithShadow";
  qword_2688A73D0 = @"BCUCoverEffectsIdentifierBookBindingShadowOnly";
  unk_2688A73D8 = @"BCUCoverEffectsIdentifierBookBindingNightShadowOnly";
  qword_2688A73E0 = @"BCUCoverEffectsIdentifierBookBindingRTL";
  unk_2688A73E8 = @"BCUCoverEffectsIdentifierBookBindingRTLNight";
  qword_2688A73F0 = @"BCUCoverEffectsIdentifierBookBindingRTLWithShadow";
  unk_2688A73F8 = @"BCUCoverEffectsIdentifierBookBindingRTLNightWithShadow";
  qword_2688A7400 = @"BCUCoverEffectsIdentifierBookBindingRTLShadowOnly";
  unk_2688A7408 = @"BCUCoverEffectsIdentifierBookBindingRTLNightShadowOnly";
  qword_2688A7410 = @"BCUCoverEffectsIdentifierAudiobook";
  unk_2688A7418 = @"BCUCoverEffectsIdentifierAudiobookNight";
  qword_2688A7420 = @"BCUCoverEffectsIdentifierAudiobookWithShadow";
  unk_2688A7428 = @"BCUCoverEffectsIdentifierAudiobookNightWithShadow";
  qword_2688A7430 = @"BCUCoverEffectsIdentifierAudiobookShadowOnly";
  unk_2688A7438 = @"BCUCoverEffectsIdentifierAudiobookNightShadowOnly";
  qword_2688A7440 = @"BCUCoverEffectsIdentifierAudiobook";
  unk_2688A7448 = @"BCUCoverEffectsIdentifierAudiobookNight";
  qword_2688A7450 = @"BCUCoverEffectsIdentifierAudiobookWithShadow";
  unk_2688A7458 = @"BCUCoverEffectsIdentifierAudiobookNightWithShadow";
  qword_2688A7460 = @"BCUCoverEffectsIdentifierAudiobookShadowOnly";
  unk_2688A7468 = @"BCUCoverEffectsIdentifierAudiobookNightShadowOnly";
  qword_2688A7470 = @"BCUCoverEffectsIdentifierPDF";
  unk_2688A7478 = @"BCUCoverEffectsIdentifierPDFNight";
  qword_2688A7480 = @"BCUCoverEffectsIdentifierPDFWithShadow";
  unk_2688A7488 = @"BCUCoverEffectsIdentifierPDFNightWithShadow";
  qword_2688A7490 = @"BCUCoverEffectsIdentifierPDFShadowOnly";
  unk_2688A7498 = @"BCUCoverEffectsIdentifierPDFNightShadowOnly";
  qword_2688A74A0 = @"BCUCoverEffectsIdentifierPDF";
  unk_2688A74A8 = @"BCUCoverEffectsIdentifierPDFNight";
  qword_2688A74B0 = @"BCUCoverEffectsIdentifierPDFWithShadow";
  unk_2688A74B8 = @"BCUCoverEffectsIdentifierPDFNightWithShadow";
  qword_2688A74C0 = @"BCUCoverEffectsIdentifierPDFShadowOnly";
  unk_2688A74C8 = @"BCUCoverEffectsIdentifierPDFNightShadowOnly";
  return result;
}

CGColorSpaceRef sub_236A483EC()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00208]);
  qword_26AF40218 = (uint64_t)result;
  return result;
}

void sub_236A48418()
{
  v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  objc_msgSend_bundleForClass_(v0, v2, v1);
  id v109 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v4, @"iBooks_Covers_Flat-L_Shadow", @"png");
  CFURLRef v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v6 = v5;
  if (v5 && (id v7 = CGDataProviderCreateWithURL(v5)) != 0)
  {
    double v8 = v7;
    CGImageRef v9 = CGImageCreateWithPNGDataProvider(v7, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v8);
  }
  else
  {
    CGImageRef v9 = 0;
  }

  uint64_t v11 = objc_msgSend_initWithImage_insets_(v3, v10, (uint64_t)v9, 44.0, 64.0, 108.0, 64.0);
  double v12 = (void *)qword_26AF40228;
  qword_26AF40228 = v11;

  uint64_t v13 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v14, @"iBooks_Covers_RTL_Flat-L_Shadow", @"png");
  CFURLRef v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v16 = v15;
  if (v15 && (long long v17 = CGDataProviderCreateWithURL(v15)) != 0)
  {
    uint64_t v18 = v17;
    CGImageRef v19 = CGImageCreateWithPNGDataProvider(v17, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v18);
  }
  else
  {
    CGImageRef v19 = 0;
  }

  uint64_t v21 = objc_msgSend_initWithImage_insets_(v13, v20, (uint64_t)v19, 44.0, 64.0, 108.0, 64.0);
  uint64_t v22 = (void *)qword_26AF40238;
  qword_26AF40238 = v21;

  id v23 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v24, @"iBooks_Covers_Flat-L_Shadow~Night", @"png");
  CFURLRef v25 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v26 = v25;
  if (v25 && (CGFloat v27 = CGDataProviderCreateWithURL(v25)) != 0)
  {
    uint64_t v28 = v27;
    CGImageRef v29 = CGImageCreateWithPNGDataProvider(v27, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v28);
  }
  else
  {
    CGImageRef v29 = 0;
  }

  uint64_t v31 = objc_msgSend_initWithImage_insets_(v23, v30, (uint64_t)v29, 44.0, 64.0, 108.0, 64.0);
  long long v32 = (void *)qword_26AF40230;
  qword_26AF40230 = v31;

  long long v33 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v34, @"iBooks_Covers_RTL_Flat-L_Shadow~Night", @"png");
  CFURLRef v35 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v36 = v35;
  if (v35 && (CGRect v37 = CGDataProviderCreateWithURL(v35)) != 0)
  {
    CGRect v38 = v37;
    CGImageRef v39 = CGImageCreateWithPNGDataProvider(v37, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v38);
  }
  else
  {
    CGImageRef v39 = 0;
  }

  uint64_t v41 = objc_msgSend_initWithImage_insets_(v33, v40, (uint64_t)v39, 44.0, 64.0, 108.0, 64.0);
  v42 = (void *)qword_26AF40240;
  qword_26AF40240 = v41;

  v43 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v44, @"iBooks_Covers_Flowcase_Shadow", @"png");
  CFURLRef v45 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v46 = v45;
  if (v45 && (v47 = CGDataProviderCreateWithURL(v45)) != 0)
  {
    double v48 = v47;
    CGImageRef v49 = CGImageCreateWithPNGDataProvider(v47, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v48);
  }
  else
  {
    CGImageRef v49 = 0;
  }

  uint64_t v51 = objc_msgSend_initWithImage_insets_blendMode_(v43, v50, (uint64_t)v49, *MEMORY[0x263F15CD0], 266.0, 510.0, 266.0, 510.0);
  v52 = (void *)qword_26AF40208;
  qword_26AF40208 = v51;

  uint64_t v53 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v54, @"iBooks_Covers_Flat-L_SeriesShadow", @"png");
  CFURLRef v55 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v56 = v55;
  if (v55 && (double v57 = CGDataProviderCreateWithURL(v55)) != 0)
  {
    double v58 = v57;
    CGImageRef v59 = CGImageCreateWithPNGDataProvider(v57, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v58);
  }
  else
  {
    CGImageRef v59 = 0;
  }

  uint64_t v61 = objc_msgSend_initWithImage_insets_(v53, v60, (uint64_t)v59, 108.0, 128.0, 176.0, 128.0);
  v62 = (void *)qword_26AF40248;
  qword_26AF40248 = v61;

  double v63 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v64, @"iBooks_Covers_RTL_Flat-L_SeriesShadow", @"png");
  CFURLRef v65 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v66 = v65;
  if (v65 && (v67 = CGDataProviderCreateWithURL(v65)) != 0)
  {
    v68 = v67;
    CGImageRef v69 = CGImageCreateWithPNGDataProvider(v67, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v68);
  }
  else
  {
    CGImageRef v69 = 0;
  }

  uint64_t v71 = objc_msgSend_initWithImage_insets_(v63, v70, (uint64_t)v69, 108.0, 128.0, 176.0, 128.0);
  v72 = (void *)qword_26AF40258;
  qword_26AF40258 = v71;

  v73 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v74, @"iBooks_Covers_Flat-L_SeriesShadow~Night", @"png");
  CFURLRef v75 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v76 = v75;
  if (v75 && (uint64_t v77 = CGDataProviderCreateWithURL(v75)) != 0)
  {
    v78 = v77;
    CGImageRef v79 = CGImageCreateWithPNGDataProvider(v77, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v78);
  }
  else
  {
    CGImageRef v79 = 0;
  }

  uint64_t v81 = objc_msgSend_initWithImage_insets_(v73, v80, (uint64_t)v79, 108.0, 128.0, 176.0, 128.0);
  uint64_t v82 = (void *)qword_26AF40250;
  qword_26AF40250 = v81;

  v83 = [_BCUCoverEffectsShadow alloc];
  objc_msgSend_URLForResource_withExtension_(v109, v84, @"iBooks_Covers_RTL_Flat-L_SeriesShadow~Night", @"png");
  CFURLRef v85 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  CFURLRef v86 = v85;
  if (v85 && (v87 = CGDataProviderCreateWithURL(v85)) != 0)
  {
    uint64_t v88 = v87;
    CGImageRef v89 = CGImageCreateWithPNGDataProvider(v87, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v88);
  }
  else
  {
    CGImageRef v89 = 0;
  }

  uint64_t v91 = objc_msgSend_initWithImage_insets_(v83, v90, (uint64_t)v89, 108.0, 128.0, 176.0, 128.0);
  v92 = (void *)qword_26AF40260;
  qword_26AF40260 = v91;

  uint64_t v93 = [_BCUCoverEffectsAssets alloc];
  uint64_t v95 = objc_msgSend_initWithBundle_rtl_night_(v93, v94, (uint64_t)v109, 0, 0);
  uint64_t v96 = (void *)qword_26AF401E8;
  qword_26AF401E8 = v95;

  uint64_t v97 = [_BCUCoverEffectsAssets alloc];
  uint64_t v99 = objc_msgSend_initWithBundle_rtl_night_(v97, v98, (uint64_t)v109, 0, 1);
  uint64_t v100 = (void *)qword_26AF401F0;
  qword_26AF401F0 = v99;

  v101 = [_BCUCoverEffectsAssets alloc];
  uint64_t v103 = objc_msgSend_initWithBundle_rtl_night_(v101, v102, (uint64_t)v109, 1, 0);
  uint64_t v104 = (void *)qword_26AF401F8;
  qword_26AF401F8 = v103;

  v105 = [_BCUCoverEffectsAssets alloc];
  uint64_t v107 = objc_msgSend_initWithBundle_rtl_night_(v105, v106, (uint64_t)v109, 1, 1);
  v108 = (void *)qword_26AF40200;
  qword_26AF40200 = v107;
}

void sub_236A48DAC(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a2;
  long long v14 = *(os_unfair_lock_s **)(a1 + 32);
  CFURLRef v15 = v14 + 2;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  CGFloat v24 = sub_236A48ED0;
  CFURLRef v25 = &unk_264CBADA0;
  CFURLRef v26 = v14;
  id v27 = v13;
  id v16 = v13;
  id v17 = a3;
  os_unfair_lock_lock_with_options();
  ((void (*)(uint64_t *))sub_236A48ED0)(&v22);
  os_unfair_lock_unlock(v15);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v21 = objc_msgSend_CGImage(v17, v19, v20, v22, v23);

  (*(void (**)(uint64_t, uint64_t, double, double, double, double))(v18 + 16))(v18, v21, a4, a5, a6, a7);
}

void sub_236A48ED0(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_filterOperations(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v5, v4, *(void *)(a1 + 40));
}

void sub_236A48F24(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_filterOperations(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v5, v4, *(void *)(a1 + 40));
}

void sub_236A49208()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236A3F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Must provide shadow if shadowOnly=YES", v0, 2u);
}

void sub_236A49250(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_236A3F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Single cover mode doesn't support %@", (uint8_t *)&v1, 0xCu);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB8](plist);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x270EE62F0](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x270EF4ED0]();
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6770](source, decode, shouldInterpolate, *(void *)&intent);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x270EE6858]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x270EE6910]();
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE7108](path);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x270EF4E68](buffer, *(void *)&newState, oldState);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}