@interface FSFCurareInteractionStream
+ (id)eventFilterForEventTypes:(id)a3;
+ (id)getWithStreamId:(id)a3;
+ (id)getWithStreamId:(id)a3 sourceType:(unint64_t)a4;
- (BOOL)deleteCurrentStream;
- (BOOL)insert:(id)a3 error:(id *)a4;
- (FSFCurareInteractionStream)initWithStreamId:(id)a3;
- (FSFCurareInteractionStream)initWithStreamId:(id)a3 sourceType:(unint64_t)a4;
- (FSFStreamSourceProtocol)stream;
- (id)retrieve:(id)a3;
- (id)retrieveWithInteractionWrapper:(id)a3;
- (void)retrieve:(id)a3 completionHandler:(id)a4;
- (void)retrieveWithInteractionWrapper:(id)a3 completionHandler:(id)a4;
- (void)setStream:(id)a3;
@end

@implementation FSFCurareInteractionStream

+ (id)getWithStreamId:(id)a3
{
  return (id)[a1 getWithStreamId:a3 sourceType:0];
}

+ (id)getWithStreamId:(id)a3 sourceType:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[FSFCurareInteractionStream alloc] initWithStreamId:v5 sourceType:a4];

  return v6;
}

- (FSFCurareInteractionStream)initWithStreamId:(id)a3
{
  return [(FSFCurareInteractionStream *)self initWithStreamId:a3 sourceType:0];
}

- (FSFCurareInteractionStream)initWithStreamId:(id)a3 sourceType:(unint64_t)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSFCurareInteractionStream;
  v7 = [(FSFCurareInteractionStream *)&v15 init];
  if (v7)
  {
    if (a4 == 1)
    {
      v10 = objc_opt_class();
      v16[0] = v6;
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      v9 = [v10 eventFilterForEventTypes:v11];

      v12 = [[FSFCurareInteractionSELFStream alloc] initWithFilter:v9];
      stream = v7->_stream;
      v7->_stream = (FSFStreamSourceProtocol *)v12;

      goto LABEL_6;
    }
    if (!a4)
    {
      v8 = [[FSFCurareInteractionFeatureStoreStream alloc] initWithStreamId:v6];
      v9 = v7->_stream;
      v7->_stream = (FSFStreamSourceProtocol *)v8;
LABEL_6:
    }
  }

  return v7;
}

- (BOOL)insert:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(FSFCurareInteractionStream *)self stream];
  LOBYTE(a4) = [v7 insert:v6 error:a4];

  return (char)a4;
}

- (id)retrieve:(id)a3
{
  id v4 = a3;
  id v5 = [(FSFCurareInteractionStream *)self stream];
  id v6 = [v5 retrieve:v4];

  return v6;
}

- (void)retrieve:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FSFCurareInteractionStream *)self stream];
  [v8 retrieve:v7 completionHandler:v6];
}

- (id)retrieveWithInteractionWrapper:(id)a3
{
  id v4 = a3;
  id v5 = [(FSFCurareInteractionStream *)self stream];
  id v6 = [v5 retrieveWithInteractionWrapper:v4];

  return v6;
}

- (void)retrieveWithInteractionWrapper:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FSFCurareInteractionStream *)self stream];
  [v8 retrieveWithInteractionWrapper:v7 completionHandler:v6];
}

- (BOOL)deleteCurrentStream
{
  v2 = [(FSFCurareInteractionStream *)self stream];
  char v3 = [v2 deleteCurrentStream];

  return v3;
}

+ (id)eventFilterForEventTypes:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v7 = [MEMORY[0x263F208A8] everything];
    goto LABEL_22;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v29 = v3;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v5)
  {
    id v7 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      v11 = [v10 componentsSeparatedByString:@"."];
      if ((unint64_t)[v11 count] >= 3) {
        uint64_t v21 = {;
      }
        v22 = (void *)MEMORY[0x263EFF940];
        uint64_t v23 = *MEMORY[0x263EFF4A0];
        goto LABEL_29;
      }
      v12 = [v11 objectAtIndexedSubscript:0];
      Class v13 = NSClassFromString(v12);

      if (([(objc_class *)v13 isSubclassOfClass:objc_opt_class()] & 1) == 0)
      {
        v24 = NSString;
        v25 = [v11 objectAtIndexedSubscript:0];
        uint64_t v27 = LABEL_28:;

        v22 = (void *)MEMORY[0x263EFF940];
        uint64_t v23 = *MEMORY[0x263EFF4A0];
        uint64_t v21 = v27;
LABEL_29:
        id v28 = [v22 exceptionWithName:v23 reason:v21 userInfo:0];
        objc_exception_throw(v28);
      }
      if ([v11 count] == 2
        && ([v11 objectAtIndexedSubscript:1],
            v14 = (NSString *)objc_claimAutoreleasedReturnValue(),
            Class v15 = NSClassFromString(v14),
            v14,
            v15))
      {
        if (([(objc_class *)v15 isSubclassOfClass:objc_opt_class()] & 1) == 0)
        {
          v26 = NSString;
          v25 = [v11 objectAtIndexedSubscript:1];
          goto LABEL_28;
        }
        v16 = (void *)MEMORY[0x263F208A8];
        Class v35 = v15;
        v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
        v18 = [v16 someOf:v13 types:v17];

        if (!v7)
        {
LABEL_13:
          id v7 = v18;
          goto LABEL_16;
        }
      }
      else
      {
        v18 = [MEMORY[0x263F208A8] allOf:v13];
        if (!v7) {
          goto LABEL_13;
        }
      }
      uint64_t v19 = [v7 combine:v18];

      id v7 = (id)v19;
LABEL_16:
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v6);
LABEL_21:

  id v4 = v29;
LABEL_22:

  return v7;
}

- (FSFStreamSourceProtocol)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (void).cxx_destruct
{
}

@end