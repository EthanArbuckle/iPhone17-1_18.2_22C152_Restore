@interface AMSMediaTaskTypeConfig
+ (id)configForType:(int64_t)a3;
- (AMSMediaTaskTypeConfig)initWithType:(int64_t)a3 typeString:(id)a4 hostBagKey:(id)a5 realm:(id)a6 includePlatform:(BOOL)a7;
- (BOOL)includePlatform;
- (NSString)hostBagKey;
- (NSString)realm;
- (NSString)typeString;
- (int64_t)type;
@end

@implementation AMSMediaTaskTypeConfig

- (int64_t)type
{
  return self->_type;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (NSString)realm
{
  return self->_realm;
}

- (BOOL)includePlatform
{
  return self->_includePlatform;
}

- (NSString)hostBagKey
{
  return self->_hostBagKey;
}

+ (id)configForType:(int64_t)a3
{
  if (a3 <= 199)
  {
    switch(a3)
    {
      case 0:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"apps-media-api-host";
        v5 = @"apps";
        v6 = @"catalog";
        uint64_t v7 = 0;
        goto LABEL_26;
      case 1:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"apps-media-api-host";
        v5 = @"app-bundles";
        v6 = @"catalog";
        uint64_t v7 = 1;
        goto LABEL_26;
      case 2:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"apps-media-api-host";
        v5 = @"in-apps";
        v6 = @"catalog";
        uint64_t v7 = 2;
        goto LABEL_26;
      case 3:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"apps-media-api-host";
        v5 = @"arcade-apps";
        v6 = @"catalog";
        uint64_t v7 = 3;
        goto LABEL_26;
      case 4:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"apps-media-api-edge-host";
        v5 = @"personal-recommendations";
        v6 = @"recommendations";
        uint64_t v7 = 4;
        goto LABEL_26;
      case 5:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"apps-media-api-host";
        v5 = @"editorial-items";
        v6 = @"editorial";
        uint64_t v7 = 5;
        goto LABEL_26;
      case 6:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"apps-media-api-host";
        v5 = @"contingent-items";
        v6 = @"catalog";
        uint64_t v7 = 6;
        goto LABEL_26;
      case 7:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"app-distribution-media-api-host";
        v5 = @"apps";
        v6 = @"listing";
        uint64_t v7 = 7;
        goto LABEL_26;
      case 8:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"games-media-api-host";
        v5 = @"games";
        v6 = @"catalog";
        uint64_t v7 = 8;
LABEL_26:
        uint64_t v8 = 1;
        goto LABEL_43;
      default:
        switch(a3)
        {
          case 'd':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = @"books-media-api-host";
            v5 = @"audio-books";
            v6 = @"catalog";
            uint64_t v7 = 100;
            goto LABEL_42;
          case 'e':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = @"books-media-api-host";
            v5 = @"books";
            v6 = @"catalog";
            uint64_t v7 = 101;
            goto LABEL_42;
          case 'f':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = @"books-media-api-host";
            v5 = @"book-series";
            v6 = @"catalog";
            uint64_t v7 = 102;
            goto LABEL_42;
          case 'g':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = @"books-media-api-host";
            v5 = @"authors";
            v6 = @"catalog";
            uint64_t v7 = 103;
            goto LABEL_42;
          case 'h':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = @"books-media-api-host";
            v5 = @"audio-book-series";
            v6 = @"catalog";
            uint64_t v7 = 104;
            goto LABEL_42;
          default:
            goto LABEL_44;
        }
        goto LABEL_44;
    }
  }
  if (a3 > 299)
  {
    if (a3 > 399)
    {
      switch(a3)
      {
        case 400:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = @"fit-media-api-host";
          v5 = @"contributors";
          v6 = @"catalog";
          uint64_t v7 = 400;
          break;
        case 401:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = @"fit-media-api-host";
          v5 = @"modalities";
          v6 = @"catalog";
          uint64_t v7 = 401;
          break;
        case 402:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = @"fit-media-api-host";
          v5 = @"workouts";
          v6 = @"catalog";
          uint64_t v7 = 402;
          break;
        default:
          goto LABEL_44;
      }
    }
    else
    {
      switch(a3)
      {
        case 300:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = @"podcasts-media-api-host";
          v5 = @"podcasts";
          v6 = @"catalog";
          uint64_t v7 = 300;
          break;
        case 301:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = @"podcasts-media-api-host";
          v5 = @"podcast-episodes";
          v6 = @"catalog";
          uint64_t v7 = 301;
          break;
        case 302:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = @"podcasts-media-api-host";
          v5 = @"podcast-channels";
          v6 = @"catalog";
          uint64_t v7 = 302;
          break;
        default:
          goto LABEL_44;
      }
    }
LABEL_42:
    uint64_t v8 = 0;
LABEL_43:
    a1 = [(AMSMediaTaskTypeConfig *)v3 initWithType:v7 typeString:v5 hostBagKey:v4 realm:v6 includePlatform:v8];
  }
  else
  {
    switch(a3)
    {
      case 200:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"music-media-api-host";
        v5 = @"albums";
        v6 = @"catalog";
        uint64_t v7 = 200;
        goto LABEL_42;
      case 201:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"music-media-api-host";
        v5 = @"music-videos";
        v6 = @"catalog";
        uint64_t v7 = 201;
        goto LABEL_42;
      case 202:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"music-media-api-host";
        v5 = @"playlists";
        v6 = @"catalog";
        uint64_t v7 = 202;
        goto LABEL_42;
      case 203:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"music-media-api-host";
        v5 = @"songs";
        v6 = @"catalog";
        uint64_t v7 = 203;
        goto LABEL_42;
      case 204:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"music-media-api-host";
        v5 = @"stations";
        v6 = @"catalog";
        uint64_t v7 = 204;
        goto LABEL_42;
      case 205:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"music-media-api-host";
        v5 = @"artists";
        v6 = @"catalog";
        uint64_t v7 = 205;
        goto LABEL_42;
      case 206:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"music-media-api-host";
        v5 = @"apple-curators";
        v6 = @"catalog";
        uint64_t v7 = 206;
        goto LABEL_42;
      case 207:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = @"music-media-api-host";
        v5 = @"uploaded-videos";
        v6 = @"catalog";
        uint64_t v7 = 207;
        goto LABEL_42;
      default:
        break;
    }
  }
LABEL_44:
  return a1;
}

- (AMSMediaTaskTypeConfig)initWithType:(int64_t)a3 typeString:(id)a4 hostBagKey:(id)a5 realm:(id)a6 includePlatform:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AMSMediaTaskTypeConfig;
  v16 = [(AMSMediaTaskTypeConfig *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    objc_storeStrong((id *)&v16->_typeString, a4);
    objc_storeStrong((id *)&v17->_hostBagKey, a5);
    objc_storeStrong((id *)&v17->_realm, a6);
    v17->_includePlatform = a7;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_hostBagKey, 0);
}

@end