@interface _INPBControlHomeIntent
+ (BOOL)supportsSecureCoding;
+ (Class)contentsType;
+ (Class)filtersType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTime;
- (BOOL)hasUserTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contents;
- (NSArray)filters;
- (_INPBControlHomeIntent)initWithCoder:(id)a3;
- (_INPBDateTimeRange)time;
- (_INPBHomeUserTask)userTask;
- (_INPBIntentMetadata)intentMetadata;
- (id)contentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)filtersAtIndex:(unint64_t)a3;
- (unint64_t)contentsCount;
- (unint64_t)filtersCount;
- (unint64_t)hash;
- (void)addContents:(id)a3;
- (void)addFilters:(id)a3;
- (void)clearContents;
- (void)clearFilters;
- (void)encodeWithCoder:(id)a3;
- (void)setContents:(id)a3;
- (void)setFilters:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTime:(id)a3;
- (void)setUserTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBControlHomeIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTask, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_filters, 0);

  objc_storeStrong((id *)&self->_contents, 0);
}

- (_INPBHomeUserTask)userTask
{
  return self->_userTask;
}

- (_INPBDateTimeRange)time
{
  return self->_time;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)filters
{
  return self->_filters;
}

- (NSArray)contents
{
  return self->_contents;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_contents count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v5 = self->_contents;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"contents"];
  }
  if ([(NSArray *)self->_filters count])
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v12 = self->_filters;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (void)v25);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"filters"];
  }
  v18 = [(_INPBControlHomeIntent *)self intentMetadata];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"intentMetadata"];

  v20 = [(_INPBControlHomeIntent *)self time];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"time"];

  v22 = [(_INPBControlHomeIntent *)self userTask];
  v23 = [v22 dictionaryRepresentation];
  [v3 setObject:v23 forKeyedSubscript:@"userTask"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_contents hash];
  uint64_t v4 = [(NSArray *)self->_filters hash] ^ v3;
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBDateTimeRange *)self->_time hash];
  return v6 ^ [(_INPBHomeUserTask *)self->_userTask hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBControlHomeIntent *)self contents];
  unint64_t v6 = [v4 contents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBControlHomeIntent *)self contents];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBControlHomeIntent *)self contents];
    v10 = [v4 contents];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBControlHomeIntent *)self filters];
  unint64_t v6 = [v4 filters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBControlHomeIntent *)self filters];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBControlHomeIntent *)self filters];
    uint64_t v15 = [v4 filters];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBControlHomeIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBControlHomeIntent *)self intentMetadata];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBControlHomeIntent *)self intentMetadata];
    v20 = [v4 intentMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBControlHomeIntent *)self time];
  unint64_t v6 = [v4 time];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBControlHomeIntent *)self time];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBControlHomeIntent *)self time];
    long long v25 = [v4 time];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBControlHomeIntent *)self userTask];
  unint64_t v6 = [v4 userTask];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBControlHomeIntent *)self userTask];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    long long v28 = (void *)v27;
    long long v29 = [(_INPBControlHomeIntent *)self userTask];
    long long v30 = [v4 userTask];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBControlHomeIntent allocWithZone:](_INPBControlHomeIntent, "allocWithZone:") init];
  unint64_t v6 = (void *)[(NSArray *)self->_contents copyWithZone:a3];
  [(_INPBControlHomeIntent *)v5 setContents:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_filters copyWithZone:a3];
  [(_INPBControlHomeIntent *)v5 setFilters:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBControlHomeIntent *)v5 setIntentMetadata:v8];

  id v9 = [(_INPBDateTimeRange *)self->_time copyWithZone:a3];
  [(_INPBControlHomeIntent *)v5 setTime:v9];

  id v10 = [(_INPBHomeUserTask *)self->_userTask copyWithZone:a3];
  [(_INPBControlHomeIntent *)v5 setUserTask:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBControlHomeIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBControlHomeIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBControlHomeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBControlHomeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBControlHomeIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v5 = self->_contents;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = self->_filters;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [(_INPBControlHomeIntent *)self intentMetadata];

  if (v15)
  {
    int v16 = [(_INPBControlHomeIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v17 = [(_INPBControlHomeIntent *)self time];

  if (v17)
  {
    v18 = [(_INPBControlHomeIntent *)self time];
    PBDataWriterWriteSubmessage();
  }
  v19 = [(_INPBControlHomeIntent *)self userTask];

  if (v19)
  {
    v20 = [(_INPBControlHomeIntent *)self userTask];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBControlHomeIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUserTask
{
  return self->_userTask != 0;
}

- (void)setUserTask:(id)a3
{
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (void)setTime:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)filtersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_filters objectAtIndexedSubscript:a3];
}

- (unint64_t)filtersCount
{
  return [(NSArray *)self->_filters count];
}

- (void)addFilters:(id)a3
{
  id v4 = a3;
  filters = self->_filters;
  id v8 = v4;
  if (!filters)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_filters;
    self->_filters = v6;

    id v4 = v8;
    filters = self->_filters;
  }
  [(NSArray *)filters addObject:v4];
}

- (void)clearFilters
{
}

- (void)setFilters:(id)a3
{
  self->_filters = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)contentsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contents objectAtIndexedSubscript:a3];
}

- (unint64_t)contentsCount
{
  return [(NSArray *)self->_contents count];
}

- (void)addContents:(id)a3
{
  id v4 = a3;
  contents = self->_contents;
  id v8 = v4;
  if (!contents)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contents;
    self->_contents = v6;

    id v4 = v8;
    contents = self->_contents;
  }
  [(NSArray *)contents addObject:v4];
}

- (void)clearContents
{
}

- (void)setContents:(id)a3
{
  self->_contents = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)filtersType
{
  return (Class)objc_opt_class();
}

+ (Class)contentsType
{
  return (Class)objc_opt_class();
}

@end