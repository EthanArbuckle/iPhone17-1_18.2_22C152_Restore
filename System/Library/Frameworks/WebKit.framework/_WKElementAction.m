@interface _WKElementAction
+ (id)_elementActionWithType:(int64_t)a3 customTitle:(id)a4 assistant:(id)a5;
+ (id)_elementActionWithType:(int64_t)a3 customTitle:(id)a4 assistant:(id)a5 disabled:(BOOL)a6;
+ (id)_elementActionWithType:(int64_t)a3 info:(id)a4 assistant:(id)a5;
+ (id)_elementActionWithType:(int64_t)a3 info:(id)a4 assistant:(id)a5 disabled:(BOOL)a6;
+ (id)_elementActionWithType:(int64_t)a3 title:(id)a4 actionHandler:(id)a5;
+ (id)elementActionWithTitle:(id)a3 actionHandler:(id)a4;
+ (id)elementActionWithType:(int64_t)a3;
+ (id)elementActionWithType:(int64_t)a3 customTitle:(id)a4;
+ (id)elementActionWithType:(int64_t)a3 title:(id)a4 actionHandler:(id)a5;
+ (id)imageForElementActionType:(int64_t)a3;
+ (int64_t)elementActionTypeForUIActionIdentifier:(id)a3;
- (BOOL)disabled;
- (NSString)title;
- (id).cxx_construct;
- (id)_initWithTitle:(id)a3 actionHandler:(id)a4 type:(int64_t)a5 assistant:(id)a6;
- (id)_initWithTitle:(id)a3 actionHandler:(id)a4 type:(int64_t)a5 assistant:(id)a6 disabled:(BOOL)a7;
- (id)dismissalHandler;
- (id)uiActionForElementInfo:(id)a3;
- (int64_t)type;
- (void)_runActionWithElementInfo:(id)a3 forActionSheetAssistant:(id)a4;
- (void)dealloc;
- (void)runActionWithElementInfo:(id)a3;
- (void)setDismissalHandler:(id)a3;
@end

@implementation _WKElementAction

- (id)_initWithTitle:(id)a3 actionHandler:(id)a4 type:(int64_t)a5 assistant:(id)a6
{
  return [(_WKElementAction *)self _initWithTitle:a3 actionHandler:a4 type:a5 assistant:a6 disabled:0];
}

