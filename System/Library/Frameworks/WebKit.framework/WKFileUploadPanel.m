@interface WKFileUploadPanel
- (BOOL)_shouldMediaCaptureOpenMediaDevice;
- (BOOL)_willMultipleSelectionDelegateBeCalled;
- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3;
- (BOOL)platformSupportsPickerViewController;
- (CFTypeRef)documentPicker:didPickDocumentsAtURLs:;
- (WKFileUploadPanel)initWithView:(id)a3;
- (WKFileUploadPanelDelegate)delegate;
- (WTF::StringImpl)documentPicker:didPickDocumentsAtURLs:;
- (id).cxx_construct;
- (id)_cameraButtonLabel;
- (id)_chooseFilesButtonLabel;
- (id)_mediaTypesForPickerSourceType:(int64_t)a3;
- (id)_photoLibraryButtonLabel;
- (id)acceptedTypeIdentifiers;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)currentAvailableActionTitles;
- (int64_t)_preferredAssetRepresentationMode;
- (pair<WTF::RetainPtr<NSURL>,)_copyToNewTemporaryDirectory:(id)a3;
- (uint64_t)_uploadMediaItemsTranscodingVideo:;
- (uint64_t)_uploadMediaItemsTranscodingVideo:(WTF *)this;
- (uint64_t)_uploadMediaItemsTranscodingVideo:(void *)a1;
- (uint64_t)documentPicker:didPickDocumentsAtURLs:;
- (void)_adjustMediaCaptureType;
- (void)_cancel;
- (void)_chooseFiles:(id)a3 displayString:(id)a4 iconImage:(id)a5;
- (void)_chooseMediaItems:(id)a3;
- (void)_dismissDisplayAnimated:(BOOL)a3;
- (void)_dispatchDidDismiss;
- (void)_presentFullscreenViewController:(id)a3 animated:(BOOL)a4;
- (void)_processMediaInfoDictionaries:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 successBlock:(id)a6 failureBlock:(id)a7;
- (void)_processMediaInfoDictionaries:(id)a3 successBlock:(id)a4 failureBlock:(id)a5;
- (void)_processPickerResults:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 successBlock:(id)a6 failureBlock:(id)a7;
- (void)_processPickerResults:(id)a3 successBlock:(id)a4 failureBlock:(id)a5;
- (void)_showCamera;
- (void)_showPhotoPicker;
- (void)_uploadItemForImageData:(id)a3 imageName:(id)a4 successBlock:(id)a5 failureBlock:(id)a6;
- (void)_uploadItemForJPEGRepresentationOfImage:(id)a3 successBlock:(id)a4 failureBlock:(id)a5;
- (void)_uploadItemFromMediaInfo:(id)a3 successBlock:(id)a4 failureBlock:(id)a5;
- (void)_uploadItemFromResult:(id)a3 successBlock:(id)a4 failureBlock:(id)a5;
- (void)_uploadMediaItemsTranscodingVideo:;
- (void)_uploadMediaItemsTranscodingVideo:(id)a3;
- (void)_uploadMediaItemsTranscodingVideo:(void *)a1;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuPresenter;
- (void)dealloc;
- (void)dismiss;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPicker:didPickDocumentsAtURLs:;
- (void)documentPickerWasCancelled:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentWithParameters:(void *)a3 resultListener:(void *)a4;
- (void)repositionContextMenuIfNeeded;
- (void)resetContextMenuPresenter;
- (void)setDelegate:(id)a3;
- (void)showDocumentPickerMenu;
- (void)showFilePickerMenu;
@end

@implementation WKFileUploadPanel

- (WKFileUploadPanel)initWithView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKFileUploadPanel;
  v4 = [(WKFileUploadPanel *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak(&v4->_view.m_weakReference, a3);
  }
  return v5;
}

- (void)dealloc
{
  [self->_cameraPicker.m_ptr setDelegate:0];
  [self->_documentPickerController.m_ptr setDelegate:0];
  [(WKFileUploadPanel *)self resetContextMenuPresenter];
  v3.receiver = self;
  v3.super_class = (Class)WKFileUploadPanel;
  [(WKFileUploadPanel *)&v3 dealloc];
}

- (void)_dispatchDidDismiss
{
  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id Weak = objc_loadWeak((id *)p_delegate);
    [Weak fileUploadPanelDidDismiss:self];
  }
}

- (void)_cancel
{
  m_ptr = self->_listener.m_ptr;
  if (m_ptr)
  {
    v4 = (WebKit::WebPageProxy *)*((void *)m_ptr + 2);
    if (v4) {
      WebKit::WebPageProxy::didCancelForOpenPanel(v4, (void *)a2);
    }
  }

  [(WKFileUploadPanel *)self _dispatchDidDismiss];
}

- (void)_chooseMediaItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  CFTypeRef v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "fileURL"));
        if (!v6)
        {
          if (v11)
          {
            [v11 displayImage];
            CFTypeRef v6 = arg;
          }
          else
          {
            CFTypeRef v6 = 0;
          }
        }
        v7 += [v11 isVideo];
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }
  uint64_t v12 = [a3 count];
  if ([a3 count] == 1)
  {
    uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "fileURL"), "lastPathComponent");
LABEL_18:
    uint64_t v17 = v14;
    goto LABEL_19;
  }
  if (v12 | v7)
  {
    v15 = NSString;
    WebCore::copyLocalizedString((uint64_t *)&arg, (WebCore *)@"%lu photo(s) and %lu video(s)", v13);
    if (arg)
    {
      CFAutorelease(arg);
      CFTypeRef v16 = arg;
    }
    else
    {
      CFTypeRef v16 = 0;
    }
    uint64_t v14 = objc_msgSend(v15, "localizedStringWithFormat:", v16, v12 - v7, v7);
    goto LABEL_18;
  }
  uint64_t v17 = 0;
LABEL_19:
  [(WKFileUploadPanel *)self _dismissDisplayAnimated:1];
  [(WKFileUploadPanel *)self _chooseFiles:v5 displayString:v17 iconImage:v6];
  if (v6) {
    CFRelease(v6);
  }
}

- (void)_chooseFiles:(id)a3 displayString:(id)a4 iconImage:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = [a3 count];
  if (v9)
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    if (v9 >> 29)
    {
      __break(0xC471u);
    }
    else
    {
      LODWORD(v36) = v9;
      uint64_t v35 = WTF::fastMalloc((WTF *)(8 * v9));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v10 = [a3 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v32;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(a3);
            }
            CFStringRef v13 = (WTF::String *)[*(id *)(*((void *)&v31 + 1) + 8 * v12) fileSystemRepresentation];
            WTF::String::fromUTF8((uint64_t *)&v37, v13, v14);
            LODWORD(v16) = HIDWORD(v36);
            if (HIDWORD(v36) == v36)
            {
              long long v19 = (uint64_t *)WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v35, HIDWORD(v36) + 1, (unint64_t)&v37);
              uint64_t v16 = HIDWORD(v36);
              uint64_t v20 = v35;
              uint64_t v21 = *v19;
              *long long v19 = 0;
              *(void *)(v20 + 8 * v16) = v21;
            }
            else
            {
              uint64_t v17 = v37;
              v37 = 0;
              *(void *)(v35 + 8 * HIDWORD(v36)) = v17;
            }
            HIDWORD(v36) = v16 + 1;
            long long v18 = v37;
            v37 = 0;
            if (v18)
            {
              if (*(_DWORD *)v18 == 2) {
                WTF::StringImpl::destroy(v18, v15);
              }
              else {
                *(_DWORD *)v18 -= 2;
              }
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v22 = [a3 countByEnumeratingWithState:&v31 objects:v38 count:16];
          uint64_t v10 = v22;
        }
        while (v22);
      }
      v23 = UIImagePNGRepresentation((UIImage *)a5);
      API::Data::create((WTF *)[(NSData *)v23 length], [(NSData *)v23 bytes], &v37);
      if (v37 && (uint64_t v24 = (void *)*((void *)v37 + 1)) != 0) {
        uint64_t v25 = [v24 _apiObject];
      }
      else {
        uint64_t v25 = 0;
      }
      m_ptr = self->_listener.m_ptr;
      MEMORY[0x19972EAD0](&v37, a4);
      v28 = (WTF *)*((void *)m_ptr + 2);
      if (v28) {
        WebKit::WebPageProxy::didChooseFilesForOpenPanelWithDisplayStringAndIcon(v28, (uint64_t)&v35, &v37, v25);
      }
      v29 = v37;
      v37 = 0;
      if (v29)
      {
        if (*(_DWORD *)v29 == 2) {
          WTF::StringImpl::destroy(v29, v27);
        }
        else {
          *(_DWORD *)v29 -= 2;
        }
      }
      [(WKFileUploadPanel *)self _dispatchDidDismiss];
      if (v25) {
        CFRelease(*(CFTypeRef *)(v25 + 8));
      }
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v35, v30);
    }
  }
  else
  {
    [(WKFileUploadPanel *)self _cancel];
  }
}

