@interface PHPhotoLibraryAppPrivateData
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)setValuesForKeysWithDictionary:(id)a3 error:(id *)a4;
- (PHPhotoLibrary)photoLibrary;
- (PHPhotoLibraryAppPrivateData)initWithLibrary:(id)a3;
- (PLAppPrivateData)impl;
- (id)debugDescription;
- (id)dictionaryWithValuesForKeys:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (void)invalidate;
- (void)setImpl:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setValuesForKeysWithDictionary:(id)a3;
@end

@implementation PHPhotoLibraryAppPrivateData

- (id)valueForKey:(id)a3
{
  return (id)[(PLAppPrivateData *)self->_impl valueForKey:a3];
}

- (PHPhotoLibraryAppPrivateData)initWithLibrary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHPhotoLibraryAppPrivateData;
  v5 = [(PHPhotoLibraryAppPrivateData *)&v14 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_photoLibrary, v4);
    v8 = (void *)MEMORY[0x1E4F8B858];
    id v9 = v7;
    v10 = [v4 photoLibraryURL];
    uint64_t v11 = [v8 appPrivateDataForLibraryURL:v10];
    impl = v6->_impl;
    v6->_impl = (PLAppPrivateData *)v11;
  }
  return v6;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  return [(PLAppPrivateData *)self->_impl setValue:a3 forKey:a4 error:a5];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);

  objc_storeStrong((id *)&self->_impl, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  return (PHPhotoLibrary *)WeakRetained;
}

- (void)setImpl:(id)a3
{
}

- (PLAppPrivateData)impl
{
  return (PLAppPrivateData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  id v7 = 0;
  BOOL v4 = [(PHPhotoLibraryAppPrivateData *)self setValuesForKeysWithDictionary:a3 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    v6 = [(PHPhotoLibraryAppPrivateData *)self photoLibrary];
    [v6 appPrivateDataWriteFailedWithError:v5];
  }
}

- (BOOL)setValuesForKeysWithDictionary:(id)a3 error:(id *)a4
{
  return [(PLAppPrivateData *)self->_impl setValuesForKeysWithDictionary:a3 error:a4];
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  return (id)[(PLAppPrivateData *)self->_impl dictionaryWithValuesForKeys:a3];
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v8 = 0;
  BOOL v5 = [(PHPhotoLibraryAppPrivateData *)self setValue:a3 forKeyPath:a4 error:&v8];
  id v6 = v8;
  if (!v5)
  {
    id v7 = [(PHPhotoLibraryAppPrivateData *)self photoLibrary];
    [v7 appPrivateDataWriteFailedWithError:v6];
  }
}

- (BOOL)setValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  return [(PLAppPrivateData *)self->_impl setValue:a3 forKeyPath:a4 error:a5];
}

- (id)valueForKeyPath:(id)a3
{
  return (id)[(PLAppPrivateData *)self->_impl valueForKeyPath:a3];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v8 = 0;
  BOOL v5 = [(PHPhotoLibraryAppPrivateData *)self setValue:a3 forKey:a4 error:&v8];
  id v6 = v8;
  if (!v5)
  {
    id v7 = [(PHPhotoLibraryAppPrivateData *)self photoLibrary];
    [v7 appPrivateDataWriteFailedWithError:v6];
  }
}

- (void)invalidate
{
  impl = self->_impl;
  self->_impl = 0;
}

- (id)debugDescription
{
  impl = self->_impl;
  if (impl) {
    [(PLAppPrivateData *)impl description];
  }
  else {
  BOOL v4 = [NSString stringWithFormat:@"<%@: %p> (INVALIDATED)", objc_opt_class(), self];
  }

  return v4;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end