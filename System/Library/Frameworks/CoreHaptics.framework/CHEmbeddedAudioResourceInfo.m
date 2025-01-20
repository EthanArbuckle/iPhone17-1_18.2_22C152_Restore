@interface CHEmbeddedAudioResourceInfo
- (CHEmbeddedAudioResourceInfo)initWithURL:(id)a3 options:(id)a4;
- (NSDictionary)options;
- (NSURL)url;
@end

@implementation CHEmbeddedAudioResourceInfo

- (CHEmbeddedAudioResourceInfo)initWithURL:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHEmbeddedAudioResourceInfo;
  v9 = [(CHEmbeddedAudioResourceInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end