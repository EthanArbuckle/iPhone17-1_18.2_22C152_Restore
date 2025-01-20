@interface SSSScreenshotModificationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)annotations;
- (NSArray)originalAnnotations;
- (NSString)imageDescription;
- (SSSCropInfo)cropInfo;
- (SSSScreenshotModificationInfo)initWithCoder:(id)a3;
- (double)vellumOpacity;
- (id)annotationNSDatas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForScreenshotWithEnvironmentDescription:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)paperKitChangeCounter;
@end

@implementation SSSScreenshotModificationInfo

- (id)initForScreenshotWithEnvironmentDescription:(id)a3
{
  v4 = (SSEnvironmentDescription *)a3;
  v17.receiver = self;
  v17.super_class = (Class)SSSScreenshotModificationInfo;
  v5 = [(SSSScreenshotModificationInfo *)&v17 init];
  environmentDescription = v5->_environmentDescription;
  v5->_environmentDescription = v4;
  v7 = v4;

  [(SSEnvironmentDescription *)v7 imagePointSize];
  sub_10004C7F4((uint64_t)v16, v8, v9);
  CGPoint v11 = (CGPoint)v16[1];
  CGSize v10 = (CGSize)v16[2];
  v5->_cropInfo.totalSize = (CGSize)v16[0];
  v5->_cropInfo.currentRect.origin = v11;
  v5->_cropInfo.currentRect.size = v10;
  annotationNSDatas = v5->_annotationNSDatas;
  v5->_annotationNSDatas = (NSArray *)&__NSArray0__struct;

  v5->_vellumOpacity = 0.0;
  uint64_t v13 = +[NSArray array];
  originalAnnotations = v5->_originalAnnotations;
  v5->_originalAnnotations = (NSArray *)v13;

  v5->_paperKitChangeCounter = 0;
  return v5;
}

- (SSSCropInfo)cropInfo
{
  CGPoint size = (CGPoint)self->currentRect.size;
  retstr->totalSize = (CGSize)self->currentRect.origin;
  retstr->currentRect.origin = size;
  retstr->currentRect.CGPoint size = self[1].totalSize;
  return self;
}

- (NSArray)annotations
{
  v2 = [(SSSScreenshotModificationInfo *)self annotationNSDatas];
  v3 = +[_SSSScreenshotAnnotationController annotationsFromAnnotationData:v2];

  return (NSArray *)v3;
}

- (id)annotationNSDatas
{
  return self->_annotationNSDatas;
}

- (double)vellumOpacity
{
  return self->_vellumOpacity;
}

- (NSString)imageDescription
{
  return self->_imageDescription;
}

- (SSSScreenshotModificationInfo)initWithCoder:(id)a3
{
  return [(SSSScreenshotModificationInfo *)self init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    v6 = v5;
    if (v5[12] != self->_paperKitChangeCounter) {
      goto LABEL_10;
    }
    if (![v5[1] isEqual:self->_environmentDescription]) {
      goto LABEL_10;
    }
    [v6 cropInfo];
    [(SSSScreenshotModificationInfo *)self cropInfo];
    if (!sub_10004C814((uint64_t)v20, (uint64_t)&v19)) {
      goto LABEL_10;
    }
    v7 = [v6 annotationNSDatas];
    double v8 = [(SSSScreenshotModificationInfo *)self annotationNSDatas];
    unsigned int v9 = [v7 isEqual:v8];

    if (!v9) {
      goto LABEL_10;
    }
    [v6 vellumOpacity];
    double v11 = v10;
    [(SSSScreenshotModificationInfo *)self vellumOpacity];
    if (v11 == v12)
    {
      uint64_t v13 = [v6 imageDescription];
      v14 = [(SSSScreenshotModificationInfo *)self imageDescription];
      if (v13 == v14)
      {
        unsigned __int8 v17 = 1;
      }
      else
      {
        v15 = [v6 imageDescription];
        v16 = [(SSSScreenshotModificationInfo *)self imageDescription];
        unsigned __int8 v17 = [v15 isEqualToString:v16];
      }
    }
    else
    {
LABEL_10:
      unsigned __int8 v17 = 0;
    }
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_environmentDescription);
  [(SSSScreenshotModificationInfo *)self cropInfo];
  long long v6 = v19;
  long long v5 = v20;
  *((_OWORD *)v4 + 1) = v18;
  *((_OWORD *)v4 + 2) = v6;
  *((_OWORD *)v4 + 3) = v5;
  v7 = [(SSSScreenshotModificationInfo *)self annotationNSDatas];
  id v8 = [v7 copy];
  id v9 = v4[8];
  v4[8] = v8;

  [(SSSScreenshotModificationInfo *)self vellumOpacity];
  v4[9] = v10;
  double v11 = [(SSSScreenshotModificationInfo *)self originalAnnotations];
  id v12 = [v11 copy];
  id v13 = v4[10];
  v4[10] = v12;

  v14 = [(SSSScreenshotModificationInfo *)self imageDescription];
  id v15 = [v14 copy];
  id v16 = v4[11];
  v4[11] = v15;

  v4[12] = self->_paperKitChangeCounter;
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(SSSScreenshotModificationInfo *)[SSSScreenshotMutableModificationInfo alloc] initForScreenshotWithEnvironmentDescription:self->_environmentDescription];
  [(SSSScreenshotModificationInfo *)self cropInfo];
  [v4 setCropInfo:&v11];
  long long v5 = [(SSSScreenshotModificationInfo *)self annotationNSDatas];
  [v4 setAnnotationNSDatas:v5];

  [(SSSScreenshotModificationInfo *)self vellumOpacity];
  [v4 setVellumOpacity:];
  long long v6 = [(SSSScreenshotModificationInfo *)self originalAnnotations];
  id v7 = [v6 mutableCopy];
  [v4 setOriginalAnnotations:v7];

  id v8 = [(SSSScreenshotModificationInfo *)self imageDescription];
  id v9 = [v8 copy];
  [v4 setImageDescription:v9];

  [v4 setPaperKitChangeCounter:[self paperKitChangeCounter]];
  return v4;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)SSSScreenshotModificationInfo;
  v3 = [(SSSScreenshotModificationInfo *)&v9 description];
  CGPoint origin = self->_cropInfo.currentRect.origin;
  v8[0] = self->_cropInfo.totalSize;
  v8[1] = (CGSize)origin;
  v8[2] = self->_cropInfo.currentRect.size;
  long long v5 = sub_10004C924(v8);
  long long v6 = +[NSString stringWithFormat:@"%@, %@", v3, v5];

  return v6;
}

- (NSArray)originalAnnotations
{
  return self->_originalAnnotations;
}

- (unint64_t)paperKitChangeCounter
{
  return self->_paperKitChangeCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_originalAnnotations, 0);
  objc_storeStrong((id *)&self->_annotationNSDatas, 0);

  objc_storeStrong((id *)&self->_environmentDescription, 0);
}

@end