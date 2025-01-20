void sub_1000048F8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t vars8;

  v2 = [*(id *)(a1 + 32) appearance];
  [v2 topInset];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setConstant:");

  v3 = [*(id *)(a1 + 32) appearance];
  [v3 bottomInset];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setConstant:");

  v4 = [*(id *)(a1 + 32) view];
  [v4 setNeedsLayout];
}

uint64_t sub_100004DFC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 176);
  *(void *)(v2 + 176) = 0;

  v4 = [*(id *)(a1 + 32) scrollView];
  [v4 setContentInsetAdjustmentBehavior:2];

  v5 = [*(id *)(a1 + 32) view];
  [v5 setClipsToBounds:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void sub_100005834(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) scrollView];
  uint64_t v2 = [*(id *)(a1 + 32) scrollView];
  [v2 minimumZoomScale];
  objc_msgSend(v3, "setZoomScale:");
}

uint64_t sub_100005EBC(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (!v8)
  {
    uint64_t v3 = QLPDFViewControllerViewAccessibilityIdentifier;
    v4 = [*(id *)(a1 + 32) markupViewController];
    v5 = [v4 view];
    [v5 setAccessibilityIdentifier:v3];
  }
  [*(id *)(a1 + 32) _addDoubleTapGestureRecognizerIfNeeded];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
  }

  return _objc_release_x1();
}

void sub_100006340(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000063F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100007734(uint64_t a1)
{
  uint64_t v2 = +[UIColor clearColor];
  uint64_t v3 = [*(id *)(a1 + 32) view];
  [v3 setBackgroundColor:v2];

  id v4 = [*(id *)(a1 + 32) markupViewController];
  [v4 setShowThumbnailViewForMultipage:0];
}

void sub_100007960(uint64_t a1)
{
  id v3 = +[UIColor _ql_markupBackgroundColor];
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setBackgroundColor:v3];
}

void sub_1000079CC(uint64_t a1)
{
  uint64_t v2 = +[UIColor _ql_markupBackgroundColor];
  id v3 = [*(id *)(a1 + 32) view];
  [v3 setBackgroundColor:v2];

  id v4 = [*(id *)(a1 + 32) markupViewController];
  [v4 updateThumbnailView];
}

void sub_100007EAC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 48);
  if (v2 != [*(id *)(a1 + 32) presentationMode])
  {
    id v3 = [*(id *)(a1 + 40) markupViewController];
    [v3 updateThumbnailView];
  }
  id v4 = [*(id *)(a1 + 40) markupViewController];
  [v4 adjustContentInsetsForBars];
}

void sub_1000080B8(void *a1)
{
  id v2 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:0];
  CGFloat y = CGPointZero.y;
  [*(id *)(a1[4] + 168) printSize];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  Page = CGPDFDocumentGetPage((CGPDFDocumentRef)[*(id *)(a1[4] + 168) pdfDocumentRef], a1[6] + 1);
  CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
  v13.origin.x = CGPointZero.x;
  v13.origin.CGFloat y = y;
  v13.size.width = v5;
  v13.size.height = v7;
  UIGraphicsBeginPDFContextToData(v2, v13, 0);
  UIGraphicsBeginPDFPage();
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, v7);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v14.origin.x = CGPointZero.x;
  v14.origin.CGFloat y = y;
  v14.size.width = v5;
  v14.size.height = v7;
  CGPDFPageGetDrawingTransform(&v12, Page, kCGPDFMediaBox, v14, 0, 1);
  CGContextConcatCTM(CurrentContext, &v12);
  CGContextDrawPDFPage(CurrentContext, Page);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsEndPDFContext();
  if (CGPDFDocumentGetNumberOfPages((CGPDFDocumentRef)[*(id *)(a1[4] + 168) pdfDocumentRef]) - 1 == a1[6])
  {
    uint64_t v10 = a1[4];
    v11 = *(void **)(v10 + 168);
    *(void *)(v10 + 168) = 0;
  }
  (*(void (**)(void))(a1[5] + 16))();
}

void sub_1000082D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) markupViewController];
  id v3 = [v2 contentViewScrollView];
  [v3 visibleBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  CGAffineTransform v12 = [*(id *)(a1 + 32) appearance];
  [v12 topInset];
  double v14 = v7 + v13;

  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [*(id *)(a1 + 32) markupViewController];
  (*(void (**)(uint64_t, id, double, double, double, double))(v15 + 16))(v15, [v16 currentPDFPageIndex], v5, v14, v9, v11);
}

id sub_1000088A0(uint64_t a1)
{
  [*(id *)(a1 + 32) setWriteOptionsForSaving:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setHasUnsavedPermissionChanges:1];
  id v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008938;
  v4[3] = &unk_100024670;
  v4[4] = v2;
  return [v2 saveChangesIfNeededNotifyHost:1 forceNotifyHost:0 saveHandler:v4];
}

void sub_100008938(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasUnsavedPermissionChanges:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 previewItemViewControllerWantsUpdateOverlay:*(void *)(a1 + 32) animated:0];
}

