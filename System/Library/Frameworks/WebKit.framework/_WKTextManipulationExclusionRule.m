@interface _WKTextManipulationExclusionRule
- (BOOL)isExclusion;
- (NSString)attributeName;
- (NSString)attributeValue;
- (NSString)className;
- (NSString)elementName;
- (id).cxx_construct;
- (id)initExclusion:(BOOL)a3 forAttribute:(id)a4 value:(id)a5;
- (id)initExclusion:(BOOL)a3 forClass:(id)a4;
- (id)initExclusion:(BOOL)a3 forElement:(id)a4;
@end

@implementation _WKTextManipulationExclusionRule

- (id)initExclusion:(BOOL)a3 forElement:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_WKTextManipulationExclusionRule;
  v6 = [(_WKTextManipulationExclusionRule *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_isExclusion = a3;
    if (a4) {
      CFRetain(a4);
    }
    m_ptr = v7->_elementName.m_ptr;
    v7->_elementName.m_ptr = a4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v7;
}

- (id)initExclusion:(BOOL)a3 forAttribute:(id)a4 value:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)_WKTextManipulationExclusionRule;
  v8 = [(_WKTextManipulationExclusionRule *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_isExclusion = a3;
    if (a4) {
      CFRetain(a4);
    }
    m_ptr = v9->_attributeName.m_ptr;
    v9->_attributeName.m_ptr = a4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (a5) {
      CFRetain(a5);
    }
    v11 = v9->_attributeValue.m_ptr;
    v9->_attributeValue.m_ptr = a5;
    if (v11) {
      CFRelease(v11);
    }
  }
  return v9;
}

- (id)initExclusion:(BOOL)a3 forClass:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_WKTextManipulationExclusionRule;
  v6 = [(_WKTextManipulationExclusionRule *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_isExclusion = a3;
    if (a4) {
      CFRetain(a4);
    }
    m_ptr = v7->_className.m_ptr;
    v7->_className.m_ptr = a4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v7;
}

- (NSString)elementName
{
  return (NSString *)self->_elementName.m_ptr;
}

- (NSString)attributeName
{
  return (NSString *)self->_attributeName.m_ptr;
}

- (NSString)attributeValue
{
  return (NSString *)self->_attributeValue.m_ptr;
}

- (NSString)className
{
  return (NSString *)self->_className.m_ptr;
}

- (BOOL)isExclusion
{
  return self->_isExclusion;
}

- (void).cxx_destruct
{
  m_ptr = self->_className.m_ptr;
  self->_className.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_attributeValue.m_ptr;
  self->_attributeValue.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->_attributeName.m_ptr;
  self->_attributeName.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->_elementName.m_ptr;
  self->_elementName.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end