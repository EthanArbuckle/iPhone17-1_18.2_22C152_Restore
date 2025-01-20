@interface _WKPrintFormattingAttributes
- (PrintInfo)printInfo;
- (ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,)frameID;
- (_WKPrintFormattingAttributes)initWithPageCount:(unint64_t)a3 frameID:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF:(PrintInfo *)a5 :SupportsObjectIdentifierNullState::Yes>>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::FrameIdentifierType printInfo:;
- (id).cxx_construct;
- (unint64_t)pageCount;
@end

@implementation _WKPrintFormattingAttributes

- (_WKPrintFormattingAttributes)initWithPageCount:(unint64_t)a3 frameID:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF:(PrintInfo *)a5 :SupportsObjectIdentifierNullState::Yes>>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::FrameIdentifierType printInfo:
{
  unint64_t m_identifier = a4.m_processIdentifier.m_identifier;
  unint64_t v7 = a4.m_object.m_identifier;
  v11.receiver = self;
  v11.super_class = (Class)_WKPrintFormattingAttributes;
  result = [(_WKPrintFormattingAttributes *)&v11 init];
  if (result)
  {
    result->_pageCount = a3;
    result->_frameID.m_object.unint64_t m_identifier = v7;
    result->_frameID.m_processIdentifier.unint64_t m_identifier = m_identifier;
    long long v10 = *(_OWORD *)&a5->pageSetupScaleFactor;
    *(RectEdges<float> *)((char *)&result->_printInfo.margin + 1) = *(RectEdges<float> *)((char *)&a5->margin + 1);
    *(_OWORD *)&result->_printInfo.pageSetupScaleFactor = v10;
  }
  return result;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,)frameID
{
  unint64_t m_identifier = self->_frameID.m_processIdentifier.m_identifier;
  unint64_t v3 = self->_frameID.m_object.m_identifier;
  result.m_processIdentifier.unint64_t m_identifier = m_identifier;
  result.m_object.unint64_t m_identifier = v3;
  return result;
}

- (PrintInfo)printInfo
{
  RectEdges<float> v3 = *(RectEdges<float> *)((char *)&self[1].margin + 4);
  *(_OWORD *)&retstr->pageSetupScaleFactor = *(_OWORD *)&self[1].pageSetupScaleFactor;
  *(RectEdges<float> *)((char *)&retstr->margin + 4) = v3;
  return self;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 45) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end