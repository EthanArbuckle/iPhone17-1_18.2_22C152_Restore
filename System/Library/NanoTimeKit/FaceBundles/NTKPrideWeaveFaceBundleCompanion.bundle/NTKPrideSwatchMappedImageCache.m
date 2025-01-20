@interface NTKPrideSwatchMappedImageCache
+ (id)keyForFaceStyle:(id)a3 editOption:(id)a4 mode:(int64_t)a5 selectedOptions:(id)a6;
+ (id)sharedCache;
- (id)_init;
- (void)_cleanCache;
- (void)_removeImagesForKeysMatching:(id)a3;
@end

@implementation NTKPrideSwatchMappedImageCache

+ (id)sharedCache
{
  if (qword_2C8E8 != -1) {
    dispatch_once(&qword_2C8E8, &stru_248A8);
  }
  v2 = (void *)qword_2C8E0;

  return v2;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKPrideSwatchMappedImageCache;
  v2 = [(NTKPrideSwatchMappedImageCache *)&v5 initWithUniqueIdentifier:@"com.apple.nanotimekit.face.pride.swatches"];
  v3 = v2;
  if (v2) {
    [(NTKPrideSwatchMappedImageCache *)v2 _cleanCache];
  }
  return v3;
}

- (void)_removeImagesForKeysMatching:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKPrideSwatchMappedImageCache *)self allKeys];
  id v6 = [v5 copy];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_FD6C;
  v13[3] = &unk_248D0;
  id v14 = v4;
  id v7 = v4;
  v8 = [v6 indexesOfObjectsPassingTest:v13];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_FD7C;
  v10[3] = &unk_248F8;
  id v11 = v6;
  v12 = self;
  id v9 = v6;
  [v8 enumerateIndexesUsingBlock:v10];
}

+ (id)keyForFaceStyle:(id)a3 editOption:(id)a4 mode:(int64_t)a5 selectedOptions:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v11 allKeys];
  v13 = [v12 sortedArrayUsingComparator:&stru_24938];

  id v14 = objc_opt_new();
  if (v11)
  {
    int64_t v29 = a5;
    id v30 = v10;
    id v31 = v9;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v28 = v13;
    id v15 = v13;
    id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v21 = [v20 integerValue];
          v22 = [v11 objectForKeyedSubscript:v20];
          v23 = [v22 dailySnapshotKey];
          [v14 appendFormat:@"-%ld-%@", v21, v23];
        }
        id v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    id v10 = v30;
    id v9 = v31;
    v13 = v28;
    a5 = v29;
  }
  v24 = [v10 dailySnapshotKey];
  v25 = NTKBuildVersion();
  v26 = +[NSString stringWithFormat:@"%@-%@-%d%@-%@", v9, v24, a5, v14, v25];

  return v26;
}

- (void)_cleanCache
{
}

- (void).cxx_destruct
{
}

@end