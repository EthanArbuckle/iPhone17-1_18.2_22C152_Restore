@interface DBGImage
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withImageData:(id)a3 type:(__CFString *)a4 metadata:(id)a5;
- (DBGImage)initWithImageData:(id)a3 type:(__CFString *)a4 metadata:(id)a5;
- (NSData)imageData;
- (NSDictionary)metadata;
- (NSString)debugDescription;
- (NSString)description;
- (__CFString)imageType;
- (id)JSONCompatibleRepresentation;
@end

@implementation DBGImage

+ (id)withImageData:(id)a3 type:(__CFString *)a4 metadata:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithImageData:v9 type:a4 metadata:v8];

  return v10;
}

- (DBGImage)initWithImageData:(id)a3 type:(__CFString *)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DBGImage;
  v11 = [(DBGImage *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_imageData, a3);
    v12->_imageType = a4;
    objc_storeStrong((id *)&v12->_metadata, a5);
  }

  return v12;
}

- (NSString)description
{
  v2 = [(DBGImage *)self objectValue];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(DBGImage *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (__CFString)imageType
{
  return self->_imageType;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [UTTypePNG identifier];
    if ([v9 isEqualToString:v10])
    {
LABEL_5:

LABEL_6:
      v12 = [v8 dbgDataValue];
      v13 = [a1 withImageData:v12 type:v9 metadata:0];

      goto LABEL_18;
    }
    v11 = [UTTypeTIFF identifier];
    if ([v9 isEqualToString:v11])
    {

      goto LABEL_5;
    }
    objc_super v14 = [UTTypeJPEG identifier];
    unsigned __int8 v15 = [v9 isEqualToString:v14];

    if (v15) {
      goto LABEL_6;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 isEqualToString:@"image"])
  {
    v16 = DBGDecodeValueFromJSONCompatibleValue();
    id v17 = 0;
    v18 = v17;
    if (v17)
    {
      v13 = 0;
      if (a5) {
        *a5 = v17;
      }
    }
    else
    {
      v19 = [v16 objectForKeyedSubscript:@"imageData"];
      v20 = [v16 objectForKeyedSubscript:@"metadata"];
      v21 = [UTTypePNG identifier];
      v13 = [a1 withImageData:v19 type:v21 metadata:v20];
    }
  }
  else
  {
    v13 = 0;
    if (!v8 && a5)
    {
      v13 = 0;
      *a5 = 0;
    }
  }
LABEL_18:

  return v13;
}

- (id)JSONCompatibleRepresentation
{
  return 0;
}

@end