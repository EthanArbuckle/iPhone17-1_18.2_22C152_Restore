@interface ECRawMessageHeaders
- (ECRawMessageHeaders)initWithHeaderString:(id)a3;
- (id)allHeaderKeys;
- (id)allHeaders;
- (id)firstHeaderForKey:(id)a3;
- (id)headersForKey:(id)a3;
@end

@implementation ECRawMessageHeaders

- (ECRawMessageHeaders)initWithHeaderString:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ECRawMessageHeaders;
  v5 = [(ECRawMessageHeaders *)&v31 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28B88], "ef_rfc6376WhitespaceCharacterSet");
    unint64_t v7 = 0;
    unint64_t v8 = 0;
LABEL_3:
    for (unint64_t i = v8; i < [v4 length]; ++i)
    {
      if ([v4 characterAtIndex:i] == 13
        && i + 1 < [v4 length]
        && [v4 characterAtIndex:i + 1] == 10
        && (i + 2 >= [v4 length]
         || (objc_msgSend(v6, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:")) & 1) == 0))
      {
        v10 = objc_msgSend(v4, "substringWithRange:", v7, i - v7 + 2);
        unint64_t v11 = 0;
        unint64_t v8 = i + 1;
        unint64_t v30 = i + 2;
        while (1)
        {
          if (v11 >= [v10 length])
          {
            v12 = 0;
            v13 = 0;
            goto LABEL_26;
          }
          if ([v10 characterAtIndex:v11] == 58) {
            break;
          }
          ++v11;
        }
        v13 = [v10 substringToIndex:v11];
        uint64_t v14 = [v10 substringFromIndex:v11 + 1];
        v12 = (void *)v14;
        if (v13 && v14)
        {
          v28 = [[ECRawMessageHeader alloc] initWithHeaderFieldName:v13 body:v14];
          headers = v5->_headers;
          if (!headers)
          {
            uint64_t v16 = objc_opt_new();
            v17 = v5->_headers;
            v5->_headers = (NSMutableDictionary *)v16;

            headers = v5->_headers;
          }
          v18 = [(ECRawMessageHeader *)v28 name];
          v19 = [(NSMutableDictionary *)headers objectForKeyedSubscript:v18];

          if (v19)
          {
            v20 = v5->_headers;
            v21 = [v29 name];
            v22 = [(NSMutableDictionary *)v20 objectForKeyedSubscript:v21];
            [v22 addObject:v29];
          }
          else
          {
            v21 = [MEMORY[0x1E4F1CA48] arrayWithObject:v29];
            v23 = v5->_headers;
            v22 = [v29 name];
            [(NSMutableDictionary *)v23 setObject:v21 forKeyedSubscript:v22];
          }

          orderedHeaders = v5->_orderedHeaders;
          if (!orderedHeaders)
          {
            uint64_t v25 = objc_opt_new();
            v26 = v5->_orderedHeaders;
            v5->_orderedHeaders = (NSMutableArray *)v25;

            orderedHeaders = v5->_orderedHeaders;
          }
          [(NSMutableArray *)orderedHeaders addObject:v29];
        }
LABEL_26:

        unint64_t v7 = v30;
        goto LABEL_3;
      }
    }
  }
  return v5;
}

- (id)allHeaders
{
  return self->_orderedHeaders;
}

- (id)allHeaderKeys
{
  return (id)[(NSMutableDictionary *)self->_headers allKeys];
}

- (id)headersForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_headers objectForKeyedSubscript:a3];
  return v3;
}

- (id)firstHeaderForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_headers objectForKeyedSubscript:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedHeaders, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end