@interface SHMREMatch
- (NSArray)mediaItems;
- (NSArray)signatureAlignments;
- (NSNumber)freqSkew;
- (NSNumber)score;
- (NSNumber)timeSkew;
- (SHMREMatch)initWithResult:(id)a3 mediaItems:(id)a4 signatureAlignments:(id)a5 querySignature:(id)a6;
- (SHMREMatch)initWithTrackID:(unint64_t)a3 matchOffset:(double)a4 timeSkew:(id)a5 frequencySkew:(id)a6 score:(id)a7 mediaItems:(id)a8 querySignature:(id)a9 signatureAlignments:(id)a10;
- (SHSignature)querySignature;
- (double)offset;
- (id)toMatchedMediaItems;
- (unint64_t)trackID;
@end

@implementation SHMREMatch

- (SHMREMatch)initWithResult:(id)a3 mediaItems:(id)a4 signatureAlignments:(id)a5 querySignature:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v13 trackID];
  [v13 offset];
  double v16 = v15;
  v17 = [v13 timeSkew];
  v18 = [v13 freqSkew];
  v19 = [v13 score];

  v20 = [(SHMREMatch *)self initWithTrackID:v14 matchOffset:v17 timeSkew:v18 frequencySkew:v19 score:v12 mediaItems:v10 querySignature:v16 signatureAlignments:v11];
  return v20;
}

- (SHMREMatch)initWithTrackID:(unint64_t)a3 matchOffset:(double)a4 timeSkew:(id)a5 frequencySkew:(id)a6 score:(id)a7 mediaItems:(id)a8 querySignature:(id)a9 signatureAlignments:(id)a10
{
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v18 = a9;
  id v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)SHMREMatch;
  v20 = [(SHMREMatch *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_trackID = a3;
    v20->_offset = a4;
    objc_storeStrong((id *)&v20->_timeSkew, a5);
    objc_storeStrong((id *)&v21->_freqSkew, a6);
    objc_storeStrong((id *)&v21->_score, a7);
    objc_storeStrong((id *)&v21->_mediaItems, a8);
    objc_storeStrong((id *)&v21->_signatureAlignments, a10);
    objc_storeStrong((id *)&v21->_querySignature, a9);
  }

  return v21;
}

- (id)toMatchedMediaItems
{
  v39[5] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9A0];
  v38[0] = @"sh_matchOffset";
  v4 = NSNumber;
  [(SHMREMatch *)self offset];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v39[0] = v5;
  v38[1] = @"sh_speedSkew";
  v6 = [(SHMREMatch *)self timeSkew];
  v39[1] = v6;
  v38[2] = @"sh_frequencySkew";
  v7 = [(SHMREMatch *)self freqSkew];
  v39[2] = v7;
  v38[3] = @"sh_score";
  v8 = [(SHMREMatch *)self score];
  v39[3] = v8;
  v38[4] = @"sh_audioStartDate";
  v9 = [(SHMREMatch *)self querySignature];
  id v10 = [v9 audioStartDate];
  v39[4] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
  id v12 = [v3 dictionaryWithDictionary:v11];

  id v13 = [(SHMREMatch *)self signatureAlignments];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    double v15 = [(SHMREMatch *)self signatureAlignments];
    [v12 setValue:v15 forKey:@"sh_signatureAlignments"];
  }
  double v16 = [(SHMREMatch *)self mediaItems];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    id v18 = (void *)MEMORY[0x263EFF980];
    id v19 = [(SHMREMatch *)self mediaItems];
    objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (SHMatchedMediaItem *)objc_claimAutoreleasedReturnValue();

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v21 = [(SHMREMatch *)self mediaItems];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = [*(id *)(*((void *)&v32 + 1) + 8 * i) properties];
          objc_super v27 = (void *)[v26 mutableCopy];

          [v27 addEntriesFromDictionary:v12];
          v28 = [[SHMatchedMediaItem alloc] initWithMatchedMediaItemDictionary:v27];
          [(SHMatchedMediaItem *)v20 addObject:v28];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v23);
    }

    uint64_t v29 = [(SHMatchedMediaItem *)v20 copy];
  }
  else
  {
    v20 = [[SHMatchedMediaItem alloc] initWithMatchedMediaItemDictionary:v12];
    v37 = v20;
    uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  }
  v30 = (void *)v29;

  return v30;
}

- (unint64_t)trackID
{
  return self->_trackID;
}

- (double)offset
{
  return self->_offset;
}

- (NSNumber)timeSkew
{
  return self->_timeSkew;
}

- (NSNumber)freqSkew
{
  return self->_freqSkew;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (NSArray)signatureAlignments
{
  return self->_signatureAlignments;
}

- (SHSignature)querySignature
{
  return self->_querySignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_querySignature, 0);
  objc_storeStrong((id *)&self->_signatureAlignments, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_freqSkew, 0);

  objc_storeStrong((id *)&self->_timeSkew, 0);
}

@end