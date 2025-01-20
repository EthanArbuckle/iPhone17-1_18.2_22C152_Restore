@interface ETDataSourceFromFolderData
- (BOOL)balanceClassesForTraining;
- (ETDataSourceFromFolderData)initWithFolder:(id)a3 balanceClassesForTraining:(BOOL)a4;
- (NSArray)imageFileNames;
- (NSMutableArray)classNames;
- (NSMutableDictionary)folderToImages;
- (NSMutableDictionary)pathToClassIndex;
- (NSString)imagesDir;
- (id)dataPointAtIndex:(int)a3;
- (int)numberOfClasses;
- (int)numberOfDataPoints;
- (vImage_Buffer)bufferWithPath:(SEL)a3;
- (void)setBalanceClassesForTraining:(BOOL)a3;
- (void)setClassNames:(id)a3;
- (void)setFolderToImages:(id)a3;
- (void)setImageFileNames:(id)a3;
- (void)setImagesDir:(id)a3;
- (void)setNumberOfClasses:(int)a3;
- (void)setPathToClassIndex:(id)a3;
@end

@implementation ETDataSourceFromFolderData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathToClassIndex, 0);
  objc_storeStrong((id *)&self->_classNames, 0);
  objc_storeStrong((id *)&self->_imageFileNames, 0);
  objc_storeStrong((id *)&self->_folderToImages, 0);

  objc_storeStrong((id *)&self->_imagesDir, 0);
}

- (void)setPathToClassIndex:(id)a3
{
}

- (NSMutableDictionary)pathToClassIndex
{
  return self->_pathToClassIndex;
}

- (void)setClassNames:(id)a3
{
}

- (NSMutableArray)classNames
{
  return self->_classNames;
}

- (void)setImageFileNames:(id)a3
{
}

- (NSArray)imageFileNames
{
  return self->_imageFileNames;
}

- (void)setFolderToImages:(id)a3
{
}

- (NSMutableDictionary)folderToImages
{
  return self->_folderToImages;
}

- (void)setImagesDir:(id)a3
{
}

- (NSString)imagesDir
{
  return self->_imagesDir;
}

- (void)setBalanceClassesForTraining:(BOOL)a3
{
  self->_balanceClassesForTraining = a3;
}

- (BOOL)balanceClassesForTraining
{
  return self->_balanceClassesForTraining;
}

- (void)setNumberOfClasses:(int)a3
{
  self->_numberOfClasses = a3;
}

- (int)numberOfClasses
{
  return self->_numberOfClasses;
}

- (int)numberOfDataPoints
{
  v2 = [(ETDataSourceFromFolderData *)self imageFileNames];
  int v3 = [v2 count];

  return v3;
}

