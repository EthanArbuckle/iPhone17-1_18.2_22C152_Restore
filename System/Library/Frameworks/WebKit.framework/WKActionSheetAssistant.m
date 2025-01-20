@interface WKActionSheetAssistant
- (BOOL)_appendAppLinkOpenActionsForURL:(id)a3 actions:(id)a4 elementInfo:(id)a5;
- (BOOL)hasContextMenuInteraction;
- (BOOL)isShowingSheet;
- (BOOL)needsLinkIndicator;
- (BOOL)presentSheet;
- (BOOL)synchronouslyRetrievePositionInformation;
- (CGRect)_presentationRectForSheetGivenPoint:(CGPoint)a3 inHostView:(id)a4;
- (CGRect)initialPresentationRectInHostViewForSheet;
- (CGRect)presentationRectForElementUsingClosestIndicatedRect;
- (CGRect)presentationRectForIndicatedElement;
- (CGRect)presentationRectInHostViewForSheet;
- (RetainPtr<NSArray<_WKElementAction)defaultActionsForImageSheet:(id)a3;
- (RetainPtr<NSArray<_WKElementAction)defaultActionsForLinkSheet:(id)a3;
- (WKActionSheetAssistant)initWithView:(id)a3;
- (WKActionSheetAssistantDelegate)delegate;
- (id).cxx_construct;
- (id)_contentsOfContextMenuItem:(id)a3;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_elementActionForDDAction:(id)a3;
- (id)_uiMenuElementsForMediaControlContextMenuItems:(void *)a3;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)currentlyAvailableActionTitles;
- (id)currentlyAvailableMediaControlsContextMenuItems;
- (id)suggestedActionsForContextMenuWithPositionInformation:(const void *)a3;
- (id)superviewForSheet;
- (int64_t)_presentationStyleForPositionInfo:(const void *)a3 elementInfo:(id)a4;
- (optional<WebKit::InteractionInformationAtPosition>)currentPositionInformation;
- (void)_appendAnimationAction:(id)a3 elementInfo:(id)a4;
- (void)_appendOpenActionsForURL:(id)a3 actions:(id)a4 elementInfo:(id)a5;
- (void)_createSheetWithElementActions:(id)a3 defaultTitle:(id)a4 showLinkTitle:(BOOL)a5;
- (void)_dataDetectorContextMenuPresenter;
- (void)_mediaControlsContextMenuPresenter;
- (void)_resetDataDetectorContextMenuPresenter;
- (void)_resetMediaControlsContextMenuPresenter;
- (void)cleanupSheet;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)handleElementActionWithType:(int64_t)a3 element:(id)a4 needsInteraction:(BOOL)a5;
- (void)interactionDidStartWithPositionInformation:(const void *)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsLinkIndicator:(BOOL)a3;
- (void)showDataDetectorsUIForPositionInformation:(const void *)a3;
- (void)showImageSheet;
- (void)showLinkSheet;
- (void)showMediaControlsContextMenu:(FloatRect *)a3 items:(void *)a4 completionHandler:(void *)a5;
- (void)updatePositionInformation;
- (void)updateSheetPosition;
@end

@implementation WKActionSheetAssistant

- (void)setDelegate:(id)a3
{
}

- (WKActionSheetAssistant)initWithView:(id)a3
{
  return self;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 672) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  *((unsigned char *)self + 32) = 0;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 45) = 0u;
  *((void *)self + 92) = 0;
  return self;
}

- (WKActionSheetAssistantDelegate)delegate
{
  return (WKActionSheetAssistantDelegate *)objc_loadWeak(&self->_delegate.m_weakReference);
}

- (void)dealloc
{
  [(WKActionSheetAssistant *)self cleanupSheet];
  [(WKActionSheetAssistant *)self _resetDataDetectorContextMenuPresenter];
  [(WKActionSheetAssistant *)self _resetMediaControlsContextMenuPresenter];
  v3.receiver = self;
  v3.super_class = (Class)WKActionSheetAssistant;
  [(WKActionSheetAssistant *)&v3 dealloc];
}

- (BOOL)synchronouslyRetrievePositionInformation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    [WeakRetained positionInformationForActionSheetAssistant:self];
    p_positionInformation = &self->_positionInformation;
    if (self->_anon_210[144] == v12)
    {
      if (!self->_anon_210[144])
      {
LABEL_12:
        BOOL v8 = self->_anon_210[144] != 0;
        CFRelease(v4);
        return v8;
      }
      WebKit::InteractionInformationAtPosition::operator=((uint64_t)p_positionInformation, (uint64_t)v11);
    }
    else
    {
      if (self->_anon_210[144])
      {
        WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)p_positionInformation, v5);
        unsigned __int8 v9 = 0;
      }
      else
      {
        WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((uint64_t)p_positionInformation, (uint64_t)v11);
        unsigned __int8 v9 = 1;
      }
      self->_anon_210[144] = v9;
    }
    if (v12) {
      WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v11, v7);
    }
    goto LABEL_12;
  }
  return 0;
}

- (id)superviewForSheet
{
  id Weak = objc_loadWeak(&self->_view.m_weakReference);
  v4 = (void *)[Weak window];
  if (!Weak) {
    return v4;
  }
  v5 = 0;
  do
  {
    uint64_t v6 = WebCore::viewController((WebCore *)Weak, v3);
    if (v6) {
      v5 = (void *)v6;
    }
    id Weak = (id)[Weak superview];
  }
  while (Weak);
  if (!v5) {
    return v4;
  }

  return (id)[v5 view];
}

- (CGRect)_presentationRectForSheetGivenPoint:(CGPoint)a3 inHostView:(id)a4
{
  objc_msgSend(a4, "convertPoint:fromView:", objc_loadWeak(&self->_view.m_weakReference), a3.x, a3.y);
  double v6 = 1.0;
  double v7 = 1.0;

  return CGRectInset(*(CGRect *)&v4, -22.0, -22.0);
}

- (CGRect)presentationRectForElementUsingClosestIndicatedRect
{
  id v3 = [(WKActionSheetAssistant *)self superviewForSheet];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v5 = WeakRetained;
  if (v3 && WeakRetained && self->_anon_210[144])
  {
    WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)v42, (const WebCore::TextIndicatorData *)(&self->_positionInformation.var0.__engaged_ + 280));
    if (!v46)
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_25:
      if ((v50 & 0x8000000000000) != 0)
      {
        v35 = (unsigned int *)(v50 & 0xFFFFFFFFFFFFLL);
        if (atomic_fetch_add((atomic_uint *volatile)(v50 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v35);
          WTF::fastFree((WTF *)v35, v6);
        }
      }
      v31 = v49;
      v49 = 0;
      if (v31)
      {
        if (v31[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v31 + 8))(v31);
        }
        else {
          --v31[2];
        }
      }
      v32 = v48;
      v48 = 0;
      if (v32)
      {
        if (v32[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v32 + 8))(v32);
        }
        else {
          --v32[2];
        }
      }
      v33 = v47;
      v47 = 0;
      if (v33)
      {
        if (v33[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v33 + 8))(v33);
        }
        else {
          --v33[2];
        }
      }
      v34 = v44;
      if (v44)
      {
        v44 = 0;
        int v45 = 0;
        WTF::fastFree(v34, v6);
      }
      goto LABEL_18;
    }
    if (self->_anon_210[144])
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v41, (const IntPoint *)&self->_positionInformation);
      double v7 = v43[0];
      v39 = 0;
      uint64_t v40 = 0;
      unsigned int v11 = v46;
      if (!v46)
      {
LABEL_12:
        WebCore::PathUtilities::pathsWithShrinkWrappedRects();
        if (v38)
        {
          v19 = v37;
          uint64_t v20 = 72 * v38;
          while (1)
          {
            WebCore::Path::fastBoundingRect(v19);
            if (WebCore::FloatRect::contains()) {
              break;
            }
            v19 = (WebCore::Path *)((char *)v19 + 72);
            v20 -= 72;
            if (!v20) {
              goto LABEL_16;
            }
          }
          WebCore::FloatRect::operator CGRect();
          objc_msgSend(v3, "convertRect:fromView:", objc_loadWeak(&self->_view.m_weakReference), v25, v26, v27, v28);
          CGRect v52 = CGRectInset(v51, -15.0, -15.0);
          CGFloat x = v52.origin.x;
          CGFloat y = v52.origin.y;
          CGFloat width = v52.size.width;
          CGFloat height = v52.size.height;
          WTF::Vector<WebCore::Path,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v37, v29);
        }
        else
        {
LABEL_16:
          WTF::Vector<WebCore::Path,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v37, v18);
          CGFloat x = *MEMORY[0x1E4F1DB28];
          CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
          CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
          CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        }
        v30 = v39;
        if (v39)
        {
          v39 = 0;
          LODWORD(v40) = 0;
          WTF::fastFree(v30, v6);
        }
        goto LABEL_25;
      }
      uint64_t v36 = *(void *)&v43[0];
      if (!(v46 >> 28))
      {
        char v12 = (WTF *)WTF::fastMalloc((WTF *)(16 * v46));
        LODWORD(v40) = v11;
        v39 = v12;
        unsigned int v13 = v46;
        v14.i64[0] = v36;
        if (v46)
        {
          v15 = v44;
          v14.i64[1] = 0x4000000040000000;
          uint64_t v16 = v46;
          do
          {
            float32x4_t v17 = *(float32x4_t *)v15;
            v15 = (WTF *)((char *)v15 + 16);
            *(float32x4_t *)char v12 = vaddq_f32(v14, vaddq_f32(v17, (float32x4_t)xmmword_1994F6E50));
            char v12 = (WTF *)((char *)v12 + 16);
            --v16;
          }
          while (v16);
          HIDWORD(v40) = v13;
        }
        goto LABEL_12;
      }
    }
    else
    {
      __break(1u);
    }
    __break(0xC471u);
    goto LABEL_44;
  }
  CGFloat x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_18:
  if (v5) {
    CFRelease(v5);
  }
  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
