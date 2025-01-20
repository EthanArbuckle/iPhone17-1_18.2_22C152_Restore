@interface VNSaliencyExtrema
- (CGRect)computeRectFromExtremaUsingThreshold:(float)a3 vImage:(vImage_Buffer *)a4;
- (VNSaliencyExtrema)init;
- (void)updateExtrema:(float)a3 x:(int)a4 y:(int)a5;
@end

@implementation VNSaliencyExtrema

- (CGRect)computeRectFromExtremaUsingThreshold:(float)a3 vImage:(vImage_Buffer *)a4
{
  double x = self->_extrema[0].x;
  float v7 = x;
  if (v7 > 0.0 && v7 < 3.4028e38)
  {
    float y = self->_extrema[0].y;
    v10 = (char *)a4->data + a4->rowBytes * y;
    float v11 = *(float *)&v10[4 * (float)(v7 + -1.0)];
    double x = x - (float)(1.0 - (float)((float)(a3 - v11) / (float)(*(float *)&v10[4 * v7] - v11)));
    self->_extrema[0].double x = x;
  }
  double v12 = self->_extrema[1].x;
  float v13 = v12;
  if (v13 > -1.0 && v13 < (float)(a4->width - 1))
  {
    float v15 = self->_extrema[1].y;
    v16 = (char *)a4->data + a4->rowBytes * v15;
    float v17 = *(float *)&v16[4 * (float)(v13 + 1.0)];
    double v12 = v12 + (float)(1.0 - (float)((float)(a3 - v17) / (float)(*(float *)&v16[4 * v13] - v17)));
    self->_extrema[1].double x = v12;
  }
  double v18 = self->_extrema[2].y;
  float v19 = v18;
  if (v19 > 0.0 && v19 < 3.4028e38)
  {
    float v21 = self->_extrema[2].x;
    unsigned int v22 = v21;
    size_t rowBytes = a4->rowBytes;
    float v24 = *(float *)((char *)a4->data + 4 * v21 + rowBytes * (float)(v19 + -1.0));
    double v18 = v18
        - (float)(1.0
                - (float)((float)(a3 - v24)
                        / (float)(*(float *)((char *)a4->data + 4 * v22 + rowBytes * v19) - v24)));
    self->_extrema[2].float y = v18;
  }
  double v25 = self->_extrema[3].y;
  float v26 = v25;
  if (v26 > -1.0 && v26 < (float)(a4->height - 1))
  {
    float v28 = self->_extrema[3].x;
    size_t v29 = a4->rowBytes;
    float v30 = *(float *)((char *)a4->data + 4 * v28 + v29 * (float)(v26 + 1.0));
    double v25 = v25
        + (float)(1.0
                - (float)((float)(a3 - v30)
                        / (float)(*(float *)((char *)a4->data + 4 * v28 + v29 * v26) - v30)));
    self->_extrema[3].float y = v25;
  }
  double v31 = v12 - x;
  double v32 = v25 - v18;
  CGRect v51 = CGRectStandardize(*(CGRect *)&x);
  CGRect v52 = CGRectInset(v51, v51.size.width * -0.05, v51.size.height * -0.05);
  v55.size.double width = (double)(a4->width - 1);
  v55.size.double height = (double)(a4->height - 1);
  double v33 = 0.0;
  v55.origin.double x = 0.0;
  v55.origin.float y = 0.0;
  CGRect v53 = CGRectIntersection(v52, v55);
  double v34 = v53.origin.x;
  double width = v53.size.width;
  double height = v53.size.height;
  double v37 = (float)a4->height - (v53.origin.y + v53.size.height);
  v53.origin.float y = v37;
  BOOL IsNull = CGRectIsNull(v53);
  double v39 = 1.0;
  double v40 = 0.0;
  double v41 = 1.0;
  if (!IsNull)
  {
    vImagePixelCount v42 = a4->height;
    vImagePixelCount v43 = a4->width;
    double v44 = 0.0;
    double v45 = 0.0;
    double v46 = 0.0;
    if (v43)
    {
      double v45 = v34 / (double)v43;
      double v46 = width / (double)v43;
    }
    double v47 = 0.0;
    if (v42)
    {
      double v44 = v37 / (double)v42;
      double v47 = height / (double)v42;
    }
    uint64_t v48 = 0;
    *(CGRect *)(&v40 - 1) = CGRectIntersection(*(CGRect *)(&v40 - 1), *(CGRect *)&v45);
    double v33 = v49;
  }
  double v50 = v33;
  result.size.double height = v41;
  result.size.double width = v39;
  result.origin.float y = v40;
  result.origin.double x = v50;
  return result;
}

- (void)updateExtrema:(float)a3 x:(int)a4 y:(int)a5
{
  double v5 = (double)a4;
  double x = self->_extrema[0].x;
  if (x > (double)a4 || x == (double)a4 && self->_extremeValues[0] < a3)
  {
    self->_extrema[0].double x = v5;
    self->_extrema[0].double y = (double)a5;
    self->_extremeValues[0] = a3;
  }
  double v7 = self->_extrema[1].x;
  if (v7 < v5 || v7 == v5 && self->_extremeValues[1] < a3)
  {
    self->_extrema[1].double x = v5;
    self->_extrema[1].double y = (double)a5;
    self->_extremeValues[1] = a3;
  }
  double v8 = (double)a5;
  double y = self->_extrema[2].y;
  if (y > (double)a5 || y == (double)a5 && self->_extremeValues[2] < a3)
  {
    self->_extrema[2].double x = v5;
    self->_extrema[2].double y = v8;
    self->_extremeValues[2] = a3;
  }
  double v10 = self->_extrema[3].y;
  if (v10 < v8 || v10 == v8 && self->_extremeValues[3] < a3)
  {
    self->_extrema[3].double x = v5;
    self->_extrema[3].double y = v8;
    self->_extremeValues[3] = a3;
  }
}

- (VNSaliencyExtrema)init
{
  v6.receiver = self;
  v6.super_class = (Class)VNSaliencyExtrema;
  v2 = [(VNSaliencyExtrema *)&v6 init];
  v3 = (VNSaliencyExtrema *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_1A410C200;
    *((void *)v2 + 4) = 0;
    *((void *)v2 + 5) = 0;
    *((void *)v2 + 3) = 0xBFF0000000000000;
    *((_OWORD *)v2 + 3) = xmmword_1A410C200;
    *((void *)v2 + 8) = 0xBFF0000000000000;
    v4 = v2;
  }

  return v3;
}

@end