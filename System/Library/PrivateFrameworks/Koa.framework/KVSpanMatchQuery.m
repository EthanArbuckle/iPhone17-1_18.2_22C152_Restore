@interface KVSpanMatchQuery
- (KVSpanMatchQuery)initWithQuery:(id)a3;
- (SEMSpanMatchQuery)query;
- (id)cleanText;
- (id)description;
- (id)locale;
- (void)setIncludedFieldTypes:(id)a3;
- (void)setIncludedItemTypes:(id)a3;
@end

@implementation KVSpanMatchQuery

- (void).cxx_destruct
{
}

- (SEMSpanMatchQuery)query
{
  return self->_query;
}

- (id)description
{
  return (id)objc_msgSend_description(self->_query, a2, v2, v3, v4, v5);
}

- (void)setIncludedFieldTypes:(id)a3
{
}

- (void)setIncludedItemTypes:(id)a3
{
}

- (id)cleanText
{
  return (id)((uint64_t (*)(SEMSpanMatchQuery *, char *))MEMORY[0x1F4181798])(self->_query, sel_originalText);
}

- (id)locale
{
  return (id)((uint64_t (*)(SEMSpanMatchQuery *, char *))MEMORY[0x1F4181798])(self->_query, sel_locale);
}

- (KVSpanMatchQuery)initWithQuery:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVSpanMatchQuery;
  v6 = [(KVSpanMatchQuery *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_query, a3);
  }

  return v7;
}

@end