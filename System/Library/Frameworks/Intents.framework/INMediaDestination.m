@interface INMediaDestination
+ (BOOL)supportsSecureCoding;
+ (INMediaDestination)libraryDestination;
+ (INMediaDestination)playlistDestinationWithName:(NSString *)playlistName;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INMediaDestination)initWithCoder:(id)a3;
- (INMediaDestination)initWithMediaDestinationType:(int64_t)a3 playlistName:(id)a4;
- (INMediaDestinationType)mediaDestinationType;
- (NSString)description;
- (NSString)playlistName;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INMediaDestination

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  INMediaDestinationType v7 = [(INMediaDestination *)self mediaDestinationType];
  if ((unint64_t)v7 >= INMediaDestinationTypePlaylist)
  {
    if (v7 == INMediaDestinationTypePlaylist)
    {
      v8 = [(INMediaDestination *)self playlistName];
      if ([v8 length])
      {
        v9 = NSString;
        v10 = INLocalizedStringWithLocalizer(@"“%@”", @"“%@”", v6);
        v11 = [(INMediaDestination *)self playlistName];
        v4 = objc_msgSend(v9, "stringWithFormat:", v10, v11);
      }
      else
      {
        v4 = INLocalizedStringWithLocalizer(@"a playlist", @"a playlist", v6);
      }
    }
  }
  else
  {
    v4 = INLocalizedStringWithLocalizer(@"library", @"library", v6);
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (INMediaDestinationType)mediaDestinationType
{
  return self->_mediaDestinationType;
}

- (id)_dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"mediaDestinationType";
  v3 = [NSNumber numberWithInteger:self->_mediaDestinationType];
  v8[1] = @"playlistName";
  v9[0] = v3;
  playlistName = self->_playlistName;
  v5 = playlistName;
  if (!playlistName)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  if (!playlistName) {

  }
  return v6;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INMediaDestination;
  id v6 = [(INMediaDestination *)&v11 description];
  INMediaDestinationType v7 = [(INMediaDestination *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INMediaDestination *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  INMediaDestinationType v7 = [v5 dictionary];
  int64_t mediaDestinationType = self->_mediaDestinationType;
  v9 = @"unknown";
  if (mediaDestinationType == 2) {
    v9 = @"playlist";
  }
  if (mediaDestinationType == 1) {
    v10 = @"library";
  }
  else {
    v10 = v9;
  }
  objc_super v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"mediaDestinationType");

  v12 = [v6 encodeObject:self->_playlistName];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"playlistName");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mediaDestinationType = self->_mediaDestinationType;
  id v5 = a3;
  [v5 encodeInteger:mediaDestinationType forKey:@"mediaDestinationType"];
  [v5 encodeObject:self->_playlistName forKey:@"playlistName"];
}

- (INMediaDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"mediaDestinationType"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playlistName"];

  INMediaDestinationType v7 = [(INMediaDestination *)self initWithMediaDestinationType:v5 playlistName:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INMediaDestination *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v7 = 0;
      if (self->_mediaDestinationType == v5->_mediaDestinationType)
      {
        playlistName = self->_playlistName;
        if (playlistName == v5->_playlistName || -[NSString isEqual:](playlistName, "isEqual:")) {
          BOOL v7 = 1;
        }
      }
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
  v3 = [NSNumber numberWithInteger:self->_mediaDestinationType];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_playlistName hash] ^ v4;

  return v5;
}

- (INMediaDestination)initWithMediaDestinationType:(int64_t)a3 playlistName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INMediaDestination;
  BOOL v7 = [(INMediaDestination *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_int64_t mediaDestinationType = a3;
    uint64_t v9 = [v6 copy];
    playlistName = v8->_playlistName;
    v8->_playlistName = (NSString *)v9;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"mediaDestinationType"];
    uint64_t v10 = INMediaDestinationTypeWithString(v9);

    uint64_t v11 = objc_opt_class();
    objc_super v12 = [v8 objectForKeyedSubscript:@"playlistName"];
    v13 = [v7 decodeObjectOfClass:v11 from:v12];

    v14 = (void *)[objc_alloc((Class)a1) initWithMediaDestinationType:v10 playlistName:v13];
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

+ (INMediaDestination)playlistDestinationWithName:(NSString *)playlistName
{
  uint64_t v4 = playlistName;
  NSUInteger v5 = (void *)[objc_alloc((Class)a1) initWithMediaDestinationType:2 playlistName:v4];

  return (INMediaDestination *)v5;
}

+ (INMediaDestination)libraryDestination
{
  v2 = (void *)[objc_alloc((Class)a1) initWithMediaDestinationType:1 playlistName:0];

  return (INMediaDestination *)v2;
}

@end