@interface PCPrintJob
+ (id)jobs;
- (NSData)thumbnailImageData;
- (NSDictionary)jobInfo;
- (id)initJob:(id)a3;
- (void)setJobInfo:(id)a3;
- (void)setThumbnailImageData:(id)a3;
@end

@implementation PCPrintJob

- (id)initJob:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localJobID];
  v6 = [v4 updatableState];

  v9.receiver = self;
  v9.super_class = (Class)PCPrintJob;
  v7 = [(PCPrintJob *)&v9 initWithJobID:v5 updateState:v6];

  return v7;
}

+ (id)jobs
{
  v3 = +[NSMutableArray array];
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___PCPrintJob;
  id v4 = [super jobs];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [[PCPrintJob alloc] initJob:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSDictionary)jobInfo
{
  return self->_jobInfo;
}

- (void)setJobInfo:(id)a3
{
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setThumbnailImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);

  objc_storeStrong((id *)&self->_jobInfo, 0);
}

@end