- (void)presentWithParameters:(void *)a3 resultListener:(void *)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (a4) {
    CFRetain(*((CFTypeRef *)a4 + 1));
  }
  m_ptr = self->_listener.m_ptr;
  self->_listener.m_ptr = (WebOpenPanelResultListenerProxy *)a4;
  if (m_ptr) {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
  self->_allowMultipleFiles = *((unsigned char *)a3 + 17);
  [objc_loadWeak(&self->_view.m_weakReference) lastInteractionLocation];
  self->_interactionPoint.x = v7;
  self->_interactionPoint.y = v8;
  API::Array::createStringArray((uint64_t)a3 + 24, &v51);
  uint64_t v9 = v51;
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:*(unsigned int *)(v51 + 28)];
  v49 = self;
  API::Array::elementsOfType<API::String>(v9, v56);
  uint64_t v11 = v57;
  uint64_t v12 = v59;
  if (v57 != v59)
  {
    uint64_t v13 = v58;
    do
    {
      WTF::String::isolatedCopy();
      if (v52[0]) {
        uint64_t v14 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        uint64_t v14 = &stru_1EEA10550;
      }
      [v10 addObject:v14];
      uint64_t v16 = v52[0];
      v52[0] = 0;
      if (v16)
      {
        if (*(_DWORD *)v16 == 2) {
          WTF::StringImpl::destroy(v16, v15);
        }
        else {
          *(_DWORD *)v16 -= 2;
        }
      }
      uint64_t v17 = v11 + 8;
      while (v17 - 8 != v13 && v17 != v13)
      {
        int v19 = (*(uint64_t (**)(void))(**(void **)v17 + 16))();
        v17 += 8;
        if (v19 == 21)
        {
          uint64_t v11 = v17 - 8;
          goto LABEL_21;
        }
      }
      uint64_t v11 = v13;
LABEL_21:
      ;
    }
    while (v11 != v12);
  }
  API::Array::createStringArray((uint64_t)a3 + 40, &v50);
  API::Array::elementsOfType<API::String>(v50, v56);
  uint64_t v20 = v57;
  uint64_t v21 = v59;
  if (v57 != v59)
  {
    uint64_t v22 = v58;
    do
    {
      uint64_t v23 = *(void *)(*(void *)v20 + 16);
      if (v23)
      {
        uint64_t v24 = *(unsigned int *)(v23 + 4);
        if (v24 >= 2)
        {
          uint64_t v25 = *(void *)(v23 + 8);
          unint64_t v26 = (v24 - 1);
          unint64_t v27 = v24 - 1;
          if ((*(unsigned char *)(v23 + 16) & 4) != 0)
          {
            if (v27 < v26) {
              goto LABEL_86;
            }
          }
          else if (v27 < v26)
          {
LABEL_86:
            __break(1u);
            goto LABEL_87;
          }
        }
      }
      WebCore::MIMETypeRegistry::mimeTypeForExtension();
      v29 = v52[0];
      if (v52[0])
      {
        if (*((_DWORD *)v52[0] + 1))
        {
          [v10 addObject:WTF::StringImpl::operator NSString *()];
          v29 = v52[0];
          v52[0] = 0;
          if (!v29) {
            goto LABEL_38;
          }
        }
        else
        {
          v52[0] = 0;
        }
        if (*(_DWORD *)v29 == 2) {
          WTF::StringImpl::destroy(v29, v28);
        }
        else {
          *(_DWORD *)v29 -= 2;
        }
      }
LABEL_38:
      uint64_t v30 = v20 + 8;
      while (v30 - 8 != v22 && v30 != v22)
      {
        int v32 = (*(uint64_t (**)(void))(**(void **)v30 + 16))();
        v30 += 8;
        if (v32 == 21)
        {
          uint64_t v20 = v30 - 8;
          goto LABEL_46;
        }
      }
      uint64_t v20 = v22;
LABEL_46:
      ;
    }
    while (v20 != v21);
  }
  long long v33 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v54 = 0u;
  long long v55 = 0u;
  *(_OWORD *)v52 = 0u;
  long long v53 = 0u;
  uint64_t v34 = [v10 countByEnumeratingWithState:v52 objects:v56 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v53;
    uint64_t v36 = (void *)*MEMORY[0x1E4F44448];
    v37 = (void *)*MEMORY[0x1E4F44400];
    while (2)
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v53 != v35) {
          objc_enumerationMutation(v10);
        }
        uint64_t v39 = (void *)*((void *)v52[1] + i);
        if ([v39 isEqualToString:@"*/*"])
        {
          long long v33 = (void *)[MEMORY[0x1E4F1CAD0] set];
          goto LABEL_66;
        }
        uint64_t v40 = [v39 caseInsensitiveCompare:@"image/*"];
        v41 = v37;
        if (v40)
        {
          uint64_t v42 = [v39 caseInsensitiveCompare:@"video/*"];
          v41 = v36;
          if (v42)
          {
            uint64_t v43 = [v39 caseInsensitiveCompare:@"audio/*"];
            v41 = v36;
            if (v43)
            {
              v41 = (void *)[MEMORY[0x1E4F442D8] typeWithMIMEType:v39];
              if (!v41) {
                continue;
              }
            }
          }
        }
        objc_msgSend(v33, "addObject:", objc_msgSend(v41, "identifier"));
      }
      uint64_t v34 = [v10 countByEnumeratingWithState:v52 objects:v56 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }
LABEL_66:
  if (v33) {
    CFRetain(v33);
  }
  v44 = v49->_acceptedUTIs.m_ptr;
  v49->_acceptedUTIs.m_ptr = v33;
  if (v44)
  {
    CFRelease(v44);
    long long v33 = v49->_acceptedUTIs.m_ptr;
  }
  if (![v33 count])
  {
    char v47 = 3;
    v46 = v49;
    goto LABEL_76;
  }
  if (setContainsUTIThatConformsTo(v49->_acceptedUTIs.m_ptr, *MEMORY[0x1E4F44400])) {
    v49->_allowedImagePickerTypes.m_storage |= 1u;
  }
  int v45 = setContainsUTIThatConformsTo(v49->_acceptedUTIs.m_ptr, *MEMORY[0x1E4F44448]);
  v46 = v49;
  if (v45)
  {
    char v47 = 2;
LABEL_76:
    v46->_allowedImagePickerTypes.m_storage |= v47;
  }
  v46->_mediaCaptureType = 0;
  v46->_mediaCaptureType = *((unsigned char *)a3 + 72);
  if ([(WKFileUploadPanel *)v46 platformSupportsPickerViewController])
  {
    if ([(WKFileUploadPanel *)v49 _shouldMediaCaptureOpenMediaDevice])
    {
      [(WKFileUploadPanel *)v49 _adjustMediaCaptureType];
      v49->_usingCamera = 1;
      [(WKFileUploadPanel *)v49 _showCamera];
    }
    else
    {
      [(WKFileUploadPanel *)v49 showDocumentPickerMenu];
    }
  }
  else
  {
    [(WKFileUploadPanel *)v49 _cancel];
  }
  uint64_t v25 = v50;
  if (v50) {
LABEL_87:
  }
    CFRelease(*(CFTypeRef *)(v25 + 8));
  if (v51) {
    CFRelease(*(CFTypeRef *)(v51 + 8));
  }
}

