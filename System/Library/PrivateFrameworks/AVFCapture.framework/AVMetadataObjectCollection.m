@interface AVMetadataObjectCollection
+ (id)collectionWithTime:(id *)a3 metadataObjectTypes:(id)a4 handledMetadataObjectTypes:(id)a5 metadataObjects:(id)a6;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (AVMetadataObjectCollection)initWithTime:(id *)a3 metadataObjectTypes:(id)a4 handledMetadataObjectTypes:(id)a5 metadataObjects:(id)a6;
- (NSArray)metadataObjects;
- (NSSet)handledMetadataObjectTypes;
- (NSSet)metadataObjectTypes;
- (void)dealloc;
@end

@implementation AVMetadataObjectCollection

+ (id)collectionWithTime:(id *)a3 metadataObjectTypes:(id)a4 handledMetadataObjectTypes:(id)a5 metadataObjects:(id)a6
{
  id v10 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  return (id)[v10 initWithTime:&v12 metadataObjectTypes:a4 handledMetadataObjectTypes:a5 metadataObjects:a6];
}

- (AVMetadataObjectCollection)initWithTime:(id *)a3 metadataObjectTypes:(id)a4 handledMetadataObjectTypes:(id)a5 metadataObjects:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)AVMetadataObjectCollection;
  id v10 = [(AVMetadataObjectCollection *)&v14 init];
  v11 = (AVMetadataObjectCollection *)v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)&a3->var0;
    *((void *)v10 + 3) = a3->var3;
    *(_OWORD *)(v10 + 8) = v12;
    *((void *)v10 + 4) = [a4 copy];
    v11->_handledMetadataObjectTypes = (NSSet *)[a5 copy];
    v11->_metadataObjects = (NSArray *)a6;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataObjectCollection;
  [(AVMetadataObjectCollection *)&v3 dealloc];
}

- (NSArray)metadataObjects
{
  return self->_metadataObjects;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (NSSet)metadataObjectTypes
{
  return self->_metadataObjectTypes;
}

- (NSSet)handledMetadataObjectTypes
{
  return self->_handledMetadataObjectTypes;
}

@end