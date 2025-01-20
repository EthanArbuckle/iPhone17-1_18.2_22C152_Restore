@interface WFPlaylistDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)entireMusicLibrary;
- (BOOL)isEqual:(id)a3;
- (NSNumber)persistentIdentifier;
- (NSString)playlistName;
- (WFPlaylistDescriptor)initWithCoder:(id)a3;
- (WFPlaylistDescriptor)initWithEntireMusicLibrary;
- (WFPlaylistDescriptor)initWithPlaylistName:(id)a3 persistentIdentifier:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFPlaylistDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
}

- (NSNumber)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (BOOL)entireMusicLibrary
{
  return self->_entireMusicLibrary;
}

- (unint64_t)hash
{
  if ([(WFPlaylistDescriptor *)self entireMusicLibrary]) {
    uint64_t v3 = 3405691582;
  }
  else {
    uint64_t v3 = 3133065982;
  }
  v4 = [(WFPlaylistDescriptor *)self playlistName];
  uint64_t v5 = [v4 hash];
  v6 = [(WFPlaylistDescriptor *)self persistentIdentifier];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFPlaylistDescriptor *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if ([(WFPlaylistDescriptor *)v5 entireMusicLibrary]
        && [(WFPlaylistDescriptor *)self entireMusicLibrary])
      {
        goto LABEL_5;
      }
      unint64_t v7 = [(WFPlaylistDescriptor *)v5 playlistName];
      v8 = [(WFPlaylistDescriptor *)self playlistName];
      if ((v7 == 0) != (v8 != 0))
      {
        uint64_t v9 = [(WFPlaylistDescriptor *)v5 playlistName];
        if (v9)
        {
          v10 = (void *)v9;
          v11 = [(WFPlaylistDescriptor *)v5 playlistName];
          v12 = [(WFPlaylistDescriptor *)self playlistName];
          int v13 = [v11 isEqualToString:v12];

          if (!v13) {
            goto LABEL_18;
          }
        }
        else
        {
        }
        unint64_t v7 = [(WFPlaylistDescriptor *)v5 persistentIdentifier];
        v8 = [(WFPlaylistDescriptor *)self persistentIdentifier];
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v14 = [(WFPlaylistDescriptor *)v5 persistentIdentifier];
          if (v14)
          {
            v15 = (void *)v14;
            v16 = [(WFPlaylistDescriptor *)v5 persistentIdentifier];
            v17 = [(WFPlaylistDescriptor *)self persistentIdentifier];
            char v18 = [v16 isEqualToNumber:v17];

            if ((v18 & 1) == 0) {
              goto LABEL_18;
            }
          }
          else
          {
          }
LABEL_5:
          BOOL v6 = 1;
LABEL_19:

          goto LABEL_20;
        }
      }

LABEL_18:
      BOOL v6 = 0;
      goto LABEL_19;
    }
    BOOL v6 = 0;
  }
LABEL_20:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFPlaylistDescriptor *)self playlistName];
  [v4 encodeObject:v5 forKey:@"playlistName"];

  BOOL v6 = [(WFPlaylistDescriptor *)self persistentIdentifier];
  [v4 encodeObject:v6 forKey:@"persistentIdentifier"];

  objc_msgSend(NSNumber, "numberWithBool:", -[WFPlaylistDescriptor entireMusicLibrary](self, "entireMusicLibrary"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"entireMusicLibrary"];
}

- (WFPlaylistDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playlistName"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentIdentifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entireMusicLibrary"];

  if ([v7 BOOLValue]) {
    v8 = [(WFPlaylistDescriptor *)self initWithEntireMusicLibrary];
  }
  else {
    v8 = [(WFPlaylistDescriptor *)self initWithPlaylistName:v5 persistentIdentifier:v6];
  }
  uint64_t v9 = v8;

  return v9;
}

- (WFPlaylistDescriptor)initWithPlaylistName:(id)a3 persistentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFPlaylistDescriptor;
  v8 = [(WFPlaylistDescriptor *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    playlistName = v8->_playlistName;
    v8->_playlistName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_persistentIdentifier, a4);
    v11 = v8;
  }

  return v8;
}

- (WFPlaylistDescriptor)initWithEntireMusicLibrary
{
  v6.receiver = self;
  v6.super_class = (Class)WFPlaylistDescriptor;
  v2 = [(WFPlaylistDescriptor *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_entireMusicLibrary = 1;
    id v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end