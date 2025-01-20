@interface HPSSiriLanguageValue
+ (BOOL)supportsSecureCoding;
+ (id)languageDefaultWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 gender:(int64_t)a5 voiceName:(id)a6;
+ (id)languagesFromVoices:(id)a3 forLanguage:(id)a4;
- (BOOL)alignsWithVoice:(id)a3;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (HPSSiriLanguageValue)initWithCoder:(id)a3;
- (HPSSiriLanguageValue)initWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 gender:(int64_t)a5 voiceName:(id)a6;
- (NSString)outputLanguage;
- (NSString)recognitionLanguage;
- (NSString)voiceName;
- (id)description;
- (int64_t)gender;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HPSSiriLanguageValue

- (HPSSiriLanguageValue)initWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 gender:(int64_t)a5 voiceName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HPSSiriLanguageValue;
  v13 = [(HPSSiriLanguageValue *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    recognitionLanguage = v13->_recognitionLanguage;
    v13->_recognitionLanguage = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    outputLanguage = v13->_outputLanguage;
    v13->_outputLanguage = (NSString *)v16;

    v13->_gender = a5;
    objc_storeStrong((id *)&v13->_voiceName, a6);
  }

  return v13;
}

+ (id)languageDefaultWithRecognitionLanguage:(id)a3 outputLanguage:(id)a4 gender:(int64_t)a5 voiceName:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (unsigned char *)[objc_alloc((Class)a1) initWithRecognitionLanguage:v12 outputLanguage:v11 gender:a5 voiceName:v10];

  v13[8] = 1;
  return v13;
}

+ (id)languagesFromVoices:(id)a3 forLanguage:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = [v6 count];
  if (v26)
  {
    v8 = [v6 firstObject];
    v9 = [v8 languageCode];
    uint64_t v10 = [v8 gender];
    id v11 = [v8 name];
    id v12 = [a1 languageDefaultWithRecognitionLanguage:v7 outputLanguage:v9 gender:v10 voiceName:v11];

    if (v26 == 1)
    {
      v27[0] = v12;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    }
    else
    {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v26];
      [v14 addObject:v12];
      uint64_t v15 = 1;
      id v25 = v7;
      do
      {
        uint64_t v16 = v8;
        v17 = v12;
        v8 = objc_msgSend(v6, "objectAtIndex:", v15, v25);

        id v18 = objc_alloc((Class)a1);
        [v8 languageCode];
        id v19 = a1;
        v21 = id v20 = v6;
        uint64_t v22 = [v8 gender];
        v23 = [v8 name];
        id v12 = (void *)[v18 initWithRecognitionLanguage:v25 outputLanguage:v21 gender:v22 voiceName:v23];

        id v6 = v20;
        a1 = v19;
        [v14 addObject:v12];
        ++v15;
      }
      while (v26 != v15);
      v13 = (void *)[v14 copy];

      id v7 = v25;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

- (BOOL)alignsWithVoice:(id)a3
{
  id v4 = a3;
  if (v4 && (int64_t v5 = -[HPSSiriLanguageValue gender](self, "gender"), v5 == [v4 gender]))
  {
    id v6 = [(HPSSiriLanguageValue *)self outputLanguage];
    id v7 = [v4 languageCode];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(HPSSiriLanguageValue *)self voiceName];
      v9 = [v4 name];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HPSSiriLanguageValue *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(HPSSiriLanguageValue *)self gender], v5 == [(HPSSiriLanguageValue *)v4 gender]))
    {
      id v6 = [(HPSSiriLanguageValue *)self recognitionLanguage];
      id v7 = [(HPSSiriLanguageValue *)v4 recognitionLanguage];
      if ([v6 isEqual:v7])
      {
        v8 = [(HPSSiriLanguageValue *)self outputLanguage];
        v9 = [(HPSSiriLanguageValue *)v4 outputLanguage];
        if ([v8 isEqual:v9])
        {
          char v10 = [(HPSSiriLanguageValue *)self voiceName];
          id v11 = [(HPSSiriLanguageValue *)v4 voiceName];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(HPSSiriLanguageValue *)self recognitionLanguage];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(HPSSiriLanguageValue *)self outputLanguage];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(HPSSiriLanguageValue *)self voiceName];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(HPSSiriLanguageValue *)self gender];

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(HPSSiriLanguageValue *)self voiceName];
  int64_t v7 = [(HPSSiriLanguageValue *)self gender];
  uint64_t v8 = [(HPSSiriLanguageValue *)self recognitionLanguage];
  unint64_t v9 = [(HPSSiriLanguageValue *)self outputLanguage];
  BOOL v10 = [(HPSSiriLanguageValue *)self isDefault];
  id v11 = "";
  if (v10) {
    id v11 = ", isDefault";
  }
  char v12 = [v3 stringWithFormat:@"<%@: %p, \"%@\": Gender = %ld, Recognition = %@, Output = %@%s>", v5, self, v6, v7, v8, v9, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(HPSSiriLanguageValue *)self recognitionLanguage];
  [v8 encodeObject:v4 forKey:@"value.recognition"];

  int64_t v5 = [(HPSSiriLanguageValue *)self outputLanguage];
  [v8 encodeObject:v5 forKey:@"value.output"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HPSSiriLanguageValue gender](self, "gender"));
  [v8 encodeObject:v6 forKey:@"value.gender"];

  int64_t v7 = [(HPSSiriLanguageValue *)self voiceName];
  [v8 encodeObject:v7 forKey:@"value.name"];

  objc_msgSend(v8, "encodeBool:forKey:", -[HPSSiriLanguageValue isDefault](self, "isDefault"), @"value.default");
}

- (HPSSiriLanguageValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HPSSiriLanguageValue;
  int64_t v5 = [(HPSSiriLanguageValue *)&v15 init];
  if (!v5) {
    goto LABEL_7;
  }
  v5->_languageDefault = [v4 decodeBoolForKey:@"value.default"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value.recognition"];
  recognitionLanguage = v5->_recognitionLanguage;
  v5->_recognitionLanguage = (NSString *)v6;

  if (!v5->_recognitionLanguage) {
    goto LABEL_8;
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value.output"];
  outputLanguage = v5->_outputLanguage;
  v5->_outputLanguage = (NSString *)v8;

  if (!v5->_outputLanguage
    || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"value.name"],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        voiceName = v5->_voiceName,
        v5->_voiceName = (NSString *)v10,
        voiceName,
        !v5->_voiceName))
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  char v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value.gender"];
  v13 = v12;
  if (v12)
  {
    v5->_gender = [(HPSSiriLanguageValue *)v12 integerValue];

LABEL_7:
    v13 = v5;
  }
LABEL_9:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)recognitionLanguage
{
  return self->_recognitionLanguage;
}

- (NSString)outputLanguage
{
  return self->_outputLanguage;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (BOOL)isDefault
{
  return self->_languageDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputLanguage, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
}

@end