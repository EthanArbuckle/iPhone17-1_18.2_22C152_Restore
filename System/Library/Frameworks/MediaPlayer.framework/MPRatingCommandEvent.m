@interface MPRatingCommandEvent
- (MPRatingCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (float)rating;
@end

@implementation MPRatingCommandEvent

- (float)rating
{
  return self->_rating;
}

- (MPRatingCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPRatingCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v13 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    v10 = [v8 objectForKey:*MEMORY[0x1E4F77760]];
    [v10 floatValue];
    v9->_rating = v11;
  }
  return v9;
}

@end