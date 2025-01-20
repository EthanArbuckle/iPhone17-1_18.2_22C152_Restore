@interface _INPBListShortcutsIntent
+ (BOOL)supportsSecureCoding;
+ (Class)appTitleType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasOriginDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)appTitles;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBListShortcutsIntent)initWithCoder:(id)a3;
- (id)appTitleAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)originDeviceAsString:(int)a3;
- (int)StringAsOriginDevice:(id)a3;
- (int)originDevice;
- (unint64_t)appTitlesCount;
- (unint64_t)hash;
- (void)addAppTitle:(id)a3;
- (void)clearAppTitles;
- (void)encodeWithCoder:(id)a3;
- (void)setAppTitles:(id)a3;
- (void)setHasOriginDevice:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setOriginDevice:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBListShortcutsIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_appTitles, 0);
}

- (int)originDevice
{
  return self->_originDevice;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)appTitles
{
  return self->_appTitles;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_appTitles count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_appTitles;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"appTitle"];
  }
  v11 = [(_INPBListShortcutsIntent *)self intentMetadata];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBListShortcutsIntent *)self hasOriginDevice])
  {
    uint64_t v13 = [(_INPBListShortcutsIntent *)self originDevice];
    if ((v13 - 1) >= 7)
    {
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
    }
    else
    {
      v14 = *(&off_1E551FB40 + (v13 - 1));
    }
    [v3 setObject:v14 forKeyedSubscript:@"originDevice"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_appTitles hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBListShortcutsIntent *)self hasOriginDevice]) {
    uint64_t v5 = 2654435761 * self->_originDevice;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_INPBListShortcutsIntent *)self appTitles];
  uint64_t v6 = [v4 appTitles];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBListShortcutsIntent *)self appTitles];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBListShortcutsIntent *)self appTitles];
    v10 = [v4 appTitles];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBListShortcutsIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBListShortcutsIntent *)self intentMetadata];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_INPBListShortcutsIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBListShortcutsIntent *)self hasOriginDevice];
  if (v19 == [v4 hasOriginDevice])
  {
    if (![(_INPBListShortcutsIntent *)self hasOriginDevice]
      || ![v4 hasOriginDevice]
      || (int originDevice = self->_originDevice, originDevice == [v4 originDevice]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBListShortcutsIntent allocWithZone:](_INPBListShortcutsIntent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_appTitles copyWithZone:a3];
  [(_INPBListShortcutsIntent *)v5 setAppTitles:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBListShortcutsIntent *)v5 setIntentMetadata:v7];

  if ([(_INPBListShortcutsIntent *)self hasOriginDevice]) {
    [(_INPBListShortcutsIntent *)v5 setOriginDevice:[(_INPBListShortcutsIntent *)self originDevice]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBListShortcutsIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBListShortcutsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBListShortcutsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBListShortcutsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBListShortcutsIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_appTitles;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBListShortcutsIntent *)self intentMetadata];

  if (v10)
  {
    int v11 = [(_INPBListShortcutsIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBListShortcutsIntent *)self hasOriginDevice]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBListShortcutsIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsOriginDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WATCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOME_POD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CARPLAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MAC"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)originDeviceAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551FB40 + (a3 - 1));
  }

  return v3;
}

- (void)setHasOriginDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginDevice
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOriginDevice:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int originDevice = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)appTitleAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_appTitles objectAtIndexedSubscript:a3];
}

- (unint64_t)appTitlesCount
{
  return [(NSArray *)self->_appTitles count];
}

- (void)addAppTitle:(id)a3
{
  id v4 = a3;
  appTitles = self->_appTitles;
  id v8 = v4;
  if (!appTitles)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_appTitles;
    self->_appTitles = v6;

    id v4 = v8;
    appTitles = self->_appTitles;
  }
  [(NSArray *)appTitles addObject:v4];
}

- (void)clearAppTitles
{
}

- (void)setAppTitles:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  appTitles = self->_appTitles;
  self->_appTitles = v4;

  MEMORY[0x1F41817F8](v4, appTitles);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)appTitleType
{
  return (Class)objc_opt_class();
}

@end