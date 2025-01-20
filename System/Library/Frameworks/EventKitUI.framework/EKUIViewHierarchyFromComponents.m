@interface EKUIViewHierarchyFromComponents
+ (BOOL)supportsSecureCoding;
- (CGAffineTransform)ekui_affineTransform;
- (CGSize)ekui_size;
- (EKUIViewHierarchy)ekui_rootViewHierarchy;
- (EKUIViewHierarchyFromComponents)initWithCoder:(id)a3;
- (EKUIViewHierarchyFromComponents)initWithSize:(CGSize)a3 verticalSizeClass:(int64_t)a4 horizontalSizeClass:(int64_t)a5 interfaceOrientation:(int64_t)a6 tintColor:(id)a7 affineTranform:(CGAffineTransform *)a8;
- (UIColor)ekui_tintColor;
- (double)ekui_height;
- (double)ekui_width;
- (int64_t)ekui_horizontalSizeClass;
- (int64_t)ekui_interfaceOrientation;
- (int64_t)ekui_verticalSizeClass;
- (void)encodeWithCoder:(id)a3;
- (void)setEkui_affineTransform:(CGAffineTransform *)a3;
- (void)setEkui_height:(double)a3;
- (void)setEkui_horizontalSizeClass:(int64_t)a3;
- (void)setEkui_interfaceOrientation:(int64_t)a3;
- (void)setEkui_rootViewHierarchy:(id)a3;
- (void)setEkui_size:(CGSize)a3;
- (void)setEkui_tintColor:(id)a3;
- (void)setEkui_verticalSizeClass:(int64_t)a3;
- (void)setEkui_width:(double)a3;
@end

@implementation EKUIViewHierarchyFromComponents

- (EKUIViewHierarchyFromComponents)initWithSize:(CGSize)a3 verticalSizeClass:(int64_t)a4 horizontalSizeClass:(int64_t)a5 interfaceOrientation:(int64_t)a6 tintColor:(id)a7 affineTranform:(CGAffineTransform *)a8
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)EKUIViewHierarchyFromComponents;
  v17 = [(EKUIViewHierarchyFromComponents *)&v23 init];
  v18 = v17;
  if (v17)
  {
    v17->_ekui_size.CGFloat width = width;
    v17->_ekui_size.CGFloat height = height;
    v17->_ekui_CGFloat width = width;
    v17->_ekui_CGFloat height = height;
    ekui_rootViewHierarchy = v17->_ekui_rootViewHierarchy;
    v17->_ekui_rootViewHierarchy = 0;

    v18->_ekui_horizontalSizeClass = a5;
    v18->_ekui_verticalSizeClass = a4;
    v18->_ekui_interfaceOrientation = a6;
    objc_storeStrong((id *)&v18->_ekui_tintColor, a7);
    long long v20 = *(_OWORD *)&a8->a;
    long long v21 = *(_OWORD *)&a8->tx;
    *(_OWORD *)&v18->_ekui_affineTransform.c = *(_OWORD *)&a8->c;
    *(_OWORD *)&v18->_ekui_affineTransform.tx = v21;
    *(_OWORD *)&v18->_ekui_affineTransform.a = v20;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EKUIViewHierarchyFromComponents)initWithCoder:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)EKUIViewHierarchyFromComponents;
  v6 = [(EKUIViewHierarchyFromComponents *)&v36 init];
  if (v6)
  {
    [v5 decodeCGSizeForKey:@"size"];
    v6->_ekui_size.CGFloat width = v7;
    v6->_ekui_size.CGFloat height = v8;
    v6->_ekui_CGFloat width = v7;
    v6->_ekui_CGFloat height = v8;
    ekui_rootViewHierarchy = v6->_ekui_rootViewHierarchy;
    v6->_ekui_rootViewHierarchy = 0;

    v6->_ekui_verticalSizeClass = [v5 decodeIntegerForKey:@"verticalSizeClass"];
    v6->_ekui_horizontalSizeClass = [v5 decodeIntegerForKey:@"horizontalSizeClass"];
    v6->_ekui_interfaceOrientation = [v5 decodeIntegerForKey:@"interfaceOrientation"];
    uint64_t v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    ekui_tintColor = v6->_ekui_tintColor;
    v6->_ekui_tintColor = (UIColor *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v5 decodeObjectOfClasses:v14 forKey:@"affineTransform"];

    if ([v15 count] == 6)
    {
      id v16 = [v15 objectAtIndexedSubscript:0];
      [v16 floatValue];
      CGFloat v18 = v17;
      v19 = [v15 objectAtIndexedSubscript:1];
      [v19 floatValue];
      CGFloat v21 = v20;
      v22 = [v15 objectAtIndexedSubscript:2];
      [v22 floatValue];
      CGFloat v24 = v23;
      v25 = [v15 objectAtIndexedSubscript:3];
      [v25 floatValue];
      CGFloat v27 = v26;
      v28 = [v15 objectAtIndexedSubscript:4];
      [v28 floatValue];
      CGFloat v30 = v29;
      v31 = [v15 objectAtIndexedSubscript:5];
      [v31 floatValue];
      CGFloat v33 = v32;

      v6->_ekui_affineTransform.a = v18;
      v6->_ekui_affineTransform.b = v21;
      v6->_ekui_affineTransform.c = v24;
      v6->_ekui_affineTransform.d = v27;
      v6->_ekui_affineTransform.tx = v30;
      v6->_ekui_affineTransform.ty = v33;
    }
    else
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2 object:v6 file:@"EKUIViewHierarchy.m" lineNumber:135 description:@"affineTransform serialized array must only contain 6 elements"];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v14[6] = *MEMORY[0x1E4F143B8];
  double width = self->_ekui_size.width;
  double height = self->_ekui_size.height;
  id v6 = a3;
  objc_msgSend(v6, "encodeCGSize:forKey:", @"size", width, height);
  [v6 encodeInteger:self->_ekui_verticalSizeClass forKey:@"verticalSizeClass"];
  [v6 encodeInteger:self->_ekui_horizontalSizeClass forKey:@"horizontalSizeClass"];
  [v6 encodeInteger:self->_ekui_interfaceOrientation forKey:@"interfaceOrientation"];
  [v6 encodeObject:self->_ekui_tintColor forKey:@"tintColor"];
  CGFloat v7 = [NSNumber numberWithDouble:self->_ekui_affineTransform.a];
  v14[0] = v7;
  CGFloat v8 = [NSNumber numberWithDouble:self->_ekui_affineTransform.b];
  v14[1] = v8;
  v9 = [NSNumber numberWithDouble:self->_ekui_affineTransform.c];
  v14[2] = v9;
  uint64_t v10 = [NSNumber numberWithDouble:self->_ekui_affineTransform.d];
  v14[3] = v10;
  v11 = [NSNumber numberWithDouble:self->_ekui_affineTransform.tx];
  v14[4] = v11;
  v12 = [NSNumber numberWithDouble:self->_ekui_affineTransform.ty];
  v14[5] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:6];

  [v6 encodeObject:v13 forKey:@"affineTransform"];
}

