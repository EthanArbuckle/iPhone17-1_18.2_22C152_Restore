@interface OSLogDeserializedEventDecomposedMessage
- (NSArray)segments;
- (NSDictionary)backingDict;
- (OSLogDeserializedEventDecomposedMessage)initWithDict:(id)a3 metadata:(id)a4;
- (id)argumentAtIndex:(unint64_t)a3;
- (id)literalPrefixAtIndex:(unint64_t)a3;
- (id)placeholderAtIndex:(unint64_t)a3;
- (unint64_t)placeholderCount;
- (unint64_t)state;
@end

@implementation OSLogDeserializedEventDecomposedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_backingDict, 0);
}

- (NSArray)segments
{
  return self->_segments;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (id)argumentAtIndex:(unint64_t)a3
{
  v5 = [(OSLogDeserializedEventDecomposedMessage *)self segments];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    v7 = [(OSLogDeserializedEventDecomposedMessage *)self segments];
    v8 = [v7 objectAtIndexedSubscript:a3];
    v9 = [v8 argument];
  }
  return v9;
}

- (id)placeholderAtIndex:(unint64_t)a3
{
  v5 = [(OSLogDeserializedEventDecomposedMessage *)self segments];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    v7 = [(OSLogDeserializedEventDecomposedMessage *)self segments];
    v8 = [v7 objectAtIndexedSubscript:a3];
    v9 = [v8 placeholder];
  }
  return v9;
}

- (id)literalPrefixAtIndex:(unint64_t)a3
{
  v5 = [(OSLogDeserializedEventDecomposedMessage *)self segments];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    v7 = [(OSLogDeserializedEventDecomposedMessage *)self segments];
    v8 = [v7 objectAtIndexedSubscript:a3];
    v9 = [v8 literalPrefix];
  }
  return v9;
}

- (unint64_t)state
{
  v4 = [(OSLogDeserializedEventDecomposedMessage *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"s"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1383, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)placeholderCount
{
  v4 = [(OSLogDeserializedEventDecomposedMessage *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"pc"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1382, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (OSLogDeserializedEventDecomposedMessage)initWithDict:(id)a3 metadata:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)OSLogDeserializedEventDecomposedMessage;
  v10 = [(OSLogDeserializedEventDecomposedMessage *)&v33 init];
  if (v10)
  {
    v11 = [v8 objectForKeyedSubscript:@"seg"];
    if (v11)
    {
      id v27 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v24 = objc_opt_class();
        [v23 handleFailureInMethod:a2, v10, @"EventSerializer.m", 1367, @"Unexpected class: %@. Expected: %@", v24, objc_opt_class() object file lineNumber description];
      }
      SEL v26 = a2;
      v28 = v10;
      v12 = [MEMORY[0x1E4F1CA48] array];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v20 = [MEMORY[0x1E4F28B00] currentHandler];
              uint64_t v25 = objc_opt_class();
              [v20 handleFailureInMethod:v26, v28, @"EventSerializer.m", 1370, @"Unexpected class: %@. Expected: %@", v25, objc_opt_class() object file lineNumber description];
            }
            v19 = [[OSLogDecomposedMessageSegment alloc] initWithDict:v18 metadata:v9];
            [(NSArray *)v12 addObject:v19];

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v15);
      }

      v10 = v28;
      segments = v28->_segments;
      v28->_segments = v12;

      id v8 = v27;
    }
    objc_storeStrong((id *)&v10->_backingDict, a3);
  }
  return v10;
}

@end