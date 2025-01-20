@interface MFMutableMessageHeaders
- (BOOL)hasHeaderForKey:(id)a3;
- (NSData)encodedHeaders;
- (NSString)description;
- (id)_copyHeaderValueForKey:(id)a3;
- (id)_copyHeaderValueForKey:(id)a3 offset:(unint64_t *)a4 decoded:(BOOL)a5;
- (id)allHeaderKeys;
- (id)firstHeaderForKey:(id)a3;
- (id)headersDictionary;
- (id)mutableCopy;
- (void)_appendAddedHeaderKey:(id)a3 value:(id)a4 toData:(id)a5;
- (void)_appendHeaderKey:(id)a3 value:(id)a4 toData:(id)a5;
- (void)removeHeaderForKey:(id)a3;
- (void)setAddressList:(id)a3 forKey:(id)a4;
- (void)setAddressListForBcc:(id)a3;
- (void)setAddressListForCc:(id)a3;
- (void)setAddressListForReplyTo:(id)a3;
- (void)setAddressListForSender:(id)a3;
- (void)setAddressListForTo:(id)a3;
- (void)setHeader:(id)a3 forKey:(id)a4;
- (void)setReferences:(id)a3;
- (void)stripInternalHeaders;
@end

@implementation MFMutableMessageHeaders

- (id)mutableCopy
{
  v9.receiver = self;
  v9.super_class = (Class)MFMutableMessageHeaders;
  v3 = [(MFMessageHeaders *)&v9 mutableCopy];
  uint64_t v4 = [(NSMutableDictionary *)self->_headersAdded mutableCopy];
  v5 = (void *)v3[3];
  v3[3] = v4;

  uint64_t v6 = [(NSMutableArray *)self->_headersRemoved mutableCopy];
  v7 = (void *)v3[4];
  v3[4] = v6;

  return v3;
}

- (id)headersDictionary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_headersAdded count]
    || [(NSMutableArray *)self->_headersRemoved count])
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(MFMutableMessageHeaders *)self allHeaderKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          objc_super v9 = [(MFMessageHeaders *)self headersForKey:v8];
          [v3 setObject:v9 forKey:v8];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MFMutableMessageHeaders;
    v3 = [(MFMessageHeaders *)&v15 headersDictionary];
  }
  return v3;
}

- (id)allHeaderKeys
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(MFMessageHeaders *)self data];
  uint64_t v5 = [(MFMessageHeaders *)self _decodeHeaderKeysFromData:v4];
  [v3 addObjectsFromArray:v5];

  if (self->_headersRemoved) {
    objc_msgSend(v3, "removeObjectsInArray:");
  }
  headersAdded = self->_headersAdded;
  if (headersAdded)
  {
    v7 = [(NSMutableDictionary *)headersAdded allKeys];
    [v3 addObjectsFromArray:v7];
  }
  return v3;
}

- (BOOL)hasHeaderForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  headersRemoved = self->_headersRemoved;
  if (headersRemoved
    && ([v4 lowercaseString],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [(NSMutableArray *)headersRemoved indexOfObject:v7],
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v10 = 0;
  }
  else
  {
    objc_super v9 = [(NSMutableDictionary *)self->_headersAdded objectForKey:v5];

    if (v9)
    {
      BOOL v10 = 1;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)MFMutableMessageHeaders;
      BOOL v10 = [(MFMessageHeaders *)&v12 hasHeaderForKey:v5];
    }
  }

  return v10;
}

- (id)firstHeaderForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  headersRemoved = self->_headersRemoved;
  if (headersRemoved
    && ([v4 lowercaseString],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [(NSMutableArray *)headersRemoved indexOfObject:v7],
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = [(NSMutableDictionary *)self->_headersAdded objectForKey:v5];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 objectAtIndex:0];

        objc_super v9 = (void *)v10;
      }
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)MFMutableMessageHeaders;
      objc_super v9 = [(MFMessageHeaders *)&v12 firstHeaderForKey:v5];
    }
  }

  return v9;
}