void sub_100008EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008F0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    double v5 = [WeakRetained webViewController];
    double v6 = [v5 webView];
    unsigned int v7 = [v6 _isDisplayingPDF];

    if (v7)
    {
      double v8 = objc_opt_new();
      id v9 = objc_loadWeakRetained((id *)(a1 + 48));
      [v9 setPdfViewController:v8];

      id v23 = objc_loadWeakRetained((id *)(a1 + 48));
      double v10 = [v23 pdfViewController];
      id v11 = objc_loadWeakRetained((id *)(a1 + 48));
      CGAffineTransform v12 = [v11 webViewController];
      double v13 = [v12 webView];
      double v14 = [v13 _dataForDisplayedPDF];
      uint64_t v15 = *(void *)(a1 + 32);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100009208;
      v27[3] = &unk_100024768;
      objc_copyWeak(&v28, (id *)(a1 + 48));
      [v10 loadPreviewControllerIfNeededWithContents:v14 context:v15 completionHandler:v27];

      objc_destroyWeak(&v28);
      goto LABEL_11;
    }
    id v16 = [*(id *)(a1 + 32) contentType];
    if (!_os_feature_enabled_impl()) {
      goto LABEL_7;
    }
    id v17 = v16;
    if ([v17 caseInsensitiveCompare:@"com.microsoft.word.doc"])
    {
      id v18 = [v17 caseInsensitiveCompare:@"com.microsoft.word.docx"];

      if (v18)
      {
LABEL_7:
        id v19 = objc_loadWeakRetained((id *)(a1 + 48));
        v20 = [v19 webViewController];
        [v19 showPreviewViewController:v20];

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v21 = objc_loadWeakRetained((id *)(a1 + 48));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100009278;
    v24[3] = &unk_1000247B8;
    objc_copyWeak(&v26, (id *)(a1 + 48));
    id v25 = *(id *)(a1 + 32);
    [v21 generatePDFURLUsingPrinterWithCompletion:v24];

    objc_destroyWeak(&v26);
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v3);
  }
}

void sub_1000091F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100009208(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 pdfViewController];
  [v2 showPreviewViewController:v1];
}

void sub_100009278(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009374;
  v8[3] = &unk_100024790;
  id v9 = a3;
  id v10 = v5;
  id v6 = v5;
  id v7 = v9;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v11 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v12);
}

void sub_100009374(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 56));
    id v2 = [v9 webViewController];
    [v9 showPreviewViewController:v2];
  }
  else
  {
    id v3 = objc_opt_new();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setPdfViewController:v3];

    id v5 = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = [v5 pdfViewController];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000094F8;
    v10[3] = &unk_100024768;
    objc_copyWeak(&v11, (id *)(a1 + 56));
    [v6 loadPreviewControllerIfNeededWithContents:v7 context:v8 completionHandler:v10];

    objc_destroyWeak(&v11);
  }
}

void sub_1000094E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000094F8(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 pdfViewController];
  [v2 showPreviewViewController:v1];
}

void sub_1000097FC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      uint64_t v8 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not print provide print preview to ScreenshotService for item: %@. #Printing", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000998C;
    v11[3] = &unk_100024808;
    id v10 = *(void **)(a1 + 40);
    id v12 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 48);
    [v10 provideCurrentPageAndVisibleRectWithCompletionHandler:v11];
  }
}

uint64_t sub_10000998C(uint64_t a1)
{
  id v2 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    id v2 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Providing print preview to ScreenshotService for item: %@ #Printing", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100009AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!a2 || a3)
  {
    double v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    id v6 = +[NSData dataWithContentsOfURL:a2];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
}

void sub_10000A2D0(uint64_t a1)
{
  +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [*(id *)(a1 + 32) longLongValue], 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_opt_new();
  if (v5) {
    [v2 addObject:v5];
  }
  uint64_t v3 = QLLocalizedDictionaryString();
  double v4 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, *(void *)(*(void *)(a1 + 40) + 8));
  [v2 addObject:v4];

  [*(id *)(a1 + 40) setInformation:v2];
}

void sub_10000A4B4(uint64_t a1)
{
  id v2 = objc_opt_new();
  [v2 setURL:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setState:*(void *)(*(void *)(a1 + 40) + 16)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A588;
  v5[3] = &unk_100024888;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  [v3 _readArchiveHeadersOfArchiveAtURL:v4 passphrase:0 completionHandler:v5];
}

void sub_10000A588(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) _didDetermineArchiveNumberOfContainedFiles:a2];
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_16:
    v7();
    goto LABEL_17;
  }
  if (!v5
    || [v5 code] != (id)-1000
    || ([v6 domain],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isEqualToString:DSArchiveServiceErrorDomain],
        v8,
        !v9))
  {
    id v12 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v12 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Trying to preview a ZIP archive but can't read its header. Error: %@. %@ #ZIPHandling", buf, 0x16u);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_16;
  }
  id v10 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    id v10 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Trying to preview an encrypted ZIP archive. Error: %@. %@ #ZIPHandling", buf, 0x16u);
  }
  id v14 = *(id *)(a1 + 40);
  QLRunInMainThread();

LABEL_17:
}

uint64_t sub_10000A7B4(uint64_t a1)
{
  [*(id *)(a1 + 32) _showPasswordView];
  [*(id *)(a1 + 32) _makePasswordViewFirstResponder];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id sub_10000A96C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startUnarchivingContents];
}

