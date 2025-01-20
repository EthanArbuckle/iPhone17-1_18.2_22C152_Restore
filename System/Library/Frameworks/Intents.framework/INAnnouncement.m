@interface INAnnouncement
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAnnouncement)initWithCoder:(id)a3;
- (INAnnouncement)initWithSpeechDataURL:(id)a3 identifier:(id)a4;
- (INAnnouncement)initWithSpeechDataURL:(id)a3 identifier:(id)a4 speechDataTranscription:(id)a5;
- (INAnnouncement)initWithSpeechDataURL:(id)a3 startTime:(id)a4 endTime:(id)a5 identifier:(id)a6;
- (NSNumber)endTime;
- (NSNumber)startTime;
- (NSString)description;
- (NSString)identifier;
- (NSString)speechDataTranscription;
- (NSURL)speechDataURL;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAnnouncement

- (NSNumber)endTime
{
  return 0;
}

- (NSNumber)startTime
{
  return 0;
}

- (INAnnouncement)initWithSpeechDataURL:(id)a3 startTime:(id)a4 endTime:(id)a5 identifier:(id)a6
{
  return -[INAnnouncement initWithSpeechDataURL:identifier:](self, "initWithSpeechDataURL:identifier:", a3, a6, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechDataTranscription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_speechDataURL, 0);
}

- (NSString)speechDataTranscription
{
  return self->_speechDataTranscription;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)speechDataURL
{
  return self->_speechDataURL;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"speechDataURL";
  speechDataURL = self->_speechDataURL;
  v4 = speechDataURL;
  if (!speechDataURL)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"identifier";
  identifier = self->_identifier;
  v6 = identifier;
  if (!identifier)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"speechDataTranscription";
  speechDataTranscription = self->_speechDataTranscription;
  v8 = speechDataTranscription;
  if (!speechDataTranscription)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (speechDataTranscription)
  {
    if (identifier) {
      goto LABEL_9;
    }
LABEL_14:

    if (speechDataURL) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!identifier) {
    goto LABEL_14;
  }
LABEL_9:
  if (speechDataURL) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INAnnouncement;
  v6 = [(INAnnouncement *)&v11 description];
  v7 = [(INAnnouncement *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INAnnouncement *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_speechDataURL];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"speechDataURL");

  v9 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"identifier");

  v10 = [v6 encodeObject:self->_speechDataTranscription];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"speechDataTranscription");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  speechDataURL = self->_speechDataURL;
  id v5 = a3;
  [v5 encodeObject:speechDataURL forKey:@"speechDataURL"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_speechDataTranscription forKey:@"speechDataTranscription"];
}

- (INAnnouncement)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speechDataURL"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"identifier"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"speechDataTranscription"];

  v14 = [(INAnnouncement *)self initWithSpeechDataURL:v5 identifier:v9 speechDataTranscription:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INAnnouncement *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      speechDataURL = self->_speechDataURL;
      BOOL v9 = 0;
      if (speechDataURL == v5->_speechDataURL || -[NSURL isEqual:](speechDataURL, "isEqual:"))
      {
        identifier = self->_identifier;
        if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
        {
          speechDataTranscription = self->_speechDataTranscription;
          if (speechDataTranscription == v5->_speechDataTranscription
            || -[NSString isEqual:](speechDataTranscription, "isEqual:"))
          {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_speechDataURL hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_speechDataTranscription hash];
}

- (INAnnouncement)initWithSpeechDataURL:(id)a3 identifier:(id)a4
{
  return [(INAnnouncement *)self initWithSpeechDataURL:a3 identifier:a4 speechDataTranscription:0];
}

- (INAnnouncement)initWithSpeechDataURL:(id)a3 identifier:(id)a4 speechDataTranscription:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INAnnouncement;
  uint64_t v11 = [(INAnnouncement *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    speechDataURL = v11->_speechDataURL;
    v11->_speechDataURL = (NSURL *)v12;

    uint64_t v14 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    speechDataTranscription = v11->_speechDataTranscription;
    v11->_speechDataTranscription = (NSString *)v16;
  }
  return v11;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v8 objectForKeyedSubscript:@"speechDataURL"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"identifier"];
    v13 = [v8 objectForKeyedSubscript:@"speechDataTranscription"];
    uint64_t v14 = (void *)[objc_alloc((Class)a1) initWithSpeechDataURL:v11 identifier:v12 speechDataTranscription:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end