- (void)dismiss
{
  id WeakRetained = objc_loadWeakRetained(&self->_view.m_weakReference);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend((id)objc_msgSend(WeakRetained, "_wk_viewControllerForFullScreenPresentation"), "dismissViewControllerAnimated:completion:", 0, 0);
    CFRelease(v4);
  }
  m_ptr = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }

  [(WKFileUploadPanel *)self _cancel];
}

- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3
{
  if (a3 == 1)
  {
    if ((objc_msgSend(self->_documentPickerController.m_ptr, "_wk_isInFullscreenPresentation") & 1) != 0
      || (objc_msgSend(self->_photoPicker.m_ptr, "_wk_isInFullscreenPresentation") & 1) != 0
      || (objc_msgSend(self->_cameraPicker.m_ptr, "_wk_isInFullscreenPresentation") & 1) != 0)
    {
      return 0;
    }
    goto LABEL_7;
  }
  if ((a3 - 1) <= 1) {
LABEL_7:
  }
    [(WKFileUploadPanel *)self setDelegate:0];
  [(WKFileUploadPanel *)self dismiss];
  return 1;
}

- (void)_dismissDisplayAnimated:(BOOL)a3
{
  m_ptr = self->_presentationViewController.m_ptr;
  if (m_ptr)
  {
    BOOL v5 = a3;
    CFTypeRef v6 = (WKFileUploadPanel *)[m_ptr presentedViewController];
    if (v6 == self || v6 == self->_cameraPicker.m_ptr || v6 == self->_photoPicker.m_ptr)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __45__WKFileUploadPanel__dismissDisplayAnimated___block_invoke;
      v7[3] = &unk_1E5812158;
      v7[4] = self;
      [(WKFileUploadPanel *)v6 dismissViewControllerAnimated:v5 completion:v7];
    }
  }
}

void __45__WKFileUploadPanel__dismissDisplayAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(const void **)(v1 + 1056);
  *(void *)(v1 + 1056) = 0;
  if (v2) {
    CFRelease(v2);
  }
}

- (id)currentAvailableActionTitles
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  v4 = v3;
  if ((self->_allowedImagePickerTypes.m_storage & 3) != 0)
  {
    [v3 addObject:@"Photo Library"];
    int m_storage = self->_allowedImagePickerTypes.m_storage;
    CFTypeRef v6 = @"Take Video";
    if ((m_storage & 2) == 0) {
      CFTypeRef v6 = @"Take Photo";
    }
    if ((~m_storage & 3) != 0) {
      CGFloat v7 = v6;
    }
    else {
      CGFloat v7 = @"Take Photo or Video";
    }
    [v4 addObject:v7];
  }
  objc_msgSend(v4, "addObject:", -[WKFileUploadPanel _chooseFilesButtonLabel](self, "_chooseFilesButtonLabel"));
  return v4;
}

- (id)acceptedTypeIdentifiers
{
  v2 = (void *)[self->_acceptedUTIs.m_ptr allObjects];

  return (id)[v2 sortedArrayUsingSelector:sel_compare_];
}

- (id)_mediaTypesForPickerSourceType:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F42A90] availableMediaTypesForSourceType:a3];
  m_ptr = self->_acceptedUTIs.m_ptr;
  if (![m_ptr count]) {
    return v4;
  }
  int v19 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v6) {
    goto LABEL_21;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v25;
  id obj = v4;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
      if (objc_msgSend(m_ptr, "containsObject:", v10, obj)) {
        goto LABEL_8;
      }
      uint64_t v11 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v10];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v12 = [m_ptr countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
LABEL_13:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(m_ptr);
          }
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", *(void *)(*((void *)&v20 + 1) + 8 * v15)), "conformsToType:", v11))break; {
          if (v13 == ++v15)
          }
          {
            uint64_t v13 = [m_ptr countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v13) {
              goto LABEL_13;
            }
            goto LABEL_9;
          }
        }
LABEL_8:
        [v19 addObject:v10];
      }
LABEL_9:
      ++v9;
    }
    while (v9 != v7);
    v4 = obj;
    uint64_t v16 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    uint64_t v7 = v16;
  }
  while (v16);
LABEL_21:
  if (![v19 count]) {
    return v4;
  }
  return v19;
}

- (int64_t)_preferredAssetRepresentationMode
{
  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![objc_loadWeak((id *)p_delegate) fileUploadPanelPhotoPickerPrefersOriginalImageFormat:self])
  {
    return 2;
  }
  if (![self->_acceptedUTIs.m_ptr count]) {
    return 1;
  }
  if (objc_msgSend(self->_acceptedUTIs.m_ptr, "containsObject:", objc_msgSend((id)*MEMORY[0x1E4F44400], "identifier")))return 1; {
  return 2;
  }
}

- (id)_chooseFilesButtonLabel
{
  if (!self->_allowMultipleFiles)
  {
    WebCore::fileButtonChooseFileLabel((uint64_t *)&v6, (WebCore *)self);
    if (v6) {
      goto LABEL_5;
    }
    return &stru_1EEA10550;
  }
  WebCore::fileButtonChooseMultipleFilesLabel((uint64_t *)&v6, (WebCore *)self);
  if (!v6) {
    return &stru_1EEA10550;
  }
LABEL_5:
  objc_super v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  return v3;
}

- (id)_photoLibraryButtonLabel
{
  WebCore::localizedString((uint64_t *)&v6, (WebCore *)@"Photo Library (file upload action sheet)", (const __CFString *)a2);
  if (!v6) {
    return &stru_1EEA10550;
  }
  objc_super v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  return v3;
}

- (id)_cameraButtonLabel
{
  int m_storage = self->_allowedImagePickerTypes.m_storage;
  if ((~m_storage & 3) == 0)
  {
    WebCore::localizedString((uint64_t *)&v7, (WebCore *)@"Take Photo or Video (file upload action sheet)", (const __CFString *)a2);
    if (v7) {
      goto LABEL_8;
    }
    return &stru_1EEA10550;
  }
  if ((m_storage & 2) != 0)
  {
    WebCore::localizedString((uint64_t *)&v7, (WebCore *)@"Take Video (file upload action sheet)", (const __CFString *)a2);
    if (v7) {
      goto LABEL_8;
    }
    return &stru_1EEA10550;
  }
  WebCore::localizedString((uint64_t *)&v7, (WebCore *)@"Take Photo (file upload action sheet)", (const __CFString *)a2);
  if (!v7) {
    return &stru_1EEA10550;
  }
LABEL_8:
  v4 = (void *)WTF::StringImpl::operator NSString *();
  BOOL v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id Weak = objc_loadWeak(&self->_view.m_weakReference);

  return (id)[Weak _createTargetedContextMenuHintPreviewIfPossible];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v7 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v8[3] = &__block_descriptor_48_e8_32c88_ZTSKZ75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation__E3__6_e25___UIMenu_16__0__NSArray_8l;
  objc_initWeak(&v7, self);
  v8[4] = self;
  id v9 = 0;
  objc_copyWeak(&v9, &v7);
  objc_destroyWeak(&v7);
  v4 = (void *)[MEMORY[0x1E4F428F0] configurationWithIdentifier:0 previewProvider:0 actionProvider:v8];
  objc_destroyWeak(&v9);
  return v4;
}

