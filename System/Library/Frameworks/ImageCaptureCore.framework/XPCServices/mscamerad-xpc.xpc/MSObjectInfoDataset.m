@interface MSObjectInfoDataset
- (MSObjectInfoDataset)init;
- (MSObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4;
- (MSObjectInfoDataset)initWithData:(id)a3;
- (NSData)content;
- (NSString)filename;
- (unint64_t)captureDate_tvsec;
- (unint64_t)modificationDate_tvsec;
- (unint64_t)objectCompressedSize;
- (unsigned)associationDesc;
- (unsigned)associationType;
- (unsigned)imageBitDepth;
- (unsigned)imageOrientation;
- (unsigned)imagePixHeight;
- (unsigned)imagePixWidth;
- (unsigned)objectFormat;
- (unsigned)objectHandle;
- (unsigned)parentObject;
- (unsigned)protectionStatus;
- (unsigned)sequenceNumber;
- (unsigned)storageID;
- (unsigned)thumbCompressedSize;
- (unsigned)thumbFormat;
- (unsigned)thumbOffset;
- (unsigned)thumbPixHeight;
- (unsigned)thumbPixWidth;
- (void)contentLength:(unsigned int *)a3 bufferLength:(unsigned int *)a4;
- (void)setAssociationDesc:(unsigned int)a3;
- (void)setAssociationType:(unsigned __int16)a3;
- (void)setCaptureDate_tvsec:(unint64_t)a3;
- (void)setFilename:(id)a3;
- (void)setImageBitDepth:(unsigned int)a3;
- (void)setImageOrientation:(unsigned __int16)a3;
- (void)setImagePixHeight:(unsigned int)a3;
- (void)setImagePixWidth:(unsigned int)a3;
- (void)setModificationDate_tvsec:(unint64_t)a3;
- (void)setObjectCompressedSize:(unint64_t)a3;
- (void)setObjectFormat:(unsigned __int16)a3;
- (void)setObjectHandle:(unsigned int)a3;
- (void)setParentObject:(unsigned int)a3;
- (void)setProtectionStatus:(unsigned __int16)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setStorageID:(unsigned int)a3;
- (void)setThumbCompressedSize:(unsigned int)a3;
- (void)setThumbFormat:(unsigned __int16)a3;
- (void)setThumbOffset:(unsigned int)a3;
- (void)setThumbPixHeight:(unsigned int)a3;
- (void)setThumbPixWidth:(unsigned int)a3;
@end

@implementation MSObjectInfoDataset

- (MSObjectInfoDataset)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSObjectInfoDataset;
  return [(MSObjectInfoDataset *)&v3 init];
}

- (MSObjectInfoDataset)initWithData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bytes];
  id v6 = [v4 length];

  return [(MSObjectInfoDataset *)self initWithBytes:v5 length:v6];
}

- (MSObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MSObjectInfoDataset;
  id v6 = [(MSObjectInfoDataset *)&v11 init];
  if (v6)
  {
    v10 = a3;
    v6->_objectHandle = sub_100022E24(&v10);
    sub_100022E24(&v10);
    v6->_objectFormat = sub_100022DF8(&v10);
    v6->_protectionStatus = sub_100022DF8(&v10);
    v6->_objectCompressedSize = sub_100022E50((void **)&v10);
    v6->_thumbFormat = sub_100022DF8(&v10);
    v6->_thumbCompressedSize = sub_100022E24(&v10);
    v6->_thumbOffset = sub_100022E24(&v10);
    v6->_thumbPixWidth = sub_100022E24(&v10);
    v6->_thumbPixHeight = sub_100022E24(&v10);
    v6->_imagePixWidth = sub_100022E24(&v10);
    v6->_imagePixHeight = sub_100022E24(&v10);
    v6->_imageBitDepth = sub_100022E24(&v10);
    v6->_parentObject = sub_100022E24(&v10);
    v6->_associationType = sub_100022DF8(&v10);
    v6->_imageOrientation = sub_100022DF8(&v10);
    v6->_captureDate_tvsec = sub_100022E50((void **)&v10);
    v6->_modificationDate_tvsec = sub_100022E50((void **)&v10);
    uint64_t v7 = sub_100022F3C((const void **)&v10, (unint64_t)&a3[a4]);
    filename = v6->_filename;
    v6->_filename = (NSString *)v7;
  }
  return v6;
}

- (void)contentLength:(unsigned int *)a3 bufferLength:(unsigned int *)a4
{
  NSUInteger v6 = [(NSString *)self->_filename length];
  unsigned int v7 = 2 * v6 + 78;
  if (!v6) {
    unsigned int v7 = 76;
  }
  *a3 = v7;
  *a4 = v7 + 8;
}

