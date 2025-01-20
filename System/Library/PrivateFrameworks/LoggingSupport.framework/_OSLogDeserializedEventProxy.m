@interface _OSLogDeserializedEventProxy
- ($8814E4F230000EB768D7E307C62B5F7C)lossCount;
- (BOOL)needsTypeLookup;
- (NSDictionary)curEventDictionary;
- (_OSLogEventSerializationMetadata)metadata;
- (const)processImageUUIDBytes;
- (const)senderImageUUIDBytes;
- (id)_frameForDict:(id)a3;
- (id)backtrace;
- (id)bootUUID;
- (id)category;
- (id)composedMessage;
- (id)date;
- (id)decomposedMessage;
- (id)formatString;
- (id)process;
- (id)processImagePath;
- (id)processImageUUID;
- (id)sender;
- (id)senderImagePath;
- (id)senderImageUUID;
- (id)signpostName;
- (id)subsystem;
- (id)timeZone;
- (int)processIdentifier;
- (timeval)lossEndUnixDate;
- (timeval)lossStartUnixDate;
- (timeval)unixDate;
- (timezone)lossEndUnixTimeZone;
- (timezone)lossStartUnixTimeZone;
- (timezone)unixTimeZone;
- (unint64_t)activityIdentifier;
- (unint64_t)continuousNanosecondsSinceBoot;
- (unint64_t)creatorActivityIdentifier;
- (unint64_t)creatorProcessUniqueIdentifier;
- (unint64_t)logType;
- (unint64_t)lossEndMachContinuousTimestamp;
- (unint64_t)lossStartMachContinuousTimestamp;
- (unint64_t)machContinuousTimestamp;
- (unint64_t)parentActivityIdentifier;
- (unint64_t)senderImageOffset;
- (unint64_t)signpostIdentifier;
- (unint64_t)signpostScope;
- (unint64_t)signpostType;
- (unint64_t)size;
- (unint64_t)threadIdentifier;
- (unint64_t)timeToLive;
- (unint64_t)traceIdentifier;
- (unint64_t)transitionActivityIdentifier;
- (unint64_t)type;
- (void)_populate_timeval:(timeval *)a3 withDict:(id)a4;
- (void)_populate_timezone:(timezone *)a3 withDict:(id)a4;
- (void)_resetNeedsLookup;
- (void)setCurEventDictionary:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNeedsTypeLookup:(BOOL)a3;
@end

@implementation _OSLogDeserializedEventProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_curEventDictionary, 0);
}

- (void)setNeedsTypeLookup:(BOOL)a3
{
  self->_needsTypeLookup = a3;
}

- (BOOL)needsTypeLookup
{
  return self->_needsTypeLookup;
}

- (void)setMetadata:(id)a3
{
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (NSDictionary)curEventDictionary
{
  return self->_curEventDictionary;
}

- (id)decomposedMessage
{
  if ([(_OSLogDeserializedEventProxy *)self type] == 1536
    || [(_OSLogDeserializedEventProxy *)self type] == 1024
    || [(_OSLogDeserializedEventProxy *)self type] == 768)
  {
    v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
    v5 = [v4 objectForKeyedSubscript:@"dm"];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v11 = objc_opt_class();
        [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 1110, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
      }
      v6 = [OSLogDeserializedEventDecomposedMessage alloc];
      v7 = [(_OSLogDeserializedEventProxy *)self metadata];
      v8 = [(OSLogDeserializedEventDecomposedMessage *)v6 initWithDict:v5 metadata:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)backtrace
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  v5 = [v4 objectForKeyedSubscript:@"bt"];

  v6 = [MEMORY[0x1E4F1CA48] array];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v20 = objc_opt_class();
      [v19 handleFailureInMethod:a2, self, @"EventSerializer.m", 1083, @"Unexpected class: %@. Expected: %@", v20, objc_opt_class() object file lineNumber description];
    }
    SEL v22 = a2;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v14 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v21 = objc_opt_class();
            [v14 handleFailureInMethod:v22, self, @"EventSerializer.m", 1085, @"Unexpected class: %@. Expected: %@", v21, objc_opt_class() object file lineNumber description];
          }
          v13 = [(_OSLogDeserializedEventProxy *)self _frameForDict:v12];
          [v6 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v15 = [(_OSLogDeserializedEventProxy *)self senderImageUUIDBytes];
    if (v15)
    {
      v16 = [[OSLogEventBacktraceFrame alloc] initWithUUIDBytes:v15 andOffset:[(_OSLogDeserializedEventProxy *)self senderImageOffset]];
      [v6 addObject:v16];
    }
  }
  if ([v6 count]) {
    v17 = [[OSLogEventBacktrace alloc] initWithFrames:v6];
  }
  else {
    v17 = 0;
  }

  return v17;
}

