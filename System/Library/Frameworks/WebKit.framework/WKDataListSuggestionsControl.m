@interface WKDataListSuggestionsControl
- (BOOL)isShowingSuggestions;
- (String)suggestionAtIndex:(int64_t)a3;
- (WKContentView)view;
- (WKDataListSuggestionsControl)initWithInformation:(void *)a3 inView:(id)a4;
- (id).cxx_construct;
- (id)textSuggestions;
- (int64_t)suggestionsCount;
- (int64_t)textAlignment;
- (void)didSelectOptionAtIndex:(int64_t)a3;
- (void)setIsShowingSuggestions:(BOOL)a3;
- (void)setView:(id)a3;
- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4;
- (void)updateWithInformation:(void *)a3;
@end

@implementation WKDataListSuggestionsControl

- (WKDataListSuggestionsControl)initWithInformation:(void *)a3 inView:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WKDataListSuggestionsControl;
  v6 = [(WKDataListSuggestionsControl *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_view, a4);
    v8 = (char *)a3 + 8;
    uint64_t m_size = v7->_suggestions.m_size;
    if (m_size) {
      WTF::VectorDestructor<true,WebCore::HTTPHeaderField>::destruct((WTF::StringImpl *)v7->_suggestions.m_buffer, (WTF::StringImpl *)((char *)v7->_suggestions.m_buffer + 16 * m_size));
    }
    WTF::VectorBuffer<WTF::String,0ul,WTF::FastMalloc>::adopt((uint64_t)&v7->_suggestions, v8);
    [objc_loadWeak((id *)&v7->_view) _setDataListSuggestionsControl:v7];
  }
  return v7;
}

- (void)updateWithInformation:(void *)a3
{
  p_suggestions = (WTF::StringImpl **)&self->_suggestions;
  uint64_t m_size = self->_suggestions.m_size;
  if (m_size) {
    WTF::VectorDestructor<true,WebCore::HTTPHeaderField>::destruct(*p_suggestions, (WTF::StringImpl *)((char *)*p_suggestions + 16 * m_size));
  }

  WTF::VectorBuffer<WTF::String,0ul,WTF::FastMalloc>::adopt((uint64_t)p_suggestions, (_DWORD *)a3 + 2);
}

- (void)showSuggestionsDropdown:(void *)a3 activationType:(unsigned __int8)a4
{
  uint64_t v5 = *((void *)a3 + 2);
  if (v5) {
    goto LABEL_6;
  }
  uint64_t v5 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)uint64_t v5 = 1;
  *(void *)(v5 + 8) = a3;
  v7 = (unsigned int *)*((void *)a3 + 2);
  *((void *)a3 + 2) = v5;
  if (!v7) {
    goto LABEL_6;
  }
  if (atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v7);
    WTF::fastFree((WTF *)v7, (void *)a2);
  }
  uint64_t v5 = *((void *)a3 + 2);
  if (v5) {
LABEL_6:
  }
    atomic_fetch_add((atomic_uint *volatile)v5, 1u);
  m_ptr = (unsigned int *)self->_dropdown.m_impl.m_ptr;
  self->_dropdown.m_impl.m_ptr = (DefaultWeakPtrImpl *)v5;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
  }
}

- (void)didSelectOptionAtIndex:(int64_t)a3
{
  m_ptr = self->_dropdown.m_impl.m_ptr;
  if (m_ptr) {
    uint64_t v4 = *((void *)m_ptr + 1);
  }
  else {
    uint64_t v4 = 0;
  }
  if (self->_suggestions.m_size <= (unint64_t)a3)
  {
    __break(0xC471u);
  }
  else
  {
    uint64_t v5 = *(void *)(v4 + 24);
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 8);
      if (v6)
      {
        WebKit::WebPageProxy::didSelectOption(v6 - 16, (const WTF::String *)((char *)self->_suggestions.m_buffer + 16 * a3));
        WebKit::WebDataListSuggestionsDropdownIOS::close((id *)v4);
      }
    }
  }
}

- (id)textSuggestions
{
  v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t m_size = self->_suggestions.m_size;
  if (m_size)
  {
    m_buffer = self->_suggestions.m_buffer;
    uint64_t v6 = 16 * m_size - 16;
    do
    {
      if (*(void *)m_buffer) {
        v7 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        v7 = &stru_1EEA10550;
      }
      objc_msgSend(v3, "addObject:", +[WKDataListTextSuggestion textSuggestionWithInputText:](WKDataListTextSuggestion, "textSuggestionWithInputText:", v7));
      if ([v3 count] == 3) {
        break;
      }
      m_buffer = (DataListSuggestion *)((char *)m_buffer + 16);
      uint64_t v8 = v6;
      v6 -= 16;
    }
    while (v8);
  }
  return v3;
}

- (int64_t)suggestionsCount
{
  return self->_suggestions.m_size;
}

- (String)suggestionAtIndex:(int64_t)a3
{
  if (self->_suggestions.m_size <= (unint64_t)a3)
  {
    __break(0xC471u);
  }
  else
  {
    uint64_t v4 = (_DWORD *)*((void *)self->_suggestions.m_buffer + 2 * a3);
    if (v4) {
      *v4 += 2;
    }
    void *v3 = v4;
  }
  return (String)self;
}

- (int64_t)textAlignment
{
  return 2 * *(unsigned __int8 *)([objc_loadWeak((id *)&self->_view) focusedElementInformation] + 177);
}

- (BOOL)isShowingSuggestions
{
  return self->_isShowingSuggestions;
}

- (void)setIsShowingSuggestions:(BOOL)a3
{
  self->_isShowingSuggestions = a3;
}

- (WKContentView)view
{
  return (WKContentView *)objc_loadWeak((id *)&self->_view);
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_suggestions, v3);
  m_ptr = (unsigned int *)self->_dropdown.m_impl.m_ptr;
  self->_dropdown.m_impl.m_ptr = 0;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end