- (id)_initWithTitle:(id)a3 actionHandler:(id)a4 type:(int64_t)a5 assistant:(id)a6 disabled:(BOOL)a7
{
  v16.receiver = self;
  v16.super_class = (Class)_WKElementAction;
  v12 = [(_WKElementAction *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [a3 copy];
    m_ptr = v12->_title.m_ptr;
    v12->_title.m_ptr = (void *)v13;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v12->_type = a5;
    v12->_actionHandler = (id)[a4 copy];
    v12->_disabled = a7;
    objc_storeWeak(&v12->_defaultActionSheetAssistant.m_weakReference, a6);
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKElementAction;
  [(_WKElementAction *)&v3 dealloc];
}

+ (id)elementActionWithTitle:(id)a3 actionHandler:(id)a4
{
  id v6 = objc_alloc((Class)a1);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57___WKElementAction_elementActionWithTitle_actionHandler___block_invoke;
  v8[3] = &unk_1E58127A8;
  v8[4] = a4;
  return (id)(id)CFMakeCollectable((CFTypeRef)[v6 _initWithTitle:a3 actionHandler:v8 type:0 assistant:0]);
}

+ (id)elementActionWithType:(int64_t)a3 title:(id)a4 actionHandler:(id)a5
{
  return +[_WKElementAction _elementActionWithType:a3 title:a4 actionHandler:a5];
}

+ (id)_elementActionWithType:(int64_t)a3 title:(id)a4 actionHandler:(id)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___WKElementAction__elementActionWithType_title_actionHandler___block_invoke;
  v6[3] = &unk_1E58127A8;
  v6[4] = a5;
  return (id)(id)CFMakeCollectable((CFTypeRef)[objc_alloc((Class)a1) _initWithTitle:a4 actionHandler:v6 type:a3 assistant:0]);
}

+ (id)_elementActionWithType:(int64_t)a3 customTitle:(id)a4 assistant:(id)a5
{
  return (id)[a1 _elementActionWithType:a3 customTitle:a4 assistant:a5 disabled:0];
}

+ (id)_elementActionWithType:(int64_t)a3 customTitle:(id)a4 assistant:(id)a5 disabled:(BOOL)a6
{
  BOOL v7 = a6;
  v11 = 0;
  v12 = &stru_1EEA10550;
  switch(a3)
  {
    case 1:
      WebCore::localizedString((uint64_t *)&v45, (WebCore *)@"Open", (const __CFString *)a2);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v14 = v45;
        v45 = 0;
        if (v14)
        {
          if (*(_DWORD *)v14 == 2) {
            WTF::StringImpl::destroy(v14, v13);
          }
          else {
            *(_DWORD *)v14 -= 2;
          }
        }
      }
      v11 = v43;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_2;
      v43[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v43[4] = 1;
      goto LABEL_63;
    case 2:
      WebCore::localizedString((uint64_t *)&v45, (WebCore *)@"Copy (ActionSheet)", (const __CFString *)a2);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        objc_super v16 = v45;
        v45 = 0;
        if (v16)
        {
          if (*(_DWORD *)v16 == 2) {
            WTF::StringImpl::destroy(v16, v15);
          }
          else {
            *(_DWORD *)v16 -= 2;
          }
        }
      }
      v11 = v44;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke;
      v44[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v44[4] = 2;
      goto LABEL_63;
    case 3:
      WebCore::localizedString((uint64_t *)&v45, (WebCore *)@"Save to Photos", (const __CFString *)a2);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v18 = v45;
        v45 = 0;
        if (v18)
        {
          if (*(_DWORD *)v18 == 2) {
            WTF::StringImpl::destroy(v18, v17);
          }
          else {
            *(_DWORD *)v18 -= 2;
          }
        }
      }
      v11 = v42;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_3;
      v42[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v42[4] = 3;
      goto LABEL_63;
    case 4:
      WebCore::localizedString((uint64_t *)&v45, (WebCore *)@"Add to Reading List", (const __CFString *)a2);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v20 = v45;
        v45 = 0;
        if (v20)
        {
          if (*(_DWORD *)v20 == 2) {
            WTF::StringImpl::destroy(v20, v19);
          }
          else {
            *(_DWORD *)v20 -= 2;
          }
        }
      }
      v11 = &__block_literal_global_21;
      goto LABEL_63;
    case 7:
      WebCore::localizedString((uint64_t *)&v45, (WebCore *)@"Share…", (const __CFString *)a2);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v23 = v45;
        v45 = 0;
        if (v23)
        {
          if (*(_DWORD *)v23 == 2) {
            WTF::StringImpl::destroy(v23, v22);
          }
          else {
            *(_DWORD *)v23 -= 2;
          }
        }
      }
      v11 = v41;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_5;
      v41[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v41[4] = 7;
      goto LABEL_63;
    case 11:
      goto LABEL_63;
    case 12:
      WebCore::localizedString((uint64_t *)&v45, (WebCore *)@"Show Text", (const __CFString *)a2);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v25 = v45;
        v45 = 0;
        if (v25)
        {
          if (*(_DWORD *)v25 == 2) {
            WTF::StringImpl::destroy(v25, v24);
          }
          else {
            *(_DWORD *)v25 -= 2;
          }
        }
      }
      v11 = v40;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_6;
      v40[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v40[4] = 12;
      goto LABEL_63;
    case 13:
      WebCore::contextMenuItemTagLookUpImage((uint64_t *)&v45, (WebCore *)a1);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v27 = v45;
        v45 = 0;
        if (v27)
        {
          if (*(_DWORD *)v27 == 2) {
            WTF::StringImpl::destroy(v27, v26);
          }
          else {
            *(_DWORD *)v27 -= 2;
          }
        }
      }
      v11 = v39;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_7;
      v39[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v39[4] = 13;
      goto LABEL_63;
    case 14:
      WebCore::contextMenuItemTagCopySubject((uint64_t *)&v45, (WebCore *)a1);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v29 = v45;
        v45 = 0;
        if (v29)
        {
          if (*(_DWORD *)v29 == 2) {
            WTF::StringImpl::destroy(v29, v28);
          }
          else {
            *(_DWORD *)v29 -= 2;
          }
        }
      }
      v11 = v38;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_8;
      v38[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v38[4] = 14;
      goto LABEL_63;
    case 15:
      WebCore::localizedString((uint64_t *)&v45, (WebCore *)@"Play Animation", (const __CFString *)a2);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v31 = v45;
        v45 = 0;
        if (v31)
        {
          if (*(_DWORD *)v31 == 2) {
            WTF::StringImpl::destroy(v31, v30);
          }
          else {
            *(_DWORD *)v31 -= 2;
          }
        }
      }
      v11 = v37;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_9;
      v37[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v37[4] = 15;
      goto LABEL_63;
    case 16:
      WebCore::localizedString((uint64_t *)&v45, (WebCore *)@"Pause Animation", (const __CFString *)a2);
      if (v45)
      {
        v12 = (__CFString *)WTF::StringImpl::operator NSString *();
        v33 = v45;
        v45 = 0;
        if (v33)
        {
          if (*(_DWORD *)v33 == 2) {
            WTF::StringImpl::destroy(v33, v32);
          }
          else {
            *(_DWORD *)v33 -= 2;
          }
        }
      }
      v11 = v36;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_10;
      v36[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v36[4] = 16;
LABEL_63:
      id v34 = objc_alloc((Class)a1);
      if (a4) {
        id v35 = a4;
      }
      else {
        id v35 = v12;
      }
      id result = (id)CFMakeCollectable((CFTypeRef)[v34 _initWithTitle:v35 actionHandler:v11 type:a3 assistant:a5 disabled:v7]);
      break;
    default:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"There is no standard web element action of type %ld.", a3);
      id result = 0;
      break;
  }
  return result;
}

