@interface _INPBShortcutOverview
+ (BOOL)supportsSecureCoding;
+ (Class)stepsType;
- (BOOL)hasDescriptiveText;
- (BOOL)hasIcon;
- (BOOL)hasName;
- (BOOL)hasVoiceCommand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)steps;
- (_INPBDataString)descriptiveText;
- (_INPBDataString)name;
- (_INPBDataString)voiceCommand;
- (_INPBImageValue)icon;
- (_INPBShortcutOverview)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)stepsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)stepsCount;
- (void)addSteps:(id)a3;
- (void)clearSteps;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptiveText:(id)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setSteps:(id)a3;
- (void)setVoiceCommand:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBShortcutOverview

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceCommand, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_descriptiveText, 0);
}

- (_INPBDataString)voiceCommand
{
  return self->_voiceCommand;
}

- (NSArray)steps
{
  return self->_steps;
}

- (_INPBDataString)name
{
  return self->_name;
}

- (_INPBImageValue)icon
{
  return self->_icon;
}

- (_INPBDataString)descriptiveText
{
  return self->_descriptiveText;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBShortcutOverview *)self descriptiveText];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"descriptiveText"];

  v6 = [(_INPBShortcutOverview *)self icon];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"icon"];

  v8 = [(_INPBShortcutOverview *)self name];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"name"];

  if ([(NSArray *)self->_steps count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v11 = self->_steps;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"steps"];
  }
  v17 = [(_INPBShortcutOverview *)self voiceCommand];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"voiceCommand"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_descriptiveText hash];
  unint64_t v4 = [(_INPBImageValue *)self->_icon hash] ^ v3;
  unint64_t v5 = [(_INPBDataString *)self->_name hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_steps hash];
  return v6 ^ [(_INPBDataString *)self->_voiceCommand hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBShortcutOverview *)self descriptiveText];
  uint64_t v6 = [v4 descriptiveText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBShortcutOverview *)self descriptiveText];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBShortcutOverview *)self descriptiveText];
    v10 = [v4 descriptiveText];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBShortcutOverview *)self icon];
  uint64_t v6 = [v4 icon];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBShortcutOverview *)self icon];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBShortcutOverview *)self icon];
    v15 = [v4 icon];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBShortcutOverview *)self name];
  uint64_t v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBShortcutOverview *)self name];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBShortcutOverview *)self name];
    long long v20 = [v4 name];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBShortcutOverview *)self steps];
  uint64_t v6 = [v4 steps];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBShortcutOverview *)self steps];
  if (v22)
  {
    long long v23 = (void *)v22;
    v24 = [(_INPBShortcutOverview *)self steps];
    uint64_t v25 = [v4 steps];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBShortcutOverview *)self voiceCommand];
  uint64_t v6 = [v4 voiceCommand];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBShortcutOverview *)self voiceCommand];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBShortcutOverview *)self voiceCommand];
    v30 = [v4 voiceCommand];
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
  unint64_t v5 = [+[_INPBShortcutOverview allocWithZone:](_INPBShortcutOverview, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_descriptiveText copyWithZone:a3];
  [(_INPBShortcutOverview *)v5 setDescriptiveText:v6];

  id v7 = [(_INPBImageValue *)self->_icon copyWithZone:a3];
  [(_INPBShortcutOverview *)v5 setIcon:v7];

  id v8 = [(_INPBDataString *)self->_name copyWithZone:a3];
  [(_INPBShortcutOverview *)v5 setName:v8];

  v9 = (void *)[(NSArray *)self->_steps copyWithZone:a3];
  [(_INPBShortcutOverview *)v5 setSteps:v9];

  id v10 = [(_INPBDataString *)self->_voiceCommand copyWithZone:a3];
  [(_INPBShortcutOverview *)v5 setVoiceCommand:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBShortcutOverview *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBShortcutOverview)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBShortcutOverview *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBShortcutOverview *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBShortcutOverview *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBShortcutOverview *)self descriptiveText];

  if (v5)
  {
    id v6 = [(_INPBShortcutOverview *)self descriptiveText];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBShortcutOverview *)self icon];

  if (v7)
  {
    id v8 = [(_INPBShortcutOverview *)self icon];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_INPBShortcutOverview *)self name];

  if (v9)
  {
    id v10 = [(_INPBShortcutOverview *)self name];
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = self->_steps;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  int v16 = [(_INPBShortcutOverview *)self voiceCommand];

  if (v16)
  {
    uint64_t v17 = [(_INPBShortcutOverview *)self voiceCommand];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBShortcutOverviewReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasVoiceCommand
{
  return self->_voiceCommand != 0;
}

- (void)setVoiceCommand:(id)a3
{
}

- (id)stepsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_steps objectAtIndexedSubscript:a3];
}

- (unint64_t)stepsCount
{
  return [(NSArray *)self->_steps count];
}

- (void)addSteps:(id)a3
{
  id v4 = a3;
  steps = self->_steps;
  id v8 = v4;
  if (!steps)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_steps;
    self->_steps = v6;

    id v4 = v8;
    steps = self->_steps;
  }
  [(NSArray *)steps addObject:v4];
}

- (void)clearSteps
{
}

- (void)setSteps:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  steps = self->_steps;
  self->_steps = v4;

  MEMORY[0x1F41817F8](v4, steps);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setName:(id)a3
{
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)hasDescriptiveText
{
  return self->_descriptiveText != 0;
}

- (void)setDescriptiveText:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)stepsType
{
  return (Class)objc_opt_class();
}

@end