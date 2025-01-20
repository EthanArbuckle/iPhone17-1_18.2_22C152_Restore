@interface WKAnimationDelegate
- (WKAnimationDelegate)initWithLayerID:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF:(void *)a4 :SupportsObjectIdentifierNullState::No>>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType layerTreeHost:;
- (id).cxx_construct;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)invalidate;
@end

@implementation WKAnimationDelegate

- (WKAnimationDelegate)initWithLayerID:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF:(void *)a4 :SupportsObjectIdentifierNullState::No>>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType layerTreeHost:
{
  unint64_t m_identifier = a3.m_processIdentifier.m_identifier;
  unint64_t v6 = a3.m_object.m_identifier;
  v8.receiver = self;
  v8.super_class = (Class)WKAnimationDelegate;
  result = [(WKAnimationDelegate *)&v8 init];
  if (result)
  {
    result->_layerID.m_value.m_object.unint64_t m_identifier = v6;
    result->_layerID.m_value.m_processIdentifier.unint64_t m_identifier = m_identifier;
    result->_layerTreeHost = a4;
  }
  return result;
}

- (void)invalidate
{
  self->_layerTreeHost = 0;
}

- (void)animationDidStart:(id)a3
{
  if (self->_layerTreeHost)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"WKPlatformCAAnimationExplicitBeginTimeFlag"), "BOOLValue"))double v6 = CACurrentMediaTime(); {
    else
    }
      v5 = (WTF::MonotonicTime *)[a3 beginTime];
    double v7 = v6;
    WTF::MonotonicTime::now(v5);
    double v9 = v7 - CACurrentMediaTime() + v8;
    unint64_t m_identifier = self->_layerID.m_value.m_object.m_identifier;
    p_layerID = &self->_layerID;
    char v10 = m_identifier;
    v13 = (uint64_t *)p_layerID[1].m_value.m_object.m_identifier;
    if (m_identifier)
    {
      Markable<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>, WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>::MarkableTraits> v14 = *p_layerID;
      char v10 = 1;
    }
    else
    {
      LOBYTE(v14.m_value.m_object.m_identifier) = 0;
    }
    char v15 = v10;
    WebKit::RemoteLayerTreeHost::animationDidStart(v13, (long long *)&v14, (uint64_t)a3, v9);
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  layerTreeHost = (uint64_t *)self->_layerTreeHost;
  if (layerTreeHost)
  {
    unint64_t m_identifier = self->_layerID.m_value.m_object.m_identifier;
    p_layerID = &self->_layerID;
    if (m_identifier)
    {
      Markable<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>, WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>::MarkableTraits> v9 = *p_layerID;
      char v8 = 1;
    }
    else
    {
      char v8 = 0;
      LOBYTE(v9.m_value.m_object.m_identifier) = 0;
    }
    char v10 = v8;
    WebKit::RemoteLayerTreeHost::animationDidEnd(layerTreeHost, (long long *)&v9, (uint64_t)a3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end