+ (id)_elementActionWithType:(int64_t)a3 info:(id)a4 assistant:(id)a5
{
  return (id)[a1 _elementActionWithType:a3 info:a4 assistant:a5 disabled:0];
}

+ (id)_elementActionWithType:(int64_t)a3 info:(id)a4 assistant:(id)a5 disabled:(BOOL)a6
{
  BOOL v6 = a6;
  if (a3 != 2 || [a4 type] || (objc_msgSend(a4, "_isImage") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    WebCore::localizedString((uint64_t *)&v16, (WebCore *)@"Copy Link (ActionSheet)", v11);
    if (v16)
    {
      v12 = (__CFString *)WTF::StringImpl::operator NSString *();
      v15 = v16;
      objc_super v16 = 0;
      if (v15)
      {
        if (*(_DWORD *)v15 == 2) {
          WTF::StringImpl::destroy(v15, v14);
        }
        else {
          *(_DWORD *)v15 -= 2;
        }
      }
    }
    else
    {
      v12 = &stru_1EEA10550;
    }
  }
  return (id)[a1 _elementActionWithType:a3 customTitle:v12 assistant:a5 disabled:v6];
}

+ (id)elementActionWithType:(int64_t)a3 customTitle:(id)a4
{
  return (id)[a1 _elementActionWithType:a3 customTitle:a4 assistant:0];
}

+ (id)elementActionWithType:(int64_t)a3
{
  return (id)[a1 elementActionWithType:a3 customTitle:0];
}

- (NSString)title
{
  return (NSString *)self->_title.m_ptr;
}

- (void)_runActionWithElementInfo:(id)a3 forActionSheetAssistant:(id)a4
{
}

- (void)runActionWithElementInfo:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_defaultActionSheetAssistant.m_weakReference);
  [(_WKElementAction *)self _runActionWithElementInfo:a3 forActionSheetAssistant:WeakRetained];
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
  }
}

