@interface MPMediaChapter
- (MPMediaChapter)initWithCoder:(id)a3;
- (MPMediaLibraryArtworkDataSource)artworkDataSource;
- (MPMediaLibraryArtworkRequest)artworkRequest;
- (double)duration;
- (double)playbackDuration;
- (double)playbackTime;
- (id)artworkCatalog;
- (id)description;
- (id)title;
- (id)value;
- (id)valueLoader;
- (int64_t)_sortByChapterIndex:(id)a3;
- (int64_t)chapterType;
- (unint64_t)indexInChaptersWithAnyType;
- (unint64_t)indexInChaptersWithSameType;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkDataSource:(id)a3;
- (void)setArtworkRequest:(id)a3;
- (void)setChapterType:(int64_t)a3;
- (void)setIndexInChaptersWithAnyType:(unint64_t)a3;
- (void)setIndexInChaptersWithSameType:(unint64_t)a3;
- (void)setPlaybackDuration:(double)a3;
- (void)setPlaybackTime:(double)a3;
- (void)setValue:(id)a3;
- (void)setValueLoader:(id)a3;
@end

@implementation MPMediaChapter

- (int64_t)_sortByChapterIndex:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MPMediaChapter *)self indexInChaptersWithAnyType];
  if (v5 >= [v4 indexInChaptersWithAnyType])
  {
    unint64_t v7 = [(MPMediaChapter *)self indexInChaptersWithAnyType];
    int64_t v6 = v7 > [v4 indexInChaptersWithAnyType];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_artworkDataSource);
  objc_storeStrong((id *)&self->_artworkRequest, 0);
  objc_storeStrong(&self->_valueLoader, 0);

  objc_storeStrong(&self->_value, 0);
}

- (void)setArtworkDataSource:(id)a3
{
}

- (MPMediaLibraryArtworkDataSource)artworkDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_artworkDataSource);

  return (MPMediaLibraryArtworkDataSource *)WeakRetained;
}

- (void)setArtworkRequest:(id)a3
{
}

- (MPMediaLibraryArtworkRequest)artworkRequest
{
  return self->_artworkRequest;
}

- (void)setValueLoader:(id)a3
{
}

- (id)valueLoader
{
  return self->_valueLoader;
}

- (void)setValue:(id)a3
{
}

- (void)setPlaybackTime:(double)a3
{
  self->_playbackTime = a3;
}

- (double)playbackTime
{
  return self->_playbackTime;
}

- (void)setPlaybackDuration:(double)a3
{
  self->_playbackDuration = a3;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setChapterType:(int64_t)a3
{
  self->_chapterType = a3;
}

- (int64_t)chapterType
{
  return self->_chapterType;
}

- (void)setIndexInChaptersWithSameType:(unint64_t)a3
{
  self->_indexInChaptersWithSameType = a3;
}

- (unint64_t)indexInChaptersWithSameType
{
  return self->_indexInChaptersWithSameType;
}

- (void)setIndexInChaptersWithAnyType:(unint64_t)a3
{
  self->_indexInChaptersWithAnyType = a3;
}

- (unint64_t)indexInChaptersWithAnyType
{
  return self->_indexInChaptersWithAnyType;
}

- (double)duration
{
  return self->_playbackDuration;
}

- (id)title
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id value = self->_value;
  }
  else {
    id value = 0;
  }

  return value;
}

- (id)value
{
  valueLoader = (void (**)(id, SEL))self->_valueLoader;
  if (valueLoader)
  {
    valueLoader[2](valueLoader, a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = self->_value;
  }

  return v4;
}

- (MPMediaChapter)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    unint64_t v5 = [(MPMediaChapter *)self init];
    if (v5)
    {
      int64_t v6 = [v4 valueForKey:@"MPChapterIndex"];

      if (v6)
      {
        uint64_t v7 = [v4 decodeIntegerForKey:@"MPChapterIndex"];
        v5->_indexInChaptersWithAnyType = v7;
      }
      else
      {
        v5->_indexInChaptersWithAnyType = [v4 decodeIntegerForKey:@"MPIndexInChaptersOfAnyType"];
        uint64_t v7 = [v4 decodeIntegerForKey:@"MPIndexInChaptersOfSameType"];
      }
      v5->_indexInChaptersWithSameType = v7;
      v5->_chapterType = [v4 decodeIntegerForKey:@"MPChapterType"];
      [v4 decodeDoubleForKey:@"MPPlaybackDuration"];
      v5->_playbackDuration = v9;
      [v4 decodeDoubleForKey:@"MPPlaybackTime"];
      v5->_playbackTime = v10;
      uint64_t v11 = [v4 decodeObjectForKey:@"MPValue"];
      id value = v5->_value;
      v5->_id value = (id)v11;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498] format:@"only keyed archiving is supported"];
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if ([v6 allowsKeyedCoding])
  {
    [v6 encodeInteger:self->_indexInChaptersWithAnyType forKey:@"MPIndexInChaptersOfAnyType"];
    [v6 encodeInteger:self->_indexInChaptersWithSameType forKey:@"MPIndexInChaptersOfSameType"];
    [v6 encodeInteger:self->_chapterType forKey:@"MPChapterType"];
    [v6 encodeDouble:@"MPPlaybackDuration" forKey:self->_playbackDuration];
    [v6 encodeDouble:@"MPPlaybackTime" forKey:self->_playbackTime];
    int v4 = [self->_value conformsToProtocol:&unk_1EE6F2128];
    unint64_t v5 = v6;
    if (!v4) {
      goto LABEL_6;
    }
    [v6 encodeObject:self->_value forKey:@"MPValue"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28488] format:@"only keyed archiving is supported"];
  }
  unint64_t v5 = v6;
LABEL_6:
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14[0] = xmmword_1E57F2270;
  v14[1] = *(_OWORD *)off_1E57F2280;
  v15 = @"urlDescription";
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MPMediaChapter *)self indexInChaptersWithAnyType];
  [(MPMediaChapter *)self playbackTime];
  uint64_t v7 = v6;
  [(MPMediaChapter *)self playbackTime];
  double v9 = v8;
  [(MPMediaChapter *)self playbackDuration];
  uint64_t v11 = [v3 stringWithFormat:@"<%@: %p> chapter %lu, time = range = [%.2f, %.2f], %@ = %@", v4, self, v5, v7, v9 + v10, *((void *)v14 + -[MPMediaChapter chapterType](self, "chapterType")), self->_value];
  for (uint64_t i = 32; i != -8; i -= 8)

  return v11;
}

- (id)artworkCatalog
{
  v3 = [(MPMediaChapter *)self artworkDataSource];
  uint64_t v4 = [MPArtworkCatalog alloc];
  unint64_t v5 = [(MPMediaChapter *)self artworkRequest];
  uint64_t v6 = [(MPArtworkCatalog *)v4 initWithToken:v5 dataSource:v3];

  if ([v3 areRepresentationsAvailableForCatalog:v6]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

@end