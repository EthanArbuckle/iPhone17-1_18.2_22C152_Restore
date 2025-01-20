@interface WKMockNFTag
- (BOOL)isEqualToNFTag:(id)a3;
- (NFTagA)tagA;
- (NFTagB)tagB;
- (NFTagF)tagF;
- (NSData)AppData;
- (NSData)UID;
- (NSData)tagID;
- (NSString)description;
- (WKMockNFTag)initWithNFTag:(id)a3;
- (WKMockNFTag)initWithType:(unsigned int)a3;
- (WKMockNFTag)initWithType:(unsigned int)a3 tagID:(id)a4;
- (id).cxx_construct;
- (unint64_t)ndefContainerSize;
- (unint64_t)ndefMessageSize;
- (unsigned)ndefAvailability;
- (unsigned)technology;
- (unsigned)type;
- (void)dealloc;
@end

@implementation WKMockNFTag

- (unsigned)type
{
  return self->_type;
}

- (NSData)tagID
{
  return (NSData *)self->_tagID.m_ptr;
}

- (WKMockNFTag)initWithNFTag:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKMockNFTag;
  v4 = [(WKMockNFTag *)&v9 init];
  if (v4)
  {
    v4->_type = [a3 type];
    v5 = (void *)[a3 tagID];
    v6 = v5;
    if (v5) {
      CFRetain(v5);
    }
    m_ptr = v4->_tagID.m_ptr;
    v4->_tagID.m_ptr = v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (void)dealloc
{
  self->_AppData = 0;
  self->_UID = 0;
  v3.receiver = self;
  v3.super_class = (Class)WKMockNFTag;
  [(WKMockNFTag *)&v3 dealloc];
}

- (NSString)description
{
  return 0;
}

- (BOOL)isEqualToNFTag:(id)a3
{
  return 0;
}

- (WKMockNFTag)initWithType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v6 = [(WKMockNFTag *)self initWithType:v3 tagID:v5];
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

- (WKMockNFTag)initWithType:(unsigned int)a3 tagID:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WKMockNFTag;
  v6 = [(WKMockNFTag *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    if (a4) {
      CFRetain(a4);
    }
    m_ptr = v7->_tagID.m_ptr;
    v7->_tagID.m_ptr = a4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v7;
}

- (unsigned)technology
{
  return self->_technology;
}

- (NSData)AppData
{
  return self->_AppData;
}

- (NSData)UID
{
  return self->_UID;
}

- (unsigned)ndefAvailability
{
  return self->_ndefAvailability;
}

- (unint64_t)ndefMessageSize
{
  return self->_ndefMessageSize;
}

- (unint64_t)ndefContainerSize
{
  return self->_ndefContainerSize;
}

- (NFTagA)tagA
{
  return self->_tagA;
}

- (NFTagB)tagB
{
  return self->_tagB;
}

- (NFTagF)tagF
{
  return self->_tagF;
}

- (void).cxx_destruct
{
  m_ptr = self->_tagID.m_ptr;
  self->_tagID.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end