LABEL_44:
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)presentationRectForIndicatedElement
{
  id v3 = [(WKActionSheetAssistant *)self superviewForSheet];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v5 = WeakRetained;
  if (!v3)
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (!WeakRetained) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    if (self->_anon_210[144])
    {
      long long v18 = *((_OWORD *)&self->_positionInformation.var0.__engaged_ + 11);
      WebCore::IntRect::operator CGRect();
      objc_msgSend(v3, "convertRect:fromView:", objc_loadWeak(&self->_view.m_weakReference), v6, v7, v8, v9, v18);
      CGRect v20 = CGRectInset(v19, -15.0, -15.0);
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
    }
    else
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
LABEL_9:
    CFRelease(v5);
    goto LABEL_10;
  }
  CGFloat x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_10:
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)initialPresentationRectInHostViewForSheet
{
  id v3 = [(WKActionSheetAssistant *)self superviewForSheet];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v5 = WeakRetained;
  if (!v3)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (!WeakRetained) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    if (self->_anon_210[144])
    {
      WebCore::IntPoint::operator CGPoint();
      -[WKActionSheetAssistant _presentationRectForSheetGivenPoint:inHostView:](self, "_presentationRectForSheetGivenPoint:inHostView:", v3);
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
    }
    else
    {
      double v7 = *MEMORY[0x1E4F1DB28];
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
LABEL_9:
    CFRelease(v5);
    goto LABEL_10;
  }
  double v7 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_10:
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)presentationRectInHostViewForSheet
{
  id v3 = [(WKActionSheetAssistant *)self superviewForSheet];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v5 = WeakRetained;
  if (!v3)
  {
    double v19 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (!WeakRetained) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (WeakRetained)
  {
    if (self->_anon_210[144])
    {
      WebCore::IntRect::operator CGRect();
      if (!self->_anon_210[144])
      {
        __break(1u);
        goto LABEL_15;
      }
      CGFloat v10 = v6;
      CGFloat v11 = v7;
      CGFloat v12 = v8;
      CGFloat v13 = v9;
      WebCore::IntPoint::operator CGPoint();
      double MidX = v14;
      double MidY = v16;
      v27.origin.CGFloat x = v10;
      v27.origin.CGFloat y = v11;
      v27.size.CGFloat width = v12;
      v27.size.CGFloat height = v13;
      v26.CGFloat x = MidX;
      v26.CGFloat y = MidY;
      if (!CGRectContainsPoint(v27, v26))
      {
        v28.origin.CGFloat x = v10;
        v28.origin.CGFloat y = v11;
        v28.size.CGFloat width = v12;
        v28.size.CGFloat height = v13;
        double MidX = CGRectGetMidX(v28);
        v29.origin.CGFloat x = v10;
        v29.origin.CGFloat y = v11;
        v29.size.CGFloat width = v12;
        v29.size.CGFloat height = v13;
        double MidY = CGRectGetMidY(v29);
      }
      -[WKActionSheetAssistant _presentationRectForSheetGivenPoint:inHostView:](self, "_presentationRectForSheetGivenPoint:inHostView:", v3, MidX, MidY);
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
    }
    else
    {
      double v19 = *MEMORY[0x1E4F1DB28];
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
LABEL_12:
    CFRelease(v5);
    goto LABEL_13;
  }
  double v19 = *MEMORY[0x1E4F1DB28];
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_13:
  double v6 = v19;
  double v7 = v21;
  double v8 = v23;
  double v9 = v25;
LABEL_15:
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (void)updatePositionInformation
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained updatePositionInformationForActionSheetAssistant:self];
  }
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
  }
}

- (BOOL)presentSheet
{
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom"))
    {
      [(WKActionSheetAssistant *)self initialPresentationRectInHostViewForSheet];
      double x = v10.origin.x;
      double y = v10.origin.y;
      double width = v10.size.width;
      double height = v10.size.height;
      if (CGRectIsEmpty(v10)) {
        return 0;
      }
    }
  }
  m_ptr = self->_interactionSheet.m_ptr;

  return objc_msgSend(m_ptr, "presentSheetFromRect:", x, y, width, height);
}

- (void)updateSheetPosition
{
}

- (BOOL)isShowingSheet
{
  return self->_interactionSheet.m_ptr != 0;
}

- (void)interactionDidStartWithPositionInformation:(const void *)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    if (WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)((char *)a3 + 72), v5))
    {
      uint64_t v6 = WTF::URL::operator NSURL *();
      if (v6)
      {
        uint64_t v7 = v6;
        double v8 = (void *)[(id)((uint64_t (*)(void))*MEMORY[0x1E4FB6370])() sharedController];
        if (objc_opt_respondsToSelector())
        {
          [v8 interactionDidStartForURL:v7];
        }
      }
    }
  }
}

- (optional<WebKit::InteractionInformationAtPosition>)currentPositionInformation
{
  retstr->var0.__null_state_ = 0;
  *(&retstr[1].var0.__engaged_ + 144) = 0;
  if (*(&result[1].var0.__engaged_ + 176))
  {
    CGRect result = (optional<WebKit::InteractionInformationAtPosition> *)WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)retstr, (const WebKit::InteractionInformationAtPosition *)(&result->var0.__engaged_ + 32));
    *(&retstr[1].var0.__engaged_ + 144) = 1;
  }
  return result;
}

- (void)_createSheetWithElementActions:(id)a3 defaultTitle:(id)a4 showLinkTitle:(BOOL)a5
{
  BOOL v6 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id cf = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (cf)
  {
    if (!self->_anon_210[144])
    {
LABEL_32:
      CFRelease(cf);
      return;
    }
    double v9 = (void *)WTF::URL::operator NSURL *();
    CGRect v10 = objc_alloc_init(WKActionSheet);
    m_ptr = self->_interactionSheet.m_ptr;
    self->_interactionSheet.m_ptr = v10;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      CGRect v10 = (WKActionSheet *)self->_interactionSheet.m_ptr;
    }
    -[WKActionSheet setSheetDelegate:](v10, "setSheetDelegate:", self, cf);
    [self->_interactionSheet.m_ptr setPreferredStyle:0];
    if (v6 && objc_msgSend((id)objc_msgSend(v9, "absoluteString"), "length"))
    {
      CGFloat v12 = (void *)[v9 scheme];
      if (!v12 || [v12 caseInsensitiveCompare:@"javascript"])
      {
        double v14 = (void *)WTF::userVisibleString((WTF *)v9, v13);
LABEL_14:
        a4 = v14;
        goto LABEL_15;
      }
      WebCore::localizedString((uint64_t *)&v36, (WebCore *)@"JavaScript Action Sheet Title", (const __CFString *)v13);
      if (v36)
      {
        a4 = (id)WTF::StringImpl::operator NSString *();
        CGPoint v26 = v36;
        uint64_t v36 = 0;
        if (v26)
        {
          if (*(_DWORD *)v26 == 2) {
            WTF::StringImpl::destroy(v26, v25);
          }
          else {
            *(_DWORD *)v26 -= 2;
          }
        }
LABEL_15:
        if ([a4 length]) {
          [self->_interactionSheet.m_ptr setTitle:a4];
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v16 = [a3 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(a3);
              }
              double v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              double v20 = self->_interactionSheet.m_ptr;
              uint64_t v21 = [v19 title];
              v30[4] = v19;
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke;
              v31[3] = &unk_1E5812CB8;
              v31[4] = v19;
              v31[5] = self;
              v30[0] = MEMORY[0x1E4F143A8];
              v30[1] = 3221225472;
              v30[2] = __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke_2;
              v30[3] = &unk_1E5813438;
              [v20 _addActionWithTitle:v21 style:0 handler:v31 shouldDismissHandler:v30];
            }
            uint64_t v16 = [a3 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v16);
        }
        v5 = self->_interactionSheet.m_ptr;
        a4 = (id)MEMORY[0x1E4F42720];
        WebCore::localizedString((uint64_t *)&v36, (WebCore *)@"Cancel button label in button bar", v15);
        if (v36)
        {
          double v22 = (__CFString *)WTF::StringImpl::operator NSString *();
LABEL_26:
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke_3;
          v29[3] = &unk_1E5813460;
          v29[4] = self;
          objc_msgSend(v5, "addAction:", objc_msgSend(a4, "actionWithTitle:style:handler:", v22, 1, v29));
          double v24 = v36;
          uint64_t v36 = 0;
          if (v24)
          {
            if (*(_DWORD *)v24 == 2) {
              WTF::StringImpl::destroy(v24, v23);
            }
            else {
              *(_DWORD *)v24 -= 2;
            }
          }
          if (objc_opt_respondsToSelector()) {
            [cf actionSheetAssistant:self willStartInteractionWithElement:self->_elementInfo.m_ptr];
          }
          goto LABEL_32;
        }
LABEL_40:
        double v22 = &stru_1EEA10550;
        goto LABEL_26;
      }
    }
    else
    {
      if (a4) {
        goto LABEL_15;
      }
      if (!self->_anon_210[144])
      {
        __break(1u);
        goto LABEL_40;
      }
      if (self->_positionInformation.var0.__val_.title.m_impl.m_ptr)
      {
        double v14 = (void *)WTF::StringImpl::operator NSString *();
        goto LABEL_14;
      }
    }
    a4 = &stru_1EEA10550;
    goto LABEL_15;
  }
}

