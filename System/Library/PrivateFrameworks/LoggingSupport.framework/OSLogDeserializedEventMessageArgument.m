@interface OSLogDeserializedEventMessageArgument
- (NSDictionary)backingDict;
- (OSLogDeserializedEventMessageArgument)initWithDict:(id)a3 metadata:(id)a4;
- (_OSLogEventSerializationMetadata)metadata;
- (const)rawBytes;
- (double)doubleValue;
- (double)longDoubleValue;
- (id)_numValue;
- (id)objectRepresentation;
- (int64_t)int64Value;
- (unint64_t)availability;
- (unint64_t)category;
- (unint64_t)privacy;
- (unint64_t)scalarCategory;
- (unint64_t)scalarType;
- (unint64_t)unsignedInt64Value;
- (unsigned)rawBytesLength;
@end

@implementation OSLogDeserializedEventMessageArgument

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

- (double)longDoubleValue
{
  v1 = [a1 _numValue];
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (double)doubleValue
{
  double v2 = [(OSLogDeserializedEventMessageArgument *)self _numValue];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (int64_t)int64Value
{
  double v2 = [(OSLogDeserializedEventMessageArgument *)self _numValue];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (unint64_t)unsignedInt64Value
{
  double v2 = [(OSLogDeserializedEventMessageArgument *)self _numValue];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (id)_numValue
{
  if ((![(OSLogDeserializedEventMessageArgument *)self availability]
     || [(OSLogDeserializedEventMessageArgument *)self availability] == 3)
    && [(OSLogDeserializedEventMessageArgument *)self category] == 1)
  {
    unint64_t v3 = [(OSLogDeserializedEventMessageArgument *)self objectRepresentation];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (unsigned)rawBytesLength
{
  if (![(OSLogDeserializedEventMessageArgument *)self availability]
    || [(OSLogDeserializedEventMessageArgument *)self availability] == 3)
  {
    if ([(OSLogDeserializedEventMessageArgument *)self category] == 2)
    {
      unint64_t v3 = [(OSLogDeserializedEventMessageArgument *)self objectRepresentation];
      if (!v3) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    if ([(OSLogDeserializedEventMessageArgument *)self category] == 3)
    {
      unint64_t v3 = [(OSLogDeserializedEventMessageArgument *)self objectRepresentation];
      if (!v3) {
        goto LABEL_11;
      }
LABEL_8:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned __int16 v4 = [v3 length];
LABEL_12:

        return v4;
      }
LABEL_11:
      unsigned __int16 v4 = 0;
      goto LABEL_12;
    }
  }
  return 0;
}

- (const)rawBytes
{
  if (![(OSLogDeserializedEventMessageArgument *)self availability]
    || [(OSLogDeserializedEventMessageArgument *)self availability] == 3)
  {
    if ([(OSLogDeserializedEventMessageArgument *)self category] == 2)
    {
      id v3 = [(OSLogDeserializedEventMessageArgument *)self objectRepresentation];
      if (v3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v3;
          uint64_t v4 = [v3 UTF8String];
LABEL_11:
          v5 = (const void *)v4;
LABEL_14:

          return v5;
        }
      }
      goto LABEL_13;
    }
    if ([(OSLogDeserializedEventMessageArgument *)self category] == 3)
    {
      id v3 = [(OSLogDeserializedEventMessageArgument *)self objectRepresentation];
      if (v3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v3;
          uint64_t v4 = [v3 bytes];
          goto LABEL_11;
        }
      }
LABEL_13:
      v5 = 0;
      goto LABEL_14;
    }
  }
  return 0;
}

- (id)objectRepresentation
{
  if ([(OSLogDeserializedEventMessageArgument *)self availability]
    && [(OSLogDeserializedEventMessageArgument *)self availability] != 3)
  {
    goto LABEL_10;
  }
  unint64_t v4 = [(OSLogDeserializedEventMessageArgument *)self category];
  if (v4 != 1 && v4 != 3)
  {
    if (v4 == 2)
    {
      v5 = [(OSLogDeserializedEventMessageArgument *)self backingDict];
      v6 = [v5 objectForKeyedSubscript:@"or"];

      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v11 = objc_opt_class();
          [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1169, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
        }
        v7 = [(OSLogDeserializedEventMessageArgument *)self metadata];
        v8 = [v7 stringForIndex:v6];
      }
      else
      {
        v8 = 0;
      }
      goto LABEL_12;
    }
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v6 = [(OSLogDeserializedEventMessageArgument *)self backingDict];
  v8 = [v6 objectForKeyedSubscript:@"or"];
LABEL_12:

LABEL_13:
  return v8;
}

- (unint64_t)scalarType
{
  unint64_t v4 = [(OSLogDeserializedEventMessageArgument *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"st"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1152, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)scalarCategory
{
  unint64_t v4 = [(OSLogDeserializedEventMessageArgument *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"sc"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1151, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)category
{
  unint64_t v4 = [(OSLogDeserializedEventMessageArgument *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"c"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1150, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)privacy
{
  unint64_t v4 = [(OSLogDeserializedEventMessageArgument *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"p"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1149, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)availability
{
  unint64_t v4 = [(OSLogDeserializedEventMessageArgument *)self backingDict];
  v5 = [v4 objectForKeyedSubscript:@"a"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1148, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (OSLogDeserializedEventMessageArgument)initWithDict:(id)a3 metadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSLogDeserializedEventMessageArgument;
  uint64_t v9 = [(OSLogDeserializedEventMessageArgument *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingDict, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

@end