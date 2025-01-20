@interface WKWebProcessBundleParameters
- (WKWebProcessBundleParameters)initWithDictionary:(id)a3;
- (id).cxx_construct;
- (id)description;
- (id)valueForKey:(id)a3;
- (void)setParameter:(id)a3 forKey:(id)a4;
- (void)setParametersForKeyWithDictionary:(id)a3;
@end

@implementation WKWebProcessBundleParameters

- (id)valueForKey:(id)a3
{
  return (id)[self->_parameters.m_ptr valueForKey:a3];
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (WKWebProcessBundleParameters)initWithDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WKWebProcessBundleParameters;
  v4 = [(WKWebProcessBundleParameters *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a3];
    m_ptr = v4->_parameters.m_ptr;
    v4->_parameters.m_ptr = (void *)v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v4;
}

- (void)setParameter:(id)a3 forKey:(id)a4
{
  [(WKWebProcessBundleParameters *)self willChangeValueForKey:a4];
  [self->_parameters.m_ptr setValue:a3 forKey:a4];

  [(WKWebProcessBundleParameters *)self didChangeValueForKey:a4];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; parameters = %@>",
               NSStringFromClass(v4),
               self,
               self->_parameters.m_ptr);
}

- (void)setParametersForKeyWithDictionary:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__WKWebProcessBundleParameters_setParametersForKeyWithDictionary___block_invoke;
  v3[3] = &unk_1E5813928;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __66__WKWebProcessBundleParameters_setParametersForKeyWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setParameter:a3 forKey:a2];
}

- (void).cxx_destruct
{
  m_ptr = self->_parameters.m_ptr;
  self->_parameters.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

@end