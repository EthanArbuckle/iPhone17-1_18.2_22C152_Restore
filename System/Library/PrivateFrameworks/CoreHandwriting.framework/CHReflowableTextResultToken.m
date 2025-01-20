@interface CHReflowableTextResultToken
- (CHReflowableTextResultToken)initWithString:(id)a3 strokeIdentifiers:(id)a4 nonTextStrokeIdentifiers:(id)a5 principalLines:(id *)a6 textSize:(id)a7 bounds:(CGRect)a8 hasPrecedingSpace:(BOOL)a9;
- (NSArray)nonTextStrokeIdentifiers;
- (NSArray)strokeIdentifiers;
- (id)description;
@end

@implementation CHReflowableTextResultToken

- (CHReflowableTextResultToken)initWithString:(id)a3 strokeIdentifiers:(id)a4 nonTextStrokeIdentifiers:(id)a5 principalLines:(id *)a6 textSize:(id)a7 bounds:(CGRect)a8 hasPrecedingSpace:(BOOL)a9
{
  BOOL v9 = a9;
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a7;
  CGPoint var1 = a6->var2.var1;
  v44[4] = a6->var2.var0;
  v44[5] = var1;
  CGPoint v24 = a6->var3.var1;
  v44[6] = a6->var3.var0;
  v44[7] = v24;
  CGPoint v25 = a6->var0.var1;
  v44[0] = a6->var0.var0;
  v44[1] = v25;
  CGPoint v26 = a6->var1.var1;
  v44[2] = a6->var1.var0;
  v44[3] = v26;
  v43.receiver = self;
  v43.super_class = (Class)CHReflowableTextResultToken;
  v32 = -[CHReflowableTextToken initWithString:principalLines:textSize:bounds:hasPrecedingSpace:](&v43, sel_initWithString_principalLines_textSize_bounds_hasPrecedingSpace_, v19, v44, v22, v9, x, y, width, height);
  if (v32)
  {
    uint64_t v33 = objc_msgSend_copy(v20, v27, v28, v29, v30, v31);
    strokeIdentifiers = v32->_strokeIdentifiers;
    v32->_strokeIdentifiers = (NSArray *)v33;

    uint64_t v40 = objc_msgSend_copy(v21, v35, v36, v37, v38, v39);
    nonTextStrokeIdentifiers = v32->_nonTextStrokeIdentifiers;
    v32->_nonTextStrokeIdentifiers = (NSArray *)v40;
  }
  return v32;
}

- (id)description
{
  v7 = NSString;
  v8 = objc_msgSend_strokeIdentifiers(self, a2, v2, v3, v4, v5);
  uint64_t v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);
  id v20 = objc_msgSend_nonTextStrokeIdentifiers(self, v15, v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_stringWithFormat_(v7, v27, @"(ReflowableToken Text:%lu, NonText:%lu), ", v28, v29, v30, v14, v26);

  return v31;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (NSArray)nonTextStrokeIdentifiers
{
  return self->_nonTextStrokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonTextStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end