void sub_10000A9F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000AC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AC4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setUnarchiveProgress:0];

  if (v6)
  {
    if ([v6 code] == (id)-1000)
    {
      uint64_t v8 = [v6 domain];
      unsigned int v9 = [v8 isEqualToString:DSArchiveServiceErrorDomain];

      if (v9)
      {
        id v10 = _qlsLogHandle;
        if (!_qlsLogHandle)
        {
          QLSInitLogging();
          id v10 = _qlsLogHandle;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = v10;
          id v12 = objc_loadWeakRetained((id *)(a1 + 32));
          *(_DWORD *)buf = 138412290;
          id v31 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Archive is password protected, will prompt user for password. %@ #ZIPHandling", buf, 0xCu);
        }
        goto LABEL_25;
      }
    }
    goto LABEL_14;
  }
  if (!v5)
  {
LABEL_14:
    if ([v6 code] == (id)3072
      && ([v6 domain],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          unsigned int v19 = [v18 isEqualToString:NSCocoaErrorDomain],
          v18,
          v19))
    {
      v20 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v20 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = v20;
        id v22 = objc_loadWeakRetained((id *)(a1 + 32));
        *(_DWORD *)buf = 138412546;
        id v31 = v6;
        __int16 v32 = 2112;
        id v33 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Archive could not be unarchived because the operation was cancelled. Error: %@. %@ #ZIPHandling", buf, 0x16u);
      }
    }
    else
    {
      id v23 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v23 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = v23;
        id v25 = objc_loadWeakRetained((id *)(a1 + 32));
        *(_DWORD *)buf = 138412546;
        id v31 = v6;
        __int16 v32 = 2112;
        id v33 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Archive could not be unarchived. Error: %@. %@ #ZIPHandling", buf, 0x16u);
      }
    }
    objc_copyWeak(&v29, (id *)(a1 + 32));
    id v28 = v6;
    QLRunInMainThread();

    objc_destroyWeak(&v29);
    goto LABEL_25;
  }
  uint64_t v13 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    uint64_t v13 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    id v15 = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138412290;
    id v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Did successfully unarchive archive. %@ #ZIPHandling", buf, 0xCu);
  }
  id v16 = objc_loadWeakRetained((id *)(a1 + 32));
  [v16 setUnarchivedItemsFolderURL:v5];

  id v17 = objc_loadWeakRetained((id *)(a1 + 32));
  [v17 _expandArchiveContentsAtURL:v5];

LABEL_25:
  if (*(unsigned char *)(a1 + 40))
  {
    id v26 = objc_loadWeakRetained((id *)(a1 + 32));
    v27 = [v26 contents];
    [v27 stopAccessingSecurityScopedResource];
  }
}

void sub_10000B04C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000B068(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showCouldNotUnarchiveAlertWithError:*(void *)(a1 + 32)];
}

void sub_10000B1BC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v16 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 typeIdentifier];
        id v12 = +[UTType typeWithIdentifier:v11];
        unsigned int v13 = [v12 isEqual:UTTypeFolder];

        id v14 = [v10 filePath];
        id v15 = [v14 lastPathComponent];
        LODWORD(v11) = [v15 hasPrefix:@"."];

        v7 += (v13 | v11) ^ 1;
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000B698(uint64_t a1)
{
  id v2 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    id v2 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "ZIP archive has entries. %@ #ZIPHandling", (uint8_t *)&v7, 0xCu);
  }
  *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 contents];
  id v6 = [v5 _QLUrlFileSize];
  [v4 _updateZipInformationWithZipSize:v6];
}

void sub_10000B90C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
LABEL_2:
    QLRunInMainThread();
    goto LABEL_16;
  }
  if (v5)
  {
    if ([v5 code] == (id)-1000)
    {
      int v7 = [v6 domain];
      unsigned int v8 = [v7 isEqualToString:DSArchiveServiceErrorDomain];

      if (v8)
      {
        unsigned int v9 = _qlsLogHandle;
        if (!_qlsLogHandle)
        {
          QLSInitLogging();
          unsigned int v9 = _qlsLogHandle;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          id v15 = v6;
          __int16 v16 = 2112;
          uint64_t v17 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not read headers of encrypted ZIP archive. Error: %@. %@ #ZIPHandling", buf, 0x16u);
        }
        goto LABEL_2;
      }
    }
  }
  uint64_t v11 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    uint64_t v11 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "An error occured while trying to read archive header: %@. %@ #ZIPHandling", buf, 0x16u);
  }
  unsigned int v13 = [*(id *)(a1 + 32) delegate];
  [v13 previewItemViewController:*(void *)(a1 + 32) didFailWithError:v6];

LABEL_16:
}

id sub_10000BB68(uint64_t a1)
{
  [*(id *)(a1 + 32) _didDetermineArchiveNumberOfContainedFiles:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _hidePasswordView];
}

id sub_10000BBA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showInvalidPasswordAlert];
}

id sub_10000BD58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _makePasswordViewFirstResponder];
}

id sub_10000BF60(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:*(void *)(*(void *)(a1 + 32) + 32)];
}

void sub_10000C46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C488(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v7, a1 + 6);
  id v4 = a1[4];
  id v6 = a1[5];
  id v5 = v3;
  QLRunInMainThread();

  objc_destroyWeak(&v7);
}

void sub_10000C564(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C578(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained showPreviewViewController:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_10000C904(uint64_t a1)
{
  id v2 = objc_alloc((Class)EKICSPreviewController);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_opt_new();
  id v5 = [v2 initWithData:v3 eventStore:v4 options:2147483649];

  if (!v5)
  {
    v38[0] = @"previewTitle";
    id v25 = [*(id *)(a1 + 40) previewTitle];
    v38[1] = @"type";
    v39[0] = v25;
    id v26 = [*(id *)(a1 + 40) contentType];
    v39[1] = v26;
    v27 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    v24 = +[NSError errorWithDomain:@"com.apple.quicklook.ICSItemViewController" code:1 userInfo:v27];

    id v28 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v28 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error while attempting to instantiate ICS preview controller: %@ #AnyItemViewController", buf, 0xCu);
    }
    id v29 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_12;
  }
  [v5 setAllowsImport:1];
  [v5 setAllowsEditing:0];
  [v5 setAllowsSubitems:0];
  id v6 = *(void **)(a1 + 48);
  id v7 = [v5 viewController];
  [v6 addChildViewController:v7];

  unsigned int v8 = [*(id *)(a1 + 48) view];
  unsigned int v9 = [v5 viewController];
  uint64_t v10 = [v9 view];
  [v8 addSubview:v10];

  uint64_t v11 = [v5 viewController];
  [v11 didMoveToParentViewController:*(void *)(a1 + 48)];

  uint64_t v12 = [v5 viewController];
  unsigned int v13 = [v12 view];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v14 = [*(id *)(a1 + 48) view];
  CFStringRef v34 = @"icsView";
  id v15 = [v5 viewController];
  __int16 v16 = [v15 view];
  v35 = v16;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  uint64_t v18 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[icsView]|" options:0 metrics:0 views:v17];
  [v14 addConstraints:v18];

  long long v19 = [*(id *)(a1 + 48) view];
  long long v20 = objc_msgSend(v5, "viewController", @"icsView");
  long long v21 = [v20 view];
  id v33 = v21;
  long long v22 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  id v23 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[icsView]|" options:0 metrics:0 views:v22];
  [v19 addConstraints:v23];

  v24 = [v5 viewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v24 eventDetailsScrollView];
  }
  else {
  v30 = [v24 view];
  }
  objc_storeWeak((id *)(*(void *)(a1 + 48) + 8), v30);

  objc_storeStrong((id *)(*(void *)(a1 + 48) + 16), v5);
  uint64_t v31 = *(void *)(a1 + 56);
  if (v31)
  {
    id v29 = *(void (**)(void))(v31 + 16);
LABEL_12:
    v29();
  }
}