- (id)_frameForDict:(id)a3
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"iu"];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = objc_opt_class();
      [v12 handleFailureInMethod:a2, self, @"EventSerializer.m", 1068, @"Unexpected class: %@. Expected: %@", v13, objc_opt_class() object file lineNumber description];
    }
  }
  id v7 = [v5 objectForKeyedSubscript:@"io"];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v6) {
        goto LABEL_7;
      }
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = objc_opt_class();
      [v14 handleFailureInMethod:a2, self, @"EventSerializer.m", 1072, @"Unexpected class: %@. Expected: %@", v15, objc_opt_class() object file lineNumber description];

      if (v6) {
        goto LABEL_7;
      }
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1074 description:@"Malformed frame dictionary"];

LABEL_7:
  uint64_t v8 = [OSLogEventBacktraceFrame alloc];
  id v9 = v6;
  uint64_t v10 = -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:](v8, "initWithUUIDBytes:andOffset:", [v9 bytes], objc_msgSend(v7, "unsignedLongLongValue"));

  return v10;
}

- ($8814E4F230000EB768D7E307C62B5F7C)lossCount
{
  if ([(_OSLogDeserializedEventProxy *)self type] == 1792)
  {
    v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
    id v5 = [v4 objectForKeyedSubscript:@"lc"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1056 description:@"Unexpected type for loss count dict"];
    }
    v6 = [v5 objectForKeyedSubscript:@"c"];
    id v7 = [v5 objectForKeyedSubscript:@"s"];
    unsigned int v8 = [v6 unsignedLongLongValue];
    int v9 = [v7 BOOLValue];

    if (v9) {
      uint64_t v10 = 0x100000000;
    }
    else {
      uint64_t v10 = 0;
    }
    return ($8814E4F230000EB768D7E307C62B5F7C)(v10 & 0xFFFFFFFF00000000 | v8);
  }
  else
  {
    return ($8814E4F230000EB768D7E307C62B5F7C)0;
  }
}

- (timezone)lossEndUnixTimeZone
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 1792) {
    return 0;
  }
  if (!self->_lossEndUnixTimeZoneNeedsLookup) {
    return &self->_lossEndUnixTimeZone;
  }
  self->_lossEndUnixTimeZoneNeedsLookup = 0;
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"leutz"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1049, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    p_lossEndUnixTimeZone = &self->_lossEndUnixTimeZone;
    [(_OSLogDeserializedEventProxy *)self _populate_timezone:&self->_lossEndUnixTimeZone withDict:v5];
  }
  else
  {
    p_lossEndUnixTimeZone = 0;
  }

  return p_lossEndUnixTimeZone;
}

- (timeval)lossEndUnixDate
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 1792) {
    return 0;
  }
  if (!self->_lossEndUnixDateNeedsLookup) {
    return &self->_lossEndUnixDate;
  }
  self->_lossEndUnixDateNeedsLookup = 0;
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"leud"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1049, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    p_lossEndUnixDate = &self->_lossEndUnixDate;
    [(_OSLogDeserializedEventProxy *)self _populate_timeval:&self->_lossEndUnixDate withDict:v5];
  }
  else
  {
    p_lossEndUnixDate = 0;
  }

  return p_lossEndUnixDate;
}