uint64_t __75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    return 0;
  }
  objc_super v3 = WeakRetained;
  *(unsigned char *)(*(void *)(a1 + 32) + 1064) = 0;
  v4 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v5 = [WeakRetained _chooseFilesButtonLabel];
  uint64_t v6 = [MEMORY[0x1E4F42A80] systemImageNamed:@"folder"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___ZZ75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation__ENK3__6clEP7NSArrayIP13UIMenuElementE_block_invoke;
  v20[3] = &unk_1E58137F0;
  v20[4] = *(void *)(a1 + 32);
  uint64_t v7 = [v4 actionWithTitle:v5 image:v6 identifier:@"choose" handler:v20];
  uint64_t v8 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v9 = [v3 _photoLibraryButtonLabel];
  uint64_t v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"photo.on.rectangle"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = ___ZZ75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation__ENK3__6clEP7NSArrayIP13UIMenuElementE_block_invoke_2;
  v19[3] = &unk_1E58137F0;
  v19[4] = *(void *)(a1 + 32);
  uint64_t v11 = [v8 actionWithTitle:v9 image:v10 identifier:@"photo" handler:v19];
  if ([MEMORY[0x1E4F42A90] isSourceTypeAvailable:1])
  {
    uint64_t v12 = [v3 _cameraButtonLabel];
    uint64_t v13 = (void *)MEMORY[0x1E4F426E8];
    uint64_t v14 = [MEMORY[0x1E4F42A80] systemImageNamed:@"camera"];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    long long v24 = ___ZZ75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation__ENK3__6clEP7NSArrayIP13UIMenuElementE_block_invoke_3;
    long long v25 = &unk_1E58137F0;
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v15 = [v13 actionWithTitle:v12 image:v14 identifier:@"camera" handler:&v22];
    v21[0] = v11;
    v21[1] = v15;
    v21[2] = v7;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  }
  else
  {
    uint64_t v22 = v11;
    uint64_t v23 = v7;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:2];
  }
  uint64_t v17 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EEA10550 children:v16];
  CFRelease(v3);
  return v17;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  if (!self->_isRepositioningContextMenu)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__WKFileUploadPanel_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
    v5[3] = &unk_1E5812158;
    v5[4] = self;
    objc_msgSend(a5, "addCompletion:", v5, a4);
  }
}

unsigned char *__77__WKFileUploadPanel_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetContextMenuPresenter];
  result = *(unsigned char **)(a1 + 32);
  if (!result[1064])
  {
    return (unsigned char *)[result _cancel];
  }
  return result;
}

- (void)resetContextMenuPresenter
{
  p_menuPresenter = (id **)&self->_menuPresenter;
  if (*p_menuPresenter)
  {
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_menuPresenter, 0);
    id Weak = objc_loadWeak(&self->_view.m_weakReference);
    [Weak _removeContextMenuHintContainerIfPossible];
  }
}

- (void)contextMenuPresenter
{
  p_menuPresenter = (id **)&self->_menuPresenter;
  if (!self->_menuPresenter.__ptr_.__value_)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_view.m_weakReference);
    uint64_t v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, WeakRetained, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_menuPresenter, v5);
    if (WeakRetained) {
      CFRelease(WeakRetained);
    }
  }
  return *p_menuPresenter;
}

- (void)repositionContextMenuIfNeeded
{
  if (self->_menuPresenter.__ptr_.__value_)
  {
    p_view = &self->_view;
    v4 = (CGFloat *)[objc_loadWeak(&self->_view.m_weakReference) webView];
    if (v4)
    {
      uint64_t v5 = v4;
      CGFloat v6 = v4[146];
      CGFloat v7 = v4[147];
      CGFloat v8 = v4[148];
      CGFloat v9 = v4[149];
      v15.origin.x = v6;
      v15.origin.y = v7;
      v15.size.width = v8;
      v15.size.height = v9;
      if (!CGRectIsEmpty(v15))
      {
        objc_msgSend(objc_loadWeak(&p_view->m_weakReference), "convertPoint:toView:", -[CGFloat window](v5, "window"), self->_interactionPoint.x, self->_interactionPoint.y);
        v14.x = v10;
        v14.y = v11;
        v16.origin.x = v6;
        v16.origin.y = v7;
        v16.size.width = v8;
        v16.size.height = v9;
        if (CGRectContainsPoint(v16, v14))
        {
          BOOL isRepositioningContextMenu = self->_isRepositioningContextMenu;
          self->_BOOL isRepositioningContextMenu = 1;
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __50__WKFileUploadPanel_repositionContextMenuIfNeeded__block_invoke;
          v13[3] = &unk_1E5812158;
          v13[4] = self;
          [MEMORY[0x1E4F42FF0] performWithoutAnimation:v13];
          self->_BOOL isRepositioningContextMenu = isRepositioningContextMenu;
        }
      }
    }
  }
}

uint64_t __50__WKFileUploadPanel_repositionContextMenuIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 1072) + 8), "contextMenuInteraction"), "dismissMenu");
  v2 = *(uint64_t **)(a1 + 32);
  objc_super v3 = (id *)v2[134];
  v2 += 126;
  uint64_t v4 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v6 = *MEMORY[0x1E4F1DB30];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1DB30] + 8);

  return WebKit::CompactContextMenuPresenter::present(v3, *(CGRect *)&v4);
}

- (void)showFilePickerMenu
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[self->_acceptedUTIs.m_ptr allObjects];
  if (![v3 count])
  {
    v10[0] = [(id)*MEMORY[0x1E4F44408] identifier];
    objc_super v3 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  m_ptr = self->_uploadFileManager.m_ptr;
  self->_uploadFileManager.m_ptr = v4;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  uint64_t v7 = self->_uploadFileCoordinator.m_ptr;
  self->_uploadFileCoordinator.m_ptr = v6;
  if (v7) {
    CFRelease(v7);
  }
  CGFloat v8 = (void *)[objc_alloc(MEMORY[0x1E4F42990]) initWithDocumentTypes:v3 inMode:0];
  CGFloat v9 = self->_documentPickerController.m_ptr;
  self->_documentPickerController.m_ptr = v8;
  if (v9)
  {
    CFRelease(v9);
    CGFloat v8 = self->_documentPickerController.m_ptr;
  }
  [v8 setAllowsMultipleSelection:self->_allowMultipleFiles];
  [self->_documentPickerController.m_ptr setDelegate:self];
  objc_msgSend((id)objc_msgSend(self->_documentPickerController.m_ptr, "presentationController"), "setDelegate:", self);
  objc_loadWeak((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(self->_documentPickerController.m_ptr, "_setIsContentManaged:", objc_msgSend(objc_loadWeak((id *)&self->_delegate), "fileUploadPanelDestinationIsManaged:", self));
  }
  [(WKFileUploadPanel *)self _presentFullscreenViewController:self->_documentPickerController.m_ptr animated:1];
}

- (void)showDocumentPickerMenu
{
  if ((self->_allowedImagePickerTypes.m_storage & 3) != 0)
  {
    objc_super v3 = [(WKFileUploadPanel *)self contextMenuPresenter];
    v6.origin.x = self->_interactionPoint.x;
    v6.origin.y = self->_interactionPoint.y;
    v6.size.width = *(CGFloat *)MEMORY[0x1E4F1DB30];
    v6.size.height = *(CGFloat *)(MEMORY[0x1E4F1DB30] + 8);
    WebKit::CompactContextMenuPresenter::present(v3, v6);
  }
  else
  {
    [(WKFileUploadPanel *)self showFilePickerMenu];
  }
  m_ptr = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)_adjustMediaCaptureType
{
  if (([MEMORY[0x1E4F42A90] isCameraDeviceAvailable:1] & 1) == 0
    && ![MEMORY[0x1E4F42A90] isCameraDeviceAvailable:0])
  {
    unsigned __int8 v3 = 0;
    goto LABEL_8;
  }
  if (([MEMORY[0x1E4F42A90] isCameraDeviceAvailable:1] & 1) == 0) {
    self->_mediaCaptureType = 2;
  }
  if (([MEMORY[0x1E4F42A90] isCameraDeviceAvailable:0] & 1) == 0)
  {
    unsigned __int8 v3 = 1;
LABEL_8:
    self->_mediaCaptureType = v3;
  }
}

- (BOOL)_shouldMediaCaptureOpenMediaDevice
{
  if (self->_mediaCaptureType) {
    return [MEMORY[0x1E4F42A90] isSourceTypeAvailable:1];
  }
  else {
    return 0;
  }
}

- (void)_showCamera
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42A90]);
  m_ptr = self->_cameraPicker.m_ptr;
  self->_cameraPicker.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    id v3 = self->_cameraPicker.m_ptr;
  }
  [v3 setSourceType:1];
  objc_msgSend(self->_cameraPicker.m_ptr, "setMediaTypes:", -[WKFileUploadPanel _mediaTypesForPickerSourceType:](self, "_mediaTypesForPickerSourceType:", 1));
  [self->_cameraPicker.m_ptr setDelegate:self];
  [self->_cameraPicker.m_ptr setModalPresentationStyle:5];
  objc_msgSend((id)objc_msgSend(self->_cameraPicker.m_ptr, "presentationController"), "setDelegate:", self);
  [self->_cameraPicker.m_ptr setAllowsEditing:0];
  [self->_cameraPicker.m_ptr _setAllowsMultipleSelection:self->_allowMultipleFiles];
  [self->_cameraPicker.m_ptr _setRequiresPickingConfirmation:1];
  [self->_cameraPicker.m_ptr _setShowsFileSizePicker:1];
  if (self->_mediaCaptureType) {
    [self->_cameraPicker.m_ptr setCameraDevice:self->_mediaCaptureType == 1];
  }
  uint64_t v5 = self->_cameraPicker.m_ptr;

  [(WKFileUploadPanel *)self _presentFullscreenViewController:v5 animated:1];
}

