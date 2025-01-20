@interface MPNowPlayingContentItemRemoteArtwork
- (BOOL)isEqual:(id)a3;
- (MPNowPlayingContentItemRemoteArtwork)initWithArtworkURLString:(id)a3 templateData:(id)a4;
- (MPNowPlayingContentItemRemoteArtwork)initWithMediaRemoteRemoteArtwork:(id)a3;
- (MRRemoteArtwork)mediaRemoteRemoteArtwork;
- (NSData)artworkURLTemplateData;
- (NSString)artworkURLString;
- (unint64_t)hash;
@end

@implementation MPNowPlayingContentItemRemoteArtwork

- (void).cxx_destruct
{
}

- (MRRemoteArtwork)mediaRemoteRemoteArtwork
{
  return self->_mediaRemoteRemoteArtwork;
}

- (NSData)artworkURLTemplateData
{
  return (NSData *)[(MRRemoteArtwork *)self->_mediaRemoteRemoteArtwork artworkURLTemplateData];
}

- (NSString)artworkURLString
{
  return (NSString *)[(MRRemoteArtwork *)self->_mediaRemoteRemoteArtwork artworkURLString];
}

- (MPNowPlayingContentItemRemoteArtwork)initWithMediaRemoteRemoteArtwork:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPNowPlayingContentItemRemoteArtwork;
  v6 = [(MPNowPlayingContentItemRemoteArtwork *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaRemoteRemoteArtwork, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v35 = v3 ^ 0x736F6D6570736575;
  uint64_t v36 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v37 = v3 ^ 0x6C7967656E657261;
  uint64_t v38 = v4 ^ 0x7465646279746573;
  id v5 = [(MPNowPlayingContentItemRemoteArtwork *)self artworkURLString];
  [v5 UTF8String];
  [v5 length];

  id v6 = [(MPNowPlayingContentItemRemoteArtwork *)self artworkURLTemplateData];
  [v6 bytes];
  [v6 length];

  uint64_t v7 = (v35 + v36) ^ __ROR8__(v36, 51);
  uint64_t v8 = __ROR8__(v38, 48);
  uint64_t v9 = ((v37 + v38) ^ v8) + __ROR8__(v35 + v36, 32);
  uint64_t v10 = v9 ^ __ROR8__((v37 + v38) ^ v8, 43);
  uint64_t v11 = v37 + v38 + v7;
  uint64_t v12 = v11 ^ __ROR8__(v7, 47);
  uint64_t v13 = v9 + v12;
  uint64_t v14 = (v9 + v12) ^ __ROR8__(v12, 51);
  uint64_t v15 = (__ROR8__(v11, 32) ^ 0xFFLL) + v10;
  uint64_t v16 = __ROR8__(v10, 48);
  uint64_t v17 = __ROR8__(v13, 32) + (v15 ^ v16);
  uint64_t v18 = v17 ^ __ROR8__(v15 ^ v16, 43);
  uint64_t v19 = v14 + v15;
  uint64_t v20 = v19 ^ __ROR8__(v14, 47);
  uint64_t v21 = v20 + v17;
  uint64_t v22 = v21 ^ __ROR8__(v20, 51);
  uint64_t v23 = __ROR8__(v19, 32) + v18;
  uint64_t v24 = __ROR8__(v18, 48);
  uint64_t v25 = __ROR8__(v21, 32) + (v23 ^ v24);
  uint64_t v26 = v25 ^ __ROR8__(v23 ^ v24, 43);
  uint64_t v27 = v22 + v23;
  uint64_t v28 = v27 ^ __ROR8__(v22, 47);
  uint64_t v29 = v28 + v25;
  uint64_t v30 = v29 ^ __ROR8__(v28, 51);
  uint64_t v31 = __ROR8__(v27, 32) + v26;
  uint64_t v32 = __ROR8__(v26, 48);
  uint64_t v33 = __ROR8__(v29, 32) + (v31 ^ v32);
  return (v30 + v31) ^ __ROR8__(v30, 47) ^ v33 ^ __ROR8__(v30 + v31, 32) ^ v33 ^ __ROR8__(v31 ^ v32, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPNowPlayingContentItemRemoteArtwork *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(MPNowPlayingContentItemRemoteArtwork *)self artworkURLString];
      id v7 = [(MPNowPlayingContentItemRemoteArtwork *)v5 artworkURLString];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      uint64_t v10 = [(MPNowPlayingContentItemRemoteArtwork *)self artworkURLTemplateData];
      uint64_t v11 = [(MPNowPlayingContentItemRemoteArtwork *)v5 artworkURLTemplateData];
      if (v10 == v11) {
        char v9 = 1;
      }
      else {
        char v9 = [v10 isEqual:v11];
      }

      goto LABEL_13;
    }
    char v9 = 0;
  }
LABEL_14:

  return v9;
}

- (MPNowPlayingContentItemRemoteArtwork)initWithArtworkURLString:(id)a3 templateData:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F770B8];
  id v7 = a4;
  id v8 = a3;
  char v9 = (void *)[[v6 alloc] initWithArtworkURLString:v8 templateData:v7];

  uint64_t v10 = [(MPNowPlayingContentItemRemoteArtwork *)self initWithMediaRemoteRemoteArtwork:v9];
  return v10;
}

@end