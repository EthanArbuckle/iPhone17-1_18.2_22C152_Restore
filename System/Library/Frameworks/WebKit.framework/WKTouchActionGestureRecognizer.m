@interface WKTouchActionGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (WKTouchActionGestureRecognizer)initWithTouchActionDelegate:(id)a3;
- (id).cxx_construct;
- (void)_updateState;
- (void)clearTouchActionsForTouchIdentifier:(unsigned int)a3;
- (void)setTouchActions:(OptionSet<WebCore:(unsigned int)a4 :TouchAction>)a3 forTouchIdentifier:;
@end

@implementation WKTouchActionGestureRecognizer

- (id).cxx_construct
{
  *((void *)self + 34) = 0;
  return self;
}

- (WKTouchActionGestureRecognizer)initWithTouchActionDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKTouchActionGestureRecognizer;
  result = [(WKTouchActionGestureRecognizer *)&v5 init];
  if (result) {
    result->_touchActionDelegate = (WKTouchActionGestureRecognizerDelegate *)a3;
  }
  return result;
}

- (void)setTouchActions:(OptionSet<WebCore:(unsigned int)a4 :TouchAction>)a3 forTouchIdentifier:
{
  unsigned __int8 var0 = a3.var0;
  unsigned int v5 = a4;
  WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::inlineSet<unsigned int const&,WTF::OptionSet<WebCore::TouchAction>&>((uint64_t *)&self->_touchActionsByTouchIdentifier, (int *)&v5, &var0, (uint64_t)&v4);
}

- (void)clearTouchActionsForTouchIdentifier:(unsigned int)a3
{
  unsigned int v6 = a3;
  p_touchActionsByTouchIdentifier = (uint64_t *)&self->_touchActionsByTouchIdentifier;
  uint64_t v4 = (_DWORD *)WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned int>>,unsigned int>((uint64_t *)&self->_touchActionsByTouchIdentifier, (int *)&v6);
  if (*p_touchActionsByTouchIdentifier)
  {
    uint64_t v5 = *p_touchActionsByTouchIdentifier + 8 * *(unsigned int *)(*p_touchActionsByTouchIdentifier - 4);
    if ((_DWORD *)v5 == v4) {
      return;
    }
  }
  else
  {
    if (!v4) {
      return;
    }
    uint64_t v5 = 0;
  }
  if ((_DWORD *)v5 != v4) {
    WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::remove(p_touchActionsByTouchIdentifier, v4);
  }
}

- (void)_updateState
{
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_touchActionsByTouchIdentifier = (uint64_t *)&self->_touchActionsByTouchIdentifier;
  m_tableForLLDB = self->_touchActionsByTouchIdentifier.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB
    && *(m_tableForLLDB - 3)
    && ((int v7 = -[WKTouchActionGestureRecognizerDelegate gestureRecognizerMayPanWebView:](self->_touchActionDelegate, "gestureRecognizerMayPanWebView:"), v8 = [(WKTouchActionGestureRecognizerDelegate *)self->_touchActionDelegate gestureRecognizerMayPinchToZoomWebView:a3], v9 = [(WKTouchActionGestureRecognizerDelegate *)self->_touchActionDelegate gestureRecognizerMayDoubleTapToZoomWebView:a3], v10 = v9, v21 = v7, (v7 & 1) != 0)|| (v8 & 1) != 0|| v9))
  {
    v12 = (void *)[(WKTouchActionGestureRecognizerDelegate *)self->_touchActionDelegate touchActionActiveTouches];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v11 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          int v22 = [v16 unsignedIntegerValue];
          uint64_t v17 = WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned int>>,unsigned int>(p_touchActionsByTouchIdentifier, &v22);
          uint64_t v18 = v17;
          uint64_t v19 = *p_touchActionsByTouchIdentifier;
          if (*p_touchActionsByTouchIdentifier) {
            v19 += 8 * *(unsigned int *)(v19 - 4);
          }
          if (v19 != v17
            && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v16), "gestureRecognizers"), "containsObject:", a3)&& (v21 && (*(unsigned char *)(v18 + 4) & 0x1C) == 0|| v8 && (*(unsigned char *)(v18 + 4) & 0x24) == 0|| v10 && (*(unsigned char *)(v18 + 4) & 2) != 0))
          {
            LOBYTE(v11) = 1;
            return v11;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        LOBYTE(v11) = 0;
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (void).cxx_destruct
{
  m_table = (char *)self->_touchActionsByTouchIdentifier.m_impl.var0.m_table;
  if (m_table) {
    WTF::fastFree((WTF *)(m_table - 16), (void *)a2);
  }
}

@end