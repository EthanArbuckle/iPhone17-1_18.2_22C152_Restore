@interface ADDynamicPolynomialsLensDistortionModel
- (ADDynamicPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 dynFactor:(float)a4 polynomialsBase:(const ADDistortionPolynomials *)a5 polynomialsDynamic:(const ADDistortionPolynomials *)a6;
- (BOOL)isEqual:(id)a3;
- (const)distortionPolynomialsBase;
- (const)distortionPolynomialsDynamic;
- (float)dynamicFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setDistortionPolynomials:(const ADDistortionPolynomials *)a3;
- (void)setDistortionPolynomialsBase:(const ADDistortionPolynomials *)a3;
- (void)setDistortionPolynomialsDynamic:(const ADDistortionPolynomials *)a3;
- (void)setDynamicFactor:(float)a3;
- (void)updatePolynomials;
@end

@implementation ADDynamicPolynomialsLensDistortionModel

- (float)dynamicFactor
{
  return self->_dynamicFactor;
}

- (ADDynamicPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 dynFactor:(float)a4 polynomialsBase:(const ADDistortionPolynomials *)a5 polynomialsDynamic:(const ADDistortionPolynomials *)a6
{
  if (!a5 || !a6)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF4A0], @"distortion polynomials cannot be nil", 0, a3.x, a3.y);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  double y = a3.y;
  double x = a3.x;
  v21.receiver = self;
  v21.super_class = (Class)ADDynamicPolynomialsLensDistortionModel;
  v11 = [(ADDynamicPolynomialsLensDistortionModel *)&v21 init];
  v12 = v11;
  if (v11)
  {
    -[ADPolynomialsLensDistortionModel setDistortionCenter:](v11, "setDistortionCenter:", x, y);
    long long v13 = *(_OWORD *)&a5->inverseOrders[4];
    long long v15 = *(_OWORD *)a5->forwardOrders;
    long long v14 = *(_OWORD *)&a5->forwardOrders[4];
    *(_OWORD *)v12->_polynomialsBase.inverseOrders = *(_OWORD *)a5->inverseOrders;
    *(_OWORD *)&v12->_polynomialsBase.inverseOrders[4] = v13;
    *(_OWORD *)v12->_polynomialsBase.forwardOrders = v15;
    *(_OWORD *)&v12->_polynomialsBase.forwardOrders[4] = v14;
    long long v16 = *(_OWORD *)&a6->inverseOrders[4];
    long long v18 = *(_OWORD *)a6->forwardOrders;
    long long v17 = *(_OWORD *)&a6->forwardOrders[4];
    *(_OWORD *)v12->_polynomialsDynamic.inverseOrders = *(_OWORD *)a6->inverseOrders;
    *(_OWORD *)&v12->_polynomialsDynamic.inverseOrders[4] = v16;
    *(_OWORD *)v12->_polynomialsDynamic.forwardOrders = v18;
    *(_OWORD *)&v12->_polynomialsDynamic.forwardOrders[4] = v17;
    v12->_dynamicFactor = a4;
    [(ADDynamicPolynomialsLensDistortionModel *)v12 updatePolynomials];
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ADDynamicPolynomialsLensDistortionModel alloc];
  [(ADPolynomialsLensDistortionModel *)self distortionCenter];

  return -[ADDynamicPolynomialsLensDistortionModel initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:](v4, "initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:", &self->_polynomialsBase, &self->_polynomialsDynamic);
}

- (void)setDynamicFactor:(float)a3
{
  self->_dynamicFactor = a3;
  [(ADDynamicPolynomialsLensDistortionModel *)self updatePolynomials];
}

- (void)setDistortionPolynomials:(const ADDistortionPolynomials *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ADDynamicPolynomialsLensDistortionModel;
  [(ADPolynomialsLensDistortionModel *)&v8 setDistortionPolynomials:a3];
  uint64_t v4 = 0;
  inverseOrders = self->super._polynomials.inverseOrders;
  do
  {
    v6 = &self->_polynomialsDynamic.inverseOrders[v4];
    *(v6 - 8) = 0.0;
    float *v6 = 0.0;
    v7 = (_DWORD *)&self->_polynomialsBase.forwardOrders[v4];
    _DWORD *v7 = LODWORD(inverseOrders[v4 - 8]);
    v7[8] = LODWORD(inverseOrders[v4++]);
  }
  while (v4 != 8);
}

