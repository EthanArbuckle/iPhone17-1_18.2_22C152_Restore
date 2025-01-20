@interface INSpeakerIDInfo
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSpeakerIDInfo)initWithCoder:(id)a3;
- (INSpeakerIDInfo)initWithSharedUserID:(id)a3 speakerIDConfidence:(int64_t)a4;
- (NSString)description;
- (NSString)sharedUserID;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)speakerIDConfidence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSpeakerIDInfo

- (void).cxx_destruct
{
}

- (int64_t)speakerIDConfidence
{
  return self->_speakerIDConfidence;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (id)_dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"sharedUserID";
  sharedUserID = self->_sharedUserID;
  v4 = sharedUserID;
  if (!sharedUserID)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[1] = @"speakerIDConfidence";
  v9[0] = v4;
  v5 = [NSNumber numberWithInteger:self->_speakerIDConfidence];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  if (!sharedUserID) {

  }
  return v6;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSpeakerIDInfo;
  v6 = [(INSpeakerIDInfo *)&v11 description];
  v7 = [(INSpeakerIDInfo *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INSpeakerIDInfo *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_sharedUserID];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"sharedUserID");
  unint64_t v9 = self->_speakerIDConfidence - 1;
  if (v9 > 4) {
    v10 = @"unknown";
  }
  else {
    v10 = *(&off_1E5520068 + v9);
  }
  objc_super v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"speakerIDConfidence");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  sharedUserID = self->_sharedUserID;
  id v5 = a3;
  [v5 encodeObject:sharedUserID forKey:@"sharedUserID"];
  [v5 encodeInteger:self->_speakerIDConfidence forKey:@"speakerIDConfidence"];
}

- (INSpeakerIDInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedUserID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"speakerIDConfidence"];

  v7 = [(INSpeakerIDInfo *)self initWithSharedUserID:v5 speakerIDConfidence:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INSpeakerIDInfo *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      sharedUserID = self->_sharedUserID;
      BOOL v7 = (sharedUserID == v5->_sharedUserID || -[NSString isEqual:](sharedUserID, "isEqual:"))
        && self->_speakerIDConfidence == v5->_speakerIDConfidence;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sharedUserID hash];
  id v4 = [NSNumber numberWithInteger:self->_speakerIDConfidence];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (INSpeakerIDInfo)initWithSharedUserID:(id)a3 speakerIDConfidence:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INSpeakerIDInfo;
  BOOL v7 = [(INSpeakerIDInfo *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    sharedUserID = v7->_sharedUserID;
    v7->_sharedUserID = (NSString *)v8;

    v7->_speakerIDConfidence = a4;
  }

  return v7;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"sharedUserID"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"speakerIDConfidence"];
    uint64_t v13 = INSpeakerIDConfidenceWithString(v12);

    v14 = (void *)[objc_alloc((Class)a1) initWithSharedUserID:v11 speakerIDConfidence:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end