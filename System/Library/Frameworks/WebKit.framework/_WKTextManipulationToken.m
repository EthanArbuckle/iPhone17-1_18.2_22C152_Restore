@interface _WKTextManipulationToken
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextManipulationToken:(id)a3 includingContentEquality:(BOOL)a4;
- (BOOL)isExcluded;
- (NSDictionary)userInfo;
- (NSString)content;
- (NSString)debugDescription;
- (NSString)identifier;
- (id).cxx_construct;
- (id)_descriptionPreservingPrivacy:(BOOL)a3;
- (id)description;
- (void)dealloc;
- (void)setContent:(id)a3;
- (void)setExcluded:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _WKTextManipulationToken

- (void)dealloc
{
  self->_identifier = 0;
  self->_content = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WKTextManipulationToken;
  [(_WKTextManipulationToken *)&v3 dealloc];
}

- (void)setUserInfo:(id)a3
{
  id m_ptr = self->_userInfo.m_ptr;
  if (m_ptr != a3 && (objc_msgSend(m_ptr, "isEqual:") & 1) == 0)
  {
    v6 = (void *)[a3 copy];
    v7 = self->_userInfo.m_ptr;
    self->_userInfo.id m_ptr = v6;
    if (v7)
    {
      CFRelease(v7);
    }
  }
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)self->_userInfo.m_ptr;
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

  return [(_WKTextManipulationToken *)self isEqualToTextManipulationToken:a3 includingContentEquality:1];
}

- (BOOL)isEqualToTextManipulationToken:(id)a3 includingContentEquality:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  v7 = [(_WKTextManipulationToken *)self identifier];
  uint64_t v8 = [a3 identifier];
  if (v7 == (NSString *)v8) {
    LOBYTE(v9) = 0;
  }
  else {
    int v9 = [(NSString *)v7 isEqual:v8] ^ 1;
  }
  BOOL v11 = [(_WKTextManipulationToken *)self isExcluded];
  char v12 = [a3 isExcluded];
  if (!v4
    || (v13 = [(_WKTextManipulationToken *)self content],
        uint64_t v14 = [a3 content],
        v13 == (NSString *)v14))
  {
    char v15 = 1;
  }
  else
  {
    char v15 = [(NSString *)v13 isEqual:v14];
  }
  unsigned __int8 v16 = v11 ^ v12;
  v17 = [(_WKTextManipulationToken *)self userInfo];
  uint64_t v18 = [a3 userInfo];
  if (v17 == (NSDictionary *)v18) {
    char v19 = 1;
  }
  else {
    char v19 = [(NSDictionary *)v17 isEqual:v18];
  }
  if ((v9 | v16)) {
    return 0;
  }
  else {
    return v15 & v19;
  }
}

- (id)description
{
  return [(_WKTextManipulationToken *)self _descriptionPreservingPrivacy:1];
}

- (NSString)debugDescription
{
  return (NSString *)[(_WKTextManipulationToken *)self _descriptionPreservingPrivacy:0];
}

- (id)_descriptionPreservingPrivacy:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; identifier = %@; isExcluded = %i",
                 objc_opt_class(),
                 self,
                 [(_WKTextManipulationToken *)self identifier],
                 [(_WKTextManipulationToken *)self isExcluded]);
  v6 = [(_WKTextManipulationToken *)self content];
  if (v3) {
    objc_msgSend(v5, "appendFormat:", @"; content length = %lu", -[NSString length](v6, "length"), v9);
  }
  else {
    objc_msgSend(v5, "appendFormat:", @"; content = %@; user info = %@",
  }
      v6,
      [(_WKTextManipulationToken *)self userInfo]);
  [v5 appendString:@">"];
  v7 = (void *)CFMakeCollectable((CFTypeRef)[v5 copy]);

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (BOOL)isExcluded
{
  return self->_excluded;
}

- (void)setExcluded:(BOOL)a3
{
  self->_excluded = a3;
}

- (void).cxx_destruct
{
  id m_ptr = self->_userInfo.m_ptr;
  self->_userInfo.id m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end