- (void)_showPhotoPicker
{
  id v3 = (void *)[objc_alloc((Class)off_1EC2B2118()) init];
  [v3 setSelectionLimit:!self->_allowMultipleFiles];
  objc_msgSend(v3, "setPreferredAssetRepresentationMode:", -[WKFileUploadPanel _preferredAssetRepresentationMode](self, "_preferredAssetRepresentationMode"));
  [v3 _setAllowsDownscaling:1];
  int m_storage = self->_allowedImagePickerTypes.m_storage;
  if ((m_storage & (m_storage - 1)) == 0 && m_storage != 0)
  {
    if (m_storage == 1) {
      uint64_t v6 = [(id)_MergedGlobals_40() imagesFilter];
    }
    else {
      uint64_t v6 = [(id)_MergedGlobals_40() videosFilter];
    }
    [v3 setFilter:v6];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  m_ptr = self->_uploadFileManager.m_ptr;
  self->_uploadFileManager.m_ptr = v7;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  CGFloat v10 = self->_uploadFileCoordinator.m_ptr;
  self->_uploadFileCoordinator.m_ptr = v9;
  if (v10) {
    CFRelease(v10);
  }
  CGFloat v11 = (void *)[objc_alloc((Class)off_1EC2B2120()) initWithConfiguration:v3];
  uint64_t v12 = self->_photoPicker.m_ptr;
  self->_photoPicker.m_ptr = v11;
  if (v12)
  {
    CFRelease(v12);
    CGFloat v11 = self->_photoPicker.m_ptr;
  }
  [v11 setDelegate:self];
  objc_msgSend((id)objc_msgSend(self->_photoPicker.m_ptr, "presentationController"), "setDelegate:", self);
  [(WKFileUploadPanel *)self _presentFullscreenViewController:self->_photoPicker.m_ptr animated:1];
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)_presentFullscreenViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(WKFileUploadPanel *)self _dismissDisplayAnimated:a4];
  id v7 = objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "_wk_viewControllerForFullScreenPresentation");
  CGFloat v8 = v7;
  if (v7) {
    CFRetain(v7);
  }
  m_ptr = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = v8;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    CGFloat v8 = self->_presentationViewController.m_ptr;
  }

  [v8 presentViewController:a3 animated:v4 completion:0];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  [(WKFileUploadPanel *)self _dismissDisplayAnimated:1];
  if (self) {
    CFRetain(self);
  }
  if (a4) {
    CFRetain(a4);
  }
  uint64_t v6 = malloc_type_malloc(0x30uLL, 0x10E0040707B25BCuLL);
  *uint64_t v6 = MEMORY[0x1E4F14398];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKFileUploadPanel documentPicker:didPickDocumentsAtURLs:]::$_5>(-[WKFileUploadPanel documentPicker:didPickDocumentsAtURLs:]::$_5)::{lambda(void *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKFileUploadPanel documentPicker:didPickDocumentsAtURLs:]::$_5>(-[WKFileUploadPanel documentPicker:didPickDocumentsAtURLs:]::$_5)::descriptor;
  v6[4] = self;
  v6[5] = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, v6);

  _Block_release(v6);
}

- (void)documentPickerWasCancelled:(id)a3
{
  [(WKFileUploadPanel *)self _dismissDisplayAnimated:1];

  [(WKFileUploadPanel *)self _cancel];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__WKFileUploadPanel_picker_didFinishPicking___block_invoke;
  v5[3] = &unk_1E5813708;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__WKFileUploadPanel_picker_didFinishPicking___block_invoke_2;
  v4[3] = &unk_1E5812158;
  [(WKFileUploadPanel *)self _processPickerResults:a4 successBlock:v5 failureBlock:v4];
}

uint64_t __45__WKFileUploadPanel_picker_didFinishPicking___block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    CFRetain(*(CFTypeRef *)(a1 + 32));
  }
  if (cf) {
    CFRetain(cf);
  }
  BOOL v4 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v4 = &unk_1EE9D4E20;
  v4[1] = v3;
  v4[2] = v3;
  v4[3] = cf;
  uint64_t v6 = (uint64_t)v4;
  WTF::ensureOnMainRunLoop();
  uint64_t result = v6;
  if (v6) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  return result;
}

uint64_t __45__WKFileUploadPanel_picker_didFinishPicking___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    CFRetain(*(CFTypeRef *)(a1 + 32));
  }
  v2 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v2 = &unk_1EE9D4E48;
  v2[1] = v1;
  v2[2] = v1;
  BOOL v4 = v2;
  WTF::ensureOnMainRunLoop();
  uint64_t result = (uint64_t)v4;
  if (v4) {
    return (*(uint64_t (**)(void *))(*v4 + 8))(v4);
  }
  return result;
}

- (BOOL)_willMultipleSelectionDelegateBeCalled
{
  return self->_allowMultipleFiles && !self->_usingCamera;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (![(WKFileUploadPanel *)self _willMultipleSelectionDelegateBeCalled])
  {
    v9[0] = a4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v7[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__WKFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
    v8[3] = &unk_1E5813708;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__WKFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2;
    v7[3] = &unk_1E5812158;
    [(WKFileUploadPanel *)self _processMediaInfoDictionaries:v6 successBlock:v8 failureBlock:v7];
  }
}

uint64_t __73__WKFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    CFRetain(*(CFTypeRef *)(a1 + 32));
  }
  if (cf) {
    CFRetain(cf);
  }
  BOOL v4 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v4 = &unk_1EE9D4E70;
  v4[1] = v3;
  v4[2] = v3;
  v4[3] = cf;
  uint64_t v6 = (uint64_t)v4;
  WTF::ensureOnMainRunLoop();
  uint64_t result = v6;
  if (v6) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  return result;
}

uint64_t __73__WKFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    CFRetain(*(CFTypeRef *)(a1 + 32));
  }
  v2 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v2 = &unk_1EE9D4E98;
  v2[1] = v1;
  v2[2] = v1;
  BOOL v4 = v2;
  WTF::ensureOnMainRunLoop();
  uint64_t result = (uint64_t)v4;
  if (v4) {
    return (*(uint64_t (**)(void *))(*v4 + 8))(v4);
  }
  return result;
}

- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4
{
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__WKFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke;
  v5[3] = &unk_1E5813708;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__WKFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_2;
  v4[3] = &unk_1E5812158;
  [(WKFileUploadPanel *)self _processMediaInfoDictionaries:a4 successBlock:v5 failureBlock:v4];
}

uint64_t __81__WKFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _uploadMediaItemsTranscodingVideo:a2];
}

uint64_t __81__WKFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    CFRetain(*(CFTypeRef *)(a1 + 32));
  }
  v2 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v2 = &unk_1EE9D4EC0;
  v2[1] = v1;
  v2[2] = v1;
  BOOL v4 = v2;
  WTF::ensureOnMainRunLoop();
  uint64_t result = (uint64_t)v4;
  if (v4) {
    return (*(uint64_t (**)(void *))(*v4 + 8))(v4);
  }
  return result;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  [(WKFileUploadPanel *)self _dismissDisplayAnimated:1];

  [(WKFileUploadPanel *)self _cancel];
}

