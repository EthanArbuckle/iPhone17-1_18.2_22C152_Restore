@interface CAFNowPlayingSnapshot(NowPlaying)
- (__CFString)album;
- (__CFString)artist;
- (__CFString)title;
- (id)artworkImageWithMaxDimension:()NowPlaying inTraitCollection:;
- (uint64_t)jumpBackInterval;
- (uint64_t)jumpForwardInterval;
- (uint64_t)shouldEnableBackButton;
- (uint64_t)shouldEnableNextButton;
@end

@implementation CAFNowPlayingSnapshot(NowPlaying)

- (uint64_t)jumpForwardInterval
{
  return 0;
}

- (uint64_t)jumpBackInterval
{
  return 0;
}

- (uint64_t)shouldEnableNextButton
{
  return 0;
}

- (uint64_t)shouldEnableBackButton
{
  return 0;
}

- (__CFString)artist
{
  v2 = [a1 titles];
  unint64_t v3 = [v2 count];

  if (v3 < 2)
  {
    v5 = &stru_26E13A820;
  }
  else
  {
    v4 = [a1 titles];
    v5 = [v4 objectAtIndexedSubscript:1];
  }
  return v5;
}

- (id)artworkImageWithMaxDimension:()NowPlaying inTraitCollection:
{
  id v6 = a4;
  v7 = [a1 artworkData];

  if (!v7
    || (v8 = (void *)MEMORY[0x263F827E8],
        [a1 artworkData],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v8 imageWithData:v9],
        v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    [a1 mediaSourceType];
    v10 = CPUIImageForPlaceholderTypeWithTraitCollection();
  }
  v11 = objc_msgSend(v10, "imageByPreparingThumbnailOfSize:", a2, a2);

  return v11;
}

- (__CFString)title
{
  v2 = [a1 titles];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    v4 = [a1 titles];
    v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    v5 = &stru_26E13A820;
  }
  return v5;
}

- (__CFString)album
{
  unsigned int v2 = [a1 mediaSourceType];
  if (v2 <= 7 && ((1 << v2) & 0xB0) != 0
    || ([a1 titles],
        v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 < 3))
  {
    uint64_t v3 = &stru_26E13A820;
  }
  else
  {
    v7 = [a1 titles];
    uint64_t v3 = [v7 objectAtIndexedSubscript:2];
  }
  return v3;
}

@end