- (void)setDistortionPolynomialsDynamic:(const ADDistortionPolynomials *)a3
{
  if (!a3)
  {
    id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"distortionPolynomials cannot be nil" userInfo:0];
    objc_exception_throw(v6);
  }
  long long v3 = *(_OWORD *)&a3->inverseOrders[4];
  long long v5 = *(_OWORD *)a3->forwardOrders;
  long long v4 = *(_OWORD *)&a3->forwardOrders[4];
  *(_OWORD *)self->_polynomialsDynamic.inverseOrders = *(_OWORD *)a3->inverseOrders;
  *(_OWORD *)&self->_polynomialsDynamic.inverseOrders[4] = v3;
  *(_OWORD *)self->_polynomialsDynamic.forwardOrders = v5;
  *(_OWORD *)&self->_polynomialsDynamic.forwardOrders[4] = v4;

  [(ADDynamicPolynomialsLensDistortionModel *)self updatePolynomials];
}

- (void)setDistortionPolynomialsBase:(const ADDistortionPolynomials *)a3
{
  if (!a3)
  {
    id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"distortionPolynomials cannot be nil" userInfo:0];
    objc_exception_throw(v6);
  }
  long long v3 = *(_OWORD *)&a3->inverseOrders[4];
  long long v5 = *(_OWORD *)a3->forwardOrders;
  long long v4 = *(_OWORD *)&a3->forwardOrders[4];
  *(_OWORD *)self->_polynomialsBase.inverseOrders = *(_OWORD *)a3->inverseOrders;
  *(_OWORD *)&self->_polynomialsBase.inverseOrders[4] = v3;
  *(_OWORD *)self->_polynomialsBase.forwardOrders = v5;
  *(_OWORD *)&self->_polynomialsBase.forwardOrders[4] = v4;

  [(ADDynamicPolynomialsLensDistortionModel *)self updatePolynomials];
}

- (const)distortionPolynomialsDynamic
{
  return &self->_polynomialsDynamic;
}

- (const)distortionPolynomialsBase
{
  return &self->_polynomialsBase;
}

- (void)updatePolynomials
{
  uint64_t v2 = 0;
  p_polynomialsBase = &self->_polynomialsBase;
  p_polynomialsDynamic = &self->_polynomialsDynamic;
  do
  {
    long long v5 = &self->super._polynomials.inverseOrders[v2];
    *long long v5 = p_polynomialsBase->inverseOrders[v2] + (float)(self->_dynamicFactor * p_polynomialsDynamic->inverseOrders[v2]);
    *(v5 - 8) = p_polynomialsBase->forwardOrders[v2]
              + (float)(self->_dynamicFactor * p_polynomialsDynamic->forwardOrders[v2]);
    ++v2;
  }
  while (v2 != 8);
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)ADDynamicPolynomialsLensDistortionModel;
  unint64_t v3 = [(ADPolynomialsLensDistortionModel *)&v9 hash];
  *(float *)&double v4 = self->_dynamicFactor;
  long long v5 = [NSNumber numberWithFloat:v4];
  uint64_t v6 = v3 ^ (2 * [v5 hash]);

  unint64_t v7 = v6 ^ (3
           * +[ADPolynomialsLensDistortionModel hashPolynomials:&self->_polynomialsBase]);
  return v7 ^ (4
             * +[ADPolynomialsLensDistortionModel hashPolynomials:&self->_polynomialsDynamic]);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ADDynamicPolynomialsLensDistortionModel *)a3;
  long long v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (self == v4)
  {
    BOOL v12 = 1;
    goto LABEL_14;
  }
  if ([(ADDynamicPolynomialsLensDistortionModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    [(ADPolynomialsLensDistortionModel *)self distortionCenter];
    double v8 = v7;
    double v10 = v9;
    [(ADPolynomialsLensDistortionModel *)v6 distortionCenter];
    BOOL v12 = 0;
    if (v8 == v13 && v10 == v11) {
      BOOL v12 = +[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", &self->super._polynomials, [(ADPolynomialsLensDistortionModel *)v6 distortionPolynomials])&& (dynamicFactor = self->_dynamicFactor, [(ADDynamicPolynomialsLensDistortionModel *)v6 dynamicFactor], dynamicFactor == v15)&& +[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", &self->_polynomialsBase, [(ADDynamicPolynomialsLensDistortionModel *)v6 distortionPolynomialsBase])&& +[ADPolynomialsLensDistortionModel isEqualPolynomials:&self->_polynomialsDynamic otherPolynomials:[(ADDynamicPolynomialsLensDistortionModel *)v6 distortionPolynomialsDynamic]];
    }
  }
  else
  {
LABEL_10:
    BOOL v12 = 0;
  }
LABEL_14:

  return v12;
}

@end