- (void)removeHeaderForKey:(id)a3
{
  uint64_t v4 = [a3 lowercaseString];
  headersRemoved = self->_headersRemoved;
  id v8 = (id)v4;
  if (!headersRemoved)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_headersRemoved;
    self->_headersRemoved = v6;

    headersRemoved = self->_headersRemoved;
    uint64_t v4 = (uint64_t)v8;
  }
  [(NSMutableArray *)headersRemoved addObject:v4];
  [(NSMutableDictionary *)self->_headersAdded removeObjectForKey:v8];
}

- (void)setHeader:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      objc_super v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v10 = [v8 rangeOfCharacterFromSet:v9 options:2];

      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = MFLogGeneral();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_1AFB03000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Error: tried to set a header with a newline.  Ignoring invalid value.", v17, 2u);
        }

        goto LABEL_13;
      }
    }
    id v8 = [v7 lowercaseString];
    headersAdded = self->_headersAdded;
    if (!headersAdded)
    {
      objc_super v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v13 = self->_headersAdded;
      self->_headersAdded = v12;

      headersAdded = self->_headersAdded;
    }
    [(NSMutableDictionary *)headersAdded setObject:v6 forKey:v8];
    uint64_t v14 = [(NSMutableArray *)self->_headersRemoved indexOfObject:v8];
    headersRemoved = self->_headersRemoved;
    if (headersRemoved && v14 != 0x7FFFFFFFFFFFFFFFLL) {
      -[NSMutableArray removeObjectAtIndex:](headersRemoved, "removeObjectAtIndex:");
    }
LABEL_13:
  }
}

- (void)_appendHeaderKey:(id)a3 value:(id)a4 toData:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MFMessageHeaders *)self _capitalizedKeyForKey:v15];
  objc_msgSend(v9, "mf_appendCString:", objc_msgSend(v10, "ef_lossyDefaultCStringBytes"));

  if (([v15 isEqualToString:@"From "] & 1) == 0) {
    objc_msgSend(v9, "mf_appendCString:", ": ");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = *MEMORY[0x1E4F60678];
    if ([v15 isEqualToString:*MEMORY[0x1E4F60678]]
      && [v8 rangeOfString:@"<"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "mf_appendCString:", "<");
    }
    uint64_t v12 = objc_msgSend(v8, "mf_encodedHeaderDataWithEncodingHint:", -[MFMessageHeaders preferredEncoding](self, "preferredEncoding"));
    if ([v15 isEqualToString:v11]) {
      BOOL v13 = [v8 rangeOfString:@">"] == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v13 = 0;
    }
    id v14 = (id)v12;
    if (!v12) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v8;
    BOOL v13 = 0;
    if (!v14)
    {
LABEL_17:
      if (v13) {
        objc_msgSend(v9, "mf_appendCString:", ">");
      }
      goto LABEL_19;
    }
LABEL_16:
    [v9 appendData:v14];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __assert_rtn("-[MFMutableMessageHeaders _appendHeaderKey:value:toData:]", "MutableMessageHeaders.m", 133, "0 && \"Tried to append an array that we don't understand.\"");
  }
  id v14 = 0;
LABEL_19:
  objc_msgSend(v9, "mf_appendCString:", "\n");
}

- (void)_appendAddedHeaderKey:(id)a3 value:(id)a4 toData:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          -[MFMutableMessageHeaders _appendHeaderKey:value:toData:](self, "_appendHeaderKey:value:toData:", v8, *(void *)(*((void *)&v15 + 1) + 8 * v14++), v10, (void)v15);
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [(MFMutableMessageHeaders *)self _appendHeaderKey:v8 value:v9 toData:v10];
  }
}

