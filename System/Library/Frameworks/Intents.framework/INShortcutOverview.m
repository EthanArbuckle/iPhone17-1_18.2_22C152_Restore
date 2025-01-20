@interface INShortcutOverview
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INImage)icon;
- (INShortcutOverview)initWithCoder:(id)a3;
- (INShortcutOverview)initWithName:(id)a3 voiceCommand:(id)a4 icon:(id)a5 descriptiveText:(id)a6 steps:(id)a7;
- (INSpeakableString)descriptiveText;
- (INSpeakableString)name;
- (INSpeakableString)voiceCommand;
- (NSArray)steps;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INShortcutOverview

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(INShortcutOverview *)self icon];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(INShortcutOverview *)self icon];
    v8 = [v7 _identifier];
    v9 = [v4 cacheableObjectForIdentifier:v8];

    if (v9)
    {
      v10 = [(INShortcutOverview *)self icon];
      v11 = [v10 _identifier];
      v12 = [v4 cacheableObjectForIdentifier:v11];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [(INShortcutOverview *)self icon];
        [v12 _imageSize];
        objc_msgSend(v13, "_setImageSize:");
      }
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v14 = [(INShortcutOverview *)self steps];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v20 = [v19 _identifier];
        v21 = [v4 cacheableObjectForIdentifier:v20];

        if (v21)
        {
          v22 = [v19 _identifier];
          v23 = [v4 cacheableObjectForIdentifier:v22];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v23 _imageSize];
            objc_msgSend(v19, "_setImageSize:");
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INShortcutOverview *)self icon];

  if (v4)
  {
    uint64_t v5 = [(INShortcutOverview *)self icon];
    [v3 addObject:v5];
  }
  v6 = [(INShortcutOverview *)self steps];

  if (v6)
  {
    v7 = [(INShortcutOverview *)self steps];
    [v3 addObjectsFromArray:v7];
  }
  if ([v3 count]) {
    v8 = v3;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_descriptiveText, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_voiceCommand, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)steps
{
  return self->_steps;
}

- (INSpeakableString)descriptiveText
{
  return self->_descriptiveText;
}

- (INImage)icon
{
  return self->_icon;
}

- (INSpeakableString)voiceCommand
{
  return self->_voiceCommand;
}

- (INSpeakableString)name
{
  return self->_name;
}

- (id)_dictionaryRepresentation
{
  v22[5] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = @"name";
  name = self->_name;
  uint64_t v4 = (uint64_t)name;
  if (!name)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v4;
  v22[0] = v4;
  v18 = @"voiceCommand";
  voiceCommand = self->_voiceCommand;
  v6 = voiceCommand;
  if (!voiceCommand)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v4, v17, v18);
  }
  v22[1] = v6;
  v19 = @"icon";
  icon = self->_icon;
  v8 = icon;
  if (!icon)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v8;
  v20 = @"descriptiveText";
  descriptiveText = self->_descriptiveText;
  v10 = descriptiveText;
  if (!descriptiveText)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v10;
  v21 = @"steps";
  steps = self->_steps;
  v12 = steps;
  if (!steps)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (steps)
  {
    if (descriptiveText) {
      goto LABEL_13;
    }
  }
  else
  {

    if (descriptiveText)
    {
LABEL_13:
      if (icon) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (icon)
  {
LABEL_14:
    if (voiceCommand) {
      goto LABEL_15;
    }
LABEL_22:

    if (name) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!voiceCommand) {
    goto LABEL_22;
  }
LABEL_15:
  if (name) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v13;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INShortcutOverview;
  v6 = [(INShortcutOverview *)&v11 description];
  v7 = [(INShortcutOverview *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  id v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INShortcutOverview *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_name];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"name");

  id v9 = [v6 encodeObject:self->_voiceCommand];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"voiceCommand");

  v10 = [v6 encodeObject:self->_icon];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"icon");

  objc_super v11 = [v6 encodeObject:self->_descriptiveText];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"descriptiveText");

  v12 = [v6 encodeObject:self->_steps];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"steps");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_voiceCommand forKey:@"voiceCommand"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
  [v5 encodeObject:self->_descriptiveText forKey:@"descriptiveText"];
  [v5 encodeObject:self->_steps forKey:@"steps"];
}

- (INShortcutOverview)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voiceCommand"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptiveText"];
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  objc_super v11 = [v9 setWithArray:v10];
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"steps"];

  v13 = [(INShortcutOverview *)self initWithName:v5 voiceCommand:v6 icon:v7 descriptiveText:v8 steps:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INShortcutOverview *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      name = self->_name;
      BOOL v11 = 0;
      if (name == v5->_name || -[INSpeakableString isEqual:](name, "isEqual:"))
      {
        voiceCommand = self->_voiceCommand;
        if (voiceCommand == v5->_voiceCommand || -[INSpeakableString isEqual:](voiceCommand, "isEqual:"))
        {
          icon = self->_icon;
          if (icon == v5->_icon || -[INImage isEqual:](icon, "isEqual:"))
          {
            descriptiveText = self->_descriptiveText;
            if (descriptiveText == v5->_descriptiveText || -[INSpeakableString isEqual:](descriptiveText, "isEqual:"))
            {
              steps = self->_steps;
              if (steps == v5->_steps || -[NSArray isEqual:](steps, "isEqual:")) {
                BOOL v11 = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakableString *)self->_name hash];
  unint64_t v4 = [(INSpeakableString *)self->_voiceCommand hash] ^ v3;
  unint64_t v5 = [(INImage *)self->_icon hash];
  unint64_t v6 = v4 ^ v5 ^ [(INSpeakableString *)self->_descriptiveText hash];
  return v6 ^ [(NSArray *)self->_steps hash];
}

- (INShortcutOverview)initWithName:(id)a3 voiceCommand:(id)a4 icon:(id)a5 descriptiveText:(id)a6 steps:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)INShortcutOverview;
  uint64_t v17 = [(INShortcutOverview *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    name = v17->_name;
    v17->_name = (INSpeakableString *)v18;

    uint64_t v20 = [v13 copy];
    voiceCommand = v17->_voiceCommand;
    v17->_voiceCommand = (INSpeakableString *)v20;

    uint64_t v22 = [v14 copy];
    icon = v17->_icon;
    v17->_icon = (INImage *)v22;

    uint64_t v24 = [v15 copy];
    descriptiveText = v17->_descriptiveText;
    v17->_descriptiveText = (INSpeakableString *)v24;

    uint64_t v26 = [v16 copy];
    steps = v17->_steps;
    v17->_steps = (NSArray *)v26;
  }
  return v17;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"name"];
    BOOL v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    id v13 = [v8 objectForKeyedSubscript:@"voiceCommand"];
    id v14 = [v7 decodeObjectOfClass:v12 from:v13];

    uint64_t v15 = objc_opt_class();
    id v16 = [v8 objectForKeyedSubscript:@"icon"];
    uint64_t v17 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v18 = objc_opt_class();
    v19 = [v8 objectForKeyedSubscript:@"descriptiveText"];
    uint64_t v20 = [v7 decodeObjectOfClass:v18 from:v19];

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [v8 objectForKeyedSubscript:@"steps"];
    v23 = [v7 decodeObjectsOfClass:v21 from:v22];

    uint64_t v24 = (void *)[objc_alloc((Class)a1) initWithName:v11 voiceCommand:v14 icon:v17 descriptiveText:v20 steps:v23];
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end