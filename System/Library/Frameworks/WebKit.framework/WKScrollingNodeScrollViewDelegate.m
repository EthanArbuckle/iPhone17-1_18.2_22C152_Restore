@interface WKScrollingNodeScrollViewDelegate
- (BOOL)_isInUserInteraction;
- (WKScrollingNodeScrollViewDelegate)initWithScrollingTreeNodeDelegate:(void *)a3;
- (id).cxx_construct;
- (id)parentScrollViewForScrollView:(id)a3;
- (unint64_t)axesToPreventScrollingForPanGestureInScrollView:(id)a3;
- (void)cancelPointersForGestureRecognizer:(id)a3;
- (void)scrollView:(id)a3 handleScrollUpdate:(id)a4 completion:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setInUserInteraction:(BOOL)a3;
@end

@implementation WKScrollingNodeScrollViewDelegate

- (WKScrollingNodeScrollViewDelegate)initWithScrollingTreeNodeDelegate:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WKScrollingNodeScrollViewDelegate;
  v5 = [(WKScrollingNodeScrollViewDelegate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = *((void *)a3 + 2);
    if (v6) {
      goto LABEL_7;
    }
    uint64_t v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)uint64_t v6 = 1;
    *(void *)(v6 + 8) = a3;
    v7 = (unsigned int *)*((void *)a3 + 2);
    *((void *)a3 + 2) = v6;
    if (!v7) {
      goto LABEL_7;
    }
    if (atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v4);
    }
    uint64_t v6 = *((void *)a3 + 2);
    if (v6) {
LABEL_7:
    }
      atomic_fetch_add((atomic_uint *volatile)v6, 1u);
    m_ptr = (unsigned int *)v5->_scrollingTreeNodeDelegate.m_impl.m_ptr;
    v5->_scrollingTreeNodeDelegate.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v4);
    }
  }
  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)m_ptr + 1);
    if (v4)
    {
      [a3 contentOffset];
      v8.x = v6;
      v8.y = v7;
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v9, &v8);
      WebKit::ScrollingTreeScrollingNodeDelegateIOS::scrollViewDidScroll(v4, (const WebCore::FloatPoint *)self->_inUserInteraction, v9[0], v9[1]);
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    self->_inUserInteraction = 1;
    if (objc_msgSend((id)objc_msgSend(a3, "panGestureRecognizer"), "state") == 1)
    {
      v5 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
      if (v5) {
        CGFloat v6 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)v5 + 1);
      }
      else {
        CGFloat v6 = 0;
      }
      uint64_t v7 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v6);
      (*(void (**)(uint64_t, void, void))(*(void *)v7 + 168))(v7, *(void *)(*((void *)v6 + 1) + 48), *(void *)(*((void *)v6 + 1) + 56));
    }
    CGPoint v8 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
    if (v8) {
      v9 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)v8 + 1);
    }
    else {
      v9 = 0;
    }
    objc_super v10 = *(void (**)(void))(*(void *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v9) + 176);
    v10();
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    if (([a3 isZooming] & 1) == 0)
    {
      uint64_t v9 = *((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1);
      int v10 = *(unsigned __int8 *)(v9 + 48);
      *(unsigned char *)(v9 + 48) = 0;
      if (v10 && (v10 & 5) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v12 = a3;
        }
        else {
          id v12 = 0;
        }
        char v13 = [v12 axesToPreventMomentumScrolling];
        char v14 = v13;
        if (v10 & 8) == 0 || (v13)
        {
          [a3 contentOffset];
          a5->double x = v15;
        }
        if ((v10 & 0x10) == 0 || (v14 & 2) != 0)
        {
          [a3 contentOffset];
          a5->double y = v16;
        }
      }
    }
    uint64_t v17 = WebCore::ScrollingTreeScrollingNode::currentHorizontalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    uint64_t v18 = WebCore::ScrollingTreeScrollingNode::currentVerticalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    [a3 bounds];
    float Width = CGRectGetWidth(v49);
    [a3 bounds];
    float Height = CGRectGetHeight(v50);
    float v47 = Width;
    float v48 = Height;
    uint64_t v21 = WebCore::ScrollingTreeScrollingNode::snapOffsetsInfo(*(WebCore::ScrollingTreeScrollingNode **)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    if (*(_DWORD *)(v21 + 20))
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v44, a5);
      [a3 contentOffset];
      uint64_t v22 = WebCore::ScrollSnapOffsetsInfo<float,WebCore::FloatRect>::closestSnapOffset<WebCore::FloatSize,WebCore::FloatPoint>();
      float v23 = *(float *)&v22;
      uint64_t v45 = v22;
      int v46 = v24;
      WebCore::ScrollingTreeScrollingNode::setCurrentHorizontalSnapPointIndex();
      double x = a5->x;
      if (a5->x >= 0.0)
      {
        [a3 contentSize];
        if (x <= v26) {
          a5->double x = v23;
        }
      }
    }
    if (*(_DWORD *)(v21 + 36))
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v43, a5);
      [a3 contentOffset];
      uint64_t v27 = WebCore::ScrollSnapOffsetsInfo<float,WebCore::FloatRect>::closestSnapOffset<WebCore::FloatSize,WebCore::FloatPoint>();
      float v28 = *(float *)&v27;
      uint64_t v45 = v27;
      int v46 = v29;
      WebCore::ScrollingTreeScrollingNode::setCurrentVerticalSnapPointIndex();
      double y = a5->y;
      if (y >= 0.0)
      {
        [a3 contentSize];
        if (y <= v31) {
          a5->double y = v28;
        }
      }
    }
    uint64_t v32 = WebCore::ScrollingTreeScrollingNode::currentHorizontalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    uint64_t v33 = v32 & 0xFF00000000;
    if ((v17 & 0xFF00000000) == 0 || v33 == 0)
    {
      if (((v17 & 0xFF00000000) != 0) == (v33 != 0))
      {
LABEL_31:
        uint64_t v35 = WebCore::ScrollingTreeScrollingNode::currentVerticalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
        uint64_t v36 = v35 & 0xFF00000000;
        if ((v18 & 0xFF00000000) == 0 || v36 == 0)
        {
          if (((v18 & 0xFF00000000) != 0) == (v36 != 0)) {
            return;
          }
        }
        else if (v18 == v35)
        {
          return;
        }
      }
    }
    else if (v17 == v32)
    {
      goto LABEL_31;
    }
    uint64_t v38 = *((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1);
    uint64_t v39 = WebCore::ScrollingTreeScrollingNode::currentHorizontalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(v38 + 8));
    uint64_t v40 = WebCore::ScrollingTreeScrollingNode::currentVerticalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    if (!*(unsigned char *)(v38 + 49))
    {
      uint64_t v41 = v40;
      uint64_t v42 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree((WebCore::ScrollingTreeScrollingNodeDelegate *)v38);
      (*(void (**)(uint64_t, void, void, uint64_t, uint64_t))(*(void *)v42 + 240))(v42, *(void *)(*(void *)(v38 + 8) + 48), *(void *)(*(void *)(v38 + 8) + 56), v39, v41);
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)m_ptr + 1);
    if (v5)
    {
      if (self->_inUserInteraction && !a4)
      {
        self->_inUserInteraction = 0;
        [a3 contentOffset];
        v12.double x = v7;
        v12.double y = v8;
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v13, &v12);
        WebKit::ScrollingTreeScrollingNodeDelegateIOS::scrollViewDidScroll(v5, (const WebCore::FloatPoint *)self->_inUserInteraction, v13[0], v13[1]);
        uint64_t v9 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
        if (v9) {
          int v10 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)v9 + 1);
        }
        else {
          int v10 = 0;
        }
        uint64_t v11 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v10);
        (*(void (**)(uint64_t, void, void))(*(void *)v11 + 184))(v11, *(void *)(*((void *)v10 + 1) + 48), *(void *)(*((void *)v10 + 1) + 56));
      }
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)m_ptr + 1);
    if (v4)
    {
      if (self->_inUserInteraction)
      {
        self->_inUserInteraction = 0;
        [a3 contentOffset];
        v11.double x = v6;
        v11.double y = v7;
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v12, &v11);
        WebKit::ScrollingTreeScrollingNodeDelegateIOS::scrollViewDidScroll(v4, (const WebCore::FloatPoint *)self->_inUserInteraction, v12[0], v12[1]);
        CGFloat v8 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
        if (v8) {
          uint64_t v9 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)v8 + 1);
        }
        else {
          uint64_t v9 = 0;
        }
        uint64_t v10 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v9);
        (*(void (**)(uint64_t, void, void))(*(void *)v10 + 184))(v10, *(void *)(*((void *)v9 + 1) + 48), *(void *)(*((void *)v9 + 1) + 56));
      }
    }
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr && *((void *)m_ptr + 1))
  {
    v4 = *(void (**)(void))(*(void *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(*((WebCore::ScrollingTreeScrollingNodeDelegate **)m_ptr
                                                                                                  + 1))
                          + 184);
    v4();
  }
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  uint64_t v5 = [a3 pinchGestureRecognizer];

  [(WKScrollingNodeScrollViewDelegate *)self cancelPointersForGestureRecognizer:v5];
}