- (timezone)lossStartUnixTimeZone
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 1792) {
    return 0;
  }
  if (!self->_lossStartUnixTimeZoneNeedsLookup) {
    return &self->_lossStartUnixTimeZone;
  }
  self->_lossStartUnixTimeZoneNeedsLookup = 0;
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"lsutz"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1048, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    p_lossStartUnixTimeZone = &self->_lossStartUnixTimeZone;
    [(_OSLogDeserializedEventProxy *)self _populate_timezone:&self->_lossStartUnixTimeZone withDict:v5];
  }
  else
  {
    p_lossStartUnixTimeZone = 0;
  }

  return p_lossStartUnixTimeZone;
}

- (timeval)lossStartUnixDate
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 1792) {
    return 0;
  }
  if (!self->_lossStartUnixDateNeedsLookup) {
    return &self->_lossStartUnixDate;
  }
  self->_lossStartUnixDateNeedsLookup = 0;
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"lsud"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 1048, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    p_lossStartUnixDate = &self->_lossStartUnixDate;
    [(_OSLogDeserializedEventProxy *)self _populate_timeval:&self->_lossStartUnixDate withDict:v5];
  }
  else
  {
    p_lossStartUnixDate = 0;
  }

  return p_lossStartUnixDate;
}

- (id)timeZone
{
  v4 = [(_OSLogDeserializedEventProxy *)self unixTimeZone];
  if (!v4)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1038 description:@"Could not get Unix timezone"];
  }
  id v5 = (void *)MEMORY[0x1E4F1CAF0];
  uint64_t v6 = 3600 * v4->tz_dsttime + -60 * v4->tz_minuteswest;
  return (id)[v5 timeZoneForSecondsFromGMT:v6];
}

- (id)date
{
  v4 = [(_OSLogDeserializedEventProxy *)self unixDate];
  if (!v4)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1030 description:@"Could not get Unix date"];
  }
  double v5 = (double)v4->tv_usec / 1000000.0 + (double)v4->tv_sec;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  return (id)[v6 dateWithTimeIntervalSince1970:v5];
}

- (timezone)unixTimeZone
{
  if (!self->_unixTimeZoneNeedsLookup) {
    return &self->_unixTimeZone;
  }
  self->_unixTimeZoneNeedsLookup = 0;
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"utz"];

  if (!v5)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1021 description:@"Could not fetch nonnull property"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_opt_class();
    [v9 handleFailureInMethod:a2, self, @"EventSerializer.m", 1021, @"Unexpected class: %@. Expected: %@", v10, objc_opt_class() object file lineNumber description];
  }
  p_unixTimeZone = &self->_unixTimeZone;
  [(_OSLogDeserializedEventProxy *)self _populate_timezone:&self->_unixTimeZone withDict:v5];

  return p_unixTimeZone;
}

- (timeval)unixDate
{
  if (!self->_unixDateNeedsLookup) {
    return &self->_unixDate;
  }
  self->_unixDateNeedsLookup = 0;
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"ud"];

  if (!v5)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1021 description:@"Could not fetch nonnull property"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_opt_class();
    [v9 handleFailureInMethod:a2, self, @"EventSerializer.m", 1021, @"Unexpected class: %@. Expected: %@", v10, objc_opt_class() object file lineNumber description];
  }
  p_unixDate = &self->_unixDate;
  [(_OSLogDeserializedEventProxy *)self _populate_timeval:&self->_unixDate withDict:v5];

  return p_unixDate;
}

- (void)_populate_timezone:(timezone *)a3 withDict:(id)a4
{
  id v7 = a4;
  id v10 = [v7 objectForKeyedSubscript:@"mw"];
  unsigned int v8 = [v7 objectForKeyedSubscript:@"dt"];

  if (!v10
    || !v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1015 description:@"Malformed timeval dict"];
  }
  a3->tz_minuteswest = [v10 intValue];
  a3->tz_dsttime = [v8 intValue];
}