- (void)_processMediaInfoDictionaries:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];

  [(WKFileUploadPanel *)self _processMediaInfoDictionaries:a3 atIndex:0 processedResults:v9 successBlock:a4 failureBlock:a5];
}

- (void)_processPickerResults:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];

  [(WKFileUploadPanel *)self _processPickerResults:a3 atIndex:0 processedResults:v9 successBlock:a4 failureBlock:a5];
}

- (void)_processPickerResults:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 successBlock:(id)a6 failureBlock:(id)a7
{
  if ([a3 count] == a4)
  {
    uint64_t v13 = (void (*)(id, id))*((void *)a6 + 2);
    v13(a6, a5);
  }
  else
  {
    uint64_t v14 = [a3 objectAtIndex:a4];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__WKFileUploadPanel__processPickerResults_atIndex_processedResults_successBlock_failureBlock___block_invoke;
    v15[3] = &unk_1E5813730;
    v15[4] = a5;
    v15[5] = self;
    v15[6] = a3;
    v15[7] = a6;
    v15[8] = a7;
    v15[9] = a4 + 1;
    [(WKFileUploadPanel *)self _uploadItemFromResult:v14 successBlock:v15 failureBlock:a7];
  }
}

uint64_t __94__WKFileUploadPanel__processPickerResults_atIndex_processedResults_successBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);

  return [v3 _processPickerResults:v5 atIndex:v7 processedResults:v4 successBlock:v6 failureBlock:v8];
}

- (void)_uploadItemFromResult:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "itemProvider"), "registeredTypeIdentifiers");
  uint64_t UTIThatConformsTo = firstUTIThatConformsTo(v9, *MEMORY[0x1E4F44448]);
  CGFloat v11 = (void *)[a3 itemProvider];
  if (UTIThatConformsTo)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    long long v25 = __69__WKFileUploadPanel__uploadItemFromResult_successBlock_failureBlock___block_invoke;
    uint64_t v26 = &unk_1E5813758;
    uint64_t v27 = self;
    id v28 = a5;
    id v29 = a4;
    uint64_t v12 = &v23;
LABEL_5:
    objc_msgSend(v11, "loadFileRepresentationForTypeIdentifier:completionHandler:", UTIThatConformsTo, v12, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    return;
  }
  uint64_t v13 = (void *)[v11 registeredTypeIdentifiers];
  uint64_t v14 = firstUTIThatConformsTo(v13, *MEMORY[0x1E4F44400]);
  if (v14)
  {
    uint64_t UTIThatConformsTo = v14;
    CGFloat v11 = (void *)[a3 itemProvider];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    long long v18 = __69__WKFileUploadPanel__uploadItemFromResult_successBlock_failureBlock___block_invoke_2;
    int v19 = &unk_1E5813758;
    long long v20 = self;
    id v21 = a5;
    id v22 = a4;
    uint64_t v12 = &v16;
    goto LABEL_5;
  }
  CGRect v15 = (void (*)(id))*((void *)a5 + 2);

  v15(a5);
}

void __69__WKFileUploadPanel__uploadItemFromResult_successBlock_failureBlock___block_invoke(void *a1, void *a2, uint64_t a3)
{
  if (a3 || ([a2 isFileURL] & 1) == 0)
  {
    uint64_t v7 = *(void (**)(void))(a1[5] + 16);
    v7();
  }
  else
  {
    uint64_t v5 = (void *)a1[4];
    if (v5)
    {
      [v5 _copyToNewTemporaryDirectory:a2];
      uint64_t v6 = a1[4];
    }
    else
    {
      uint64_t v6 = 0;
      CFTypeRef v17 = 0;
      CFTypeRef cf = 0;
    }
    p_CFTypeRef cf = (uint64_t *)&cf;
    uint64_t v9 = v6 + 1096;
    int v11 = *(_DWORD *)(v6 + 1104);
    uint64_t v10 = *(unsigned int *)(v6 + 1108);
    if (v10 == v11)
    {
      p_CFTypeRef cf = (uint64_t *)WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(v9, v10 + 1, (unint64_t)&cf);
      uint64_t v10 = *(unsigned int *)(v9 + 12);
    }
    uint64_t v12 = (void *)(*(void *)v9 + 8 * v10);
    uint64_t v13 = *p_cf;
    uint64_t *p_cf = 0;
    *uint64_t v12 = v13;
    *(_DWORD *)(v9 + 12) = v10 + 1;
    uint64_t v14 = a1[6];
    CGRect v15 = [(_WKFileUploadItem *)[_WKVideoFileUploadItem alloc] initWithFileURL:v17];
    (*(void (**)(uint64_t, _WKVideoFileUploadItem *))(v14 + 16))(v14, v15);
    if (v15) {
      CFRelease(v15);
    }
    CFTypeRef v16 = cf;
    CFTypeRef cf = 0;
    if (v16) {
      CFRelease(v16);
    }
    if (v17) {
      CFRelease(v17);
    }
  }
}

void __69__WKFileUploadPanel__uploadItemFromResult_successBlock_failureBlock___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  if (a3 || ([a2 isFileURL] & 1) == 0)
  {
    uint64_t v7 = *(void (**)(void))(a1[5] + 16);
    v7();
  }
  else
  {
    uint64_t v5 = (void *)a1[4];
    if (v5)
    {
      [v5 _copyToNewTemporaryDirectory:a2];
      uint64_t v6 = a1[4];
    }
    else
    {
      uint64_t v6 = 0;
      CFTypeRef v17 = 0;
      CFTypeRef cf = 0;
    }
    p_CFTypeRef cf = (uint64_t *)&cf;
    uint64_t v9 = v6 + 1096;
    int v11 = *(_DWORD *)(v6 + 1104);
    uint64_t v10 = *(unsigned int *)(v6 + 1108);
    if (v10 == v11)
    {
      p_CFTypeRef cf = (uint64_t *)WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(v9, v10 + 1, (unint64_t)&cf);
      uint64_t v10 = *(unsigned int *)(v9 + 12);
    }
    uint64_t v12 = (void *)(*(void *)v9 + 8 * v10);
    uint64_t v13 = *p_cf;
    uint64_t *p_cf = 0;
    *uint64_t v12 = v13;
    *(_DWORD *)(v9 + 12) = v10 + 1;
    uint64_t v14 = a1[6];
    CGRect v15 = [(_WKFileUploadItem *)[_WKImageFileUploadItem alloc] initWithFileURL:v17];
    (*(void (**)(uint64_t, _WKImageFileUploadItem *))(v14 + 16))(v14, v15);
    if (v15) {
      CFRelease(v15);
    }
    CFTypeRef v16 = cf;
    CFTypeRef cf = 0;
    if (v16) {
      CFRelease(v16);
    }
    if (v17) {
      CFRelease(v17);
    }
  }
}

- (void)_processMediaInfoDictionaries:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 successBlock:(id)a6 failureBlock:(id)a7
{
  if ([a3 count] == a4)
  {
    uint64_t v13 = (void (*)(id, id))*((void *)a6 + 2);
    v13(a6, a5);
  }
  else
  {
    uint64_t v14 = [a3 objectAtIndex:a4];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __102__WKFileUploadPanel__processMediaInfoDictionaries_atIndex_processedResults_successBlock_failureBlock___block_invoke;
    v15[3] = &unk_1E5813730;
    v15[4] = a5;
    v15[5] = self;
    v15[6] = a3;
    v15[7] = a6;
    v15[8] = a7;
    v15[9] = a4 + 1;
    [(WKFileUploadPanel *)self _uploadItemFromMediaInfo:v14 successBlock:v15 failureBlock:a7];
  }
}

uint64_t __102__WKFileUploadPanel__processMediaInfoDictionaries_atIndex_processedResults_successBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);

  return [v3 _processMediaInfoDictionaries:v5 atIndex:v7 processedResults:v4 successBlock:v6 failureBlock:v8];
}