id sub_10000CF90(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_10000D2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000D32C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    uint64_t v3 = [WeakRetained delegate];
    [v3 permissionViewControllerWasCancelled:WeakRetained];
  }
}

void sub_10000D3B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained doneButtonTapped];
}

void sub_10000D49C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passwordCell];
  v1 = [v2 textField];
  [v1 becomeFirstResponder];
}

void sub_10000E024(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passwordCell];
  v1 = [v2 textField];
  [v1 becomeFirstResponder];
}

void sub_10000E080(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passwordCell];
  v1 = [v2 textField];
  [v1 becomeFirstResponder];
}

void sub_10000F144(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 48) setAnnotationEditingEnabled:0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void sub_10000F2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F314(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateMarkupBackgroundColor];
}

id sub_10000FED8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveChangesNotifyingHostOnEditsQueue:*(unsigned __int8 *)(a1 + 48) forceNotifyHost:*(unsigned __int8 *)(a1 + 49) completionHandler:*(void *)(a1 + 40)];
}

void sub_100010120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001014C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showSaveEditsProgressIndicatorAfterDelay];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 didStartSavingEdits];

  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_10001035C;
  uint64_t v18 = &unk_100024AA0;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  id v19 = *(id *)(a1 + 32);
  uint64_t v10 = objc_retainBlock(&v15);
  if (!v5 || v6)
  {
    uint64_t v12 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      uint64_t v12 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      unsigned int v13 = v12;
      id v14 = objc_loadWeakRetained(v7);
      *(_DWORD *)buf = 138412290;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Could not create editedCopyURL to save Markup changes. %@ #AnyItemViewController", buf, 0xCu);
    }
    if (v10) {
      ((void (*)(void ***))v10[2])(v10);
    }
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v11, "_saveChangesWithEditedCopy:notifyHost:completionHandler:", v5, *(unsigned __int8 *)(a1 + 48), v10, v15, v16, v17, v18);
  }
  objc_destroyWeak(&v20);
}

void sub_10001033C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001035C(uint64_t a1)
{
  objc_copyWeak(&v3, (id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  QLRunInMainThread();

  objc_destroyWeak(&v3);
}

void sub_1000103FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100010410(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained hideSaveEditProgressIndicator];

  id v4 = objc_loadWeakRetained(v2);
  [v4 shouldLockPreviewForUnsavedEdits:0];

  id v5 = objc_loadWeakRetained(v2);
  [v5 didFinishSavingEdits];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void sub_100010BBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100010BD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained context];
  id v3 = [v2 item];
  id v4 = [v3 editedCopy];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

void sub_100011114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011130(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    id v4 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v8 = 138412290;
    id v9 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Saving changes periodically to avoid data loss if needed (%@). #AnyItemViewController", (uint8_t *)&v8, 0xCu);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  [v7 _saveChangesNotifyingHost:1];
}

void sub_100012FB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void sub_100013000(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _qlsLogHandle;
  if (v5)
  {
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v7 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      int v8 = "Found ORIGINAL document attributes: %@ #ItemViewController";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, buf, 0xCu);
    }
  }
  else
  {
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v7 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      int v8 = "No ORIGINAL document attributes found (error: %@) #ItemViewController";
      goto LABEL_10;
    }
  }
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v9 = v5;
  QLRunInMainThread();

  objc_destroyWeak(&v10);
}

void sub_1000131A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000131BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setOriginalDocumentAttributes:v1];

  id v4 = objc_loadWeakRetained(v2);
  [v4 updateBannerVisibility];
}

void sub_10001322C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _qlsLogHandle;
  if (v5)
  {
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v7 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      int v8 = "Found LAST MODIFIED document attributes: %@ #ItemViewController";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, buf, 0xCu);
    }
  }
  else
  {
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v7 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      int v8 = "No LAST MODIFIED document attributes found (error: %@) #ItemViewController";
      goto LABEL_10;
    }
  }
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v9 = v5;
  QLRunInMainThread();

  objc_destroyWeak(&v10);
}

void sub_1000133CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000133E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setLatestDocumentAttributes:v1];

  id v4 = objc_loadWeakRetained(v2);
  [v4 updateBannerVisibility];
}

