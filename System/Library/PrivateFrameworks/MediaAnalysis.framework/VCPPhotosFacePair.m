@interface VCPPhotosFacePair
+ (id)pairWithFace:(id)a3 andFace:(id)a4 distance:(double)a5;
- (VCPPhotosFace)face1;
- (VCPPhotosFace)face2;
- (VCPPhotosFacePair)initWithFace:(id)a3 andFace:(id)a4 distance:(double)a5;
- (double)distance;
@end

@implementation VCPPhotosFacePair

- (VCPPhotosFacePair)initWithFace:(id)a3 andFace:(id)a4 distance:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCPPhotosFacePair;
  v11 = [(VCPPhotosFacePair *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_face1, a3);
    objc_storeStrong((id *)&v12->_face2, a4);
    v12->_distance = a5;
  }

  return v12;
}

+ (id)pairWithFace:(id)a3 andFace:(id)a4 distance:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFace:v8 andFace:v7 distance:a5];

  return v9;
}

- (VCPPhotosFace)face1
{
  return self->_face1;
}

- (VCPPhotosFace)face2
{
  return self->_face2;
}

- (double)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face2, 0);
  objc_storeStrong((id *)&self->_face1, 0);
}

@end