- (CGSize)ekui_size
{
  double width = self->_ekui_size.width;
  double height = self->_ekui_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEkui_size:(CGSize)a3
{
  self->_ekui_size = a3;
}

- (double)ekui_width
{
  return self->_ekui_width;
}

- (void)setEkui_width:(double)a3
{
  self->_ekui_double width = a3;
}

- (double)ekui_height
{
  return self->_ekui_height;
}

- (void)setEkui_height:(double)a3
{
  self->_ekui_double height = a3;
}

- (EKUIViewHierarchy)ekui_rootViewHierarchy
{
  return self->_ekui_rootViewHierarchy;
}

- (void)setEkui_rootViewHierarchy:(id)a3
{
}

- (int64_t)ekui_horizontalSizeClass
{
  return self->_ekui_horizontalSizeClass;
}

- (void)setEkui_horizontalSizeClass:(int64_t)a3
{
  self->_ekui_horizontalSizeClass = a3;
}

- (int64_t)ekui_verticalSizeClass
{
  return self->_ekui_verticalSizeClass;
}

- (void)setEkui_verticalSizeClass:(int64_t)a3
{
  self->_ekui_verticalSizeClass = a3;
}

- (int64_t)ekui_interfaceOrientation
{
  return self->_ekui_interfaceOrientation;
}

- (void)setEkui_interfaceOrientation:(int64_t)a3
{
  self->_ekui_interfaceOrientation = a3;
}

- (UIColor)ekui_tintColor
{
  return self->_ekui_tintColor;
}

- (void)setEkui_tintColor:(id)a3
{
}

- (CGAffineTransform)ekui_affineTransform
{
  long long v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (void)setEkui_affineTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_ekui_affineTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_ekui_affineTransform.tx = v4;
  *(_OWORD *)&self->_ekui_affineTransform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ekui_tintColor, 0);

  objc_storeStrong((id *)&self->_ekui_rootViewHierarchy, 0);
}

@end