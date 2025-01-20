@interface LPLyricExcerptMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LPLyricExcerptMetadata)initWithCoder:(id)a3;
- (NSNumber)endTime;
- (NSNumber)startTime;
- (NSString)language;
- (NSString)lyrics;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLyrics:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation LPLyricExcerptMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPLyricExcerptMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPLyricExcerptMetadata *)self lyrics];
    [(LPLyricExcerptMetadata *)v4 setLyrics:v5];

    v6 = [(LPLyricExcerptMetadata *)self language];
    [(LPLyricExcerptMetadata *)v4 setLanguage:v6];

    v7 = [(LPLyricExcerptMetadata *)self startTime];
    [(LPLyricExcerptMetadata *)v4 setStartTime:v7];

    v8 = [(LPLyricExcerptMetadata *)self endTime];
    [(LPLyricExcerptMetadata *)v4 setEndTime:v8];

    v9 = v4;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPLyricExcerptMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LPLyricExcerptMetadata;
  v5 = [(LPLyricExcerptMetadata *)&v16 init];
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
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_lyrics, @"lyrics");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_language, @"language");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_startTime, @"startTime");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_endTime, @"endTime");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPLyricExcerptMetadata;
  if ([(LPLyricExcerptMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[1], self->_lyrics) & 1) != 0
        && objectsAreEqual_0(v6[2], self->_language)
        && objectsAreEqual_0(v6[3], self->_startTime))
      {
        char v5 = objectsAreEqual_0(v6[4], self->_endTime);
      }
      else
      {
        char v5 = 0;
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