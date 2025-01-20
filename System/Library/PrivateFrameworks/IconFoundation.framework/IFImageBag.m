@interface IFImageBag
+ (id)imageBagWithResourcesNamed:(id)a3 directory:(id)a4;
+ (id)imageBagWithResourcesNamed:(id)a3 fromBundle:(id)a4;
+ (id)imageBagWithResourcesNamed:(id)a3 fromBundle:(id)a4 subdirectory:(id)a5;
+ (id)imageBagWithResourcesNames:(id)a3 fromBundle:(id)a4;
- (IFImageBag)init;
- (IFImageBag)initWithImages:(id)a3;
- (NSArray)images;
- (NSMutableDictionary)imagesByScale;
- (id)debugDescription;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (id)imagesForScale:(double)a3;
- (os_unfair_lock_s)lock;
- (void)insertImage:(id)a3;
- (void)setImagesByScale:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation IFImageBag

- (void).cxx_destruct
{
}

- (IFImageBag)init
{
  v7.receiver = self;
  v7.super_class = (Class)IFImageBag;
  v2 = [(IFImageBag *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    imagesByScale = v3->_imagesByScale;
    v3->_imagesByScale = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = [(IFImageBag *)self imagesForScale:a4];
  v10 = __33__IFImageBag_imageForSize_scale___block_invoke(width, height, (uint64_t)v9, v9);
  v11 = v10;
  if (width <= height) {
    double v12 = height;
  }
  else {
    double v12 = width;
  }
  double v13 = v12 * a4;
  [v10 dimension];
  double v15 = v14;
  [v11 scale];
  if (v15 * v16 < v13)
  {
    int v17 = 2;
    double v18 = 1.0;
    do
    {
      if (v18 != a4)
      {
        v19 = [(IFImageBag *)self imagesForScale:v18];

        v21 = __33__IFImageBag_imageForSize_scale___block_invoke(width, height, v20, v19);
        [v21 dimension];
        double v23 = v22;
        [v21 scale];
        double v25 = v23 * v24;
        [v11 dimension];
        double v27 = v26;
        [v11 scale];
        if (v25 >= v27 * v28)
        {
          id v29 = v21;

          v11 = v29;
        }

        v9 = v19;
      }
      double v18 = v18 + 1.0;
      --v17;
    }
    while (v17);
    v30 = IFDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[IFImageBag imageForSize:scale:]((uint64_t)v11, v30);
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

id __33__IFImageBag_imageForSize_scale___block_invoke(double a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 firstObject];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "size", (void)v21);
        double v14 = v13;
        [v12 size];
        if (v15 == a2)
        {
          id v19 = v12;

          v6 = v19;
          goto LABEL_22;
        }
        if (v14 < v15 && v15 < a2) {
          goto LABEL_17;
        }
        BOOL v17 = v14 >= a2;
        if (v14 >= v15) {
          BOOL v17 = 1;
        }
        if (v15 < v14) {
          BOOL v17 = 0;
        }
        if (v15 >= a2 && !v17)
        {
LABEL_17:
          id v18 = v12;

          v6 = v18;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  return v6;
}

- (id)imagesForScale:(double)a3
{
  imagesByScale = self->_imagesByScale;
  v6 = objc_msgSend(NSNumber, "numberWithDouble:");
  id v7 = [(NSMutableDictionary *)imagesByScale objectForKeyedSubscript:v6];

  if (!v7)
  {
    double v8 = 3.0;
    do
    {
      uint64_t v9 = self->_imagesByScale;
      uint64_t v10 = [NSNumber numberWithDouble:v8];
      id v7 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];

      double v8 = v8 + -1.0;
    }
    while (v8 >= 1.0 && v7 == 0);
    if (!v7)
    {
      id v7 = objc_opt_new();
      double v12 = self->_imagesByScale;
      double v13 = [NSNumber numberWithDouble:a3];
      [(NSMutableDictionary *)v12 setObject:v7 forKeyedSubscript:v13];
    }
  }

  return v7;
}

- (void)insertImage:(id)a3
{
  id v27 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  imagesByScale = self->_imagesByScale;
  v6 = NSNumber;
  [v27 scale];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  double v8 = [(NSMutableDictionary *)imagesByScale objectForKeyedSubscript:v7];

  if (!v8)
  {
    double v8 = objc_opt_new();
    uint64_t v9 = self->_imagesByScale;
    uint64_t v10 = NSNumber;
    [v27 scale];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v11];
  }
  [v27 size];
  double v13 = v12;
  [v27 size];
  double v15 = v14;
  [v27 size];
  if (v13 <= v15) {
    double v18 = v17;
  }
  else {
    double v18 = v16;
  }
  if ([v8 count])
  {
    uint64_t v19 = 0;
    while (1)
    {
      uint64_t v20 = [v8 objectAtIndexedSubscript:v19];
      [v20 size];
      double v22 = v21;
      [v20 size];
      double v24 = v23;
      [v20 size];
      if (v22 <= v24) {
        double v25 = v26;
      }
      if (v18 < v25)
      {
        [v8 insertObject:v27 atIndex:v19];
        goto LABEL_16;
      }
      if (v18 == v25) {
        break;
      }

      if ([v8 count] <= (unint64_t)++v19) {
        goto LABEL_13;
      }
    }
    [v8 replaceObjectAtIndex:v19 withObject:v27];
LABEL_16:
  }
  else
  {
LABEL_13:
    [v8 addObject:v27];
  }
  os_unfair_lock_unlock(p_lock);
}

- (IFImageBag)initWithImages:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IFImageBag *)self init];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[IFImageBag insertImage:](v5, "insertImage:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (NSArray)images
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSMutableDictionary *)self->_imagesByScale allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (id)debugDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v20.receiver = self;
  v20.super_class = (Class)IFImageBag;
  id v4 = [(IFImageBag *)&v20 debugDescription];
  id v5 = [v3 stringWithString:v4];

  [v5 appendString:@"\n"];
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_imagesByScale allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [(NSMutableDictionary *)self->_imagesByScale objectForKeyedSubscript:v11];
        long long v13 = [v12 debugDescription];
        [v5 appendFormat:@"Scale: %@ -> %@", v11, v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  long long v14 = (void *)[v5 copy];

  return v14;
}