void sub_100013458(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) urlForDocumentWorkflows];
  id v15 = 0;
  uint64_t v3 = +[SYFormFillingDocumentAttributes formFillingDocumentAttributesForFileAtURL:v2 error:&v15];
  id v4 = v15;

  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = _qlsLogHandle;
    if (v4 || !v3)
    {
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v7 = _qlsLogHandle;
      }
      uint64_t v11 = 1;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v12 = v7;
        unsigned int v13 = [WeakRetained urlForDocumentWorkflows];
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "No SYFormFillingDocumentAttributes found for file at URL %@ (error: %@) #ItemViewController", buf, 0x16u);

        uint64_t v11 = 1;
      }
    }
    else
    {
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v7 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = v7;
        id v9 = [WeakRetained urlForDocumentWorkflows];
        unsigned int v10 = [v3 formFillingCoachingDisabled];
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v9;
        __int16 v18 = 1024;
        LODWORD(v19) = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found SYFormFillingDocumentAttributes for file at URL %@ with formFillingCoachingDisabled=%d #ItemViewController", buf, 0x12u);
      }
      uint64_t v11 = [v3 formFillingCoachingDisabled] ^ 1;
    }
    [WeakRetained setCanShowFormFillingBanner:v11];
    objc_copyWeak(&v14, v5);
    QLRunInMainThread();
    objc_destroyWeak(&v14);
  }
}

void sub_1000136C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000136E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateBannerVisibility];
}

void sub_100013DD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_100013E08(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained documentWorkflowsClient];
  id v7 = objc_loadWeakRetained(v4);
  int v8 = [v7 urlForDocumentWorkflows];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013F18;
  v9[3] = &unk_100024BE0;
  objc_copyWeak(&v10, v4);
  [v6 openLastModifiedDocumentForFileAtURL:v8 completion:v9];

  objc_destroyWeak(&v10);
}

void sub_100013F04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100013F18(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v6 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v9 = [WeakRetained urlForDocumentWorkflows];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not open last modified document for file at URL %@: %@ #AnyItemViewController", (uint8_t *)&v10, 0x16u);
    }
  }
}

void sub_100014024(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained markupViewController];
  [v1 hideBanner];
}

void sub_10001430C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100014344(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained documentWorkflowsClient];
  id v7 = objc_loadWeakRetained(v4);
  int v8 = [v7 urlForDocumentWorkflows];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014454;
  v9[3] = &unk_100024BE0;
  objc_copyWeak(&v10, v4);
  [v6 openOriginalDocumentForFileAtURL:v8 completion:v9];

  objc_destroyWeak(&v10);
}

void sub_100014440(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100014454(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      id v6 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v9 = [WeakRetained urlForDocumentWorkflows];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not open original document for file at URL %@: %@ #AnyItemViewController", (uint8_t *)&v10, 0x16u);
    }
  }
}

void sub_100014560(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained markupViewController];
  [v1 hideBanner];
}

void sub_100014968(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1000149A8(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014A58;
  block[3] = &unk_100024B90;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void sub_100014A58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [objc_alloc((Class)SYFormFillingDocumentAttributes) initWithFormFillingCoachingDisabled:1];
    id v3 = [WeakRetained urlForDocumentWorkflows];
    id v9 = 0;
    unsigned __int8 v4 = [v2 saveToFileURL:v3 error:&v9];
    id v5 = v9;

    if ((v4 & 1) == 0)
    {
      id v6 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v6 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = v6;
        int v8 = [WeakRetained urlForDocumentWorkflows];
        *(_DWORD *)buf = 138412546;
        uint64_t v11 = v8;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to save form filling document attributes to file %@: %@ #AnyItemViewController", buf, 0x16u);
      }
    }
  }
}

void sub_100014BB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [WeakRetained markupViewController];
    unsigned __int8 v3 = [v2 formFillingEnabled];

    if ((v3 & 1) == 0) {
      [WeakRetained startFormFillingDidUseBanner:1];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014C44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setDidDismissFormFillingBanner:1];
    [v3 updateBannerVisibility];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

id sub_100014D78(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBannerVisibility];
  id v2 = *(void **)(a1 + 32);

  return [v2 setDidReceiveFormFillingCallback:1];
}

