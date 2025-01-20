@interface ACUISActivitySceneMetrics
- (ACUISActivitySceneMetrics)initWithSceneMetrics:(id)a3;
- (ACUISActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4;
- (ACUISActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 edgeInsets:(id)a5;
- (ACUISEdgeInsets)edgeInsets;
- (CGSize)size;
- (double)cornerRadius;
- (id)_ActivitySceneMetrics;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation ACUISActivitySceneMetrics

- (ACUISActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 edgeInsets:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACUISActivitySceneMetrics;
  v11 = [(ACUISActivitySceneMetrics *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_size.CGFloat width = width;
    v11->_size.CGFloat height = height;
    v11->_cornerRadius = a4;
    objc_storeStrong((id *)&v11->_edgeInsets, a5);
  }

  return v12;
}

- (ACUISActivitySceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  return -[ACUISActivitySceneMetrics initWithSize:cornerRadius:edgeInsets:](self, "initWithSize:cornerRadius:edgeInsets:", 0, a3.width, a3.height, a4);
}

- (ACUISActivitySceneMetrics)initWithSceneMetrics:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACUISActivitySceneMetrics;
  v5 = [(ACUISActivitySceneMetrics *)&v14 init];
  if (v5)
  {
    [v4 size];
    v5->_size.CGFloat width = v6;
    v5->_size.CGFloat height = v7;
    [v4 cornerRadius];
    v5->_cornerRadius = v8;
    v9 = [ACUISEdgeInsets alloc];
    id v10 = [v4 edgeInsets];
    uint64_t v11 = [(ACUISEdgeInsets *)v9 _initWithEdgeInsets:v10];
    edgeInsets = v5->_edgeInsets;
    v5->_edgeInsets = (ACUISEdgeInsets *)v11;
  }
  return v5;
}

- (id)_ActivitySceneMetrics
{
  v3 = [_TtC18ActivityUIServices20ActivitySceneMetrics alloc];
  [(ACUISActivitySceneMetrics *)self size];
  double v5 = v4;
  double v7 = v6;
  [(ACUISActivitySceneMetrics *)self cornerRadius];
  double v9 = v8;
  id v10 = [(ACUISActivitySceneMetrics *)self edgeInsets];
  uint64_t v11 = [v10 _edgeInsets];
  v12 = -[ActivitySceneMetrics initWithSize:cornerRadius:edgeInsets:](v3, "initWithSize:cornerRadius:edgeInsets:", v11, v5, v7, v9);

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = [ACUISMutableActivitySceneMetrics alloc];
  [(ACUISActivitySceneMetrics *)self size];
  double v6 = v5;
  double v8 = v7;
  [(ACUISActivitySceneMetrics *)self cornerRadius];
  double v10 = v9;
  uint64_t v11 = [(ACUISActivitySceneMetrics *)self edgeInsets];
  v12 = -[ACUISActivitySceneMetrics initWithSize:cornerRadius:edgeInsets:](v4, "initWithSize:cornerRadius:edgeInsets:", v11, v6, v8, v10);

  return v12;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (ACUISEdgeInsets)edgeInsets
{
  return self->_edgeInsets;
}

- (void).cxx_destruct
{
}

@end