- (id)dataPointAtIndex:(int)a3
{
  if ([(ETDataSourceFromFolderData *)self balanceClassesForTraining])
  {
    int v4 = rand();
    v5 = [(ETDataSourceFromFolderData *)self classNames];
    unint64_t v6 = v4 % (unint64_t)[v5 count];

    v7 = [(ETDataSourceFromFolderData *)self classNames];
    v8 = [v7 objectAtIndexedSubscript:(int)v6];

    v9 = [(ETDataSourceFromFolderData *)self folderToImages];
    v10 = [v9 objectForKeyedSubscript:v8];

    v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", rand() % (unint64_t)objc_msgSend(v10, "count"));
  }
  else
  {
    v11 = [(NSArray *)self->_imageFileNames objectAtIndexedSubscript:rand() % [(NSArray *)self->_imageFileNames count]];
    v8 = [(NSMutableDictionary *)self->_pathToClassIndex objectForKeyedSubscript:v11];
    LODWORD(v6) = [v8 intValue];
  }

  long long v16 = 0u;
  long long v17 = 0u;
  [(ETDataSourceFromFolderData *)self bufferWithPath:v11];
  v12 = objc_opt_new();
  v15[0] = v16;
  v15[1] = v17;
  [v12 setImage:v15 forKey:@"data"];
  v13 = (float *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
  float *v13 = (float)(int)v6;
  [v12 setData:v13 size:4 forKey:@"label" freeWhenDone:1];

  return v12;
}

- (vImage_Buffer)bufferWithPath:(SEL)a3
{
  id v5 = a4;
  unint64_t v6 = CGDataProviderCreateWithFilename((const char *)[v5 UTF8String]);
  v7 = CGImageCreateWithJPEGDataProvider(v6, 0, 0, kCGRenderingIntentDefault);
  int v14 = 0;
  v9[0] = CGImageGetBitsPerComponent(v7);
  v9[1] = CGImageGetBitsPerPixel(v7);
  uint64_t v10 = 0;
  CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(v7);
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  MEMORY[0x192FF2B60](retstr, v9, 0, v7, 0);
  CFRelease(v7);
  CFRelease(v6);

  return result;
}

- (ETDataSourceFromFolderData)initWithFolder:(id)a3 balanceClassesForTraining:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  v66.receiver = self;
  v66.super_class = (Class)ETDataSourceFromFolderData;
  v7 = [(ETDataSourceFromFolderData *)&v66 init];
  v52 = v7;
  if (v7)
  {
    srand(0x7Bu);
    p_imagesDir = (id *)&v7->_imagesDir;
    objc_storeStrong((id *)&v7->_imagesDir, a3);
    [(ETDataSourceFromFolderData *)v7 setBalanceClassesForTraining:v4];
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    imagesDir = v7->_imagesDir;
    id v65 = 0;
    v41 = [v8 contentsOfDirectoryAtPath:imagesDir error:&v65];
    id v10 = v65;

    uint64_t v11 = objc_opt_new();
    folderToImages = v7->_folderToImages;
    v7->_folderToImages = (NSMutableDictionary *)v11;

    v51 = objc_opt_new();
    uint64_t v13 = objc_opt_new();
    pathToClassIndex = v7->_pathToClassIndex;
    v7->_pathToClassIndex = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    classNames = v7->_classNames;
    v7->_classNames = (NSMutableArray *)v15;

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v41;
    uint64_t v17 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v17)
    {
      unsigned int v53 = 0;
      uint64_t v44 = *(void *)v62;
      do
      {
        uint64_t v50 = 0;
        uint64_t v46 = v17;
        do
        {
          if (*(void *)v62 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v61 + 1) + 8 * v50);
          [(NSMutableArray *)v52->_classNames addObject:v18];
          v54 = [*p_imagesDir stringByAppendingPathComponent:v18];
          uint64_t v48 = v18;
          char v60 = 0;
          v19 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v20 = [v19 fileExistsAtPath:v54 isDirectory:&v60];

          if (v60) {
            int v21 = v20;
          }
          else {
            int v21 = 0;
          }
          if (v21 == 1)
          {
            v22 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v59 = v10;
            v47 = [v22 contentsOfDirectoryAtPath:v54 error:&v59];
            id v49 = v59;

            if (v49)
            {
              NSLog(&cfstr_ErrorWithImage.isa, v49);
            }
            else
            {
              v23 = objc_opt_new();
              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              id v24 = v47;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v67 count:16];
              if (v25)
              {
                uint64_t v26 = *(void *)v56;
                do
                {
                  for (uint64_t i = 0; i != v25; ++i)
                  {
                    if (*(void *)v56 != v26) {
                      objc_enumerationMutation(v24);
                    }
                    v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                    v29 = [v28 pathExtension];
                    v30 = [v29 lowercaseString];
                    int v31 = [v30 isEqualToString:@"jpeg"];

                    v32 = [v28 pathExtension];
                    v33 = [v32 lowercaseString];
                    int v34 = [v33 isEqualToString:@"jpg"];

                    if (v31 | v34)
                    {
                      v35 = [v54 stringByAppendingPathComponent:v28];
                      [v51 addObject:v35];
                      [v23 addObject:v35];
                      v36 = [NSNumber numberWithInt:v53];
                      [(NSMutableDictionary *)v52->_pathToClassIndex setObject:v36 forKeyedSubscript:v35];
                    }
                  }
                  uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v67 count:16];
                }
                while (v25);
              }

              v37 = [MEMORY[0x1E4F1C978] arrayWithArray:v23];
              [(NSMutableDictionary *)v52->_folderToImages setObject:v37 forKeyedSubscript:v48];
            }
            id v10 = v49;
          }

          ++v53;
          ++v50;
        }
        while (v50 != v46);
        uint64_t v17 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v17);
    }

    v52->_numberOfClasses = [(NSMutableArray *)v52->_classNames count];
    uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithArray:v51];
    imageFileNames = v52->_imageFileNames;
    v52->_imageFileNames = (NSArray *)v38;
  }
  return v52;
}

@end