void sub_100015644(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGDataProviderRef CGDataProviderRetain(CGDataProviderRef provider)
{
  return _CGDataProviderRetain(provider);
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return _CGPDFDocumentCreateWithProvider(provider);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return _CGPDFDocumentGetNumberOfPages(document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

CGPDFDocumentRef CGPDFDocumentRetain(CGPDFDocumentRef document)
{
  return _CGPDFDocumentRetain(document);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  return _CGPDFPageGetBoxRect(page, box);
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return _CGPDFPageGetDrawingTransform(retstr, page, box, rect, rotate, preserveAspectRatio);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t QLLocalizedDictionaryString()
{
  return _QLLocalizedDictionaryString();
}

uint64_t QLLocalizedString()
{
  return _QLLocalizedString();
}

uint64_t QLLocalizedStringFromTable()
{
  return _QLLocalizedStringFromTable();
}

uint64_t QLLocalizedStringWithDefaultValue()
{
  return _QLLocalizedStringWithDefaultValue();
}

uint64_t QLRunInMainThread()
{
  return _QLRunInMainThread();
}

uint64_t QLRunInMainThreadSync()
{
  return _QLRunInMainThreadSync();
}

uint64_t QLSInitLogging()
{
  return _QLSInitLogging();
}

uint64_t QLSizeAspectRatioEqualToSizeAspectRatioWithTolerance()
{
  return _QLSizeAspectRatioEqualToSizeAspectRatioWithTolerance();
}

void UIGraphicsBeginPDFContextToData(NSMutableData *data, CGRect bounds, NSDictionary *documentInfo)
{
}

void UIGraphicsBeginPDFPage(void)
{
}

void UIGraphicsEndPDFContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

uint64_t _QLContentTypeConformsToRawImage()
{
  return __QLContentTypeConformsToRawImage();
}

uint64_t _UIBarsDesktopNavigationBarEnabled()
{
  return __UIBarsDesktopNavigationBarEnabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__QLUrlFileSize(void *a1, const char *a2, ...)
{
  return [a1 _QLUrlFileSize];
}

id objc_msgSend__addDoubleTapGestureRecognizerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _addDoubleTapGestureRecognizerIfNeeded];
}

id objc_msgSend__currentPDFPageChanged(void *a1, const char *a2, ...)
{
  return [a1 _currentPDFPageChanged];
}

id objc_msgSend__dataForDisplayedPDF(void *a1, const char *a2, ...)
{
  return [a1 _dataForDisplayedPDF];
}

id objc_msgSend__fetchDocumentAttributes(void *a1, const char *a2, ...)
{
  return [a1 _fetchDocumentAttributes];
}

id objc_msgSend__findSessionDidChange(void *a1, const char *a2, ...)
{
  return [a1 _findSessionDidChange];
}

id objc_msgSend__formFillingBannerConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _formFillingBannerConfiguration];
}

id objc_msgSend__imageMarkupPreviewController(void *a1, const char *a2, ...)
{
  return [a1 _imageMarkupPreviewController];
}

id objc_msgSend__imagePreviewController(void *a1, const char *a2, ...)
{
  return [a1 _imagePreviewController];
}

id objc_msgSend__isDisplayingPDF(void *a1, const char *a2, ...)
{
  return [a1 _isDisplayingPDF];
}

id objc_msgSend__isPreviewingUnconvertedDocument(void *a1, const char *a2, ...)
{
  return [a1 _isPreviewingUnconvertedDocument];
}

id objc_msgSend__isPreviewingUnconvertedPDF(void *a1, const char *a2, ...)
{
  return [a1 _isPreviewingUnconvertedPDF];
}

id objc_msgSend__itemUUID(void *a1, const char *a2, ...)
{
  return [a1 _itemUUID];
}

id objc_msgSend__makePasswordViewFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 _makePasswordViewFirstResponder];
}

id objc_msgSend__removeUnarchivingFoldersIfExist(void *a1, const char *a2, ...)
{
  return [a1 _removeUnarchivingFoldersIfExist];
}

id objc_msgSend__renderer(void *a1, const char *a2, ...)
{
  return [a1 _renderer];
}

id objc_msgSend__showLatestBannerConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _showLatestBannerConfiguration];
}

id objc_msgSend__showOriginalBannerConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _showOriginalBannerConfiguration];
}

id objc_msgSend__showPasswordView(void *a1, const char *a2, ...)
{
  return [a1 _showPasswordView];
}

id objc_msgSend__startObservingCurrentPDFPageIndex(void *a1, const char *a2, ...)
{
  return [a1 _startObservingCurrentPDFPageIndex];
}

id objc_msgSend__stopFormFilling(void *a1, const char *a2, ...)
{
  return [a1 _stopFormFilling];
}

id objc_msgSend__stopObservingCurrentPDFPageIndex(void *a1, const char *a2, ...)
{
  return [a1 _stopObservingCurrentPDFPageIndex];
}

id objc_msgSend__updateBannerVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateBannerVisibility];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activeFindSession(void *a1, const char *a2, ...)
{
  return [a1 activeFindSession];
}

id objc_msgSend_adjustContentInsetsForBars(void *a1, const char *a2, ...)
{
  return [a1 adjustContentInsetsForBars];
}

