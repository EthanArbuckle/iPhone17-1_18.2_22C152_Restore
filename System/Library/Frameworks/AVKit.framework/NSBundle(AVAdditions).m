@interface NSBundle(AVAdditions)
- (id)URLForMovieResource:()AVAdditions;
- (id)imageForResource:()AVAdditions size:;
@end

@implementation NSBundle(AVAdditions)

- (id)URLForMovieResource:()AVAdditions
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 pathExtension];
    if ([v6 length])
    {
      uint64_t v7 = [v5 stringByDeletingPathExtension];

      v5 = (void *)v7;
    }
    v8 = [a1 URLForResource:v5 withExtension:v6];
    if (!v8)
    {
      if ([v6 length])
      {
        v8 = 0;
      }
      else
      {
        v8 = [a1 URLForResource:v5 withExtension:@"mov"];
      }
    }
    id v9 = 0;
    if ([v8 checkResourceIsReachableAndReturnError:0]) {
      id v9 = v8;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)imageForResource:()AVAdditions size:
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  v6 = AVBundle();
  uint64_t v7 = [v6 URLForResource:v5 withExtension:0];

  v8 = [v4 dataWithContentsOfURL:v7];
  id v9 = [v3 imageWithData:v8];

  return v9;
}

@end