- (id)_copyHeaderValueForKey:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  headersRemoved = self->_headersRemoved;
  if (headersRemoved
    && ([v4 lowercaseString],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [(NSMutableArray *)headersRemoved indexOfObject:v7],
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v26 = 0;
    id v10 = [(NSMutableDictionary *)self->_headersAdded objectForKey:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v11);
            }
            long long v15 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * i) copy];
            [v9 addObject:v15];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v12);
      }
    }
    else if (v10)
    {
      long long v16 = (void *)[v10 copy];
      [v9 addObject:v16];
    }
    long long v17 = 0;
    while (1)
    {
      BOOL v18 = +[MFMessageHeaders shouldDecodeHeaderForKey:v5];
      v21.receiver = self;
      v21.super_class = (Class)MFMutableMessageHeaders;
      id v19 = [(MFMessageHeaders *)&v21 _copyHeaderValueForKey:v5 offset:&v26 decoded:v18];

      if (!v19) {
        break;
      }
      long long v17 = v19;
      [v9 addObject:v19];
    }
  }
  return v9;
}

- (id)_copyHeaderValueForKey:(id)a3 offset:(unint64_t *)a4 decoded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = v8;
  headersRemoved = self->_headersRemoved;
  if (headersRemoved)
  {
    id v11 = [v8 lowercaseString];
    uint64_t v12 = [(NSMutableArray *)headersRemoved indexOfObject:v11];

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v13 = 0;
      goto LABEL_12;
    }
  }
  if (!*a4)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_headersAdded objectForKey:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = [v14 objectAtIndex:0];

      if (!v15)
      {
LABEL_8:
        v18.receiver = self;
        v18.super_class = (Class)MFMutableMessageHeaders;
        id v16 = [(MFMessageHeaders *)&v18 _copyHeaderValueForKey:v9 offset:a4 decoded:v5];
LABEL_11:
        id v13 = v16;

        goto LABEL_12;
      }
    }
    else
    {
      long long v15 = v14;
      if (!v14) {
        goto LABEL_8;
      }
    }
    id v16 = (id)[v15 copy];
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)MFMutableMessageHeaders;
  id v13 = [(MFMessageHeaders *)&v19 _copyHeaderValueForKey:v9 offset:a4 decoded:v5];
LABEL_12:

  return v13;
}

- (NSData)encodedHeaders
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_headersAdded count]
    || [(NSMutableArray *)self->_headersRemoved count])
  {
    v3 = objc_alloc_init(MFMutableData);
    id v4 = (void *)[(NSMutableDictionary *)self->_headersAdded mutableCopy];
    v31 = (void *)[(NSMutableArray *)self->_headersRemoved mutableCopy];
    memset(v40, 170, sizeof(v40));
    id v5 = [(MFMessageHeaders *)self data];
    uint64_t v6 = [v5 bytes];

    id v7 = [(MFMessageHeaders *)self data];
    uint64_t v8 = [v7 length];

    while (1)
    {
      id v9 = [(MFMessageHeaders *)self data];
      uint64_t v10 = v8;
      int HeaderFromDataInRange = ECGetNextHeaderFromDataInRange();

      if (!HeaderFromDataInRange) {
        break;
      }
      uint64_t v12 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)(v6 + v40[0]), v40[1], 0x600u, 0);
      id v13 = [(__CFString *)v12 lowercaseString];
      if (([v13 isEqualToString:@"from "] & 1) == 0)
      {
        if (v31) {
          BOOL v14 = [v31 indexOfObject:v13] != 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v14 = 0;
        }
        long long v15 = [v4 objectForKey:v13];

        if (v14 || v15 != 0)
        {
          if (v15)
          {
            id v16 = [v4 objectForKey:v13];
            [v4 removeObjectForKey:v13];
            [(MFMutableMessageHeaders *)self _appendAddedHeaderKey:v12 value:v16 toData:v3];
            [v31 addObject:v13];
          }
        }
        else
        {
          [(MFMutableData *)v3 appendBytes:v6 + v40[0] length:v40[1]];
          [(NSMutableData *)v3 mf_appendCString:": "];
          [(MFMutableData *)v3 appendBytes:v6 + v40[2] length:v40[3]];
          [(NSMutableData *)v3 mf_appendCString:"\n"];
        }
      }

      uint64_t v8 = v10;
    }
    if (encodedHeaders_onceToken != -1) {
      dispatch_once(&encodedHeaders_onceToken, &__block_literal_global_9);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v17 = (id)encodedHeaders_orderedHeaders;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          long long v22 = [v4 objectForKey:v21];
          if (v22)
          {
            long long v23 = [v4 objectForKey:v21];
            [(MFMutableMessageHeaders *)self _appendAddedHeaderKey:v21 value:v23 toData:v3];

            [v4 removeObjectForKey:v21];
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v18);
    }

    [v4 allKeys];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          v29 = [v4 objectForKey:v28];
          [(MFMutableMessageHeaders *)self _appendAddedHeaderKey:v28 value:v29 toData:v3];
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v25);
    }

    [(MFMutableData *)v3 appendBytes:"\n" length:1];
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)MFMutableMessageHeaders;
    v3 = [(MFMessageHeaders *)&v41 encodedHeaders];
  }
  return (NSData *)v3;
}

