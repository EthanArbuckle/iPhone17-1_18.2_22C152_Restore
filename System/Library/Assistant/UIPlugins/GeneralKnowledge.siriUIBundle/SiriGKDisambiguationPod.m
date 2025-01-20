@interface SiriGKDisambiguationPod
- (SiriGKDisambiguationPod)initWithDisambiguationPod:(id)a3;
- (id)subtitle;
- (id)title;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)keylineType;
- (int64_t)viewCount;
@end

@implementation SiriGKDisambiguationPod

- (SiriGKDisambiguationPod)initWithDisambiguationPod:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriGKDisambiguationPod;
  v5 = [(SiriGKDisambiguationPod *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 text];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;
  }
  return v5;
}

- (int64_t)viewCount
{
  return 0;
}

- (id)viewAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)keylineType
{
  return 0;
}

- (id)title
{
  id v2 = [(NSString *)self->_title copy];

  return v2;
}

- (id)subtitle
{
  id v2 = [(NSString *)self->_subtitle copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end