@interface CAFNowPlayingSnapshot
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSnapshot:(id)a3;
- (CAFNowPlayingSnapshot)initWithCoder:(id)a3;
- (CAFNowPlayingSnapshot)initWithTitles:(id)a3 artworkData:(id)a4 mediaSourceType:(unsigned __int8)a5 mediaSourceIdentifier:(id)a6 artworkToken:(int64_t)a7 mediaItemImageToken:(int64_t)a8 artworkType:(int64_t)a9 multicast:(unint64_t)a10;
- (NSArray)titles;
- (NSData)artworkData;
- (NSString)currentMediaSourceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)artworkType;
- (int64_t)lastArtworkToken;
- (int64_t)lastMediaItemImageToken;
- (unint64_t)hash;
- (unint64_t)multicast;
- (unsigned)mediaSourceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAFNowPlayingSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(CAFNowPlayingSnapshot *)self artworkData];
  [v7 encodeObject:v4 forKey:@"kCAFCarNowPlayingArtworkKey"];

  v5 = [(CAFNowPlayingSnapshot *)self titles];
  [v7 encodeObject:v5 forKey:@"kCAFCarNowPlayingTitlesKey"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[CAFNowPlayingSnapshot mediaSourceType](self, "mediaSourceType"), @"kCAFCarNowPlayingSourceTypeKey");
  v6 = [(CAFNowPlayingSnapshot *)self currentMediaSourceIdentifier];
  [v7 encodeObject:v6 forKey:@"kCAFCarNowPlayingMediaSourceIdentifierKey"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[CAFNowPlayingSnapshot lastArtworkToken](self, "lastArtworkToken"), @"kCAFCarNowPlayingLastArtworkToken");
  objc_msgSend(v7, "encodeInteger:forKey:", -[CAFNowPlayingSnapshot lastMediaItemImageToken](self, "lastMediaItemImageToken"), @"kCAFCarNowPlayingLastMediaItemImageToken");
  objc_msgSend(v7, "encodeInteger:forKey:", -[CAFNowPlayingSnapshot artworkType](self, "artworkType"), @"kCAFCarNowPlayingArtworkTypeKey");
  objc_msgSend(v7, "encodeInteger:forKey:", -[CAFNowPlayingSnapshot multicast](self, "multicast"), @"kCAFCarNowPlayingMulticastKey");
}

- (CAFNowPlayingSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAFNowPlayingSnapshot;
  v5 = [(CAFNowPlayingSnapshot *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCAFCarNowPlayingArtworkKey"];
    artworkData = v5->_artworkData;
    v5->_artworkData = (NSData *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kCAFCarNowPlayingTitlesKey"];
    titles = v5->_titles;
    v5->_titles = (NSArray *)v11;

    v5->_mediaSourceType = [v4 decodeIntegerForKey:@"kCAFCarNowPlayingSourceTypeKey"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCAFCarNowPlayingMediaSourceIdentifierKey"];
    currentMediaSourceIdentifier = v5->_currentMediaSourceIdentifier;
    v5->_currentMediaSourceIdentifier = (NSString *)v13;

    v5->_lastArtworkToken = [v4 decodeIntegerForKey:@"kCAFCarNowPlayingLastArtworkToken"];
    v5->_lastMediaItemImageToken = [v4 decodeIntegerForKey:@"kCAFCarNowPlayingLastMediaItemImageToken"];
    v5->_artworkType = [v4 decodeIntegerForKey:@"kCAFCarNowPlayingArtworkTypeKey"];
    v5->_multicast = [v4 decodeIntegerForKey:@"kCAFCarNowPlayingMulticastKey"];
  }

  return v5;
}

- (CAFNowPlayingSnapshot)initWithTitles:(id)a3 artworkData:(id)a4 mediaSourceType:(unsigned __int8)a5 mediaSourceIdentifier:(id)a6 artworkToken:(int64_t)a7 mediaItemImageToken:(int64_t)a8 artworkType:(int64_t)a9 multicast:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CAFNowPlayingSnapshot;
  v20 = [(CAFNowPlayingSnapshot *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_titles, a3);
    objc_storeStrong((id *)&v21->_artworkData, a4);
    v21->_mediaSourceType = a5;
    objc_storeStrong((id *)&v21->_currentMediaSourceIdentifier, a6);
    v21->_lastArtworkToken = a7;
    v21->_lastMediaItemImageToken = a8;
    v21->_artworkType = a9;
    v21->_multicast = a10;
  }

  return v21;
}

- (id)description
{
  v14 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)CAFNowPlayingSnapshot;
  v3 = [(CAFNowPlayingSnapshot *)&v15 description];
  id v4 = [(CAFNowPlayingSnapshot *)self currentMediaSourceIdentifier];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFNowPlayingSnapshot mediaSourceType](self, "mediaSourceType"));
  uint64_t v6 = [(CAFNowPlayingSnapshot *)self titles];
  int64_t v7 = [(CAFNowPlayingSnapshot *)self lastArtworkToken];
  int64_t v8 = [(CAFNowPlayingSnapshot *)self lastMediaItemImageToken];
  uint64_t v9 = [(CAFNowPlayingSnapshot *)self artworkData];
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAFNowPlayingSnapshot artworkType](self, "artworkType"));
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CAFNowPlayingSnapshot multicast](self, "multicast"));
  v12 = [v14 stringWithFormat:@"%@: source %@ (%@) titles %@, artwork tokens (%lu,%lu), artwork %@, artworkType %@ multicast %@", v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CAFNowPlayingSnapshot *)self isEqualToSnapshot:v4];

  return v5;
}