id objc_msgSend_annotationEditingEnabled(void *a1, const char *a2, ...)
{
  return [a1 annotationEditingEnabled];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_applyRestoredPDFPageIndexIfPossible(void *a1, const char *a2, ...)
{
  return [a1 applyRestoredPDFPageIndexIfPossible];
}

id objc_msgSend_archiveService(void *a1, const char *a2, ...)
{
  return [a1 archiveService];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autofillDetected(void *a1, const char *a2, ...)
{
  return [a1 autofillDetected];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomInset(void *a1, const char *a2, ...)
{
  return [a1 bottomInset];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buildCells(void *a1, const char *a2, ...)
{
  return [a1 buildCells];
}

id objc_msgSend_bumpVersion(void *a1, const char *a2, ...)
{
  return [a1 bumpVersion];
}

id objc_msgSend_canBeEdited(void *a1, const char *a2, ...)
{
  return [a1 canBeEdited];
}

id objc_msgSend_canEncryptDocument(void *a1, const char *a2, ...)
{
  return [a1 canEncryptDocument];
}

id objc_msgSend_canHandleEditedCopy(void *a1, const char *a2, ...)
{
  return [a1 canHandleEditedCopy];
}

id objc_msgSend_canOfferFormFillingForOriginalDocument(void *a1, const char *a2, ...)
{
  return [a1 canOfferFormFillingForOriginalDocument];
}

id objc_msgSend_canShowFormFillingBanner(void *a1, const char *a2, ...)
{
  return [a1 canShowFormFillingBanner];
}

id objc_msgSend_canShowMarkupButton(void *a1, const char *a2, ...)
{
  return [a1 canShowMarkupButton];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancelOption(void *a1, const char *a2, ...)
{
  return [a1 cancelOption];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clientPreviewOptions(void *a1, const char *a2, ...)
{
  return [a1 clientPreviewOptions];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configurationForBanner(void *a1, const char *a2, ...)
{
  return [a1 configurationForBanner];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_contentFrame(void *a1, const char *a2, ...)
{
  return [a1 contentFrame];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_contentViewScrollView(void *a1, const char *a2, ...)
{
  return [a1 contentViewScrollView];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentEditNumber(void *a1, const char *a2, ...)
{
  return [a1 currentEditNumber];
}

id objc_msgSend_currentPDFPageIndex(void *a1, const char *a2, ...)
{
  return [a1 currentPDFPageIndex];
}

id objc_msgSend_customEdgeInsets(void *a1, const char *a2, ...)
{
  return [a1 customEdgeInsets];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_didDismissFormFillingBanner(void *a1, const char *a2, ...)
{
  return [a1 didDismissFormFillingBanner];
}

id objc_msgSend_didFinishSavingEdits(void *a1, const char *a2, ...)
{
  return [a1 didFinishSavingEdits];
}

id objc_msgSend_didReceiveFormFillingCallback(void *a1, const char *a2, ...)
{
  return [a1 didReceiveFormFillingCallback];
}

id objc_msgSend_didStartSavingEdits(void *a1, const char *a2, ...)
{
  return [a1 didStartSavingEdits];
}

id objc_msgSend_dismissFindNavigator(void *a1, const char *a2, ...)
{
  return [a1 dismissFindNavigator];
}

id objc_msgSend_dismissSearchIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 dismissSearchIfNeeded];
}

id objc_msgSend_documentIsLocked(void *a1, const char *a2, ...)
{
  return [a1 documentIsLocked];
}

id objc_msgSend_documentWorkflowsClient(void *a1, const char *a2, ...)
{
  return [a1 documentWorkflowsClient];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doneButton(void *a1, const char *a2, ...)
{
  return [a1 doneButton];
}

id objc_msgSend_doneButtonTapped(void *a1, const char *a2, ...)
{
  return [a1 doneButtonTapped];
}

id objc_msgSend_edgePanGestureWidth(void *a1, const char *a2, ...)
{
  return [a1 edgePanGestureWidth];
}

id objc_msgSend_editedCopy(void *a1, const char *a2, ...)
{
  return [a1 editedCopy];
}

id objc_msgSend_editedFileBehavior(void *a1, const char *a2, ...)
{
  return [a1 editedFileBehavior];
}

id objc_msgSend_editingMode(void *a1, const char *a2, ...)
{
  return [a1 editingMode];
}

id objc_msgSend_eventDetailsScrollView(void *a1, const char *a2, ...)
{
  return [a1 eventDetailsScrollView];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_filledInfoButtonGlyphName(void *a1, const char *a2, ...)
{
  return [a1 filledInfoButtonGlyphName];
}

id objc_msgSend_findInteraction(void *a1, const char *a2, ...)
{
  return [a1 findInteraction];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_formDetectedInDocument(void *a1, const char *a2, ...)
{
  return [a1 formDetectedInDocument];
}

id objc_msgSend_formFillingCoachingDisabled(void *a1, const char *a2, ...)
{
  return [a1 formFillingCoachingDisabled];
}

id objc_msgSend_formFillingEnabled(void *a1, const char *a2, ...)
{
  return [a1 formFillingEnabled];
}

id objc_msgSend_fpItem(void *a1, const char *a2, ...)
{
  return [a1 fpItem];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hasResultsForVisualSearch(void *a1, const char *a2, ...)
{
  return [a1 hasResultsForVisualSearch];
}

id objc_msgSend_hasUnsavedPermissionChanges(void *a1, const char *a2, ...)
{
  return [a1 hasUnsavedPermissionChanges];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hideBanner(void *a1, const char *a2, ...)
{
  return [a1 hideBanner];
}

id objc_msgSend_hideSaveEditProgressIndicator(void *a1, const char *a2, ...)
{
  return [a1 hideSaveEditProgressIndicator];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageAnalysisToolbarButton(void *a1, const char *a2, ...)
{
  return [a1 imageAnalysisToolbarButton];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return [a1 imageData];
}

id objc_msgSend_imageForAnalysis(void *a1, const char *a2, ...)
{
  return [a1 imageForAnalysis];
}

id objc_msgSend_imageSize(void *a1, const char *a2, ...)
{
  return [a1 imageSize];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return [a1 imageURL];
}

id objc_msgSend_infoButtonGlyphName(void *a1, const char *a2, ...)
{
  return [a1 infoButtonGlyphName];
}

id objc_msgSend_infoButtonTapped(void *a1, const char *a2, ...)
{
  return [a1 infoButtonTapped];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isBannerVisible(void *a1, const char *a2, ...)
{
  return [a1 isBannerVisible];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInteractionActive(void *a1, const char *a2, ...)
{
  return [a1 isInteractionActive];
}

id objc_msgSend_isSavingEdits(void *a1, const char *a2, ...)
{
  return [a1 isSavingEdits];
}

id objc_msgSend_isSpringboardHandledURL(void *a1, const char *a2, ...)
{
  return [a1 isSpringboardHandledURL];
}

id objc_msgSend_isVisualSearchEnabled(void *a1, const char *a2, ...)
{
  return [a1 isVisualSearchEnabled];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_latestDocumentAttributes(void *a1, const char *a2, ...)
{
  return [a1 latestDocumentAttributes];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_markAsPurgeable(void *a1, const char *a2, ...)
{
  return [a1 markAsPurgeable];
}

id objc_msgSend_markupContentFrame(void *a1, const char *a2, ...)
{
  return [a1 markupContentFrame];
}

id objc_msgSend_markupViewController(void *a1, const char *a2, ...)
{
  return [a1 markupViewController];
}

id objc_msgSend_minimumZoomScale(void *a1, const char *a2, ...)
{
  return [a1 minimumZoomScale];
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return [a1 modifiedDate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsToSaveChanges(void *a1, const char *a2, ...)
{
  return [a1 needsToSaveChanges];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_originalDateFormatProvider(void *a1, const char *a2, ...)
{
  return [a1 originalDateFormatProvider];
}

id objc_msgSend_originalDocumentAttributes(void *a1, const char *a2, ...)
{
  return [a1 originalDocumentAttributes];
}

id objc_msgSend_outputContentType(void *a1, const char *a2, ...)
{
  return [a1 outputContentType];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 panGestureRecognizer];
}

id objc_msgSend_passwordCell(void *a1, const char *a2, ...)
{
  return [a1 passwordCell];
}

id objc_msgSend_passwordField(void *a1, const char *a2, ...)
{
  return [a1 passwordField];
}

id objc_msgSend_passwordView(void *a1, const char *a2, ...)
{
  return [a1 passwordView];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pdfDocumentRef(void *a1, const char *a2, ...)
{
  return [a1 pdfDocumentRef];
}

id objc_msgSend_pdfViewController(void *a1, const char *a2, ...)
{
  return [a1 pdfViewController];
}

id objc_msgSend_pencilAlwaysDraws(void *a1, const char *a2, ...)
{
  return [a1 pencilAlwaysDraws];
}

id objc_msgSend_peripheryInsets(void *a1, const char *a2, ...)
{
  return [a1 peripheryInsets];
}

id objc_msgSend_pinchGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 pinchGestureRecognizer];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return [a1 preferredFilenameExtension];
}

id objc_msgSend_preferredFormattedName(void *a1, const char *a2, ...)
{
  return [a1 preferredFormattedName];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return [a1 presentationController];
}

id objc_msgSend_presentationMode(void *a1, const char *a2, ...)
{
  return [a1 presentationMode];
}

id objc_msgSend_presentingDelegate(void *a1, const char *a2, ...)
{
  return [a1 presentingDelegate];
}

id objc_msgSend_previewItemContentType(void *a1, const char *a2, ...)
{
  return [a1 previewItemContentType];
}

id objc_msgSend_previewItemTitle(void *a1, const char *a2, ...)
{
  return [a1 previewItemTitle];
}

id objc_msgSend_previewItemURL(void *a1, const char *a2, ...)
{
  return [a1 previewItemURL];
}

id objc_msgSend_previewTitle(void *a1, const char *a2, ...)
{
  return [a1 previewTitle];
}

id objc_msgSend_printSize(void *a1, const char *a2, ...)
{
  return [a1 printSize];
}

id objc_msgSend_printer(void *a1, const char *a2, ...)
{
  return [a1 printer];
}

id objc_msgSend_receivedDate(void *a1, const char *a2, ...)
{
  return [a1 receivedDate];
}

id objc_msgSend_redo(void *a1, const char *a2, ...)
{
  return [a1 redo];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_revert(void *a1, const char *a2, ...)
{
  return [a1 revert];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_saveEditsQueue(void *a1, const char *a2, ...)
{
  return [a1 saveEditsQueue];
}

id objc_msgSend_saveURL(void *a1, const char *a2, ...)
{
  return [a1 saveURL];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return [a1 scrollView];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupAndStartImageAnalysisIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 setupAndStartImageAnalysisIfNeeded];
}

id objc_msgSend_shouldAllowEditingContents(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowEditingContents];
}

id objc_msgSend_shouldDisplayAlternateEditButton(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayAlternateEditButton];
}

id objc_msgSend_showSaveEditsProgressIndicatorAfterDelay(void *a1, const char *a2, ...)
{
  return [a1 showSaveEditsProgressIndicatorAfterDelay];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_stackView(void *a1, const char *a2, ...)
{
  return [a1 stackView];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startFormFilling(void *a1, const char *a2, ...)
{
  return [a1 startFormFilling];
}

id objc_msgSend_stateRestorationDictionary(void *a1, const char *a2, ...)
{
  return [a1 stateRestorationDictionary];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stopImageAnalysis(void *a1, const char *a2, ...)
{
  return [a1 stopImageAnalysis];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tapGesture(void *a1, const char *a2, ...)
{
  return [a1 tapGesture];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return [a1 textField];
}

id objc_msgSend_toolbar(void *a1, const char *a2, ...)
{
  return [a1 toolbar];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topInset(void *a1, const char *a2, ...)
{
  return [a1 topInset];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transitioningView(void *a1, const char *a2, ...)
{
  return [a1 transitioningView];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 typeIdentifier];
}

id objc_msgSend_undo(void *a1, const char *a2, ...)
{
  return [a1 undo];
}

id objc_msgSend_undoManager(void *a1, const char *a2, ...)
{
  return [a1 undoManager];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateBannerVisibility(void *a1, const char *a2, ...)
{
  return [a1 updateBannerVisibility];
}

id objc_msgSend_updateContentFrame(void *a1, const char *a2, ...)
{
  return [a1 updateContentFrame];
}

id objc_msgSend_updateContentsAllowEditingContent(void *a1, const char *a2, ...)
{
  return [a1 updateContentsAllowEditingContent];
}

id objc_msgSend_updateMarkupBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 updateMarkupBackgroundColor];
}

id objc_msgSend_updateScrollViewContentOffset(void *a1, const char *a2, ...)
{
  return [a1 updateScrollViewContentOffset];
}

id objc_msgSend_updateThumbnailView(void *a1, const char *a2, ...)
{
  return [a1 updateThumbnailView];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlForDocumentWorkflows(void *a1, const char *a2, ...)
{
  return [a1 urlForDocumentWorkflows];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_verifyCell(void *a1, const char *a2, ...)
{
  return [a1 verifyCell];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_visibleBounds(void *a1, const char *a2, ...)
{
  return [a1 visibleBounds];
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return [a1 webView];
}

id objc_msgSend_webViewController(void *a1, const char *a2, ...)
{
  return [a1 webViewController];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_writeOptionsForSaving(void *a1, const char *a2, ...)
{
  return [a1 writeOptionsForSaving];
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return [a1 zoomScale];
}