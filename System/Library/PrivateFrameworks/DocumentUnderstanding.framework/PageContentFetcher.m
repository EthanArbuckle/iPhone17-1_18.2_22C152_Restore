@interface PageContentFetcher
+ (id)_copyDefaultWebViewConfiguration;
- (PageContentFetcher)init;
- (void)runJavaScriptOnHTML:(id)a3 javaScript:(id)a4 completionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation PageContentFetcher

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingBlock, 0);
  objc_storeStrong((id *)&self->_providedJavaScript, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = a3;
  if (objc_msgSend_length(self->_providedJavaScript, v6, v7, v8, v9))
  {
    providedJavaScript = self->_providedJavaScript;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_236971AE4;
    v15[3] = &unk_264CB44E0;
    v15[4] = self;
    objc_msgSend_evaluateJavaScript_completionHandler_(v5, v10, (uint64_t)providedJavaScript, (uint64_t)v15, v11);
  }
  else
  {
    pendingBlock = (void (**)(id, void, void *))self->_pendingBlock;
    v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, @"PageContentFetcher", -1, 0);
    pendingBlock[2](pendingBlock, 0, v14);
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_236971D3C;
  v8[3] = &unk_264CB4490;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

- (void)runJavaScriptOnHTML:(id)a3 javaScript:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14 = (NSString *)objc_msgSend_copy(a4, v10, v11, v12, v13);
  providedJavaScript = self->_providedJavaScript;
  self->_providedJavaScript = v14;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_236971E84;
  block[3] = &unk_264CB4468;
  id v19 = v8;
  id v20 = v9;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (PageContentFetcher)init
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v20.receiver = self;
  v20.super_class = (Class)PageContentFetcher;
  v3 = [(PageContentFetcher *)&v20 init];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1FA58]);
    id v5 = objc_opt_class();
    v10 = objc_msgSend__copyDefaultWebViewConfiguration(v5, v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_initWithFrame_configuration_(v4, v11, (uint64_t)v10, v12, v13, 0.0, 0.0, 1366.0, 768.0);
    webView = v3->_webView;
    v3->_webView = (WKWebView *)v14;

    objc_msgSend_setNavigationDelegate_(v3->_webView, v16, (uint64_t)v3, v17, v18);
  }
  return v3;
}

