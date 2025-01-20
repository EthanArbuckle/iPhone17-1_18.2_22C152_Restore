@interface AXMScreenGrabber
- (double)_adjustedScaleFactorForInputSize:(CGSize)a3 constrainingToPreferredInputSizeFromDetectors:(id)a4;
- (id)_ioSurfaceConfigurationWithSize:(CGSize)a3;
- (id)_renderOptionsForSurface:(__IOSurface *)a3 captureRect:(CGRect)a4 displayName:(id)a5 scaleFactor:(double)a6 ignoredLayerContextIDs:(id)a7 includedLayerContextIDs:(id)a8 snapshotLayerID:(id)a9 snapshotContextID:(id)a10;
- (id)grabScreenWithRect:(CGRect)a3 orientation:(int64_t)a4 options:(id)a5 metrics:(id)a6 error:(id *)a7;
- (void)recordScreenForDuration:(double)a3 completion:(id)a4;
@end

@implementation AXMScreenGrabber

- (id)grabScreenWithRect:(CGRect)a3 orientation:(int64_t)a4 options:(id)a5 metrics:(id)a6 error:(id *)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  v17 = [v16 startMeasure:@"Screen Grab"];
  v18 = AXMSharedDisplayManager();
  v19 = [v18 coreAnimationMainDisplay];

  if (v19)
  {
    v32 = [v19 name];
    if (!v32)
    {
      if (a7)
      {
        _AXMMakeError(0, @"displayName was nil", v26, v27, v28, v29, v30, v31, v105);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v17 endMeasurement];
      id v78 = 0;
      goto LABEL_47;
    }
    CFTypeRef cf = (CFTypeRef)a4;
    v117 = a7;
    objc_msgSend(v19, "convertRectToDisplay:", x, y, width, height);
    double v119 = v33;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    v118 = [v15 objectForKeyedSubscript:@"UsePreferredModelInputSizeForDetectors"];
    [(AXMScreenGrabber *)self _adjustedScaleFactorForInputSize:v37 constrainingToPreferredInputSizeFromDetectors:v39];
    double v41 = v40;
    v42 = AXMediaLogScreenGrab();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = [NSNumber numberWithInteger:cf];
      v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "physicalOrientation"));
      AXMStringFromCGRect(x, y, width, height);
      v45 = id v109 = v15;
      AXMStringFromCGRect(v119, v35, v37, v39);
      v46 = v111 = v17;
      AXMStringFromCGSize(v37, v39);
      v47 = v113 = v32;
      v48 = AXMStringFromCGSize(v37, v39);
      *(_DWORD *)buf = 134220034;
      *(void *)&buf[4] = 0;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v43;
      *(_WORD *)v130 = 2112;
      *(void *)&v130[2] = v44;
      *(_WORD *)&v130[10] = 2112;
      *(void *)&v130[12] = v45;
      __int16 v131 = 2112;
      v132 = v46;
      __int16 v133 = 2048;
      double v134 = v41;
      __int16 v135 = 2112;
      v136 = v47;
      __int16 v137 = 2112;
      v138 = v48;
      _os_log_impl(&dword_1B57D5000, v42, OS_LOG_TYPE_INFO, "Will perform capture\n\tUse Efficient Downsampling: %ld\n\tDisplay: %@\n\tInterface Orientation:%@\n\tPhysical Orientation:%@\n\tInput Rect: %@\n\tDisplay Rect: %@\n\tAdjusted Scale: %.2f\n\tInputSize (px): %@\n\tSurface Size (px): %@", buf, 0x5Cu);

      v32 = v113;
      v17 = v111;

      id v15 = v109;
    }

    -[AXMScreenGrabber _ioSurfaceConfigurationWithSize:](self, "_ioSurfaceConfigurationWithSize:", v37, v39);
    CFDictionaryRef v49 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    IOSurfaceRef v50 = IOSurfaceCreate(v49);
    if (!v50)
    {
      if (v117)
      {
        _AXMMakeError(0, @"Failed to create IOSurface", v51, v52, v53, v54, v55, v56, v105);
        id *v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v17 endMeasurement];
      id v78 = 0;
      goto LABEL_46;
    }
    v57 = v50;
    v58 = AXMediaLogScreenGrab();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
      -[AXMScreenGrabber grabScreenWithRect:orientation:options:metrics:error:]();
    }
    CFDictionaryRef v108 = v49;

    v59 = [v15 objectForKeyedSubscript:@"IgnoredLayerContextIDs"];
    uint64_t v60 = [v15 objectForKeyedSubscript:@"IncludedLayerContextIDs"];
    uint64_t v61 = [v15 objectForKeyedSubscript:@"SnapshotLayerID"];
    uint64_t v62 = [v15 objectForKeyedSubscript:@"SnapshotContextID"];
    double v63 = v119;
    double v64 = v35;
    double v65 = v41;
    v120 = (void *)v60;
    v110 = (void *)v61;
    v107 = (void *)v62;
    v66 = -[AXMScreenGrabber _renderOptionsForSurface:captureRect:displayName:scaleFactor:ignoredLayerContextIDs:includedLayerContextIDs:snapshotLayerID:snapshotContextID:](self, "_renderOptionsForSurface:captureRect:displayName:scaleFactor:ignoredLayerContextIDs:includedLayerContextIDs:snapshotLayerID:snapshotContextID:", v57, v32, v59, v60, v61, v63, v64, v37, v39, v41);
    IOSurfaceLock(v57, 0, 0);
    LOBYTE(v60) = CARenderServerSnapshot();
    IOSurfaceUnlock(v57, 0, 0);
    if ((v60 & 1) == 0)
    {
      CFRelease(v57);
      if (v117)
      {
        _AXMMakeError(0, @"Failed to render display", v79, v80, v81, v82, v83, v84, v105);
        id *v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v17 endMeasurement];
      id v78 = 0;
      CFDictionaryRef v49 = v108;
      goto LABEL_45;
    }
    v112 = v17;
    v114 = v32;
    v67 = [MEMORY[0x1E4F1E050] imageWithIOSurface:v57];
    v68 = objc_msgSend(v67, "rotatedImageWithInterfaceOrientation:displayOrientation:appliedImageOrientation:", cf, objc_msgSend(v19, "physicalOrientation"), 0);

    if (v68)
    {
      CGColorSpaceRef v69 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
      CFDictionaryRef v49 = v108;
      if (v69)
      {
        CGColorSpaceRef cfa = v69;
        [v68 extent];
        double v72 = v70;
        double v73 = v71;
        v106 = v59;
        if (v65 < 1.0)
        {
          double v72 = v65 * v70;
          *(_OWORD *)v130 = 0u;
          double v73 = v65 * v71;
          memset(buf, 0, sizeof(buf));
          CGAffineTransformMakeScale((CGAffineTransform *)buf, v65, v65);
          v128[0] = *(_OWORD *)buf;
          v128[1] = *(_OWORD *)&buf[16];
          v128[2] = *(_OWORD *)v130;
          uint64_t v74 = [v68 imageByApplyingTransform:v128];

          v68 = (void *)v74;
        }
        *(void *)buf = 0;
        uint64_t v75 = CVPixelBufferCreate(0, (unint64_t)v72, (unint64_t)v73, *(OSType *)AXMVisionNativeVideoPixelBufferFormat, 0, (CVPixelBufferRef *)buf);
        if (v75 || !*(void *)buf)
        {
          CFRelease(v57);
          CFRelease(cfa);
          if (*(void *)buf)
          {
            CFRelease(*(CFTypeRef *)buf);
            *(void *)buf = 0;
          }
          if (v117)
          {
            v97 = [NSNumber numberWithInt:v75];
            _AXMMakeError(0, @"CVPixelBufferCreate returned NULL buffer for pixel buffer. CVReturn: %@", v98, v99, v100, v101, v102, v103, (uint64_t)v97);
            id *v117 = (id)objc_claimAutoreleasedReturnValue();
          }
          [v17 endMeasurement];
          id v78 = 0;
        }
        else
        {
          v121[0] = MEMORY[0x1E4F143A8];
          v121[1] = 3221225472;
          v121[2] = __73__AXMScreenGrabber_grabScreenWithRect_orientation_options_metrics_error___block_invoke;
          v121[3] = &unk_1E6116A00;
          id v122 = v16;
          id v123 = v68;
          uint64_t v124 = *(void *)buf;
          double v125 = v72;
          double v126 = v73;
          CGColorSpaceRef v127 = cfa;
          [v122 measure:@"Render ScreenGrab" execute:v121];
          v76 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:*(void *)buf];
          v77 = AXMediaLogScreenGrab();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
            -[AXMScreenGrabber grabScreenWithRect:orientation:options:metrics:error:]();
          }

          if (*(void *)buf)
          {
            CFRelease(*(CFTypeRef *)buf);
            *(void *)buf = 0;
          }
          CFRelease(cfa);
          CFRelease(v57);
          v17 = v112;
          [v112 endMeasurement];
          id v78 = v76;
        }
        v32 = v114;
        v59 = v106;
        goto LABEL_45;
      }
      CFRelease(v57);
      if (v117)
      {
        _AXMMakeError(0, @"Could not create color space", v91, v92, v93, v94, v95, v96, v105);
        id *v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v17 endMeasurement];
    }
    else
    {
      CFRelease(v57);
      CFDictionaryRef v49 = v108;
      if (v117)
      {
        _AXMMakeError(0, @"Could not convert surface to CIImage", v85, v86, v87, v88, v89, v90, v105);
        id *v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v17 endMeasurement];
    }
    id v78 = 0;
    v32 = v114;
