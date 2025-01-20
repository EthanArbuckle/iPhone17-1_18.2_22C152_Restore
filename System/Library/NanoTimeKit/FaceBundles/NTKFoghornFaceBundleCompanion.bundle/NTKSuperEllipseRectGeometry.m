@interface NTKSuperEllipseRectGeometry
- (NTKSuperEllipseRectGeometry)initWithWidth:(double)a3 height:(double)a4 a:(double)a5 b:(double)a6 n:(double)a7 nDatum:(unint64_t)a8;
- (id)initForDevice:(id)a3 tangentialInset:(double)a4;
- (void)dealloc;
@end

@implementation NTKSuperEllipseRectGeometry

- (NTKSuperEllipseRectGeometry)initWithWidth:(double)a3 height:(double)a4 a:(double)a5 b:(double)a6 n:(double)a7 nDatum:(unint64_t)a8
{
  unsigned int v8 = a8;
  v16.receiver = self;
  v16.super_class = (Class)NTKSuperEllipseRectGeometry;
  v14 = [(NTKSuperEllipseRectGeometry *)&v16 init];
  if (v14) {
    v14->_superEllipseData = (NTKSuperEllipseRect *)NTKSuperEllipseRectNew(v8, a3, a4, a5, a6, a7);
  }
  return v14;
}

- (id)initForDevice:(id)a3 tangentialInset:(double)a4
{
  id v6 = a3;
  if (objc_msgSend_sizeClass(v6, v7, v8, v9) != 6)
  {
    objc_msgSend_logObject(NTKFoghornFaceBundle, v10, v11, v12);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_246B1FC1C(v6, v13, v14, v15);
    }
  }
  objc_super v16 = objc_msgSend_initWithWidth_height_a_b_n_nDatum_(self, v10, 60, v12, a4 * -2.0 + 205.0, a4 * -2.0 + 251.0, 67.5 - a4, 66.0 - a4, 2.535664);

  return v16;
}

- (void)dealloc
{
  superEllipseData = self->_superEllipseData;
  if (superEllipseData && !self->_superEllipseDataIsConst)
  {
    NTKSuperEllipseRectDestroy(superEllipseData);
    self->_superEllipseData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKSuperEllipseRectGeometry;
  [(NTKSuperEllipseRectGeometry *)&v4 dealloc];
}

@end