uint64_t __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_runActionWithElementInfo:forActionSheetAssistant:", *(void *)(*(void *)(a1 + 40) + 24));
  v2 = *(void **)(a1 + 40);

  return [v2 cleanupSheet];
}

uint64_t __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) dismissalHandler]) {
    return 1;
  }
  v2 = *(uint64_t (**)(void))([*(id *)(a1 + 32) dismissalHandler] + 16);

  return v2();
}

uint64_t __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupSheet];
}

- (void)showImageSheet
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    if (![(WKActionSheetAssistant *)self synchronouslyRetrievePositionInformation])
    {
LABEL_17:
      CFRelease(v4);
      return;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3321888768;
    v5 = v15;
    v15[0] = __40__WKActionSheetAssistant_showImageSheet__block_invoke;
    v15[1] = &unk_1EE9D3EC8;
    v15[2] = self;
    CFTypeRef v16 = v4;
    CFTypeRef v6 = CFRetain(v4);
    if (!self->_anon_210[144]) {
      goto LABEL_19;
    }
    m_ptr = self->_positionInformation.var0.__val_.url.m_string.m_impl.m_ptr;
    if (m_ptr && *((_DWORD *)m_ptr + 1)
      || !self->_positionInformation.var0.__val_.image.m_ptr
      || (objc_opt_respondsToSelector() & 1) == 0)
    {
      ((void (*)(void *, void, void))v15[0])(v14, 0, 0);
LABEL_15:
      CFTypeRef v10 = v16;
      CFTypeRef v16 = 0;
      if (v10) {
        CFRelease(v10);
      }
      goto LABEL_17;
    }
    CFTypeRef v6 = objc_alloc(MEMORY[0x1E4F42A80]);
    if (self->_anon_210[144])
    {
      double v8 = (void *)v6;
      WebCore::ShareableBitmap::makeCGImageCopy((uint64_t *)&v13, (WebCore::ShareableBitmap *)self->_positionInformation.var0.__val_.image.m_ptr);
      v5 = (void *)[v8 initWithCGImage:v13];
      CFTypeRef v6 = v13;
      CFTypeRef v13 = 0;
      if (!v6)
      {
LABEL_10:
        self->_hasPendingActionSheet = 1;
        CFRetain(self);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3321888768;
        v11[2] = __40__WKActionSheetAssistant_showImageSheet__block_invoke_249;
        v11[3] = &unk_1EE9D3F00;
        CFTypeRef cf = self;
        CFRetain(self);
        v11[4] = v14;
        [v4 actionSheetAssistant:self getAlternateURLForImage:v5 completion:v11];
        CFTypeRef v9 = cf;
        CFTypeRef cf = 0;
        if (v9) {
          CFRelease(v9);
        }
        CFRelease(self);
        if (v5) {
          CFRelease(v5);
        }
        goto LABEL_15;
      }
    }
    else
    {
LABEL_19:
      __break(1u);
    }
    CFRelease(v6);
    goto LABEL_10;
  }
}

void __40__WKActionSheetAssistant_showImageSheet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 672)) {
    goto LABEL_35;
  }
  uint64_t v6 = WTF::URL::operator NSURL *();
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 672)) {
    goto LABEL_35;
  }
  uint64_t v7 = v6;
  uint64_t v8 = WTF::URL::operator NSURL *();
  CFTypeRef v9 = [_WKActivatedElementInfo alloc];
  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v10 + 672)) {
    goto LABEL_35;
  }
  if (v7) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = a2;
  }
  id v12 = [(_WKActivatedElementInfo *)v9 _initWithType:1 URL:v11 imageURL:v8 userInfo:a3 information:v10 + 32];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([*(id *)(a1 + 40) actionSheetAssistant:*(void *)(a1 + 32) showCustomSheetForElement:v12] & 1) == 0)
  {
    CFTypeRef v13 = *(void **)(a1 + 32);
    if (v13)
    {
      [v13 defaultActionsForImageSheet:v12];
      uint64_t v14 = *(void *)(a1 + 32);
      CFTypeRef v13 = (void *)cf;
    }
    else
    {
      uint64_t v14 = 0;
    }
    CFStringRef v15 = *(void **)(a1 + 40);
    CFTypeRef cf = 0;
    uint64_t v21 = v13;
    if (v15)
    {
      [v15 actionSheetAssistant:v14 decideActionsForElement:v12 defaultActions:&v21];
      CFTypeRef v13 = v21;
    }
    else
    {
      CFTypeRef v22 = 0;
    }
    uint64_t v21 = 0;
    if (v13) {
      CFRelease(v13);
    }
    if (![(id)v22 count]) {
      goto LABEL_27;
    }
    if (!a2 && a3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "_cancelAllTouches");
LABEL_27:
      CFTypeRef v19 = v22;
      CFTypeRef v22 = 0;
      if (v19) {
        CFRelease(v19);
      }
      CFTypeRef v20 = cf;
      CFTypeRef cf = 0;
      if (v20) {
        CFRelease(v20);
      }
      goto LABEL_31;
    }
    [*(id *)(a1 + 32) _createSheetWithElementActions:v22 defaultTitle:0 showLinkTitle:1];
    uint64_t v16 = *(void *)(a1 + 32);
    if (!*(void *)(v16 + 16)) {
      goto LABEL_27;
    }
    uint64_t v17 = *(const void **)(v16 + 24);
    *(void *)(v16 + 24) = v12;
    if (v17) {
      CFRelease(v17);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v18 + 672))
    {
      id v12 = 0;
      if ((objc_msgSend(*(id *)(v18 + 16), "presentSheet:", objc_msgSend((id)v18, "_presentationStyleForPositionInfo:elementInfo:", v18 + 32, *(void *)(v18 + 24))) & 1) == 0)objc_msgSend(*(id *)(a1 + 32), "cleanupSheet"); {
      goto LABEL_27;
      }
    }
    std::__throw_bad_optional_access[abi:sn180100]();
LABEL_35:
    __break(1u);
    return;
  }
LABEL_31:
  if (v12) {
    CFRelease(v12);
  }
}

uint64_t __40__WKActionSheetAssistant_showImageSheet__block_invoke_249(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(unsigned char *)(v1 + 746))
  {
    *(unsigned char *)(v1 + 746) = 0;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (int64_t)_presentationStyleForPositionInfo:(const void *)a3 elementInfo:(id)a4
{
  p_view = &self->_view;
  id Weak = objc_loadWeak(&self->_view.m_weakReference);
  WebCore::IntRect::operator CGRect();
  objc_msgSend(Weak, "convertRect:toView:", objc_msgSend(objc_loadWeak(&p_view->m_weakReference), "window"), v9, v10, v11, v12);
  CGFloat x = v46.origin.x;
  CGFloat y = v46.origin.y;
  CGFloat width = v46.size.width;
  CGFloat height = v46.size.height;
  if (CGRectIsEmpty(v46)) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained unoccludedWindowBoundsForActionSheetAssistant:self];
  }
  else {
    objc_msgSend((id)objc_msgSend(objc_loadWeak(&p_view->m_weakReference), "window"), "bounds");
  }
  CGFloat v23 = v19;
  CGFloat v24 = v20;
  CGFloat v25 = v21;
  CGFloat v26 = v22;
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  v58.origin.CGFloat x = v23;
  v58.origin.CGFloat y = v24;
  v58.size.CGFloat width = v25;
  v58.size.CGFloat height = v26;
  CGRect v48 = CGRectIntersection(v47, v58);
  CGFloat v27 = v48.origin.x;
  CGFloat v28 = v48.origin.y;
  CGFloat v29 = v48.size.width;
  CGFloat v30 = v48.size.height;
  double MinX = CGRectGetMinX(v48);
  v49.origin.CGFloat x = v23;
  v49.origin.CGFloat y = v24;
  v49.size.CGFloat width = v25;
  v49.size.CGFloat height = v26;
  double v44 = CGRectGetMinX(v49);
  v50.origin.CGFloat x = v27;
  v50.origin.CGFloat y = v28;
  v50.size.CGFloat width = v29;
  v50.size.CGFloat height = v30;
  double MinY = CGRectGetMinY(v50);
  v51.origin.CGFloat x = v23;
  v51.origin.CGFloat y = v24;
  v51.size.CGFloat width = v25;
  v51.size.CGFloat height = v26;
  double v40 = CGRectGetMinY(v51);
  v52.origin.CGFloat x = v23;
  v52.origin.CGFloat y = v24;
  v52.size.CGFloat width = v25;
  v52.size.CGFloat height = v26;
  double MaxX = CGRectGetMaxX(v52);
  v53.origin.CGFloat x = v27;
  v53.origin.CGFloat y = v28;
  v53.size.CGFloat width = v29;
  v53.size.CGFloat height = v30;
  double v42 = CGRectGetMaxX(v53);
  v54.origin.CGFloat x = v23;
  v54.origin.CGFloat y = v24;
  v54.size.CGFloat width = v25;
  v54.size.CGFloat height = v26;
  double MaxY = CGRectGetMaxY(v54);
  v55.origin.CGFloat x = v27;
  v55.origin.CGFloat y = v28;
  v55.size.CGFloat width = v29;
  v55.size.CGFloat height = v30;
  double v31 = CGRectGetMaxY(v55);
  v56.origin.CGFloat x = v23;
  v56.origin.CGFloat y = v24;
  v56.size.CGFloat width = v25;
  v56.size.CGFloat height = v26;
  double v32 = CGRectGetWidth(v56);
  double v33 = MinX - v44;
  if (MinX - v44 < MaxX - v42) {
    double v33 = MaxX - v42;
  }
  if (v33 <= v32 * 0.4)
  {
    v57.origin.CGFloat x = v23;
    v57.origin.CGFloat y = v24;
    v57.size.CGFloat width = v25;
    v57.size.CGFloat height = v26;
    double v34 = CGRectGetHeight(v57);
    double v35 = MinY - v40;
    if (MinY - v40 < MaxY - v31) {
      double v35 = MaxY - v31;
    }
    if (v35 <= v34 * 0.4)
    {
      int64_t v17 = 0;
      if (!WeakRetained) {
        return v17;
      }
      goto LABEL_19;
    }
  }
  uint64_t v36 = [a4 type];
  if (*((_DWORD *)a3 + 85)) {
    BOOL v37 = v36 == 0;
  }
  else {
    BOOL v37 = 0;
  }
  if (v37) {
    int64_t v17 = 2;
  }
  else {
    int64_t v17 = 1;
  }
  if (WeakRetained) {
LABEL_19:
  }
    CFRelease(WeakRetained);
  return v17;
}

