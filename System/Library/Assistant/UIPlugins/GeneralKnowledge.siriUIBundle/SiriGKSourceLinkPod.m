@interface SiriGKSourceLinkPod
- (SiriGKSourceLinkPod)initWithSourceLinkPod:(id)a3;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)keylineType;
- (int64_t)viewCount;
@end

@implementation SiriGKSourceLinkPod

- (SiriGKSourceLinkPod)initWithSourceLinkPod:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriGKSourceLinkPod;
  v5 = [(SiriGKSourceLinkPod *)&v12 init];
  if (v5)
  {
    v6 = [SiriGKSourceLinkView alloc];
    v7 = [v4 linkText];
    v8 = [v4 punchOut];
    v9 = [(SiriGKSourceLinkView *)v6 initWithLinkText:v7 punchOut:v8];
    sourceLinkView = v5->_sourceLinkView;
    v5->_sourceLinkView = v9;
  }
  return v5;
}

- (int64_t)viewCount
{
  return 1;
}

- (id)viewAtIndex:(int64_t)a3
{
  return self->_sourceLinkView;
}

- (int64_t)keylineType
{
  return 1;
}

- (void).cxx_destruct
{
}

@end