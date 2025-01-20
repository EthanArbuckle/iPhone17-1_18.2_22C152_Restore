@interface CHReflowableSynthesisResultToken
- (CHDrawing)drawing;
- (CHReflowableSynthesisResultToken)initWithDrawing:(id)a3 string:(id)a4 principalLines:(id *)a5 textSize:(id)a6 bounds:(CGRect)a7 hasPrecedingSpace:(BOOL)a8;
- (CHReflowableSynthesisResultToken)initWithSynthesisResult:(id)a3 principalLines:(id *)a4 textSize:(id)a5 bounds:(CGRect)a6 hasPrecedingSpace:(BOOL)a7;
@end

@implementation CHReflowableSynthesisResultToken

- (CHReflowableSynthesisResultToken)initWithSynthesisResult:(id)a3 principalLines:(id *)a4 textSize:(id)a5 bounds:(CGRect)a6 hasPrecedingSpace:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v15 = a3;
  id v16 = a5;
  v22 = objc_msgSend_drawing(v15, v17, v18, v19, v20, v21);
  v28 = objc_msgSend_content(v15, v23, v24, v25, v26, v27);
  CGPoint var1 = a4->var2.var1;
  v36[4] = a4->var2.var0;
  v36[5] = var1;
  CGPoint v30 = a4->var3.var1;
  v36[6] = a4->var3.var0;
  v36[7] = v30;
  CGPoint v31 = a4->var0.var1;
  v36[0] = a4->var0.var0;
  v36[1] = v31;
  CGPoint v32 = a4->var1.var1;
  v36[2] = a4->var1.var0;
  v36[3] = v32;
  hasPrecedingSpace = (CHReflowableSynthesisResultToken *)objc_msgSend_initWithDrawing_string_principalLines_textSize_bounds_hasPrecedingSpace_(self, v33, (uint64_t)v22, (uint64_t)v28, (uint64_t)v36, (uint64_t)v16, v7, x, y, width, height);

  return hasPrecedingSpace;
}

- (CHReflowableSynthesisResultToken)initWithDrawing:(id)a3 string:(id)a4 principalLines:(id *)a5 textSize:(id)a6 bounds:(CGRect)a7 hasPrecedingSpace:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  CGPoint var1 = a5->var2.var1;
  v34[4] = a5->var2.var0;
  v34[5] = var1;
  CGPoint v21 = a5->var3.var1;
  v34[6] = a5->var3.var0;
  v34[7] = v21;
  CGPoint v22 = a5->var0.var1;
  v34[0] = a5->var0.var0;
  v34[1] = v22;
  CGPoint v23 = a5->var1.var1;
  v34[2] = a5->var1.var0;
  v34[3] = v23;
  v33.receiver = self;
  v33.super_class = (Class)CHReflowableSynthesisResultToken;
  v29 = -[CHReflowableTextToken initWithString:principalLines:textSize:bounds:hasPrecedingSpace:](&v33, sel_initWithString_principalLines_textSize_bounds_hasPrecedingSpace_, v18, v34, v19, v8, x, y, width, height);
  if (v29)
  {
    uint64_t v30 = objc_msgSend_copy(v17, v24, v25, v26, v27, v28);
    drawing = v29->_drawing;
    v29->_drawing = (CHDrawing *)v30;
  }
  return v29;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (void).cxx_destruct
{
}

@end