- (NSData)content
{
  uint64_t v6 = 0;
  [(MSObjectInfoDataset *)self contentLength:(char *)&v6 + 4 bufferLength:&v6];
  id v3 = objc_alloc((Class)NSMutableData);
  id v4 = [v3 initWithLength:v6];
  unsigned int v7 = [v4 mutableBytes];
  sub_100022E38((_DWORD **)&v7, self->_objectHandle);
  sub_100022E38((_DWORD **)&v7, SHIDWORD(v6));
  sub_100022E0C(&v7, self->_objectFormat);
  sub_100022E0C(&v7, self->_protectionStatus);
  sub_100022E64((void **)&v7, self->_objectCompressedSize);
  sub_100022E0C(&v7, self->_thumbFormat);
  sub_100022E38((_DWORD **)&v7, self->_thumbCompressedSize);
  sub_100022E38((_DWORD **)&v7, self->_thumbOffset);
  sub_100022E38((_DWORD **)&v7, self->_thumbPixWidth);
  sub_100022E38((_DWORD **)&v7, self->_thumbPixHeight);
  sub_100022E38((_DWORD **)&v7, self->_imagePixWidth);
  sub_100022E38((_DWORD **)&v7, self->_imagePixHeight);
  sub_100022E38((_DWORD **)&v7, self->_imageBitDepth);
  sub_100022E38((_DWORD **)&v7, self->_parentObject);
  sub_100022E0C(&v7, self->_associationType);
  sub_100022E0C(&v7, self->_imageOrientation);
  sub_100022E64((void **)&v7, self->_captureDate_tvsec);
  sub_100022E64((void **)&v7, self->_modificationDate_tvsec);
  sub_100022F84((unsigned char **)&v7, self->_filename);

  return (NSData *)v4;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)parentObject
{
  return self->_parentObject;
}

- (void)setParentObject:(unsigned int)a3
{
  self->_parentObject = a3;
}

- (unsigned)associationType
{
  return self->_associationType;
}

- (void)setAssociationType:(unsigned __int16)a3
{
  self->_associationType = a3;
}

- (unsigned)associationDesc
{
  return self->_associationDesc;
}

- (void)setAssociationDesc:(unsigned int)a3
{
  self->_associationDesc = a3;
}

- (unsigned)objectFormat
{
  return self->_objectFormat;
}

- (void)setObjectFormat:(unsigned __int16)a3
{
  self->_objectFormat = a3;
}

- (unsigned)protectionStatus
{
  return self->_protectionStatus;
}

- (void)setProtectionStatus:(unsigned __int16)a3
{
  self->_protectionStatus = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unint64_t)objectCompressedSize
{
  return self->_objectCompressedSize;
}

- (void)setObjectCompressedSize:(unint64_t)a3
{
  self->_objectCompressedSize = a3;
}

- (unsigned)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(unsigned __int16)a3
{
  self->_imageOrientation = a3;
}

- (unsigned)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (void)setThumbCompressedSize:(unsigned int)a3
{
  self->_thumbCompressedSize = a3;
}

- (unsigned)thumbFormat
{
  return self->_thumbFormat;
}

- (void)setThumbFormat:(unsigned __int16)a3
{
  self->_thumbFormat = a3;
}

- (unsigned)thumbOffset
{
  return self->_thumbOffset;
}

- (void)setThumbOffset:(unsigned int)a3
{
  self->_thumbOffset = a3;
}

- (unsigned)thumbPixWidth
{
  return self->_thumbPixWidth;
}

- (void)setThumbPixWidth:(unsigned int)a3
{
  self->_thumbPixWidth = a3;
}

- (unsigned)thumbPixHeight
{
  return self->_thumbPixHeight;
}

- (void)setThumbPixHeight:(unsigned int)a3
{
  self->_thumbPixHeight = a3;
}

- (unsigned)imagePixWidth
{
  return self->_imagePixWidth;
}

- (void)setImagePixWidth:(unsigned int)a3
{
  self->_imagePixWidth = a3;
}

- (unsigned)imagePixHeight
{
  return self->_imagePixHeight;
}

- (void)setImagePixHeight:(unsigned int)a3
{
  self->_imagePixHeight = a3;
}

- (unsigned)imageBitDepth
{
  return self->_imageBitDepth;
}

- (void)setImageBitDepth:(unsigned int)a3
{
  self->_imageBitDepth = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (unint64_t)captureDate_tvsec
{
  return self->_captureDate_tvsec;
}

- (void)setCaptureDate_tvsec:(unint64_t)a3
{
  self->_captureDate_tvsec = a3;
}

- (unint64_t)modificationDate_tvsec
{
  return self->_modificationDate_tvsec;
}

- (void)setModificationDate_tvsec:(unint64_t)a3
{
  self->_modificationDate_tvsec = a3;
}

- (void).cxx_destruct
{
}

@end