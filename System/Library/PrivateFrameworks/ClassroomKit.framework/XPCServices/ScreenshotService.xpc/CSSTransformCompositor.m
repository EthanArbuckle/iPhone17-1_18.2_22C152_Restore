@interface CSSTransformCompositor
- (CGAffineTransform)composedTransform;
- (CSSTransformCompositor)init;
- (NSMutableArray)transforms;
- (void)appendTransform:(CGAffineTransform *)a3;
@end

@implementation CSSTransformCompositor

- (CSSTransformCompositor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSSTransformCompositor;
  v2 = [(CSSTransformCompositor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    transforms = v2->_transforms;
    v2->_transforms = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)appendTransform:(CGAffineTransform *)a3
{
  v4 = [(CSSTransformCompositor *)self transforms];
  long long v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  objc_super v6 = +[NSValue valueWithCGAffineTransform:v7];
  [v4 addObject:v6];
}

- (CGAffineTransform)composedTransform
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x5010000000;
  v13 = "";
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v14 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v15 = v4;
  long long v16 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v5 = [(CSSTransformCompositor *)self transforms];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000033CC;
  v9[3] = &unk_10000C570;
  v9[4] = &v10;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v9];

  objc_super v6 = v11;
  long long v7 = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v11 + 2);
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v6 + 4);
  _Block_object_dispose(&v10, 8);
  return result;
}

- (NSMutableArray)transforms
{
  return self->_transforms;
}

- (void).cxx_destruct
{
}

@end