@interface _WKArchiveExclusionRule
- (NSArray)attributeLocalNames;
- (NSArray)attributeValues;
- (NSString)elementLocalName;
- (_WKArchiveExclusionRule)initWithElementLocalName:(id)a3 attributeLocalNames:(id)a4 attributeValues:(id)a5;
- (id).cxx_construct;
@end

@implementation _WKArchiveExclusionRule

- (_WKArchiveExclusionRule)initWithElementLocalName:(id)a3 attributeLocalNames:(id)a4 attributeValues:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)_WKArchiveExclusionRule;
  v8 = [(_WKArchiveExclusionRule *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [a4 count];
    uint64_t v10 = [a5 count];
    v11 = (void *)MEMORY[0x1E4F1C3C8];
    if (v9 != v10) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"attributeLocalNames and attributeValues must have same size"];
    }
    if ((unint64_t)a3 | (unint64_t)a4)
    {
      if (a3) {
        CFRetain(a3);
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*v11 format:@"elementLocalName and attributeLocalNames cannot both be null"];
    }
    m_ptr = v8->_elementLocalName.m_ptr;
    v8->_elementLocalName.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (a4) {
      CFRetain(a4);
    }
    v13 = v8->_attributeLocalNames.m_ptr;
    v8->_attributeLocalNames.m_ptr = a4;
    if (v13) {
      CFRelease(v13);
    }
    if (a5) {
      CFRetain(a5);
    }
    v14 = v8->_attributeValues.m_ptr;
    v8->_attributeValues.m_ptr = a5;
    if (v14) {
      CFRelease(v14);
    }
  }
  return v8;
}

- (NSString)elementLocalName
{
  return (NSString *)self->_elementLocalName.m_ptr;
}

- (NSArray)attributeLocalNames
{
  return (NSArray *)self->_attributeLocalNames.m_ptr;
}

- (NSArray)attributeValues
{
  return (NSArray *)self->_attributeValues.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_attributeValues.m_ptr;
  self->_attributeValues.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_attributeLocalNames.m_ptr;
  self->_attributeLocalNames.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->_elementLocalName.m_ptr;
  self->_elementLocalName.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
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