- (BOOL)isEqualToSnapshot:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 titles];
  uint64_t v6 = [(CAFNowPlayingSnapshot *)self titles];
  if ([v5 isEqualToArray:v6]
    && (int v7 = [v4 mediaSourceType], v7 == -[CAFNowPlayingSnapshot mediaSourceType](self, "mediaSourceType")))
  {
    int64_t v8 = [v4 currentMediaSourceIdentifier];
    uint64_t v9 = [(CAFNowPlayingSnapshot *)self currentMediaSourceIdentifier];
    if ([v8 isEqualToString:v9]
      && (uint64_t v10 = [v4 lastArtworkToken],
          v10 == [(CAFNowPlayingSnapshot *)self lastArtworkToken])
      && (uint64_t v11 = [v4 lastMediaItemImageToken],
          v11 == [(CAFNowPlayingSnapshot *)self lastMediaItemImageToken])
      && (uint64_t v12 = [v4 artworkType], v12 == -[CAFNowPlayingSnapshot artworkType](self, "artworkType")))
    {
      uint64_t v13 = [v4 multicast];
      BOOL v14 = v13 == [(CAFNowPlayingSnapshot *)self multicast];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  objc_super v15 = [(CAFNowPlayingSnapshot *)self artworkData];

  if (v15) {
    char v16 = 0;
  }
  else {
    char v16 = v14;
  }
  if (v15 && v14)
  {
    id v17 = [(CAFNowPlayingSnapshot *)self artworkData];
    id v18 = [v4 artworkData];
    char v16 = [v17 isEqualToData:v18];
  }
  return v16;
}

- (unint64_t)hash
{
  v3 = [(CAFNowPlayingSnapshot *)self titles];
  uint64_t v4 = [v3 hash];
  BOOL v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFNowPlayingSnapshot mediaSourceType](self, "mediaSourceType"));
  uint64_t v6 = [v5 hash];
  int v7 = [(CAFNowPlayingSnapshot *)self currentMediaSourceIdentifier];
  uint64_t v8 = v6 ^ v4 ^ [v7 hash];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAFNowPlayingSnapshot lastArtworkToken](self, "lastArtworkToken"));
  uint64_t v10 = [v9 hash];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAFNowPlayingSnapshot lastMediaItemImageToken](self, "lastMediaItemImageToken"));
  uint64_t v12 = v8 ^ v10 ^ [v11 hash];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAFNowPlayingSnapshot artworkType](self, "artworkType"));
  uint64_t v14 = [v13 hash];
  objc_super v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CAFNowPlayingSnapshot multicast](self, "multicast"));
  unint64_t v16 = v12 ^ v14 ^ [v15 hash];

  id v17 = [(CAFNowPlayingSnapshot *)self artworkData];

  if (v17)
  {
    id v18 = [(CAFNowPlayingSnapshot *)self artworkData];
    v16 ^= [v18 hash];
  }
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CAFNowPlayingSnapshot alloc];
  BOOL v5 = [(CAFNowPlayingSnapshot *)self titles];
  uint64_t v6 = [(CAFNowPlayingSnapshot *)self artworkData];
  uint64_t v7 = [(CAFNowPlayingSnapshot *)self mediaSourceType];
  uint64_t v8 = [(CAFNowPlayingSnapshot *)self currentMediaSourceIdentifier];
  uint64_t v9 = [(CAFNowPlayingSnapshot *)v4 initWithTitles:v5 artworkData:v6 mediaSourceType:v7 mediaSourceIdentifier:v8 artworkToken:[(CAFNowPlayingSnapshot *)self lastArtworkToken] mediaItemImageToken:[(CAFNowPlayingSnapshot *)self lastMediaItemImageToken] artworkType:[(CAFNowPlayingSnapshot *)self artworkType] multicast:[(CAFNowPlayingSnapshot *)self multicast]];

  return v9;
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (NSArray)titles
{
  return self->_titles;
}

- (unsigned)mediaSourceType
{
  return self->_mediaSourceType;
}

- (NSString)currentMediaSourceIdentifier
{
  return self->_currentMediaSourceIdentifier;
}

- (int64_t)lastArtworkToken
{
  return self->_lastArtworkToken;
}

- (int64_t)lastMediaItemImageToken
{
  return self->_lastMediaItemImageToken;
}

- (int64_t)artworkType
{
  return self->_artworkType;
}

- (unint64_t)multicast
{
  return self->_multicast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMediaSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
}

@end