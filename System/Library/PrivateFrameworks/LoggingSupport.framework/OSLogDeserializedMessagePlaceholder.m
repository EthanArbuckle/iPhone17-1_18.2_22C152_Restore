@interface OSLogDeserializedMessagePlaceholder
- (NSDictionary)backingDict;
- (OSLogDeserializedMessagePlaceholder)initWithDict:(id)a3 metadata:(id)a4;
- (_OSLogEventSerializationMetadata)metadata;
- (id)rawString;
- (id)tokens;
- (id)type;
- (id)typeNamespace;
- (int)precision;
- (int)width;
@end

@implementation OSLogDeserializedMessagePlaceholder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_backingDict, 0);
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (id)type
{
  v4 = [(OSLogDeserializedMessagePlaceholder *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"ty"];

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1307, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }
  v6 = [(OSLogDeserializedMessagePlaceholder *)self metadata];
  v7 = [v6 stringForIndex:v5];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 1307, @"Could not look up string for: %s", "type");

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)typeNamespace
{
  v4 = [(OSLogDeserializedMessagePlaceholder *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"tn"];

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1306, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }
  v6 = [(OSLogDeserializedMessagePlaceholder *)self metadata];
  v7 = [v6 stringForIndex:v5];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 1306, @"Could not look up string for: %s", "typeNamespace");

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)rawString
{
  v4 = [(OSLogDeserializedMessagePlaceholder *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"rs"];

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1305, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }
  v6 = [(OSLogDeserializedMessagePlaceholder *)self metadata];
  v7 = [v6 stringForIndex:v5];

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 1305, @"Could not look up string for: %s", "rawString");

LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (id)tokens
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [(OSLogDeserializedMessagePlaceholder *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"t"];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v15 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v17 = objc_opt_class();
            [v15 handleFailureInMethod:a2, self, @"EventSerializer.m", 1296, @"Unexpected class: %@. Expected: %@", v17, objc_opt_class() object file lineNumber description];
          }
          v13 = [(OSLogDeserializedMessagePlaceholder *)self metadata];
          v14 = [v13 stringForIndex:v12];

          [v6 addObject:v14];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (int)precision
{
  v4 = [(OSLogDeserializedMessagePlaceholder *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"p"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1286, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    int v6 = [v5 longLongValue];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (int)width
{
  v4 = [(OSLogDeserializedMessagePlaceholder *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"w"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1285, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    int v6 = [v5 longLongValue];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (OSLogDeserializedMessagePlaceholder)initWithDict:(id)a3 metadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSLogDeserializedMessagePlaceholder;
  uint64_t v9 = [(OSLogDeserializedMessagePlaceholder *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingDict, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

@end