LABEL_45:

LABEL_46:
LABEL_47:

    goto LABEL_48;
  }
  if (a7)
  {
    _AXMMakeError(0, @"mainDisplay was nil", v20, v21, v22, v23, v24, v25, v105);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  [v17 endMeasurement];
  id v78 = 0;
LABEL_48:

  return v78;
}

void __73__AXMScreenGrabber_grabScreenWithRect_orientation_options_metrics_error___block_invoke(uint64_t a1)
{
  AXMCoreImageContext(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "render:toCVPixelBuffer:bounds:colorSpace:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72), 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)_ioSurfaceConfigurationWithSize:(CGSize)a3
{
  float width = a3.width;
  unint64_t v4 = llroundf(width);
  v18[6] = *MEMORY[0x1E4F143B8];
  float height = a3.height;
  unint64_t v6 = llroundf(height);
  uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  uint64_t v8 = (AlignedBytesPerRow * v6);
  v17[0] = *MEMORY[0x1E4F2F2C0];
  v9 = [NSNumber numberWithInt:v4];
  v18[0] = v9;
  v17[1] = *MEMORY[0x1E4F2F0E8];
  v10 = [NSNumber numberWithInt:v6];
  v18[1] = v10;
  v17[2] = *MEMORY[0x1E4F2EFE0];
  v11 = [NSNumber numberWithUnsignedLong:AlignedBytesPerRow];
  v18[2] = v11;
  v17[3] = *MEMORY[0x1E4F2EFB8];
  v12 = [NSNumber numberWithInt:v8];
  v18[3] = v12;
  v17[4] = *MEMORY[0x1E4F2EFD8];
  v13 = [NSNumber numberWithInt:4];
  v18[4] = v13;
  v17[5] = *MEMORY[0x1E4F2F150];
  v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)AXMVisionNativeVideoPixelBufferFormat];
  v18[5] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];

  return v15;
}