+ (id)imageForElementActionType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
    case 5:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"safari";
      goto LABEL_3;
    case 2:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"doc.on.doc";
      goto LABEL_3;
    case 3:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"square.and.arrow.down";
      goto LABEL_3;
    case 4:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"eyeglasses";
      goto LABEL_3;
    case 6:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"arrow.up.forward.app";
      goto LABEL_3;
    case 7:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"square.and.arrow.up";
      goto LABEL_3;
    case 8:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"plus.square.on.square";
      goto LABEL_3;
    case 9:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"square.grid.2x2";
      goto LABEL_3;
    case 10:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"arrow.down.circle";
      goto LABEL_3;
    case 12:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"text.viewfinder";
      goto LABEL_3;
    case 13:
      BOOL v6 = (void *)MEMORY[0x1E4F42A80];
      BOOL v7 = @"info.circle.and.sparkles";
      return (id)[v6 _systemImageNamed:v7];
    case 14:
      BOOL v6 = (void *)MEMORY[0x1E4F42A80];
      BOOL v7 = @"circle.dashed.rectangle";
      return (id)[v6 _systemImageNamed:v7];
    case 15:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"play.circle";
      goto LABEL_3;
    case 16:
      objc_super v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"pause.circle";
LABEL_3:
      id result = (id)[v3 systemImageNamed:v4];
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

+ (int64_t)elementActionTypeForUIActionIdentifier:(id)a3
{
  if ([a3 isEqualToString:@"WKElementActionTypeCustom"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeOpen"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeCopy"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeSaveImage"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeAddToReadingList"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeOpenInDefaultBrowser"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeOpenInExternalApplication"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeShare"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeOpenInNewTab"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeOpenInNewWindow"]) {
    return 9;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeDownload"]) {
    return 10;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeToggleShowLinkPreviews"]) {
    return 11;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeImageExtraction"]) {
    return 12;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeRevealImage"]) {
    return 13;
  }
  if ([a3 isEqualToString:@"WKElementActionTypeCopySubject"]) {
    return 14;
  }
  if ([a3 isEqualToString:@"WKElementActionPlayAnimation"]) {
    return 15;
  }
  if ([a3 isEqualToString:@"WKElementActionPauseAnimation"]) {
    return 16;
  }
  return 0;
}

- (id)uiActionForElementInfo:(id)a3
{
  id v5 = +[_WKElementAction imageForElementActionType:[(_WKElementAction *)self type]];
  BOOL v6 = elementActionTypeToUIActionIdentifier([(_WKElementAction *)self type]);
  BOOL v7 = (void *)MEMORY[0x1E4F426E8];
  v8 = [(_WKElementAction *)self title];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3321888768;
  v15 = __43___WKElementAction_uiActionForElementInfo___block_invoke;
  objc_super v16 = &__block_descriptor_48_e8_32c56_ZTSKZ43___WKElementAction_uiActionForElementInfo__E3__2_e18_v16__0__UIAction_8l;
  if (self) {
    CFRetain(self);
  }
  if (a3) {
    CFRetain(a3);
  }
  CFTypeRef v17 = self;
  if (self) {
    CFRetain(self);
  }
  CFTypeRef cf = a3;
  if (a3) {
    CFRetain(a3);
  }
  v9 = (void *)[v7 actionWithTitle:v8 image:v5 identifier:v6 handler:&v13];
  if (a3) {
    CFRelease(a3);
  }
  if (self) {
    CFRelease(self);
  }
  if ([(_WKElementAction *)self disabled]) {
    objc_msgSend(v9, "setAttributes:", objc_msgSend(v9, "attributes") | 1);
  }
  CFTypeRef v10 = cf;
  CFTypeRef cf = 0;
  if (v10) {
    CFRelease(v10);
  }
  CFTypeRef v11 = v17;
  CFTypeRef v17 = 0;
  if (v11) {
    CFRelease(v11);
  }
  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_defaultActionSheetAssistant.m_weakReference);
  m_ptr = self->_title.m_ptr;
  self->_title.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end