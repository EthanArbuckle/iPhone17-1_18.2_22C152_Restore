@interface CalXMLElementRedactionRule
- (NSDictionary)attributes;
- (id)redactionRuleForAttribute:(id)a3;
- (int)cdata;
- (int)content;
- (int)elementName;
- (void)setAttributes:(id)a3;
- (void)setCdata:(int)a3;
- (void)setContent:(int)a3;
- (void)setElementName:(int)a3;
@end

@implementation CalXMLElementRedactionRule

- (id)redactionRuleForAttribute:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (redactionRuleForAttribute__onceToken != -1) {
      dispatch_once(&redactionRuleForAttribute__onceToken, &__block_literal_global_56);
    }
    v8 = redactionRuleForAttribute__logDedupingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke_2;
    block[3] = &unk_1E624E508;
    id v11 = v4;
    dispatch_sync(v8, block);
  }
  return v6;
}

uint64_t __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)redactionRuleForAttribute__loggedAttributes;
  redactionRuleForAttribute__loggedAttributes = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.mobilecal.CalDAVTrafficLogScrubber.attributeDedupingQueue", 0);
  redactionRuleForAttribute__logDedupingQueue = (uint64_t)v2;
  return MEMORY[0x1F41817F8](v2);
}

uint64_t __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke_2(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  uint64_t result = [(id)redactionRuleForAttribute__loggedAttributes containsObject:*(void *)(a1 + 32)];
  if ((result & 1) == 0)
  {
    v3 = +[CalDAVTrafficLogScrubber log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke_2_cold_1(v1, v3);
    }

    return [(id)redactionRuleForAttribute__loggedAttributes addObject:*v1];
  }
  return result;
}

- (int)elementName
{
  return self->_elementName;
}

- (void)setElementName:(int)a3
{
  self->_elementName = a3;
}

- (int)content
{
  return self->_content;
}

- (void)setContent:(int)a3
{
  self->_content = a3;
}

- (int)cdata
{
  return self->_cdata;
}

- (void)setCdata:(int)a3
{
  self->_cdata = a3;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

void __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1BBC88000, a2, OS_LOG_TYPE_DEBUG, "Unknown attribute named %@", (uint8_t *)&v3, 0xCu);
}

@end