- (id)_renderOptionsForSurface:(__IOSurface *)a3 captureRect:(CGRect)a4 displayName:(id)a5 scaleFactor:(double)a6 ignoredLayerContextIDs:(id)a7 includedLayerContextIDs:(id)a8 snapshotLayerID:(id)a9 snapshotContextID:(id)a10
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
  [v22 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F3A4F0]];
  [v22 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F3A4F8]];
  uint64_t v23 = [NSNumber numberWithInt:(int)x];
  [v22 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F3A568]];

  uint64_t v24 = [NSNumber numberWithInt:(int)y];
  [v22 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F3A570]];

  [v22 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F3A530]];
  uint64_t v25 = *MEMORY[0x1E4F3A4E0];
  [v22 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F3A4E0]];
  if ([v19 count])
  {
    id v43 = v21;
    id v44 = v20;
    id v45 = v18;
    id v46 = v17;
    [v22 setObject:*MEMORY[0x1E4F3A560] forKeyedSubscript:*MEMORY[0x1E4F3A538]];
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v27 = v19;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v52 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([v32 unsignedIntegerValue])
          {
            uint64_t v58 = v25;
            v59 = v32;
            double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
            [v26 addObject:v33];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v29);
    }
LABEL_22:

    [v22 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F3A4E8]];
    id v18 = v45;
    id v17 = v46;
    id v21 = v43;
    id v20 = v44;
    goto LABEL_23;
  }
  uint64_t v34 = [v18 count];
  uint64_t v35 = *MEMORY[0x1E4F3A538];
  if (v34)
  {
    id v43 = v21;
    id v44 = v20;
    id v46 = v17;
    [v22 setObject:*MEMORY[0x1E4F3A548] forKeyedSubscript:v35];
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v45 = v18;
    id v27 = v18;
    uint64_t v36 = [v27 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v27);
          }
          double v40 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          if ([v40 unsignedIntegerValue])
          {
            uint64_t v55 = v25;
            uint64_t v56 = v40;
            double v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
            [v26 addObject:v41];
          }
        }
        uint64_t v37 = [v27 countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v37);
    }
    goto LABEL_22;
  }
  [v22 setObject:*MEMORY[0x1E4F3A540] forKeyedSubscript:v35];