- (BOOL)_appendAppLinkOpenActionsForURL:(id)a3 actions:(id)a4 elementInfo:(id)a5
{
  if (HIBYTE(word_1E93CF7C0) == 1)
  {
    if (!(_BYTE)word_1E93CF7C0)
    {
LABEL_11:
      LOBYTE(v11) = 0;
      return v11;
    }
  }
  else
  {
    if ((WTF::processHasEntitlement() & 1) == 0)
    {
      LOBYTE(v11) = 0;
      word_1E93CF7C0 = 256;
      return v11;
    }
    LODWORD(v11) = WTF::processHasEntitlement();
    LOBYTE(word_1E93CF7C0) = v11;
    HIBYTE(word_1E93CF7C0) = 1;
    if (!v11) {
      return v11;
    }
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  char v10 = [WeakRetained actionSheetAssistant:self shouldIncludeAppLinkActionsForElement:a5];
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  if ((v10 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F22398], "appLinksWithURL:limit:error:", a3, 1, 0), "firstObject");
  if (v11)
  {
    CFTypeRef v13 = (void *)v11;
    WebCore::localizedString((uint64_t *)&v26, (WebCore *)@"Open in Safari", v12);
    if (v26)
    {
      CFStringRef v15 = (__CFString *)WTF::StringImpl::operator NSString *();
      uint64_t v16 = v26;
      CGFloat v26 = 0;
      if (v16)
      {
        if (*(_DWORD *)v16 == 2) {
          WTF::StringImpl::destroy(v16, v14);
        }
        else {
          *(_DWORD *)v16 -= 2;
        }
      }
    }
    else
    {
      CFStringRef v15 = &stru_1EEA10550;
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __78__WKActionSheetAssistant__appendAppLinkOpenActionsForURL_actions_elementInfo___block_invoke;
    v25[3] = &unk_1E5813488;
    v25[4] = v13;
    objc_msgSend(a4, "addObject:", +[_WKElementAction _elementActionWithType:title:actionHandler:](_WKElementAction, "_elementActionWithType:title:actionHandler:", 5, v15, v25));
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v13, "targetApplicationProxy"), "localizedName");
    if (v17)
    {
      uint64_t v19 = v17;
      double v20 = NSString;
      WebCore::copyLocalizedString((uint64_t *)&v26, (WebCore *)@"Open in “%@”", v18);
      if (v26)
      {
        CFAutorelease(v26);
        double v21 = v26;
      }
      else
      {
        double v21 = 0;
      }
      uint64_t v22 = objc_msgSend(v20, "stringWithFormat:", v21, v19);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __78__WKActionSheetAssistant__appendAppLinkOpenActionsForURL_actions_elementInfo___block_invoke_2;
      v24[3] = &unk_1E5813488;
      v24[4] = v13;
      objc_msgSend(a4, "addObject:", +[_WKElementAction _elementActionWithType:title:actionHandler:](_WKElementAction, "_elementActionWithType:title:actionHandler:", 6, v22, v24));
    }
    LOBYTE(v11) = 1;
  }
  return v11;
}

uint64_t __78__WKActionSheetAssistant__appendAppLinkOpenActionsForURL_actions_elementInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:0];
  v2 = *(void **)(a1 + 32);

  return [v2 openWithCompletionHandler:0];
}

uint64_t __78__WKActionSheetAssistant__appendAppLinkOpenActionsForURL_actions_elementInfo___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:1];
  v2 = *(void **)(a1 + 32);

  return [v2 openWithCompletionHandler:0];
}

- (void)_appendOpenActionsForURL:(id)a3 actions:(id)a4 elementInfo:(id)a5
{
  if (!-[WKActionSheetAssistant _appendAppLinkOpenActionsForURL:actions:elementInfo:](self, "_appendAppLinkOpenActionsForURL:actions:elementInfo:", a3))
  {
    id v8 = +[_WKElementAction _elementActionWithType:1 info:a5 assistant:self];
    [a4 addObject:v8];
  }
}

- (void)_appendAnimationAction:(id)a3 elementInfo:(id)a4
{
  if (([a4 isAnimatedImage] & 1) != 0 || *(_DWORD *)(objc_msgSend(a4, "_animationsUnderElement") + 12))
  {
    if ([a4 canShowAnimationControls])
    {
      objc_loadWeak(&self->_delegate.m_weakReference);
      if (objc_opt_respondsToSelector())
      {
        if ([objc_loadWeak(&self->_delegate.m_weakReference) _allowAnimationControls])
        {
          int v7 = [a4 isAnimating];
          if (([a4 isAnimatedImage] & 1) != 0
            || (uint64_t v8 = [a4 _animationsUnderElement], v9 = *(unsigned int *)(v8 + 12), !v9))
          {
LABEL_11:
            if (!v7)
            {
              uint64_t v13 = 15;
LABEL_15:
              id v14 = +[_WKElementAction _elementActionWithType:v13 info:a4 assistant:self];
              [a3 addObject:v14];
              return;
            }
          }
          else
          {
            char v10 = (unsigned __int8 *)(*(void *)v8 + 80);
            uint64_t v11 = 96 * v9;
            while (1)
            {
              int v12 = *v10;
              v10 += 96;
              if (v12) {
                break;
              }
              v11 -= 96;
              if (!v11) {
                goto LABEL_11;
              }
            }
          }
          uint64_t v13 = 16;
          goto LABEL_15;
        }
      }
    }
  }
}

- (RetainPtr<NSArray<_WKElementAction)defaultActionsForLinkSheet:(id)a3
{
  uint64_t v6 = v3;
  v7.var0 = (void *)[a3 URL];
  if (v7.var0)
  {
    var0 = v7.var0;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(WKActionSheetAssistant *)self _appendOpenActionsForURL:var0 actions:v9 elementInfo:a3];
    if ([(id)getSSReadingListClass() supportsURL:var0]) {
      objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 4, a3, self));
    }
    char v10 = (WebKit *)[a3 imageURL];
    if (v10)
    {
      TCC_kTCCServicePhotos = (WebKit *)WebKit::get_TCC_kTCCServicePhotos(v10);
      if (WebKit::softLinkTCCTCCAccessPreflight(TCC_kTCCServicePhotos, 0, v12) != 1) {
        objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 3, a3, self));
      }
    }
    uint64_t v13 = (void *)[var0 scheme];
    if (!v13 || [v13 caseInsensitiveCompare:@"javascript"])
    {
      objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 2, a3, self));
      objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 7, a3, self));
    }
    if ([a3 type] == 1 || objc_msgSend(a3, "_isImage"))
    {
      objc_loadWeak(&self->_delegate.m_weakReference);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [objc_loadWeak(&self->_delegate.m_weakReference) actionSheetAssistantShouldIncludeCopySubjectAction:self])
      {
        objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 14, a3, self));
      }
      objc_loadWeak(&self->_delegate.m_weakReference);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [objc_loadWeak(&self->_delegate.m_weakReference) actionSheetAssistant:self shouldIncludeShowTextActionForElement:a3])
      {
        objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 12, a3, self));
      }
      objc_loadWeak(&self->_delegate.m_weakReference);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [objc_loadWeak(&self->_delegate.m_weakReference) actionSheetAssistant:self shouldIncludeLookUpImageActionForElement:a3])
      {
        objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 13, a3, self));
      }
    }
    v7.var0 = (void *)[(WKActionSheetAssistant *)self _appendAnimationAction:v9 elementInfo:a3];
  }
  else
  {
    id v9 = 0;
  }
  *uint64_t v6 = v9;
  return v7;
}