- (void)_uploadItemForImageData:(id)a3 imageName:(id)a4 successBlock:(id)a5 failureBlock:(id)a6
{
  uint64_t v9 = objc_msgSend((id)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)@"WKWebFileUpload", (NSString *)a2), "stringByAppendingPathComponent:", a4);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v14 = 0;
    [a3 writeToFile:v9 options:1 error:&v14];
    if (v14)
    {
      (*((void (**)(id))a6 + 2))(a6);
    }
    else
    {
      uint64_t v12 = [_WKImageFileUploadItem alloc];
      uint64_t v13 = -[_WKFileUploadItem initWithFileURL:](v12, "initWithFileURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0]);
      (*((void (**)(id, _WKImageFileUploadItem *))a5 + 2))(a5, v13);
      if (v13) {
        CFRelease(v13);
      }
    }
  }
  else
  {
    int v11 = (void (*)(id))*((void *)a6 + 2);
    v11(a6);
  }
}

- (void)_uploadItemForJPEGRepresentationOfImage:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __87__WKFileUploadPanel__uploadItemForJPEGRepresentationOfImage_successBlock_failureBlock___block_invoke;
  v10[3] = &unk_1E5813780;
  v10[4] = a3;
  v10[5] = self;
  v10[6] = a5;
  v10[7] = a4;
  dispatch_async(global_queue, v10);
}

uint64_t __87__WKFileUploadPanel__uploadItemForJPEGRepresentationOfImage_successBlock_failureBlock___block_invoke(uint64_t a1)
{
  v2 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 0.8);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v6 = *(void **)(a1 + 40);
    return [v6 _uploadItemForImageData:v3 imageName:@"image.jpg" successBlock:v4 failureBlock:v5];
  }
  else
  {
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v8();
  }
}

- (void)_uploadItemFromMediaInfo:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  uint64_t v9 = [a3 objectForKey:*MEMORY[0x1E4F43990]];
  uint64_t v10 = (void *)[MEMORY[0x1E4F442D8] typeWithIdentifier:v9];
  if ([v10 conformsToType:*MEMORY[0x1E4F44448]])
  {
    int v11 = (void *)[a3 objectForKey:*MEMORY[0x1E4F43998]];
    if ([v11 isFileURL])
    {
      uint64_t v12 = [(_WKFileUploadItem *)[_WKVideoFileUploadItem alloc] initWithFileURL:v11];
      (*((void (**)(id, _WKVideoFileUploadItem *))a4 + 2))(a4, v12);
      if (!v12) {
        return;
      }
LABEL_4:
      CFRelease(v12);
      return;
    }
    goto LABEL_16;
  }
  if (([v10 conformsToType:*MEMORY[0x1E4F44400]] & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v13 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F43978]];
  if (v13)
  {
    uint64_t v14 = v13;
    if ([v13 isFileURL])
    {
      uint64_t v12 = [(_WKFileUploadItem *)[_WKImageFileUploadItem alloc] initWithFileURL:v14];
      (*((void (**)(id, _WKVideoFileUploadItem *))a4 + 2))(a4, v12);
      if (!v12) {
        return;
      }
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  uint64_t v15 = [a3 objectForKey:*MEMORY[0x1E4F439A0]];
  if (!v15)
  {
LABEL_16:
    CFTypeRef v16 = (void (*)(id))*((void *)a5 + 2);
    v16(a5);
    return;
  }

  [(WKFileUploadPanel *)self _uploadItemForJPEGRepresentationOfImage:v15 successBlock:a4 failureBlock:a5];
}

- (void)_uploadMediaItemsTranscodingVideo:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "indexesOfObjectsPassingTest:", &__block_literal_global_394), "count");
  if (self) {
    CFRetain(self);
  }
  if (a3) {
    CFRetain(a3);
  }
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x28);
  *uint64_t v6 = &unk_1EE9D4EE8;
  v6[1] = self;
  v6[2] = self;
  v6[3] = a3;
  v6[4] = v5;
  uint64_t v7 = v6;
  WTF::ensureOnMainRunLoop();
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }
}

uint64_t __55__WKFileUploadPanel__uploadMediaItemsTranscodingVideo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isVideo];
}

- (pair<WTF::RetainPtr<NSURL>,)_copyToNewTemporaryDirectory:(id)a3
{
  uint64_t v6 = v3;
  uint64_t v30 = 0;
  TemporaryDirectory = (void *)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)@"WKFileUploadPanel", (NSString *)a2);
  if (TemporaryDirectory)
  {
    uint64_t v9 = TemporaryDirectory;
    uint64_t v10 = objc_msgSend(TemporaryDirectory, "stringByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent"));
    int v11 = (const void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v10 isDirectory:0];
    uint64_t v12 = v11;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x4012000000;
    long long v25 = __Block_byref_object_copy__9;
    uint64_t v26 = __Block_byref_object_dispose__9;
    uint64_t v27 = &unk_19964AFC1;
    CFTypeRef v28 = 0;
    CFTypeRef v29 = 0;
    m_ptr = self->_uploadFileCoordinator.m_ptr;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3321888768;
    v20[2] = __50__WKFileUploadPanel__copyToNewTemporaryDirectory___block_invoke;
    v20[3] = &unk_1EE9D4D30;
    v20[4] = self;
    CFTypeRef cf = v11;
    if (v11) {
      CFRetain(v11);
    }
    void v20[5] = v9;
    v20[6] = &v22;
    [m_ptr coordinateWritingItemAtURL:a3 options:2 error:&v30 byAccessor:v20];
    if (v30)
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v9 isDirectory:1];
      *uint64_t v6 = a3;
      if (a3) {
        CFRetain(a3);
      }
      v6[1] = (id)v14;
    }
    else
    {
      uint64_t v15 = v23;
      CFTypeRef v16 = (void *)v23[6];
      *uint64_t v6 = v16;
      if (v16) {
        CFRetain(v16);
      }
      CFTypeRef v17 = (void *)v15[7];
      v6[1] = v17;
      if (v17) {
        CFRetain(v17);
      }
    }
    CFTypeRef v18 = cf;
    CFTypeRef cf = 0;
    if (v18) {
      CFRelease(v18);
    }
    _Block_object_dispose(&v22, 8);
    CFTypeRef v19 = v29;
    CFTypeRef v29 = 0;
    if (v19) {
      CFRelease(v19);
    }
    TemporaryDirectory = (void *)v28;
    CFTypeRef v28 = 0;
    if (TemporaryDirectory) {
      CFRelease(TemporaryDirectory);
    }
    if (v12) {
      CFRelease(v12);
    }
  }
  else
  {
    *uint64_t v6 = a3;
    if (a3) {
      TemporaryDirectory = (void *)CFRetain(a3);
    }
    v6[1] = 0;
  }
  result.var1.m_ptr = v8;
  result.var0.m_ptr = TemporaryDirectory;
  return result;
}

void __50__WKFileUploadPanel__copyToNewTemporaryDirectory___block_invoke(void *a1, const void *a2)
{
  uint64_t v10 = 0;
  if ([*(id *)(a1[4] + 1112) moveItemAtURL:a2 toURL:a1[7] error:&v10]) {
    BOOL v4 = v10 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    uint64_t v6 = (const void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a1[5] isDirectory:1];
    uint64_t v7 = (const void *)a1[7];
    CFTypeRef v8 = v7;
    if (v7) {
      CFRetain(v7);
    }
    CFTypeRef cf = v6;
  }
  else
  {
    uint64_t v5 = (const void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a1[5] isDirectory:1];
    CFTypeRef v8 = a2;
    if (a2) {
      CFRetain(a2);
    }
    CFTypeRef cf = v5;
  }
  std::pair<WTF::RetainPtr<NSURL>,WTF::RetainPtr<NSURL>>::operator=[abi:sn180100](*(void *)(a1[6] + 8) + 48, (uint64_t *)&v8);
  if (cf) {
    CFRelease(cf);
  }
  if (v8) {
    CFRelease(v8);
  }
}

- (BOOL)platformSupportsPickerViewController
{
  return 1;
}