- (void)_populate_timeval:(timeval *)a3 withDict:(id)a4
{
  id v7 = a4;
  id v10 = [v7 objectForKeyedSubscript:@"sec"];
  unsigned int v8 = [v7 objectForKeyedSubscript:@"usec"];

  if (!v10
    || !v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:1003 description:@"Malformed timeval dict"];
  }
  a3->tv_sec = [v10 longValue];
  a3->tv_usec = [v8 intValue];
}

- (id)bootUUID
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"b"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = objc_opt_class();
      [v11 handleFailureInMethod:a2, self, @"EventSerializer.m", 971, @"Unexpected class: %@. Expected: %@", v12, objc_opt_class() object file lineNumber description];
    }
  }
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  id v7 = v5;
  unsigned int v8 = objc_msgSend(v6, "initWithUUIDBytes:", objc_msgSend(v7, "bytes"));
  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:974 description:@"Encountered nil bootUUID"];
  }
  return v8;
}

- (const)senderImageUUIDBytes
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"siu"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 966, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    id v6 = (const char *)[v5 bytes];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)senderImageUUID
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"siu"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 966, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (const)processImageUUIDBytes
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"piu"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 965, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    id v6 = (const char *)[v5 bytes];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)processImageUUID
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"piu"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 965, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)signpostName
{
  if ([(_OSLogDeserializedEventProxy *)self type] == 1536)
  {
    v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"sn"];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v11 = objc_opt_class();
        [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 962, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
      }
      id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
      id v7 = [v6 stringForIndex:v5];

      if (v7) {
        goto LABEL_8;
      }
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 962, @"Could not look up string for: %s", "signpostName");
    }
    id v7 = 0;
LABEL_8:

    goto LABEL_10;
  }
  id v7 = 0;
LABEL_10:
  return v7;
}

- (id)formatString
{
  if ([(_OSLogDeserializedEventProxy *)self type] == 1536
    || [(_OSLogDeserializedEventProxy *)self type] == 1024
    || [(_OSLogDeserializedEventProxy *)self type] == 768)
  {
    v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"f"];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v11 = objc_opt_class();
        [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 960, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
      }
      id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
      id v7 = [v6 stringForIndex:v5];

      if (v7) {
        goto LABEL_10;
      }
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 960, @"Could not look up string for: %s", "formatString");
    }
    id v7 = 0;
LABEL_10:

    goto LABEL_11;
  }
  id v7 = 0;
LABEL_11:
  return v7;
}

- (id)category
{
  if ([(_OSLogDeserializedEventProxy *)self type] == 1536
    || [(_OSLogDeserializedEventProxy *)self type] == 1024)
  {
    v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"cat"];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v11 = objc_opt_class();
        [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 959, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
      }
      id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
      id v7 = [v6 stringForIndex:v5];

      if (v7) {
        goto LABEL_9;
      }
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 959, @"Could not look up string for: %s", "category");
    }
    id v7 = 0;
LABEL_9:

    goto LABEL_11;
  }
  id v7 = 0;
LABEL_11:
  return v7;
}

- (id)subsystem
{
  if ([(_OSLogDeserializedEventProxy *)self type] == 1536
    || [(_OSLogDeserializedEventProxy *)self type] == 1024)
  {
    v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
    double v5 = [v4 objectForKeyedSubscript:@"sub"];

    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v11 = objc_opt_class();
        [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 958, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
      }
      id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
      id v7 = [v6 stringForIndex:v5];

      if (v7) {
        goto LABEL_9;
      }
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 958, @"Could not look up string for: %s", "subsystem");
    }
    id v7 = 0;
LABEL_9:

    goto LABEL_11;
  }
  id v7 = 0;
LABEL_11:
  return v7;
}

- (id)sender
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"send"];

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 955, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }
  id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
  id v7 = [v6 stringForIndex:v5];

  if (!v7)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 955, @"Could not look up string for: %s", "sender");

LABEL_6:
    id v7 = 0;
  }

  return v7;
}

- (id)senderImagePath
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"sip"];

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 954, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }
  id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
  id v7 = [v6 stringForIndex:v5];

  if (!v7)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 954, @"Could not look up string for: %s", "senderImagePath");

LABEL_6:
    id v7 = 0;
  }

  return v7;
}

