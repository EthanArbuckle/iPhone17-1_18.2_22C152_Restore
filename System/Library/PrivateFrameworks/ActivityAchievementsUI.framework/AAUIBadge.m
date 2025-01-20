@interface AAUIBadge
- (AAUIBadge)init;
- (BOOL)locksRotationY;
- (CGPoint)position;
- (double)maxRotationY;
- (double)rotationX;
- (double)rotationY;
- (id)_newAnimatablePropertyForType:(unint64_t)a3;
- (void)setMaxRotationY:(double)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRotationX:(double)a3;
- (void)setRotationY:(double)a3;
@end

@implementation AAUIBadge

- (AAUIBadge)init
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIBadge;
  result = [(AAUIBadge *)&v3 init];
  if (result) {
    result->_position = (CGPoint)*MEMORY[0x263F00148];
  }
  return result;
}

- (double)rotationY
{
  return self->_rotationY;
}

- (void)setRotationY:(double)a3
{
  if (self->_locksRotationY)
  {
    double maxRotationY = self->_maxRotationY;
    if (-maxRotationY >= a3) {
      a3 = -maxRotationY;
    }
    if (a3 >= maxRotationY) {
      a3 = self->_maxRotationY;
    }
  }
  self->_rotationY = a3;
}

- (void)setMaxRotationY:(double)a3
{
  self->_double maxRotationY = a3;
  self->_locksRotationY = 1;
}

- (double)rotationX
{
  return self->_rotationX;
}

- (id)_newAnimatablePropertyForType:(unint64_t)a3
{
  objc_initWeak(&location, self);
  if (a3 == 2)
  {
    id v8 = objc_alloc(MEMORY[0x263F23920]);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_5;
    v14[3] = &unk_264860B90;
    v5 = &v15;
    objc_copyWeak(&v15, &location);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_6;
    v12[3] = &unk_264860BB8;
    v6 = &v13;
    objc_copyWeak(&v13, &location);
    uint64_t v7 = [v8 initWithGetter:v14 setter:v12];
  }
  else if (a3 == 1)
  {
    id v9 = objc_alloc(MEMORY[0x263F23920]);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_3;
    v18[3] = &unk_264860B90;
    v5 = &v19;
    objc_copyWeak(&v19, &location);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_4;
    v16[3] = &unk_264860BB8;
    v6 = &v17;
    objc_copyWeak(&v17, &location);
    uint64_t v7 = [v9 initWithGetter:v18 setter:v16];
  }
  else
  {
    if (a3)
    {
      v10 = 0;
      goto LABEL_9;
    }
    id v4 = objc_alloc(MEMORY[0x263F23920]);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke;
    v22[3] = &unk_264860B90;
    v5 = &v23;
    objc_copyWeak(&v23, &location);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_2;
    v20[3] = &unk_264860BB8;
    v6 = &v21;
    objc_copyWeak(&v21, &location);
    uint64_t v7 = [v4 initWithGetter:v22 setter:v20];
  }
  v10 = (void *)v7;
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
LABEL_9:
  objc_destroyWeak(&location);
  return v10;
}

id __43__AAUIBadge__newAnimatablePropertyForType___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F08D40];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained position];
  objc_super v3 = objc_msgSend(v1, "valueWithCGPoint:");

  return v3;
}

void __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 CGPointValue];
  double v4 = v3;
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPosition:", v4, v6);
}

id __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_3(uint64_t a1)
{
  v1 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rotationX];
  double v3 = objc_msgSend(v1, "numberWithDouble:");

  return v3;
}

void __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 floatValue];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRotationX:v4];
}

id __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_5(uint64_t a1)
{
  v1 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rotationY];
  float v3 = objc_msgSend(v1, "numberWithDouble:");

  return v3;
}

void __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_6(uint64_t a1, void *a2)
{
  [a2 floatValue];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRotationY:v4];
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (void)setRotationX:(double)a3
{
  self->_rotationX = a3;
}

- (BOOL)locksRotationY
{
  return self->_locksRotationY;
}

- (double)maxRotationY
{
  return self->_maxRotationY;
}

@end