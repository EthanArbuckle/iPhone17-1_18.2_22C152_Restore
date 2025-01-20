@interface SHMatchedMediaItem
+ (BOOL)supportsSecureCoding;
- (NSArray)signatureAlignments;
- (NSDate)audioStartDate;
- (NSString)syncedLyricsSnippet;
- (NSTimeInterval)matchOffset;
- (NSTimeInterval)predictedCurrentMatchOffset;
- (SHMatchedMediaItem)initWithCoder:(id)a3;
- (SHMatchedMediaItem)initWithMatchedMediaItemDictionary:(id)a3;
- (SHMatchedMediaItem)initWithMatchedMediaItemDictionary:(id)a3 syncedLyrics:(id)a4;
- (SHSyncedLyrics)syncedLyrics;
- (float)frequencySkew;
- (float)speedSkew;
- (id)creationDate;
- (int64_t)compare:(id)a3;
- (int64_t)matchScore;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHMatchedMediaItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMatchedMediaItem)initWithMatchedMediaItemDictionary:(id)a3
{
  return [(SHMatchedMediaItem *)self initWithMatchedMediaItemDictionary:a3 syncedLyrics:0];
}

- (SHMatchedMediaItem)initWithMatchedMediaItemDictionary:(id)a3 syncedLyrics:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SHMatchedMediaItem;
  v8 = [(SHMediaItem *)&v11 initWithProperties:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_syncedLyrics, a4);
  }

  return v9;
}

- (SHMatchedMediaItem)initWithCoder:(id)a3
{
  v12[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
  id v7 = [v4 setWithArray:v6];

  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"SHMatchedMediaItemSyncedLyrics"];
  v11.receiver = self;
  v11.super_class = (Class)SHMatchedMediaItem;
  v9 = [(SHMediaItem *)&v11 initWithCoder:v5];

  if (v9) {
    objc_storeStrong((id *)&v9->_syncedLyrics, v8);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SHMatchedMediaItem;
  id v4 = a3;
  [(SHMediaItem *)&v6 encodeWithCoder:v4];
  id v5 = [(SHMatchedMediaItem *)self syncedLyrics];
  [v4 encodeObject:v5 forKey:@"SHMatchedMediaItemSyncedLyrics"];
}

- (NSTimeInterval)matchOffset
{
  v2 = [(SHMediaItem *)self validValueForProperty:@"sh_matchOffset"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (float)speedSkew
{
  v2 = [(SHMediaItem *)self validValueForProperty:@"sh_speedSkew"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)frequencySkew
{
  v2 = [(SHMediaItem *)self validValueForProperty:@"sh_frequencySkew"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int64_t)matchScore
{
  v2 = [(SHMediaItem *)self validValueForProperty:@"sh_score"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)syncedLyricsSnippet
{
  return (NSString *)[(SHMediaItem *)self validValueForProperty:@"sh_syncedLyricsSnippet"];
}

- (NSDate)audioStartDate
{
  return (NSDate *)[(SHMediaItem *)self validValueForProperty:@"sh_audioStartDate"];
}

- (NSTimeInterval)predictedCurrentMatchOffset
{
  [(SHMatchedMediaItem *)self matchOffset];
  double v4 = v3;
  id v5 = [(SHMatchedMediaItem *)self audioStartDate];
  [v5 timeIntervalSinceNow];
  NSTimeInterval v7 = v4 - v6;

  return v7;
}

- (NSArray)signatureAlignments
{
  return (NSArray *)[(SHMediaItem *)self validValueForProperty:@"sh_signatureAlignments"];
}

- (id)creationDate
{
  v8.receiver = self;
  v8.super_class = (Class)SHMatchedMediaItem;
  double v3 = [(SHMediaItem *)&v8 creationDate];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SHMatchedMediaItem *)self audioStartDate];
  }
  double v6 = v5;

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(SHMediaItem *)self shazamID];
  double v6 = [v4 shazamID];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    objc_super v8 = sub_224B78FB4(self, "objectForKeyedSubscript:", @"sh_score");
    v9 = [v4 objectForKeyedSubscript:@"sh_score"];
    int64_t v10 = [v8 compare:v9];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (SHSyncedLyrics)syncedLyrics
{
  return self->_syncedLyrics;
}

- (void).cxx_destruct
{
}

@end