- (RetainPtr<NSArray<_WKElementAction)defaultActionsForImageSheet:(id)a3
{
  uint64_t v6 = v3;
  uint64_t v7 = [a3 URL];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    [(WKActionSheetAssistant *)self _appendOpenActionsForURL:v7 actions:v8 elementInfo:a3];
  }
  else if (![a3 imageURL])
  {
    goto LABEL_5;
  }
  objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 7, a3, self));
LABEL_5:
  id v9 = (WebKit *)[(id)getSSReadingListClass() supportsURL:v7];
  if (v9) {
    id v9 = (WebKit *)objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 4, a3, self));
  }
  TCC_kTCCServicePhotos = (WebKit *)WebKit::get_TCC_kTCCServicePhotos(v9);
  if (WebKit::softLinkTCCTCCAccessPreflight(TCC_kTCCServicePhotos, 0, v11) != 1) {
    objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 3, a3, self));
  }
  objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 2, a3, self));
  objc_loadWeak(&self->_delegate.m_weakReference);
  if (objc_opt_respondsToSelector()) {
    int v12 = [objc_loadWeak(&self->_delegate.m_weakReference) actionSheetAssistantShouldIncludeCopySubjectAction:self];
  }
  else {
    int v12 = 0;
  }
  objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:disabled:](_WKElementAction, "_elementActionWithType:info:assistant:disabled:", 14, a3, self, v12 ^ 1u));
  objc_loadWeak(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [objc_loadWeak(&self->_delegate.m_weakReference) actionSheetAssistant:self shouldIncludeShowTextActionForElement:a3])
  {
    objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 12, a3, self));
  }
  objc_loadWeak(&self->_delegate.m_weakReference);
  if (objc_opt_respondsToSelector()) {
    int v13 = [objc_loadWeak(&self->_delegate.m_weakReference) actionSheetAssistant:self shouldIncludeLookUpImageActionForElement:a3];
  }
  else {
    int v13 = 0;
  }
  objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:disabled:](_WKElementAction, "_elementActionWithType:info:assistant:disabled:", 13, a3, self, v13 ^ 1u));
  v14.var0 = (void *)[(WKActionSheetAssistant *)self _appendAnimationAction:v8 elementInfo:a3];
  *uint64_t v6 = v8;
  return v14;
}

- (BOOL)needsLinkIndicator
{
  return self->_needsLinkIndicator;
}

- (void)showLinkSheet
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    self->_needsLinkIndicator = 1;
    if ([(WKActionSheetAssistant *)self synchronouslyRetrievePositionInformation])
    {
      if (self->_anon_210[144])
      {
        uint64_t v5 = WTF::URL::operator NSURL *();
        if (!v5)
        {
          self->_needsLinkIndicator = 0;
          return;
        }
        uint64_t v6 = v5;
        uint64_t v7 = [_WKActivatedElementInfo alloc];
        if (self->_anon_210[144])
        {
          id v8 = [(_WKActivatedElementInfo *)v7 _initWithType:0 URL:v6 information:&self->_positionInformation];
          objc_loadWeak(&p_delegate->m_weakReference);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [objc_loadWeak(&p_delegate->m_weakReference) actionSheetAssistant:self showCustomSheetForElement:v8])
          {
            self->_needsLinkIndicator = 0;
LABEL_28:
            if (v8) {
              CFRelease(v8);
            }
            return;
          }
          [(WKActionSheetAssistant *)self defaultActionsForLinkSheet:v8];
          id Weak = objc_loadWeak(&p_delegate->m_weakReference);
          CFTypeRef v10 = cf;
          CFTypeRef cf = 0;
          CFTypeRef v15 = v10;
          if (Weak)
          {
            [Weak actionSheetAssistant:self decideActionsForElement:v8 defaultActions:&v15];
            CFTypeRef v10 = v15;
          }
          else
          {
            CFTypeRef v16 = 0;
          }
          CFTypeRef v15 = 0;
          if (v10) {
            CFRelease(v10);
          }
          if (![(id)v16 count]
            || ([(WKActionSheetAssistant *)self _createSheetWithElementActions:v16 defaultTitle:0 showLinkTitle:1], (m_ptr = self->_interactionSheet.m_ptr) == 0))
          {
            self->_needsLinkIndicator = 0;
LABEL_24:
            CFTypeRef v13 = v16;
            CFTypeRef v16 = 0;
            if (v13) {
              CFRelease(v13);
            }
            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
            goto LABEL_28;
          }
          int v12 = self->_elementInfo.m_ptr;
          self->_elementInfo.m_ptr = v8;
          if (v12)
          {
            CFRelease(v12);
            m_ptr = self->_interactionSheet.m_ptr;
          }
          if (self->_anon_210[144])
          {
            id v8 = 0;
            if ((objc_msgSend(m_ptr, "presentSheet:", -[WKActionSheetAssistant _presentationStyleForPositionInfo:elementInfo:](self, "_presentationStyleForPositionInfo:elementInfo:", &self->_positionInformation, self->_elementInfo.m_ptr)) & 1) == 0)-[WKActionSheetAssistant cleanupSheet](self, "cleanupSheet"); {
            goto LABEL_24;
            }
          }
          std::__throw_bad_optional_access[abi:sn180100]();
        }
      }
      __break(1u);
    }
  }
}

- (void)_dataDetectorContextMenuPresenter
{
  p_dataDetectorContextMenuPresenter = (id **)&self->_dataDetectorContextMenuPresenter;
  if (!self->_dataDetectorContextMenuPresenter.__ptr_.__value_)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_view.m_weakReference);
    uint64_t v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, WeakRetained, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_dataDetectorContextMenuPresenter, v5);
    if (WeakRetained) {
      CFRelease(WeakRetained);
    }
  }
  return *p_dataDetectorContextMenuPresenter;
}

- (void)_resetDataDetectorContextMenuPresenter
{
  if (self->_dataDetectorContextMenuPresenter.__ptr_.__value_)
  {
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_dataDetectorContextMenuPresenter, 0);
    objc_loadWeak(&self->_delegate.m_weakReference);
    if (objc_opt_respondsToSelector())
    {
      id Weak = objc_loadWeak(&self->_delegate.m_weakReference);
      [Weak removeContextMenuViewIfPossibleForActionSheetAssistant:self];
    }
  }
}

- (void)_mediaControlsContextMenuPresenter
{
  p_mediaControlsContextMenuPresenter = (id **)&self->_mediaControlsContextMenuPresenter;
  if (!self->_mediaControlsContextMenuPresenter.__ptr_.__value_)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_view.m_weakReference);
    uint64_t v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, WeakRetained, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_mediaControlsContextMenuPresenter, v5);
    if (WeakRetained) {
      CFRelease(WeakRetained);
    }
  }
  return *p_mediaControlsContextMenuPresenter;
}

- (void)_resetMediaControlsContextMenuPresenter
{
  if (self->_mediaControlsContextMenuPresenter.__ptr_.__value_)
  {
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_mediaControlsContextMenuPresenter, 0);
    m_ptr = self->_mediaControlsContextMenu.m_ptr;
    self->_mediaControlsContextMenu.m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    self->_mediaControlsContextMenuTargetFrame = 0u;
    value = self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_;
    uint64_t v4 = value;
    self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (v4)
    {
      WTF::CompletionHandler<void ()(unsigned long long)>::operator()((uint64_t *)&value);
      uint64_t v5 = (uint64_t)value;
      value = 0;
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
    }
    objc_loadWeak(&self->_delegate.m_weakReference);
    if (objc_opt_respondsToSelector()) {
      [objc_loadWeak(&self->_delegate.m_weakReference) removeContextMenuViewIfPossibleForActionSheetAssistant:self];
    }
  }
}

- (BOOL)hasContextMenuInteraction
{
  return self->_dataDetectorContextMenuPresenter.__ptr_.__value_
      || self->_mediaControlsContextMenuPresenter.__ptr_.__value_ != 0;
}

- (id)_elementActionForDDAction:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  uint64_t v5 = [a3 localizedName];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __52__WKActionSheetAssistant__elementActionForDDAction___block_invoke;
  v10[3] = &unk_1EE9D3F38;
  CFTypeRef cf = self;
  if (self) {
    CFRetain(self);
  }
  v10[4] = a3;
  uint64_t v6 = +[_WKElementAction elementActionWithTitle:v5 actionHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__WKActionSheetAssistant__elementActionForDDAction___block_invoke_274;
  v9[3] = &unk_1E5813438;
  v9[4] = a3;
  [(_WKElementAction *)v6 setDismissalHandler:v9];
  CFTypeRef v7 = cf;
  CFTypeRef cf = 0;
  if (v7) {
    CFRelease(v7);
  }
  if (self) {
    CFRelease(self);
  }
  return v6;
}

uint64_t __52__WKActionSheetAssistant__elementActionForDDAction___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 40) + 745) = [*(id *)(a1 + 32) hasUserInterface];
  v2 = (void *)[(id)((uint64_t (*)(void))*MEMORY[0x1E4FB6370])() sharedController];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16);

  return objc_msgSend(v2, "performAction:fromAlertController:interactionDelegate:", v3, v4);
}

uint64_t __52__WKActionSheetAssistant__elementActionForDDAction___block_invoke_274(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasUserInterface] ^ 1;
}