- (NSMutableDictionary)imagesByScale
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImagesByScale:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

+ (id)imageBagWithResourcesNames:(id)a3 fromBundle:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v40 = a4;
  v39 = [MEMORY[0x1E4F1CA48] array];
  v38 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
  v37 = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = [v11 pathExtension];
          if ([(__CFString *)v12 length])
          {
            id v13 = [v11 stringByDeletingPathExtension];
          }
          else
          {

            id v13 = v11;
            long long v12 = @"png";
          }
          if (v12) {
            BOOL v14 = v13 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14)
          {
            long long v15 = [v13 stringByAppendingPathExtension:v12];
            if (v15) {
              [v38 addObject:v15];
            }
            if ((objc_msgSend(v13, "hasSuffix:", @"2x", v37) & 1) == 0
              && ([v13 hasSuffix:@"3x"] & 1) == 0)
            {
              long long v16 = [v13 stringByAppendingString:@"@2x"];
              long long v17 = [v16 stringByAppendingPathExtension:v12];

              if (v17) {
                [v38 addObject:v17];
              }
              long long v18 = [v13 stringByAppendingString:@"@3x"];
              long long v19 = [v18 stringByAppendingPathExtension:v12];

              if (v19) {
                [v38 addObject:v19];
              }

              id v6 = v37;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v8);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v20 = v38;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v20);
        }
        double v25 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        double v26 = objc_msgSend(v25, "stringByDeletingPathExtension", v37);
        id v27 = [v25 pathExtension];
        double v28 = [v40 URLForResource:v26 withExtension:v27];
        if (v28)
        {
          id v29 = +[IFResourceMetadata metadataWithFileName:v26];
          v30 = [v29 scale];
          if (v30)
          {
            v31 = [v29 scale];
            [v31 doubleValue];
            double v33 = v32;
          }
          else
          {
            double v33 = 1.0;
          }

          v34 = [[IFImage alloc] initWithContentsOfURL:v28 scale:v33];
          if (v34) {
            [v39 addObject:v34];
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v22);
  }

  if ([v39 count]) {
    v35 = [[IFImageBag alloc] initWithImages:v39];
  }
  else {
    v35 = 0;
  }

  return v35;
}

+ (id)imageBagWithResourcesNamed:(id)a3 fromBundle:(id)a4
{
  return +[IFImageBag imageBagWithResourcesNamed:a3 fromBundle:a4 subdirectory:0];
}

+ (id)imageBagWithResourcesNamed:(id)a3 fromBundle:(id)a4 subdirectory:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v7 = a4;
  id v8 = a5;
  [MEMORY[0x1E4F1CA48] array];
  v28 = id v27 = v7;
  double v26 = v8;
  [v7 URLsForResourcesWithExtension:@"png" subdirectory:v8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = [v10 lastPathComponent];
        long long v12 = [v11 stringByDeletingPathExtension];

        id v13 = +[IFResourceMetadata metadataWithFileName:v12];
        BOOL v14 = [v13 name];
        long long v15 = [v13 scale];
        long long v16 = NSString;
        long long v17 = [v13 dimension];
        uint64_t v18 = [v17 intValue];
        long long v19 = [v13 dimension];
        id v20 = [v16 stringWithFormat:@"%@%dx%d", v14, v18, objc_msgSend(v19, "intValue")];

        if (([v14 isEqualToString:v32] & 1) != 0
          || [v20 isEqualToString:v32])
        {
          if (v15)
          {
            [v15 doubleValue];
            double v22 = v21;
          }
          else
          {
            double v22 = 1.0;
          }
          uint64_t v23 = [[IFImage alloc] initWithContentsOfURL:v10 scale:v22];
          if (v23) {
            [v28 addObject:v23];
          }
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v31);
  }
  if ([v28 count]) {
    double v24 = [[IFImageBag alloc] initWithImages:v28];
  }
  else {
    double v24 = 0;
  }

  return v24;
}

+ (id)imageBagWithResourcesNamed:(id)a3 directory:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v5 = a4;
  double v26 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v25 = v5;
  id v7 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:7 errorHandler:0];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    uint64_t v12 = *MEMORY[0x1E4F225F8];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v14, "_IF_conformsToUTI:", v12))
        {
          long long v15 = [v14 lastPathComponent];
          long long v16 = [v15 stringByDeletingPathExtension];

          long long v17 = +[IFResourceMetadata metadataWithFileName:v16];
          uint64_t v18 = [v17 name];
          long long v19 = [v17 scale];
          if ([v18 isEqualToString:v27])
          {
            if (v19)
            {
              [v19 doubleValue];
              double v21 = v20;
            }
            else
            {
              double v21 = 1.0;
            }
            double v22 = [[IFImage alloc] initWithContentsOfURL:v14 scale:v21];
            [v26 addObject:v22];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  if ([v26 count]) {
    uint64_t v23 = [[IFImageBag alloc] initWithImages:v26];
  }
  else {
    uint64_t v23 = 0;
  }

  return v23;
}

- (void)imageForSize:(uint64_t)a1 scale:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DC6CA000, a2, OS_LOG_TYPE_DEBUG, "IFImageBag picked an image out of the requested scale to avoid upsampling the source image %@", (uint8_t *)&v2, 0xCu);
}

@end