- (void)cancelPointersForGestureRecognizer:(id)a3
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)m_ptr + 1);
    if (v4)
    {
      uint64_t v5 = (void *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v4);
      if ((*(uint64_t (**)(void *))(*v5 + 32))(v5))
      {
        uint64_t v6 = v5[43];
        if (v6)
        {
          uint64_t v7 = *(void *)(v6 + 8);
          if (v7)
          {
            uint64_t v8 = *(void *)(*(void *)(v7 + 16) + 8);
            if (v8) {
              uint64_t v9 = v8 - 16;
            }
            else {
              uint64_t v9 = 0;
            }
            uint64_t v10 = *(void (**)(void))(**(void **)(*(void *)(v9 + 40) + 8) + 1752);
            v10();
          }
        }
      }
      else
      {
        __break(0xC471u);
      }
    }
  }
}

- (unint64_t)axesToPreventScrollingForPanGestureInScrollView:(id)a3
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (!m_ptr || !*((void *)m_ptr + 1)) {
    return 0;
  }
  uint64_t v6 = (void *)[a3 panGestureRecognizer];
  uint64_t v7 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (v7) {
    uint64_t v8 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)v7 + 1);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v8);
  if ((*(uint64_t (**)(void *))(*v9 + 32))(v9))
  {
    uint64_t v10 = v9[43];
    if (v10)
    {
      uint64_t v11 = *(void *)(v10 + 8);
      if (v11)
      {
        uint64_t v12 = *(void *)(*(void *)(v11 + 16) + 8);
        uint64_t v13 = v12 ? v12 - 16 : 0;
        uint64_t v14 = (*(uint64_t (**)(void, void *))(**(void **)(*(void *)(v13 + 40) + 8) + 1760))(*(void *)(*(void *)(v13 + 40) + 8), v6);
        if ((v14 & 0xFF00000000) != 0)
        {
          int v25 = v14;
          uint64_t v15 = WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned int>>,unsigned int>((uint64_t *)(v11 + 144), &v25);
          uint64_t v16 = *(void *)(v11 + 144);
          if (v16) {
            v16 += 8 * *(unsigned int *)(v16 - 4);
          }
          if (v16 == v15) {
            char v17 = 0;
          }
          else {
            char v17 = *(unsigned char *)(v15 + 4);
          }
          *((unsigned char *)v8 + 48) = v17;
        }
      }
    }
    char v18 = *(unsigned char *)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 48);
    if (v18)
    {
      if ((*(unsigned char *)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 48) & 5) != 0) {
        return 0;
      }
      BOOL v21 = (v18 & 8) == 0;
      unint64_t v19 = v21 | 2;
      if ((*(unsigned char *)(*((void *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 48) & 0x10) != 0) {
        unint64_t v20 = (v18 & 8) == 0;
      }
      else {
        unint64_t v20 = v21 | 2;
      }
      [v6 translationInView:a3];
      if ((v18 & 8) == 0 || fabs(v22) <= 2.22044605e-16)
      {
        if ((v18 & 0x10) == 0) {
          return v19;
        }
        unint64_t v20 = (v18 & 8) == 0;
        unint64_t v19 = v20;
        if (fabs(v23) <= 2.22044605e-16) {
          return v19;
        }
      }
    }
    else
    {
      unint64_t v20 = 0;
    }
    [(WKScrollingNodeScrollViewDelegate *)self cancelPointersForGestureRecognizer:v6];
    return v20;
  }
  unint64_t result = 96;
  __break(0xC471u);
  return result;
}