- (void)showDataDetectorsUIForPositionInformation:(const void *)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
    if (self->_anon_210[144])
    {
      WebKit::InteractionInformationAtPosition::operator=((uint64_t)&self->_positionInformation, (uint64_t)a3);
      if (!self->_anon_210[144]) {
        goto LABEL_33;
      }
    }
    else
    {
      WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, (const WebKit::InteractionInformationAtPosition *)a3);
      self->_anon_210[144] = 1;
    }
    a3 = &self->_positionInformation.var0.__engaged_ + 72;
    if (WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)(&self->_positionInformation.var0.__engaged_ + 72), v9))
    {
      if (!self->_anon_210[144]) {
        goto LABEL_33;
      }
      CFTypeRef v10 = (const void *)WTF::URL::operator NSURL *();
      if (v10)
      {
        a3 = v10;
        uint64_t v3 = (void *)[(id)((uint64_t (*)(void))*MEMORY[0x1E4FB6370])() sharedController];
        objc_loadWeak(&p_delegate->m_weakReference);
        if (objc_opt_respondsToSelector())
        {
          id Weak = objc_loadWeak(&p_delegate->m_weakReference);
          if (!self->_anon_210[144]) {
            goto LABEL_33;
          }
          uint64_t v4 = [Weak dataDetectionContextForActionSheetAssistant:self positionInformation:&self->_positionInformation];
        }
        else
        {
          uint64_t v4 = 0;
        }
        objc_loadWeak(&p_delegate->m_weakReference);
        if (objc_opt_respondsToSelector()) {
          p_delegate = (WeakObjCPtr<id<WKActionSheetAssistantDelegate>> *)[objc_loadWeak(&p_delegate->m_weakReference) selectedTextForActionSheetAssistant:self];
        }
        else {
          p_delegate = 0;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [v3 shouldImmediatelyLaunchDefaultActionForURL:a3])
        {
          if (!self->_anon_210[144]) {
            goto LABEL_33;
          }
          id v12 = -[WKActionSheetAssistant _elementActionForDDAction:](self, "_elementActionForDDAction:", [v3 defaultActionForURL:a3 results:self->_positionInformation.var0.__val_.dataDetectorResults.m_ptr context:v4]);
          m_ptr = self->_elementInfo.m_ptr;
          [v12 _runActionWithElementInfo:m_ptr forActionSheetAssistant:self];
        }
        else
        {
          if (self->_anon_210[144])
          {
            if (!self->_positionInformation.var0.__val_.dataDetectorIdentifier.m_impl.m_ptr) {
              goto LABEL_34;
            }
            uint64_t v14 = WTF::StringImpl::operator NSString *();
            if (self->_anon_210[144])
            {
              CFTypeRef v15 = (__CFString *)v14;
              goto LABEL_26;
            }
          }
LABEL_33:
          while (1)
          {
            __break(1u);
LABEL_34:
            CFTypeRef v15 = &stru_1EEA10550;
LABEL_26:
            if (!objc_msgSend((id)objc_msgSend(v3, "actionsForURL:identifier:selectedText:results:context:", a3, v15, p_delegate, self->_positionInformation.var0.__val_.dataDetectorResults.m_ptr, v4), "count")|| !objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "window"))
            {
              break;
            }
            CFTypeRef v16 = [(WKActionSheetAssistant *)self _dataDetectorContextMenuPresenter];
            if (self->_anon_210[144])
            {
              uint64_t v17 = v16;
              WebCore::IntPoint::operator CGPoint();
              uint64_t v20 = *MEMORY[0x1E4F1DB30];
              uint64_t v21 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
              WebKit::CompactContextMenuPresenter::present(v17, *(CGRect *)&v18);
              return;
            }
          }
        }
      }
    }
  }
}

- (id)_uiMenuElementsForMediaControlContextMenuItems:(void *)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a3 + 3)];
  uint64_t v6 = *((unsigned int *)a3 + 3);
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)a3;
    uint64_t v9 = 48 * v6;
    do
    {
      if (!*(void *)(v8 + v7))
      {
        uint64_t v10 = *(void *)(v8 + v7 + 8);
        if (!v10 || !*(_DWORD *)(v10 + 4))
        {
          uint64_t v11 = *(void *)(v8 + v7 + 16);
          if (v11)
          {
            if (!(*(_DWORD *)(v11 + 4) | *(_DWORD *)(v8 + v7 + 44))) {
              goto LABEL_8;
            }
          }
          else if (!*(_DWORD *)(v8 + v7 + 44))
          {
LABEL_8:
            uint64_t v12 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EEA10550 image:0 identifier:0 options:1 children:MEMORY[0x1E4F1CBF0]];
            goto LABEL_18;
          }
        }
      }
      uint64_t v13 = v8 + v7;
      uint64_t v14 = *(void *)(v8 + v7 + 16);
      if (v14 && *(_DWORD *)(v14 + 4)) {
        uint64_t v15 = [MEMORY[0x1E4F42A80] systemImageNamed:WTF::StringImpl::operator NSString *()];
      }
      else {
        uint64_t v15 = 0;
      }
      if (*(_DWORD *)(v13 + 44))
      {
        CFTypeRef v16 = (void *)MEMORY[0x1E4F42B80];
        if (*(void *)(v8 + v7 + 8)) {
          uint64_t v17 = (__CFString *)WTF::StringImpl::operator NSString *();
        }
        else {
          uint64_t v17 = &stru_1EEA10550;
        }
        uint64_t v12 = objc_msgSend(v16, "menuWithTitle:image:identifier:options:children:", v17, v15, 0, 0, -[WKActionSheetAssistant _uiMenuElementsForMediaControlContextMenuItems:](self, "_uiMenuElementsForMediaControlContextMenuItems:", v13 + 32));
LABEL_18:
        uint64_t v18 = (void *)v12;
        if (!v12) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
      uint64_t v19 = (void *)MEMORY[0x1E4F426E8];
      uint64_t v20 = *(void **)(v8 + v7);
      if (*(void *)(v8 + v7 + 8)) {
        uint64_t v21 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        uint64_t v21 = &stru_1EEA10550;
      }
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3321888768;
      v25[2] = ___ZZ73__WKActionSheetAssistant__uiMenuElementsForMediaControlContextMenuItems__ENK3__6clERN7WebCore28MediaControlsContextMenuItemE_block_invoke;
      v25[3] = &__block_descriptor_48_e8_32c148_ZTSKZZ73__WKActionSheetAssistant__uiMenuElementsForMediaControlContextMenuItems__ENK3__6clERN7WebCore28MediaControlsContextMenuItemEEUlP8UIActionE__e18_v16__0__UIAction_8l;
      id location = 0;
      objc_initWeak(&location, self);
      CGFloat v24 = v20;
      v26[0] = 0;
      objc_copyWeak(v26, &location);
      v26[1] = v24;
      uint64_t v18 = (void *)[v19 actionWithTitle:v21 image:v15 identifier:0 handler:v25];
      objc_destroyWeak(&location);
      if (*(unsigned char *)(v8 + v7 + 24)) {
        [v18 setState:1];
      }
      objc_destroyWeak(v26);
      if (!v18) {
        goto LABEL_26;
      }
LABEL_25:
      [v5 addObject:v18];
LABEL_26:
      v7 += 48;
    }
    while (v9 != v7);
  }
  return (id)(id)CFMakeCollectable(v5);
}

- (void)showMediaControlsContextMenu:(FloatRect *)a3 items:(void *)a4 completionHandler:(void *)a5
{
  uint64_t v26 = 0;
  unint64_t v27 = 0;
  unsigned int v8 = *((_DWORD *)a4 + 3);
  if (v8 == 1)
  {
    uint64_t v9 = *(WTF::StringImpl **)(*(void *)a4 + 8);
    *(void *)(*(void *)a4 + 8) = 0;
    uint64_t v10 = *(void *)a4;
    a4 = (void *)(*(void *)a4 + 32);
    unsigned int v8 = *(_DWORD *)(v10 + 44);
    uint64_t v11 = (unsigned int *)(v10 + 40);
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = (unsigned int *)((char *)a4 + 8);
  }
  unsigned int v12 = *v11;
  uint64_t v13 = *(void *)a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  uint64_t v26 = v13;
  unint64_t v27 = __PAIR64__(v8, v12);
  objc_loadWeak(&self->_delegate.m_weakReference);
  if (objc_opt_respondsToSelector()) {
    uint64_t v14 = objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "additionalMediaControlsContextMenuItemsForActionSheetAssistant:", self, v26, v27);
  }
  else {
    uint64_t v14 = 0;
  }
  if ([objc_loadWeak(&self->_view.m_weakReference) window]
    && (HIDWORD(v27) || [v14 count]))
  {
    uint64_t v15 = objc_msgSend(-[WKActionSheetAssistant _uiMenuElementsForMediaControlContextMenuItems:](self, "_uiMenuElementsForMediaControlContextMenuItems:", &v26), "arrayByAddingObjectsFromArray:", v14);
    CFTypeRef v16 = (void *)MEMORY[0x1E4F42B80];
    if (v9) {
      uint64_t v17 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v17 = &stru_1EEA10550;
    }
    uint64_t v18 = objc_msgSend(v16, "menuWithTitle:children:", v17, v15, v26, v27);
    uint64_t v19 = v18;
    if (v18) {
      CFRetain(v18);
    }
    m_ptr = self->_mediaControlsContextMenu.m_ptr;
    self->_mediaControlsContextMenu.m_ptr = v19;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    self->_mediaControlsContextMenuTargetFrame = *a3;
    uint64_t v21 = *(void **)a5;
    *(void *)a5 = 0;
    value = self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_;
    self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_ = v21;
    if (value) {
      (*(void (**)(void *))(*(void *)value + 8))(value);
    }
    CGFloat v23 = [(WKActionSheetAssistant *)self _mediaControlsContextMenuPresenter];
    WebCore::FloatRect::operator CGRect();
    WebKit::CompactContextMenuPresenter::present(v23, v28);
  }
  else
  {
    WTF::CompletionHandler<void ()(unsigned long long)>::operator()((uint64_t *)a5);
  }
  WTF::Vector<WebCore::MediaControlsContextMenuItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v26, v24);
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v25);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
}

