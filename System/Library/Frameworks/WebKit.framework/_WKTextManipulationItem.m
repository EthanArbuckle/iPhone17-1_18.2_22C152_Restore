@interface _WKTextManipulationItem
- (BOOL)isCrossSiteSubframe;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextManipulationItem:(id)a3 includingContentEquality:(BOOL)a4;
- (BOOL)isSubframe;
- (NSArray)tokens;
- (NSString)debugDescription;
- (NSString)identifier;
- (_WKTextManipulationItem)initWithIdentifier:(id)a3 tokens:(id)a4;
- (_WKTextManipulationItem)initWithIdentifier:(id)a3 tokens:(id)a4 isSubframe:(BOOL)a5 isCrossSiteSubframe:(BOOL)a6;
- (id).cxx_construct;
- (id)_descriptionPreservingPrivacy:(BOOL)a3;
- (id)description;
@end

@implementation _WKTextManipulationItem

- (_WKTextManipulationItem)initWithIdentifier:(id)a3 tokens:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_WKTextManipulationItem;
  v6 = [(_WKTextManipulationItem *)&v10 init];
  if (v6)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v6->_identifier.m_ptr;
    v6->_identifier.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (a4) {
      CFRetain(a4);
    }
    v8 = v6->_tokens.m_ptr;
    v6->_tokens.m_ptr = a4;
    if (v8) {
      CFRelease(v8);
    }
  }
  return v6;
}

- (_WKTextManipulationItem)initWithIdentifier:(id)a3 tokens:(id)a4 isSubframe:(BOOL)a5 isCrossSiteSubframe:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)_WKTextManipulationItem;
  objc_super v10 = [(_WKTextManipulationItem *)&v14 init];
  if (v10)
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v10->_identifier.m_ptr;
    v10->_identifier.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    if (a4) {
      CFRetain(a4);
    }
    v12 = v10->_tokens.m_ptr;
    v10->_tokens.m_ptr = a4;
    if (v12) {
      CFRelease(v12);
    }
    v10->_isSubframe = a5;
    v10->_isCrossSiteSubframe = a6;
  }
  return v10;
}

- (NSString)identifier
{
  return (NSString *)self->_identifier.m_ptr;
}

- (NSArray)tokens
{
  return (NSArray *)self->_tokens.m_ptr;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(_WKTextManipulationItem *)self isEqualToTextManipulationItem:a3 includingContentEquality:1];
}

- (BOOL)isEqualToTextManipulationItem:(id)a3 includingContentEquality:(BOOL)a4
{
  id v4 = a3;
  if (a3)
  {
    v7 = [(_WKTextManipulationItem *)self identifier];
    if ((v7 == (NSString *)[v4 identifier]
       || -[NSString isEqualToString:](-[_WKTextManipulationItem identifier](self, "identifier"), "isEqualToString:", [v4 identifier]))&& (NSUInteger v8 = -[NSArray count](-[_WKTextManipulationItem tokens](self, "tokens"), "count"), v8 == objc_msgSend((id)objc_msgSend(v4, "tokens"), "count")))
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2020000000;
      char v20 = 1;
      NSUInteger v9 = [(NSArray *)[(_WKTextManipulationItem *)self tokens] count];
      unint64_t v10 = objc_msgSend((id)objc_msgSend(v4, "tokens"), "count");
      v11 = [(_WKTextManipulationItem *)self tokens];
      if (v10 >= v9) {
        NSUInteger v12 = v9;
      }
      else {
        NSUInteger v12 = v10;
      }
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v12);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __82___WKTextManipulationItem_isEqualToTextManipulationItem_includingContentEquality___block_invoke;
      v15[3] = &unk_1E58128C8;
      BOOL v16 = a4;
      v15[4] = v4;
      v15[5] = &v17;
      [(NSArray *)v11 enumerateObjectsAtIndexes:v13 options:0 usingBlock:v15];
      LOBYTE(v4) = *((unsigned char *)v18 + 24) != 0;
      _Block_object_dispose(&v17, 8);
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (id)description
{
  return [(_WKTextManipulationItem *)self _descriptionPreservingPrivacy:1];
}

- (NSString)debugDescription
{
  return (NSString *)[(_WKTextManipulationItem *)self _descriptionPreservingPrivacy:0];
}

- (id)_descriptionPreservingPrivacy:(BOOL)a3
{
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  v6 = [(_WKTextManipulationItem *)self tokens];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57___WKTextManipulationItem__descriptionPreservingPrivacy___block_invoke;
  v9[3] = &unk_1E58128F0;
  BOOL v10 = a3;
  v9[4] = v5;
  [(NSArray *)v6 enumerateObjectsUsingBlock:v9];
  uint64_t v7 = [NSString stringWithFormat:@"[\n\t%@\n]", objc_msgSend(v5, "componentsJoinedByString:", @",\n\t"];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier = %@ tokens = %@>",
               objc_opt_class(),
               self,
               [(_WKTextManipulationItem *)self identifier],
               v7);
}

- (BOOL)isSubframe
{
  return self->_isSubframe;
}

- (BOOL)isCrossSiteSubframe
{
  return self->_isCrossSiteSubframe;
}

- (void).cxx_destruct
{
  m_ptr = self->_tokens.m_ptr;
  self->_tokens.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  id v4 = self->_identifier.m_ptr;
  self->_identifier.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end