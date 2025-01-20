@interface CBDigitizerHotspotTTF
- (CBDigitizerHotspotTTF)init;
- (float)computeBackoff:(float)a3;
- (id)description;
- (unint64_t)touchBufferWindowS;
- (void)dealloc;
- (void)setTouchBufferWindowS:(unint64_t)a3;
- (void)setTouchReleaseTime:(float)a3;
@end

@implementation CBDigitizerHotspotTTF

- (CBDigitizerHotspotTTF)init
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBDigitizerHotspotTTF;
  v6 = [(CBDigitizerHotspot *)&v4 init];
  if (v6)
  {
    v2 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6->_buffer = v2;
    v6->_touchBufferWindowS = 10;
  }
  return v6;
}

- (id)description
{
  v10 = self;
  SEL v9 = a2;
  id v7 = (id)NSString;
  v8.receiver = self;
  v8.super_class = (Class)CBDigitizerHotspotTTF;
  id v4 = [(CBDigitizerHotspot *)&v8 description];
  unint64_t touchBufferWindowS = v10->_touchBufferWindowS;
  uint64_t v6 = [(NSMutableArray *)v10->_buffer count];
  [(CBDigitizerHotspot *)v10 touchTriggerDelay];
  return (id)[v7 stringWithFormat:@"%@ window=%lu count=%lu backoff=%.1f", v4, touchBufferWindowS, v6, v2];
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBDigitizerHotspotTTF;
  [(CBDigitizerHotspotTTF *)&v2 dealloc];
}

- (float)computeBackoff:(float)a3
{
  -[NSMutableArray removeObjectsAtIndexes:](self->_buffer, "removeObjectsAtIndexes:", -[NSMutableArray indexesOfObjectsWithOptions:passingTest:](self->_buffer, "indexesOfObjectsWithOptions:passingTest:", 2));
  unint64_t v4 = [(NSMutableArray *)self->_buffer count];
  if (!v4) {
    return 0.0;
  }
  if ((float)v4 >= 3.0) {
    return (float)((float)((float)v4 - 3.0) + 1.0) + 5.0;
  }
  return 5.0;
}

BOOL __40__CBDigitizerHotspotTTF_computeBackoff___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  float v6 = *(float *)(a1 + 40);
  [a2 floatValue];
  BOOL v7 = 1;
  if (fabs((float)(v6 - v3)) <= 10.0) {
    return (unint64_t)([*(id *)(*(void *)(a1 + 32) + 40) count] - 1 - a3) > 6;
  }
  return v7;
}

- (void)setTouchReleaseTime:(float)a3
{
  objc_super v8 = self;
  SEL v7 = a2;
  float v6 = a3;
  -[NSMutableArray addObject:](self->_buffer, "addObject:", [NSNumber numberWithFloat:*(double *)&a3]);
  *(float *)&double v3 = v6;
  v5.receiver = v8;
  v5.super_class = (Class)CBDigitizerHotspotTTF;
  [(CBDigitizerHotspot *)&v5 setTouchReleaseTime:v3];
  *(float *)&double v4 = v6;
  [(CBDigitizerHotspotTTF *)v8 computeBackoff:v4];
  -[CBDigitizerHotspot setTouchTriggerDelay:](v8, "setTouchTriggerDelay:");
}

- (unint64_t)touchBufferWindowS
{
  return self->_touchBufferWindowS;
}

- (void)setTouchBufferWindowS:(unint64_t)a3
{
  self->_unint64_t touchBufferWindowS = a3;
}

@end