- (id)parentScrollViewForScrollView:(id)a3
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  id result = (id)*((void *)m_ptr + 1);
  if (result)
  {
    uint64_t v6 = (void *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree((WebCore::ScrollingTreeScrollingNodeDelegate *)result);
    if ((*(uint64_t (**)(void *))(*v6 + 32))(v6))
    {
      uint64_t v8 = v6[43];
      if (v8
        && (uint64_t v9 = *(void *)(v8 + 8)) != 0
        && ((uint64_t v10 = *(void *)(*(void *)(v9 + 16) + 8)) != 0 ? (v11 = v10 - 16) : (v11 = 0),
            (uint64_t v12 = *(void *)(v11 + 232)) != 0 && !*(unsigned char *)(v12 + 36) && (v14 = *(UIScrollView **)(v12 + 72)) != 0))
      {
        ActingScrollParent = (void *)WebKit::findActingScrollParent((WebKit *)a3, v14, v7);
      }
      else
      {
        ActingScrollParent = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return ActingScrollParent;
      }
      else {
        return 0;
      }
    }
    else
    {
      id result = (id)96;
      __break(0xC471u);
    }
  }
  return result;
}

- (void)scrollView:(id)a3 handleScrollUpdate:(id)a4 completion:(id)a5
{
  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v6 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((void *)m_ptr + 1);
    if (v6)
    {
      uint64_t v7 = (void *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v6);
      if ((*(uint64_t (**)(void *))(*v7 + 32))(v7))
      {
        uint64_t v8 = v7[43];
        if (v8)
        {
          uint64_t v9 = *(void *)(v8 + 8);
          if (v9)
          {
            uint64_t v10 = *(void *)(*(void *)(v9 + 16) + 8);
            if (v10) {
              uint64_t v11 = v10 - 16;
            }
            else {
              uint64_t v11 = 0;
            }
            uint64_t v12 = *(void (**)(void))(**(void **)(*(void *)(v11 + 40) + 8) + 1128);
            v12();
          }
        }
      }
      else
      {
        __break(0xC471u);
      }
    }
  }
}

- (BOOL)_isInUserInteraction
{
  return self->_inUserInteraction;
}

- (void)setInUserInteraction:(BOOL)a3
{
  self->_inUserInteraction = a3;
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  self->_scrollingTreeNodeDelegate.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end