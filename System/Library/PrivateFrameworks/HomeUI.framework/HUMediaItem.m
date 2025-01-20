@interface HUMediaItem
- (HUMediaItem)initWithPlaybackArchiveDisplayProperties:(id)a3;
- (MPPlaybackArchiveDisplayProperties)playbackArchiveDisplayProperties;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setPlaybackArchiveDisplayProperties:(id)a3;
@end

@implementation HUMediaItem

- (HUMediaItem)initWithPlaybackArchiveDisplayProperties:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUMediaItem;
  v5 = [(HUMediaItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HUMediaItem *)v5 setPlaybackArchiveDisplayProperties:v4];
  }

  return v6;
}

- (void)setPlaybackArchiveDisplayProperties:(id)a3
{
  v5 = (MPPlaybackArchiveDisplayProperties *)a3;
  if (self->_playbackArchiveDisplayProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_playbackArchiveDisplayProperties, a3);
    v5 = v6;
  }
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  v5 = [(HUMediaItem *)self playbackArchiveDisplayProperties];

  if (v5)
  {
    v6 = [(HUMediaItem *)self playbackArchiveDisplayProperties];
    v7 = [v6 title];
    [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    objc_super v8 = [(HUMediaItem *)self playbackArchiveDisplayProperties];
    v9 = [v8 subtitle];
    [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    v10 = [(HUMediaItem *)self playbackArchiveDisplayProperties];
    v11 = [v10 artworkImageData];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F68ED8]);
      v13 = [(HUMediaItem *)self playbackArchiveDisplayProperties];
      v14 = [v13 artworkImageData];
      v15 = (void *)[v12 initWithImageData:v14];

      [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F689E8]];
    }
  }
  uint64_t v24 = *MEMORY[0x1E4F68B10];
  v16 = NSNumber;
  v17 = [(HUMediaItem *)self playbackArchiveDisplayProperties];
  v18 = [v16 numberWithInt:v17 == 0];
  v25[0] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  [v4 addEntriesFromDictionary:v19];

  v20 = (void *)MEMORY[0x1E4F7A0D8];
  v21 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v22 = [v20 futureWithResult:v21];

  return v22;
}

- (MPPlaybackArchiveDisplayProperties)playbackArchiveDisplayProperties
{
  return self->_playbackArchiveDisplayProperties;
}

- (void).cxx_destruct
{
}

@end