@interface SiriGKImagePod
- (SiriGKImagePod)initWithPod:(id)a3 safariBackURL:(id)a4 usingPersistentStore:(id)a5;
@end

@implementation SiriGKImagePod

- (SiriGKImagePod)initWithPod:(id)a3 safariBackURL:(id)a4 usingPersistentStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SiriGKImagePod;
  v11 = [(SiriGKImagePod *)&v27 init];
  if (v11)
  {
    v12 = [v8 images];
    v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    [(SiriGKMediaPod *)v11 setViewArray:v13];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v22 = v8;
    v14 = [v8 images];
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[SiriGKImageLinkView alloc] initWithImageLinkedAnswer:*(void *)(*((void *)&v23 + 1) + 8 * (void)v18) safariBackURL:v9 isVideoResult:0 usingPersistentStore:v10];
          v20 = [(SiriGKMediaPod *)v11 viewArray];
          [v20 addObject:v19];

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v16);
    }

    id v8 = v22;
  }

  return v11;
}

@end