uint64_t __41__MFMutableMessageHeaders_encodedHeaders__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F60698], *MEMORY[0x1E4F60670], *MEMORY[0x1E4F60690], *MEMORY[0x1E4F60668], *MEMORY[0x1E4F60678], *MEMORY[0x1E4F60680], *MEMORY[0x1E4F60688], 0);
  encodedHeaders_orderedHeaders = v1;
  return MEMORY[0x1F41817F8](v1);
}

- (void)setAddressList:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count])
  {
    id v7 = +[MFMessageHeaders encodedDataForAddressList:splittingAtLength:firstLineBuffer:](MFMessageHeaders, "encodedDataForAddressList:splittingAtLength:firstLineBuffer:", v8, 72, [v6 length] + 2);
    [(MFMutableMessageHeaders *)self setHeader:v7 forKey:v6];
  }
  else
  {
    [(MFMutableMessageHeaders *)self removeHeaderForKey:v6];
  }
}

- (void)setAddressListForSender:(id)a3
{
}

- (void)setAddressListForTo:(id)a3
{
}

- (void)setAddressListForCc:(id)a3
{
}

- (void)setAddressListForBcc:(id)a3
{
}

- (void)setAddressListForReplyTo:(id)a3
{
}

- (void)setReferences:(id)a3
{
  id v5 = a3;
  if (v5 && [v5 count])
  {
    id v4 = [v5 componentsJoinedByString:@" "];
    [(MFMutableMessageHeaders *)self setHeader:v4 forKey:*MEMORY[0x1E4F60700]];
  }
  else
  {
    [(MFMutableMessageHeaders *)self removeHeaderForKey:*MEMORY[0x1E4F60700]];
  }
}

- (void)stripInternalHeaders
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(MFMutableMessageHeaders *)self allHeaderKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (![v7 compare:@"x-apple-internal-", 1, 0, objc_msgSend(@"x-apple-internal-", "length", (void)v8) options range]|| !objc_msgSend(v7, "compare:options:", @"X-Apple-Content-Length", 1)|| !objc_msgSend(v7, "compare:options:", @"x-uniform-type-identifier", 1))
        {
          [(MFMutableMessageHeaders *)self removeHeaderForKey:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSString)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)MFMutableMessageHeaders;
  id v3 = [(MFMessageHeaders *)&v24 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 appendString:@"\n\tAdded:\n"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_headersAdded;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v10 = [(NSMutableDictionary *)self->_headersAdded objectForKey:v9];
        [v4 appendFormat:@"\t\t%@ => %@\n", v9, v10];
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  [v4 appendString:@"\n\tRemoved:\n"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v11 = self->_headersRemoved;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        [v4 appendFormat:@"\t\t%@\n", *(void *)(*((void *)&v16 + 1) + 8 * j)];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v12);
  }

  return (NSString *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headersRemoved, 0);
  objc_storeStrong((id *)&self->_headersAdded, 0);
}

@end