- (id)suggestedActionsForContextMenuWithPositionInformation:(const void *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [[_WKActivatedElementInfo alloc] _initWithInteractionInformationAtPosition:a3 isUsingAlternateURLForImage:0 userInfo:0];
  if (*((unsigned char *)a3 + 24))
  {
    if (self)
    {
      [(WKActionSheetAssistant *)self defaultActionsForLinkSheet:v5];
      goto LABEL_6;
    }
LABEL_9:
    CFTypeRef cf = 0;
LABEL_10:
    char v6 = 1;
    if (!v5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!self) {
    goto LABEL_9;
  }
  [(WKActionSheetAssistant *)self defaultActionsForImageSheet:v5];
LABEL_6:
  self = cf;
  if (!cf) {
    goto LABEL_10;
  }
  CFRetain(cf);
  char v6 = 0;
  if (v5) {
LABEL_11:
  }
    CFRetain(v5);
LABEL_12:
  if ([(WKActionSheetAssistant *)self count])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[WKActionSheetAssistant count](self, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = [(WKActionSheetAssistant *)self countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(self);
          }
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "uiActionForElementInfo:", v5));
        }
        uint64_t v8 = [(WKActionSheetAssistant *)self countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    if (v5) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (v5) {
LABEL_21:
    }
      CFRelease(v5);
  }
  if ((v6 & 1) == 0) {
    CFRelease(self);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v7;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  value = self->_dataDetectorContextMenuPresenter.__ptr_.__value_;
  if (value && (id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction", a4.x, a4.y) == a3)
  {
    unsigned int v12 = (void *)[(id)((uint64_t (*)(void))*MEMORY[0x1E4FB6370])() sharedController];
    objc_loadWeak(&self->_delegate.m_weakReference);
    if (objc_opt_respondsToSelector())
    {
      id Weak = objc_loadWeak(&self->_delegate.m_weakReference);
      if (!self->_anon_210[144]) {
        goto LABEL_29;
      }
      uint64_t v4 = (void *)[Weak dataDetectionContextForActionSheetAssistant:self positionInformation:&self->_positionInformation];
    }
    else
    {
      uint64_t v4 = 0;
    }
    objc_loadWeak(&self->_delegate.m_weakReference);
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = [objc_loadWeak(&self->_delegate.m_weakReference) selectedTextForActionSheetAssistant:self];
    }
    else {
      uint64_t v5 = 0;
    }
    id location = 0;
    if (!self->_anon_210[144]) {
      goto LABEL_29;
    }
    uint64_t v15 = WTF::URL::operator NSURL *();
    if (!self->_anon_210[144]) {
      goto LABEL_29;
    }
    uint64_t v6 = v15;
    if (!self->_positionInformation.var0.__val_.dataDetectorIdentifier.m_impl.m_ptr) {
      goto LABEL_30;
    }
    uint64_t v16 = WTF::StringImpl::operator NSString *();
    if (!self->_anon_210[144]) {
      goto LABEL_29;
    }
    for (uint64_t i = (__CFString *)v16; ; uint64_t i = &stru_1EEA10550)
    {
      uint64_t v18 = [v12 resultForURL:v6 identifier:i selectedText:v5 results:self->_positionInformation.var0.__val_.dataDetectorResults.m_ptr context:v4 extendedContext:&location];
      if (self->_anon_210[144])
      {
        unsigned int v12 = (void *)v18;
        if (self->_positionInformation.var0.__val_.isLink) {
          uint64_t v19 = WebCore::FloatRect::operator CGRect();
        }
        else {
          uint64_t v19 = WebCore::IntRect::operator CGRect();
        }
        double v24 = v20;
        double v25 = v21;
        double v26 = v22;
        double v27 = v23;
        uint64_t v4 = (void *)((uint64_t (*)(uint64_t))*MEMORY[0x1E4FB6340])(v19);
        uint64_t v5 = objc_msgSend(v4, "updateContext:withSourceRect:", location, v24, v25, v26, v27);
        if (v12) {
          return (id)[v4 contextMenuConfigurationWithResult:v12 inView:objc_loadWeak(&self->_view.m_weakReference) context:v5 menuIdentifier:0];
        }
        if (self->_anon_210[144]) {
          break;
        }
      }
LABEL_29:
      __break(1u);
LABEL_30:
      ;
    }
    uint64_t v29 = WTF::URL::operator NSURL *();
    return (id)[v4 contextMenuConfigurationWithURL:v29 inView:objc_loadWeak(&self->_view.m_weakReference) context:v5 menuIdentifier:0];
  }
  else
  {
    uint64_t v10 = self->_mediaControlsContextMenuPresenter.__ptr_.__value_;
    if (v10 && (id)objc_msgSend(*((id *)v10 + 1), "contextMenuInteraction", a4.x, a4.y) == a3)
    {
      long long v14 = (void *)MEMORY[0x1E4F428F0];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3321888768;
      v31[2] = __80__WKActionSheetAssistant_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v31[3] = &__block_descriptor_40_e8_32c93_ZTSKZ80__WKActionSheetAssistant_contextMenuInteraction_configurationForMenuAtLocation__E3__7_e25___UIMenu_16__0__NSArray_8l;
      id location = 0;
      objc_initWeak(&location, self);
      id v32 = 0;
      objc_copyWeak(&v32, &location);
      uint64_t v11 = (void *)[v14 configurationWithIdentifier:0 previewProvider:0 actionProvider:v31];
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

uint64_t __80__WKActionSheetAssistant_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    return 0;
  }
  uint64_t v2 = WeakRetained[88];
  CFRelease(WeakRetained);
  return v2;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  value = self->_dataDetectorContextMenuPresenter.__ptr_.__value_;
  if (!value || (id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction", a3, a4, a5) != a3)
  {
    uint64_t v8 = self->_mediaControlsContextMenuPresenter.__ptr_.__value_;
    if (!v8 || (id)objc_msgSend(*((id *)v8 + 1), "contextMenuInteraction", a3, a4, a5) != a3) {
      return 0;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F42FF0]);
    WebCore::FloatRect::operator CGRect();
    id v11 = (id)objc_msgSend(v16, "initWithFrame:");
    id v17 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
    id v18 = objc_alloc(MEMORY[0x1E4F42D00]);
    id Weak = objc_loadWeak(&self->_view.m_weakReference);
    WebCore::FloatPoint::operator CGPoint();
    double v20 = (const void *)objc_msgSend(v18, "initWithContainer:center:", Weak);
    CFTypeRef v21 = (id)CFMakeCollectable((CFTypeRef)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v11 parameters:v17 target:v20]);
    goto LABEL_11;
  }
  id result = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (self->_anon_210[144])
  {
    id v11 = result;
    WebCore::IntPoint::operator CGPoint();
    double v13 = v12;
    double v15 = v14;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = (void *)[v11 createTargetedContextMenuHintForActionSheetAssistant:self];
LABEL_15:
      if (v11) {
        CFRelease(v11);
      }
      return v9;
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
    p_view = &self->_view;
    double v20 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42D00]), "initWithContainer:center:", objc_loadWeak(&p_view->m_weakReference), v13, v15);
    double v23 = (const void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:objc_loadWeak(&p_view->m_weakReference) parameters:v17 target:v20];
    CFTypeRef v21 = (id)CFMakeCollectable(v23);
LABEL_11:
    uint64_t v9 = (void *)v21;
    if (v20) {
      CFRelease(v20);
    }
    if (v17) {
      CFRelease(v17);
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __90__WKActionSheetAssistant_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c103_ZTSKZ90__WKActionSheetAssistant_contextMenuInteraction_willDisplayMenuForConfiguration_animator__E3__8_e5_v8__0l;
  objc_initWeak(&v6, self);
  id v8 = 0;
  objc_copyWeak(&v8, &v6);
  [a5 addCompletion:v7];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __90__WKActionSheetAssistant_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    uint64_t v3 = WeakRetained + 1;
    objc_loadWeak(WeakRetained + 1);
    if (objc_opt_respondsToSelector()) {
      [objc_loadWeak(v3) actionSheetAssistantDidShowContextMenu:v2];
    }
    CFRelease(v2);
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  value = self->_dataDetectorContextMenuPresenter.__ptr_.__value_;
  if (value && (id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction", a3, a4) == a3) {
    [(WKActionSheetAssistant *)self _resetDataDetectorContextMenuPresenter];
  }
  uint64_t v9 = self->_mediaControlsContextMenuPresenter.__ptr_.__value_;
  if (v9 && (id)objc_msgSend(*((id *)v9 + 1), "contextMenuInteraction", a3, a4) == a3) {
    [(WKActionSheetAssistant *)self _resetMediaControlsContextMenuPresenter];
  }
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __82__WKActionSheetAssistant_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32c95_ZTSKZ82__WKActionSheetAssistant_contextMenuInteraction_willEndForConfiguration_animator__E3__9_e5_v8__0l;
  objc_initWeak(&v10, self);
  id v12 = 0;
  objc_copyWeak(&v12, &v10);
  [a5 addCompletion:v11];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
}

void __82__WKActionSheetAssistant_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    uint64_t v3 = WeakRetained + 1;
    objc_loadWeak(WeakRetained + 1);
    if (objc_opt_respondsToSelector()) {
      [objc_loadWeak(v3) actionSheetAssistantDidDismissContextMenu:v2];
    }
    CFRelease(v2);
  }
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  value = self->_dataDetectorContextMenuPresenter.__ptr_.__value_;
  if (!value || (id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction", a3, a4) != a3 || !self->_anon_210[144]) {
    return 0;
  }

  return [(WKActionSheetAssistant *)self suggestedActionsForContextMenuWithPositionInformation:&self->_positionInformation];
}

- (void)handleElementActionWithType:(int64_t)a3 element:(id)a4 needsInteraction:(BOOL)a5
{
  BOOL v5 = a5;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained actionSheetAssistant:self willStartInteractionWithElement:a4];
  }
  uint64_t v10 = 0;
  switch(a3)
  {
    case 1:
      if ([a4 _isUsingAlternateURLForImage])
      {
        double v23 = (void *)[MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v24 = [a4 URL];
        [v23 openURL:v24 options:MEMORY[0x1E4F1CC08] completionHandler:0];
      }
      else
      {
        BOOL v37 = (WTF::StringImpl *)[a4 _interactionLocation];
        WebCore::IntPoint::operator CGPoint();
        objc_msgSend(WeakRetained, "actionSheetAssistant:openElementAtLocation:", self);
      }
      goto LABEL_43;
    case 2:
      goto LABEL_19;
    case 3:
      uint64_t v10 = 1;
LABEL_19:
      [WeakRetained actionSheetAssistant:self performAction:v10];
      goto LABEL_43;
    case 7:
      MEMORY[0x19972E8A0](&v37, [a4 imageURL]);
      if (!WTF::URL::protocolIs() || ![a4 image])
      {
        id v32 = v37;
        BOOL v37 = 0;
        if (v32)
        {
          if (*(_DWORD *)v32 == 2) {
            WTF::StringImpl::destroy(v32, v25);
          }
          else {
            *(_DWORD *)v32 -= 2;
          }
        }
        goto LABEL_37;
      }
      char v27 = objc_opt_respondsToSelector();
      CGRect v28 = v37;
      BOOL v37 = 0;
      if (!v28) {
        goto LABEL_29;
      }
      if (*(_DWORD *)v28 == 2)
      {
        WTF::StringImpl::destroy(v28, v26);
        if (v27)
        {
LABEL_50:
          uint64_t v36 = [a4 image];
          [a4 boundingRect];
          objc_msgSend(WeakRetained, "actionSheetAssistant:shareElementWithImage:rect:", self, v36);
          goto LABEL_43;
        }
      }
      else
      {
        *(_DWORD *)v28 -= 2;
LABEL_29:
        if (v27) {
          goto LABEL_50;
        }
      }
LABEL_37:
      if ([a4 URL]
        && ((double v33 = objc_msgSend((id)objc_msgSend(a4, "URL"), "scheme")) == 0
         || [v33 caseInsensitiveCompare:@"javascript"]))
      {
        uint64_t v34 = [a4 URL];
      }
      else
      {
        uint64_t v34 = [a4 imageURL];
      }
      uint64_t v35 = v34;
      [a4 boundingRect];
      objc_msgSend(WeakRetained, "actionSheetAssistant:shareElementWithURL:rect:", self, v35);
LABEL_43:
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained actionSheetAssistantDidStopInteraction:self];
      }
      if (WeakRetained) {
        CFRelease(WeakRetained);
      }
      return;
    case 12:
      uint64_t v29 = [a4 image];
      uint64_t v30 = [a4 imageURL];
      uint64_t v31 = [a4 title];
      [a4 boundingRect];
      objc_msgSend(WeakRetained, "actionSheetAssistant:showTextForImage:imageURL:title:imageBounds:", self, v29, v30, v31);
      goto LABEL_43;
    case 13:
      uint64_t v20 = [a4 image];
      uint64_t v21 = [a4 imageURL];
      uint64_t v22 = [a4 title];
      [a4 boundingRect];
      objc_msgSend(WeakRetained, "actionSheetAssistant:lookUpImage:imageURL:title:imageBounds:", self, v20, v21, v22);
      goto LABEL_43;
    case 14:
      objc_msgSend(WeakRetained, "actionSheetAssistant:copySubject:sourceMIMEType:", self, objc_msgSend(a4, "image"), objc_msgSend(a4, "imageMIMEType"));
      goto LABEL_43;
    case 15:
    case 16:
      if (a3 == 16) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 3;
      }
      [WeakRetained actionSheetAssistant:self performAction:v11];
      if (!*(_DWORD *)([a4 _animationsUnderElement] + 12) || (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_43;
      }
      uint64_t v12 = [a4 _animationsUnderElement];
      BOOL v37 = 0;
      uint64_t v38 = 0;
      uint64_t v13 = *(unsigned int *)(v12 + 12);
      if (!v13) {
        goto LABEL_16;
      }
      if (v13 >= 0x3333334)
      {
        __break(0xC471u);
        return;
      }
      unsigned int v14 = 80 * v13;
      double v15 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)(80 * v13));
      LODWORD(v38) = v14 / 0x50;
      BOOL v37 = v15;
      if (*(_DWORD *)(v12 + 12))
      {
        uint64_t v16 = 0;
        unint64_t v17 = 0;
        do
        {
          memmove(v15, (const void *)(*(void *)v12 + v16), 0x50uLL);
          ++v17;
          double v15 = (WTF::StringImpl *)((char *)v15 + 80);
          v16 += 96;
        }
        while (v17 < *(unsigned int *)(v12 + 12));
        HIDWORD(v38) = v17;
      }
