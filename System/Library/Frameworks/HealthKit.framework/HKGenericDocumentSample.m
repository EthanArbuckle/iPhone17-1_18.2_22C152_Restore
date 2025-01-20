@interface HKGenericDocumentSample
+ (id)documentSampleWithTitle:(id)a3 fileHandle:(id)a4 date:(id)a5 metadata:(id)a6;
- (NSData)thumbnailData;
- (NSString)extension;
- (NSString)title;
@end

@implementation HKGenericDocumentSample

+ (id)documentSampleWithTitle:(id)a3 fileHandle:(id)a4 date:(id)a5 metadata:(id)a6
{
  v7 = (NSString *)a3;
  v8 = (NSFileHandle *)a4;
  v9 = objc_alloc_init(HKGenericDocumentSample);
  title = v9->_title;
  v9->_title = v7;
  v11 = v7;

  fileHandle = v9->_fileHandle;
  v9->_fileHandle = v8;

  return v9;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)extension
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSData)thumbnailData
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end