- (WKFileUploadPanelDelegate)delegate
{
  return (WKFileUploadPanelDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  m_ptr = self->_uploadFileCoordinator.m_ptr;
  self->_uploadFileCoordinator.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v5 = self->_uploadFileManager.m_ptr;
  self->_uploadFileManager.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_temporaryUploadedFileURLs, v3);
  uint64_t v6 = self->_documentPickerController.m_ptr;
  self->_documentPickerController.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_menuPresenter, 0);
  uint64_t v7 = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  CFTypeRef v8 = self->_photoPicker.m_ptr;
  self->_photoPicker.m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = self->_cameraPicker.m_ptr;
  self->_cameraPicker.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = self->_mediaTranscoder.m_ptr;
  self->_mediaTranscoder.m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  int v11 = self->_acceptedUTIs.m_ptr;
  self->_acceptedUTIs.m_ptr = 0;
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v12 = self->_listener.m_ptr;
  self->_listener.m_ptr = 0;
  if (v12) {
    CFRelease(*((CFTypeRef *)v12 + 1));
  }

  objc_destroyWeak(&self->_view.m_weakReference);
}

- (id).cxx_construct
{
  *((void *)self + 122) = 0;
  *((void *)self + 123) = 0;
  *((void *)self + 124) = 0;
  *((unsigned char *)self + 1000) = 0;
  *((void *)self + 129) = 0;
  *((void *)self + 130) = 0;
  *((void *)self + 131) = 0;
  *((void *)self + 132) = 0;
  *((void *)self + 134) = 0;
  *((void *)self + 135) = 0;
  *((void *)self + 137) = 0;
  *((void *)self + 138) = 0;
  *((void *)self + 139) = 0;
  *((void *)self + 140) = 0;
  return self;
}

- (void)documentPicker:didPickDocumentsAtURLs:
{
  *a1 = &unk_1EE9D4DF8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (CFTypeRef)documentPicker:didPickDocumentsAtURLs:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v4) {
    goto LABEL_23;
  }
  uint64_t v5 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v28 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void **)(a1 + 32);
      if (v7)
      {
        [v7 _copyToNewTemporaryDirectory:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        if (v25) {
          objc_msgSend(v2, "addObject:");
        }
      }
      else
      {
        CFTypeRef v25 = 0;
        CFTypeRef cf = 0;
      }
      CFTypeRef v8 = cf;
      if (!cf)
      {
        CFTypeRef cf = 0;
        goto LABEL_19;
      }
      uint64_t v9 = *(void *)(a1 + 32) + 1096;
      uint64_t v10 = *(unsigned int *)(*(void *)(a1 + 32) + 1108);
      if (v10 != *(_DWORD *)(*(void *)(a1 + 32) + 1104))
      {
        *(void *)(*(void *)v9 + 8 * v10) = cf;
LABEL_16:
        CFRetain(v8);
        LODWORD(v12) = *(_DWORD *)(v9 + 12);
        goto LABEL_17;
      }
      int v11 = (CFTypeRef *)WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(*(void *)(a1 + 32) + 1096, v10 + 1, (unint64_t)&cf);
      uint64_t v12 = *(unsigned int *)(v9 + 12);
      CFTypeRef v8 = *v11;
      *(void *)(*(void *)v9 + 8 * v12) = v8;
      if (v8) {
        goto LABEL_16;
      }
LABEL_17:
      *(_DWORD *)(v9 + 12) = v12 + 1;
      CFTypeRef v13 = cf;
      CFTypeRef cf = 0;
      if (v13) {
        CFRelease(v13);
      }
LABEL_19:
      CFTypeRef v14 = v25;
      CFTypeRef v25 = 0;
      if (v14) {
        CFRelease(v14);
      }
    }
    uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v4);
LABEL_23:
  id Weak = objc_loadWeak((id *)(*(void *)(a1 + 32) + 976));
  uint64_t v16 = *(void *)(a1 + 32) + 1096;
  CFTypeRef v25 = *(CFTypeRef *)v16;
  CFTypeRef cf = *(CFTypeRef *)(v16 + 8);
  uint64_t v23 = 0;
  *(void *)uint64_t v16 = 0;
  LODWORD(v24) = 0;
  *(_DWORD *)(v16 + 8) = 0;
  HIDWORD(v24) = 0;
  *(_DWORD *)(v16 + 12) = 0;
  objc_msgSend(Weak, "_removeTemporaryDirectoriesWhenDeallocated:", &v25, v23, v24);
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v25, v17);
  CFTypeRef v19 = (WTF::RunLoop *)WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v23, v18);
  WTF::RunLoop::main(v19);
  uint64_t v20 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  id v21 = (void *)WTF::fastMalloc((WTF *)0x18);
  *id v21 = &unk_1EE9D4DF8;
  v21[1] = v20;
  v21[2] = v2;
  CFTypeRef v25 = v21;
  WTF::RunLoop::dispatch();
  CFTypeRef result = v25;
  CFTypeRef v25 = 0;
  if (result) {
    return (CFTypeRef)(*(uint64_t (**)(CFTypeRef))(*(void *)result + 8))(result);
  }
  return result;
}

- (uint64_t)documentPicker:didPickDocumentsAtURLs:
{
  *(void *)this = &unk_1EE9D4DF8;
  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)documentPicker:didPickDocumentsAtURLs:
{
  v14[1] = *(WTF::StringImpl **)MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 8);
  v2 = *(void **)(a1 + 16);
  uint64_t v4 = (WebCore *)[v2 count];
  if (v4 == (WebCore *)1)
  {
    uint64_t v5 = (__CFString *)objc_msgSend((id)objc_msgSend(v2, "objectAtIndexedSubscript:", 0), "lastPathComponent");
  }
  else
  {
    WebCore::multipleFileUploadText(v4);
    if (v12[0])
    {
      uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      uint64_t v7 = v12[0];
      v12[0] = 0;
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v6);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
    else
    {
      uint64_t v5 = &stru_1EEA10550;
    }
  }
  MEMORY[0x19972EAD0](v14, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "objectAtIndexedSubscript:", 0), "absoluteString"));
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v12, (_DWORD **)v14, 1uLL);
  WebKit::iconForFiles((uint64_t)v12, &cf);
  [v3 _chooseFiles:v2 displayString:v5 iconImage:cf];
  CFTypeRef v9 = cf;
  CFTypeRef cf = 0;
  if (v9) {
    CFRelease(v9);
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v12, v8);
  CFTypeRef result = v14[0];
  v14[0] = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v10);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (void)_uploadMediaItemsTranscodingVideo:(void *)a1
{
  *a1 = &unk_1EE9D4EE8;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)_uploadMediaItemsTranscodingVideo:(WTF *)this
{
  *(void *)this = &unk_1EE9D4EE8;
  uint64_t v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)_uploadMediaItemsTranscodingVideo:(void *)a1
{
  if (a1[4])
  {
    v2 = [WKFileUploadMediaTranscoder alloc];
    uint64_t v3 = a1[3];
    uint64_t v4 = a1[4];
    uint64_t v5 = (void *)a1[1];
    id v14 = 0;
    objc_initWeak(&v14, v5);
    uint64_t v6 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v6 = &unk_1EE9D4F10;
    *(void *)(v6 + 8) = 0;
    objc_moveWeak((id *)(v6 + 8), &v14);
    uint64_t v15 = v6;
    uint64_t v7 = [(WKFileUploadMediaTranscoder *)v2 initWithItems:v3 videoCount:v4 completionHandler:&v15];
    uint64_t v8 = a1[1];
    CFTypeRef v9 = *(const void **)(v8 + 1032);
    *(void *)(v8 + 1032) = v7;
    if (v9) {
      CFRelease(v9);
    }
    uint64_t v10 = v15;
    uint64_t v15 = 0;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
    objc_destroyWeak(&v14);
    return [*(id *)(a1[1] + 1032) start];
  }
  else
  {
    uint64_t v12 = (void *)a1[1];
    uint64_t v13 = a1[3];
    return [v12 _chooseMediaItems:v13];
  }
}

- (uint64_t)_uploadMediaItemsTranscodingVideo:
{
  *a1 = &unk_1EE9D4F10;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_uploadMediaItemsTranscodingVideo:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    [WeakRetained _chooseMediaItems:a2];
    CFRelease(v4);
  }
}

@end