LABEL_23:

  return v22;
}

- (double)_adjustedScaleFactorForInputSize:(CGSize)a3 constrainingToPreferredInputSizeFromDetectors:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v12 preferredModelInputSize];
          double v14 = v13 / width;
          double v16 = v15 / height;
          if (v16 > v14) {
            double v14 = v16;
          }
          if (v14 > v10 && v14 < 1.0) {
            double v10 = v14;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }
  double v18 = 1.0;
  if (v10 != 0.0) {
    double v18 = v10;
  }
  if (v18 >= 0.33) {
    double v19 = v18;
  }
  else {
    double v19 = 0.33;
  }

  return v19;
}

- (void)recordScreenForDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (ReplayKitLibraryCore())
  {
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2050000000;
    double v13 = (void *)getRPScreenRecorderClass_softClass;
    uint64_t v37 = getRPScreenRecorderClass_softClass;
    if (!getRPScreenRecorderClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      uint64_t v31 = __getRPScreenRecorderClass_block_invoke;
      v32 = &unk_1E6116AD8;
      double v33 = &v34;
      __getRPScreenRecorderClass_block_invoke((uint64_t)buf);
      double v13 = (void *)v35[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v34, 8);
    double v15 = [v14 sharedRecorder];
    [v15 setSystemRecording:1];
    [v15 setDelegate:self];
    if ([v15 isAvailable])
    {
      long long v22 = AXMediaLogScreenGrab();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B57D5000, v22, OS_LOG_TYPE_DEFAULT, "Will begin recording screen", buf, 2u);
      }

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke;
      v25[3] = &unk_1E6116A78;
      id v27 = v6;
      double v28 = a3;
      id v26 = v15;
      [v26 startSystemRecordingWithMicrophoneEnabled:0 handler:v25];

      long long v23 = v27;
      goto LABEL_12;
    }
    if (v6)
    {
      long long v23 = _AXMMakeError(0, @"Screen recording is not available", v16, v17, v18, v19, v20, v21, v24);
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v23);
LABEL_12:
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v6)
  {
    double v15 = _AXMMakeError(0, @"ReplayKit is not available", v7, v8, v9, v10, v11, v12, v24);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v15);
    goto LABEL_13;
  }
LABEL_14:
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = AXMediaLogScreenGrab();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_cold_1();
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v3);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_DEFAULT, "Screen recording in progress for %.1fs", buf, 0xCu);
    }

    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    uint64_t v9 = dispatch_get_global_queue(33, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_78;
    v10[3] = &unk_1E6116A50;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    dispatch_after(v8, v9, v10);
  }
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_78(uint64_t a1)
{
  id v2 = AXMediaLogScreenGrab();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B57D5000, v2, OS_LOG_TYPE_DEFAULT, "Screen recording is finishing", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_79;
  v4[3] = &unk_1E6116A28;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 stopSystemRecordingWithURLHandler:v4];
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = AXMediaLogScreenGrab();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_79_cold_2();
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      uint64_t v9 = *(void (**)(void))(v8 + 16);
LABEL_10:
      v9();
    }
  }
  else
  {
    uint64_t v10 = AXMediaLogScreenGrab();
    id v11 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v20 = 138412290;
        *(void *)&v20[4] = v5;
        _os_log_impl(&dword_1B57D5000, v11, OS_LOG_TYPE_DEFAULT, "Screen recording did finish with output URL: %@", v20, 0xCu);
      }

      uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_10;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_79_cold_1(v11);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    if (v18)
    {
      uint64_t v19 = _AXMMakeError(0, @"No video URL was produced", v12, v13, v14, v15, v16, v17, *(uint64_t *)v20);
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);
    }
  }
}

- (void)grabScreenWithRect:orientation:options:metrics:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B57D5000, v0, v1, "Did render snapshot with config: %@\n%@");
}

- (void)grabScreenWithRect:orientation:options:metrics:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B57D5000, v0, v1, "Did create IOSurface with config: %@\n%@");
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_ERROR, "Screen recording did fail to start: %@", v1, 0xCu);
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_79_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Screen recording did fail to produce output url", v1, 2u);
}

void __55__AXMScreenGrabber_recordScreenForDuration_completion___block_invoke_79_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_ERROR, "Screen recording did fail to finish: %@", v1, 0xCu);
}

@end