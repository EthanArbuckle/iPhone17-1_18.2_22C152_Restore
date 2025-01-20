@interface _CPLCloudKitFakeFingerPrint
- (CGSize)dimensions;
- (CPLResourceIdentity)fakeIdentity;
- (NSString)fingerPrint;
- (NSString)outputType;
- (NSString)realFingerPrint;
- (_CPLCloudKitFakeFingerPrint)initWithFakeFingerPrint:(id)a3;
- (_CPLCloudKitFakeFingerPrint)initWithFakeIdentity:(id)a3;
- (_CPLCloudKitFakeFingerPrint)initWithRealResourceType:(unint64_t)a3 realFingerPrint:(id)a4 outputType:(id)a5 dimensions:(CGSize)a6;
- (unint64_t)realResourceType;
@end

@implementation _CPLCloudKitFakeFingerPrint

- (_CPLCloudKitFakeFingerPrint)initWithFakeIdentity:(id)a3
{
  v4 = [a3 fingerPrint];
  v5 = [(_CPLCloudKitFakeFingerPrint *)self initWithFakeFingerPrint:v4];

  return v5;
}

- (_CPLCloudKitFakeFingerPrint)initWithFakeFingerPrint:(id)a3
{
  v3 = (_CPLCloudKitFakeFingerPrint *)a3;
  id v5 = a3;
  v6 = [v5 componentsSeparatedByString:@"^"];
  if ([v6 count] != (id)5) {
    goto LABEL_9;
  }
  v7 = [v6 objectAtIndexedSubscript:1];
  v8 = [v6 objectAtIndexedSubscript:2];
  v9 = [v6 objectAtIndexedSubscript:3];
  v10 = [v6 objectAtIndexedSubscript:4];
  NSSize v11 = NSSizeFromString(v10);
  if (qword_1002CE610 != -1) {
    dispatch_once(&qword_1002CE610, &stru_100278018);
  }
  v12 = [(id)qword_1002CE608 objectForKeyedSubscript:v7];
  v13 = v12;
  if (v12)
  {
    v14 = -[_CPLCloudKitFakeFingerPrint initWithRealResourceType:realFingerPrint:outputType:dimensions:](self, "initWithRealResourceType:realFingerPrint:outputType:dimensions:", [v12 integerValue], v8, v9, v11.width, v11.height);
    v15 = v14;
    if (v14) {
      objc_storeStrong((id *)&v14->_fingerPrint, v3);
    }
    self = v15;
    v3 = self;
  }

  if (!v13) {
LABEL_9:
  }
    v3 = 0;

  return v3;
}

- (_CPLCloudKitFakeFingerPrint)initWithRealResourceType:(unint64_t)a3 realFingerPrint:(id)a4 outputType:(id)a5 dimensions:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_CPLCloudKitFakeFingerPrint;
  v14 = [(_CPLCloudKitFakeFingerPrint *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_realResourceType = a3;
    objc_storeStrong((id *)&v14->_realFingerPrint, a4);
    objc_storeStrong((id *)&v15->_outputType, a5);
    v15->_dimensions.CGFloat width = width;
    v15->_dimensions.CGFloat height = height;
  }

  return v15;
}

- (NSString)fingerPrint
{
  fingerPrint = self->_fingerPrint;
  if (!fingerPrint)
  {
    id v4 = objc_alloc((Class)NSString);
    id v5 = +[CPLResource shortDescriptionForResourceType:self->_realResourceType];
    realFingerPrint = self->_realFingerPrint;
    outputType = self->_outputType;
    v8 = NSStringFromSize(self->_dimensions);
    v9 = (NSString *)[v4 initWithFormat:@"^%@^%@^%@^%@", v5, realFingerPrint, outputType, v8];
    v10 = self->_fingerPrint;
    self->_fingerPrint = v9;

    fingerPrint = self->_fingerPrint;
  }
  return fingerPrint;
}

- (CPLResourceIdentity)fakeIdentity
{
  id v3 = objc_alloc_init((Class)CPLResourceIdentity);
  [v3 setFileUTI:self->_outputType];
  id v4 = [(_CPLCloudKitFakeFingerPrint *)self fingerPrint];
  [v3 setFingerPrint:v4];

  objc_msgSend(v3, "setImageDimensions:", self->_dimensions.width, self->_dimensions.height);
  [v3 setAvailable:1];
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  v7 = self->_outputType;
  if (qword_1002CE630 != -1) {
    dispatch_once(&qword_1002CE630, &stru_100278060);
  }
  v8 = [(id)qword_1002CE628 objectForKeyedSubscript:v7];
  v9 = v8;
  if (v8) {
    [v8 doubleValue];
  }
  else {
    double v10 = 4.19265652;
  }
  double v11 = height * (width * v10);
  if (v11 < 10240.0) {
    double v11 = 10240.0;
  }
  unint64_t v12 = (unint64_t)v11;

  [v3 setFileSize:v12];
  return (CPLResourceIdentity *)v3;
}

- (unint64_t)realResourceType
{
  return self->_realResourceType;
}

- (NSString)realFingerPrint
{
  return self->_realFingerPrint;
}

- (NSString)outputType
{
  return self->_outputType;
}

- (CGSize)dimensions
{
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_realFingerPrint, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
}

@end