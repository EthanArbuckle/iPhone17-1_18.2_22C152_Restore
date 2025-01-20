@interface OSLogDecomposedMessageSegment
- (NSDictionary)backingDict;
- (NSString)literalPrefix;
- (OSLogDecomposedMessageSegment)initWithDict:(id)a3 metadata:(id)a4;
- (OSLogDeserializedEventMessageArgument)argument;
- (OSLogDeserializedMessagePlaceholder)placeholder;
@end

@implementation OSLogDecomposedMessageSegment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_literalPrefix, 0);
  objc_storeStrong((id *)&self->_backingDict, 0);
}

- (OSLogDeserializedEventMessageArgument)argument
{
  return self->_argument;
}

- (OSLogDeserializedMessagePlaceholder)placeholder
{
  return self->_placeholder;
}

- (NSString)literalPrefix
{
  return self->_literalPrefix;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (OSLogDecomposedMessageSegment)initWithDict:(id)a3 metadata:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)OSLogDecomposedMessageSegment;
  v10 = [(OSLogDecomposedMessageSegment *)&v31 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_backingDict, a3);
    v12 = [v8 objectForKeyedSubscript:@"lp"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v23 = objc_opt_class();
        [v22 handleFailureInMethod:a2, v11, @"EventSerializer.m", 1326, @"Unexpected class: %@. Expected: %@", v23, objc_opt_class() object file lineNumber description];
      }
      uint64_t v13 = [v9 stringForIndex:v12];
      if (!v13)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:v11 file:@"EventSerializer.m" lineNumber:1328 description:@"Failed to find literal prefix string"];
      }
      literalPrefix = v11->_literalPrefix;
      v11->_literalPrefix = (NSString *)v13;
    }
    v15 = [v8 objectForKeyedSubscript:@"p"];
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v26 = objc_opt_class();
        [v25 handleFailureInMethod:a2, v11, @"EventSerializer.m", 1335, @"Unexpected class: %@. Expected: %@", v26, objc_opt_class() object file lineNumber description];
      }
      v16 = [[OSLogDeserializedMessagePlaceholder alloc] initWithDict:v15 metadata:v9];
      if (!v16)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:a2 object:v11 file:@"EventSerializer.m" lineNumber:1337 description:@"Could not instantiate placeholder"];
      }
      placeholder = v11->_placeholder;
      v11->_placeholder = v16;
    }
    v18 = [v8 objectForKeyedSubscript:@"a"];
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v29 = objc_opt_class();
        [v28 handleFailureInMethod:a2, v11, @"EventSerializer.m", 1344, @"Unexpected class: %@. Expected: %@", v29, objc_opt_class() object file lineNumber description];
      }
      v19 = [[OSLogDeserializedEventMessageArgument alloc] initWithDict:v18 metadata:v9];
      if (!v19)
      {
        v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:a2 object:v11 file:@"EventSerializer.m" lineNumber:1346 description:@"Could not instantiate arg"];
      }
      argument = v11->_argument;
      v11->_argument = v19;
    }
  }

  return v11;
}

@end