@interface DEResult
- (NSArray)response;
- (NSArray)visualRefs;
- (NSDictionary)meta;
- (NSNumber)elapsedTimeMs;
- (NSNumber)elapsedTimeThreadMs;
- (NSString)error;
- (NSString)json;
- (NSString)status;
- (id)initFromJson:(id)a3;
- (void)setElapsedTimeMs:(id)a3;
- (void)setElapsedTimeThreadMs:(id)a3;
- (void)setError:(id)a3;
- (void)setJson:(id)a3;
- (void)setMeta:(id)a3;
- (void)setResponse:(id)a3;
- (void)setStatus:(id)a3;
- (void)setVisualRefs:(id)a3;
@end

@implementation DEResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_json, 0);
  objc_storeStrong((id *)&self->_elapsedTimeThreadMs, 0);
  objc_storeStrong((id *)&self->_elapsedTimeMs, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_visualRefs, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (void)setJson:(id)a3
{
}

- (NSString)json
{
  return self->_json;
}

- (void)setElapsedTimeThreadMs:(id)a3
{
}

- (NSNumber)elapsedTimeThreadMs
{
  return self->_elapsedTimeThreadMs;
}

- (void)setElapsedTimeMs:(id)a3
{
}

- (NSNumber)elapsedTimeMs
{
  return self->_elapsedTimeMs;
}

- (void)setMeta:(id)a3
{
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setVisualRefs:(id)a3
{
}

- (NSArray)visualRefs
{
  return self->_visualRefs;
}

- (void)setResponse:(id)a3
{
}

- (NSArray)response
{
  return self->_response;
}

- (void)setError:(id)a3
{
}

- (NSString)error
{
  return self->_error;
}

- (void)setStatus:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (id)initFromJson:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DEResult;
  v5 = [(DEResult *)&v31 init];
  if (v5)
  {
    [v4 dataUsingEncoding:4];
    v24 = uint64_t v30 = 0;
    v6 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:");
    id v25 = 0;
    v7 = [v6 valueForKey:@"status"];
    [(DEResult *)v5 setStatus:v7];

    v8 = [v6 valueForKey:@"error"];
    [(DEResult *)v5 setError:v8];

    v9 = [v6 objectForKey:@"response"];
    [(DEResult *)v5 setResponse:v9];

    v10 = [v6 objectForKey:@"visual_refs"];
    [(DEResult *)v5 setVisualRefs:v10];

    v11 = [v6 objectForKey:@"meta"];
    [(DEResult *)v5 setMeta:v11];

    v12 = [v6 objectForKey:@"elapsed_ms"];
    [(DEResult *)v5 setElapsedTimeMs:v12];

    v13 = [v6 objectForKey:@"elapsed_thread_ms"];
    [(DEResult *)v5 setElapsedTimeThreadMs:v13];

    [(DEResult *)v5 setJson:v4];
    v14 = [(DEResult *)v5 response];
    if (!v14)
    {
      v15 = [v6 objectForKey:@"errors"];
      BOOL v16 = v15 == 0;

      if (v16)
      {
LABEL_13:
        v22 = v5;

        goto LABEL_14;
      }
      v14 = objc_opt_new();
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v17 = [v6 valueForKey:@"errors"];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = [*(id *)(*((void *)&v26 + 1) + 8 * i) objectForKey:@"textWithLineNumber"];
            [v14 addObject:v21];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v18);
      }

      [(DEResult *)v5 setResponse:v14];
    }

    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

@end