LABEL_16:
      [WeakRetained _actionSheetAssistant:self performAction:v11 onElements:&v37];
      uint64_t v19 = v37;
      if (v37)
      {
        BOOL v37 = 0;
        LODWORD(v38) = 0;
        WTF::fastFree(v19, v18);
      }
      goto LABEL_43;
    default:
      goto LABEL_43;
  }
}

- (void)cleanupSheet
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained actionSheetAssistantDidStopInteraction:self];
  }
  [self->_interactionSheet.m_ptr doneWithSheet:!self->_isPresentingDDUserInterface];
  [self->_interactionSheet.m_ptr setSheetDelegate:0];
  m_ptr = self->_interactionSheet.m_ptr;
  self->_interactionSheet.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id v6 = self->_elementInfo.m_ptr;
  self->_elementInfo.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  if (self->_anon_210[144])
  {
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, v4);
    self->_anon_210[144] = 0;
  }
  *(_WORD *)&self->_needsLinkIndicator = 0;
  self->_hasPendingActionSheet = 0;
  if (WeakRetained)
  {
    CFRelease(WeakRetained);
  }
}

- (id)currentlyAvailableActionTitles
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_interactionSheet.m_ptr;
  if (!m_ptr) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(m_ptr, "actions"), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = objc_msgSend(self->_interactionSheet.m_ptr, "actions", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "title"));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v4;
}

- (id)_contentsOfContextMenuItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (objc_msgSend((id)objc_msgSend(a3, "title"), "length")) {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "title"), @"title");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "children"), "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = objc_msgSend(a3, "children", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v6, "addObject:", -[WKActionSheetAssistant _contentsOfContextMenuItem:](self, "_contentsOfContextMenuItem:", *(void *)(*((void *)&v13 + 1) + 8 * v11++)));
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v5 setObject:v6 forKeyedSubscript:@"children"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 state] == 1) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"checked"];
  }
  return v5;
}

- (id)currentlyAvailableMediaControlsContextMenuItems
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (self->_mediaControlsContextMenu.m_ptr) {
    objc_msgSend(v3, "addObject:", -[WKActionSheetAssistant _contentsOfContextMenuItem:](self, "_contentsOfContextMenuItem:"));
  }
  return v3;
}

- (void)setNeedsLinkIndicator:(BOOL)a3
{
  self->_needsLinkIndicator = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_view.m_weakReference);
  value = self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_;
  self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *))(*(void *)value + 8))(value);
  }
  m_ptr = self->_mediaControlsContextMenu.m_ptr;
  self->_mediaControlsContextMenu.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_mediaControlsContextMenuPresenter, 0);
  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_dataDetectorContextMenuPresenter, 0);
  if (self->_anon_210[144]) {
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, v5);
  }
  uint64_t v6 = self->_elementInfo.m_ptr;
  self->_elementInfo.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = self->_interactionSheet.m_ptr;
  self->_interactionSheet.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }

  objc_destroyWeak(&self->_delegate.m_weakReference);
}

@end