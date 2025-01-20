@interface NTKUltraCubePhotosReader
+ (id)readerForResourceDirectory:(id)a3;
- (NSString)resourceDirectory;
- (NTKUltraCubePhotosReader)initWithResourceDirectory:(id)a3;
- (id)firstObject;
- (id)lastObject;
- (id)objectAtIndex:(unint64_t)a3;
- (int64_t)version;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation NTKUltraCubePhotosReader

- (NTKUltraCubePhotosReader)initWithResourceDirectory:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NTKUltraCubePhotosReader;
  v5 = [(NTKUltraCubePhotosReader *)&v24 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (NSString *)[v4 copy];
    resourceDirectory = v6->_resourceDirectory;
    v6->_resourceDirectory = v7;

    uint64_t v9 = objc_opt_new();
    photos = v6->_photos;
    v6->_photos = (NSMutableArray *)v9;

    v11 = +[NTKUltraCubeResourcesManifest manifestForResourceDirectory:v6->_resourceDirectory];
    v12 = v11;
    if (v11)
    {
      v6->_version = (int64_t)[v11 version];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v13 = objc_msgSend(v12, "imageList", 0);
      id v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          v17 = 0;
          do
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = +[NTKUltraCubePhoto decodeFromDictionary:*(void *)(*((void *)&v20 + 1) + 8 * (void)v17) forResourceDirectory:v4];
            if (v18) {
              [(NSMutableArray *)v6->_photos addObject:v18];
            }

            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v15);
      }
    }
  }

  return v6;
}

+ (id)readerForResourceDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithResourceDirectory:v4];

  return v5;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_photos count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_photos count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_photos objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)firstObject
{
  v3 = [(NTKUltraCubePhotosReader *)self count];
  if (v3)
  {
    v3 = [(NTKUltraCubePhotosReader *)self objectAtIndex:0];
  }

  return v3;
}

- (id)lastObject
{
  v3 = [(NTKUltraCubePhotosReader *)self count];
  if (v3)
  {
    v3 = [(NTKUltraCubePhotosReader *)self objectAtIndex:(char *)[(NTKUltraCubePhotosReader *)self count] - 1];
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  a3->var2 = &self->_mutationCount;
  a3->var0 = 1;
  unint64_t v8 = a3->var3[0];
  unint64_t v9 = v8 + a5;
  if (v8 + a5 > [(NTKUltraCubePhotosReader *)self count]) {
    unint64_t v9 = [(NTKUltraCubePhotosReader *)self count];
  }
  unint64_t v10 = v9 - v8;
  if (v9 > v8)
  {
    v11 = a4;
    do
      *v11++ = [(NTKUltraCubePhotosReader *)self objectAtIndex:v8++];
    while (v9 != v8);
  }
  a3->var3[0] = v9;
  a3->var1 = a4;
  return v10;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photos, 0);

  objc_storeStrong((id *)&self->_resourceDirectory, 0);
}

@end