@interface _BlastDoorLPLyricExcerptMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)endTime;
- (NSNumber)startTime;
- (NSString)language;
- (NSString)lyrics;
- (_BlastDoorLPLyricExcerptMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLyrics:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation _BlastDoorLPLyricExcerptMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_BlastDoorLPLyricExcerptMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(_BlastDoorLPLyricExcerptMetadata *)self lyrics];
    [(_BlastDoorLPLyricExcerptMetadata *)v4 setLyrics:v5];

    v6 = [(_BlastDoorLPLyricExcerptMetadata *)self language];
    [(_BlastDoorLPLyricExcerptMetadata *)v4 setLanguage:v6];

    v7 = [(_BlastDoorLPLyricExcerptMetadata *)self startTime];
    [(_BlastDoorLPLyricExcerptMetadata *)v4 setStartTime:v7];

    v8 = [(_BlastDoorLPLyricExcerptMetadata *)self endTime];
    [(_BlastDoorLPLyricExcerptMetadata *)v4 setEndTime:v8];

    v9 = v4;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPLyricExcerptMetadata)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorLPLyricExcerptMetadata;
  v5 = [(_BlastDoorLPLyricExcerptMetadata *)&v16 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"lyrics");
    lyrics = v5->_lyrics;
    v5->_lyrics = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"language");
    language = v5->_language;
    v5->_language = (NSString *)v8;

    uint64_t v10 = decodeNumberForKey(v4, @"startTime");
    startTime = v5->_startTime;
    v5->_startTime = (NSNumber *)v10;

    uint64_t v12 = decodeNumberForKey(v4, @"endTime");
    endTime = v5->_endTime;
    v5->_endTime = (NSNumber *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  lyrics = self->_lyrics;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", lyrics, @"lyrics");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_language, @"language");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_startTime, @"startTime");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_endTime, @"endTime");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPLyricExcerptMetadata;
  if ([(_BlastDoorLPLyricExcerptMetadata *)&v12 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[1];
      if (v7 | (unint64_t)self->_lyrics && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[2], v8 | (unint64_t)self->_language) && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[3], v9 | (unint64_t)self->_startTime) && !objc_msgSend((id)v9, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v10 = v6[4];
        if (v10 | (unint64_t)self->_endTime) {
          char v5 = objc_msgSend((id)v10, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_lyrics hash];
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
}

@end