+ (id)_copyDefaultWebViewConfiguration
{
  id v5 = (void *)qword_2688A6F28;
  if (!qword_2688A6F28)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F1FA60]);
    uint64_t v7 = (void *)qword_2688A6F28;
    qword_2688A6F28 = (uint64_t)v6;

    objc_msgSend__setAllowsJavaScriptMarkup_((void *)qword_2688A6F28, v8, 0, v9, v10);
    objc_msgSend__setAllowsMetaRefresh_((void *)qword_2688A6F28, v11, 0, v12, v13);
    objc_msgSend__setAllowUniversalAccessFromFileURLs_((void *)qword_2688A6F28, v14, 0, v15, v16);
    objc_msgSend__setLegacyEncryptedMediaAPIEnabled_((void *)qword_2688A6F28, v17, 0, v18, v19);
    objc_msgSend__setLoadsSubresources_((void *)qword_2688A6F28, v20, 0, v21, v22);
    v27 = objc_msgSend_preferences((void *)qword_2688A6F28, v23, v24, v25, v26);
    objc_msgSend__setAVFoundationEnabled_(v27, v28, 0, v29, v30);

    v35 = objc_msgSend_preferences((void *)qword_2688A6F28, v31, v32, v33, v34);
    objc_msgSend__setDOMPasteAllowed_(v35, v36, 0, v37, v38);

    v43 = objc_msgSend_preferences((void *)qword_2688A6F28, v39, v40, v41, v42);
    objc_msgSend__setJavaScriptCanAccessClipboard_(v43, v44, 0, v45, v46);

    v51 = objc_msgSend_preferences((void *)qword_2688A6F28, v47, v48, v49, v50);
    objc_msgSend__setLoadsImagesAutomatically_(v51, v52, 0, v53, v54);

    v59 = objc_msgSend_preferences((void *)qword_2688A6F28, v55, v56, v57, v58);
    objc_msgSend__setMediaDevicesEnabled_(v59, v60, 0, v61, v62);

    v67 = objc_msgSend_preferences((void *)qword_2688A6F28, v63, v64, v65, v66);
    objc_msgSend__setPeerConnectionEnabled_(v67, v68, 0, v69, v70);

    v75 = objc_msgSend_preferences((void *)qword_2688A6F28, v71, v72, v73, v74);
    objc_msgSend__setRemotePlaybackEnabled_(v75, v76, 0, v77, v78);

    v83 = objc_msgSend_preferences((void *)qword_2688A6F28, v79, v80, v81, v82);
    objc_msgSend__setScreenCaptureEnabled_(v83, v84, 0, v85, v86);

    v91 = objc_msgSend_preferences((void *)qword_2688A6F28, v87, v88, v89, v90);
    objc_msgSend__setStorageBlockingPolicy_(v91, v92, 2, v93, v94);

    v99 = objc_msgSend_preferences((void *)qword_2688A6F28, v95, v96, v97, v98);
    objc_msgSend__setWebAudioEnabled_(v99, v100, 0, v101, v102);

    v107 = objc_msgSend_preferences((void *)qword_2688A6F28, v103, v104, v105, v106);
    objc_msgSend_setJavaScriptCanOpenWindowsAutomatically_(v107, v108, 0, v109, v110);

    v115 = objc_msgSend_preferences((void *)qword_2688A6F28, v111, v112, v113, v114);
    objc_msgSend__setTextAutosizingEnabled_(v115, v116, 0, v117, v118);

    v123 = objc_msgSend_preferences((void *)qword_2688A6F28, v119, v120, v121, v122);
    objc_msgSend__setShouldEnableTextAutosizingBoost_(v123, v124, 0, v125, v126);

    uint64_t v196 = 0;
    v197 = &v196;
    uint64_t v198 = 0x2050000000;
    v131 = (void *)qword_2688A6F30;
    uint64_t v199 = qword_2688A6F30;
    if (!qword_2688A6F30)
    {
      uint64_t v191 = MEMORY[0x263EF8330];
      uint64_t v192 = 3221225472;
      v193 = sub_2369723CC;
      v194 = &unk_264CB4568;
      v195 = &v196;
      sub_2369723CC((uint64_t)&v191, v127, v128, v129, v130);
      v131 = (void *)v197[3];
    }
    id v132 = v131;
    _Block_object_dispose(&v196, 8);
    v137 = objc_msgSend_nonPersistentDataStore(v132, v133, v134, v135, v136);
    objc_msgSend_setWebsiteDataStore_((void *)qword_2688A6F28, v138, (uint64_t)v137, v139, v140);

    objc_msgSend_setAllowsAirPlayForMediaPlayback_((void *)qword_2688A6F28, v141, 0, v142, v143);
    uint64_t v196 = 0;
    v197 = &v196;
    uint64_t v198 = 0x2050000000;
    v148 = (void *)qword_2688A6F40;
    uint64_t v199 = qword_2688A6F40;
    if (!qword_2688A6F40)
    {
      uint64_t v191 = MEMORY[0x263EF8330];
      uint64_t v192 = 3221225472;
      v193 = sub_236972494;
      v194 = &unk_264CB4568;
      v195 = &v196;
      sub_236972494((uint64_t)&v191, v144, v145, v146, v147);
      v148 = (void *)v197[3];
    }
    id v149 = v148;
    _Block_object_dispose(&v196, 8);
    v150 = objc_opt_new();
    objc_msgSend_setAllowsContentJavaScript_(v150, v151, 0, v152, v153);
    objc_msgSend_setPreferredContentMode_(v150, v154, 2, v155, v156);
    objc_msgSend_setDefaultWebpagePreferences_((void *)qword_2688A6F28, v157, (uint64_t)v150, v158, v159);
    objc_msgSend_setAllowsInlineMediaPlayback_((void *)qword_2688A6F28, v160, 0, v161, v162);
    objc_msgSend_setAllowsPictureInPictureMediaPlayback_((void *)qword_2688A6F28, v163, 0, v164, v165);
    objc_msgSend__setClientNavigationsRunAtForegroundPriority_((void *)qword_2688A6F28, v166, 1, v167, v168);
    id v169 = objc_alloc_init(MEMORY[0x263F1FAB0]);
    objc_msgSend_setJITEnabled_(v169, v170, 0, v171, v172);
    id v173 = objc_alloc(MEMORY[0x263F1FA28]);
    v177 = objc_msgSend__initWithConfiguration_(v173, v174, (uint64_t)v169, v175, v176);
    objc_msgSend_setProcessPool_((void *)qword_2688A6F28, v178, (uint64_t)v177, v179, v180);

    id v5 = (void *)qword_2688A6F28;
  }
  v181 = objc_msgSend_copy(v5, a2, v2, v3, v4);
  v186 = objc_msgSend_nonPersistentDataStore(MEMORY[0x263F1FA68], v182, v183, v184, v185);
  objc_msgSend_setWebsiteDataStore_(v181, v187, (uint64_t)v186, v188, v189);

  return v181;
}

@end