- (id)process
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"p"];

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 953, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }
  id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
  id v7 = [v6 stringForIndex:v5];

  if (!v7)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 953, @"Could not look up string for: %s", "process");

LABEL_6:
    id v7 = 0;
  }

  return v7;
}

- (id)processImagePath
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"pip"];

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 952, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }
  id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
  id v7 = [v6 stringForIndex:v5];

  if (!v7)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 952, @"Could not look up string for: %s", "processImagePath");

LABEL_6:
    id v7 = 0;
  }

  return v7;
}

- (id)composedMessage
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"cm"];

  if (!v5) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"EventSerializer.m", 951, @"Unexpected class: %@. Expected: %@", v11, objc_opt_class() object file lineNumber description];
  }
  id v6 = [(_OSLogDeserializedEventProxy *)self metadata];
  id v7 = [v6 stringForIndex:v5];

  if (!v7)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EventSerializer.m", 951, @"Could not look up string for: %s", "composedMessage");

LABEL_6:
    id v7 = 0;
  }

  return v7;
}

- (int)processIdentifier
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"pid"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 948, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    int v6 = [v5 longLongValue];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (unint64_t)lossEndMachContinuousTimestamp
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 1792) {
    return 0;
  }
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"lemct"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 945, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)lossStartMachContinuousTimestamp
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 1792) {
    return 0;
  }
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"lsmct"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 944, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)creatorProcessUniqueIdentifier
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 513) {
    return 0;
  }
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"cpui"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 941, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)creatorActivityIdentifier
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 513) {
    return 0;
  }
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"cai"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 940, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)signpostScope
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 1536) {
    return 0;
  }
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"ss"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 937, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)signpostType
{
  if ([(_OSLogDeserializedEventProxy *)self type] != 1536) {
    return 0;
  }
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"st"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 936, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)signpostIdentifier
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"si"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 933, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)senderImageOffset
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"sio"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 932, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)machContinuousTimestamp
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"mct"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 931, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)continuousNanosecondsSinceBoot
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"ns"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 930, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)transitionActivityIdentifier
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"tai"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 929, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)parentActivityIdentifier
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"paid"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 928, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)activityIdentifier
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"aid"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 927, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)threadIdentifier
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"tid"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 926, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)traceIdentifier
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"ti"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 925, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)timeToLive
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"ttl"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 924, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)size
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"s"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 923, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)logType
{
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"lt"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_opt_class();
      [v8 handleFailureInMethod:a2, self, @"EventSerializer.m", 922, @"Unexpected class: %@. Expected: %@", v9, objc_opt_class() object file lineNumber description];
    }
    unint64_t v6 = [v5 unsignedLongLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)type
{
  if (![(_OSLogDeserializedEventProxy *)self needsTypeLookup]) {
    return self->_type;
  }
  self->_needsTypeLookup = 0;
  v4 = [(_OSLogDeserializedEventProxy *)self curEventDictionary];
  double v5 = [v4 objectForKeyedSubscript:@"t"];

  if (!v5)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EventSerializer.m" lineNumber:917 description:@"Could not get type for proxy"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_opt_class();
    [v9 handleFailureInMethod:a2, self, @"EventSerializer.m", 918, @"Unexpected class: %@. Expected: %@", v10, objc_opt_class() object file lineNumber description];
  }
  unint64_t v6 = [v5 unsignedLongLongValue];
  self->_type = v6;

  return v6;
}

- (void)setCurEventDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_curEventDictionary, a3);
  [(_OSLogDeserializedEventProxy *)self _resetNeedsLookup];
}

- (void)_resetNeedsLookup
{
  self->_needsTypeLookup = 1;
  self->_unixDateNeedsLookup = 1;
  self->_unixTimeZoneNeedsLookup = 1;
  self->_lossStartUnixDateNeedsLookup = 1;
  self->_lossStartUnixTimeZoneNeedsLookup = 1;
  self->_lossEndUnixDateNeedsLookup = 1;
  self->_lossEndUnixTimeZoneNeedsLookup = 1;
}

@end