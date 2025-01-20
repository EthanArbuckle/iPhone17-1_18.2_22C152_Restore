@interface VCPMovieCurationResults
- (NSMutableArray)highlights;
- (NSMutableDictionary)results;
- (PHAsset)phAsset;
- (VCPMovieCurationResults)initWithPHAsset:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation VCPMovieCurationResults

- (VCPMovieCurationResults)initWithPHAsset:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCPMovieCurationResults;
  v6 = [(VCPMovieCurationResults *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_phAsset, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    highlights = v7->_highlights;
    v7->_highlights = (NSMutableArray *)v8;

    if (v7->_highlights) {
      v10 = v7;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (PHAsset)phAsset
{
  return self->_phAsset;
}

- (NSMutableArray)highlights
{
  return self->_highlights;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_phAsset, 0);
}

@end